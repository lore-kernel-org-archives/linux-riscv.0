Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386D8D4117B
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVQJrUJEsJq9j88cpGbZuLYQVGCxmJMp0bs3GSVKNzs=; b=XbPh741tXRCEZh
	Srq226DlDCiYHkfi18A85lx9BLYE9BqJF0Q1TyddKeFQnAIjQbfpymIgLTJIwuiY/8rDIszEw9xtu
	f6y988x4A7adq/AyEJ6lhgbIhY4D0smjIgSMzLzJDHHLt46e+x2o/zrStB4jh4zPWkydYDHDuDrtE
	qUygWVff+d+i33NFYW5RC4Gv0Wa0WwZZZBL727EL+l2AUxZFEhvwDpquNv6aOAB2EhMuHalzu23CS
	/OdlVT3uuuVIzwgynXDbOX7GCi7aTMtLgrtToOS+vjth2ktE/lyQWCkcAUomVHdeIq/RDk/lCLWi9
	19d9FblWx5qB4BA/qlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgM6v-0000000CIBr-1Jp1;
	Thu, 15 Jan 2026 12:05:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgM6t-0000000CIBC-1Rwa;
	Thu, 15 Jan 2026 12:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 732024382C;
	Thu, 15 Jan 2026 12:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96987C116D0;
	Thu, 15 Jan 2026 12:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768478752;
	bh=gyEcUiyPUyExWka3HAxwmztaJczxw+a1BT05wunTPkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEkSErFNcunZoacCd9uro5tSYp9gBbvzRrbtzj+hB1FU9Srw2ig44fCLEcDduLYNm
	 HF3igZ69i5imQEaAjZPfl3/3onhQWzn8qyJNdd50Z821iJ7BKC/fhmRr8a9m+vA+Og
	 ocfbCmuIFwdk81Qn+TjlkHxexg2n3Sp1Eqq3ssZSAV8JgbXxLhojez3UHFWbGzhswN
	 mzvTq+qBU79Muu6k2YfzqyQS8ZjbqWC5kec2c6WPX1dZ3X1LGDNOkB9F3LvYD1CHZY
	 1CHueLYlmiUG4ty5Xw2FQ/lX+Io/DhIYt5iDKf+UYMlhyNm0lPlcU80G7ku+OeDadt
	 aGHrxrReyrmEA==
Date: Thu, 15 Jan 2026 17:35:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Cc: conor@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, 18771902331@163.com, cyy@cyyself.name,
	TroyMitchell988@gmail.com, kingxukai@zohomail.com,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, gaohan@iscas.ac.cn
Subject: Re: [PATCH v2 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aWjYHK1cTj8Dbz2B@vaman>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_040555_405786_4EE8FFD3 
X-CRM114-Status: GOOD (  11.20  )
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

On 15-01-26, 14:42, Jiayu Du wrote:

> +static struct phy *k230_usb_phy_xlate(struct device *dev,
> +				      const struct of_phandle_args *args)
> +{
> +	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
> +	struct k230_usb_phy_instance *phy_inst;
> +	struct phy *phy;
> +
> +	if (args->args[0] >= MAX_PHYS)
> +		return ERR_PTR(-EINVAL);
> +
> +	phy_inst = devm_kzalloc(dev, sizeof(*phy_inst), GFP_KERNEL);
> +	if (!phy_inst)
> +		return ERR_PTR(-ENOMEM);
> +
> +	phy_inst->global = global;
> +	phy_inst->index = args->args[0];
> +
> +	phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
> +	if (IS_ERR(phy))
> +		return ERR_PTR(PTR_ERR(phy));
> +
> +	phy_set_drvdata(phy, phy_inst);

This seems wrong place, why is this not done in the driver probe?

> +
> +	return phy;
> +}
> +
> +static int k230_usb_phy_probe(struct platform_device *pdev)
> +{
> +	struct k230_usb_phy_global *global;
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +
> +	global = devm_kzalloc(dev, sizeof(*global), GFP_KERNEL);
> +	if (!global)
> +		return -ENOMEM;
> +	dev_set_drvdata(dev, global);
> +
> +	global->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(global->base))
> +		return dev_err_probe(dev, PTR_ERR(global->base),
> +				     "ioremap failed\n");
> +
> +	global->reg_test_offset[0] = 0x70;
> +	global->reg_ctl_offset[0] = 0xb0;
> +	global->reg_test_offset[1] = 0x90;
> +	global->reg_ctl_offset[1] = 0xb8;

Where are these magic values coming from?

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
