Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17345C7EE39
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GeRrUU6RkqW3+msDiUYpxrARkaEwvMSj9o6Tp/stw5o=; b=OXWx5/AiZ/UsVy
	EV47QWgAPtcaSIdQJ97yISjEIokPNk39fcBLfx+uXdGzzn4Zr5oJgN6ufkh8N5ye7K6b3h/LyN2hC
	bf1aMvLShaMWX1U4m+EGUgBOxVgJW4JDSNGpDP/ZQnfdRv+GOZxR6x+9r9+Mlm3A0fB6oGsgtBVgU
	Hn5tyfNxw3JuRY1+a7VGR+fSLkrFWUw3SgxWjCrNDfG8X4kSqw8+LEwEtWIaBGeMJYLL9XR6CLx77
	Y7LLCldhf7m2/76yYC9mu3TAHo3KFxvUvjMia5tjIiYOdzFAw7Mvx6BUvfOcnRCY7EXbVW7SNxxsK
	gAg/GFtwm1+ShZH4JJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAHm-00000001fjP-47XX;
	Mon, 30 Jun 2025 08:54:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWAC2-00000001els-33ru
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 08:48:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a51481a598so979871f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751273329; x=1751878129; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0MFmQYTIhwQaPU7YK/VjsEzsIiL6rLtVHCSHLdz344=;
        b=VFh96UIcbBuw0sVmlqDTA00Xwpy959AQvFDjPI2zLKICdqO1tETFpyATE9/0ZSjpkC
         YVA+COg2zgDNny6jG2uvnjWkA0T6A8rezkqwDmWvA//rDyvqND6olDWRbHuL5QhR/tMu
         cc5IIL4uXhXeiRJ3cha2tfYOp9fa9MaDsE/JdBFVE4oePt9WgnhthU7TlKBiKYnqdy6V
         6djlnBqVSchXYM3ogqKFbnmMf7ienC3sscnjfw8fMVxvnRM9A4Q3iU0mHuGOwfFhc51f
         L03dxZlnmyIaOvFJVyVlC8hJA9UzlQhREMONy2ehDaFnibY0W+WWEBL0LG0Ce7tcM2uI
         qrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273329; x=1751878129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0MFmQYTIhwQaPU7YK/VjsEzsIiL6rLtVHCSHLdz344=;
        b=ZK73AoGFonAgaz2QSrv67kYAfqBPpW3goaZk2unDpVW85joBLyZU59SR4waCI/4/bz
         8Q7Jc+/Ktu7EIK685ZMBS3sFtWx8vSOlu06zK9lymBKzPSlac3Pi/6dOK/v19JlDXoG/
         cNBZrvy9KnlHJOBeTJmcA1nhnXQRHcAx9WKP2y5C5TdmITgw4GINlCgE077Xghb5TdY2
         reQ7/vJZ+4s0XYvyUg8ktAeToK+tg00jsMB018jBI1/PCyC9UYnuSsOAe/LTV2MdF12O
         0RoxsEsA2SSbkc/37nk8YtfU6NsAnYMR9R+2PW9zbGs8v4pHU2RFKAcuwHHedgAWRRfC
         GdzA==
X-Forwarded-Encrypted: i=1; AJvYcCWLanayNEvxIRQzIHWH+o/iA3Ic5Jado8SvFj2uZgTZeBT0XGcrHmQYxyPpVsLWVubjZy5DAJkRMUqaUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQjBz4lYQ345skPncdBT+F4F9Xjsp7hoDn5iVZh4AjDWm65qSC
	SMpoPMy9oSSmPt83CaibGK+KCv6gyqGUFZs545hL3CQGeClpkn3ecTxNE3HALGYJv98=
X-Gm-Gg: ASbGncvwhw5bGxnXVcCJYd1XzkttQJz49d3polLL6Gow9eVvQ2u6k1d08pfZylvmJ8/
	BdPtDIhXm9wNkZ53q9QZaASmQZbwbQMRWWq3o/Et+UiGDqVOfvF+RAHEAnOQ98ADomnqBph/AXq
	D1zXCkFlFWq+2jlMw/OChnuiNqAxjA9hYmOZ+uWziNZCRBwDwKppL/P6MUBT6jhG826V6pGdalk
	tnprg7ue8KQxRpg6XdTT52zJ/1OG7Elvf6KrTZ/1aSW7OZrRwaDBYGZGy79ZnhUrb9fbbRvKAWh
	vZfAuSkQco9RQSn0OQANBZxZAQEgHKfOnda/c8L+lKrtb8QvEQ==
X-Google-Smtp-Source: AGHT+IFkP2IxHQSzwTBSX2V8J3HFEeGEU2UchiOHVWbWGfVFsEoSfKrpjADgwPpJXxhXznoj1gfTMA==
X-Received: by 2002:a05:6000:4b0d:b0:3a4:f435:5801 with SMTP id ffacd0b85a97d-3a8fdb2a190mr10032131f8f.17.1751273329044;
        Mon, 30 Jun 2025 01:48:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7386sm9698288f8f.20.2025.06.30.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:48:48 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:48:47 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-acpi@vger.kernel.org, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v3 3/3] iommu/riscv: Add ACPI support
Message-ID: <20250630-43f937dcdcd84599d28169cd@orel>
References: <20250630034803.1611262-1-sunilvl@ventanamicro.com>
 <20250630034803.1611262-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250630034803.1611262-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_014850_768902_852A2D0F 
X-CRM114-Status: GOOD (  14.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 30, 2025 at 09:18:03AM +0530, Sunil V L wrote:
> RISC-V IO Mapping Table (RIMT) provides the information about the IOMMU
> to the OS in ACPI. Add support for ACPI in RISC-V IOMMU drivers by using
> RIMT data.
> 
> The changes at high level are,
> 
> a) Register the IOMMU with RIMT data structures.
> b) Enable probing of platform IOMMU in ACPI way using the ACPIID defined
>    for the RISC-V IOMMU in the BRS spec [1]. Configure the MSI domain if
>    the platform IOMMU uses MSIs.
> 
> [1] - https://github.com/riscv-non-isa/riscv-brs/blob/main/acpi-id.adoc
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/iommu/riscv/iommu-platform.c | 17 ++++++++++++++++-
>  drivers/iommu/riscv/iommu.c          | 10 ++++++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
