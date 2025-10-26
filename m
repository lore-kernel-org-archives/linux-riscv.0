Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8C5CCF9E5
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 11:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ft/Z9Z8jccgak67FA6BIY4zfBgwUSua6ttPoG3MsH0=; b=l6sNo9Kf+FKch+
	afZaiOHlL0e2IUTP/HSIZUjEvElPxMA+YcldREc6ezujQVas7/WvjLMQXhMneUx30Kmb6eYqRvg+t
	97c6MW6LnpHdIS8NJITQmE/zpvWO0ofCSgBAoW4e1yepXQQQxfTSZAFdsYFZ/0U6OlJjQfT3y4HPA
	rlQIsT3Z3SIQhYrVvAI6x6n6Cf9yCEmbAl+3j7JdW27jNPEr/htG9Z8sm4GvxE/KJmLlvQGeVgDC0
	UhUp/OfgIbpfKdfE3gV7EjSXnvpsHSb80MAhTIKsQ0eYCXbcYmVKoYHa6xaW26puNp//BpX23wD7A
	KmpGA+msiujaiXtfUmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCynJ-0000000CH8y-1V0X;
	Sun, 26 Oct 2025 11:20:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCynH-0000000CH8h-1irP
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 11:20:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 820616021A
	for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 11:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31873C116B1
	for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 11:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761477614;
	bh=WXhSsOHYlSratjyBUfDoyHGZ/FPtXvc0lOg0vqlrD54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZO0l5rCuPbIC/tMs2ZuC773iICJte/FhCsKJGvRLh/ebR5CG5S+VTY5XG4cXYGP6M
	 Z/s0dV9b87BHLomxqE3D5UB8YqEJDQMLXCjNhmL9oHg2FyALdelP52uznyqeTRAPMp
	 oBp5OEhpNRTOVFxf+2szgNMIw5nni1QkLzPtSsAco9J85vpSxJJ18yQu3skkx9ZV48
	 TeqeJWzUOU+ddhJvY63n21A1GJ/mL1Kp2KEUzUAQcILa1EYMOUZ9Xd4Ih7IKIH87W4
	 1ZcaMZsEhxOSBXmCN8UXXzR3oP/5iDBxJi5ii6DwIowMZaDj+Q9cssR22TrvUoAcqe
	 0vAyEzYFx5uSA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso7987139a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 04:20:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVH/bYg2rlJw2Lam/ZTprZCpI98i0Z40gXVVJXzWJJmLqe0QNYlBWpKPyNxxtSmM/qCDaovH2b4B1CUdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPEBExmrxVVVSJZKX0FsZPN8ANIJxZCDOFGy9elWVfFGACbozH
	Vce1ps3dSNW5WYMTqlgDpl/9TMJsQ9ICw3l9PJf0YU6ctWokOz+coOX0kR5oRDg9VDXkBTSPaFo
	ivwM5xvIZe5dyv1SGjR1xG01Km1bEGis=
X-Google-Smtp-Source: AGHT+IHSStRGe85V7TfWyZyzfF6Ya5hjYUTpONErQ3HLd1kUDYooXBrzJ4vLF95pyPPlWOudi0MNIFeRATeAXFEtvLQ=
X-Received: by 2002:a05:6402:2554:b0:63e:2d46:cc5d with SMTP id
 4fb4d7f45d1cf-63e3dff1673mr10711788a12.7.1761477612710; Sun, 26 Oct 2025
 04:20:12 -0700 (PDT)
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
 <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
In-Reply-To: <CAMj1kXGk0udgM67wrWqahqK8H0uE8emQj51SmJey+7fE-FTjdA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 26 Oct 2025 19:20:04 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnx7p3KGFn8w4CVpWUGoGvdUyYRdpas7DP247MZLQ7EzDz5RnfRwoldkjM
Message-ID: <CAAhV-H4c=vdNWO0v_mYL2xZ9FYjDyRDvt6f_kV4d8Bh=CRJniQ@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Ard Biesheuvel <ardb@kernel.org>
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgNDowN+KAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAyMyBPY3QgMjAyNSBhdCAxMDowMSwgSHVhY2Fp
IENoZW4gPGNoZW5odWFjYWlAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBPY3Qg
MjMsIDIwMjUgYXQgMjo1NeKAr1BNIFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNu
PiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgSm9zaCBhbmQgQXJkLAo+ID4gPgo+ID4gPiBPbiAyMDI1
LzEwLzIwIOS4i+WNiDI6NTUsIEh1YWNhaSBDaGVuIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgT2N0
IDIwLCAyMDI1IGF0IDk6MjTigK9BTSBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5j
bj4gd3JvdGU6Cj4gPiA+ID4+Cj4gPiA+ID4+IEhpIEpvc2gsIEFyZCBhbmQgSHVhY2FpLAo+ID4g
PiA+Pgo+ID4gPiA+PiBPbiAyMDI1LzEwLzE4IOS4iuWNiDE6MDUsIEpvc2ggUG9pbWJvZXVmIHdy
b3RlOgo+ID4gPiA+Pgo+ID4gPiA+PiAuLi4KPiA+ID4gPj4KPiA+ID4gPj4+IEJ1dCBJSVVDLCB0
aGUgbGlic3R1YiBjb2RlIHJ1bnMgKnZlcnkqIGVhcmx5LCBhbmQgd291bGRuJ3Qgc2hvdyB1cCBp
biBhCj4gPiA+ID4+PiBzdGFjayB0cmFjZSBhbnl3YXksIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHRy
YWNlcyBvZiBpdCBvbiB0aGUgc3RhY2sgb25jZQo+ID4gPiA+Pj4gaXQgYnJhbmNoZXMgdG8gaGVh
ZC5TIGNvZGUgKHdoaWNoIGRvZXNuJ3Qgc2F2ZSB0aGUgbGluayByZWdpc3RlcikuCj4gPiA+ID4+
Cj4gPiA+ID4+IFRoYW5rcyBmb3IgeW91ciBkaXNjdXNzaW9ucy4KPiA+ID4gPj4KPiA+ID4gPj4g
QXJlIHlvdSBPSyB3aXRoIHRoaXMgY3VycmVudCBwYXRjaD8KPiA+ID4gPiBGb3IgbWUgdGhlIGN1
cnJlbnQgcGF0Y2ggaXMganVzdCBPSy4KPiA+ID4KPiA+ID4gV2UgaGF2ZSBkaXNjdXNzZWQgdGhp
cyBhIGZldyB0aW1lcyBidXQgdGhlcmUgaXMgYWxtb3N0IG5vIGNvbnNlbnN1cwo+ID4gPiBvZiB3
aGF0IHNob3VsZCBoYXBwZW4gbmV4dCBhbmQgbm90aGluZyBjaGFuZ2VzLgo+ID4gPgo+ID4gPiBD
b3VsZCB5b3UgcGxlYXNlIGdpdmUgbWUgYSBjbGVhciByZXBseT8gVGhlbiBJIGNhbiBtYWtlIHBy
b2dyZXNzIGZvcgo+ID4gPiB0aGUgZm9sbG93aW5nIHNlcmllczoKPiA+ID4KPiA+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbG9vbmdhcmNoLzIwMjUwOTE3MTEyNzE2LjI0NDE1LTEteWFuZ3Rp
ZXpodUBsb29uZ3Nvbi5jbi8KPiA+IEZvciBtZSwgdGhpcyBwYXRjaCBpcyBPSywgaWdub3JlIF9f
ZWZpc3R1Yl8gcHJlZml4IGluIG9ianRvb2wgaXMgYWxzbwo+ID4gT0sgWzFdLiBCdXQgSSBjYW5u
b3QgYWNjZXB0IHRoZSB3YXkgdGhhdCBtb2RpZnlpbmcgdGhlIGVmaXN0dWIgcGFydAo+ID4gb25s
eSBmb3IgTG9vbmdBcmNoLgo+ID4KPiA+IENsZWFyIGVub3VnaD8KPiA+Cj4KPiBMb29uZ0FyY2gg
aXMgdGhlIG9ubHkgYXJjaGl0ZWN0dXJlIHdoaWNoIGhhcyB0aGUgcHJvYmxlbSwgc28gSSBkb24n
dAo+IHNlZSBhIHJlYXNvbiB0byBtb2RpZnkgb3RoZXIgYXJjaGl0ZWN0dXJlcy4KRnJvbSB5b3Vy
IHJlcGx5IEkgdGhpbmsgdGhlIGVmaXN0dWIgY29kZSBpcyBjb21wbGV0ZWx5IHJpZ2h0LCBidXQK
b2JqdG9vbCBjYW5ub3QgaGFuZGxlIHRoZSAibm9yZXR1cm4iIGZ1bmN0aW9uIHBvaW50ZXIuIEFu
ZCB0aGlzIHBhdGNoCmlzIGEgd29ya2Fyb3VuZCByYXRoZXIgdGhhbiBhIHByb3BlciBmaXggKHNv
IHlvdSBkb24ndCB3YW50IHRvIHRvdWNoCm90aGVyIGFyY2hpdGVjdHVyZXMpLCByaWdodD8KCgpI
dWFjYWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
