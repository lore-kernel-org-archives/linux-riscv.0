Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 208A1CD5BC0
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Sep 2024 13:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uI/VQVvCFSAE8h7Ew3TFLBl4c8iBEly+f6KpmQOnYVo=; b=LhRmFaP09d6mok
	pdtd+1NFe2RRjj1OlpbNWl4AR020QqG34F63YohS0iwwFZ/+wziUqcPbSmbYPz/+YUjZkhpHjWakb
	KScoxZvybcfLD5jO+2m2/SpQPgh4ROgHwEtIkSOYOeY0V78kQf/7qQNdL7PXJjWSsrab+tsli1+BY
	djd/y/hGlh5rBdGd39kB6ZxWdzWg+a1V9LtA5b5PMRmPTW6JFAzNVvTLYSwXbENf9HdlBzi1gkfqJ
	qZtdrRpkoX2s31q4DQDR6J2bEVT1TYflx+3Ge/2WIwdhD3333uChjfqRnfoU5WDqHsfYBDjr+L5H6
	B0G7KoGvZXEZynjAR8yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCIM-00000008UD8-2jGP;
	Thu, 05 Sep 2024 13:13:06 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smCIK-00000008UBs-0z9M
	for linux-riscv@lists.infradead.org;
	Thu, 05 Sep 2024 13:13:05 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-533463f6b16so916934e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Sep 2024 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725541982; x=1726146782; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+8Hj5/BortzLMQ+9TV7xX2K37XjQFK+vsFCQRMXKNs=;
        b=kCuqQI2JWINWw2VE6RkHRtBsP/jYIunANxCV8Mle5OdfKmy3MISRdR2xJTNXlm+wwd
         /yLa2mlb8o7MFtKq5Jr2GToJUi1Gjl7w8WO15TOWuOtn0rm2gBHe2uKpB0YpfwJd4Qb6
         KorXjwV37Sj8RlguGU9NzZtd58K7/FqSr/uQUajGQLiiG7pjwU/akltjlf3pSo/gZ8ga
         ZfypgUueg5vA/4Obi7mZx1WFScH1eVTHUCj9zF0OiGCwymvgswVaNweOoqVvAQxDKQG5
         tYb0fNmQhltgDfAF0RL2haIsjuaRzHMrJvwLExQqSYDLmJX1HP+fmasnZwZ9rV+LWev6
         ECsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725541982; x=1726146782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+8Hj5/BortzLMQ+9TV7xX2K37XjQFK+vsFCQRMXKNs=;
        b=OAZY5KtKcZU7Ajuq8HwouDNpA4EzFDuZ2qvfLgQdy4CLU5EgDxXk07pSzT1FcUQohV
         R8ZnLkO1Oy6W9hvR2wsCWeeJ0QWxx1Hi1ujBER9LIcbCjn7VtQF6FggCr/JXGYez7wQA
         LGee+2hPJKN+H69gFF89/wGoNbeOg9wCTIIrleKBxcIaR1FIPzJB+a2Z5r11oUyYhGfS
         pjF9Y3pBEsHlpstOF5klkfwQv7vaoe9jPxuqIa79JXWjUyIWGTWUIu1i5Fe5k+s90GQV
         yI+jknEbk+c7F6aU0pZY/vhYRBWSld9qS6u4AElXtR06BDFTmUJjKDf92GsRVwZYz87U
         t4lA==
X-Forwarded-Encrypted: i=1; AJvYcCV8ioDcywH1xLQGfLTfOBNnOdWC6KATPj6pCZsMFq4YjQeZzNOpxAgKWssBuM1FG16LBJRM6xM2s99DUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG4oLX2xAej385vLAaWL0bjM2Bri/WZ2eHRodv4vqBTURhwRMO
	ldo8nnj02jbRWHvfnnhsdr4Mvoz6pOGC/jo4zs0hYUggXVV75fS7TXd+QAf6VO/6X4M2giqTDzj
	dyYvhpgvv6WcZ7Ibc/ysjEGNjiY4Nf6S2j6bLRw==
X-Google-Smtp-Source: AGHT+IF8UjyRnNwMIQwUFBStNL5Otb4CgHfjl+otbh8Bbxjlkxb2dHENFDG1TqcbNMU59Ppougnux5HlFis6uf8hRh4=
X-Received: by 2002:a05:6512:3055:b0:530:e323:b1ca with SMTP id
 2adb3069b0e04-53565f20df3mr4744502e87.25.1725541981889; Thu, 05 Sep 2024
 06:13:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com> <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-2-639bf83ef50a@tenstorrent.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 15:12:50 +0200
Message-ID: <CACRpkdbZtMcfv8anZZywC_5LoF-8X2dPW9ft489smrw9=hpcSQ@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_061304_311271_7F70C398 
X-CRM114-Status: UNSURE (   8.08  )
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

SGkgRHJldywKCnRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCk9uIFR1ZSwgU2VwIDMsIDIwMjQgYXQg
NjowOOKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToK
Cj4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9u
aWNhbC5jb20+Cj4KPiBBZGQgcGluY3RybCBkcml2ZXIgZm9yIHRoZSBULUhlYWQgVEgxNTIwIFJJ
U0MtViBTb0MuCj4KPiBUZXN0ZWQtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVm
aWxsZUBib290bGluLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8
ZW1pbC5yZW5uZXIuYmVydGhpbmdAY2Fub25pY2FsLmNvbT4KPiBbZGZ1c3Rpbmk6IGNoZWNrIHVu
aXQgYWRkcmVzcyB0byBpZGVudGlmeSB0aGUgcGluIGNvbnRyb2xsZXIgaW5zdGFuY2VdCj4gU2ln
bmVkLW9mZi1ieTogRHJldyBGdXN0aW5pIDxkZnVzdGluaUB0ZW5zdG9ycmVudC5jb20+CgpPdmVy
YWxsIHRoZSBwYXRjaCBpcyBpbiBtZXJnZSBxdWFsaXR5IHN0YXRlLCBJIGp1c3Qgd2FudCB0aGUg
RFQKcGVvcGxlIHRvIHRlbGwgaG93IHdlIGFyZSB0byBoYW5kbGUgdGhlIGdyb3Vwcy4gSSBwZXJz
b25hbGx5CndvdWxkIHByZWZlciBhIGN1c3RvbSBwcm9wZXJ0eSBvdmVyIHRoZSB1bml0IG5hbWUg
YnV0IGxldCdzCnNlZSB3aGF0IHRoZXkgc2F5LgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
