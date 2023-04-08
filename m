Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FCBC7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T27JfVyOHa+exxegi8iM4W7cFQ3ljxcL6rBrjpL4Xkk=; b=Tgao9lpkSeATBk
	TqqD7ROwAtFzF6Am8dqxfWQJ164ySKQ1x+fyUvInMpIwasyMEkjuKTciLJli/RgYIA1xXrLUmBeCN
	N++apnRdfOKE9HXBldOCh/xWJDoZBlisQklIFQKk5haT7CHt+qrzGj63ZEeiu+k8d4JIQZQk0jEQ2
	F1FQrhlUGMXTSLQyZNJImWHY5lQFcmHrZJGkNHIik1tKTbr/WKIQZj1vkXgzydemengRXajRGr5qa
	ANzPcT8mmfFlWhWMj+xS8fs3LT4edB6eTj8IMetXa8hw8neSCWkfntmJTi/F50+pdpYuCqcxNNWXe
	kPCMMdg3XVAyU4h5Gxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plAVa-00CVek-25;
	Sat, 08 Apr 2023 15:29:42 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plAVX-00CVe3-2V
	for linux-riscv@lists.infradead.org;
	Sat, 08 Apr 2023 15:29:41 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 60-20020a17090a09c200b0023fcc8ce113so3580926pjo.4
        for <linux-riscv@lists.infradead.org>; Sat, 08 Apr 2023 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680967778; x=1683559778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMkhsnhYBHy8GNykNiipOvAulc87ASqoyeocCXXPQVg=;
        b=TCMU9ODKuMaDJmL+51i3UIQLl7i7qHcZR7s+A77RHXVjJFAHwMOX6p6+IC3yXuo9B3
         zDVhcFL58iRGsYKf7wCnC+Bv32l1dbWCUkGOmgiDr8xZkL51D6gW8iI4Mz1HYtaOxtBO
         1CcnHLalKzHUQScXa/7JzZDDKYvTw/KrcMZ+zWZqLBDR3tXnCz9BZds/MvSJS9Uoivtt
         qSNZBo1YNcgVjAIQ5U0V1cPLNB8eb6J3jVLwJrDhqch0VgYgqIk3n5vqp8+50JSJQvSO
         WHMcq1U03tEvnepCJDNSnAc784O2LFE14z+MjbhUpiUwDVepFx/e6lOY7SmVXo15Kiqj
         A6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680967778; x=1683559778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMkhsnhYBHy8GNykNiipOvAulc87ASqoyeocCXXPQVg=;
        b=4EAqJhGup3hm47++0HQU57X/ryrF3PIMba82kKE2aJpp2PpFtJXJ2mndTzL6jCtXNd
         vSeeAk43HEvge1CZVPVfuI8hgDTiVX12sLCBKRn+8mH8CLcTqvb3V2q+s0EJid6LyyLF
         R3e6XhijKLWC4ww0bkK+4v5gHyyl5k3KMTieIyNKDKnnWGxuZW7FBSOHj/fKZm2eKFJH
         WUNEuW42rloyrPdI+QHKdMWY47iCmYJIwUKJlrD3YDGzsVlSAHRMdM8fB9AITq6WTk4T
         qQdYbFadshS+R9+FxegdH+ldCCkKucV5why6pgv+8uqsKO2kdlpJUkvkmOsmYU5bD0NZ
         19zA==
X-Gm-Message-State: AAQBX9fPzLDyVK/oG46cjjxeZjBh1AxFf/jP56C9vveSwdWeIkzOL9+a
	ShHQ8Te5ZdoVPuHEvr4weis=
X-Google-Smtp-Source: AKy350aB21daF+6Bv9gB8l7NEZJVZ2EG1q/FoV2XZg0ST8ZmWTScBMVI5ZNhR/iJqJT38cr5F5ezBA==
X-Received: by 2002:a17:90b:4d88:b0:240:d093:7274 with SMTP id oj8-20020a17090b4d8800b00240d0937274mr7357866pjb.14.1680967777948;
        Sat, 08 Apr 2023 08:29:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g6-20020a17090a67c600b002466f45788esm1531672pjm.46.2023.04.08.08.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 08:29:37 -0700 (PDT)
Date: Sat, 8 Apr 2023 08:29:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Samin Guo <samin.guo@starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] hwmon: (sfctemp) Add StarFive JH71x0 temperature
 sensor
Message-ID: <4423f128-dff8-421a-ae9b-b45c087481a4@roeck-us.net>
References: <20230321022644.107027-1-hal.feng@starfivetech.com>
 <20230321022644.107027-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230321022644.107027-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_082939_817004_4D1A2584 
X-CRM114-Status: GOOD (  36.35  )
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

On Tue, Mar 21, 2023 at 10:26:44AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add driver for the StarFive JH71x0 temperature sensor. You
> can enable/disable it and read temperature in milli Celcius
> through sysfs.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/index.rst   |   1 +
>  Documentation/hwmon/sfctemp.rst |  33 ++++
>  MAINTAINERS                     |   8 +
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/sfctemp.c         | 331 ++++++++++++++++++++++++++++++++
>  6 files changed, 384 insertions(+)
>  create mode 100644 Documentation/hwmon/sfctemp.rst
>  create mode 100644 drivers/hwmon/sfctemp.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index f1fe75f596a5..d72bb1df6431 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -184,6 +184,7 @@ Hardware Monitoring Kernel Drivers
>     sch5627
>     sch5636
>     scpi-hwmon
> +   sfctemp
>     sht15
>     sht21
>     sht3x
> diff --git a/Documentation/hwmon/sfctemp.rst b/Documentation/hwmon/sfctemp.rst
> new file mode 100644
> index 000000000000..9fbd5bb1f356
> --- /dev/null
> +++ b/Documentation/hwmon/sfctemp.rst
> @@ -0,0 +1,33 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver sfctemp
> +=====================
> +
> +Supported chips:
> + - StarFive JH7100
> + - StarFive JH7110
> +
> +Authors:
> + - Emil Renner Berthing <kernel@esmil.dk>
> +
> +Description
> +-----------
> +
> +This driver adds support for reading the built-in temperature sensor on the
> +JH7100 and JH7110 RISC-V SoCs by StarFive Technology Co. Ltd.
> +
> +``sysfs`` interface
> +-------------------
> +
> +The temperature sensor can be enabled, disabled and queried via the standard
> +hwmon interface in sysfs under ``/sys/class/hwmon/hwmonX`` for some value of
> +``X``:
> +
> +================ ==== =============================================
> +Name             Perm Description
> +================ ==== =============================================
> +temp1_enable     RW   Enable or disable temperature sensor.
> +                      Automatically enabled by the driver,
> +                      but may be disabled to save power.
> +temp1_input      RO   Temperature reading in milli-degrees Celsius.
> +================ ==== =============================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d8ebab595b2a..d958238a82f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18911,6 +18911,14 @@ S:	Supported
>  F:	Documentation/networking/devlink/sfc.rst
>  F:	drivers/net/ethernet/sfc/
>  
> +SFCTEMP HWMON DRIVER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
> +F:	Documentation/hwmon/sfctemp.rst
> +F:	drivers/hwmon/sfctemp.c
> +
>  SFF/SFP/SFP+ MODULE SUPPORT
>  M:	Russell King <linux@armlinux.org.uk>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 5b3b76477b0e..abb82a73dbaf 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1929,6 +1929,16 @@ config SENSORS_STTS751
>  	  This driver can also be built as a module. If so, the module
>  	  will be called stts751.
>  
> +config SENSORS_SFCTEMP
> +	tristate "Starfive JH71x0 temperature sensor"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for temperature sensor
> +	  on the Starfive JH71x0 SoCs.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called sfctemp.
> +
>  config SENSORS_SMM665
>  	tristate "Summit Microelectronics SMM665"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 88712b5031c8..386f4debe68b 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -181,6 +181,7 @@ obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>  obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>  obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>  obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
> +obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
>  obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
>  obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>  obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
> diff --git a/drivers/hwmon/sfctemp.c b/drivers/hwmon/sfctemp.c
> new file mode 100644
> index 000000000000..d7484e2b8100
> --- /dev/null
> +++ b/drivers/hwmon/sfctemp.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2021 Samin Guo <samin.guo@starfivetech.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +/*
> + * TempSensor reset. The RSTN can be de-asserted once the analog core has
> + * powered up. Trst(min 100ns)
> + * 0:reset  1:de-assert
> + */
> +#define SFCTEMP_RSTN	BIT(0)
> +
> +/*
> + * TempSensor analog core power down. The analog core will be powered up
> + * Tpu(min 50us) after PD is de-asserted. RSTN should be held low until the
> + * analog core is powered up.
> + * 0:power up  1:power down
> + */
> +#define SFCTEMP_PD	BIT(1)
> +
> +/*
> + * TempSensor start conversion enable.
> + * 0:disable  1:enable
> + */
> +#define SFCTEMP_RUN	BIT(2)
> +
> +/*
> + * TempSensor conversion value output.
> + * Temp(C)=DOUT*Y/4094 - K
> + */
> +#define SFCTEMP_DOUT_POS	16
> +#define SFCTEMP_DOUT_MSK	GENMASK(27, 16)
> +
> +/* DOUT to Celcius conversion constants */
> +#define SFCTEMP_Y1000	237500L
> +#define SFCTEMP_Z	4094L
> +#define SFCTEMP_K1000	81100L
> +
> +struct sfctemp {
> +	/* serialize access to hardware register and enabled below */
> +	struct mutex lock;
> +	void __iomem *regs;
> +	struct clk *clk_sense;
> +	struct clk *clk_bus;
> +	struct reset_control *rst_sense;
> +	struct reset_control *rst_bus;
> +	bool enabled;
> +};
> +
> +static void sfctemp_power_up(struct sfctemp *sfctemp)
> +{
> +	/* make sure we're powered down first */
> +	writel(SFCTEMP_PD, sfctemp->regs);
> +	udelay(1);
> +
> +	writel(0, sfctemp->regs);
> +	/* wait t_pu(50us) + t_rst(100ns) */
> +	usleep_range(60, 200);
> +
> +	/* de-assert reset */
> +	writel(SFCTEMP_RSTN, sfctemp->regs);
> +	udelay(1); /* wait t_su(500ps) */
> +}
> +
> +static void sfctemp_power_down(struct sfctemp *sfctemp)
> +{
> +	writel(SFCTEMP_PD, sfctemp->regs);
> +}
> +
> +static void sfctemp_run(struct sfctemp *sfctemp)
> +{
> +	writel(SFCTEMP_RSTN | SFCTEMP_RUN, sfctemp->regs);
> +	udelay(1);
> +}
> +
> +static void sfctemp_stop(struct sfctemp *sfctemp)
> +{
> +	writel(SFCTEMP_RSTN, sfctemp->regs);
> +}
> +
> +static int sfctemp_enable(struct sfctemp *sfctemp)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&sfctemp->lock);
> +	if (sfctemp->enabled)
> +		goto done;
> +
> +	ret = clk_prepare_enable(sfctemp->clk_bus);
> +	if (ret)
> +		goto err;
> +	ret = reset_control_deassert(sfctemp->rst_bus);
> +	if (ret)
> +		goto err_disable_bus;
> +
> +	ret = clk_prepare_enable(sfctemp->clk_sense);
> +	if (ret)
> +		goto err_assert_bus;
> +	ret = reset_control_deassert(sfctemp->rst_sense);
> +	if (ret)
> +		goto err_disable_sense;
> +
> +	sfctemp_power_up(sfctemp);
> +	sfctemp_run(sfctemp);
> +	sfctemp->enabled = true;
> +done:
> +	mutex_unlock(&sfctemp->lock);
> +	return ret;
> +
> +err_disable_sense:
> +	clk_disable_unprepare(sfctemp->clk_sense);
> +err_assert_bus:
> +	reset_control_assert(sfctemp->rst_bus);
> +err_disable_bus:
> +	clk_disable_unprepare(sfctemp->clk_bus);
> +err:
> +	mutex_unlock(&sfctemp->lock);
> +	return ret;
> +}
> +
> +static int sfctemp_disable(struct sfctemp *sfctemp)
> +{
> +	mutex_lock(&sfctemp->lock);
> +	if (!sfctemp->enabled)
> +		goto done;
> +
> +	sfctemp_stop(sfctemp);
> +	sfctemp_power_down(sfctemp);
> +	reset_control_assert(sfctemp->rst_sense);
> +	clk_disable_unprepare(sfctemp->clk_sense);
> +	reset_control_assert(sfctemp->rst_bus);
> +	clk_disable_unprepare(sfctemp->clk_bus);
> +	sfctemp->enabled = false;
> +done:
> +	mutex_unlock(&sfctemp->lock);
> +	return 0;
> +}
> +
> +static void sfctemp_disable_action(void *data)
> +{
> +	sfctemp_disable(data);
> +}
> +
> +static int sfctemp_convert(struct sfctemp *sfctemp, long *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&sfctemp->lock);
> +	if (!sfctemp->enabled) {
> +		ret = -ENODATA;
> +		goto out;
> +	}
> +
> +	/* calculate temperature in milli Celcius */
> +	*val = (long)((readl(sfctemp->regs) & SFCTEMP_DOUT_MSK) >> SFCTEMP_DOUT_POS)
> +		* SFCTEMP_Y1000 / SFCTEMP_Z - SFCTEMP_K1000;
> +
> +	ret = 0;
> +out:
> +	mutex_unlock(&sfctemp->lock);
> +	return ret;
> +}
> +
> +static umode_t sfctemp_is_visible(const void *data, enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			return 0644;
> +		case hwmon_temp_input:
> +			return 0444;
> +		default:
> +			return 0;
> +		}
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int sfctemp_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
> +{
> +	struct sfctemp *sfctemp = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			*val = sfctemp->enabled;
> +			return 0;
> +		case hwmon_temp_input:
> +			return sfctemp_convert(sfctemp, val);
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int sfctemp_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
> +{
> +	struct sfctemp *sfctemp = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_enable:
> +			if (val == 0)
> +				return sfctemp_disable(sfctemp);
> +			if (val == 1)
> +				return sfctemp_enable(sfctemp);
> +			return -EINVAL;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct hwmon_channel_info *sfctemp_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_ENABLE | HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops sfctemp_hwmon_ops = {
> +	.is_visible = sfctemp_is_visible,
> +	.read = sfctemp_read,
> +	.write = sfctemp_write,
> +};
> +
> +static const struct hwmon_chip_info sfctemp_chip_info = {
> +	.ops = &sfctemp_hwmon_ops,
> +	.info = sfctemp_info,
> +};
> +
> +static int sfctemp_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon_dev;
> +	struct sfctemp *sfctemp;
> +	int ret;
> +
> +	sfctemp = devm_kzalloc(dev, sizeof(*sfctemp), GFP_KERNEL);
> +	if (!sfctemp)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, sfctemp);
> +	mutex_init(&sfctemp->lock);
> +
> +	sfctemp->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sfctemp->regs))
> +		return PTR_ERR(sfctemp->regs);
> +
> +	sfctemp->clk_sense = devm_clk_get(dev, "sense");
> +	if (IS_ERR(sfctemp->clk_sense))
> +		return dev_err_probe(dev, PTR_ERR(sfctemp->clk_sense),
> +				     "error getting sense clock\n");
> +
> +	sfctemp->clk_bus = devm_clk_get(dev, "bus");
> +	if (IS_ERR(sfctemp->clk_bus))
> +		return dev_err_probe(dev, PTR_ERR(sfctemp->clk_bus),
> +				     "error getting bus clock\n");
> +
> +	sfctemp->rst_sense = devm_reset_control_get_exclusive(dev, "sense");
> +	if (IS_ERR(sfctemp->rst_sense))
> +		return dev_err_probe(dev, PTR_ERR(sfctemp->rst_sense),
> +				     "error getting sense reset\n");
> +
> +	sfctemp->rst_bus = devm_reset_control_get_exclusive(dev, "bus");
> +	if (IS_ERR(sfctemp->rst_bus))
> +		return dev_err_probe(dev, PTR_ERR(sfctemp->rst_bus),
> +				     "error getting busreset\n");
> +
> +	ret = reset_control_assert(sfctemp->rst_sense);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error asserting sense reset\n");
> +
> +	ret = reset_control_assert(sfctemp->rst_bus);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error asserting bus reset\n");
> +
> +	ret = devm_add_action(dev, sfctemp_disable_action, sfctemp);
> +	if (ret)
> +		return ret;
> +
> +	ret = sfctemp_enable(sfctemp);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "error enabling temperature sensor: %d\n", ret);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sfctemp", sfctemp,
> +							 &sfctemp_chip_info, NULL);
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct of_device_id sfctemp_of_match[] = {
> +	{ .compatible = "starfive,jh7100-temp" },
> +	{ .compatible = "starfive,jh7110-temp" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sfctemp_of_match);
> +
> +static struct platform_driver sfctemp_driver = {
> +	.probe  = sfctemp_probe,
> +	.driver = {
> +		.name = "sfctemp",
> +		.of_match_table = sfctemp_of_match,
> +	},
> +};
> +module_platform_driver(sfctemp_driver);
> +
> +MODULE_AUTHOR("Emil Renner Berthing");
> +MODULE_DESCRIPTION("StarFive JH71x0 temperature sensor driver");
> +MODULE_LICENSE("GPL");

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
