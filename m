Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A7FCA9ED2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 10:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1UaQ0KLpI+0oXy8xZwTC4N4W5qdru2Yf6hy/aayNcQ=; b=AxMAccCGnob8gk
	1xCojFZ89wpQapHBRFP9g/Y0pdMMYQ8gesTvuaMQs/3lUizQ+dAQkAO56JovncYwnciVqKUkBCZ7X
	0914n/caXDY8oYhZPHIhc3/3iWEHA8Qlzxm01ARolL7mEW0pog63ikXcBwD2RUE6al+HW/aKPtgRx
	C9ZN4tAfU4XdchyH7IKfl/RV2LiHigWeT8m5gAGmBNqtL/IEkwfmGnHK+yhhz5CqlJkuUFcZzEQfx
	NJzQZbOIwBxonzuGPhM009ZfYVhYp/GmHf9j3OK4m6cTPfCYj8zlVN6nabDLZmtoTGxIr6g6kOS3P
	GyWMy+xsp+8CaGfIaPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAe-0000000ADDp-3Pjh;
	Mon, 12 Oct 2026 10:22:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDAS-0000000ACxA-20Fl
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 10:22:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a020e65269so10213265e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 03:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800523; x=1792405323; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wSG3oCF74JWXW1bTfxbde+arlZoaBNLQIBfAv04jt2A=;
        b=SzaJxdYeOZzYxY+4Q/6OM3/fFPLK6/TJUF4POSfi2DJ6K9Ggekj1qbgBdlcueYSWSG
         KcdHuCWMkBEm7rUlKA1irKRsmvOzRIa4+aXpOBeoaCgcWh1IvFWjGmlpZVLfUY1mkb2f
         7Njjiq727ew/fGgboQGkcFXK1Q2mGqRPO29J+/eW8Kk+FF3VNyzU3IsE69ze8Jle+mIe
         LTwzb9zlaiIGdwBr9TOprS0ZJWnM13uI1lpRX6hL5KF7E9t6+oKea9WICsqFruA+PM70
         g7PTvhegRvGet7Z57UYfNd6ApZ+aw4co5dF//AlCCfAEtzCO6evOruDVEVblMPFiRTQT
         6zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800523; x=1792405323;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSG3oCF74JWXW1bTfxbde+arlZoaBNLQIBfAv04jt2A=;
        b=rw17BhPUEWyuo63xDLCNbQX90Uckaa0z00cHiOeOiKbdKK6tWHMpbOV4I+6Cj/meAh
         boOgzYQz2hPu5CI8JxQpc59DR9WBxj8AZdcbojzSv7jpnzN0ZKV+qBtX2mLmo72r9DOp
         AzYH9F2aq2e/fj3teNZrQeoh6b1rKUERVhu5yy8QlrCSof/bLV1BD5VuwS9y9kXr3TR2
         oUWsXCCxQyHB6DaePsuzq94YhpXxZlOLYwqf0Map4gUOUHRXjD74f/SpIe1XQLsdldO1
         yHGd/m7KgQDWM/uzJSu6wP+kB8TlCuvORXgOLLzxemB3t8G6rRE5VmGLm5/SILGARrP4
         sqwA==
X-Forwarded-Encrypted: i=1; AKwUvBxYsQazIqKEHHWFjk6jkbqImb3faHm0mSffN3gQcY2c1X2nZ6Fze4WG1+hHxtl9b3gn56UvmAKP8B5azw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKG1JBA2Z76Iz9m1/dKDcN1b/QdaziFoh5Dg6ktYblv9B9OdeOI
	1jTIsb2ZLRHgbwkCY0FLyphEHnmf9bwypX3HpDKVhiheZ3JFO3eEce2R+NBvUVu68zk=
X-Gm-Gg: AYBFou3l1LyN/4TP1xvY7R2GbTqdQ01PgqNf0kcP2rr8hH/QIKP9jZbHuJkEIe6FH+2
	vHvcBNG50H4rcXr9PScskyDFXuhnW/p7smowgTItrjXVJKqRXY1lntGE9nls2VvgCySwbux+nCP
	o7hbOS5S1Sh8OXaCsBqYooMtksYelmyUiLagi4gIXJ1CH7Tb44mw9SuL0OoRmmXOpTNOYolDAkU
	VVC3hPLDuIEPFZBtaZO6Xr9FyPkxuF+OtuwrcPD+sWez2XK7fOnCftEU7gaIUaxedjcrleVUSq8
	jNsvIqAq0zU0H10xTCaba7T9ZGaNnNHHnOaPPuefJXZQyOpnlpvgFcQlXTyXHiMU0pNNMX/AQK7
	+oPElO4Bpp45AV7ETwwERvpSGmIj9unHOEUFC8Kle68gg+l1ZfPKx+N4oh+PqHtMrxA4+H4nVD2
	fHPrT1HCcS7Wj4NK4H1CsGtJTGlvvFRLIROdrjwf73l/6IjULXFifcpwS9/Mt2Gjy2/lsj/RmUY
	pcXOd+W+7fHY05wVqA=
X-Received: by 2002:a05:600c:83c9:b0:4a1:70f0:ac2 with SMTP id 5b1f17b1804b1-4a18e4ce9cfmr166723875e9.24.1791800522611;
        Mon, 12 Oct 2026 03:22:02 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm287466995e9.12.2026.10.12.03.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:22:02 -0700 (PDT)
MIME-Version: 1.0
Subject: Re: [PATCH v6 08/15] clk: starfive: Introduce idiv ops for
 inverted divider clocks
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-9-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <20261008123338.11081-9-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050742.66744.154947682767663962.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=pnNxWb9NIET8zGXgnh0fPk0259Mg14jdBHHSwczKVxY=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuzfrGv/WEVPdLV5tHi+YeOfQ+VnD2SnVaRfezHz5
 Y/GG1IVHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIlsMM/7PO393IYNV8xrem
 Xe/NxPVv8vr9OZQETj54s20bm9+6VS4M/4uY/t2dl8IocOm5ht2cHEdHrvlqeetVPLXDXq3RWh5
 fzgMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_032204_593861_3A407733 
X-CRM114-Status: GOOD (  17.79  )
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

> Some StarFive clocks only advertise the divider and invert capabilities
> (via JH71X0_CLK_INVERT, without ENABLE). Add the JH71X0_IDIV() macro
> to declare such clocks, and jh71x0_clk_idiv_ops, which combines the
> divider rate operations with get_phase/set_phase.
>

Please rephrase, I don't understand what you mean

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 13 ++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h |  8 ++++++++
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index c5ee82db3c92..224fcc3d08db 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -303,6 +303,15 @@ static const struct clk_ops jh71x0_clk_inv_ops = {
>  	.debug_init = jh71x0_clk_debug_init,
>  };
>  
> +static const struct clk_ops jh71x0_clk_idiv_ops = {
> +	.get_phase = jh71x0_clk_get_phase,
> +	.set_phase = jh71x0_clk_set_phase,
> +	.recalc_rate = jh71x0_clk_recalc_rate,
> +	.determine_rate = jh71x0_clk_determine_rate,
> +	.set_rate = jh71x0_clk_set_rate,
> +	.debug_init = jh71x0_clk_debug_init,

Instead of trying to cover all the combination that could exist, can you just chain 2 elements ?
a div then an inv ?

> +};
> +
>  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  {
>  	if (max & JH71X0_CLK_DIV_MASK) {
> @@ -313,7 +322,9 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
>  		}
>  		if (max & JH71X0_CLK_ENABLE)
>  			return &jh71x0_clk_gdiv_ops;
> -		if (max == JH71X0_CLK_FRAC_MAX)
> +		else if (max & JH71X0_CLK_INVERT)
> +			return &jh71x0_clk_idiv_ops;
> +		else if (max == JH71X0_CLK_FRAC_MAX)
>  			return &jh71x0_clk_fdiv_ops;

Given the branches return, if was enough and you did not need to modify the existing path.

-- 
Jerome


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
