Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DA8C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 12:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVa4FVq2r6fvkLHz4R3cpXfQEr/lDl20m0qULxsdeq0=; b=2uAHjZd35GQq6A
	jA2CgxF1p9Z1iaReoW+hQD2HXlQ5RE+64vbeEQwQi+GONOu4tsT6ZAhQjxmgeT2426uVXED3KRBYh
	67sH25vSx9qw7b27PkBAfdeES1n5VpVqAWSs1Ug6Aw9nP6uc0jn1+FklwaeTVdpuFU7Pkln1AMwaS
	rSkKu1ZvYS0QaTUEcY/wwMwmvWK6glGDvaW6bCkiRdvIAUpUgPq3faI+W3MxxVYaFxmVn+PUvw68N
	bM9wP9iCoFa2ubJ1t+5HjsoNxY38WNZChOarRWINEcnVh1bwp65wqqYiCHk20pdXFV6ve+r1IuyD2
	dgYQJvFPh7u0lO5PLJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGLt-009joY-09;
	Tue, 24 Oct 2023 12:17:41 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvGLq-009jn9-1X
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 12:17:39 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c59a4dcdacso1351221fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 05:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698149854; x=1698754654; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ywtG2aeiT8ekMrOBNJIRKZ2eAujslOOqomAOrufM1SU=;
        b=miRknNgENVLwTOZflWggpWj7PBMwHg7NMjcUohMKmMnwmVRscfoMkbth4GXMvc+3U7
         aAwgAlG0Xj5Qhv/cLBdcsfbynFH6U4xPwJ6yEruZ+yNRjKoRwb+naMoSOiMoQzOCQaU8
         TTYWY0VVCvcJj/LBHwvFBeJjshCQzgEkbxX7RYtDzM0RVDVtVLWaq5J8p0X7TphMjFWQ
         ikuAZ4UZpoRCyNQU6GjI35OM50CYMuUH+cfzMu2G0C0RWRavKHlLb4z3Ot8fdo5TvaFy
         m4FF59DkuR2jYxLJDsC2fstK+xGZ265Fb0fiG/Kx2SrIoU0/AA4lldmktrpXeM5yBjgl
         WyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149854; x=1698754654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywtG2aeiT8ekMrOBNJIRKZ2eAujslOOqomAOrufM1SU=;
        b=vAPwXj+VDxV+Nmsrhd7cOBOxFAl1SJ/mmpNa6YMSD/tYhG4OoZOitXdnqC4DJMv3S2
         LV6w1K2zkDNv8fxB2YTDw1alfJZIfbDhB+e//enCYTqiZbGafEcTSXrC7BGj3WbWDJDv
         W/GvI/eiTVPVx8o1odXB9h9GPX6MkKKD3KNZ7Eo7KwqsLghUEG/8ES1txFF9LSNqwRBS
         F9pU1rVQVM6pDTmoOJLmladaDfiv85hXD5CIrA3c6TzMgi8IcxA50sXhgjKY0bY2CNFC
         ieahYSS5JuQyZqh1qMbADsBQ3L6fu+EmZrumGEhrX3vOMLBFwobHKIFlvhOaK57cC9Hu
         p6LA==
X-Gm-Message-State: AOJu0Yyts3JV91mX5sKoErRjDHGwRFu2rJAIxWr0r9DVkApi7DEe+01L
	4B6H3vgX6f6MffLd9xl3SsTVBA==
X-Google-Smtp-Source: AGHT+IE6d/oSgQ9Dz+s2s/99KBYyI90JUkFW07BAyv9IhWTLc2F/oa76kzHgi2ODHuo+aGO9M6mljQ==
X-Received: by 2002:a05:651c:1699:b0:2c0:cfa:a1a0 with SMTP id bd25-20020a05651c169900b002c00cfaa1a0mr8057527ljb.46.1698149854070;
        Tue, 24 Oct 2023 05:17:34 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c4fcc00b0040775501256sm11871874wmq.16.2023.10.24.05.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 05:17:33 -0700 (PDT)
Date: Tue, 24 Oct 2023 14:17:32 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v11 05/14] irqchip/riscv-intc: Add support for RISC-V AIA
Message-ID: <20231024-4aa004731cc3edf5f6e51031@orel>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-6-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023172800.315343-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_051738_509225_E4529C8F 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 23, 2023 at 10:57:51PM +0530, Anup Patel wrote:
> The RISC-V advanced interrupt architecture (AIA) extends the per-HART
> local interrupts in following ways:
> 1. Minimum 64 local interrupts for both RV32 and RV64
> 2. Ability to process multiple pending local interrupts in same
>    interrupt handler
> 3. Priority configuration for each local interrupts
> 4. Special CSRs to configure/access the per-HART MSI controller
> 
> We add support for #1 and #2 described above in the RISC-V intc driver.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  drivers/irqchip/irq-riscv-intc.c | 34 ++++++++++++++++++++++++++------
>  1 file changed, 28 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
