Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A2FC52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Aug 2024 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=0Ii6hovbpW1FUw6/8vqn+Hi08xXZjosqGS8ahKyIMl4=; b=sBXXIA+yC/Zunv
	hu4NO9NTiKPfUohG2Lkbt65cD0kQYjNrK0JeWjm2hhKhVVHXwFZ8ccihMQFsPEjZJtTrJjSxhM1Jj
	Ji2zPSlD7jqXqyK7Htyn7EoiJFDujavZof7eUCg3CBidi6vCpShgtFuvXilsLHST1zzwAYcyaPcsr
	nK+SMRC48Np3NWP+vGzqhl+HjTzNVgsXPH15UuzaJraxnCLqyQAg9Ph9GR7lQ9Zq/HySc1qxW9b4n
	SXscJMQHsIHt3mRHYlWefYa1x1ha6vtztkdW4x72c55pH2ISSHRAWrzgFMJ0LHVLS9Ths/Gl1LKpr
	DaCC/tLYzhoi2VEIOSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd8kl-0000000Fbyl-3kIH;
	Sun, 11 Aug 2024 13:36:59 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sd8ki-0000000Fbxr-1jag
	for linux-riscv@lists.infradead.org;
	Sun, 11 Aug 2024 13:36:58 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52efd8807aaso4505377e87.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 Aug 2024 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723383414; x=1723988214; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cig1+J77dIPekmdgbTlikcW8VVCG5pt4tWITgQBHG4I=;
        b=JwyAWx6lRoSoKLmR9feWZPhZerd8AOli/ZWwJedroyqn07HdD6DWMjkFx28fKQrOZF
         rUMYx4/cEzz3OfYygK6Zxt1jd0ThLN2J1GVxWQj3wAhf6fm58MoP7ZQvY9WjRCeVXhs/
         txhS6l5NNEpqXqo5riKfB4p6vxC3/Yz2n1EbdeQ3gZKvkLE9p8hZT5i2l3s+8ffs5yFo
         ksHMSeloOlQ6wjPtvt1pYoynK/QVjIrqp7/JMExoZvwn7AoYTyrIc/wT0GyaAoFfBp8K
         CfPDhwNgfbpT/oomp+FxlVk4sj2nPCyRp+sysQV/LUgy3sVJQQ7OyafzhLDmPSV7RoYv
         HLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723383414; x=1723988214;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cig1+J77dIPekmdgbTlikcW8VVCG5pt4tWITgQBHG4I=;
        b=uQsXAC0NlRkaf8O4mG6Q3mqV+UvcVoh0NGbldiOyQPTisjgwAD0ZsGktSnReBLijdd
         FjdGUfGuMoPMBiO08UhxGfjsOm/rzM0h7E8kcLcgM+4audsKeOvzj48QyS2XhShBZ5qw
         5udQ6JdI7o9EhHpuwIHzsUsxEYQdPngxZgg0nrBwZcFrYHqCD4HSkoqXyFqeyoBZ3PkI
         G9LJiL0ftyf5E79qHyxI23gj/1bXZB/xRP668TFfgxOnUhpNy+DSHUu1oAro3LX6yygQ
         Jo5KIy1CqhiwEAgd7kcVmFxuh4sJ7GscZDjsBTy6+wkCui2mdFeO5uUv4/PRQJdsSIBr
         DMEg==
X-Forwarded-Encrypted: i=1; AJvYcCVQYXOQ9tx3vqgRlpTe856gZhuyFpmMLYstxtOLfLRe05NFd8MiI6ODI03ZouY8E5MXLxan9VDz8vHrH1CdHh/EsDervHriecoG2ClfyVPG
X-Gm-Message-State: AOJu0Yz8Hnqi+7FmvA6DmH6PDzhvn18UppNSwnuABbsmMd4Hi6uBUN7y
	tlJarSjFaESbBYJq4RWioVeaJldsgQcVjW5RX+G/8BcKUg8bh6HPz5GMtlIrr4E=
X-Google-Smtp-Source: AGHT+IHt33AuHPjxUd4uOwuYX+OCWuwzGXpabOgvFL5h/RJY7EsClSLXTXMTL71IPhLvH3UFICIxFw==
X-Received: by 2002:a05:6512:3b08:b0:52f:c24b:1767 with SMTP id 2adb3069b0e04-530ee9742f8mr4787738e87.19.1723383413675;
        Sun, 11 Aug 2024 06:36:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb0e1288sm147807766b.80.2024.08.11.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 06:36:53 -0700 (PDT)
Date: Sun, 11 Aug 2024 16:36:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to
 controller
Message-ID: <053d3e9f-ba32-406c-a799-91ea577a0cb9@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka@siemens.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_063656_487791_0BA75B35 
X-CRM114-Status: UNSURE (   8.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Jan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kiszka/dt-bindings-phy-jh7110-usb-phy-Add-sys-syscon-property/20240802-101748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/cd7b125c8c797f9d63440944df7121f9db0a49ad.1722457123.git.jan.kiszka%40siemens.com
patch subject: [PATCH 3/3] phy: starfive: jh7110-usb: Fix link configuration to controller
config: microblaze-randconfig-r072-20240810 (https://download.01.org/0day-ci/archive/20240811/202408110917.hE9xidPH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408110917.hE9xidPH-lkp@intel.com/

smatch warnings:
drivers/phy/starfive/phy-jh7110-usb.c:148 jh7110_usb_phy_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +148 drivers/phy/starfive/phy-jh7110-usb.c

16d3a71c20cf2e Minda Chen 2023-06-29  109  static int jh7110_usb_phy_probe(struct platform_device *pdev)
16d3a71c20cf2e Minda Chen 2023-06-29  110  {
16d3a71c20cf2e Minda Chen 2023-06-29  111  	struct jh7110_usb2_phy *phy;
16d3a71c20cf2e Minda Chen 2023-06-29  112  	struct device *dev = &pdev->dev;
16d3a71c20cf2e Minda Chen 2023-06-29  113  	struct phy_provider *phy_provider;
0ed73d833230fd Jan Kiszka 2024-07-31  114  	u32 args[1];
16d3a71c20cf2e Minda Chen 2023-06-29  115  
16d3a71c20cf2e Minda Chen 2023-06-29  116  	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
16d3a71c20cf2e Minda Chen 2023-06-29  117  	if (!phy)
16d3a71c20cf2e Minda Chen 2023-06-29  118  		return -ENOMEM;
16d3a71c20cf2e Minda Chen 2023-06-29  119  
16d3a71c20cf2e Minda Chen 2023-06-29  120  	phy->usb_125m_clk = devm_clk_get(dev, "125m");
16d3a71c20cf2e Minda Chen 2023-06-29  121  	if (IS_ERR(phy->usb_125m_clk))
16d3a71c20cf2e Minda Chen 2023-06-29  122  		return dev_err_probe(dev, PTR_ERR(phy->usb_125m_clk),
16d3a71c20cf2e Minda Chen 2023-06-29  123  			"Failed to get 125m clock\n");
16d3a71c20cf2e Minda Chen 2023-06-29  124  
16d3a71c20cf2e Minda Chen 2023-06-29  125  	phy->app_125m = devm_clk_get(dev, "app_125m");
16d3a71c20cf2e Minda Chen 2023-06-29  126  	if (IS_ERR(phy->app_125m))
16d3a71c20cf2e Minda Chen 2023-06-29  127  		return dev_err_probe(dev, PTR_ERR(phy->app_125m),
16d3a71c20cf2e Minda Chen 2023-06-29  128  			"Failed to get app 125m clock\n");
16d3a71c20cf2e Minda Chen 2023-06-29  129  
16d3a71c20cf2e Minda Chen 2023-06-29  130  	phy->regs = devm_platform_ioremap_resource(pdev, 0);
16d3a71c20cf2e Minda Chen 2023-06-29  131  	if (IS_ERR(phy->regs))
16d3a71c20cf2e Minda Chen 2023-06-29  132  		return dev_err_probe(dev, PTR_ERR(phy->regs),
16d3a71c20cf2e Minda Chen 2023-06-29  133  			"Failed to map phy base\n");
16d3a71c20cf2e Minda Chen 2023-06-29  134  
16d3a71c20cf2e Minda Chen 2023-06-29  135  	phy->phy = devm_phy_create(dev, NULL, &jh7110_usb2_phy_ops);
16d3a71c20cf2e Minda Chen 2023-06-29  136  	if (IS_ERR(phy->phy))
16d3a71c20cf2e Minda Chen 2023-06-29  137  		return dev_err_probe(dev, PTR_ERR(phy->phy),
16d3a71c20cf2e Minda Chen 2023-06-29  138  			"Failed to create phy\n");
16d3a71c20cf2e Minda Chen 2023-06-29  139  
16d3a71c20cf2e Minda Chen 2023-06-29  140  	phy_set_drvdata(phy->phy, phy);
16d3a71c20cf2e Minda Chen 2023-06-29  141  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
16d3a71c20cf2e Minda Chen 2023-06-29  142  
0ed73d833230fd Jan Kiszka 2024-07-31  143  	phy->sys_syscon =
0ed73d833230fd Jan Kiszka 2024-07-31  144  		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
0ed73d833230fd Jan Kiszka 2024-07-31  145  						     "starfive,sys-syscon",
0ed73d833230fd Jan Kiszka 2024-07-31  146  						     1, args);
0ed73d833230fd Jan Kiszka 2024-07-31  147  	if (IS_ERR(phy->sys_syscon))
0ed73d833230fd Jan Kiszka 2024-07-31 @148  		return dev_err_probe(dev, PTR_ERR(phy->phy),

Passing the wrong variable.  It should be phy->sys_syscon instead of phy->phy.

0ed73d833230fd Jan Kiszka 2024-07-31  149  			"Failed to get sys-syscon\n");
0ed73d833230fd Jan Kiszka 2024-07-31  150  	phy->sys_phy_connect = args[0];
0ed73d833230fd Jan Kiszka 2024-07-31  151  
16d3a71c20cf2e Minda Chen 2023-06-29  152  	return PTR_ERR_OR_ZERO(phy_provider);
16d3a71c20cf2e Minda Chen 2023-06-29  153  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
