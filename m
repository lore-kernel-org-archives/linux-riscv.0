Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBBFC61D9D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wushWj9gjYk/oxDXkxXSgslk0piZW7rehrfZiCx5mc=; b=sRWECsZu1VyS9M
	tLV4GmpzE7br22rlTF3IrMJOQ6XW0bs31ypNfNQLQQlFtxhrrNSsByZNjCPW2TJvxRro8haJF2Q23
	duEdniSkyM5/0OTMK2y1gkj2ohfYN6Mwbw5/ow9p3dOIctNV4XSxcBr/B4tX+TaJw+q4Ox+HAiD3Q
	wd1jDyOuBJAboXpcMnqvxweOc8kdPCeMw9eTy1NekeFd0eQqe88c0/OebFnskJukfb2rWD9oZbv0/
	gonos36qdRVLdUsHmvHyoWKSY0WGv2oDxkL/nlMfZUO7lpVAEm/lMLDkdGVMeoLQt/TkgE6V+StXw
	To1yABPDTnTh8cBaOLrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jqS-001Kji-2H;
	Wed, 22 Nov 2023 09:48:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpt-001K98-0z
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 Nov 2023 09:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=; b=lh4VQBHomebFsakjTlNeG+F31A
	BpeKk+UKfLkwbiqyVy+LHlUoLf8vsEF79jGxmHKLix7mBcr9cA+LX3UnrxUedAwbEJdSRyY0tm7zv
	G1JRGzZg0ppppvWzWkGFS0wWpcV5MRlOfTwTmtGoMJhqwu49CC66qTM6bx5M9rdkKDflm1ZzLz9z4
	oVgGRtx9Vi3fn6TD6UanMTiJ4Ab5S1lsjw0uUDPF91kb9SFqvKwHGUWluVPS0t4MnfiYTCHGluAd9
	k9cT/QVWgynj8Apwc6TxRfR6XwOHBijPzSFSbgt5pgs/mhDuZPoaoVqtcmPhM2MZms2PhgWGbFzHS
	CWuc7GPw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jpn-00CGYP-1W
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 09:47:55 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1ce95f96edcso31466325ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 01:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700646466; x=1701251266; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=A/PjS3WFiRildghE0pTHm+e3pWcxawCyDcLyzEzWr5ABQSIO3qQIlJuA8Ey1dbNOYe
         0mwFCemjiAdO6cgXFvQzWrtOKK4JUbH2oEi89rNDWqtybHi1DKGJ3ARRfk3v4/DTrEok
         MWKn1iizYGaqdj3lzm07pSo9uH51HYIZuNARr/uAjsZcs5FWIbp4TXsATLD/aGDgTtGo
         I+rS3bos+eb8zuIoP3VxU3ZIsBL83IZuAhd6lB21tlHkG9eqBb0JwlyanBny9kY3D5wZ
         q4kR2cOn0X7AvwQlhh2B7D16SFwG+MQa74OLHmmCJtIWqrzoGF33W77Q1SzEQ2tQY4D1
         h2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646466; x=1701251266;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnfP4RJbON+lj35IXs9J/yXXOpNJWed6Pm5g2c+cjNg=;
        b=dWyr4wiFZS5OGAeIfbB74tFQIcUSTkKMuAPoooHzMZmokjK6ygTzcJoq3yBHlaPMHU
         Bq4u+ITnD+m9BtWcRzv4Hw+bJ2hfA9baJPLJdKVTcPiYZJ/M+s32TZAYjTI0IvyUFo6q
         6yk7HXlGKDewHQgJrsOCGajxJwaKjwLr0MeBOV+dl0DKMFLfqisNyvGd8MO82f+cS2OD
         GTc4G3YfDJ4yXqnzD1FaLAF/zlTYFaqhUw5d1YwctmqmCaRlPpJWbmEo0g6iWeg/c74m
         TMVwVr02G6jpmoMJpk+mNtDeACHD7Nbcovb1KU8qNZyz6p7/WQLAPzEztPDP5sGxCakD
         5E6g==
X-Gm-Message-State: AOJu0YxmG6yTJ3xXfzkrdSd1DHI/UQn4YyMIB+O9djoXhzBFKupOC2E/
	mB1sp1oHD3/LscuA7eXkq5OyDJLO4iIRjFYaTn97uA==
X-Google-Smtp-Source: AGHT+IEoe5dhUWpYOgp49hInJ/tXkDzht17Dpr4KVAZ7DyJBSpmejqoRh7l88C3hHutZlPs8wlq5Gnw1rhenR1f8+40=
X-Received: by 2002:a17:90b:1d04:b0:27d:5946:5e2c with SMTP id
 on4-20020a17090b1d0400b0027d59465e2cmr1934810pjb.12.1700646466036; Wed, 22
 Nov 2023 01:47:46 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
 <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com> <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
In-Reply-To: <ZV3LKVOokpx2WvKp@MiWiFi-R3L-srv>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 22 Nov 2023 09:47:34 +0000
Message-ID: <CALrw=nGadgbwuNAFacatz-agpGn9NvtgaCUXu73MzAzZq07k-g@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>
Cc: eric_devolder@yahoo.com, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, geert@linux-m68k.org, 
	tsbogend@alpha.franken.de, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, deller@gmx.de, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	dave.hansen@linux.intel.com, x86@kernel.org, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, kernel@xen0n.name, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, 
	svens@linux.ibm.com, hpa@zytor.com, keescook@chromium.org, paulmck@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com, 
	juerg.haefliger@canonical.com, arnd@arndb.de, rmk+kernel@armlinux.org.uk, 
	linus.walleij@linaro.org, sebastian.reichel@collabora.com, rppt@kernel.org, 
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com, ziy@nvidia.com, 
	masahiroy@kernel.org, ndesaulniers@google.com, mhiramat@kernel.org, 
	ojeda@kernel.org, thunder.leizhen@huawei.com, xin3.li@intel.com, 
	tj@kernel.org, Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net, 
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com, boris.ostrovsky@oracle.com, 
	konrad.wilk@oracle.com, kernel-team <kernel-team@cloudflare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_094751_738483_4C2E1811 
X-CRM114-Status: GOOD (  53.25  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgOTozNOKAr0FNIEJhb3F1YW4gSGUgPGJoZUByZWRoYXQu
Y29tPiB3cm90ZToKPgo+IE9uIDExLzIxLzIzIGF0IDA5OjQzYW0sIElnbmF0IEtvcmNoYWdpbiB3
cm90ZToKPiA+IE9uIFR1ZSwgTm92IDIxLCAyMDIzIGF0IDc6NTPigK9BTSBJZ25hdCBLb3JjaGFn
aW4gPGlnbmF0QGNsb3VkZmxhcmUuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVHVlLCBOb3Yg
MjEsIDIwMjMgYXQgMTo1MOKAr0FNIEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gPgo+ID4gPiA+IEVyaWMgRGVWb2xkZXIncyBPcmFjbGUgbWFpbCBhZGRyZXNzIGlzIG5v
dCBhdmFpbGFibGUgYW55bW9yZSwgYWRkIGhpcwo+ID4gPiA+IGN1cnJlbnQgbWFpbCBhZGRyZXNz
IGhlIHRvbGQgbWUuCj4gPiA+Cj4gPiA+IFRoYW5rIHlvdSEKPiA+ID4KPiA+ID4gPiBPbiAxMS8y
MC8yMyBhdCAxMDo1MnBtLCBJZ25hdCBLb3JjaGFnaW4gd3JvdGU6Cj4gPiA+ID4gPiBHb29kIGRh
eSEKPiA+ID4gPiA+Cj4gPiA+ID4gPiBXZSBoYXZlIHJlY2VudGx5IHN0YXJ0ZWQgdG8gZXZhbHVh
dGUgTGludXggNi42IGFuZCBub3RpY2VkIHRoYXQgd2UKPiA+ID4gPiA+IGNhbm5vdCBkaXNhYmxl
IENPTkZJR19LRVhFQyBhbnltb3JlLCBidXQga2VlcCBDT05GSUdfQ1JBU0hfRFVNUAo+ID4gPiA+
ID4gZW5hYmxlZC4gSXQgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBjb21taXQgODljZGU0NTUgKCJr
ZXhlYzoKPiA+ID4gPiA+IGNvbnNvbGlkYXRlIGtleGVjIGFuZCBjcmFzaCBvcHRpb25zIGludG8g
a2VybmVsL0tjb25maWcua2V4ZWMiKSwgd2hlcmUKPiA+ID4gPiA+IGEgQ09ORklHX0tFWEVDIGRl
cGVuZGVuY3kgd2FzIGFkZGVkIHRvIENPTkZJR19DUkFTSF9EVU1QLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEluIG91ciBjdXJyZW50IGtlcm5lbCAoTGludXggNi4xKSB3ZSBvbmx5IGVuYWJsZSBDT05G
SUdfS0VYRUNfRklMRQo+ID4gPiA+ID4gd2l0aCBlbmZvcmNlZCBzaWduYXR1cmUgY2hlY2sgdG8g
c3VwcG9ydCB0aGUga2VybmVsIGNyYXNoIGR1bXBpbmcKPiA+ID4gPiA+IGZ1bmN0aW9uYWxpdHkg
YW5kIHdvdWxkIGxpa2UgdG8ga2VlcCBDT05GSUdfS0VYRUMgZGlzYWJsZWQgZm9yCj4gPiA+ID4g
PiBzZWN1cml0eSByZWFzb25zIFsxXS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIHdhcyByZWFkaW5n
IHRoZSBsb25nIGNvbW1pdCBtZXNzYWdlLCBidXQgdGhlIHJlYXNvbiBmb3IgYWRkaW5nCj4gPiA+
ID4gPiBDT05GSUdfS0VYRUMgYXMgYSBkZXBlbmRlbmN5IGZvciBDT05GSUdfQ1JBU0hfRFVNUCBl
dmFkZWQgbWUuIEFuZCBJCj4gPiA+ID4gPiBiZWxpZXZlIGZyb20gdGhlIGltcGxlbWVudGF0aW9u
IHBlcnNwZWN0aXZlIENPTkZJR19LRVhFQ19GSUxFIHNob3VsZAo+ID4gPiA+ID4gc3VmZmljZSBo
ZXJlIChhcyB3ZSBzdWNjZXNzZnVsbHkgdXNlZCBpdCBmb3IgY3Jhc2hkdW1wcyBvbiBMaW51eCA2
LjEpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IElzIHRoZXJlIGEgcmVhc29uIGZvciBhZGRpbmcgdGhp
cyBkZXBlbmRlbmN5IG9yIGlzIGl0IGp1c3QgYW4KPiA+ID4gPiA+IG92ZXJzaWdodD8gV291bGQg
c29tZSBzb2x1dGlvbiBvZiByZXF1aXJpbmcgZWl0aGVyIENPTkZJR19LRVhFQyBvcgo+ID4gPiA+
ID4gQ09ORklHX0tFWEVDX0ZJTEUgd29yayBoZXJlPwo+ID4gPiA+Cj4gPiA+ID4gSSBzZWFyY2hl
ZCB0aGUgcGF0Y2ggaGlzdG9yeSwgZm91bmQgRXJpYyBkaWRuJ3QgYWRkIHRoZSBkZXBlbmRlbmN5
IG9uCj4gPiA+ID4gQ09ORklHX0tFWEVDIGF0IHRoZSBiZWdpbm5pbmcuIExhdGVyIGEgbGludXgt
bmV4dCBidWlsZGluZyBmYWlsdXJlIHdpdGgKPiA+ID4gPiByYW5kY29uZmlnIHdhcyByZXBvcnRl
ZCwgaW4gdGhlcmUgQ09ORklHX0NSQVNIX0RVTVAgZW5hYmxlZCwgd2hpbGUKPiA+ID4gPiBDT05G
SUdfS0VYRUMgaXMgZGlzYWJsZWQuIEZpbmFsbHkgRXJpYyBhZGRlZCB0aGUgS0VYRUMgZGVwZW5k
ZW5jeSBmb3IKPiA+ID4gPiBDUkFTSF9EVU1QLiBQbGVhc2Ugc2VlIGJlbG93IGxpbmsgZm9yIG1v
cmUgZGV0YWlsczoKPiA+ID4gPgo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8z
ZThlZWNkMS1hMjc3LTJjZmItNjkwZS01ZGUyZWI3Yjk4OGVAb3JhY2xlLmNvbS9ULyN1Cj4gPiA+
Cj4gPiA+IFRoYW5rIHlvdSBmb3IgZGlnZ2luZyB0aGlzIHVwLiBIb3dldmVyIEknbSBzdGlsbCBj
b25mdXNlZCwgYmVjYXVzZQo+ID4gPiB0aGlzIGlzIGV4YWN0bHkgaG93IHdlIGNvbmZpZ3VyZSBM
aW51eCA2LjEgKGFsdGhvdWdoIHdlIGRvIGhhdmUKPiA+ID4gQ09ORklHX0tFWEVDX0ZJTEUgZW5h
YmxlZCkgYW5kIHdlIGRvbid0IGhhdmUgYW55IHByb2JsZW1zLiBJIGJlbGlldmUKPiA+ID4gd2Ug
ZGlkIG5vdCBpbnZlc3RpZ2F0ZSB0aGlzIGlzc3VlIHByb3Blcmx5Lgo+ID4KPiA+IEkgZGlkIHNv
bWUgcHJlbGltaW5hcnkgaW52ZXN0aWdhdGlvbiBmb3IgdGhpcy4gSWYgSSBwYXRjaCBvdXQgdGhl
Cj4gPiBkZXBlbmRlbmN5IG9uIENPTkZJR19LRVhFQyB0aGUga2VybmVsIGJ1aWxkcyBqdXN0IGZp
bmUgZm9yIHg4Ngo+ID4gKHdpdGhvdXQgQ09ORklHX0NSQVNIX0hPVFBMVUcgLSB3aGljaCBpcyBw
cm9iYWJseSBhbm90aGVyIGlzc3VlKSAtIHNvCj4gPiB0aGlzIHdhcyB0aGUgcHJldmlvdXMgYmVo
YXZpb3VyLiBJIGNhbiBzZWUgdGhhdCB0aGUgcmVwb3J0ZWQgZXJyb3IgaXMKPiA+IGZvciBhcm0g
YXJjaGl0ZWN0dXJlIGFuZCB3YXMgYWJsZSB0byByZXByb2R1Y2UgaXQgd2l0aCBhIHNpbXBsZSBj
cm9zcwo+ID4gY29tcGlsZXIgaW4gRGViaWFuLiBIb3dldmVyLCBJIHRoaW5rIGl0IGlzIHN0aWxs
IHNvbWVob3cgcmVsYXRlZCB0bwo+ID4gdGhpcyBwYXRjaHNldCBhcyB0aGUgcHJldmlvdXMga2Vy
bmVscyAodXAgdG8gNi41KSBidWlsZCBmaW5lIHdpdGgganVzdAo+ID4gQ09ORklHX0NSQVNIX0RV
TVAgYW5kIHdpdGhvdXQgQ09ORklHX0tFWEVDIGZvciBhcm0gYXMgd2VsbC4gU28gZXZlbgo+ID4g
Zm9yIGFybSBpdCB3YXMgaW50cm9kdWNlZCBpbiA2LjYuCj4KPiBUaGFua3MgZm9yIHRoZSBpbmZv
cm1hdGlvbi4KPgo+IEkgaGF2ZW4ndCBydW4gdGhlIHJlcHJvZHVjZXIgb2YgaXNzdWUgcmVwb3J0
ZWQgb24gRXJpYydzIG9sZCBwYXRjaHNldCwKPiB3aGlsZSBjaGVja291dCB0byBrZXJuZWwgNi4x
LCBvbmx5IHMzOTAgc2VsZWN0ZWQgS0VYRUMgZm9yIENSQVNIX0RVTVAKPiBhbHJlYWR5LiBBbmQg
d2l0aCB0aGUgQVJNIGJ1aWxkaW5nIGJyZWFrYWdlLCB0aGUgc2ltcGxlc3QgaWRlYSBpcwo+IHRv
IHNlbGVjdCBLRVhFQyBvbmx5IGZvciBBUk0gb3IgUzM5MCBDUkFTSF9EVU1QLiBJIHBsYW4gdG8g
dHJ5IHRoZQo+IHJlcHJvZHVjZXIgbGF0ZXIuIElmIHlvdSBoYXZlIGFueSBpZGVhIG9yIGRyYWZ0
IHBhdGNoLCBwbGVhc2UgZmVlbCBmcmVlCj4gdG8gcG9zdC4KClRoZSB0aGluZyBpcyAtIGJlZm9y
ZSA2LjYgZXZlbiBBUk0gZGlkIG5vdCByZXF1aXJlIEtFWEVDIGZvcgpDUkFTSF9EVU1QIChhdCBs
ZWFzdCB0byBzdWNjZXNzZnVsbHkgY29tcGlsZSksIHNvIEkgdGhpbmsgd2Ugc2hvdWxkCnVuZGVy
c3RhbmQgd2hhdCBjaGFuZ2VkIGZpcnN0IGJlZm9yZSBhZGRpbmcgYSBkZXBlbmRlbmN5IGZvciBB
Uk0uIEknbGwKdHJ5IHRvIGludmVzdGlnYXRlIG1vcmUsIGlmIEkgaGF2ZSB0aW1lLgoKPiBkaWZm
IC0tZ2l0IGEva2VybmVsL0tjb25maWcua2V4ZWMgYi9rZXJuZWwvS2NvbmZpZy5rZXhlYwo+IGlu
ZGV4IDdhZmYyOGRlZDJmNC4uMzgyZGNkOGQ3YTlkIDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9LY29u
ZmlnLmtleGVjCj4gKysrIGIva2VybmVsL0tjb25maWcua2V4ZWMKPiBAQCAtOTcsNyArOTcsNyBA
QCBjb25maWcgQ1JBU0hfRFVNUAo+ICAgICAgICAgZGVwZW5kcyBvbiBBUkNIX1NVUFBPUlRTX0tF
WEVDCj4gICAgICAgICBzZWxlY3QgQ1JBU0hfQ09SRQo+ICAgICAgICAgc2VsZWN0IEtFWEVDX0NP
UkUKPiAtICAgICAgIHNlbGVjdCBLRVhFQwo+ICsgICAgICAgc2VsZWN0IEtFWEVDIGlmIChBUk0g
fHwgUzM5MCkKPgo+Cj4gYXJjaC9zMzkwL0tjb25maWcgaW4ga2VybmVsIDYuMToKPiBjb25maWcg
Q1JBU0hfRFVNUAo+ICAgICAgICAgYm9vbCAia2VybmVsIGNyYXNoIGR1bXBzIgo+ICAgICAgICAg
c2VsZWN0IEtFWEVDCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIEdlbmVyYXRlIGNyYXNoIGR1
bXAgYWZ0ZXIgYmVpbmcgc3RhcnRlZCBieSBrZXhlYy4KPiAgICAgICAgICAgQ3Jhc2ggZHVtcCBr
ZXJuZWxzIGFyZSBsb2FkZWQgaW4gdGhlIG1haW4ga2VybmVsIHdpdGgga2V4ZWMtdG9vbHMKPiAg
ICAgICAgICAgaW50byBhIHNwZWNpYWxseSByZXNlcnZlZCByZWdpb24gYW5kIHRoZW4gbGF0ZXIg
ZXhlY3V0ZWQgYWZ0ZXIKPiAgICAgICAgICAgYSBjcmFzaCBieSBrZHVtcC9rZXhlYy4KPiAgICAg
ICAgICAgUmVmZXIgdG8gPGZpbGU6RG9jdW1lbnRhdGlvbi9zMzkwL3pmY3BkdW1wLnJzdD4gZm9y
IG1vcmUgZGV0YWlscyBvbiB0aGlzLgo+ICAgICAgICAgICBUaGlzIG9wdGlvbiBhbHNvIGVuYWJs
ZXMgczM5MCB6ZmNwZHVtcC4KPiAgICAgICAgICAgU2VlIGFsc28gPGZpbGU6RG9jdW1lbnRhdGlv
bi9zMzkwL3pmY3BkdW1wLnJzdD4KPgo+ID4KPiA+ID4gPiBBbmQgYmVzaWRlcywgdGhlIG5ld2x5
IGFkZGVkIENPTkZJR19DUkFTSF9IT1RQTFVHIGFsc28gbmVlZHMKPiA+ID4gPiBDT05GSUdfS0VY
RUMgaWYgdGhlIGVsZmNvcmVoZHIgaXMgYWxsb3dlZCB0byBiZSBtYW5pcHVsYXRlZCB3aGVuCj4g
PiA+ID4gY3B1L21lbW9yeSBob3RwbHVnIGhhcGVuZWQuCj4gPiA+Cj4gPiA+IFRoaXMgc3RpbGwg
ZmVlbHMgbGlrZSBhIHJlZ3Jlc3Npb24gdG8gbWU6IGFueSBjcmFzaCBkdW1wIHN1cHBvcnQKPiA+
ID4gc2hvdWxkIGJlIGluZGVwZW5kZW50IG9mIEtFWEVDIHN5c2NhbGxzIGJlaW5nIHByZXNlbnQu
IFdoaWxlIHByb2JhYmx5Cj4gPiA+IHRoZSBjb21tb24gY2FzZSAoaW5jbHVkaW5nIHVzKSB0aGF0
IHRoZSBjcmFzaGluZyBrZXJuZWwgYW5kIHJlY292ZXJ5Cj4gPiA+IGtlcm5lbCBhcmUgdGhlIHNh
bWUsIHRoZXkgZG9uJ3QgaGF2ZSB0byBiZS4gV2UgbmVlZCBrZXhlYyBzeXNjYWxsIGluCj4gPiA+
IHRoZSBjcmFzaGluZyBrZXJuZWwsIGJ1dCBjcmFzaGR1bXAgc3VwcG9ydCBpbiB0aGUgcmVjb3Zl
cnkga2VybmVsIChidXQKPiA+ID4gdGhlIHJlY292ZXJ5IGtlcm5lbCBub3QgaGF2aW5nIHRoZSBr
ZXhlYyBzeXNjYWxscyBzaG91bGQgYmUgdG90YWxseQo+ID4gPiBmaW5lKS4gSWYgd2UgZG8gcmVx
dWlyZSBzb21lIGNvZGUgZGVmaW5pdGlvbnMgZnJvbSBrZXhlYyAtIGF0IG1vc3Qgd2UKPiA+ID4g
c2hvdWxkIHB1dCB0aGVtIHVuZGVyIENPTkZJR19LRVhFQ19DT1JFLgo+ID4gPgo+ID4gPiA+IFRo
YW5rcwo+ID4gPiA+IEJhb3F1YW4KPiA+ID4gPgo+ID4KPiA+IElnbmF0Cj4gPgo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
