Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A02C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 06:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fcHesd+RRZqUq916K13aV5otVanfsEUBgt1/GDErjiU=; b=hYba40U9FSNMYA
	wVpfn+J50KDPuYg4cFPzRt7lp3Yb+rW4VOVm7Fo8mJ5piIn3fMY10zCCc38EN+yDTeArjWNsbYY1l
	dWDZOjmB170liKH/zW/Y+J+6mVbNcZmKbqFySKR+3AiVtiI70EgQ5duMroOhvPnzJCyaw2euxYGjg
	Xc5Zsxy2G6gYTBl82tWRb5zpsNQaE4UpqGMAL0LmONZh97ty+k/cjkaR9zDBOeALJYBoGqNfSI3xK
	+xxGjrjoB0XPT9Gmtb4HvYaWr6S0R2E+x14i6Lxe/3YHp1woXEynrUx6GznDiT6ZmCUcwU3BPLm6y
	jbRjihh/A2ieZh2ojJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2hz-0000000Digs-3vLe;
	Fri, 27 Jun 2025 06:37:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2bf-0000000Di3W-43QR;
	Fri, 27 Jun 2025 06:30:41 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-23633a6ac50so25789125ad.2;
        Thu, 26 Jun 2025 23:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751005839; x=1751610639; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iS5tVSNWUllBELvROnskbRuvuRv6gr3FeSaDzg0SVcg=;
        b=hnlt6EcexUyWk5CN4gilBPQymBX6EjqQThiOHEIZUcXvTfP1FWFWafLb79ypbwB0WR
         Hqu1bCVti7vzAHSP6byShPcbLRQdpxJ3L5QyGI1NjQAyJaAutePX7ias91fCn7mYMxdb
         yf+64kbG7iBYZ6zqIl0rnErJ8BsZLE2pYAruc82kM0y0bdI5uzAg2IG1LnbPU7KWrlxM
         UOTMCOHDpd0AtS+f8l3QIhofAWXqw6iug4DVrthDmMbhxoJ63Q/Sn+7e6MHgU5QxGJGD
         uDU0TsG1/mklYQob2ZpHrPdbhJGiliVkWh0zwBftiyfZEDViSuBSEIeLmccbS7MPytYn
         sRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005839; x=1751610639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS5tVSNWUllBELvROnskbRuvuRv6gr3FeSaDzg0SVcg=;
        b=lGRbAeNloPYEA50BXqm8cTj9oHy96e8iFUTp+lm+FMGMzUi8VQTx4J1vuQvBudvwj9
         QQg3oI52RFpfOF/3jnRCtU6yexoPgBzHK0Wfuy4S3lB39u5RWykvZ1JDpirldg2AEtZ0
         2zxlzQWOK7Wzod1uflEP7eVWS0JwYT+qCAPIQ4SaKmILv77gfxu3nXzujcM6RPiTd9B+
         9TmGXXYtuWbz7wBsn7hQQUh67BNosM8KIz5m80yLp4IgPRh/6fhLaaWhkhUj+G58bhQb
         u/N38SokhH4h3v/VMwf6tBiZeSJNTntvKNI0ePAT0P3wF0efpS7giRU3FbHENHWOnMKx
         s3xg==
X-Forwarded-Encrypted: i=1; AJvYcCUpuN6M7L/yupBPNQO3/LSPGnLR4+n8kHJBmtDZOwVbOz4hqZcwyfB+OrUiq3zPeKE04ktxU/Afj8HuAO4=@lists.infradead.org, AJvYcCWpr9TnTqzLOirkUlH1Zr4Bl0s6Oh48hXoUMPeXpiiCqHnzv0FWg+qpIqYMz/zY9fbJlwQKQ1NIylM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzbFOG8vByoSlEvoMM5eO4WxjeIZy+yGx/3jwCqD9U/sakH84dU
	J/76cvDYy1ykU/DkmQFFEuAL3AxPE91f2Rs9KiBj8WO3x9dCaM4vkvdq
X-Gm-Gg: ASbGncsHXGZx3L8dO5H6Hc9Q8hubTz8wtj68wPO1NZuI4mR2Ty0TwBIiByFtUd/7l19
	KdN8zdJnPC7Q7j7zj5GIuS9B7DrmWsljGm96lsj3spwJkWurWDKouDolHvW/gFeYzDyqXhSn3xo
	9jeMLntEPNjQi7Xy0/IZQ2YoVZT17RGTI31+6Yw320n3XYCSxGYn6vcU3aagbV7o8SUzd49manK
	+P+EVCmzdfBRLBeV8avtJhi8y6rde5aw7nKoj714mqJv68SpIdVdpQpooc+yP3US2sjnWo2l/hl
	Q0Bt5GfNTV2MlIDhvLhjgLNj5MBdyyG8giFC4f6ykKUSoWUpMTibenVAI09DnA==
X-Google-Smtp-Source: AGHT+IE+7b9v9Zj2LkXyd2nC+NZQDpDyK3bypoGbpAIzajLvSyCeyoIKvei7PJggtI88oZ0VmbeCOg==
X-Received: by 2002:a17:902:ea0e:b0:238:f2a:8893 with SMTP id d9443c01a7336-23ac4654004mr32944735ad.42.1751005838719;
        Thu, 26 Jun 2025 23:30:38 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23acb2e219asm9090255ad.40.2025.06.26.23.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:38 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:30:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 2/2] phy: sophgo: Add USB 2.0 PHY driver for Sophgo
 CV18XX/SG200X
Message-ID: <kt3envdgn7kxjjvu6mm5hozb3ml64d4s54ssozljmr7qttvxij@hnuzfawjspoy>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-3-inochiama@gmail.com>
 <aF3i3L4BF6YgUMcO@vaman>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aF3i3L4BF6YgUMcO@vaman>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_233040_016283_3A4FAF9F 
X-CRM114-Status: GOOD (  36.82  )
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

On Thu, Jun 26, 2025 at 05:16:28PM -0700, Vinod Koul wrote:
> On 11-06-25, 16:18, Inochi Amaoto wrote:
> > Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X. Currently
> > this driver does not support OTG mode as lack of document.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  drivers/phy/Kconfig                  |   1 +
> >  drivers/phy/Makefile                 |   1 +
> >  drivers/phy/sophgo/Kconfig           |  19 +++
> >  drivers/phy/sophgo/Makefile          |   2 +
> >  drivers/phy/sophgo/phy-cv1800-usb2.c | 222 +++++++++++++++++++++++++++
> >  5 files changed, 245 insertions(+)
> >  create mode 100644 drivers/phy/sophgo/Kconfig
> >  create mode 100644 drivers/phy/sophgo/Makefile
> >  create mode 100644 drivers/phy/sophgo/phy-cv1800-usb2.c
> > 
> > diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> > index 58c911e1b2d2..678dd0452f0a 100644
> > --- a/drivers/phy/Kconfig
> > +++ b/drivers/phy/Kconfig
> > @@ -122,6 +122,7 @@ source "drivers/phy/renesas/Kconfig"
> >  source "drivers/phy/rockchip/Kconfig"
> >  source "drivers/phy/samsung/Kconfig"
> >  source "drivers/phy/socionext/Kconfig"
> > +source "drivers/phy/sophgo/Kconfig"
> >  source "drivers/phy/st/Kconfig"
> >  source "drivers/phy/starfive/Kconfig"
> >  source "drivers/phy/sunplus/Kconfig"
> > diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> > index c670a8dac468..bfb27fb5a494 100644
> > --- a/drivers/phy/Makefile
> > +++ b/drivers/phy/Makefile
> > @@ -35,6 +35,7 @@ obj-y					+= allwinner/	\
> >  					   rockchip/	\
> >  					   samsung/	\
> >  					   socionext/	\
> > +					   sophgo/	\
> >  					   st/		\
> >  					   starfive/	\
> >  					   sunplus/	\
> > diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
> > new file mode 100644
> > index 000000000000..2c943bbe1f81
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/Kconfig
> > @@ -0,0 +1,19 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Phy drivers for Sophgo platforms
> > +#
> > +
> > +if ARCH_SOPHGO || COMPILE_TEST
> > +
> > +config PHY_SOPHGO_CV1800_USB2
> > +	tristate "Sophgo CV18XX/SG200X USB 2.0 PHY support"
> > +	depends on MFD_SYSCON
> > +	depends on USB_SUPPORT
> > +	select GENERIC_PHY
> > +	help
> > +	  Enable this to support the USB 2.0 PHY used with
> > +	  the DWC2 USB controller in Sophgo CV18XX/SG200X
> > +	  series SoC.
> > +	  If unsure, say N.
> > +
> > +endif # ARCH_SOPHGO || COMPILE_TEST
> > diff --git a/drivers/phy/sophgo/Makefile b/drivers/phy/sophgo/Makefile
> > new file mode 100644
> > index 000000000000..318060661759
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_PHY_SOPHGO_CV1800_USB2)	+= phy-cv1800-usb2.o
> > diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
> > new file mode 100644
> > index 000000000000..1d21db7f875b
> > --- /dev/null
> > +++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
> > @@ -0,0 +1,222 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +#include <linux/of_gpio.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/regmap.h>
> > +#include <linux/spinlock.h>
> > +
> > +#define REG_USB_PHY_CTRL		0x048
> > +
> > +#define PHY_ID_OVERWRITE_EN		BIT(6)
> > +#define PHY_ID_OVERWRITE_MODE		BIT(7)
> > +#define PHY_ID_OVERWRITE_MODE_HOST	FIELD_PREP(BIT(7), 0)
> > +#define PHY_ID_OVERWRITE_MODE_DEVICE	FIELD_PREP(BIT(7), 1)
> > +
> > +#define PHY_APP_CLK_RATE		125000000
> > +#define PHY_LPM_CLK_RATE		12000000
> > +#define PHY_STB_CLK_RATE		333334
> > +
> > +struct cv1800_usb_phy {
> > +	struct phy	*phy;
> > +	struct regmap	*syscon;
> > +	spinlock_t	lock;
> > +	struct clk	*usb_app_clk;
> > +	struct clk	*usb_lpm_clk;
> > +	struct clk	*usb_stb_clk;
> > +	bool		support_otg;
> > +};
> > +
> > +static int cv1800_usb_phy_set_mode(struct phy *_phy,
> > +				   enum phy_mode mode, int submode)
> > +{
> > +	struct cv1800_usb_phy *phy = phy_get_drvdata(_phy);
> > +	unsigned int regval = 0;
> > +	int ret;
> > +
> > +	switch (mode) {
> > +	case PHY_MODE_USB_DEVICE:
> > +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
> > +		break;
> > +	case PHY_MODE_USB_HOST:
> > +		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
> > +		break;
> > +	case PHY_MODE_USB_OTG:
> > +		if (!phy->support_otg)
> > +			return 0;
> > +
> > +		ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> > +		if (ret)
> > +			return ret;
> > +
> > +		regval = FIELD_GET(PHY_ID_OVERWRITE_MODE, regval);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
> > +				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE,
> > +				  regval);
> > +}
> > +
> > +static ssize_t dr_mode_write(struct file *file, const char __user *_buf,
> > +			     size_t count, loff_t *ppos)
> > +{
> > +	struct seq_file *seq = file->private_data;
> > +	struct cv1800_usb_phy *phy = seq->private;
> > +	enum phy_mode mode;
> > +	char buf[16];
> > +
> > +	if (copy_from_user(&buf, _buf, min_t(size_t, sizeof(buf) - 1, count)))
> > +		return -EFAULT;
> > +
> > +	if (sysfs_streq(buf, "host"))
> > +		mode = PHY_MODE_USB_DEVICE;
> > +	else if (sysfs_streq(buf, "peripheral"))
> > +		mode = PHY_MODE_USB_DEVICE;
> > +	else if (sysfs_streq(buf, "otg"))
> > +		mode = PHY_MODE_USB_OTG;
> > +	else
> > +		return -EINVAL;
> > +
> > +	return cv1800_usb_phy_set_mode(phy->phy, mode, 0);
> > +}
> > +
> > +static int dr_mode_show(struct seq_file *seq, void *v)
> > +{
> > +	struct cv1800_usb_phy *phy = seq->private;
> > +	unsigned long flags;
> > +	unsigned int regval;
> > +	bool is_host = true;
> > +	int ret;
> > +
> > +	spin_lock_irqsave(&phy->lock, flags);
> > +	ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &regval);
> > +	spin_unlock_irqrestore(&phy->lock, flags);
> > +
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (regval & PHY_ID_OVERWRITE_MODE)
> > +		is_host = false;
> > +
> > +	if (!(regval & PHY_ID_OVERWRITE_EN))
> > +		seq_puts(seq, "otg: ");
> > +
> > +	seq_puts(seq, is_host ? "host\n" : "peripheral\n");
> > +
> > +	return 0;
> > +}
> 
> This should be done by host controller and not phy and then use apis to
> set the mode for phy from controller, pls see other driver on how they
> do this
> 

Cool, I will remove this thing and let the controller do this.

> > +
> > +DEFINE_SHOW_STORE_ATTRIBUTE(dr_mode);
> > +
> > +static int cv1800_usb_phy_set_clock(struct cv1800_usb_phy *phy)
> > +{
> > +	int ret;
> > +
> > +	ret = clk_set_rate(phy->usb_app_clk, PHY_APP_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_set_rate(phy->usb_lpm_clk, PHY_LPM_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = clk_set_rate(phy->usb_stb_clk, PHY_STB_CLK_RATE);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> Should this not be return ret here? or just do return clk_set_rate()
> here
> 

I think return ret is the same as return 0. And it is a good
idea to just do return clk_set_rate.

> 
> > +}
> > +
> > +static const struct phy_ops cv1800_usb_phy_ops = {
> > +	.set_mode	= cv1800_usb_phy_set_mode,
> > +	.owner		= THIS_MODULE,
> > +};
> > +
> > +static int cv1800_usb_phy_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device *parent = dev->parent;
> > +	struct cv1800_usb_phy *phy;
> > +	struct phy_provider *phy_provider;
> > +	int ret;
> > +
> > +	if (!parent)
> > +		return -ENODEV;
> > +
> > +	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
> > +	if (!phy)
> > +		return -ENOMEM;
> > +
> > +	phy->syscon = syscon_node_to_regmap(parent->of_node);
> > +	if (IS_ERR_OR_NULL(phy->syscon))
> > +		return -ENODEV;
> > +
> > +	phy->support_otg = false;
> > +
> > +	spin_lock_init(&phy->lock);
> > +
> > +	phy->usb_app_clk = devm_clk_get_enabled(dev, "app");
> > +	if (IS_ERR(phy->usb_app_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_app_clk),
> > +			"Failed to get app clock\n");
> > +
> > +	phy->usb_lpm_clk = devm_clk_get_enabled(dev, "lpm");
> > +	if (IS_ERR(phy->usb_lpm_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_lpm_clk),
> > +			"Failed to get lpm clock\n");
> > +
> > +	phy->usb_stb_clk = devm_clk_get_enabled(dev, "stb");
> > +	if (IS_ERR(phy->usb_stb_clk))
> > +		return dev_err_probe(dev, PTR_ERR(phy->usb_stb_clk),
> > +			"Failed to get stb clock\n");
> > +
> > +	phy->phy = devm_phy_create(dev, NULL, &cv1800_usb_phy_ops);
> > +	if (IS_ERR(phy->phy))
> > +		return dev_err_probe(dev, PTR_ERR(phy->phy),
> > +			"Failed to create phy\n");
> > +
> > +	ret = cv1800_usb_phy_set_clock(phy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	debugfs_create_file("dr_mode", 0644, phy->phy->debugfs,
> > +			    phy, &dr_mode_fops);
> > +
> > +	phy_set_drvdata(phy->phy, phy);
> > +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> > +
> > +	return PTR_ERR_OR_ZERO(phy_provider);
> > +}
> > +
> > +static const struct of_device_id cv1800_usb_phy_ids[] = {
> > +	{ .compatible = "sophgo,cv1800b-usb2-phy" },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, cv1800_usb_phy_ids);
> > +
> > +static struct platform_driver cv1800_usb_phy_driver = {
> > +	.probe = cv1800_usb_phy_probe,
> > +	.driver = {
> > +		.name = "cv1800-usb2-phy",
> > +		.of_match_table = cv1800_usb_phy_ids,
> > +	 },
> > +};
> > +module_platform_driver(cv1800_usb_phy_driver);
> > +
> > +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> > +MODULE_DESCRIPTION("CV1800/SG2000 SoC USB 2.0 PHY driver");
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.49.0
> 
> -- 
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
