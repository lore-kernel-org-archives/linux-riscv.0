Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF027CD8CA9
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Oct 2023 16:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5BsG29an9AelpRnAq0pbor6fdxFnIqgq+mSeykVTec=; b=TZPWsKwJWg7byD
	s285gyGfLGXg1tJis6dbIqni1AdGeT5xB1vJyhlEWBmMTQdnwoudpXxbRFnaz4dOiwxjxfjz1DHN7
	LuthIhQ4hnANRNABsy50BB3zDqAz+hrwsymQvIBGHgcvXoXIYXkjHMqEc+pIkqXk07PWhaVtcN7AV
	kJWl/ZglDIhkHkOK3bopbqAKAux1Rn85tRe60PVzYAByuD3NurATx/zTtxZPBiRIm51craB/So4wA
	QsDpB6hj7BRGBW78EWcHOPyyuoHNmF3eIZcPWU4gy9Zaap9maxZc7g00fSacwzndrVA5DP2h+mRhv
	bF1OCHqC9KeYTHBxLZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFVX-00DlNP-2G;
	Tue, 10 Oct 2023 16:22:55 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqFVU-00DlN2-1K
	for linux-riscv@lists.infradead.org;
	Tue, 10 Oct 2023 16:22:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so10378115a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Oct 2023 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696954969; x=1697559769; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D9FIVc/BgwgL7J640V2MbeKnchdcCBmP3Xrs2aaX4Gs=;
        b=TzG5ryEY1sD4MJq0m/P8ogGLYXggd/wREUUnLaUZuDwyUkyYOu7lQUwYULUJv7sCt6
         Z27y1skZLFKKi45ZMU7tM0uNr3z3wu9jLM+aWX0xQLMzTJWvOTuiXLpu1elYHRHWbe7K
         ol/JucTu5aKrMfPxwEDWwviDipd5prXmoA/ryA5NXnxKMAECDvsF7IC7GepPtvQQhQTc
         qnRwC3eRxkeC8Y1jBxLjTR4M3Cr9Q/13ReWxXGaFfAzGs+yAI3/AK/PTpnkmLjiM5EMx
         Z1fFOk4w2GVM1uaQe3dMIAtavfUcgTaSY74k9uOOfWIdGgsuSamGjpvhC9GQ4dIG7M9r
         J/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696954969; x=1697559769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9FIVc/BgwgL7J640V2MbeKnchdcCBmP3Xrs2aaX4Gs=;
        b=vt+bBfAqPtljMjuMRuW9MTYSN28NuMwplmNAUWRi69+h6H4JosOUucN3113t11esCf
         LlsQXt1ZNgrlV8kvP9QdvArdKHlTRV/cHbQbdSFzDYHBciwoRm2R1ZKWG1LA4uhRyFzc
         WHJRYybtP7LQ92B0Qr4liUee2Dssyi7ezqDZ5x2WUk4QLQk5jIAn6JHsvuk5qHckftYo
         sIRJ4Dqkap7c1EFbNSDrVI+3Dhb3p9Fa2YMlqrsfxRtWAHyZnsjbq87VQFTa22ZnuBRz
         YyGYFbHfV13Mb3rayZJro5KlshDy63ir8xNOxNfPIFDXtxmzv7cBE77kwXBbVrEZBYNZ
         GRsA==
X-Gm-Message-State: AOJu0Yzukg6w9KBqCA8mtaHTbNfYc83wsPPJzI88lvXL5jMB+wVpbkU3
	JiiPa3OXT/YILfgCkK6eQ0MAfA==
X-Google-Smtp-Source: AGHT+IGFRe13XF6yYFo7T0Hv688rnFDcBuXppUARGhw0bNq6XpXFAz4ROBoyqVjqKkJCp/OlYImX2g==
X-Received: by 2002:a17:906:76cf:b0:9b2:a7e5:c47 with SMTP id q15-20020a17090676cf00b009b2a7e50c47mr17333588ejn.9.1696954969151;
        Tue, 10 Oct 2023 09:22:49 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id kb4-20020a1709070f8400b009adc81bb544sm8641066ejc.106.2023.10.10.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 09:22:48 -0700 (PDT)
Date: Tue, 10 Oct 2023 18:22:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231010-50f9fbbd64a906b62efadb38@orel>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com>
 <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel>
 <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
 <20231005-5221bab223ee6d8a4c77b23d@orel>
 <20231009-26f43e41ddc98f0263f4258d@orel>
 <CALs-HsubfzKEzi3BBNH2UHj9Oa77FbkKBxT34P_kqV5gX2OwJw@mail.gmail.com>
 <20231010-baaa9fc9df51034c98fe0ea3@orel>
 <CALs-HsuoJoLVnEp1Nk-apkvr6TtGryy8xFUDxugtQ69M3=guhA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HsuoJoLVnEp1Nk-apkvr6TtGryy8xFUDxugtQ69M3=guhA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_092252_457261_63CE53BE 
X-CRM114-Status: GOOD (  45.02  )
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

T24gVHVlLCBPY3QgMTAsIDIwMjMgYXQgMDg6MTQ6MTZBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUdWUsIE9jdCAxMCwgMjAyMyBhdCAzOjQ04oCvQU0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBPY3QgMDksIDIwMjMg
YXQgMDk6NTA6MDBBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiA+ID4gT24gTW9uLCBPY3Qg
OSwgMjAyMyBhdCA4OjM54oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBPbiBUaHUsIE9jdCAwNSwgMjAyMyBhdCAwODoxMToy
NVBNICswMjAwLCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIE9jdCAwNSwg
MjAyMyBhdCAxMDoxMjoxNEFNIC0wNzAwLCBFdmFuIEdyZWVuIHdyb3RlOgo+ID4gPiA+ID4gPiBP
biBUaHUsIE9jdCA1LCAyMDIzIGF0IDY6MjPigK9BTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50
YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9uIE1vbiwg
U2VwIDI1LCAyMDIzIGF0IDA5OjE2OjAxQU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+
ID4gPiAuLi4KPiA+ID4gPiA+ID4gPiA+IFNvIGlmIEkgd3JpdGUgb3V0IHRoaXMgYWxnb3JpdGht
LCBJIGdldCBzb21ldGhpbmcgbGlrZToKPiA+ID4gPiA+ID4gPiA+ICAqIENyZWF0ZSBhbiBhcnJh
eSBvZiBldmVyeSBwb3NzaWJsZSBrZXksIGFuZCBkZWR1cGUgdGhlIGNhbGxlcidzIGxpc3QKPiA+
ID4gPiA+ID4gPiA+IG9mIHBhaXJzIGludG8gdGhpcyBhcnJheS4KPiA+ID4gPiA+ID4gPiA+ICAq
IEZvciBlYWNoIHJlbWFpbmluZyBjcHUsIGdvIHRocm91Z2ggdGhpcyBhcnJheSBhbmQgZWl0aGVy
IGNvbmZpcm0KPiA+ID4gPiA+ID4gPiA+IHRoZSBiaWcgYXJyYXkncyBlbGVtZW50IG1hdGNoZXMg
dGhpcyBjcHUncyB2YWx1ZSwgb3IgY2xlYXIgdGhlIGNwdQo+ID4gPiA+ID4gPiA+ID4gZnJvbSB0
aGUgcmVzdWx0IHNldC4KPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBCdXQgd2h5IGRv
IHdlIGdvIHRvIGFsbCB0aGUgZWZmb3J0IG9mIGRlLWR1cGluZyB0aGUgY2FsbGVyJ3MgYXJyYXkg
b2YKPiA+ID4gPiA+ID4gPiA+IHBhaXJzPyBDYW4ndCB0aGV5IGRvIHRoYXQgdGhlbXNlbHZlcyAo
b3IgcGF5IGEgc21hbGwgcGVyZm9ybWFuY2UKPiA+ID4gPiA+ID4gPiA+IHBlbmFsdHkgZm9yICJ5
ZXMiIHJlc3VsdHMpPyBJbnN0ZWFkLCBjb3VsZG4ndCBpdCBiZSBzb21ldGhpbmcgbGlrZToKPiA+
ID4gPiA+ID4gPiA+IEZvciBlYWNoIHBhaXIgaW4gdGhlIHVzZXIncyBzZXQsIGZvciBlYWNoIHJl
bWFpbmluZyBjcHUgaW4gdGhlIHNldCwKPiA+ID4gPiA+ID4gPiA+IGNvbXBhcmUgdGhlIHZhbHVl
cywgb3IgY2xlYXIgdGhlIGNwdSBpbiB0aGUgcmVtYWluaW5nIHNldC4KPiA+ID4gPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+ID4gPiBEb2luZyB0aGF0IHdvdWxkIGFsc28gdGFrZSB0aGUgcnVudGltZSBm
cm9tIE8oa2V5c3BhY2UgKiBuY3B1cykgdG8KPiA+ID4gPiA+ID4gPiA+IE8ocXVlcnlfbGVuZ2gg
KiBuY3B1cykuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBJIHdhbnQgdG8gZGUtZHVwZSBm
b3IgdHdvIHJlYXNvbnM6Cj4gPiA+ID4gPiA+ID4gICogcXVlcnlfbGVuZ3RoIGlzIHVuYm91bmRl
ZCwgYnV0IGtleXNwYWNlIGlzIGJvdW5kZWQgKGFuZCBpcyBjdXJyZW50bHkKPiA+ID4gPiA+ID4g
PiAgICBzbWFsbCkKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gT2ssIGJ1dCByZW1lbWJlciB0aGF0
IGlmIHdlIHNoaXAgdGhpcyBiZWhhdmlvciB0b2RheSwgd2UncmUgY29tbWl0dGVkCj4gPiA+ID4g
PiA+IHRvIGl0IGZvcmV2ZXIuIFRoZSBrZXlzcGFjZSBpcyBsaWtlbHkgdG8gZ3JvdywgaXQgd291
bGQgYmUgdW5mb3J0dW5hdGUKPiA+ID4gPiA+ID4gaWYgdGhpcyBzdGVwIHN0YXJ0ZWQgdG8gY2F1
c2UgYSBub3RpY2VhYmxlIHBlcmZvcm1hbmNlIGRlbGF5Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IE1h
eWJlIGl0J3Mgbm90IHRvbyBsYXRlIHRvIHB1dCBhIGJvdW5kIG9uIHBhaXJzLCBpLmUuIHBhaXJf
Y291bnQgZ3JlYXRlcgo+ID4gPiA+ID4gdGhhbiBzb21lIG51bWJlciBzaG91bGQgcmV0dXJuIEUy
QklHLgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IFNjcmF0Y2ggdGhpcyBpZGVhLiBJIHdlbnQg
bG9va2luZyBmb3IgcHJlY2VkZW50IGZvciBsaW1pdGluZyB0aGUgbGVuZ3RoIG9mCj4gPiA+ID4g
aW5wdXQgYXJyYXlzIHRvIHN5c2NhbGxzLCBidXQgY291bGRuJ3QgZmluZCBhbnkuIFRvIHRoZSBj
b250cmFyeSwgSSBmb3VuZAo+ID4gPiA+IHRoYXQgbW92ZV9wYWdlcygpIHVzZWQgdG8gcmV0dXJu
IEUyQklHIHdoZW4gdGhlcmUgd2VyZSAidG9vIG1hbnkgcGFnZXMgdG8KPiA+ID4gPiBtb3ZlIiwg
YnV0IGl0IGhhc24ndCBkb25lIHNvIHNpbmNlIDIuNi4yOSBhbmQsIGV2ZW4gdGhlbiwgaXQgYXBw
ZWFycyB0aGUKPiA+ID4gPiBjb25jZXJuIHdhcyBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdywgbm90
IGhhdmluZyAidG9vIG11Y2giIHdvcmsuIFNvLCB3ZQo+ID4gPiA+IHNob3VsZCBsZWF2ZSB0aGUg
bnVtYmVyIG9mIHBhaXJzIHVuYm91bmRlZCwgYnV0LCB0b28gbWUsIHRoYXQgbWVhbnMgd2UKPiA+
ID4gPiBzaG91bGQgZGUtZHVwZSwgc2luY2Ugd2UgY2FuIGRvIHRoZSBjb3B5X2Zyb21fdXNlcigp
IG9uY2UgZm9yIGVhY2ggYXQgdGhhdAo+ID4gPiA+IHRpbWUsIGFuZCBhbnkgdXNlciB3aGljaCBk
ZWNpZGVzIHRvIHByb3ZpZGUgZWFjaCBiaXQgc2VwYXJhdGVseSBmb3IgZWFjaAo+ID4gPiA+IGJp
dG1hc2sga2V5IHR5cGUgc2hvdWxkIGdldCB0aW55IHNwZWVkdXAuCj4gPiA+Cj4gPiA+IEkgc3Rp
bGwgZG9uJ3QgZ2V0IHRoZSB1c2VjYXNlIHdoZXJlIHVzZXJtb2RlIGlzIGdvaW5nIHRvIGJlIHN1
Ym1pdHRpbmcKPiA+ID4gdGhpcyBsYXJnZSBqdW1ibGUgb2Yga2V5cywgcmVwbGV0ZSB3aXRoIG1h
bnkgZHVwbGljYXRlcy4gQW5kIGV2ZW4gaWYKPiA+ID4gc3VjaCBhIGNhc2UgZGlkIGV4aXN0LCB3
aHkgc2hvdWxkIHRoZSBrZXJuZWwgYmUgdGhlIG9uZSBkZWR1cGluZywKPiA+ID4gZHJhZ2dpbmcg
aW4gYSBydW50aW1lIHBlbmFsdHkgZm9yIGFsbCBvdGhlciBjYWxsZXJzIHRoYXQgZGlkbid0IHN1
Ym1pdAo+ID4gPiBkdXBsaWNhdGVzLiBVc2VybW9kZSBjb3VsZCBkZS1kdXBlIG9uIHRoZWlyIG93
biBJJ2QgdGhpbmsuCj4gPgo+ID4gSXQncyBub3QgYWJvdXQgdXNlY2FzZXMsIGJ1dCBhYm91dCBi
ZXN0IGhhbmRsaW5nIG9mIGFsbCBhbGxvd2VkIGlucHV0cy4KPiA+Cj4gPiBJZiBjYWxsZXJzIGRv
bid0IHN1Ym1pdCBkdXBsaWNhdGVzIG9yIG1ha2UgdGhlIGNhbGwgd2l0aCBhIHNtYWxsCj4gPiBw
YWlyX2NvdW50LCB0aGVuIHRoZSBkZS1kdXBlIGxvb3Agd291bGQgaGF2ZSBuZWdsaWdpYmxlIG92
ZXJoZWFkIGluCj4gPiB0ZXJtcyBvZiB0aW1lLiBIb3dldmVyLCB0aGlua2luZyBhYm91dCB0aGlz
IHNvbWUgbW9yZSwgd2UgY2FuIGF2b2lkCj4gPiBpc3N1aW5nIGNvcHlfZnJvbV91c2VyKCkgbXVs
dGlwbGUgdGltZXMgYnkgbG9vcGluZyBvdmVyIGNwdXMgd2l0aGluCj4gPiB0aGUgbG9vcCBvdmVy
IHVzZXIgaW5wdXQgcGFpcnMuIFdlJ2xsIGRvIGNwdW1hc2tfc2V0X2NwdSgpIGFuZAo+ID4gY3B1
bWFza19jbGVhcl9jcHUoKSBvbiB0aGUgb25lX2NwdSBjcHVtYXNrIG1vcmUgdGltZXMgaW5zdGVh
ZCwgYnV0Cj4gPiB0aGF0J3MganVzdCBhIGNvdXBsZSBsb2FkcyBhbmQgc29tZSBhcml0aG1ldGlj
LiBJIHRoaW5rIHRoaXMgd291bGQKPiA+IGJlIHRoZSBiZXR0ZXIgYXBwcm9hY2gsIG5vdCBiZWNh
dXNlIG9mIHRpbWUgb3ZlcmhlYWQsIGJ1dCBiZWNhdXNlCj4gPiB3ZSB3b24ndCBoYXZlIHRvIHN0
b3JlIHBhaXJzIGF0IGFsbCwgYXZvaWRpbmcgbWVtb3J5IGFsbG9jYXRpb24gb3IKPiA+IHRoZSBh
c3N1bXB0aW9uIHRoYXQgd2UgY2FuIHN0b3JlIGEgcGFpciBwZXIgcG9zc2libGUga2V5IG9uIHRo
ZSBzdGFjay4KPiAKPiBUaGF0IHNvdW5kcyBnb29kIHRvIG1lLiBJZiBJIHVuZGVyc3RhbmQgdGhl
IHByb3Bvc2FsIHJpZ2h0LCB5b3UnbGwKPiBhbHNvIGJlIGFibGUgdG8ga2VlcCB5b3VyIG9wdGlt
aXphdGlvbiBvZiBsb29waW5nIG9ubHkgb3ZlciB0aGUgY3B1cwo+IHRoYXQgYXJlICJzdGlsbCBp
biB0aGUgcnVubmluZyIsIHdoaWNoIHdhcyBhIG5pY2UgZWFybHkgZXhpdCBmb3IKPiBjZXJ0YWlu
ICJubyIgYW5zd2Vycy4KCll1cC4gSWYgYSBjcHUgaXMgZHJvcHBlZCBkdWUgdG8gb25lIHBhaXIs
IHRoZW4gaXQgd29uJ3QgYmUgY2hlY2tlZCBhZ2FpbnN0CmxhdGVyIHBhaXJzLiBBbmQsIGlmIGEg
cGFpcidzIGtleSBpcyBub3QgcmVjb2duaXplZCwgdGhlbiBubyBjcHVzIHdpbGwgYmUKY2hlY2tl
ZCBhZ2FpbnN0IGxhdGVyIHBhaXJzLCBhcyB0aGF0J3MgYSAiY2xlYXIgYWxsIiBjb25kaXRpb24u
CgpUaGFua3MsCmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
