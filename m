Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23513CD4F54
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 23:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXDfW7WRdL9TFvYp3RiCiDYu+ehztzV/GjJ+9cpSdyA=; b=qkjJHVnfLBLXiF
	iSyYL+Xcgr0Qa6L0LXHFIbbYn70umF5SJDd0jvi6G4CXZYk7TrjqP6jRT8E3noVgmyZfNeLPehgk6
	4p9+Cyg5CfRUZXDFkED7ry+FHSKclHcjQVqFChnTa8kLaQrd1rNegNtiu97ei1ySutxd43LVL5J+x
	hEbeEH91/fuuQzARaDBWcZr4uHPGVNaikMqJ5qBCs3/MWXwRbILhlkyHBUi4jDxjbu94iNgrXrBR8
	LlUgp6an2lQvT5Asa4hFWvb5JBW16jeO4w4yqPfu4ldkeKGrV+yliFg+jfUhPLL+jvuGV8xGQhozx
	SQ6KNLJ6NsAqGI8Jw0KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTlB-000000032zL-2Fbd;
	Tue, 19 May 2026 23:22:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPTl8-000000032ya-31Mv
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 23:22:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 619A844398;
	Tue, 19 May 2026 23:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA371F000E9;
	Tue, 19 May 2026 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779232917;
	bh=rTHVrMvCwYTZlktit7SkyBCR9EOe2m+vAOtAPQ7Cebk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OH0BZj/N3kGv0Krj7B8nAn/aKUUeD0Rg7L0DfA3kXFym101kBPtk07yt3Jc2y0wEQ
	 KROqKjkHqzcqj1jdg6WGggS81iCbX82cmNxjrFIQnBjzyDL3lGnMvaXSC7XPteDOiX
	 uhxE1jgpaqweBOkwjytfCsqa9pNKtLw/Fj1UVEGrmrsF9G+UVDARBvDCffthdh1lVw
	 0upvOwMEx37iVh8MDYANV03I9xE4QhrU50ne/CHZse9O9N4hdg+vz/Yx1nxNMVgd0M
	 lPaBjARuSL+j5X4e/RCrAddi4cZJpmYSapDsA+vMKbMEV/nt1aoikZ/6/Ah1nLsvMg
	 n9p2nEbTpi3oQ==
Date: Tue, 19 May 2026 23:21:54 +0000
From: Yixun Lan <dlan@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
Message-ID: <20260519232154-GKA3708537@kernel.org>
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_162158_781700_87E64882 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Junhui Liu <junhui.liu@pigmoral.tech>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Linus,

Can you take this as a fix for v7.1 cycle?

On 00:40 Wed 20 May     , Han Gao wrote:
> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
> 
> 	const struct spacemit_pin *spin = spacemit_get_pin(pctrl, pin);
> 	...
> 	if (!pin)
> 		return -EINVAL;
> 
> 	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> 
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
> 
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
> 
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
LGTM, thanks

Reviewed-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/pinctrl/spacemit/pinctrl-k1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/spacemit/pinctrl-k1.c b/drivers/pinctrl/spacemit/pinctrl-k1.c
> index b0be62b1c816..95024e2bb5a5 100644
> --- a/drivers/pinctrl/spacemit/pinctrl-k1.c
> +++ b/drivers/pinctrl/spacemit/pinctrl-k1.c
> @@ -795,7 +795,7 @@ static int spacemit_pin_set_config(struct spacemit_pinctrl *pctrl,
>  	void __iomem *reg;
>  	unsigned int mux;
>  
> -	if (!pin)
> +	if (!spin)
>  		return -EINVAL;
>  
>  	reg = spacemit_pin_to_reg(pctrl, spin->pin);
> -- 
> 2.47.3
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
