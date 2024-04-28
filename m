Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9B8C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 07:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61OAM+ndYpGB4ShPQSwBSfZ9QYigqSnB9CsYr7bmjl0=; b=Y4agg6uN1WVx4m
	LyMyMcGbCXvwxQtMDxy8lM/ClIu2PTd3SqvzrAbn6V5Vl7YoK+wbAgIynlWuxoXK+SEYEnQCYy9dM
	bs7pSFQGiuOTGKiyDfDPyFUW98oLNTu4uklBlnpysH8r14ytpALj6tPJO1sAfz6y4ztuGPMUh+KBl
	TOwGXS3D8WVXgNq6bM32RkBSqJ0Z7TVcIE9H3/NDTfH4PNhdEyH3qr76kxZaV++yuKAoAWJDzwx1E
	sc5cVlw7WTE8OnI2wzzm/S/u8AFNyA83WOliZUustW2lMDk5NI3dnkTmGl6e6IFREIqOzgqLYzWfP
	UEWGrwK5jG9bdkRA9V1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0yWZ-0000000H1Eg-0Gb2;
	Sun, 28 Apr 2024 07:00:35 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0yWV-0000000H1Cv-46wH
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 07:00:33 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so2143247a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 28 Apr 2024 00:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714287620; x=1714892420; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=aaXHqS0cBqehJeGbQaqrlIhER2mtae+SMna7IPS14Rs=;
        b=YyJPTUzMMZGAAa5uKWY0H1tyxSOUlhGQ2zKPlc7A71iwW3+Y020+ixN5oMQPXBndp1
         m58hmZ8LIumshCx4ClL+bkUsipxHZlRmIEpZgkjhBO81nyGVpM5PNQznKeH8GvcbO1VA
         XHcRKWezKk+WprIf5JGy/GY4uJWJVRFU7wpBQDhOT6nu5Bnxg7FuUhqL8b/fKYJMNy4a
         TjNLIYK0fwAwoewIo/0ixtcSEaW0d2st6tjxdDVSznTVCsL0AwkLE+Ex7Z4n73YN3bFF
         2p7APd1Z3TuPe3SzRsS5ReIFfktnBGtr91J7XiIO0eDcYWEf4892tBI2laH2cVKSaiOe
         I3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714287620; x=1714892420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaXHqS0cBqehJeGbQaqrlIhER2mtae+SMna7IPS14Rs=;
        b=mqUZeWVLQ2Pn9QiricbHtcFQVFtDvivJdALs0tlgHs3zSo8GTv58ePyLQKR0bA8nWD
         vhZpANRHq+BylMlZ2GHY3ErfS+DCLZCpF3GiryHDPsljQTasAhomi6mgDE1ZqG0GMQS7
         YFoYMa04YFMmnwzEyKpiIAAunzzajdu1tT0y2Kcwrr/vEP09IogW5xDlBWr2+0snNgG6
         QBXyz9BvGO1nNAFeAxjJGXFs4wl2isZzsf0pCerdQq6ZCjQQ6jK7cl4zfwnLwlacr9+l
         jz2ZboTBPlBGM+aP0tAQpZHueWVArCt/ollOwH/+okwyJPjHwfzBKq+Y0lMkrbgcJiIb
         FIFA==
X-Forwarded-Encrypted: i=1; AJvYcCU9BLIf1s5u3LXb4Pm2o0ovM4S0nOSkyQDSouNp0MUzJ3spMwFuJVYAy8IpEFnDgb8HIMN8XDruisczMYXh1XsIvJLaonffPUdpcAwxhjw1
X-Gm-Message-State: AOJu0YyXBqgCgjkPItSkZoXzJP148U3gQM03e8VzRYsKtyVspdl2HNEW
	BpeV8LFh5ma28efSu5jNX6fWeqdq/LeiQburUdQ6jaDzjkjdvBr5
X-Google-Smtp-Source: AGHT+IF2jU3CVPXW0kiA7mfkKXM9cY2YRl6GAOQyaj+bpsMWwq7cjP1gcRNbbMcvEEUVUpjlxhDNVQ==
X-Received: by 2002:a05:6a20:7286:b0:1a9:5b3f:f139 with SMTP id o6-20020a056a20728600b001a95b3ff139mr8934380pzk.25.1714287618803;
        Sun, 28 Apr 2024 00:00:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fb12-20020a056a002d8c00b006f3ec69bc09sm2171232pfb.75.2024.04.28.00.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Apr 2024 00:00:17 -0700 (PDT)
Message-ID: <540cad62-db3d-4876-81a4-da396628e5ef@roeck-us.net>
Date: Sun, 28 Apr 2024 00:00:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drivers: soc: sophgo: Add SG2042 external hardware
 monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jean Delvare <jdelvare@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Samuel Holland <samuel.holland@sifive.com>, Wei Xu <xuwei5@hisilicon.com>,
 Huisong Li <lihuisong@huawei.com>, Arnd Bergmann <arnd@arndb.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <IA1PR20MB49532A8A0C52FE5C599B6D13BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953A6EF6ED0CD082B60DD80BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB4953A6EF6ED0CD082B60DD80BB142@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_000032_044704_9EB327F5 
X-CRM114-Status: GOOD (  22.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/27/24 18:30, Inochi Amaoto wrote:
> SG2042 use an external MCU to provide basic hardware information
> and thermal sensors.
> 
> Add driver support for the onboard MCU of SG2042.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Why does this driver reside in drivers/soc and not in drivers/hwmon ?

NACK from my perspective.

Guenter

> ---
>   drivers/soc/Kconfig                   |   1 +
>   drivers/soc/Makefile                  |   1 +
>   drivers/soc/sophgo/Kconfig            |  12 +
>   drivers/soc/sophgo/Makefile           |   5 +
>   drivers/soc/sophgo/sg2042-hwmon-mcu.c | 531 ++++++++++++++++++++++++++
>   5 files changed, 550 insertions(+)
>   create mode 100644 drivers/soc/sophgo/Kconfig
>   create mode 100644 drivers/soc/sophgo/Makefile
>   create mode 100644 drivers/soc/sophgo/sg2042-hwmon-mcu.c
> 
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 5d924e946507..19050f094996 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -22,6 +22,7 @@ source "drivers/soc/qcom/Kconfig"
>   source "drivers/soc/renesas/Kconfig"
>   source "drivers/soc/rockchip/Kconfig"
>   source "drivers/soc/samsung/Kconfig"
> +source "drivers/soc/sophgo/Kconfig"
>   source "drivers/soc/sunxi/Kconfig"
>   source "drivers/soc/tegra/Kconfig"
>   source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index ba8f5b5460e1..6948e6617316 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -28,6 +28,7 @@ obj-y				+= qcom/
>   obj-y				+= renesas/
>   obj-y				+= rockchip/
>   obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> +obj-y				+= sophgo/
>   obj-y				+= sunxi/
>   obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>   obj-y				+= ti/
> diff --git a/drivers/soc/sophgo/Kconfig b/drivers/soc/sophgo/Kconfig
> new file mode 100644
> index 000000000000..de9842d1c287
> --- /dev/null
> +++ b/drivers/soc/sophgo/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Sophgo SoC drivers
> +#
> +
> +config SG2042_HWMON_MCU
> +	tristate "SG2042 onboard MCU support"
> +	depends on RISCV
> +	help
> +	  Support for SG2042 onboard MCU. This mcu provides power
> +	  control and some basic information for SG2042 chip.
> +	  If unsure, say Y.
> diff --git a/drivers/soc/sophgo/Makefile b/drivers/soc/sophgo/Makefile
> new file mode 100644
> index 000000000000..c72729ce61aa
> --- /dev/null
> +++ b/drivers/soc/sophgo/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Sophgo SoC drivers
> +#
> +obj-$(CONFIG_SG2042_HWMON_MCU)		+= sg2042-hwmon-mcu.o
> diff --git a/drivers/soc/sophgo/sg2042-hwmon-mcu.c b/drivers/soc/sophgo/sg2042-hwmon-mcu.c
> new file mode 100644
> index 000000000000..3413b1a0f5e3
> --- /dev/null
> +++ b/drivers/soc/sophgo/sg2042-hwmon-mcu.c
> @@ -0,0 +1,531 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Inochi Amaoto <inochiama@outlook.com>
> + *
> + * Sophgo power control mcu for SG2042
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/time.h>
> +
> +/* fixed MCU registers */
> +#define REG_BOARD_TYPE				0x00
> +#define REG_MCU_FIRMWARE_VERSION		0x01
> +#define REG_PCB_VERSION				0x02
> +#define REG_PWR_CTRL				0x03
> +#define REG_SOC_TEMP				0x04
> +#define REG_BOARD_TEMP				0x05
> +#define REG_RST_COUNT				0x0a
> +#define REG_UPTIME				0x0b
> +#define REG_RESET_REASON			0x0d
> +#define REG_MCU_TYPE				0x18
> +#define REG_CRITICAL_ACTIONS			0x65
> +#define REG_CRITICAL_TEMP			0x66
> +#define REG_REPOWER_TEMP			0x67
> +
> +#define CRITICAL_ACTION_REBOOT			0x1
> +#define CRITICAL_ACTION_POWEROFF		0x2
> +
> +#define DEFAULT_REPOWER_TEMP			60
> +#define MAX_REPOWER_TEMP			100
> +
> +#define sg2042_mcu_read_byte(client, reg)			\
> +	i2c_smbus_read_byte_data(client, reg)
> +#define sg2042_mcu_write_byte(client, reg, value)		\
> +	i2c_smbus_write_byte_data(client, reg, value)
> +#define sg2042_mcu_read_block(client, reg, array)		\
> +	i2c_smbus_read_i2c_block_data(client, reg, sizeof(array), array)
> +
> +#define DEFINE_MCU_ATTR_READ_FUNC(_name, _type, _format)		\
> +	static ssize_t _name##_show(struct device *dev,			\
> +				    struct device_attribute *attr,	\
> +				    char *buf)				\
> +	{								\
> +		struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);	\
> +		_type ret;						\
> +		ret = sg2042_mcu_get_##_name(mcu->client);		\
> +		if (ret < 0)						\
> +			return ret;					\
> +		return sprintf(buf, _format "\n", ret);			\
> +	}
> +
> +struct sg2042_mcu_board_data {
> +	u8		id;
> +	const char	*name;
> +};
> +
> +struct sg2042_mcu_data {
> +	struct i2c_client			*client;
> +	const struct sg2042_mcu_board_data	*board_info;
> +};
> +
> +static const struct sg2042_mcu_board_data sg2042_boards_data[] = {
> +	{
> +		.id = 0x80,
> +		.name = "SG2042 evb x8",
> +	},
> +	{
> +		.id = 0x81,
> +		.name = "SG2042R evb",
> +	},
> +	{
> +		.id = 0x83,
> +		.name = "SG2042 evb x4",
> +	},
> +	{
> +		.id = 0x90,
> +		.name = "Milk-V Pioneer",
> +	},
> +};
> +
> +static const char *sg2042_mcu_reset_reason[8] = {
> +	"Power supply overheat",
> +	"Power supply failure",
> +	"12V power supply failure",
> +	"Reset commant",
> +	"Unknown",
> +	"Unknown",
> +	"Unknown",
> +	"SoC overheat",
> +};
> +
> +static int sg2042_mcu_get_board_type(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_BOARD_TYPE);
> +}
> +
> +static int sg2042_mcu_get_firmware_version(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_MCU_FIRMWARE_VERSION);
> +}
> +
> +static int sg2042_mcu_get_pcb_version(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_PCB_VERSION);
> +}
> +
> +static int sg2042_mcu_get_soc_temp(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_SOC_TEMP);
> +}
> +
> +static int sg2042_mcu_get_board_temp(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_BOARD_TEMP);
> +}
> +
> +static int sg2042_mcu_get_reset_count(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_RST_COUNT);
> +}
> +
> +static s32 sg2042_mcu_get_uptime(struct i2c_client *client)
> +{
> +	int ret;
> +	u8 time_val[2];
> +
> +	ret = sg2042_mcu_read_block(client, REG_UPTIME, time_val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return (s32)(time_val[0]) + ((s32)(time_val[1]) << 8);
> +}
> +
> +static int sg2042_mcu_get_reset_reason(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_RESET_REASON);
> +}
> +
> +static int sg2042_mcu_get_mcu_type(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_MCU_TYPE);
> +}
> +
> +static int sg2042_mcu_get_critical_action(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_CRITICAL_ACTIONS);
> +}
> +
> +static int sg2042_mcu_get_critical_temp(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_CRITICAL_TEMP);
> +}
> +
> +static int sg2042_mcu_get_repower_temp(struct i2c_client *client)
> +{
> +	return sg2042_mcu_read_byte(client, REG_REPOWER_TEMP);
> +}
> +
> +static int sg2042_mcu_set_critical_action(struct i2c_client *client,
> +					  u8 value)
> +{
> +	return sg2042_mcu_write_byte(client, REG_CRITICAL_ACTIONS, value);
> +}
> +
> +static int sg2042_mcu_set_critical_temp(struct i2c_client *client,
> +					u8 value)
> +{
> +	return sg2042_mcu_write_byte(client, REG_CRITICAL_TEMP, value);
> +}
> +
> +static int sg2042_mcu_set_repower_temp(struct i2c_client *client,
> +				       u8 value)
> +{
> +	return sg2042_mcu_write_byte(client, REG_REPOWER_TEMP, value);
> +}
> +
> +static ssize_t board_type_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buf)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%s\n", mcu->board_info->name ?: "Unknown");
> +}
> +
> +DEFINE_MCU_ATTR_READ_FUNC(firmware_version, int, "0x%02x");
> +DEFINE_MCU_ATTR_READ_FUNC(pcb_version, int, "0x%02x");
> +DEFINE_MCU_ATTR_READ_FUNC(reset_count, int, "%d");
> +DEFINE_MCU_ATTR_READ_FUNC(uptime, s32, "%d");
> +
> +static ssize_t reset_reason_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	int ret, val, i;
> +
> +	val = sg2042_mcu_get_reset_reason(mcu->client);
> +	if (val < 0)
> +		return val;
> +
> +	ret = sprintf(buf, "Reason: 0x%02x\n", val);
> +
> +	for (i = 0; i < ARRAY_SIZE(sg2042_mcu_reset_reason); i++) {
> +		if (val & BIT(i))
> +			ret += sprintf(buf + ret, "bit %d: %s\n", i,
> +						  sg2042_mcu_reset_reason[i]);
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t mcu_type_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = sg2042_mcu_get_mcu_type(mcu->client);
> +	if (ret < 0)
> +		return ret;
> +
> +	return sprintf(buf, ret ? "GD32\n" : "STM32\n");
> +}
> +
> +static ssize_t critical_action_show(struct device *dev,
> +				    struct device_attribute *attr,
> +				    char *buf)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	int ret;
> +	const char *action;
> +
> +	ret = sg2042_mcu_get_critical_action(mcu->client);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret == CRITICAL_ACTION_REBOOT)
> +		action = "reboot";
> +	else if (ret == CRITICAL_ACTION_POWEROFF)
> +		action = "poweroff";
> +	else
> +		action = "unknown";
> +
> +	return sprintf(buf, "%s\n", action);
> +}
> +
> +static ssize_t critical_action_store(struct device *dev,
> +				     struct device_attribute *attr,
> +				     const char *buf, size_t count)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	int value;
> +
> +	if (sysfs_streq("reboot", buf))
> +		value = CRITICAL_ACTION_REBOOT;
> +	else if (sysfs_streq("poweroff", buf))
> +		value = CRITICAL_ACTION_POWEROFF;
> +	else
> +		return -EINVAL;
> +
> +	return sg2042_mcu_set_critical_action(mcu->client, value);
> +}
> +
> +DEFINE_MCU_ATTR_READ_FUNC(repower_temp, u32, "%u");
> +
> +static ssize_t repower_temp_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	u8 val;
> +	int ret;
> +
> +	ret = kstrtou8(buf, 10, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val == 0 || val > MAX_REPOWER_TEMP)
> +		return -EINVAL;
> +
> +	return sg2042_mcu_set_repower_temp(mcu->client, val);
> +}
> +
> +static DEVICE_ATTR_RO(board_type);
> +static DEVICE_ATTR_RO(firmware_version);
> +static DEVICE_ATTR_RO(pcb_version);
> +static DEVICE_ATTR_RO(reset_count);
> +static DEVICE_ATTR_RO(uptime);
> +static DEVICE_ATTR_RO(reset_reason);
> +static DEVICE_ATTR_RO(mcu_type);
> +static DEVICE_ATTR_RW(critical_action);
> +static DEVICE_ATTR_RW(repower_temp);
> +
> +static struct attribute *sg2042_mcu_attrs[] = {
> +	&dev_attr_board_type.attr,
> +	&dev_attr_firmware_version.attr,
> +	&dev_attr_pcb_version.attr,
> +	&dev_attr_reset_count.attr,
> +	&dev_attr_uptime.attr,
> +	&dev_attr_reset_reason.attr,
> +	&dev_attr_mcu_type.attr,
> +	&dev_attr_critical_action.attr,
> +	&dev_attr_repower_temp.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group sg2042_mcu_attr_group = {
> +	.attrs	= sg2042_mcu_attrs,
> +};
> +
> +static const struct hwmon_channel_info * const sg2042_mcu_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT,
> +				 HWMON_T_INPUT),
> +	NULL
> +};
> +
> +static int sg2042_mcu_read_temp(struct device *dev,
> +				u32 attr, int channel,
> +				long *val)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	long tmp;
> +
> +	switch (attr) {
> +	case hwmon_temp_input:
> +		switch (channel) {
> +		case 0:
> +			tmp = sg2042_mcu_get_soc_temp(mcu->client);
> +			if (tmp < 0)
> +				return tmp;
> +			*val = tmp * 1000;
> +			break;
> +		case 1:
> +			tmp = sg2042_mcu_get_board_temp(mcu->client);
> +			if (tmp < 0)
> +				return tmp;
> +			*val = tmp * 1000;
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_temp_crit:
> +		if (channel)
> +			return -EOPNOTSUPP;
> +
> +		tmp = sg2042_mcu_get_critical_temp(mcu->client);
> +		if (tmp < 0)
> +			return tmp;
> +		*val = tmp * 1000;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int sg2042_mcu_read(struct device *dev,
> +			   enum hwmon_sensor_types type,
> +			   u32 attr, int channel, long *val)
> +{
> +	switch (type) {
> +	case hwmon_chip:
> +		if (attr != hwmon_chip_update_interval)
> +			return -EOPNOTSUPP;
> +		*val = 1000;
> +		break;
> +	case hwmon_temp:
> +		return sg2042_mcu_read_temp(dev, attr, channel, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +	return 0;
> +}
> +
> +static int sg2042_mcu_write(struct device *dev,
> +			    enum hwmon_sensor_types type,
> +			    u32 attr, int channel, long val)
> +{
> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
> +	u8 down_temp, repower_temp;
> +	int ret;
> +
> +	if (type != hwmon_temp || attr != hwmon_temp_crit || !channel)
> +		return -EOPNOTSUPP;
> +
> +	ret = sg2042_mcu_get_repower_temp(mcu->client);
> +	if (ret < 0)
> +		repower_temp = DEFAULT_REPOWER_TEMP;
> +	else
> +		repower_temp = ret;
> +
> +	down_temp = val / 1000;
> +	if (down_temp < repower_temp)
> +		return -EINVAL;
> +
> +	return sg2042_mcu_set_critical_temp(mcu->client, (u8)(val / 1000));
> +}
> +
> +static umode_t sg2042_mcu_is_visible(const void *_data,
> +				     enum hwmon_sensor_types type,
> +				     u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_chip:
> +		if (attr == hwmon_chip_update_interval)
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			if (channel < 2)
> +				return 0444;
> +			break;
> +		case hwmon_temp_crit:
> +			if (channel == 0)
> +				return 0664;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return 0;
> +	}
> +	return 0;
> +}
> +
> +static const struct hwmon_ops sg2042_mcu_ops = {
> +	.is_visible = sg2042_mcu_is_visible,
> +	.read = sg2042_mcu_read,
> +	.write = sg2042_mcu_write,
> +};
> +
> +static const struct hwmon_chip_info sg2042_mcu_chip_info = {
> +	.ops = &sg2042_mcu_ops,
> +	.info = sg2042_mcu_info,
> +};
> +
> +static int sg2042_mcu_check_board(u8 id)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(sg2042_boards_data); i++) {
> +		if (sg2042_boards_data[i].id == id)
> +			return i;
> +	}
> +
> +	return -ENODEV;
> +}
> +
> +static int sg2042_mcu_i2c_probe(struct i2c_client *client)
> +{
> +	int ret;
> +	struct device *dev = &client->dev;
> +	struct sg2042_mcu_data *mcu;
> +	struct device *hwmon_dev;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +						I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -EIO;
> +
> +	ret = sg2042_mcu_get_board_type(client);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = sg2042_mcu_check_board(ret);
> +	if (ret < 0)
> +		return ret;
> +
> +	mcu = devm_kmalloc(dev, sizeof(*mcu), GFP_KERNEL);
> +	if (!mcu)
> +		return -ENOMEM;
> +
> +	mcu->client = client;
> +	mcu->board_info = &sg2042_boards_data[ret];
> +
> +	ret = sysfs_create_group(&dev->kobj, &sg2042_mcu_attr_group);
> +	if (ret < 0)
> +		return ret;
> +
> +	i2c_set_clientdata(client, mcu);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 mcu,
> +							 &sg2042_mcu_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static void sg2042_mcu_i2c_remove(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +
> +	sysfs_remove_group(&dev->kobj, &sg2042_mcu_attr_group);
> +}
> +
> +static const struct i2c_device_id sg2042_mcu_id[] = {
> +	{ "sg2042-hwmon-mcu", 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, sg2042_mcu_id);
> +
> +static const struct of_device_id sg2042_mcu_of_id[] = {
> +	{ .compatible = "sophgo,sg2042-hwmon-mcu" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, sg2042_mcu_of_id);
> +
> +static struct i2c_driver sg2042_mcu_driver = {
> +	.driver = {
> +		.name = "sg2042-mcu",
> +		.of_match_table = sg2042_mcu_of_id,
> +	},
> +	.probe = sg2042_mcu_i2c_probe,
> +	.remove = sg2042_mcu_i2c_remove,
> +	.id_table = sg2042_mcu_id,
> +};
> +
> +module_i2c_driver(sg2042_mcu_driver);
> +
> +MODULE_DESCRIPTION("MCU I2C driver for bm16xx soc platform");
> +MODULE_LICENSE("GPL");
> --
> 2.44.0
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
