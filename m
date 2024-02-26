Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20292C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 06:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Xd1ukD3Nz84PA0NL6Ge0Eu2D01JAjNzlV7lm0fz/Cw=; b=M7jzjcdNwZlYzz
	0cVb7nFiNlWbyDVfN2YM3hDW7X0JM2qO8z+3ULEMbP6SLHiYmRiFb6TefIhpvfTpQJUbr4aypLs+p
	lanPXTO+6GJovdAILAhPIpsKDsGL7itYK4249S7vwmuw+B6qDTrUmM49zrz1A7gRpGQVtJB82Xwv8
	CVpooBnL+OOxwTPBn7U45LNj5+dFCgXPNQcXlry2opsByDAzOGdl4r2OcnUd/RKgDFxLrRjGqppG1
	UitwrscqL9vul5bAJBCk5jeXRdovFiMFra8iuUWkxQ6Qtab6NxT+LCmKdw0FUuybemy4kI5ZjkNn2
	K39cmJJCnNom1nMVyi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reUO4-0000000GdrZ-26PW;
	Mon, 26 Feb 2024 06:22:52 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reUO1-0000000GdqH-2jAu
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 06:22:50 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2436586276.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Feb 2024 22:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708928566; x=1709533366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6uQ6p4wrPGEQaea08zy1g4beS3iVKslS9jUud4LuLo=;
        b=VbRmTJ7YO9vWoFkvhw7V/V2HcenOw4Izk5TgWMbV2EqSOS2kXvOhpiYbjvK2+9KkIH
         kWwshfu/+jGuAYEg8hZPhAv179m2ZC5HC+ObCsKWY3Yo3QGyA8cqlHFi9KJ/peAS8Cvk
         HpqTGsvKhbN136/82yNyB7JJidYGoJSIujzaK66HCOQ0j6KvjebGDIP/2YF5eQJmt5vq
         6E0QseJX2M7VQczVKmA7NqozEXjl1/VqiiAkFJJuDRv1PXjOTpYCP0Z3F+FsIfqzieX1
         H/+dPv6JgiyplHMhoaxllP9zC20kS60xBG1/R6TNu4YcxI86UlJAEroQ/Cxjrkn96jNU
         rGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708928566; x=1709533366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6uQ6p4wrPGEQaea08zy1g4beS3iVKslS9jUud4LuLo=;
        b=p66aPmrg/Q4+Nwfec59gJkQ6dQ35CA2AahbwnDOjmi4iS4baWbUDnH47zF/ZLI0lq6
         eNUYWWyP9yKk2THdrQmFKnvQS9flxm03vSJndDARHb1UGtdJQpaf7fcIfU6LJtvoc6eZ
         aFUIRITCM7d8Pn2TKP6DOZGKlURsB8ctu7wSLU3GzJVZn66pq6MhgwzY0z8k9WVmrYKF
         kBFsRRYLW+DIb2WQxwo4RWvB8l8vlkIhpYanaalNEJJ3s6l5g37DK2hnAgwgyvSute+u
         LnyoUYl7PcqLMCpdwHjLOF11YoQpbkAKag3VwUvXy9CQr7t9vZ2yCxVaoSr4Srcax8MB
         KnuA==
X-Forwarded-Encrypted: i=1; AJvYcCXdN3ppf/yjW7qftwAtt4rrwytVxFWmkaWpCCvqITaH9V1m+WDev0Zr2vcJqC5u1/wYRReq/7wnORhdXAKaYmdmQQTpjP8/jO0PGQvjC3Be
X-Gm-Message-State: AOJu0YwsMUXrlEUHXIIt2aEHSsKlxbhWgVlHrxjSjgQ3K/MRcmdyWe+b
	vtbZulqf2oWQt21wzUbtSLQHTCrYcVOBS2pUCXVOn34S9J/lRzdH5I68vnDFaVd9bJjuI2qlniK
	TqjLZsYBqifKE1Tk2wOemHTb7k7q1mIyLH5q/FQ==
X-Google-Smtp-Source: AGHT+IGuVwNNtNKAUOe7ESvnHt1NkLshjz76YKDlhI9ojfgZqrAObfd1QuyHoNHa5ra3UdBQeDo2NcaGJ6UUutD5RdM=
X-Received: by 2002:a25:3618:0:b0:dc2:45af:aa5b with SMTP id
 d24-20020a253618000000b00dc245afaa5bmr3427311yba.59.1708928565840; Sun, 25
 Feb 2024 22:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20240201065932.19899-1-andy.chiu@sifive.com> <2f1b1262-8c32-4dd5-8052-d47682c0b1f6@kernel.org>
In-Reply-To: <2f1b1262-8c32-4dd5-8052-d47682c0b1f6@kernel.org>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 26 Feb 2024 14:22:34 +0800
Message-ID: <CABgGipUzTp70j+8UxgURhNU81S_UWNd8dd75pvytzC0GkMCRfA@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: manage irq with spin_lock_irqsave in SiFive console
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, gregkh@linuxfoundation.org, paul.walmsley@sifive.com, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_222249_734714_1FB98145 
X-CRM114-Status: GOOD (  25.71  )
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

T24gVGh1LCBGZWIgMSwgMjAyNCBhdCAzOjIx4oCvUE0gSmlyaSBTbGFieSA8amlyaXNsYWJ5QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDEuIDAyLiAyNCwgNzo1OSwgQW5keSBDaGl1IHdyb3Rl
Ogo+ID4gSXQgaXMgbm90IHNhZmUgdG8gY2FsbCBzcGluX2xvY2soKSB3aXRoIGlycSBkaXNhYmxl
ZCBvbiBSVC1saW51eC4KPiA+IEluc3RlYWQsIHRyYW5zZmVyIHRoZSBjb2RlIHNlZ21lbnQgdG8g
c3Bpbl9sb2NrX2lycXNhdmUgdG8gbWFrZSBpdCB3b3JrCj4gPiBvbiBib3RoIFJUIGFuZCBub24t
UlQgbGludXguCj4KPiBIaSwKPgo+IGhhdmUgeW91IGludmVzdGlnYXRlZCB3aGF0IGlzIHByb3Rl
Y3RlZCBieSB0aGUgbG9jYWxfaXJxX3NhdmUoKSBpbgo+IHRoZXJlPyBUaGUgbG9jayBpcyBub3Qg
YWx3YXlzIHRha2VuLCBPVE9IIHRoZSBpbnRlcnJ1cHRzIGFyZSBhbHdheXMKPiBkaXNhYmxlZC4K
Ckkgd2FzIHJlZmVyZW5jaW5nIHNvbWUgc2VyaWFsIGRyaXZlcnMgKG9tYXAsIHBsMDExKSBjaGFu
Z2VzIG9uIHRoZQpsaW51eC1ydCBwYXRjaCBzZXJpZXMgYW5kIHByb3ZpZGUgbG9naWNhbGx5IHRo
ZSBzYW1lIGNoYW5nZSBoZXJlLiBGb3IKYWxsIG9vcHMgY2FzZXMgSSd2ZSBmb3VuZCwgcGFuaWMo
KSBpdHNlbGYgZGlzYWJsZXMgaXJxIGJlZm9yZSBjYWxsaW5nCmBidXN0X3NwaW5sb2NrcygxKWAu
IEFyY2hpdGVjdHVyZSBkZXBlbmRlbnQgYGRpZSgpYCBvbiByaXNjdiBhbHNvCm1hc2tzIG9mZiBp
cnEgd2l0aCBhIHNwaW5fbG9ja19pcnEoKSBiZWZvcmUgY2FsbGluZyBidXN0X3NwaW5sb2Nrcygx
KS4KU2hvdWxkIHdlIG1ha2UgU0VSSUFMX1NJRklWRSBkZXBlbmQgb24gUklTQ1YgaW4gS2NvbmZp
ZyBmb3IgdGhpcz8KCkhvd2V2ZXIsIEkgYW0gbm90IHZlcnkgY2VydGFpbiBhYm91dCB0aGUgc3lz
cnEgcGFydCBoZXJlLiBBY2NvcmRpbmcgdG8KdGhlIHBhdGNoIG9uIGxpbnV4LXJ0LCBpdCBzYXlz
IGlycXMgYXJlIGFscmVhZHkgZGlzYWJsZWQgaWYgdGhlCmNvbnNvbGVfd3JpdGUgY29tZXMgZnJv
bSBzeXNycSBoYW5kbGluZy4gT25lIGRpZmZlcmVuY2UgSSBub3RpY2VkIGlzCnRoYXQgdGhlIHNp
Zml2ZSBjb25zb2xlIGRvZXMgbm90IHN1cHBvcnQgbWFnaWMgc3lzcnEsIHdoaWxlIHRoZSBvdGhl
cnMKZG8gc3VwcG9ydC4gQW5kIGl0IHNlZW1zIGxpa2UgdGhlIGNvbmRpdGlvbiBjaGVjayBgc3Nw
LT5wb3J0LnN5c3JxYCBpbgpzaWZpdmUgc2VyaWFsIGlzIG5ldmVyIHRydWUsIGJ1dCBtYXliZSBJ
IGp1c3Qgb3Zlcmxvb2tlZCBzb21ldGhpbmcuCgorIFRob21hcwpIaSBUaG9tYXMsIGRvIHlvdSB0
aGluayB0aGUgc2lmaXZlIGNvbnNvbGUgZHJpdmVyIG5lZWRzIHRoZSBjaGFuZ2UKaGVyZSBmb3Ig
UlQ/IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvdGhlcndpc2U/Cgo+Cj4gSSBiZWxpZXZl
IHRoZSBmaXggaXMgbm90IGFzIGVhc3kgYXMgaXMgcHJlc2VudGVkIGJlbG93Lgo+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAg
IGRyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyB8IDggKysrLS0tLS0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2
ZS5jCj4gPiBpbmRleCBmYTRjOTMzNjkyNGYuLjNmMGRkZjhiZmE3YiAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYwo+ID4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFs
L3NpZml2ZS5jCj4gPiBAQCAtNzg4LDEzICs3ODgsMTIgQEAgc3RhdGljIHZvaWQgc2lmaXZlX3Nl
cmlhbF9jb25zb2xlX3dyaXRlKHN0cnVjdCBjb25zb2xlICpjbywgY29uc3QgY2hhciAqcywKPiA+
ICAgICAgIGlmICghc3NwKQo+ID4gICAgICAgICAgICAgICByZXR1cm47Cj4gPgo+ID4gLSAgICAg
bG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwo+ID4gICAgICAgaWYgKHNzcC0+cG9ydC5zeXNycSkKPiA+
ICAgICAgICAgICAgICAgbG9ja2VkID0gMDsKPiA+ICAgICAgIGVsc2UgaWYgKG9vcHNfaW5fcHJv
Z3Jlc3MpCj4gPiAtICAgICAgICAgICAgIGxvY2tlZCA9IHNwaW5fdHJ5bG9jaygmc3NwLT5wb3J0
LmxvY2spOwo+ID4gKyAgICAgICAgICAgICBsb2NrZWQgPSBzcGluX3RyeWxvY2tfaXJxc2F2ZSgm
c3NwLT5wb3J0LmxvY2ssIGZsYWdzKTsKPiA+ICAgICAgIGVsc2UKPiA+IC0gICAgICAgICAgICAg
c3Bpbl9sb2NrKCZzc3AtPnBvcnQubG9jayk7Cj4gPiArICAgICAgICAgICAgIHNwaW5fbG9ja19p
cnFzYXZlKCZzc3AtPnBvcnQubG9jaywgZmxhZ3MpOwo+ID4KPiA+ICAgICAgIGllciA9IF9fc3Nw
X3JlYWRsKHNzcCwgU0lGSVZFX1NFUklBTF9JRV9PRkZTKTsKPiA+ICAgICAgIF9fc3NwX3dyaXRl
bCgwLCBTSUZJVkVfU0VSSUFMX0lFX09GRlMsIHNzcCk7Cj4gPiBAQCAtODA0LDggKzgwMyw3IEBA
IHN0YXRpYyB2b2lkIHNpZml2ZV9zZXJpYWxfY29uc29sZV93cml0ZShzdHJ1Y3QgY29uc29sZSAq
Y28sIGNvbnN0IGNoYXIgKnMsCj4gPiAgICAgICBfX3NzcF93cml0ZWwoaWVyLCBTSUZJVkVfU0VS
SUFMX0lFX09GRlMsIHNzcCk7Cj4gPgo+ID4gICAgICAgaWYgKGxvY2tlZCkKPiA+IC0gICAgICAg
ICAgICAgc3Bpbl91bmxvY2soJnNzcC0+cG9ydC5sb2NrKTsKPiA+IC0gICAgIGxvY2FsX2lycV9y
ZXN0b3JlKGZsYWdzKTsKPiA+ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgm
c3NwLT5wb3J0LmxvY2ssIGZsYWdzKTsKPiA+ICAgfQo+ID4KPiA+ICAgc3RhdGljIGludCBfX2lu
aXQgc2lmaXZlX3NlcmlhbF9jb25zb2xlX3NldHVwKHN0cnVjdCBjb25zb2xlICpjbywgY2hhciAq
b3B0aW9ucykKPgo+IC0tCj4ganMKPiBzdXNlIGxhYnMKPgoKUmVnYXJkcywKQW5keQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
