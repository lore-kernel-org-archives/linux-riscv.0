Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D5ACCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 14:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LpIzcdje9Vm7YiHP+g358orj1b6S3i2PBOeE7P8wg4=; b=sDk9qKEniihHki
	dREv/7SH1gu6789wUNAobK/kEsubCmdh4gcYb5pTE5bgRJk3XBkos148wORUrkB8VBof/q/MyP0EG
	uzcmqpYZg8nYucC8+J1OTd5NDuHE+qaI0F5SI2ghHmWNHXnuRLEwxovt1DxHLVg+HSeOgZ1ccbDsu
	BZVnoKQf7lj9YfaNXUWp7lki35NbZcY+BJOByuXxAMrYvUCozMIFlXT4zAxc5f2sa+JpyHHF9ccbN
	B6XYHVAqVcRwA4m2/GLdrtv/WTCVcjvChSqQUqrz/jufjBg7ZtYTGIcPEnj8IuakzfO+wDLxwnfXR
	YWRPWU7BOtUVgNzWDCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Ic-00000004oxh-0CWb;
	Sat, 17 Oct 2026 14:22:14 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI5Ia-00000004oxI-0ACv
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 14:22:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso8909295e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 07:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792246930; x=1792851730; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=ZkN8YutK/JGth0gAO5KgnSoafT2TURT6B0lyVaPTf36H8Th8LX9R/oNo7irW8tuEdR
         vAL2iUI2OtMZZNL+8QH+atOeOm4HL2RyGcuQp500Jj9xRDMe7tZUyetj3kRc0HPWAeef
         w35dVrKnvIq5MiiAlnqw7+5cH3gBetrVHjXMqfUmIeBac4FgVMSxMtONyum/A5n1XloK
         UoVGZbeHXSnJfKbYQfJqORHVbsiqRYW+ePEjZGKo5Qn8uUVmQW4I7ir/AwunQti6lCeE
         rAAvOFVoVHVcvHORPOQEyxw4Qfeh4bTdP0MishEMiexIU/TMhObWB56qcrjHTMP7W3bC
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792246930; x=1792851730;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ANOLOg5W5PGeejHJ7V1Gxk93nPDi6EIUyW6A+VPSJto=;
        b=V4VmyobrQiFQ033O3c/NJVa5GKuPv0CVS2tC+SCthE7hbRDNuBnf9LCflylbhAb+fK
         O7egRU8zgaDsrN1bdAEwkpuJnhfwLgc8cwyC++dBWdCsMWYPtT9EIrFaUYYArHL1H4HP
         rvvkIDCsyn2lH+94h1gl9ZpGSc9c+oJSMZJ7s8X+Ek90HEK6JeBy4/Rvk9+pb6hGiKj7
         MbvcCV/+pF0MtangusSKQOFG/oibPXo65zSGEWFJKmMnVVwomSXNLbaMrOjbcruzYd4z
         C+3xnekFVnOfYi8aObKnWT9s0OTZ2rXUnFnP51MAaTYvXTdNPc0rZmEXSFxjoz40fVU7
         rJRw==
X-Forwarded-Encrypted: i=1; AKwUvBy1UaP3lLq72Mtq/KU/SS0nLd6Dc9yzG7SZxQ7hXlPFuuLw4rBDxqIg3Ta7TQx5wxKAjRXg0gvUC2txNw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJE04zlotmKwZlO3pX81jRdTOKxItO0BNlEP7tFQlT0AB0Bfp3S
	suy5iG3HpJf9wFcUzFkbgVB9hJ0ruY2WclNvxlkm3lKcGMSVxbPlWOEZPc3t4yzucRYKk3DEuAt
	7do3ncFQ=
X-Gm-Gg: AYBFou0lRQvFe6/l0fKzj1eJ+3LYhOl+mehqnulAOdZFBDrc+mhSwncof3BNnCP2WRW
	epjDTzzFd4Idl+AJeaxfuS0KytB78EO1KbvZ0Sazne1gbFB8A+itUaHmpEbQVFYgDg0ToEF4as0
	zp3hcCOLqsj0BiwTuyeeUj2bjUsI4xsHrHlWVkXkpqW+453Eo85P1f8QFSBUQ9ZAJELdWiufpYA
	dQxP6TH7VmaLopMf7eQJakpDqp1WnWqGkLfUToOBQ0dLWvWRdjlm4cpPCOEQfe40aQN5vclkk57
	uM22h6jrVVsSe19JCJ6S0Q5tz3emV2jvjTxuYFsSYtRCBKnuUkfUTR1WRxJFRG+ZEE90PSWECDq
	9yTPiY1k2K5QJ4guSwc0ebFrqwrbS6hI/TCo6NcCDgjxrcOh2lwMLANUfakH3ceytuTFlE7ZewI
	Tw6NFw5wjm9aIEcHcsgFknGbDY8s0Ono+0gnR+asRev51CPKe15/Wvp5jpcSNMt4p2IRYE6mKnW
	NgmXeFTjfPQOUoqAw==
X-Received: by 2002:a05:600c:8706:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-4a1d76224f0mr59164765e9.31.1792246928866;
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm74285205e9.2.2026.10.17.07.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 07:22:08 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
 <179180050742.66744.154947682767663962.b4-review@b4>
 <ZQ4PR01MB12029910538E78B60432F9B8F29D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Date: Sat, 17 Oct 2026 16:22:06 +0200
Message-Id: <179224692686.859276.1840996329833650526.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=9VB+n9r8SAtE7pgAuVrM0JM4YuxP7Q20SYsFzX4ewR8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmXW/oNnjycuHTRz/v1c2U2/gvJidgvcJGDpzn+6vMVi
 Yu3nfG931HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJfBBkZFiYnqcvt4u5xWle
 87Sy9Vx/fue/UZFpWx/sIWTUVtNQu5qRoX3yom1vHzbEr0ya/SfXNfJScmZv15uZvXxlWbXSNta
 B7AA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_072212_109867_D6B4C696 
X-CRM114-Status: GOOD (  26.56  )
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

On 2026-10-14 03:16 +0000, Changhuang Liang wrote:
> Hi, Jerome
> 
> > > Some StarFive clocks only advertise the divider and invert
> > > capabilities (via JH71X0_CLK_INVERT, without ENABLE). Add the
> > > JH71X0_IDIV() macro to declare such clocks, and jh71x0_clk_idiv_ops,
> > > which combines the divider rate operations with get_phase/set_phase.
> > >
> > 
> > Please rephrase, I don't understand what you mean
> > 
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
> > > drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
> > >  2 files changed, 20 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > index c5ee82db3c92..224fcc3d08db 100644
> > > --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> > > @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
> > >  	.debug_init = jh71x0_clk_debug_init,  };
> > >
> > > +static const struct clk_ops jh71x0_clk_idiv_ops = {
> > > +	.get_phase = jh71x0_clk_get_phase,
> > > +	.set_phase = jh71x0_clk_set_phase,
> > > +	.recalc_rate = jh71x0_clk_recalc_rate,
> > > +	.determine_rate = jh71x0_clk_determine_rate,
> > > +	.set_rate = jh71x0_clk_set_rate,
> > > +	.debug_init = jh71x0_clk_debug_init,
> > 
> > Instead of trying to cover all the combination that could exist, can you just
> > chain 2 elements ?
> > a div then an inv ?
> 
> This may require introducing quite a few new changes.
> 
> In the current code, struct clk_hw *hw is used to obtain struct jh71x0_clk *clk through hw, and then the register offset is obtained through clk->idx.
> 
> static void jh71x0_clk_reg_rmw(struct jh71x0_clk *clk, u32 mask, u32 value)
> {
> 	struct jh71x0_clk_priv *priv = jh71x0_priv_from(clk);
> 	void __iomem *reg = priv->base + 4 * clk->idx;
> 	unsigned long flags;
> 
> 	spin_lock_irqsave(&priv->rmw_lock, flags);
> 	value |= readl_relaxed(reg) & ~mask;
> 	writel_relaxed(value, reg);
> 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
> }
> 
> static int jh71x0_clk_enable(struct clk_hw *hw)
> {
> 	struct jh71x0_clk *clk = jh71x0_clk_from(hw);
> 
> 	jh71x0_clk_reg_rmw(clk, JH71X0_CLK_ENABLE, JH71X0_CLK_ENABLE);
> 	return 0;
> }
> 
> Therefore, the existing code has one struct clk_hw corresponding to one register offset.
> 
> If it is split into a div and an inv, two struct clk_hw descriptions will be needed.
> The jh71x0_crg_probe() will need to implement different branches for different clocks:
> 
> if (a div and an inv) {
>     devm_clk_hw_register (div)
>     devm_clk_hw_register (inv)
> } else {
>     devm_clk_hw_register (other)
> }
> 
> Do you need me to make this part of the adjustment?

No, it is ok this time around but understand that if this patterns repeats, you will have to
fix this. Best would be to start thinking about it at least.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
