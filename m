Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D896C021B1
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jAZNmm5y28ZLZ740dFOnnNdPRayRIgkO7bOkB/OSk9U=; b=WRuFC27yghQGBR
	h0FCup5S/SMUbEfP3qTC4AqYMrssDKcFalratlIdc2sKTc54omGYLFzWe4yY5ERrLdCHXs5LSzjMx
	EvrDsL70UWJ4Xf3YNpFBeh3WJZJu8bD0CLp7YlLDLbIymFRFcD/iMoK1ZFkvab85izElD5lugeckx
	/wPYpYCqo9koRZrVjvzKheqcfNQLpY9BsPyag0k+5dO1qMzxA8w1L2OzW10fwBqvW7v2IsnKAjpoZ
	M8VBPvDLOXN2JjKX0mAfMiWnBul67dGeCBvHUbdgCVOoPe0FjU1FDouup/l+Q/sXybqWXaeu6iQw+
	NKla3kt6NCX9DYw5Bnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3hG-00000000GI4-2LMO;
	Thu, 20 Feb 2025 10:22:22 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl3hE-00000000GGx-0l4c
	for linux-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 10:22:21 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-547bcef2f96so128498e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740046938; x=1740651738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=OWSQ/y89wHquQZDPIVWS3RSy97pT3nnqO+78cxWTkcNEG7E6mE70yUboydBqo8XuSw
         i46Om3hqxMgz4R1/4mqA+EUNNn2qmLrIF+KWPDMU/OVb+4OblDpeaZ/gQeKg9HylPtkk
         82rd/AsjvkeIJxzAZf7pNsM1Q885msi2XX097V5sScd3SYsf4iaPTuh33pIXiVvKpvbE
         I2ZyR27fq1XUJYL8F5ihgWNybhiBdyxXRzpRREjsZBuTJNj10apePU6BHr0/6ooGjMT9
         RsVLneWrgaaRSPd/+Ag2NxHBI3+8yIL4XHamN4MWSFxpcThkLBrU71g8qetIFVz5JlIS
         PDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046938; x=1740651738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkSjnPvhIdGSMhTbx4xuOa7rgF3IDrn9ZbqjQjQTkQo=;
        b=teHcSvSI4bJVbgmHNuF6qavuppTI4Knh3ED6LjY7G8h2iNwiQaPS/GTiH/P+08FzCN
         MIiSUKCxo1tLVrWAtIJQqvom4MGdsBQkxC6VuKdZstFrgzP3jG6IlovsGbI0fe5MtZoR
         1o/gOpqWqOM/CHCIMdZByftOI7gwD4ZZVPlOHiTNp2fFq+XX8icmKWlTEPO8tn/KK6qO
         UxvefXCOykUobmYFIy/ig46YH1Ixjap3cCZqa84BTUsUYlX581P3q8lc8KDueGWQYT2J
         G9MnjiHxFZ99m7ZBDuKRAV4QbO2ciIMamtmDq7UNEoza/AlSHknHQ0phuiCAWF9VL2x8
         MvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd31RYC1QzPT63EBlNYOfVS9HbhC3z8h3uk3fMkSDKsXRm/bDPePDP1x+crJxh36DoZWoNh557PxExLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwXcq0yqpwAm44RTlWLX446pr8ZXS3E6rKOTPraPSgOe2hFabL
	RzlOuTQ2QuBvhZt7wcrf0Ki7eAUSGLbpbT4ifF/6QS4fASbbKDsWtxfmS8DCNNR4900qeTSaEAL
	Oo8DcnViTMRX+z9SOT9GlnJVu6+nxeNe0QwrpzA==
X-Gm-Gg: ASbGnct2Fr2qoSxHM67XzPJoxWju9lcpLR0FCylKxwNZDHhei83w6JW2wvXXtgYWtTs
	cahi/tACf8vCV8F0AR27Yl4ZE5nqAasRIVQjcqpG9zTG5le8NlUWpH3F1knYZLcWBv/a19jL8jQ
	rAPUeYhs0uJmYKbPTcnj2Y3Ny9vB0=
X-Google-Smtp-Source: AGHT+IE7ycVVt1d8Epdhqngc45O4P0xrOwOQkPZv5wp+QGx6BPbp3JM32UOKdgqnWZwOei+ObE4ZSLIyhVDxExTl7Dg=
X-Received: by 2002:ac2:4c46:0:b0:545:bf4:4bc7 with SMTP id
 2adb3069b0e04-547243c348amr871274e87.19.1740046938079; Thu, 20 Feb 2025
 02:22:18 -0800 (PST)
MIME-Version: 1.0
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org> <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-1-2863ec3e7b67@gentoo.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Feb 2025 11:22:07 +0100
X-Gm-Features: AWEUYZkU7hdFlPspPbvUdBzoHfPqDtoAsaxfbkwGu_CSQGks7Gip_UiARp6sYIc
Message-ID: <CAMRc=MdGBTXRSAgY2vjOrqVVRzOyYh7N8yZsjK+W4cYFCQAwhQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] gpio: of: support to add custom add pin range function
To: Yixun Lan <dlan@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_022220_544815_6881E38D 
X-CRM114-Status: GOOD (  17.84  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jesse Taube <mr.bossman075@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBGZWIgMTcsIDIwMjUgYXQgMTo1OOKAr1BNIFlpeHVuIExhbiA8ZGxhbkBnZW50b28u
b3JnPiB3cm90ZToKPgo+IEV4cG9ydCBjdXN0b20gZnVuY3Rpb24gdG8gYWRkIGdwaW8gcGluIHJh
bmdlIGZyb20gcGluY3RybAo+IHN1YnN5c3RlbS4gVGhpcyB3b3VsZCBtYWtlIGl0IHBvc3NpYmxl
IHRvIGFkZCBwaW5zIHRvIG11bHRpCj4gZ3BpbyBjaGlwcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFlp
eHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1v
Zi5jICAgfCA1ICsrKystCj4gIGluY2x1ZGUvbGludXgvZ3Bpby9kcml2ZXIuaCB8IDcgKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi1vZi5jIGIvZHJpdmVycy9ncGlvL2dw
aW9saWItb2YuYwo+IGluZGV4IDJlNTM3ZWU5NzlmM2UyYjZlOGQ1Zjg2ZjNlMTIxYTY2ZjJhOGUw
ODMuLjY0YzhhMTUzYjgyM2Q2NWZhZWJlZDljNGNkODc5NTIzNTliNDI3NjUgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncGlvL2dwaW9saWItb2YuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvbGli
LW9mLmMKPiBAQCAtMTE3MCw3ICsxMTcwLDEwIEBAIGludCBvZl9ncGlvY2hpcF9hZGQoc3RydWN0
IGdwaW9fY2hpcCAqY2hpcCkKPiAgICAgICAgIGlmIChjaGlwLT5vZl9ncGlvX25fY2VsbHMgPiBN
QVhfUEhBTkRMRV9BUkdTKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPgo+IC0g
ICAgICAgcmV0ID0gb2ZfZ3Bpb2NoaXBfYWRkX3Bpbl9yYW5nZShjaGlwKTsKPiArICAgICAgIGlm
ICghY2hpcC0+b2ZfYWRkX3Bpbl9yYW5nZSkKPiArICAgICAgICAgICAgICAgY2hpcC0+b2ZfYWRk
X3Bpbl9yYW5nZSA9IG9mX2dwaW9jaGlwX2FkZF9waW5fcmFuZ2U7Cj4gKwo+ICsgICAgICAgcmV0
ID0gY2hpcC0+b2ZfYWRkX3Bpbl9yYW5nZShjaGlwKTsKPiAgICAgICAgIGlmIChyZXQpCj4gICAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9n
cGlvL2RyaXZlci5oIGIvaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oCj4gaW5kZXggMmRkN2Ni
OWNjMjcwYTY4ZGRlZGJjZGQ1ZDQ0ZTBkMGY4OGRmYTc4NS4uYTdiOTY2Yzc4YTJmNjIwNzVmYjc4
MDRmNmU5NjAyODU2NGRkYTE2MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dwaW8vZHJp
dmVyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L2dwaW8vZHJpdmVyLmgKPiBAQCAtNTI4LDYgKzUy
OCwxMyBAQCBzdHJ1Y3QgZ3Bpb19jaGlwIHsKPiAgICAgICAgICAqLwo+ICAgICAgICAgaW50ICgq
b2ZfeGxhdGUpKHN0cnVjdCBncGlvX2NoaXAgKmdjLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmdwaW9zcGVjLCB1MzIgKmZsYWdzKTsKPiAr
Cj4gKyAgICAgICAvKioKPiArICAgICAgICAqIEBvZl9hZGRfcGluX3JhbmdlOgo+ICsgICAgICAg
ICoKPiArICAgICAgICAqIENhbGxiYWNrIHRvIGFkZCBwaW4gcmFuZ2VzIGZyb20gcGluY3RybAo+
ICsgICAgICAgICovCgpQbGVhc2UsIG1ha2UgdGhlIEFQSSBjb250cmFjdCBtb3JlIHNwZWNpZmlj
OiBkZXNjcmliZSB0aGUgcmV0dXJuIHZhbHVlCmFuZCBjaGVjayBpdCBpbiB0aGUgY2FsbCBwbGFj
ZSBpZiBpdCBjYW4gcmV0dXJuIGVycm9ycy4KCkFsc286IGlzIHRoaXMgZXZlbiBPRi1zcGVjaWZp
YyBpZiBpdCBkb2Vzbid0IHRha2UgYW55IE9GIGFyZ3VtZW50PyBXaHkKbm90IGp1c3QgYWRkX3Bp
bl9yYW5nZSgpPwoKQmFydAoKCj4gKyAgICAgICBpbnQgKCpvZl9hZGRfcGluX3JhbmdlKShzdHJ1
Y3QgZ3Bpb19jaGlwICpjaGlwKTsKPiAgI2VuZGlmIC8qIENPTkZJR19PRl9HUElPICovCj4gIH07
Cj4KPgo+IC0tCj4gMi40OC4xCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
