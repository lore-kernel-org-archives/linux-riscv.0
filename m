Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBF6C5ACB3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 09:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cD7gPtoaOYsJiiH6aDmJW4D1k9FUkHQLQ90yGtp+jUY=; b=BN6foFXRCRATaS
	XC6Uo5nLeGy9PNn4iPAOV/tlcDRvAZawIWJpLbW0daCACR2ASONER7H6IAkWb+uYupiFX0pX4aHJG
	VAveecTHfLf4RamE3VaZC3BEjG8l0a1N28ok+YiuThl2uG7i4JE40WsZgRBNF9Srh9mLHrgP2Fo0P
	6wNszuSOvzO2l9tq95+KormOJ8L90yOKVrfUcU4TR9KaSptLD3+T51GAqUXaFkVE58lTZPPZO9z1m
	MPeJXAGDDMxF0VE50G5YEBNNgQ72wcp4UKC2xnLrmPJaWVVpOYkgi/ocEsQ3+u4zjonVetOfCL1My
	7Yehiad0KfE/lD5amtJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NV3-00GC7O-3C;
	Tue, 21 Nov 2023 09:56:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5NUy-00GC5L-2i
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 09:56:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700560611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fPhHnmk39Y9ZPUQmNMZM/ZG0TQ3kydRNczl6JxMjmic=;
	b=BrK97EPTcoWOIsSXhxD+pyl7+HZCnNyf8nTy31PodCOw8TujnJ9JNT/DRqpSgsWTBb0k/Z
	7P5TB7Y7TKV5ORLyEnZA4w261ZgHufN3I/xyJu6eVRrHH6yYeg6sKfn/TV/C8qe55kImwU
	iBhNTZqe7V707c+Lxm2mKS2Gze3F0Pc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-FAApqMXDNLKIjte47nBJcQ-1; Tue,
 21 Nov 2023 04:56:47 -0500
X-MC-Unique: FAApqMXDNLKIjte47nBJcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C91B73813F30;
	Tue, 21 Nov 2023 09:56:46 +0000 (UTC)
Received: from localhost (unknown [10.72.112.97])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61FF502A;
	Tue, 21 Nov 2023 09:56:44 +0000 (UTC)
Date: Tue, 21 Nov 2023 17:56:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: eric_devolder@yahoo.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, geert@linux-m68k.org,
	tsbogend@alpha.franken.de,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	deller@gmx.de, ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	dave.hansen@linux.intel.com, x86@kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	kernel@xen0n.name, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, hpa@zytor.com,
	keescook@chromium.org, paulmck@kernel.org,
	Peter Zijlstra <peterz@infradead.org>, frederic@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Ard Biesheuvel <ardb@kernel.org>, samitolvanen@google.com,
	juerg.haefliger@canonical.com, arnd@arndb.de,
	rmk+kernel@armlinux.org.uk, linus.walleij@linaro.org,
	sebastian.reichel@collabora.com, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, anshuman.khandual@arm.com,
	ziy@nvidia.com, masahiroy@kernel.org, ndesaulniers@google.com,
	mhiramat@kernel.org, ojeda@kernel.org, thunder.leizhen@huawei.com,
	xin3.li@intel.com, tj@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, tsi@tuyoix.net,
	hbathini@linux.ibm.com, sourabhjain@linux.ibm.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	kernel-team <kernel-team@cloudflare.com>
Subject: Re: Potential config regression after 89cde455 ("kexec: consolidate
 kexec and crash options into kernel/Kconfig.kexec")
Message-ID: <ZVx+2lfTckjv/kiq@MiWiFi-R3L-srv>
References: <CALrw=nHpRQQaQTP_jZfREgrQEMpS8jBF8JQCv4ygqXycE-StaA@mail.gmail.com>
 <ZVwMzXxWkgonIAfc@MiWiFi-R3L-srv>
 <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALrw=nG8xsYw7XKyL_VMHtKiaBcQCKvC8UVp-C9-BdeN4A1Daw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_015653_032229_D877C485 
X-CRM114-Status: GOOD (  35.71  )
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

T24gMTEvMjEvMjMgYXQgMDc6NTNhbSwgSWduYXQgS29yY2hhZ2luIHdyb3RlOgo+IE9uIFR1ZSwg
Tm92IDIxLCAyMDIzIGF0IDE6NTDigK9BTSBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gRXJpYyBEZVZvbGRlcidzIE9yYWNsZSBtYWlsIGFkZHJlc3MgaXMgbm90IGF2
YWlsYWJsZSBhbnltb3JlLCBhZGQgaGlzCj4gPiBjdXJyZW50IG1haWwgYWRkcmVzcyBoZSB0b2xk
IG1lLgo+IAo+IFRoYW5rIHlvdSEKPiAKPiA+IE9uIDExLzIwLzIzIGF0IDEwOjUycG0sIElnbmF0
IEtvcmNoYWdpbiB3cm90ZToKPiA+ID4gR29vZCBkYXkhCj4gPiA+Cj4gPiA+IFdlIGhhdmUgcmVj
ZW50bHkgc3RhcnRlZCB0byBldmFsdWF0ZSBMaW51eCA2LjYgYW5kIG5vdGljZWQgdGhhdCB3ZQo+
ID4gPiBjYW5ub3QgZGlzYWJsZSBDT05GSUdfS0VYRUMgYW55bW9yZSwgYnV0IGtlZXAgQ09ORklH
X0NSQVNIX0RVTVAKPiA+ID4gZW5hYmxlZC4gSXQgc2VlbXMgdG8gYmUgcmVsYXRlZCB0byBjb21t
aXQgODljZGU0NTUgKCJrZXhlYzoKPiA+ID4gY29uc29saWRhdGUga2V4ZWMgYW5kIGNyYXNoIG9w
dGlvbnMgaW50byBrZXJuZWwvS2NvbmZpZy5rZXhlYyIpLCB3aGVyZQo+ID4gPiBhIENPTkZJR19L
RVhFQyBkZXBlbmRlbmN5IHdhcyBhZGRlZCB0byBDT05GSUdfQ1JBU0hfRFVNUC4KPiA+ID4KPiA+
ID4gSW4gb3VyIGN1cnJlbnQga2VybmVsIChMaW51eCA2LjEpIHdlIG9ubHkgZW5hYmxlIENPTkZJ
R19LRVhFQ19GSUxFCj4gPiA+IHdpdGggZW5mb3JjZWQgc2lnbmF0dXJlIGNoZWNrIHRvIHN1cHBv
cnQgdGhlIGtlcm5lbCBjcmFzaCBkdW1waW5nCj4gPiA+IGZ1bmN0aW9uYWxpdHkgYW5kIHdvdWxk
IGxpa2UgdG8ga2VlcCBDT05GSUdfS0VYRUMgZGlzYWJsZWQgZm9yCj4gPiA+IHNlY3VyaXR5IHJl
YXNvbnMgWzFdLgo+ID4gPgo+ID4gPiBJIHdhcyByZWFkaW5nIHRoZSBsb25nIGNvbW1pdCBtZXNz
YWdlLCBidXQgdGhlIHJlYXNvbiBmb3IgYWRkaW5nCj4gPiA+IENPTkZJR19LRVhFQyBhcyBhIGRl
cGVuZGVuY3kgZm9yIENPTkZJR19DUkFTSF9EVU1QIGV2YWRlZCBtZS4gQW5kIEkKPiA+ID4gYmVs
aWV2ZSBmcm9tIHRoZSBpbXBsZW1lbnRhdGlvbiBwZXJzcGVjdGl2ZSBDT05GSUdfS0VYRUNfRklM
RSBzaG91bGQKPiA+ID4gc3VmZmljZSBoZXJlIChhcyB3ZSBzdWNjZXNzZnVsbHkgdXNlZCBpdCBm
b3IgY3Jhc2hkdW1wcyBvbiBMaW51eCA2LjEpLgo+ID4gPgo+ID4gPiBJcyB0aGVyZSBhIHJlYXNv
biBmb3IgYWRkaW5nIHRoaXMgZGVwZW5kZW5jeSBvciBpcyBpdCBqdXN0IGFuCj4gPiA+IG92ZXJz
aWdodD8gV291bGQgc29tZSBzb2x1dGlvbiBvZiByZXF1aXJpbmcgZWl0aGVyIENPTkZJR19LRVhF
QyBvcgo+ID4gPiBDT05GSUdfS0VYRUNfRklMRSB3b3JrIGhlcmU/Cj4gPgo+ID4gSSBzZWFyY2hl
ZCB0aGUgcGF0Y2ggaGlzdG9yeSwgZm91bmQgRXJpYyBkaWRuJ3QgYWRkIHRoZSBkZXBlbmRlbmN5
IG9uCj4gPiBDT05GSUdfS0VYRUMgYXQgdGhlIGJlZ2lubmluZy4gTGF0ZXIgYSBsaW51eC1uZXh0
IGJ1aWxkaW5nIGZhaWx1cmUgd2l0aAo+ID4gcmFuZGNvbmZpZyB3YXMgcmVwb3J0ZWQsIGluIHRo
ZXJlIENPTkZJR19DUkFTSF9EVU1QIGVuYWJsZWQsIHdoaWxlCj4gPiBDT05GSUdfS0VYRUMgaXMg
ZGlzYWJsZWQuIEZpbmFsbHkgRXJpYyBhZGRlZCB0aGUgS0VYRUMgZGVwZW5kZW5jeSBmb3IKPiA+
IENSQVNIX0RVTVAuIFBsZWFzZSBzZWUgYmVsb3cgbGluayBmb3IgbW9yZSBkZXRhaWxzOgo+ID4K
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8zZThlZWNkMS1hMjc3LTJjZmItNjkwZS01
ZGUyZWI3Yjk4OGVAb3JhY2xlLmNvbS9ULyN1Cj4gCj4gVGhhbmsgeW91IGZvciBkaWdnaW5nIHRo
aXMgdXAuIEhvd2V2ZXIgSSdtIHN0aWxsIGNvbmZ1c2VkLCBiZWNhdXNlCj4gdGhpcyBpcyBleGFj
dGx5IGhvdyB3ZSBjb25maWd1cmUgTGludXggNi4xIChhbHRob3VnaCB3ZSBkbyBoYXZlCj4gQ09O
RklHX0tFWEVDX0ZJTEUgZW5hYmxlZCkgYW5kIHdlIGRvbid0IGhhdmUgYW55IHByb2JsZW1zLiBJ
IGJlbGlldmUKPiB3ZSBkaWQgbm90IGludmVzdGlnYXRlIHRoaXMgaXNzdWUgcHJvcGVybHkuCj4g
Cj4gPiBBbmQgYmVzaWRlcywgdGhlIG5ld2x5IGFkZGVkIENPTkZJR19DUkFTSF9IT1RQTFVHIGFs
c28gbmVlZHMKPiA+IENPTkZJR19LRVhFQyBpZiB0aGUgZWxmY29yZWhkciBpcyBhbGxvd2VkIHRv
IGJlIG1hbmlwdWxhdGVkIHdoZW4KPiA+IGNwdS9tZW1vcnkgaG90cGx1ZyBoYXBlbmVkLgo+IAo+
IFRoaXMgc3RpbGwgZmVlbHMgbGlrZSBhIHJlZ3Jlc3Npb24gdG8gbWU6IGFueSBjcmFzaCBkdW1w
IHN1cHBvcnQKPiBzaG91bGQgYmUgaW5kZXBlbmRlbnQgb2YgS0VYRUMgc3lzY2FsbHMgYmVpbmcg
cHJlc2VudC4gV2hpbGUgcHJvYmFibHkKPiB0aGUgY29tbW9uIGNhc2UgKGluY2x1ZGluZyB1cykg
dGhhdCB0aGUgY3Jhc2hpbmcga2VybmVsIGFuZCByZWNvdmVyeQo+IGtlcm5lbCBhcmUgdGhlIHNh
bWUsIHRoZXkgZG9uJ3QgaGF2ZSB0byBiZS4gV2UgbmVlZCBrZXhlYyBzeXNjYWxsIGluCj4gdGhl
IGNyYXNoaW5nIGtlcm5lbCwgYnV0IGNyYXNoZHVtcCBzdXBwb3J0IGluIHRoZSByZWNvdmVyeSBr
ZXJuZWwgKGJ1dAo+IHRoZSByZWNvdmVyeSBrZXJuZWwgbm90IGhhdmluZyB0aGUga2V4ZWMgc3lz
Y2FsbHMgc2hvdWxkIGJlIHRvdGFsbHkKPiBmaW5lKS4gSWYgd2UgZG8gcmVxdWlyZSBzb21lIGNv
ZGUgZGVmaW5pdGlvbnMgZnJvbSBrZXhlYyAtIGF0IG1vc3Qgd2UKPiBzaG91bGQgcHV0IHRoZW0g
dW5kZXIgQ09ORklHX0tFWEVDX0NPUkUuCgpIbW0sIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4u
IFdpbGwgd2FpdCBmb3IgRXJpYyBhIHdoaWxlIHRvIHNlZSBpZiBoZQpoYXMgYW55IGV4cGxhbm5h
dGlvbiBvciBwbGFuLCBvdGhlcndpc2UgSSB3aWxsIGNoZWNrIHRoaXMuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
