Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946ADCCD18A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=euouRXcXzqRKwGeFpmFW+8UsFql6R639rnGpIclAa5g=; b=omKZQKhG+1F1BQ
	+FTctM6De67LBMhUhrM4cQwIyaaabPWXxQHZkZYfrzmvfwkZb2IXplAvKKRkOmTIHD9sR7uYo+VU6
	1KRGfgYza9mObT7wdz/qMrdrQs1ueteSY9YvZN/lEnjqSYswDG3PiGapePTPS05u6mv8uj6NkCao/
	98oB6EQxNdqNf2Oaz5jQOi+PpTmxreNTMJX6l8YSYfFfVCT2M/JWzIw2t39nOIAwpLt5zj/sK+OaO
	wB+w2RPHVO6xrT98xFCOiM1Ws3sRP1fpDjJkpGoBY8jNh3Xe0+Kn2dk5YyoXVkg0vXmBQrfROc2YL
	AxbAYBQkk+KYicUlRTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Fwd-00000008yLu-0WfX;
	Fri, 10 Oct 2025 16:26:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Fwb-00000008yLD-05TS
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 16:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28ACA49BF5
	for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 16:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F33F1C19421
	for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760113571;
	bh=utKCZjeHw3iqnFfYB1ZfxGnO3UrPmvILiol4TqfBHR4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ifr5gpgl7oLwDoSrjSSuI0zeIwM1nRb3uRa3RBa2jbNUt9PPmOxDzZDFqVyPvhGcX
	 WyliYCSu7CXX1pxMu3PHD6Y1aAhblPEpsIsqPgEvAL6ftY3BseA4gtaP7J6dgKXrUJ
	 8DqCPlqniOPsbHKH89OgQ7vCcIRVbfOJ0kVt6nTbCMNsEBgsSyrN6GWYCYawGUGD6A
	 +umYAlXJOfreHakJgESAB+O3A8WDuPOatIMec9lkR9Nmdpz/jpJ4g6dOykHpKd9MAv
	 k7p2T1cdrCgYJmGUOZC3oUoLelrCCD3OMRtFXqFy99x4AH1QGdHi0K1umgzIh0I75B
	 4qjAMzB4frdNQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-58b025fce96so1987644e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 09:26:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUtn6TV8GA7y7dTQrDwZ422FKUyCXLOo2P6BH52gF1A5FW233a7UR+XOPxhiRGlhhzzs+3RqFCjGXmLPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJnhpb7eFZdf2itU28qNa66ZOlwFz7fk7SXlKtdYAtWqT3qA/h
	TU8W7FRWDEGHj9GLWYhORrYbF/Yb1jRPujydl8cvE9nBToYCnsQB/V8e4Abw454R0Bo/tjP2zKA
	f7Rlmd38JkisyPvCta36eitz5K0L6JzE=
X-Google-Smtp-Source: AGHT+IFlrMsUvrC/ZHyp7C1tmfy80lEWySBj/07SSrfUI6v7Q7I01eOrR8aE8CO2xnNLYI6LpFea10RRzC+bIaZdgH8=
X-Received: by 2002:a05:6512:1152:b0:57b:5794:ccd9 with SMTP id
 2adb3069b0e04-5906d77e26bmr3537150e87.9.1760113569266; Fri, 10 Oct 2025
 09:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com>
 <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
 <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com> <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
In-Reply-To: <fec0c03d-9d8c-89a3-886a-1adc22e59b66@loongson.cn>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 10 Oct 2025 09:25:57 -0700
X-Gmail-Original-Message-ID: <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
X-Gm-Features: AS18NWAp30BvVY9ZXh0_0XY6OhGFXDo-CTjUdGdhBNHw2LQ_EFhIlBfBfuAUJuI
Message-ID: <CAMj1kXFLyBbRL+pAAQ6be6dxqFPiyw_Ug8qNQWaicZQ235HE=A@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_092613_101940_07BF29EF 
X-CRM114-Status: GOOD (  22.45  )
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

T24gVGh1LCA5IE9jdCAyMDI1IGF0IDAwOjI3LCBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29u
Z3Nvbi5jbj4gd3JvdGU6Cj4KPiBPbiAyMDI1LzkvMjgg5LiL5Y2IMTA6NDEsIEFyZCBCaWVzaGV1
dmVsIHdyb3RlOgo+ID4gT24gU3VuLCAyOCBTZXB0IDIwMjUgYXQgMTY6MzksIEFyZCBCaWVzaGV1
dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gU3VuLCAyOCBTZXB0IDIw
MjUgYXQgMTU6NTIsIEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4+Pgo+ID4+PiBIaSwgQXJkLAo+ID4+Pgo+ID4+PiBPbiBTdW4sIFNlcCAyOCwgMjAyNSBhdCA5
OjQy4oCvUE0gQXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+
ID4+Pj4gT24gU3VuLCAyOCBTZXB0IDIwMjUgYXQgMTA6NTUsIFRpZXpodSBZYW5nIDx5YW5ndGll
emh1QGxvb25nc29uLmNuPiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+IFdoZW4gY29tcGlsaW5nIHdp
dGggTExWTSBhbmQgQ09ORklHX0xUT19DTEFORyBpcyBzZXQsIHRoZXJlIGV4aXN0cwo+ID4+Pj4+
IHRoZSBmb2xsb3dpbmcgb2JqdG9vbCB3YXJuaW5nIG9uIExvb25nQXJjaDoKPiA+Pj4+Pgo+ID4+
Pj4+ICAgIHZtbGludXgubzogd2FybmluZzogb2JqdG9vbDogX19lZmlzdHViX2VmaV9ib290X2tl
cm5lbCgpCj4gPj4+Pj4gICAgZmFsbHMgdGhyb3VnaCB0byBuZXh0IGZ1bmN0aW9uIF9fZWZpc3R1
Yl9leGl0X2Jvb3RfZnVuYygpCj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIGlzIGJlY2F1c2UgZWZpX2Jv
b3Rfa2VybmVsKCkgZG9lc24ndCBlbmQgd2l0aCBhIHJldHVybiBpbnN0cnVjdGlvbgo+ID4+Pj4+
IG9yIGFuIHVuY29uZGl0aW9uYWwganVtcCwgdGhlbiBvYmp0b29sIGhhcyBkZXRlcm1pbmVkIHRo
YXQgdGhlIGZ1bmN0aW9uCj4gPj4+Pj4gY2FuIGZhbGwgdGhyb3VnaCBpbnRvIHRoZSBuZXh0IGZ1
bmN0aW9uLgo+ID4+Pj4+Cj4gPj4+Pj4gQXQgdGhlIGJlZ2lubmluZywgdHJ5IHRvIGRvIHNvbWV0
aGluZyB0byBtYWtlIGVmaV9ib290X2tlcm5lbCgpIGVuZHMgd2l0aAo+ID4+Pj4+IGFuIHVuY29u
ZGl0aW9uYWwganVtcCBpbnN0cnVjdGlvbiwgYnV0IHRoaXMgbW9kaWZpY2F0aW9uIHNlZW1zIG5v
dCBwcm9wZXIuCj4gPj4+Pj4KPiA+Pj4+PiBTaW5jZSB0aGUgZWZpc3R1YiBmdW5jdGlvbnMgYXJl
IHVzZWxlc3MgZm9yIHN0YWNrIHVud2luZGVyLCB0aGV5IGNhbiBiZQo+ID4+Pj4+IGlnbm9yZWQg
Ynkgb2JqdG9vbC4gQWZ0ZXIgbWFueSBkaXNjdXNzaW9ucywgbm8gbmVlZCB0byBsaW5rIGxpYnN0
dWIgdG8KPiA+Pj4+PiB0aGUgdm1saW51eC5vLCBvbmx5IGxpbmsgbGlic3R1YiB0byB0aGUgZmlu
YWwgdm1saW51eC4KPiA+Pj4+Pgo+ID4+Pj4KLi4uCj4gQXJlIHlvdSBPSyB3aXRoIHRoZSBmb2xs
b3dpbmcgY2hhbmdlcz8KPgo+ICgxKSBsaWJzdHViIGRvZXNuJ3QgbGluayB0byB2bWxpbnV4Lm8s
IG9ubHkgbGluayBsaWJzdHViIHdpdGggdm1saW51eC5vCj4gZHVyaW5nIHRoZSBmaW5hbCB2bWxp
bnV4IGxpbmssIGtlZXAgdGhlIGNoYW5nZXMgY29uZmluZWQgdG8gTG9vbmdBcmNoLAo+IG5vIG5l
ZWQgdG8gYmUgc29tZXRoaW5nIG1vcmUgZ2VuZXJpYy4KPgo+IGRpZmYgLS1naXQgYS9hcmNoL2xv
b25nYXJjaC9NYWtlZmlsZSBiL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxlCj4gaW5kZXggZGM1YmQz
ZjFiOGQyLi5mMzRiNDE2ZjVjYTIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvTWFrZWZp
bGUKPiArKysgYi9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+IEBAIC0xNjksNyArMTY5LDYgQEAg
Q0hFQ0tGTEFHUyArPSAkKHNoZWxsICQoQ0MpICQoS0JVSUxEX0NQUEZMQUdTKQo+ICQoS0JVSUxE
X0NGTEFHUykgLWRNIC1FIC14IGMgL2Rldgo+ICAgZW5kaWYKPgo+ICAgbGlicy15ICs9IGFyY2gv
bG9vbmdhcmNoL2xpYi8KPiAtbGlicy0kKENPTkZJR19FRklfU1RVQikgKz0gJChvYmp0cmVlKS9k
cml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2xpYi5hCj4KPiAgIGRyaXZlcnMteSAgICAgICAg
ICAgICAgKz0gYXJjaC9sb29uZ2FyY2gvY3J5cHRvLwo+Cj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
bGluay12bWxpbnV4LnNoIGIvc2NyaXB0cy9saW5rLXZtbGludXguc2gKPiBpbmRleCA0MzM4NDlm
Zjc1MjkuLmVkOTQ4NzFjMzYwNiAxMDA3NTUKPiAtLS0gYS9zY3JpcHRzL2xpbmstdm1saW51eC5z
aAo+ICsrKyBiL3NjcmlwdHMvbGluay12bWxpbnV4LnNoCj4gQEAgLTY5LDYgKzY5LDEyIEBAIHZt
bGludXhfbGluaygpCj4gICAgICAgICAgICAgICAgICBsaWJzPSIke0tCVUlMRF9WTUxJTlVYX0xJ
QlN9Igo+ICAgICAgICAgIGZpCj4KPiArICAgICAgIGlmIFsgIiR7U1JDQVJDSH0iID0gImxvb25n
YXJjaCIgXTsgdGhlbgo+ICsgICAgICAgICAgICAgICBpZiBpc19lbmFibGVkIENPTkZJR19FRklf
U1RVQjsgdGhlbgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxpYnM9IiR7bGlic30gZHJpdmVy
cy9maXJtd2FyZS9lZmkvbGlic3R1Yi9saWIuYSIKPiArICAgICAgICAgICAgICAgZmkKPiArICAg
ICAgIGZpCj4gKwo+ICAgICAgICAgIGlmIGlzX2VuYWJsZWQgQ09ORklHX0dFTkVSSUNfQlVJTFRJ
Tl9EVEI7IHRoZW4KPiAgICAgICAgICAgICAgICAgIG9ianM9IiR7b2Jqc30gLmJ1aWx0aW4tZHRi
cy5vIgo+ICAgICAgICAgIGZpCj4KPiAoMikgcmVtb3ZlIHRoZSBhdHRyaWJ1dGUgX19ub3JldHVy
biBmb3IgcmVhbF9rZXJuZWxfZW50cnkoKSBhbmQgYWRkCj4gIndoaWxlICgxKTsiIGF0IHRoZSBl
bmQgb2YgZWZpX2Jvb3Rfa2VybmVsKCkuCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2Fy
ZS9lZmkvbGlic3R1Yi9sb29uZ2FyY2guYwo+IGIvZHJpdmVycy9maXJtd2FyZS9lZmkvbGlic3R1
Yi9sb29uZ2FyY2guYwo+IGluZGV4IDM3ODJkMGExODdkMS4uZTMwOWZkNzhmY2E3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xpYnN0dWIvbG9vbmdhcmNoLmMKPiArKysgYi9k
cml2ZXJzL2Zpcm13YXJlL2VmaS9saWJzdHViL2xvb25nYXJjaC5jCj4gQEAgLTEwLDcgKzEwLDcg
QEAKPiAgICNpbmNsdWRlICJlZmlzdHViLmgiCj4gICAjaW5jbHVkZSAibG9vbmdhcmNoLXN0dWIu
aCIKPgo+IC10eXBlZGVmIHZvaWQgX19ub3JldHVybiAoKmtlcm5lbF9lbnRyeV90KShib29sIGVm
aSwgdW5zaWduZWQgbG9uZyBjbWRsaW5lLAo+ICt0eXBlZGVmIHZvaWQgKCprZXJuZWxfZW50cnlf
dCkoYm9vbCBlZmksIHVuc2lnbmVkIGxvbmcgY21kbGluZSwKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN5c3RhYik7Cj4KPiAgIGVmaV9z
dGF0dXNfdCBjaGVja19wbGF0Zm9ybV9mZWF0dXJlcyh2b2lkKQo+IEBAIC04MSw0ICs4MSw3IEBA
IGVmaV9zdGF0dXNfdCBlZmlfYm9vdF9rZXJuZWwodm9pZCAqaGFuZGxlLAo+IGVmaV9sb2FkZWRf
aW1hZ2VfdCAqaW1hZ2UsCj4KPiAgICAgICAgIHJlYWxfa2VybmVsX2VudHJ5KHRydWUsICh1bnNp
Z25lZCBsb25nKWNtZGxpbmVfcHRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHVuc2ln
bmVkIGxvbmcpZWZpX3N5c3RlbV90YWJsZSk7Cj4gKwo+ICsgICAgICAgLyogV2Ugc2hvdWxkIG5l
dmVyIGdldCBoZXJlICovCj4gKyAgICAgICB3aGlsZSAoMSk7Cj4gICB9Cj4KCldoeSBkbyB3ZSBu
ZWVkIGJvdGggKDEpIGFuZCAoMik/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
