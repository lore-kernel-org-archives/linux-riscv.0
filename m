Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A03DC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 12:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O13D8ykFkDzUkHNcAXj3qZW/VQ1GsU74XIS9B8wlV0=; b=nLjlbM9s3FvB4V
	1T2dh6DMV6oFUKKQEPTRGv+OAktdQoi7GOOVEvQNw8hqVkex5rpaZS14K0PqYJTgC4Dmn+ViqHTqc
	paFWkt+NIJe+bYN7b+4KMYgqVNuDfRVbOCQMW54DKqC424ORTZbapBoJs9MIWVZFylcx+LjRTup8a
	mxBdRUOBeZhU02ovGoQTWf/LozpFDPB7+b8xtuiyeAh01YJlxW4qu7zhz9Gra5aW1Eb6Gdql2goks
	9Z1hVZ5PJbvcb6ni+YzYoq/ItoSWDmdRYZZjHo0Kg3oQs38adLr1gOihjlGy1ZF1YccmZY7emYo1Q
	8a/Zg94O0Qu9sx/TvHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1n2A-00000006PIE-2Smc;
	Tue, 30 Apr 2024 12:56:34 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1n20-00000006PCg-0LH4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 12:56:26 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-5aa22ebd048so4194016eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714481782; x=1715086582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEcbumoG8mFeFOR+Sn33r5OH+UDAizNlcDv3WNfEWC4=;
        b=itzGiDHst8eaZYha24RcfWIDJvdc8mspEyAhybiWJmARSVSi/dmS0VIRY168T5C8gK
         cvW8nKXLNKvDJAO719pKOzUpiJ6K+69d7gD1ej9zMx+7RZPI697HEcDK+7T0N02TP2qd
         x1HIos6Fcx8AZrl3NfSKbz/18xSIouLUQMttSHiMqUftbmMdFrfvm9YlJXjzAnM1s7cc
         6OCcp4cdO1AXlpnfly36ZwQ35HFNREDjBGBvoTA8BQfyBN4K1mryMXGuNAemlvXpjxSh
         RNa7U5hStH5HInWRRRKx3DwRJfZkFM3rrtjK4hv4K1H9HhGytnP6Vhyr2nJgca3GfjLa
         ph2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481782; x=1715086582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEcbumoG8mFeFOR+Sn33r5OH+UDAizNlcDv3WNfEWC4=;
        b=fVG9iHauSNQ0s3T+JNLPrg5Grco6j0Yr6wkT17ejl9/1kr8DoPOLju15DfGlzMkLDQ
         aV7V8zNxj0GFCheTvqJWnz9gUpK0jyViyhh9VCN9cz8nbjX59Rty9wmLRLYOdelxkmnI
         EzVxvUMJJ+Ag45Kfdj+c03Qj4wUwJteu/LHMO9rke2XeUrmjkRqFfjwLd512n9uqzR0e
         DjjWwqDma40aSNnGMkhXu1clvUdIdzHYqABPm98P3qfTHozyPzM8+m2RCk0xXFcLpsVC
         ipqXmlrWH57NdePKun4wF7JcBSdFf5XXtZ09+KY8cTbBCSl2priWBzvjNCB6ZP1w9gl9
         Ub5g==
X-Forwarded-Encrypted: i=1; AJvYcCWjYB+HRmuAKQwDYCOySUjUB9DNUw9P8oMyG6juNGzYsM52CwHOZ5sNtx4WFe1Emv0CJZCfUb6f6aknFaZkdyuZcJpNz3YDbDbga7HNCJ0M
X-Gm-Message-State: AOJu0YxZ/2IZ5kVdECPM7YoDltT5r0KPpmFXsirzslkAF6iAbMzbbeIg
	+l2VQwIHsDhOTeXuRTEgyVNYRIFPKY0lpbe/wHZ998945UDyAqAwjT06g9WTK1k18xS3AfVApDS
	W4PmKiaQs27Or2DLlOkXwBZXPG3s=
X-Google-Smtp-Source: AGHT+IF+ruW2UX4tVSwBkTDBiX4l0tD+RB0RfwdY8OJLUdxLApCl0RjcoXttol9jI7EFco4FlLDXPiCU17ikG32Zs04=
X-Received: by 2002:a4a:ae8d:0:b0:5af:36ef:27d1 with SMTP id
 u13-20020a4aae8d000000b005af36ef27d1mr15155871oon.3.1714481781673; Tue, 30
 Apr 2024 05:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240427075426.662671-1-qiujingbao.dlmu@gmail.com>
 <20240427075426.662671-2-qiujingbao.dlmu@gmail.com> <D0XEVRFIP18W.2QSS5RI8KJT03@kernel.org>
In-Reply-To: <D0XEVRFIP18W.2QSS5RI8KJT03@kernel.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 30 Apr 2024 20:56:10 +0800
Message-ID: <CAJRtX8T=Rni-gyUxVmf7_AB0vUn4m9eFQ-0Ca6oYLjjv_zmDcQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: mtd: add sophgo spi-nor-controller
To: Michael Walle <mwalle@kernel.org>
Cc: broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@outlook.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	dlan@gentoo.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_055624_148841_3F2751A0 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBBcHIgMzAsIDIwMjQgYXQgNzoxM+KAr1BNIE1pY2hhZWwgV2FsbGUgPG13YWxsZUBr
ZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpLAo+Cj4gT24gU2F0IEFwciAyNywgMjAyNCBhdCA5OjU0
IEFNIENFU1QsIEppbmdiYW8gUWl1IHdyb3RlOgo+ID4gQWRkIFlBTUwgYmluZGluZ3MgZm9yIGN2
MTgwMCBzcGkgbm9yIGNvbnRyb2xsZXIuCj4KPiBuaXQ6IFNQSSBOT1IKCkkgd2lsbCBmaXggaXQu
Cgo+Cj4gSXMgdGhpcyByZWFsbHkganVzdCBhbiBTUEkgTk9SIGNvbnRyb2xsZXI/IERvZXNuJ3Qg
aXQgd29yayB3aXRoCj4gU1BJIE5BTkQ/IE9yIGluIGdlbmVyYWwsIGFueSBtZW1vcnkgbGlrZSBT
UEkgZGV2aWNlLgo+CgpZZXMsIFRoaXMgaGFyZHdhcmUgaXMgb25seSBzdWl0YWJsZSBmb3IgTk9S
IGZsYXNoIGFuZCBkb2VzIG5vdCBzdXBwb3J0IE5BTkQuClRoaXMgaXMgYSBkZXRhaWxlZCBkb2N1
bWVudC4KCkxpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vc29waGdvLWRvYy90cmVlL21h
aW4vU0cyMDBYL1RSTS9jb250ZW50cy9lbgoKQmVzdCBSZWdhcmRzCkppbmdiYW8gUWl1CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
