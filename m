Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF36C5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 09:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2It6U56Lmnpsc1xOMNydCeHjoSbvg7UZXwXpODNC5o=; b=LMGQYSnpknlr9N
	RccjNPPiZO4xMiogmTApglSDUTRm3V/pvYA7U5aofNcsD8VN1BQjt7RQuDQc20RVPOufqOKPxCApj
	0YTg54Bbpa7MOFJKaVda+In8mmJt0spSQYc1ezDi0+u4bKk4xj8dGwS0DPNZfPmm5LenzkazmZpMa
	9+YJzR9kjbFDxMP8UNt5b2BFoS8K2YCkn9gbIsEjGc8H5NJKqF6cPUYahiferjALQNXEbR/ce9kVW
	xCpqcFnhX2L5oRiF9AmA+gGOF6XuXHNHUsfpyoBCQINjsj4OZyP/DxCK66FOdqMZwp5YLZ7+9+7Tw
	oN9sIE8/XY0rcH4WUWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NIa-00GASO-1c;
	Tue, 21 Nov 2023 09:44:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NIU-00GAPN-2N
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 09:44:01 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c1acc1fa98so4699133a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 01:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1700559837; x=1701164637; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=TfMfB8yjY7apsi7w5Gjj0lxGFIkWrJ4QrBGdA+sJmnvhqnrhd019MVoOdSm3WEr0CV
         9QW3tAueqZ6pMQL7yX5cI4hvxri35r+aAcrTlsNQ6LVo5hfHvsCp3bcpZgAsbxwyLuSw
         TVSaK/Kz4yzm1JdautsAIf3+JySmiwwCxj6Xr+KMbanZJOdAWMapQdzx4g3ugFFtVevs
         Hivh93IrV/nGi0NjfEHW6JQYXptxmLg4CfiKICxCY46i9Aak6Ymia7SEqZzeHc71gHwP
         xgjtn91HuWRZII3DjCbPntwfn8pxCzR8NCG1v8cAO+JhjlFPWB1r+2NaGYuUY4o1yaYk
         VHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700559837; x=1701164637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zeX6LBtHobyx/lTsQiwAAEvgonswp+TnKesxqxWL11M=;
        b=BIBSqi13lwNfw2GGtIJTVNsn4rRFEcYlehjSS3lgPAgxLyWydJaf910Sgph1VAipgs
         bLJAPtcp6dpwAOA5z3hjfz2+5mVOTYWXTVj8dueDcV1T7g7uSCJQs/l3De82JNdOtvYN
         W/GuOk2R7mcOTVeUyo4tqdbThyTJ2xWEqGA3l1RFc0kVGxfIaHE0qaLlIAvheGZ6QQE3
         pMd+LoFrsZF42ODttZWpntel1KPxyari+IfTsldKAstWDMn3eHDMvq0tM8DxHRhT/JMu
         CRhl0S6GdoIx9qaKPrbRJK/b75LAivKF0+vjAcWW6RPXe2ZFn0aOOyIVTvpVtN6bn9IG
         OYFQ==
X-Gm-Message-State: AOJu0Ywhs2hooLzlAnIbJNlNtSMFVHio8is/jdIkbQ6GMnUcvJyxj0PP
	eldaP+S+x41rg8gU/Ng0lBvp4LBxbIGXz9rrIzjgrg==
X-Google-Smtp-Source: AGHT+IEcUNpIPdW1r2zWS/VP7g/MssGikpOuJYLZxDVK+bKJDUZATHNuI3hhP6xrYrzf7teMAwRZk2h/7jc/ROLL0jw=
X-Received: by 2002:a17:90b:4d0a:b0:283:2d65:f231 with SMTP id
 mw10-20020a17090b4d0a00b002832d65f231mr3047813pjb.22.1700559836764; Tue, 21
 Nov 2023 01:43:56 -0800 (PST)
MIME-Version: 1.0
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv> <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
In-Reply-To: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 21 Nov 2023 09:43:45 +0000
Message-ID: <CALrw=nH-vcROja2W23rUKEEZMZhxsQiNB4P_ZZQ-XhPHAJGxrg@mail.gmail.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
To: Baoquan He <bhe@redhat.com>, eric_devolder@yahoo.com
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	chenhuacai@kernel.org, geert@linux-m68k.org, tsbogend@alpha.franken.de, 
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
X-CRM114-CacheID: sfid-20231121_014358_783141_9EAF67A4 
X-CRM114-Status: GOOD (  37.90  )
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

T24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgNzo1M+KAr0FNIElnbmF0IEtvcmNoYWdpbiA8aWduYXRA
Y2xvdWRmbGFyZS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMjEsIDIwMjMgYXQgMTo1MOKA
r0FNIEJhb3F1YW4gSGUgPGJoZUByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBFcmljIERlVm9s
ZGVyJ3MgT3JhY2xlIG1haWwgYWRkcmVzcyBpcyBub3QgYXZhaWxhYmxlIGFueW1vcmUsIGFkZCBo
aXMKPiA+IGN1cnJlbnQgbWFpbCBhZGRyZXNzIGhlIHRvbGQgbWUuCj4KPiBUaGFuayB5b3UhCj4K
PiA+IE9uIDExLzIwLzIzIGF0IDEwOjUycG0sIElnbmF0IEtvcmNoYWdpbiB3cm90ZToKPiA+ID4g
R29vZCBkYXkhCj4gPiA+Cj4gPiA+IFdlIGhhdmUgcmVjZW50bHkgc3RhcnRlZCB0byBldmFsdWF0
ZSBMaW51eCA2LjYgYW5kIG5vdGljZWQgdGhhdCB3ZQo+ID4gPiBjYW5ub3QgZGlzYWJsZSBDT05G
SUdfS0VYRUMgYW55bW9yZSwgYnV0IGtlZXAgQ09ORklHX0NSQVNIX0RVTVAKPiA+ID4gZW5hYmxl
ZC4gSXQgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBjb21taXQgODljZGU0NTUgKCJrZXhlYzoKPiA+
ID4gY29uc29saWRhdGUga2V4ZWMgYW5kIGNyYXNoIG9wdGlvbnMgaW50byBrZXJuZWwvS2NvbmZp
Zy5rZXhlYyIpLCB3aGVyZQo+ID4gPiBhIENPTkZJR19LRVhFQyBkZXBlbmRlbmN5IHdhcyBhZGRl
ZCB0byBDT05GSUdfQ1JBU0hfRFVNUC4KPiA+ID4KPiA+ID4gSW4gb3VyIGN1cnJlbnQga2VybmVs
IChMaW51eCA2LjEpIHdlIG9ubHkgZW5hYmxlIENPTkZJR19LRVhFQ19GSUxFCj4gPiA+IHdpdGgg
ZW5mb3JjZWQgc2lnbmF0dXJlIGNoZWNrIHRvIHN1cHBvcnQgdGhlIGtlcm5lbCBjcmFzaCBkdW1w
aW5nCj4gPiA+IGZ1bmN0aW9uYWxpdHkgYW5kIHdvdWxkIGxpa2UgdG8ga2VlcCBDT05GSUdfS0VY
RUMgZGlzYWJsZWQgZm9yCj4gPiA+IHNlY3VyaXR5IHJlYXNvbnMgWzFdLgo+ID4gPgo+ID4gPiBJ
IHdhcyByZWFkaW5nIHRoZSBsb25nIGNvbW1pdCBtZXNzYWdlLCBidXQgdGhlIHJlYXNvbiBmb3Ig
YWRkaW5nCj4gPiA+IENPTkZJR19LRVhFQyBhcyBhIGRlcGVuZGVuY3kgZm9yIENPTkZJR19DUkFT
SF9EVU1QIGV2YWRlZCBtZS4gQW5kIEkKPiA+ID4gYmVsaWV2ZSBmcm9tIHRoZSBpbXBsZW1lbnRh
dGlvbiBwZXJzcGVjdGl2ZSBDT05GSUdfS0VYRUNfRklMRSBzaG91bGQKPiA+ID4gc3VmZmljZSBo
ZXJlIChhcyB3ZSBzdWNjZXNzZnVsbHkgdXNlZCBpdCBmb3IgY3Jhc2hkdW1wcyBvbiBMaW51eCA2
LjEpLgo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhIHJlYXNvbiBmb3IgYWRkaW5nIHRoaXMgZGVwZW5k
ZW5jeSBvciBpcyBpdCBqdXN0IGFuCj4gPiA+IG92ZXJzaWdodD8gV291bGQgc29tZSBzb2x1dGlv
biBvZiByZXF1aXJpbmcgZWl0aGVyIENPTkZJR19LRVhFQyBvcgo+ID4gPiBDT05GSUdfS0VYRUNf
RklMRSB3b3JrIGhlcmU/Cj4gPgo+ID4gSSBzZWFyY2hlZCB0aGUgcGF0Y2ggaGlzdG9yeSwgZm91
bmQgRXJpYyBkaWRuJ3QgYWRkIHRoZSBkZXBlbmRlbmN5IG9uCj4gPiBDT05GSUdfS0VYRUMgYXQg
dGhlIGJlZ2lubmluZy4gTGF0ZXIgYSBsaW51eC1uZXh0IGJ1aWxkaW5nIGZhaWx1cmUgd2l0aAo+
ID4gcmFuZGNvbmZpZyB3YXMgcmVwb3J0ZWQsIGluIHRoZXJlIENPTkZJR19DUkFTSF9EVU1QIGVu
YWJsZWQsIHdoaWxlCj4gPiBDT05GSUdfS0VYRUMgaXMgZGlzYWJsZWQuIEZpbmFsbHkgRXJpYyBh
ZGRlZCB0aGUgS0VYRUMgZGVwZW5kZW5jeSBmb3IKPiA+IENSQVNIX0RVTVAuIFBsZWFzZSBzZWUg
YmVsb3cgbGluayBmb3IgbW9yZSBkZXRhaWxzOgo+ID4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8zZThlZWNkMS1hMjc3LTJjZmItNjkwZS01ZGUyZWI3Yjk4OGVAb3JhY2xlLmNvbS9U
LyN1Cj4KPiBUaGFuayB5b3UgZm9yIGRpZ2dpbmcgdGhpcyB1cC4gSG93ZXZlciBJJ20gc3RpbGwg
Y29uZnVzZWQsIGJlY2F1c2UKPiB0aGlzIGlzIGV4YWN0bHkgaG93IHdlIGNvbmZpZ3VyZSBMaW51
eCA2LjEgKGFsdGhvdWdoIHdlIGRvIGhhdmUKPiBDT05GSUdfS0VYRUNfRklMRSBlbmFibGVkKSBh
bmQgd2UgZG9uJ3QgaGF2ZSBhbnkgcHJvYmxlbXMuIEkgYmVsaWV2ZQo+IHdlIGRpZCBub3QgaW52
ZXN0aWdhdGUgdGhpcyBpc3N1ZSBwcm9wZXJseS4KCkkgZGlkIHNvbWUgcHJlbGltaW5hcnkgaW52
ZXN0aWdhdGlvbiBmb3IgdGhpcy4gSWYgSSBwYXRjaCBvdXQgdGhlCmRlcGVuZGVuY3kgb24gQ09O
RklHX0tFWEVDIHRoZSBrZXJuZWwgYnVpbGRzIGp1c3QgZmluZSBmb3IgeDg2Cih3aXRob3V0IENP
TkZJR19DUkFTSF9IT1RQTFVHIC0gd2hpY2ggaXMgcHJvYmFibHkgYW5vdGhlciBpc3N1ZSkgLSBz
bwp0aGlzIHdhcyB0aGUgcHJldmlvdXMgYmVoYXZpb3VyLiBJIGNhbiBzZWUgdGhhdCB0aGUgcmVw
b3J0ZWQgZXJyb3IgaXMKZm9yIGFybSBhcmNoaXRlY3R1cmUgYW5kIHdhcyBhYmxlIHRvIHJlcHJv
ZHVjZSBpdCB3aXRoIGEgc2ltcGxlIGNyb3NzCmNvbXBpbGVyIGluIERlYmlhbi4gSG93ZXZlciwg
SSB0aGluayBpdCBpcyBzdGlsbCBzb21laG93IHJlbGF0ZWQgdG8KdGhpcyBwYXRjaHNldCBhcyB0
aGUgcHJldmlvdXMga2VybmVscyAodXAgdG8gNi41KSBidWlsZCBmaW5lIHdpdGgganVzdApDT05G
SUdfQ1JBU0hfRFVNUCBhbmQgd2l0aG91dCBDT05GSUdfS0VYRUMgZm9yIGFybSBhcyB3ZWxsLiBT
byBldmVuCmZvciBhcm0gaXQgd2FzIGludHJvZHVjZWQgaW4gNi42LgoKPiA+IEFuZCBiZXNpZGVz
LCB0aGUgbmV3bHkgYWRkZWQgQ09ORklHX0NSQVNIX0hPVFBMVUcgYWxzbyBuZWVkcwo+ID4gQ09O
RklHX0tFWEVDIGlmIHRoZSBlbGZjb3JlaGRyIGlzIGFsbG93ZWQgdG8gYmUgbWFuaXB1bGF0ZWQg
d2hlbgo+ID4gY3B1L21lbW9yeSBob3RwbHVnIGhhcGVuZWQuCj4KPiBUaGlzIHN0aWxsIGZlZWxz
IGxpa2UgYSByZWdyZXNzaW9uIHRvIG1lOiBhbnkgY3Jhc2ggZHVtcCBzdXBwb3J0Cj4gc2hvdWxk
IGJlIGluZGVwZW5kZW50IG9mIEtFWEVDIHN5c2NhbGxzIGJlaW5nIHByZXNlbnQuIFdoaWxlIHBy
b2JhYmx5Cj4gdGhlIGNvbW1vbiBjYXNlIChpbmNsdWRpbmcgdXMpIHRoYXQgdGhlIGNyYXNoaW5n
IGtlcm5lbCBhbmQgcmVjb3ZlcnkKPiBrZXJuZWwgYXJlIHRoZSBzYW1lLCB0aGV5IGRvbid0IGhh
dmUgdG8gYmUuIFdlIG5lZWQga2V4ZWMgc3lzY2FsbCBpbgo+IHRoZSBjcmFzaGluZyBrZXJuZWws
IGJ1dCBjcmFzaGR1bXAgc3VwcG9ydCBpbiB0aGUgcmVjb3Zlcnkga2VybmVsIChidXQKPiB0aGUg
cmVjb3Zlcnkga2VybmVsIG5vdCBoYXZpbmcgdGhlIGtleGVjIHN5c2NhbGxzIHNob3VsZCBiZSB0
b3RhbGx5Cj4gZmluZSkuIElmIHdlIGRvIHJlcXVpcmUgc29tZSBjb2RlIGRlZmluaXRpb25zIGZy
b20ga2V4ZWMgLSBhdCBtb3N0IHdlCj4gc2hvdWxkIHB1dCB0aGVtIHVuZGVyIENPTkZJR19LRVhF
Q19DT1JFLgo+Cj4gPiBUaGFua3MKPiA+IEJhb3F1YW4KPiA+CgpJZ25hdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
