Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C880AC48BF6
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 09:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4GrrNw0XstI2EBXqwEElIQXxnLeY9QreQK3rDa5Ohd8=; b=SPBNoOmWzAGWjX
	HgjMyY0LoG++ym6xwBubQKSghut+Mprd1mbaKmi3IXn4tb5OPAZ0dBl0ZQmLSYHJhxCA5wkjxeF2h
	dEXUZMlFviOHAaffx98CBqGIDY9/AMP/b40d4hR8/fn03LQpZyI2YuOBlPwyyFSubLEQlbty0lgDt
	1Sn1iQL3BRV3G0AsvFPJqzHccHNeJbP0vC1JhQK0fV3veOt4wM10duGGnD43OfXi5OTiay575ebwq
	Bo+USn4ciTpX/cB4cDw+SoQT83ORk0ck/XxiwHCTExKXNNY5MRDkxEhUN35N+wSPeiEflexzZdaBu
	vZuO44W11858sVGYxGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riA30-00000003r0z-2u0U;
	Thu, 07 Mar 2024 09:28:18 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riA2x-00000003qzk-3o9M
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 09:28:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so7090901fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709803694; x=1710408494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqElFMkTvBicMVdZ7SEelWOQGbRnANtN0YyyYb/TJwk=;
        b=mKh6HSl5m6PL9ocXby/pR0g+NagiYZ5wMU0sQUbuTox/2abj1TTMnBICskiJyDyg6o
         g9jPqANVbrnfX3DXmlmgBmt7ZpXBSnb9jXvTLT1BsfjUswbcjeq7dhnJpg0TCuywbR5i
         UqNb4OzcWEbQZ8Q1nIv0pu0bGXRhZXKkYC+h6T2+RLT76bwFWLFa1vqu+wAWa+GFg01+
         x9KsLqtWCqOI57sxdvfQWTV4dkqmK1pjKtQ0SGb7wvPFQNMPfSkNpnmfwoG3l3OVniBg
         UmmxlOZCK7HE/qsS2lXKsgJfbi6muQ6JJ16aY9IQ6W3IKwu0UZVe782mrnb77SwLERkc
         yJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709803694; x=1710408494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqElFMkTvBicMVdZ7SEelWOQGbRnANtN0YyyYb/TJwk=;
        b=GXiCi0Cg5iml27BcaUC1viiPvA7HQyBUWU9Hx/oD1qYX8Af8m0hGAIb333pWqXWkZ8
         Ob435CI4Lm8TbgLz/RYYEx1UvTPYdUkeSW0y/xZfjQv/VYzglx/TOC1EE9HsX+U8cjWI
         SQhUsDnp9MIturZUEWzP2fRMOcnklXrxroQIOqwsAGX7DsR4UK5nQZeQf/vhE9EuZ+p1
         eDUmkDcWz9VU3mYjbP2LQe92bxx18RoKKmAq07IQBmG33piQvJGcahWJ15ULDrjjBQFc
         64LQWQE7QLY9ULf4/m3hYQt1uK1bVkfRgKsetepry5X2L1h4UZxb7Dv0y/9C5HsGxUL4
         hkUw==
X-Forwarded-Encrypted: i=1; AJvYcCX3wvWYTaqDbvn+1yl6qMaayz6oa2IWgTfVG/AKO4NqYj3rTumHPeRySedhwIdrnvn2A8BghJyP49T41HG9MFp+OSSRXWB7P/O3noJtwuFP
X-Gm-Message-State: AOJu0Yybw1bsYY5aSLCpjDY8mpRrisIP1Y+3MemnNtLFuF6vjKojdZYT
	I4ed7XtXMnYIpPcbME/btMfD5cZQYrO1o+bmr/MWD7AZYNayYeEJXoEs0WirFoPcckewuj5tHXa
	yVO8jz39+kBP4i/HYBeJRa8eXPKQ=
X-Google-Smtp-Source: AGHT+IHjiV486p3sDeAH/QYQK+UU0DDVMP/fjkLCxIHtvcvLxZRd6CYQ+zyuZllwi3vJwxDlj6y9NUHPpGfSmrapx9A=
X-Received: by 2002:a2e:9787:0:b0:2d3:fae3:d7d5 with SMTP id
 y7-20020a2e9787000000b002d3fae3d7d5mr862143lji.48.1709803693441; Thu, 07 Mar
 2024 01:28:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1709780590.git.haibo1.xu@intel.com> <f23da383a8fdbee15acd41fdcd38ef3a89045a43.1709780590.git.haibo1.xu@intel.com>
 <c9e9da9f-ff81-48eb-beec-4f54921cd268@app.fastmail.com> <CAJve8o=BsR1SG0k_7mb61Jj1fb+9rc4V9Y=MMX004fpAWE4vjg@mail.gmail.com>
 <460338ee-c8d5-4f43-9bab-4c35e417e4ad@app.fastmail.com>
In-Reply-To: <460338ee-c8d5-4f43-9bab-4c35e417e4ad@app.fastmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 7 Mar 2024 17:28:02 +0800
Message-ID: <CAJve8o=SKkV1oE__4waY8gx0OoYptPNH3a2UzL37a=-+wcbcDA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] ACPI: NUMA: Remove ARCH depends option in
 ACPI_NUMA Kconfig
To: Arnd Bergmann <arnd@arndb.de>
Cc: Haibo Xu <haibo1.xu@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, 
	Zong Li <zong.li@sifive.com>, James Morse <james.morse@arm.com>, 
	linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, 
	Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_012815_980517_B5B06F18 
X-CRM114-Status: GOOD (  11.50  )
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

T24gVGh1LCBNYXIgNywgMjAyNCBhdCA1OjIz4oCvUE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5k
Yi5kZT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1hciA3LCAyMDI0LCBhdCAxMDoxOSwgSGFpYm8gWHUg
d3JvdGU6Cj4gPiBPbiBUaHUsIE1hciA3LCAyMDI0IGF0IDQ6NDTigK9QTSBBcm5kIEJlcmdtYW5u
IDxhcm5kQGFybmRiLmRlPiB3cm90ZToKPiA+PiBPbiBUaHUsIE1hciA3LCAyMDI0LCBhdCAwOTo0
NywgSGFpYm8gWHUgd3JvdGU6Cj4KPiA+PiBJZiB3ZSBtYWtlIGl0Cj4gPj4KPiA+PiAgICAgICBk
ZWZfYm9vbCBOVU1BICYmICFYODYKPiA+Pgo+ID4+IHRoZW4gdGhlIHNlbGVjdCBzdGF0ZW1lbnRz
IGV4Y2VwdCBmb3IgdGhlIFg4Nl82NF9BQ1BJX05VTUEKPiA+PiBjYW4gYWxzbyBnbyBhd2F5Lgo+
ID4+Cj4gPgo+ID4gR29vZCBpZGVhIQo+ID4gU2hhbGwgd2UgaW5jbHVkZSB0aGUgQUNQSSBpbiB0
aGUgZGVmX2Jvb2wgZGVmaW5pdGlvbj8KPiA+Cj4KPiBObyBuZWVkLCBiZWNhdXNlIHRoaXMgaXMg
aW5zaWRlIG9mIGFuICdpZiBBQ1BJJyBibG9jay4KPgoKQ29vbCEgTGV0IG1lIGhhdmUgYSB0cnku
CgpUaGFua3MsCkhhaWJvCj4gICAgICAgIEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
