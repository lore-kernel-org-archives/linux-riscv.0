Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31098C61D97
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 05:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJDpc3ROmNDXvwQOajYCFlo5PMxxB4gyBeZJ1Wm3CYk=; b=vGgi1DsUtgrhrr
	+XxiOcunpSV/FDOXtLTkg5R8+SN6EDifuvRaK9ISSzCH5ZJuHRv3vnW7DRvdrnRtAkz9W+/0TgErM
	6nvngSABL+DgM8xkO1xUHcTF4dTYQJhyQq9LwqUJ/o2jOjrAjMpVkaPQBMuwLXX11v9nQ3HqrVS6b
	qKbOQJTfsJysfSFS86oqBkeoy3HkQ6oBmPLfxszHXJB6s+L3eZrqTmdhL3pJtVy4Kdclu59f/5zk5
	bXZFALYgVzWa7v0oCguF+yTKwCC9HkKJur+Iau2OideLso5O5wxp/xDqVe65wdXeSywbpPOBxwbqP
	GBRr69eZ/RQlDN7AV75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ONf-006AE7-1i;
	Fri, 24 Nov 2023 05:05:31 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ONb-006ADi-2w
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 05:05:29 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so943246fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 21:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700802326; x=1701407126; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSqVVlNqay+tkbRQW9+dH1P4yW/ANJSftxzN49AnClI=;
        b=pbLn5zp+t7zirR9qzekquIYZ/7VLWA+FO+ekshs6Z+25Ka5HKtyDDYse8PhF6yUefO
         BhPujDy7OmNKVYq2El/1na+MwPOTVshb1IRH/GqKZxshbEyNGtWLOka7kYBqkc78nlTZ
         TqqoKlQlCT1zHtYXuSRXAEhQ6gcCYIgPFyHik6OY4fxIgV63NrVksbuhGdjY4D24ft8u
         drLqRL7/t0RNKkxeqY3sl0CeF3z9bLpkWSpvyzw8K/3Am39pzFFyzf3413mPX1c8gz01
         Ytl6M4zAP6lm6QQh39QSYkK6bJIUDQN29pEUVVy/KMexISTk8u4X0q3NOU9WELJwa02i
         KT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700802326; x=1701407126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSqVVlNqay+tkbRQW9+dH1P4yW/ANJSftxzN49AnClI=;
        b=hwPONGlheNqEMHkA250C52Wiq8LYya2IxiOEKY1ittNEYkxjWyNSN0y80I+80Ltxtx
         cmpN/qT4fRimD8w/Yr2eTEHzuvUQCjKpd+lRoyOkTj2m/S7xRVtpnKzALWUQsTqGGoUN
         ZDkSxOALOCmBn8EgqZmoInHTJqqwG4QVHBnpOpCnx1NLX01lab9u2bgrsH08yutC/Ju+
         j2vptHQF4MhBeh9twqshj/RfaqPsFXbEKZik9rQKHK6fon6zDIh3vfT2zqTB5ZokD5v1
         TP9qUe+Ym/0XTXX2KpzEaqvIWwUXvXLuEaK7RZH3WqbrftMyN8K91mHF3+ZzHUoCvnbN
         x6qg==
X-Gm-Message-State: AOJu0YzrSs+s9OoboPfF6f8Ndr0l0LRXGGG1vLjTjYgVpsSCdycUW1+8
	UjUsyb1UHEGlQnNjP9spkq+U0BOctD+LDmF0CNyT1Q==
X-Google-Smtp-Source: AGHT+IFB5hLdEj2Vo3fmacGt2M6/9IlhJVsJ7X1oKygLIIziwPw2RA7a2JJFveCBHs2/AbOlS1f1+OTbypCtVFPqtnI=
X-Received: by 2002:a05:6871:5315:b0:1f9:a468:dd01 with SMTP id
 hx21-20020a056871531500b001f9a468dd01mr2133739oac.53.1700802325856; Thu, 23
 Nov 2023 21:05:25 -0800 (PST)
MIME-Version: 1.0
References: <MEYP282MB3659BA22E1535379D06A0D3583B8A@MEYP282MB3659.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <MEYP282MB3659BA22E1535379D06A0D3583B8A@MEYP282MB3659.AUSP282.PROD.OUTLOOK.COM>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 24 Nov 2023 10:35:14 +0530
Message-ID: <CAK9=C2V4Gkx6tcymNdm=WmPv+vqFgJ=0hm2hrPw7kS0qGP79yg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] irqchip: Add RISC-V advanced PLIC driver
To: =?UTF-8?B?6LCiIOazog==?= <xiebo_60@live.com>
Cc: "Alistair.Francis@wdc.com" <Alistair.Francis@wdc.com>, "anup@brainfault.org" <anup@brainfault.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_210527_975878_D41DD3E9 
X-CRM114-Status: GOOD (  11.51  )
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

T24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgODozM+KAr0FNIOiwoiDms6IgPHhpZWJvXzYwQGxpdmUu
Y29tPiB3cm90ZToKPgo+IEhlbGxvIGFsbCwKPgo+Cj4gSSBoYXZlIGEgcXVlc3Rpb24gcmVnYXJk
aW5nIHRoZSBoYW5kbGluZyBvZiBwb3RlbnRpYWwgaXNzdWVzIGR1cmluZyB0aGUgTVNJIGludGVy
cnVwdCBzZW5kaW5nIHByb2Nlc3MuIEl0IGFwcGVhcnMgdGhhdCBpZiB0aGUgQVBMSUMgdGFyZ2V0
IHJlZ2lzdGVyJ3MgdmFsdWUgaXMgbW9kaWZpZWQgZHVyaW5nIHRoZSBNU0kgaW50ZXJydXB0IHNl
bmRpbmcgcHJvY2VzcywgaXQgY291bGQgcG90ZW50aWFsbHkgbGVhZCB0byBNU0kgaW50ZXJydXB0
IHNlbmQgZmFpbHVyZXMuIFRoZSBjb2RlIGRvZXNuJ3Qgc2VlbSB0byBhY2NvdW50IGZvciB0aGlz
IHNjZW5hcmlvIG9yIHRha2UgYXBwcm9wcmlhdGUgbWVhc3VyZXMuCj4KPiBJIGFtIHJlYWNoaW5n
IG91dCB0byBzZWVrIGNsYXJpZmljYXRpb24gb24gd2hldGhlciB0aGlzIHNpdHVhdGlvbiBoYXMg
YmVlbiBjb25zaWRlcmVkIGFuZCBpZiB0aGVyZSBhcmUgc3BlY2lmaWMgcmVhc29ucyBmb3Igbm90
IGFkZHJlc3NpbmcgaXQgaW4gdGhlIGNvZGUuIFlvdXIgaW5zaWdodHMgaW50byB0aGlzIG1hdHRl
ciB3b3VsZCBiZSBoaWdobHkgYXBwcmVjaWF0ZWQuCj4KPiBUaGFuayB5b3UgZm9yIHlvdXIgdGlt
ZSwgYW5kIEkgbG9vayBmb3J3YXJkIHRvIHlvdXIgcmVzcG9uc2UuCgpUaGlzIGhhcyBiZWVuIHRh
a2VuIGNhcmUgb2YgaW4gdGhlIElNU0lDIGRyaXZlciBpbiB0aGUgaXJxX3NldF9hZmZpbml0eSgp
CmJlY2F1c2UgdGhlIElNU0lDIGRyaXZlciBtYW5hZ2VzIHRoZSByZS13cml0aW5nIG9mIE1TSSBt
ZXNzYWdlcwp1cG9uIElSUSBhZmZpbml0eSBjaGFuZ2VzLgoKUGxlYXNlIGxvb2sgYXQgUEFUQ0g3
IGFuZCBQQVRDSDggb2YgdGhlICJbUEFUQ0ggdjExIDAwLzE0XSBMaW51eApSSVNDLVYgQUlBIFN1
cHBvcnQiIHNlcmllcy4KKFJlZmVyLCBodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9kZXZp
Y2V0cmVlL21zZzY0Mzc2NC5odG1sKQoKUmVnYXJkcywKQW51cAoKPgo+IEJlc3QgcmVnYXJkcwo+
Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
