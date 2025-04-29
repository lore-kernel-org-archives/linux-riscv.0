Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AD0C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZV6BacYKc9rmA+hj81G4naE7wkCjM+Qla3O7Gvz3ZZ4=; b=ZLtB0oFg4HWGiM
	iO5BcKvMV4IyRN3Nr5ldcIDveLHyn0aGA6Jvq+mDOu/cuJeC6LRD5Vkik8ai0y00DsWObMxCcPsjt
	nBYj/DDLzgVgon3HWHrOQLIXugD0hlM53ia3+XHzylrpva95FmbNFXbq6YOBB3pmxstU5QZ++MQju
	c0Lidr4iHjG/Srp4TVLOf+L/rpv/DQ1EEiz1+JewblRgC2EQ4P+IaJjMI7260C6TCxgqbaGiJdiVv
	JvrQVqCBCsosdELqh5HhhK+qtIryYkj/m7R3noce5d7e/dCuT2cdR0I8eCf3Ovt01O/yeyVBgvnkp
	KdzCFAnBCUsS+5oP7fUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lie-00000009tIC-1L6A;
	Tue, 29 Apr 2025 14:13:56 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9klE-00000009kXf-1Wqi
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 13:12:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22c336fcdaaso70304305ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745932351; x=1746537151; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLr/pZVUZiZvuJBsY2l2h1qnIyCFg/TeFQKOeAXVIOA=;
        b=P7YlEUSVCe8+7Sa0qli4KhTxuyLPei2s59SzlhEW6bjfA2/gNUpzyZ3oo3sDyD4xP6
         mnH+Z85HUp7r5ARQUAcvoXYwMnQ8uJa8lztkHtmk+Ok6qc1shmg66plB7x95wk61D5oX
         yVf07bUvGzagp8kQ/OWYZOM3w7NQjc9ByIjBgfIysp30SxjrO3IuQ4DaieZUvGtsrCj4
         6iWc0UMLyM3bGs5c7xuI3wE+EyqnPuY4JU8CdbtaMpnFSJMIaNkeV5XUZ3Qx6j4AwErK
         TkzEY3MZ2+6Xdy0/WEGvSYFBuyrYBn5VCY6j3nvZfK7S0gt73aVB30LakGex5q/OhFOi
         /RIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932351; x=1746537151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLr/pZVUZiZvuJBsY2l2h1qnIyCFg/TeFQKOeAXVIOA=;
        b=eo+siaICi0LyubPGC9Y0aibbOO1EW0YMyNRNHIIaNfvXcb+D7VJ+qY3pReD3r4F2M3
         05elSIFbyEZv9woG+mcU8zcafaEkuFTUVUC4H1GtcIzPQAglK5FN05U74H6ScbRFz/A1
         2917zrlMuLFKY9qQ+W9GxvPn/oWtj/gKB+ZS8HxqKSihKquLARchTKp6m207JH+W+d5S
         tnKuhN3ClKQYhKVyZC1DAeFw2FngfJVEb1ceoKD+k6Rq0BI6IXO2OkOJA01K3TOYhV9Y
         QI+xAyRQ+solcQgw9VPrSKwq0HLUiOJxpRGr+ZSqCirxLFnoLKlxPtYb8yCC6vpIunqI
         yeXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7wFNzaykYBHDJoJoqEwBqB8jwlchdmyPkOOpehXU/gPoASOIA9WFCT7JjxO6vE1sZab4ExDDFy5yzJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvXpBb0TmcpzPdhI8uMbRp03ifbLbv4GonGjIUuvZLLwJRgkCj
	UbNN5RBt/0RMVtXIcUy7fc7tGi5EtO3orJE3We3XaVNUt7S3xZMEib6HxJqfwv66ReyX
X-Gm-Gg: ASbGncu37zQpzh4gJj/B0C62JhLQrpNsLK9pAooxsD0vuDR7yMZVxYHV5fDCBC2F6jd
	PG5TeuHR8EG0rivOY9NDhpKaz6CEhKE+dJRlQ7bD3Os50mni5FIr926qIAGIiAtXRv8bzdNulmK
	9dWP2zfTlIH9pb83xmlBHdLAt0xi+xQE9TkFLivBSk1ig5g7FqNoPrumx+I1qE0yQp/gsIuUwbp
	L6fKyieMI9+XGAynId3FITkBeWNOUzf6BxNB8wkvN3S7G9H+WLs8OvmmqL3wSOy8cB4tTYYXUbZ
	bPVhTf3MYS42qpD7PFbW+xkEyvzYyT4j
X-Google-Smtp-Source: AGHT+IE46nQZvQZOoQ5SdP3lN+MPETDnAaTMkTXjhLibuyGrKWlwgPpdOsObZavwJSYSN6nA7zZfhQ==
X-Received: by 2002:a17:903:120d:b0:223:47b4:aaf8 with SMTP id d9443c01a7336-22de60a3e97mr48866585ad.52.1745932349403;
        Tue, 29 Apr 2025 06:12:29 -0700 (PDT)
Received: from localhost ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbc0d1sm101560245ad.72.2025.04.29.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:12:28 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:12:25 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Xukai Wang <kingxukai@zohomail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v6 2/3] clk: canaan: Add clock driver for Canaan K230
Message-ID: <20250429131225.eza27be7wm4lmehy@troy-wujie14-pro>
References: <20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com>
 <20250415-b4-k230-clk-v6-2-7fd89f427250@zohomail.com>
 <MA0P287MB2262F6D556E48A73E317553AFEB82@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <1d8c27be-95f9-4cb8-8d41-9c00faefd360@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d8c27be-95f9-4cb8-8d41-9c00faefd360@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_061232_409096_838C6623 
X-CRM114-Status: GOOD (  40.57  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Apr 22, 2025 at 04:01:35PM +0800, Xukai Wang wrote:
> =

> On 2025/4/21 18:43, Chen Wang wrote:
> > Hi, Xukai, I have some comments below.
> >
> > In general, my suggestion is that the code can be further optimized,
> > especially in terms of readability.
> >
> >
> > On 2025/4/15 22:25, Xukai Wang wrote:
> >> This patch provides basic support for the K230 clock, which does not
> >> cover all clocks.
> >>
> >> The clock tree of the K230 SoC consists of OSC24M, PLLs and sysclk.
> >>
> >> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> >> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> >> ---
> >> =A0 drivers/clk/Kconfig=A0=A0=A0 |=A0=A0=A0 6 +
> >> =A0 drivers/clk/Makefile=A0=A0 |=A0=A0=A0 1 +
> >> =A0 drivers/clk/clk-k230.c | 1710
> >> ++++++++++++++++++++++++++++++++++++++++++++++++
> >> =A0 3 files changed, 1717 insertions(+)
> >>
> >> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> >> index
> >> 299bc678ed1b9fcd9110bb8c5937a1bd1ea60e23..1817b8883af9a3d00ac7af2cb884=
96274b591001
> >> 100644
> >> --- a/drivers/clk/Kconfig
> >> +++ b/drivers/clk/Kconfig
> >> @@ -464,6 +464,12 @@ config COMMON_CLK_K210
> >> =A0=A0=A0=A0=A0 help
> >> =A0=A0=A0=A0=A0=A0=A0 Support for the Canaan Kendryte K210 RISC-V SoC =
clocks.
> >> =A0 +config COMMON_CLK_K230
> >> +=A0=A0=A0 bool "Clock driver for the Canaan Kendryte K230 SoC"
> >> +=A0=A0=A0 depends on ARCH_CANAAN || COMPILE_TEST
> >> +=A0=A0=A0=A0=A0=A0=A0 help
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 Support for the Canaan Kendryte K230 RISC=
-V SoC clocks.
> >> +
> >> =A0 config COMMON_CLK_SP7021
> >> =A0=A0=A0=A0=A0 tristate "Clock driver for Sunplus SP7021 SoC"
> >> =A0=A0=A0=A0=A0 depends on SOC_SP7021 || COMPILE_TEST
> >> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> >> index
> >> fb8878a5d7d93da6bec487460cdf63f1f764a431..5df50b1e14c701ed38397bfb257d=
b26e8dd278b8
> >> 100644
> >> --- a/drivers/clk/Makefile
> >> +++ b/drivers/clk/Makefile
> >> @@ -51,6 +51,7 @@ obj-$(CONFIG_MACH_ASPEED_G6)=A0=A0=A0=A0=A0=A0=A0 +=
=3D clk-ast2600.o
> >> =A0 obj-$(CONFIG_ARCH_HIGHBANK)=A0=A0=A0=A0=A0=A0=A0 +=3D clk-highbank=
.o
> >> =A0 obj-$(CONFIG_CLK_HSDK)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +=3D clk-h=
sdk-pll.o
> >> =A0 obj-$(CONFIG_COMMON_CLK_K210)=A0=A0=A0=A0=A0=A0=A0 +=3D clk-k210.o
> >> +obj-$(CONFIG_COMMON_CLK_K230)=A0=A0=A0=A0=A0=A0=A0 +=3D clk-k230.o
> >> =A0 obj-$(CONFIG_LMK04832)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 +=3D clk-l=
mk04832.o
> >> =A0 obj-$(CONFIG_COMMON_CLK_LAN966X)=A0=A0=A0 +=3D clk-lan966x.o
> >> =A0 obj-$(CONFIG_COMMON_CLK_LOCHNAGAR)=A0=A0=A0 +=3D clk-lochnagar.o
> >> diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
> >> new file mode 100644
> >> index
> >> 0000000000000000000000000000000000000000..84a4a2a293e5f278d21510d73888=
aee4ff9351df
> >> --- /dev/null
> >> +++ b/drivers/clk/clk-k230.c
> >> @@ -0,0 +1,1710 @@
> > [......]
> >> +
> >> +struct k230_pll {
> >> +=A0=A0=A0 enum k230_pll_id id;
> >> +=A0=A0=A0 struct k230_sysclk *ksc;
> >> +=A0=A0=A0 void __iomem *div, *bypass, *gate, *lock;
> >
> > No need define these iomem address, just calculate them and use them
> > when use them. The clock reading and writing efficiency requirements
> > are not that high, so there is no need to waste memory for this.
> >
> I see, I'll drop these next version.
>
Hi Xukai, feel free to skip replying one by one.
just point out anything you disagree with or find confusing.

        - Troy
> >
> >> +=A0=A0=A0 struct clk_hw hw;
> >> +};
> >> +
> >> +#define to_k230_pll(_hw)=A0=A0=A0 container_of(_hw, struct k230_pll, =
hw)
> >> +
> >> +struct k230_pll_cfg {
> >> +=A0=A0=A0 u32 reg;
> >> +=A0=A0=A0 const char *name;
> >> +=A0=A0=A0 struct k230_pll *pll;
> >> +};
> >
> > Can we combine k230_pll and k230_pll_cfg into one to simplfy the code?
> OK, and I think the role of k230_*_cfg is maybe some redundant, and I'm
> considering remove them.
> >
> >> +
> >> +struct k230_pll_div {
> >> +=A0=A0=A0 struct k230_sysclk *ksc;
> >> +=A0=A0=A0 struct clk_hw *hw;
> >
> > I see k230_clk use "struct clk_hw", but here we use "struct clk_hw*",=
=A0
> > can we unify these?
> The clk_hw in k230_pll_div is a pointer returned by
> `clk_hw_register_fixed_factor()`, whereas the clk_hw in the PLL and in
> regular clocks is the actual entity that gets populated by
> `clk_hw_register()`.
> >
> > Just use "struct clk_hw" and init it as static global var should be
> > enough, see drivers/clk/sophgo/clk-cv1800.c for example.
> >
> >> +};
> >> +
> >> +struct k230_pll_div_cfg {
> >> +=A0=A0=A0 const char *parent_name, *name;
> >> +=A0=A0=A0 int div;
> >> +=A0=A0=A0 struct k230_pll_div *pll_div;
> >> +};
> >> +
> >> +enum k230_pll_div_id {
> >> +=A0=A0=A0 K230_PLL0_DIV2,
> >> +=A0=A0=A0 K230_PLL0_DIV3,
> >> +=A0=A0=A0 K230_PLL0_DIV4,
> >> +=A0=A0=A0 K230_PLL0_DIV16,
> >> +=A0=A0=A0 K230_PLL1_DIV2,
> >> +=A0=A0=A0 K230_PLL1_DIV3,
> >> +=A0=A0=A0 K230_PLL1_DIV4,
> >> +=A0=A0=A0 K230_PLL2_DIV2,
> >> +=A0=A0=A0 K230_PLL2_DIV3,
> >> +=A0=A0=A0 K230_PLL2_DIV4,
> >> +=A0=A0=A0 K230_PLL3_DIV2,
> >> +=A0=A0=A0 K230_PLL3_DIV3,
> >> +=A0=A0=A0 K230_PLL3_DIV4,
> >> +=A0=A0=A0 K230_PLL_DIV_NUM
> >> +};
> >> +
> >> +enum k230_clk_div_type {
> >> +=A0=A0=A0 K230_MUL,
> >> +=A0=A0=A0 K230_DIV,
> >> +=A0=A0=A0 K230_MUL_DIV,
> >> +};
> > Please document what's meaning of MUL, DIV, and both? They are type
> > for what?
> OK, I'll add one to explain this.
> >> +
> >> +struct k230_clk {
> >> +=A0=A0=A0 int id;
> >> +=A0=A0=A0 struct k230_sysclk *ksc;
> >> +=A0=A0=A0 struct clk_hw hw;
> >> +};
> >> +
> >> +#define to_k230_clk(_hw)=A0=A0=A0 container_of(_hw, struct k230_clk, =
hw)
> >> +
> >> +struct k230_sysclk {
> >> +=A0=A0=A0 struct platform_device *pdev;
> >> +=A0=A0=A0 void __iomem=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *pll_regs, *regs;
> >> +=A0=A0=A0 spinlock_t=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pll_lock, clk_lock;
> >> +=A0=A0=A0 struct k230_pll=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *plls;
> >> +=A0=A0=A0 struct k230_clk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *clks;
> >> +=A0=A0=A0 struct k230_pll_div=A0=A0=A0 *dclks;
> >> +};
> >> +
> >> +struct k230_clk_rate_cfg {
> >> +=A0=A0=A0 /* rate reg */
> >> +=A0=A0=A0 u32 rate_reg_off;
> >> +=A0=A0=A0 void __iomem *rate_reg;
> >> +=A0=A0=A0 /* rate info*/
> >> +=A0=A0=A0 u32 rate_write_enable_bit;
> >> +=A0=A0=A0 enum k230_clk_div_type method;
> >> +=A0=A0=A0 /* rate mul */
> >> +=A0=A0=A0 u32 rate_mul_min;
> >> +=A0=A0=A0 u32 rate_mul_max;
> >> +=A0=A0=A0 u32 rate_mul_shift;
> >> +=A0=A0=A0 u32 rate_mul_mask;
> >> +=A0=A0=A0 /* rate div */
> >> +=A0=A0=A0 u32 rate_div_min;
> >> +=A0=A0=A0 u32 rate_div_max;
> >> +=A0=A0=A0 u32 rate_div_shift;
> >> +=A0=A0=A0 u32 rate_div_mask;
> >> +};
> >> +
> >> +struct k230_clk_rate_cfg_c {
> >> +=A0=A0=A0 /* rate_c reg */
> >> +=A0=A0=A0 u32 rate_reg_off_c;
> >> +=A0=A0=A0 void __iomem *rate_reg_c;
> >> +
> >> +=A0=A0=A0 /* rate_c info */
> >> +=A0=A0=A0 u32 rate_write_enable_bit_c;
> >> +
> >> +=A0=A0=A0 /* rate mul-changable */
> >> +=A0=A0=A0 u32 rate_mul_min_c;
> >> +=A0=A0=A0 u32 rate_mul_max_c;
> >> +=A0=A0=A0 u32 rate_mul_shift_c;
> >> +=A0=A0=A0 u32 rate_mul_mask_c;
> >> +};
> >> +
> >
> > What's "k230_clk_rate_cfg_c", and what's the difference against
> > "k230_clk_gate_cfg". Please document it and clarify this.
> >
> > It is recommended to add documentation comments to important structure
> > types and their members.
> >
> > Regarding how to document kernel code, see
> > https://docs.kernel.org/doc-guide/kernel-doc.html.
> OK, I'll try to clarify it next version.
> >
> > [......]
> >
> >
> > This structure definition looks a bit complicated, with nested
> > structure pointers. Can it be simplified, similar to struct
> > k210_clk_cfg in drivers/clk/clk-k210.c?
> >
> > And can we use composite clk here?
> I'm considering using clk_composite here.
> >
> > [......]
> >
> >> +static struct k230_clk_cfg k230_cpu0_src =3D {
> >> +=A0=A0=A0 .name =3D "cpu0_src",
> >> +=A0=A0=A0 .read_only =3D false,
> >> +=A0=A0=A0 .flags =3D 0,
> >> +=A0=A0=A0 .num_parent =3D 1,
> >> +=A0=A0=A0 .parent[0] =3D {
> >> +=A0=A0=A0=A0=A0=A0=A0 .type =3D K230_PLL_DIV,
> >> +=A0=A0=A0=A0=A0=A0=A0 .pll_div_cfg =3D &k230_pll_div_cfgs[K230_PLL0_D=
IV2],
> >> +=A0=A0=A0 },
> >> +=A0=A0=A0 .rate_cfg =3D &k230_cpu0_src_rate,
> >> +=A0=A0=A0 .rate_cfg_c =3D NULL,
> >> +=A0=A0=A0 .gate_cfg =3D &k230_cpu0_src_gate,
> >> +=A0=A0=A0 .mux_cfg =3D NULL,
> >> +};
> >> +
> >> +static struct k230_clk_cfg k230_cpu0_aclk =3D {
> >> +=A0=A0=A0 .name =3D "cpu0_aclk",
> >> +=A0=A0=A0 .read_only =3D false,
> >> +=A0=A0=A0 .flags =3D 0,
> >> +=A0=A0=A0 .num_parent =3D 1,
> >> +=A0=A0=A0 .parent[0] =3D {
> >> +=A0=A0=A0=A0=A0=A0=A0 .type =3D K230_CLK_COMPOSITE,
> >> +=A0=A0=A0=A0=A0=A0=A0 .clk_cfg =3D &k230_cpu0_src,
> >> +=A0=A0=A0 },
> >> +=A0=A0=A0 .rate_cfg =3D &k230_cpu0_aclk_rate,
> >> +=A0=A0=A0 .rate_cfg_c =3D NULL,
> >> +=A0=A0=A0 .gate_cfg =3D NULL,
> >> +=A0=A0=A0 .mux_cfg =3D NULL,
> >> +};
> >> +
> >
> > Suggest use Macro to simplify the code here, see
> > drivers/clk/sophgo/clk-cv1800.c for example.
> I see, I' ll replace these init code with macro instead.
> >
> > [......]
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
