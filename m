Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1A4C36008
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 20:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsjHxfzuZPjSASK+KWXo+2fYpMwqwgB2vBy6H20jJXY=; b=0LqQ8cHILFCubb
	2KcN0kRB4qnpjX81A2GfVcHnrGFMLu/aMpUpNcdVV86IOsM1/o/Sf4WfNCuAOMefYU4fMX5pVx5AJ
	Ix/+Vm+NtPGb9PP2tx8Ib64SsZpMhQcVNrYw84nECprcZz67MYp5jXAGrxCCpOOlzzdye82RW9WQ2
	/QHjxEVKZBeoVLe3KGHtxArWnC4EZDcm9x/XMZ1etfdS/0XdyL+HATY1DLTLc9PyVsUj48mylx1Q/
	w5jiwMc0Xfs25Ti1HPqJHgSo/hJdYt0uU/8uLhA5B9DNYwCeOcL9NKewkUoZM8xB7yJlnoYew6s2u
	w9aOOwPDGO2qg2N9jE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBDg-000000070cH-3DEs;
	Tue, 25 Mar 2025 20:49:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txBDe-000000070bJ-1XBz
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 20:49:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-549b12ad16eso6473081e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 25 Mar 2025 13:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742935792; x=1743540592; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSGZCgSZyiCMLm45nefLbWbreHawZ4HrRM/1I0jgflI=;
        b=hUAE7UlM2fWoNIzG+8R/cRBrZztCf/f+iPDKp0hoFuOnI0Fy8KjuvgZfB1XjKtnMB/
         T74ZgKM1MJgXGPI9Pw1SxnF4QsCmf4cv8ABWVb5suc4B41Dl8yTL+ZOBNg45RYAjQpwR
         Uf9i0NshUYBjA2Aux9vucEDywIIG4JyezWiOloZB4OLQjMCT8onQhC4XZrsOk80WHYOz
         jYDMmWicIWU5v2KM29Hd2wRcsnfwJI81pql1Eg6uutmedgB1TZ/bqfD54UruSUzemp/P
         5UCUR9mpgHntKCIGlc/EJKHYSM8wmabT/EvGSlCwS7E0eSvk1+iVBv6vYpaBFmbzbRZt
         vzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742935792; x=1743540592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSGZCgSZyiCMLm45nefLbWbreHawZ4HrRM/1I0jgflI=;
        b=JeXbztt9hTSYcfhC/BOwrk3M6cqk3+Jg0h4NA8r0mrzkZBZCOOhBvqRl2c0aqu43Qv
         SUCxYBnr80mb2+LIm+zGY5KhW3BhzELacimU6VXe8nOZeAl6Zoq3j8ew0ZzrxsBS2SsY
         6biT4FZjj3/dm3KTRLNjfi9/7xMkMj5LpIuwPhlMZE6i8o1qLbsQGgegbGrOm688lmym
         vIQbqfPy2pN//xzR957PPbaUQqRCTn0mm+Hc0ZwoBvw9z96NooIITRzdn1L/sEzA41h+
         EdfnTQAm7H3WbXerGXh23kP664A+pZlZB6GqqYSm7poKXFY3eaQ46C4y47J6DzGSsFnG
         ZH0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXB3gdwx6IHQDaATURTRB+fWPHhEgxAZiaCTgfRRIEaH0MHI9hSsbS/9t7oqCJy/4kZa881+s3J6HyqyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwN8y1ICIDbIvkDlgjfaZYRFzVfSVEDmx1SWojS6U9fgK4wyObZ
	7vKGIvRsz7KwE5Hw1Vvjp3cQlcZoDDVoHDq4JYA4RPGqmsEBLVTn/a9cACIHR+hkZq/sbXUatRq
	9aFZHaZIQBPxYjv5XeIQpO8L2vR0aLTXlhavxvA==
X-Gm-Gg: ASbGnct5DPHoo9T9XrEC/mN0AoGeTJUbxzX05oT9vZrK0eCjGF8Zdu2F13v8YllRWl5
	C/WWhwS21Mmc/+fyYVmv1DSoYc90HNTmZ6FOfFO26/vJLvRz/ImprBq3YWNxLMJCmvGypk5rqFy
	LVPPB+UAxmMljMkXI61rhEcxo=
X-Google-Smtp-Source: AGHT+IEF7yyIMMixqctwMg+s9HwHl4A28PDbdusJ+Jzb/Ti0VnewpkU2St5hBerQF3oHbdQtAZyOW4J2NRWiTUU6A4k=
X-Received: by 2002:a05:6512:ea8:b0:549:b0f3:439b with SMTP id
 2adb3069b0e04-54ad6494351mr7341343e87.16.1742935792230; Tue, 25 Mar 2025
 13:49:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250325141311.758787-1-emil.renner.berthing@canonical.com> <20250325141311.758787-2-emil.renner.berthing@canonical.com>
In-Reply-To: <20250325141311.758787-2-emil.renner.berthing@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Mar 2025 21:49:41 +0100
X-Gm-Features: AQ5f1Jr_QmG228mTrT4635Lxbqc8kIEzoAGcZXgVlRpA7Hs97jG_kwma8QcfMxU
Message-ID: <CACRpkdaJPXbc_83PdhjFDbmqcrV61k2NgtPjyA7gQnoBGRPgcA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: pinctrl: Add eswin,eic7700-pinctrl binding
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>, 
	Pritesh Patel <pritesh.patel@einfochips.com>, Min Lin <linmin@eswincomputing.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_134954_417781_CA3CE38A 
X-CRM114-Status: UNSURE (   6.84  )
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

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMzoxM+KAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKCj4gQWRkIGRldmljZSB0
cmVlIGJpbmRpbmcgZm9yIHRoZSBwaW4gY29udHJvbGxlciBvbiB0aGUgRVNXSU4gRUlDNzcwMAo+
IFJJU0MtViBTb0MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8ZW1p
bC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KClRoaXMgbG9va3MgZ29vZCB0byBtZS4K
UmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllv
dXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
