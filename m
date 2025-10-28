Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E32BCCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MXhNuviPJrlV7JmxkzxAos/rg/gc8widvhy07rkB3M=; b=uP68EgBcStjuli
	XBKRyQGJy3wFhGQ2IvFyqUAzy/foYRyznUHlPXOQ/saP8HfvMJURgeiehZK5kMwulvluo3LEoHJgi
	7opdbazUGsN0phrv4bxRrC8bzdsD3O/K3XLtyDhUs77siY5rlQ7DqFd4B9I5VP7diTXfbxWLzjBGA
	p0/V7m9hsBarCJHqz+jTItVplSq4q+ZIaadSrYTDJK+VphUOk7iCn+qbxFGL1JYTh2rhTNv8b5Lpi
	TnEcPylpzlGr/6RK0a9FyLjr3X7ZaK2TP7H0vSTzdwLKwsNsz9J0ipUkdlG7Q+6Ig/oRIgIbRjlni
	fkiHQzP7uiqzcrbXJG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2x-0000000G1pv-2n2S;
	Tue, 28 Oct 2025 13:47:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDk2v-0000000G1on-2zN4
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 13:47:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C64E960624
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 13:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AD1C4AF0B
	for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761659252;
	bh=GVjUEKZRgeMgDKNXAgezVSn0xrs6j1yMXphGPwksYBw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BCBzeOpVuTtpNnsK/HEK0mvaOH767BgRFEyc3cHrIO1uiPno7n9YbPE0RrBArxZJU
	 W1oBY0fw/FAwbktfbNtUAgrshGxHddq0rN8tOoA4XbxSqmUtrpxUBsI12txQ7WoGpW
	 ZRQoArmgPB6yUM7WhWutdmuL7EdEOUXbQDGy+kXexwRk0gFMBYoD6FrGcjfft1EaO7
	 Yw35Jaet/uAic4eP1VgrZelWiQyauRn+hnaML2Agzj5bHh9X3g7vAs6DrnQSflHlrP
	 1j+pIlVoCla2DQOukwOJTvguGHl/86+1BWvl85Hjah+3g35Bo82ImtyFxIG1M8I0Bp
	 T0vmV1b6La1Zw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3696f1d5102so53005411fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Oct 2025 06:47:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVKwDcUJ6SQJFAgFcSxeWKaYm6fZ28phiJtzxBntxzDLMzRUfHVUARkHfrr8/Thnxpx70G9vNg35cGy0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+3vgPauB4kqyG/t/P9vA7jA5OBlBqcuBjpWHHlfUU45zxDu6r
	/Qw4jB6U5AK2mu4xg0VJ2rDRiMR4Jfbv3AvKCZ1YhbR6ax8i0vZTpZZK6WT9AT4fgd75v6jtSxB
	B+G5dYDDmLhViXU1v8nNvwVyPlwsfe8U=
X-Google-Smtp-Source: AGHT+IGMDRiylwmZD0SBl5ugRhR6rIlFVm0u852ZP1jG9URNwU34wlwBhJJFjd3gP3FgNoxZynY+eRUKXAVIwfZ/a6U=
X-Received: by 2002:a2e:9a13:0:b0:36f:284:56db with SMTP id
 38308e7fff4ca-379077114c5mr10647291fa.23.1761659250814; Tue, 28 Oct 2025
 06:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhV-H7HN128du-b1Rk_9qbYBq7gMSwo0s31909N4pTou6wzew@mail.gmail.com>
 <CAMj1kXGvSnCMRVCW7eAxgLRWMEV3QRj3Dqg3PmZchZJNpnLK9w@mail.gmail.com>
 <CAAhV-H4UKdso0BokAqvjYeBLr-jbjFAaQX4z=1ztpBamqrOEEg@mail.gmail.com>
 <CAMj1kXEXDC_oq4aWbkR5dqYBix2d1xJEdaj-v747e1nOA0Q_Yg@mail.gmail.com>
 <rhnei6wovxmoqs36wdysomfsul3faxtmgde73wrrqdt3qo3b2j@akd7vzne76rq>
 <CAMj1kXF+hDJy0vRWNgwoijHxvA-scvhGODMj9A3dv19v3jf2yw@mail.gmail.com>
 <lgyzruqczm7uti2lfbhfhr5hyzpnm7wtvgffa2o7nigx76g6i3@wlffltvmhhez>
 <CAMj1kXFDquPxCYSBWgjikS=209pSJ_kth67M0RDeuetV9CPYAw@mail.gmail.com>
 <wlx6pt5crtfdwtop4w5vjznjfarrwitq44wdbufncjdvtsx647@tgobruak66yb>
 <CAMj1kXFfEBkcc-aiwGrRR-pKg4LBbS7weK0pEpZJsKOk5pbkuA@mail.gmail.com>
 <jxfb5a2c2qber623l2gwewirwod54bbgfnvt7t7f3jah2ea33g@2uyhy3auzmpx>
 <d9f3352a-1c1f-464a-a8fd-741cd96b5f8e@loongson.cn> <CAAhV-H6m5vszCyiF3qi94cpHBPVuqM2xH93D=gfsQqOSYvC-sA@mail.gmail.com>
 <33612d85-e70b-26da-8460-ea6b9064ce08@loongson.cn> <CAAhV-H5ZSTFDxvm-W1CrgEoQ5d_jw5yVsfetQ_J_qL5pqLtzgg@mail.gmail.com>
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com> <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
In-Reply-To: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Oct 2025 14:47:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
X-Gm-Features: AWmQ_bkAt2Vtj9hvye18BBbdzR0dpGQ4Zhb1DJGs0utdf4kJbulyIP6uV_Jkez8
Message-ID: <CAMj1kXEaxxcWTTANWeEMNjYDymdL5Fxy2B=XBF4RGtteEkfinw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gU3VuLCAyNiBPY3QgMjAyNSBhdCAxMjoyMCwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCA0OjA34oCvUE0gQXJk
IEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCAyMyBP
Y3QgMjAyNSBhdCAxMDowMSwgSHVhY2FpIENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgT2N0IDIzLCAyMDI1IGF0IDI6NTXigK9QTSBUaWV6aHUg
WWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBIaSBK
b3NoIGFuZCBBcmQsCj4gPiA+ID4KPiA+ID4gPiBPbiAyMDI1LzEwLzIwIOS4i+WNiDI6NTUsIEh1
YWNhaSBDaGVuIHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOToyNOKA
r0FNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNuPiB3cm90ZToKPiA+ID4gPiA+
Pgo+ID4gPiA+ID4+IEhpIEpvc2gsIEFyZCBhbmQgSHVhY2FpLAo+ID4gPiA+ID4+Cj4gPiA+ID4g
Pj4gT24gMjAyNS8xMC8xOCDkuIrljYgxOjA1LCBKb3NoIFBvaW1ib2V1ZiB3cm90ZToKPiA+ID4g
PiA+Pgo+ID4gPiA+ID4+IC4uLgo+ID4gPiA+ID4+Cj4gPiA+ID4gPj4+IEJ1dCBJSVVDLCB0aGUg
bGlic3R1YiBjb2RlIHJ1bnMgKnZlcnkqIGVhcmx5LCBhbmQgd291bGRuJ3Qgc2hvdyB1cCBpbiBh
Cj4gPiA+ID4gPj4+IHN0YWNrIHRyYWNlIGFueXdheSwgYmVjYXVzZSB0aGVyZSBhcmUgbm8gdHJh
Y2VzIG9mIGl0IG9uIHRoZSBzdGFjayBvbmNlCj4gPiA+ID4gPj4+IGl0IGJyYW5jaGVzIHRvIGhl
YWQuUyBjb2RlICh3aGljaCBkb2Vzbid0IHNhdmUgdGhlIGxpbmsgcmVnaXN0ZXIpLgo+ID4gPiA+
ID4+Cj4gPiA+ID4gPj4gVGhhbmtzIGZvciB5b3VyIGRpc2N1c3Npb25zLgo+ID4gPiA+ID4+Cj4g
PiA+ID4gPj4gQXJlIHlvdSBPSyB3aXRoIHRoaXMgY3VycmVudCBwYXRjaD8KPiA+ID4gPiA+IEZv
ciBtZSB0aGUgY3VycmVudCBwYXRjaCBpcyBqdXN0IE9LLgo+ID4gPiA+Cj4gPiA+ID4gV2UgaGF2
ZSBkaXNjdXNzZWQgdGhpcyBhIGZldyB0aW1lcyBidXQgdGhlcmUgaXMgYWxtb3N0IG5vIGNvbnNl
bnN1cwo+ID4gPiA+IG9mIHdoYXQgc2hvdWxkIGhhcHBlbiBuZXh0IGFuZCBub3RoaW5nIGNoYW5n
ZXMuCj4gPiA+ID4KPiA+ID4gPiBDb3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgYSBjbGVhciByZXBs
eT8gVGhlbiBJIGNhbiBtYWtlIHByb2dyZXNzIGZvcgo+ID4gPiA+IHRoZSBmb2xsb3dpbmcgc2Vy
aWVzOgo+ID4gPiA+Cj4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbG9vbmdhcmNoLzIw
MjUwOTE3MTEyNzE2LjI0NDE1LTEteWFuZ3RpZXpodUBsb29uZ3Nvbi5jbi8KPiA+ID4gRm9yIG1l
LCB0aGlzIHBhdGNoIGlzIE9LLCBpZ25vcmUgX19lZmlzdHViXyBwcmVmaXggaW4gb2JqdG9vbCBp
cyBhbHNvCj4gPiA+IE9LIFsxXS4gQnV0IEkgY2Fubm90IGFjY2VwdCB0aGUgd2F5IHRoYXQgbW9k
aWZ5aW5nIHRoZSBlZmlzdHViIHBhcnQKPiA+ID4gb25seSBmb3IgTG9vbmdBcmNoLgo+ID4gPgo+
ID4gPiBDbGVhciBlbm91Z2g/Cj4gPiA+Cj4gPgo+ID4gTG9vbmdBcmNoIGlzIHRoZSBvbmx5IGFy
Y2hpdGVjdHVyZSB3aGljaCBoYXMgdGhlIHByb2JsZW0sIHNvIEkgZG9uJ3QKPiA+IHNlZSBhIHJl
YXNvbiB0byBtb2RpZnkgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KPiBGcm9tIHlvdXIgcmVwbHkgSSB0
aGluayB0aGUgZWZpc3R1YiBjb2RlIGlzIGNvbXBsZXRlbHkgcmlnaHQsIGJ1dAo+IG9ianRvb2wg
Y2Fubm90IGhhbmRsZSB0aGUgIm5vcmV0dXJuIiBmdW5jdGlvbiBwb2ludGVyLiBBbmQgdGhpcyBw
YXRjaAo+IGlzIGEgd29ya2Fyb3VuZCByYXRoZXIgdGhhbiBhIHByb3BlciBmaXggKHNvIHlvdSBk
b24ndCB3YW50IHRvIHRvdWNoCj4gb3RoZXIgYXJjaGl0ZWN0dXJlcyksIHJpZ2h0Pwo+CgpUaGF0
IGlzIG15IHJlYXNvbmluZywgeWVzLiBCdXQgSm9zaCBpcyByaWdodCB0aGF0IGl0IHNob3VsZG4n
dCBtYWtlIGEKZGlmZmVyZW5jZSBpbiBwcmFjdGljZSwgSSBhbSBqdXN0IHJlbHVjdGFudCB0byBt
YWtlIGNoYW5nZXMgdG8gdGhlCmNvZGUgcnVubmluZyBvbiB0aGUgdGFyZ2V0IHRvIGFjY29tbW9k
YXRlIGEgZmxhd2VkIGJ1aWxkIHRpbWUgdG9vbC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
