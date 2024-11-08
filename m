Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFA2D64097
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 22:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Z5DEFwYzASrDc2Oc/5oWMj3Ii9W9hlYjPAQ/wn98d0=; b=mMQEOqyRQ5yBOi
	UjVQA/tSHehLekUs/pRpMbJo48L0XZiwxyulZ7eTBaU9s620213Ij5fVaQ5dk/0StsP7CXbjI+KJr
	gG2JWjgs6omddeiQfbV3drTD5pwBDb5zBXB0GEomru4D9kCLkt2rWC88BSgLjTzX7sdP1J+8rX76k
	HSI4H+ZYVoUIB9BspAgRgLqdTrpzWmSr6N3VG7/f/Z1PdbT48rvtNzUR/lZs3mmA26HlMEfqh/p/1
	OxzzDnpwW7+NGant1h5FkIM73gqpeBpSaSuPqXc2CzJuU8vKqo6aSdakqqunJ22pvGMgUg4uVK8XO
	j1LNES86jgJk2BwgkbEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XAx-0000000C5rC-1snP;
	Fri, 08 Nov 2024 22:09:55 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XAv-0000000C5qh-00RE
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 22:09:54 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso1873157a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 14:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731103792; x=1731708592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF3J8VkAH3cvtNnnPFvB9XV0zuboLFZCCqiQRLDaSx0=;
        b=BuCoq0YeI4DoyVS9xZZDgpOKQOR9dgOO+UkrG3VrEZ5rKceFk3OwSAXOgqGSxQJh9E
         DL3Cly1VNU+yIvhMfZwtvF7RXb+WcMbX1Hs7QDiSrLcE8B72JbIDG98pqlN/Fu0MIYGH
         5l4o1/xnSz207cCEBzf739qbIg4WPPJLOKNDlrD7JdhXViEVWJTXolH9HH+yw1DQe9GV
         FUGLFydeW60We6LphCZma6gz5heD6qOp4PuflLjhq1/4W4jpUHzNDYOX+613fTQoutLI
         OnpXs8QyjmyzWlqbl/disCW+aaotONYPzENx6b+6xB5XnUH3DqRTY+Gt8UF/pBE5tu+c
         GyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731103792; x=1731708592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF3J8VkAH3cvtNnnPFvB9XV0zuboLFZCCqiQRLDaSx0=;
        b=j0/1g1K55/dRLCWjnpWRI4RTkpJg9Hepx190/T5GMsfVk9YPso8e+8F5coQFEbRWPH
         /raM0hiyKxfhRl9schtbshDb/3mE20Xr3XCLRYRqpO69Cc2Db8SOrEv+/0Y/L5jrc8ea
         hmeOFX7/cJaTAGdH2Y9yE58vdWXW0VKF380Jf+Cy+ZZBdBvRH2855kUJsVGuJjA5YDul
         ECN83T3qBob8vX5Ze5AO5yVMwPyd2RvnBAlR/mfRtHxtnrfPRqIwliwlq2I7q/8E3c8U
         177eEpYGF/p6c1cgMh/TnK4FrS4UC26wBYEiKX8IrCzU9xFMwZ+5ZRNEPLU0AwBHDl9k
         Y+3w==
X-Forwarded-Encrypted: i=1; AJvYcCWrsxzhu61w3SQyfho/Ex8I+1vvLmUwM1oQ5ssNhDADMEamU8n7Iwhtxj5WVMScSEMEMC0QWbOqJnfp6A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1aN652ct+gufinOcBVMUY8L1hdguoscdaybrJd1LFJdnSKt60
	wVWiOL8qmRiHUh+LI2bF1VNMLGyitnIxy9PXdc/pHhfbR8Ms+y3ow35WMtraOD6Lipk4175dtYI
	FGf3IvBRlkIo2Rpzl+SaIyj0nFHE=
X-Google-Smtp-Source: AGHT+IFgJOTFb7QnLKqguH5RwFwGFJwcoFt7e2VEzQvwylUorflBkV9Ne6pUpikQ6ZsM1bsNSLSsMC3RlEhBG34XiXo=
X-Received: by 2002:a17:90b:1644:b0:2e2:b41b:8544 with SMTP id
 98e67ed59e1d1-2e9b1740eedmr6311641a91.21.1731103791894; Fri, 08 Nov 2024
 14:09:51 -0800 (PST)
MIME-Version: 1.0
References: <20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com>
In-Reply-To: <20241107-fix_handle_misaligned_load-v1-1-07d7852c9991@rivosinc.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 8 Nov 2024 17:09:16 -0500
Message-ID: <CAJFTR8RBcoqYmWNmNe_ZixO3bv2aP-wGCbX7ieorXYxxMAa7BA@mail.gmail.com>
Subject: Re: [PATCH for-next] riscv: Fix default misaligned access trap
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_140953_070652_B081C4A8 
X-CRM114-Status: GOOD (  14.22  )
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

T24gVGh1LCBOb3YgNywgMjAyNCBhdCA1OjM44oCvUE0gQ2hhcmxpZSBKZW5raW5zIDxjaGFybGll
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBDb21taXQgZDE3MDNkYzdiYzhlICgiUklTQy1WOiBE
ZXRlY3QgdW5hbGlnbmVkIHZlY3RvciBhY2Nlc3Nlcwo+IHN1cHBvcnRlZCIpIHJlbW92ZWQgdGhl
IGRlZmF1bHQgaGFuZGxlcnMgZm9yIGhhbmRsZV9taXNhbGlnbmVkX2xvYWQoKQo+IGFuZCBoYW5k
bGVfbWlzYWxpZ25lZF9zdG9yZSgpLiBXaGVuIHRoZSBrZXJuZWwgaXMgY29tcGlsZWQgd2l0aG91
dAo+IFJJU0NWX1NDQUxBUl9NSVNBTElHTkVEClRlY2huaWNhbGx5IENPTkZJR19SSVNDVl9NSVNB
TElHTkVELgpJIGFwcGFyZW50bHkgY2hhbmdlZCBgK29iai15ICs9IHRyYXBzX21pc2FsaWduZWQu
b2AgdG8KYCtvYmotJChDT05GSUdfUklTQ1ZfTUlTQUxJR05FRCkgKz0gdHJhcHNfbWlzYWxpZ25l
ZC5vYAppbiBWMiBhbmQgZGlkbid0IGNoYW5nZSB0aGF0IGNoZWNrIGJhY2sgb29wcyBzb3JyeS4K
Cj4gLCB0aGVzZSBoYW5kbGVycyBhcmUgbmV2ZXIgZGVmaW5lZCwgY2F1c2luZwo+IGNvbXBpbGF0
aW9uIGVycm9ycy4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUBy
aXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IEplc3NlIFRhdWJlIDxtci5ib3NzbWFuMDc1QGdt
YWlsLmNvbT4KCj4gRml4ZXM6IGQxNzAzZGM3YmM4ZSAoIlJJU0MtVjogRGV0ZWN0IHVuYWxpZ25l
ZCB2ZWN0b3IgYWNjZXNzZXMgc3VwcG9ydGVkIikKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9lbnRyeS1jb21tb24uaCB8IDEyICsrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZW50cnktY29tbW9uLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VudHJ5LWNvbW1vbi5oCj4g
aW5kZXggN2IzMmQyYjA4YmI2Li5jMjgwODU2MWRmODEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lbnRyeS1jb21tb24uaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZW50cnktY29tbW9uLmgKPiBAQCAtMjUsNyArMjUsMTkgQEAgc3RhdGljIGlubGluZSB2b2lk
IGFyY2hfZXhpdF90b191c2VyX21vZGVfcHJlcGFyZShzdHJ1Y3QgcHRfcmVncyAqcmVncywKPiAg
dm9pZCBoYW5kbGVfcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVncyk7Cj4gIHZvaWQgaGFu
ZGxlX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKTsKPgo+ICsjaWZkZWYgQ09ORklHX1JJU0NW
X1NDQUxBUl9NSVNBTElHTkVECj4gIGludCBoYW5kbGVfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBw
dF9yZWdzICpyZWdzKTsKPiAgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKTsKPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSBpbnQgaGFuZGxlX21pc2FsaWdu
ZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAgICAgcmV0dXJuIC0xOwo+
ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBoYW5kbGVfbWlzYWxpZ25lZF9zdG9yZShzdHJ1
Y3QgcHRfcmVncyAqcmVncykKPiArewo+ICsgICAgICAgcmV0dXJuIC0xOwo+ICt9Cj4gKyNlbmRp
Zgo+Cj4gICNlbmRpZiAvKiBfQVNNX1JJU0NWX0VOVFJZX0NPTU1PTl9IICovCj4KPiAtLS0KPiBi
YXNlLWNvbW1pdDogNzQ3NDFhMDUwYjc5ZDMxZDhkMmVlZWUxMmM3NzczNjU5NmQwYTZiMgo+IGNo
YW5nZS1pZDogMjAyNDExMDctZml4X2hhbmRsZV9taXNhbGlnbmVkX2xvYWQtOGJlODZjYjA4MDZl
Cj4gLS0KPiAtIENoYXJsaWUKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
