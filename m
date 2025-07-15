Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D072C83F27
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4UTrNc18xANqjnWZIpClWODaMzr7gfYdL5DdSEbZQI=; b=gUZqF7xJdTe9Hb
	tv+cQGeeR1COyv1Dq2rr1Cumn616b6kS6X6+yt7cTKFsYcXUAhygER/jGmAHv7QjA7E+GBnAYxVjh
	on27npd3nTQjPWTdz0BITEnFf+/eF/C31DEvHsS+mzo3sIvfIOM6/03cuICanofHrSzE5Rz7JdS04
	gEcyeJ5IkPPLHZJdJm0iK+U3S9ZksLovRHcqjXjzUqBP1hqK2LOb0/QE9gyhRwRLTKCi8JsaegWLw
	ekNwSGPoy64dWiMSCNe0fk1lndAUXOKDfIN+xDDLuCkBnIO5c/ocPu7K1G2uBvtWMlBlPc+f030a8
	vE2PE2oXWOJX3EIk+4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnw8-00000006JVp-3OWa;
	Tue, 15 Jul 2025 22:15:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnw6-00000006JVH-0MAD
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 22:15:43 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-455b00339c8so32618535e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 15:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617740; x=1753222540; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hM+65DlZuMtswqqV8Qae3QMSQW7h28+G8WpIhXyY6to=;
        b=cC8ZQtgIdrFSkv9T8kcCb47hYitip4mIdMEyyLAq2CozLc38QfJZQDBRT8/pTdaYkT
         djzRFC2iuQ2ORmjJ098MiXXEkRbZu4XCZkl+jJjSqSdtjNVv4k/wIpbbs0oV3Le7qvEz
         rnPHI669O/HbMXhePIhqPXVKFIRsnV2FUV9ABcrgHzaaqlWzcg565V7F0lj+x5Hyika7
         wtcxHECspbCWDRpbxsTY+EK9pBQznfdteUSdQPGPqBxjzavAZslgVwKxrK8XFdn8OOCz
         zg1S/6eUKFFFjg8Rus8xOOrA48IwzF6e6iF3lFKPf2KPcTO91VJnSwDqKTbuDaUTft87
         Qp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617740; x=1753222540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hM+65DlZuMtswqqV8Qae3QMSQW7h28+G8WpIhXyY6to=;
        b=Y7kipCjINrPH6Gg5qH9KDyI1Ule5RxnJqAusJNkhN+0RUj90lLFiyAY6hGZ8Zot3d7
         +7BMv8JQ91m4tcU5jqHYSpQW851A0JE+xShsKJ8ekRpapPsfsRGjo0TNv3vnJ0VP3yIO
         /z4tIEO5zfi5bg75+vf+x6lgNRCcYb6EcRBuTpA4Lbp7P93EkAyA3JE3IWwMLZGWYaIE
         jUSxtapsKYeRXVZcLjM7A1v2e3K/krQPAMFnTjTjaTenmud3GKFdVbV8NViiwIbi6zVI
         pH8ZrvoGPK3PRCPUT3F1fNhzSouNM4Uk+XTwctat/aeGBtmKgRe0nzDBz+VoYC9Qc0+j
         q7xQ==
X-Gm-Message-State: AOJu0Yy1bxkefvI11GXE4bV9KclO1xFCoU5+UxI/fXrwZ485pgH6XyGq
	Fpa298J7ZfRb3SeCW7beBD0h4xWSm1YZIOSt6Cd9Kc7UImpTwQn3O16sJSakQqfP3fhEzopqH09
	hAfc6ZuuLtxFGel0Jb+A25627emGYmak=
X-Gm-Gg: ASbGncvp1zIa6a6eVPc3kccEN3cnfhhLh0481WN3crgdChDfA1X+MMMWoH/WrnPBtn3
	nWKI9QPvpJd1Nt0wzFLMyXWfak+97pRXDc4lOZThSMPGo7HNhvj6mXt6EANQQmw4MDy+0ujeUyJ
	nub1A62EinJS5WKYAx8+rLOEI9bmNwKRb/FHK4WMie1QCswlQUV6ZrUFbEBeaAkj6Lr8zNJGsH7
	c/FyXtx
X-Google-Smtp-Source: AGHT+IHIg/11IOI1UvwDXrQrF9FvmKDQpmWNgXnUiQo6BHAbAVnO7D1M71U5c0urqNVSgXdTQuX71SwkiXwvr2Drbm8=
X-Received: by 2002:a5d:64ee:0:b0:3aa:c9a8:a387 with SMTP id
 ffacd0b85a97d-3b60e446e70mr158604f8f.0.1752617739844; Tue, 15 Jul 2025
 15:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250623231536.1120282-1-Mr.Bossman075@gmail.com> <aHY0mWEx8_z_nJoU@mai.linaro.org>
In-Reply-To: <aHY0mWEx8_z_nJoU@mai.linaro.org>
From: Jesse T <mr.bossman075@gmail.com>
Date: Tue, 15 Jul 2025 18:15:03 -0400
X-Gm-Features: Ac12FXzBzUkaCQ2uspQJV8eldICbB0xAjArutA46vBdfRIUXxrzha0-2-ATwUG8
Message-ID: <CAJFTR8S=EKRG93sGYDr4tKTdmiEMdC+tyaDGh1e_n28fKr6+kg@mail.gmail.com>
Subject: Re: [PATCH v6] clocksource/drivers/timer-clint: Add T-Head C9xx clint
To: Daniel Lezcano <daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_151542_128258_7218ED0C 
X-CRM114-Status: GOOD (  30.86  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgNjo1OeKAr0FNIERhbmllbCBMZXpjYW5vCjxkYW5pZWwu
bGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVuIDIzLCAyMDI1IGF0IDA3
OjE1OjM2UE0gLTA0MDAsIEplc3NlIFRhdWJlIHdyb3RlOgo+ID4gRnJvbTogSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4KPiA+IFRvIHVzZSB0aGUgVC1IRUFEIEM5eHggY2xp
bnQgaW4gUklTQ1YtTSBOT01NVSBlbnYsIHdlIG5lZWQgdG8gdGFrZQo+ID4gY2FyZSB0d28gcG9p
bnRzOgo+ID4KPiA+IDEuVGhlIG10aW1lY21wIGluIFQtSGVhZCBDOXh4IGNsaW50IG9ubHkgc3Vw
cG9ydHMgMzJiaXQgcmVhZC93cml0ZSwKPiA+IGltcGxlbWVudCBzdWNoIHN1cHBvcnQuCj4gPgo+
ID4gMi4gQXMgcG9pbnRlZCBvdXQgYnkgY29tbWl0IGNhNzgxMGFlY2RiYSAoImxpYjogdXRpbHMv
dGltZXI6IG10aW1lcjoKPiA+IGFkZCBhIHF1aXJrIGZvciBsYWNraW5nIG10aW1lIHJlZ2lzdGVy
Iikgb2Ygb3BlbnNiaToKPiA+Cj4gPiAiVC1IZWFkIGRldmVsb3BlcnMgc3VyZWx5IGhhdmUgYSBk
aWZmZXJlbnQgdW5kZXJzdGFuZGluZyBvZiB0aW1lIENTUiBhbmQKPiA+IENMSU5UJ3MgbXRpbWUg
cmVnaXN0ZXIgd2l0aCBTaUZpdmUgb25lcywgdGhhdCB0aGV5IGRpZCBub3QgaW1wbGVtZW50Cj4g
PiB0aGUgbXRpbWUgcmVnaXN0ZXIgYXQgYWxsIC0tIGFzIHNob3duIGluIG9wZW5DOTA2IHNvdXJj
ZSBjb2RlLCB0aGVpcgo+ID4gdGltZSBDU1IgdmFsdWUgaXMganVzdCBleHBvc2VkIGF0IHRoZSB0
b3Agb2YgdGhlaXIgcHJvY2Vzc29yIElQIGJsb2NrCj4gPiBhbmQgZXhwZWN0cyBhbiBleHRlcm5h
bCBjb250aW5vdXMgY291bnRlciwgd2hpY2ggbWFrZXMgaXQgbm90Cj4gPiBvdmVycmlkZWFibGUs
IGFuZCB0aHVzIG10aW1lIHJlZ2lzdGVyIGlzIG5vdCBpbXBsZW1lbnRlZCwgZXZlbiBub3QgZm9y
Cj4gPiByZWFkaW5nLiBIb3dldmVyLCBpZiBDTElOVEVFIGlzIG5vdCBlbmFibGVkIGluIFQtSGVh
ZCdzIE1YU1RBVFVTCj4gPiBleHRlbmRlZCBDU1IsIHRoZXNlIHN5c3RlbXMgc3RpbGwgcmVseSBv
biB0aGUgbXRpbWVjbXAgcmVnaXN0ZXJzIHRvCj4gPiBnZW5lcmF0ZSB0aW1lciBpbnRlcnJ1cHRz
LiBUaGlzIG1ha2VzIGl0IG5lY2Vzc2FyeSB0byBpbXBsZW1lbnQgVC1IZWFkCj4gPiBDOXh4IENM
SU5UIHN1cHBvcnQgaW4gT3BlblNCSSBNVElNRVIgZHJpdmVyLCB3aGljaCBza2lwcyBpbXBsZW1l
bnRpbmcKPiA+IHJlYWRpbmcgbXRpbWUgcmVnaXN0ZXIgYW5kIGZhbGxzIGJhY2sgdG8gZGVmYXVs
dCBjb2RlIHRoYXQgcmVhZHMgdGltZQo+ID4gQ1NSLiIKPiA+Cj4gPiBTbywgd2UgbmVlZCB0byBm
YWxsIGJhY2sgdG8gcmVhZCB0aW1lIENTUiBpbnN0ZWFkIG9mIG10aW1lIHJlZ2lzdGVyLgo+ID4g
QWRkIHJpc2N2X2Nzcl90aW1lX2F2YWlsYWJsZSBzdGF0aWMga2V5IGZvciB0aGlzIHB1cnBvc2Uu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3Jn
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPE1yLkJvc3NtYW4wNzVAZ21haWwuY29t
Pgo+ID4gLS0tCj4gPiBUcmVhdCB0aGlzIGFzIGEgY29tcGxldGVseSBuZXcgcGF0Y2gsIGFzIGl0
IGlzIG1vc3RseSByZXdyaXR0ZW4uCj4KPiBbIC4uLiBdClllcywgSmlzaGVuZyBaaGFuZyB3YXMg
dGhlIG9yaWdpbmFsIGF1dGhvciwgYnV0IHRoZSBwYXRjaCBzZXJ2ZXMgdGhlIHNhbWUgZ29hbC4K
SSB1c2VkIHRoZWlyIGNvZGUgYXMgYSBzdGFydGluZyBwb2ludCwgc28gSSBrZXB0IHRoZSBzaWdu
LW9mZiBhbmQKY29tbWl0IGRlc2NyaXB0aW9uLgoKPgo+ID4gVjUgLT4gVjY6Cj4gPiAgLSBBZGQg
Y3NyX2Nsb2NrX25leHRfZXZlbnQKPiA+ICAtIEFkZCBjc3JfZ2V0X2N5Y2xlczY0IHRvIHNjaGVk
X2Nsb2NrX3JlZ2lzdGVyCj4gPiAgLSBCcmVhayBnZXRfY3ljbGVzNjQgaW50byBjc3JfZ2V0X2N5
Y2xlczY0IGFuZCBjbGludF9nZXRfY3ljbGVzNjQKPiA+ICAtIENoYW5nZSBkZWZhdWx0IGJlaGF2
aW9yIHRvIHVzZSBDU1IgdGltZSByZWdpc3Rlcgo+Cj4gWyAuLi4gXQo+Cj4gQW55IGNvbW1lbnRz
IGZvciB0aGVzZSBjaGFuZ2VzIGZyb20gdGhlIGFyY2ggbWFpbnRhaW5lciA/CgpJIGRvbid0IHVu
ZGVyc3RhbmQ/IEFyZSB5b3UgYXNraW5nIEppc2hlbmcgWmhhbmc/Cgo+Cj4gVGhhbmtzCj4KPiAt
LQo+Cj4gIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJj
ZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKPgo+IEZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8Cj4gPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo+IDxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJv
LWJsb2cvPiBCbG9nCgo+ID4gK3N0YXRpYyBpbnQgYzkwMF9jbGludF9jbG9ja19uZXh0X2V2ZW50
KHVuc2lnbmVkIGxvbmcgZGVsdGEsCj4gPiArIHN0cnVjdCBjbG9ja19ldmVudF9kZXZpY2UgKmNl
KQo+ID4gK3sKPiA+ICsgdm9pZCBfX2lvbWVtICpyID0gY2xpbnRfdGltZXJfY21wICsKPiA+ICsg
Y3B1aWRfdG9faGFydGlkX21hcChzbXBfcHJvY2Vzc29yX2lkKCkpOwo+ID4gKyB1NjQgdmFsID0g
Y2xpbnRfZ2V0X2N5Y2xlczY0KCkgKyBkZWx0YTsKClRoaXMgbGluZSBzaG91bGQgYmU6CnU2NCB2
YWwgPSBjc3JfZ2V0X2N5Y2xlczY0KCkgKyBkZWx0YTsKSSBtZXNzZWQgdXAgd2hlbiBzcGxpdHRp
bmcgY3NyX2dldF9jeWNsZXM2NCBhbmQgY2xpbnRfZ2V0X2N5Y2xlczY0CgpUaGFua3MsCkplc3Nl
IFRhdWJlCj4gPiArCj4gPiArIGNzcl9zZXQoQ1NSX0lFLCBJRV9USUUpOwo+ID4gKyB3cml0ZWxf
cmVsYXhlZCh2YWwsIHIpOwo+ID4gKyB3cml0ZWxfcmVsYXhlZCh2YWwgPj4gMzIsIHIgKyA0KTsK
PiA+ICsgcmV0dXJuIDA7Cj4gPiArfQo+ID4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
