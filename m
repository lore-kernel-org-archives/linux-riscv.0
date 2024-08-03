Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CD9C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Aug 2024 03:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y++M84eaWhPW0wxRxDrU87lbjx+efevclkaO6Vb5TB0=; b=lQpIMAAi94s2oS
	cQHcZQx2TxNk33qViA3BLFLQZ7MYGUl/aThFO29minvzMmkBAe4vD9ZpyY9xonIr0OJD1S1Dj4OML
	De2MKdhl2NKk/jIuxxZhiEMTSnDg2VtRNGjQmC3HdW2soSyINplykfcP5IxTnL9XrfX1nKloNpGzA
	L+F0dAlHCWZ1E2ouIGV16/kTLVScpr+ZjKuGne2/XUHVJ1nUsEEg217UQFU/b/iYdTIViGIU8RQMh
	XXDtlESmqNcRiZmF/fCDnk3f8onjW7GfydTKWZCj8GfGgGW4iK8aXQ92rFn1ZWV2UZDQV6wLiwJKb
	kYdB+wpKEYcYX8vsN0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa5jj-0000000AgeW-0mrm;
	Sat, 03 Aug 2024 03:47:19 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sa5jg-0000000AgdN-2HeB
	for linux-riscv@lists.infradead.org;
	Sat, 03 Aug 2024 03:47:18 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3db1eb76702so5700429b6e.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 20:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722656834; x=1723261634; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ksXwGB2P8B8fKj8NOP3nkaqplHNkrgjmluLVxXrJ1Rw=;
        b=cXTX+sHqilgrtihtKdO35KP6+BW1MQ5Yj0eVGQ0VZbjhgnoEZMNEKJYONap/B3eJci
         w0lnhkw0gqdLW8mwwyt4aVV+2+jN9+hGtqY9oNsMuVj5rGBrdPFR02Nuj4/aWD6cl97p
         N+wHqqZbWnWP4PEphe/ImR+93sFNiwBV2lM5HvmIFV6rce10VTNE4JHC2FlKcRF0ZR8D
         LqPheDGpW48l10RC0q+PYxUDP9hG+ZDlTI1OIIhNFMlDy2hGBY/B0Zaqr+rNOpfrwejT
         +LmyvBNzh7AAooYq1cmRLs8H1vrPudG/M1afQfHdZE61ja8Fb/vS7o5dt2ENsJKlKyYv
         FLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722656834; x=1723261634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksXwGB2P8B8fKj8NOP3nkaqplHNkrgjmluLVxXrJ1Rw=;
        b=bAr0laCGsDwwHqOH7Tz21klVL3eZ+vVEwzaNiyOVFMQKtmu1y4j1Cr2qKj2eqLszsG
         FiB7jB1/VW3CfZAomhaOzW/F7+SGSeYm4238LCIU8l0uTcPN2sLay4DSwAvHHd2onwXP
         kLLxYQWGOZNuzXMdiEFz1LdGI5AKTu0iO67zM+7GMKsFteMB8CmHGZLll3WOZInhmWKH
         3jt1/oXk1J6o9+/t7yrUvMh92uKxcwS+wT7Wt5Qaav+wNnDMdVe2OfAH347CKb2IOJJ+
         rR+RMNgZJDjy6mlj2fJEya7R8aOtAoZ6o0B3IBDxZr2iyrj5H2npR4AMmMym7RGjcQko
         9VgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDJo/Gf9q4JK4nqyLo8HkFnhSU6rS7M4PjO4T0YUgvfsxicJWRejY5uSgtmo8tl7qK73V50yN/dZ3Zo8/Y9wTqcIehpCgmUqYE8DgoBYTp
X-Gm-Message-State: AOJu0YzrGa0kPG/Vwz8HecEEuaOltADebzLv0y+Qj23usp4GXizQDvPf
	EQ+2+KtHKWjiUERMn9LSdM5i3i0KbPlsZH5hv8DwledJ1UM3K7q6
X-Google-Smtp-Source: AGHT+IFEAV0r4XQJVKf+0GSPvPZxEV4/jpRwhyyiI8h4ct/tuxflR3GqQGqfhtrxWijlvxsLpP9RhA==
X-Received: by 2002:a05:6808:1924:b0:3d9:3f5d:7b59 with SMTP id 5614622812f47-3db55786e0fmr6369017b6e.0.1722656834246;
        Fri, 02 Aug 2024 20:47:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592979d7sm24892845ad.259.2024.08.02.20.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 20:47:13 -0700 (PDT)
Message-ID: <87ec50bb-7040-451c-832b-27b93923d5cf@roeck-us.net>
Date: Fri, 2 Aug 2024 20:47:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/4] drivers: hwmon: sophgo: Add SG2042 external
 hardware monitor support
To: Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Jinyu Tang <tangjinyu@tinylab.org>, Hal Feng <hal.feng@starfivetech.com>,
 Yangyu Chen <cyy@cyyself.name>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <IA1PR20MB495337877FFC8D787A045C15BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953032E1B5D58D2F6C7393DBBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
 <c165cc19-d324-47aa-94a4-2d2db79afb0f@roeck-us.net>
 <IA1PR20MB4953DFA5607E92D16E1B31FABBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <IA1PR20MB4953DFA5607E92D16E1B31FABBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_204716_666410_A83B8CD7 
X-CRM114-Status: GOOD (  16.73  )
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

On 8/2/24 16:28, Inochi Amaoto wrote:
> On Fri, Aug 02, 2024 at 06:59:22AM GMT, Guenter Roeck wrote:
>> On 8/2/24 05:38, Inochi Amaoto wrote:
>>> SG2042 use an external MCU to provide basic hardware information
>>> and thermal sensors.
>>>
>>> Add driver support for the onboard MCU of SG2042.
>>>
>>> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
>>> Tested-by: Chen Wang <unicorn_wang@outlook.com>
>>> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
>>> ---
>>>    Documentation/hwmon/index.rst      |   1 +
>>>    Documentation/hwmon/sg2042-mcu.rst |  39 +++
>>>    drivers/hwmon/Kconfig              |  11 +
>>>    drivers/hwmon/Makefile             |   1 +
>>>    drivers/hwmon/sg2042-mcu.c         | 394 +++++++++++++++++++++++++++++
>>>    5 files changed, 446 insertions(+)
>>>    create mode 100644 Documentation/hwmon/sg2042-mcu.rst
>>>    create mode 100644 drivers/hwmon/sg2042-mcu.c
>>>
>>> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
>>> index 913c11390a45..ea3b5be8fe4f 100644
>>> --- a/Documentation/hwmon/index.rst
>>> +++ b/Documentation/hwmon/index.rst
>>> @@ -206,6 +206,7 @@ Hardware Monitoring Kernel Drivers
>>>       sch5636
>>>       scpi-hwmon
>>>       sfctemp
>>> +   sg2042-mcu
>>>       sht15
>>>       sht21
>>>       sht3x
>>> diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
>>> new file mode 100644
>>> index 000000000000..250016b47dd1
>>> --- /dev/null
>>> +++ b/Documentation/hwmon/sg2042-mcu.rst
>>> @@ -0,0 +1,39 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +Kernel driver sg2042-mcu
>>> +=====================
>>> +
>>> +Supported chips:
>>> +
>>> +  * Onboard MCU for sg2042
>>> +
>>> +    Addresses scanned: -
>>> +
>>> +    Prefix: 'sg2042-mcu'
>>> +
>>> +Authors:
>>> +
>>> +  - Inochi Amaoto <inochiama@outlook.com>
>>> +
>>> +Description
>>> +-----------
>>> +
>>> +This driver supprts hardware monitoring for onboard MCU with
>>> +i2c interface.
>>> +
>>> +Usage Notes
>>> +-----------
>>> +
>>> +This driver does not auto-detect devices. You will have to instantiate
>>> +the devices explicitly.
>>> +Please see Documentation/i2c/instantiating-devices.rst for details.
>>> +
>>> +Sysfs Attributes
>>> +----------------
>>> +
>>> +================= =============================================
>>> +temp1_input       Measured temperature of SoC
>>> +temp1_crit        Critical high temperature
>>> +temp1_crit_hyst   hysteresis temperature restore from Critical
>>> +temp2_input       Measured temperature of the base board
>>> +================= =============================================
>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>> index b60fe2e58ad6..7aa6c3f322e5 100644
>>> --- a/drivers/hwmon/Kconfig
>>> +++ b/drivers/hwmon/Kconfig
>>> @@ -2066,6 +2066,17 @@ config SENSORS_SFCTEMP
>>>    	  This driver can also be built as a module.  If so, the module
>>>    	  will be called sfctemp.
>>> +config SENSORS_SG2042_MCU
>>> +	tristate "Sophgo onboard MCU support"
>>> +	depends on I2C
>>> +	depends on ARCH_SOPHGO || COMPILE_TEST
>>> +	help
>>> +	  Support for onboard MCU of Sophgo SG2042 SoCs. This mcu provides
>>> +	  power control and some basic information.
>>> +
>>> +	  This driver can be built as a module. If so, the module
>>> +	  will be called sg2042-mcu.
>>> +
>>>    config SENSORS_SURFACE_FAN
>>>    	tristate "Surface Fan Driver"
>>>    	depends on SURFACE_AGGREGATOR
>>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>>> index b1c7056c37db..0bbe812a67ae 100644
>>> --- a/drivers/hwmon/Makefile
>>> +++ b/drivers/hwmon/Makefile
>>> @@ -194,6 +194,7 @@ obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>>>    obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>>>    obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o
>>>    obj-$(CONFIG_SENSORS_SFCTEMP)	+= sfctemp.o
>>> +obj-$(CONFIG_SENSORS_SG2042_MCU) += sg2042-mcu.o
>>>    obj-$(CONFIG_SENSORS_SL28CPLD)	+= sl28cpld-hwmon.o
>>>    obj-$(CONFIG_SENSORS_SHT15)	+= sht15.o
>>>    obj-$(CONFIG_SENSORS_SHT21)	+= sht21.o
>>> diff --git a/drivers/hwmon/sg2042-mcu.c b/drivers/hwmon/sg2042-mcu.c
>>> new file mode 100644
>>> index 000000000000..6d8d677f86f3
>>> --- /dev/null
>>> +++ b/drivers/hwmon/sg2042-mcu.c
>>> @@ -0,0 +1,394 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Inochi Amaoto <inochiama@outlook.com>
>>> + *
>>> + * Sophgo power control mcu for SG2042
>>> + */
>>> +
>>> +#include <linux/cleanup.h>
>>> +#include <linux/debugfs.h>
>>> +#include <linux/err.h>
>>> +#include <linux/hwmon.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +
>>> +/* fixed MCU registers */
>>> +#define REG_BOARD_TYPE				0x00
>>> +#define REG_MCU_FIRMWARE_VERSION		0x01
>>> +#define REG_PCB_VERSION				0x02
>>> +#define REG_PWR_CTRL				0x03
>>> +#define REG_SOC_TEMP				0x04
>>> +#define REG_BOARD_TEMP				0x05
>>> +#define REG_RST_COUNT				0x0a
>>> +#define REG_UPTIME				0x0b
>>> +#define REG_RESET_REASON			0x0d
>>> +#define REG_MCU_TYPE				0x18
>>> +#define REG_REPOWER_ACTION			0x65
>>> +#define REG_CRITICAL_TEMP			0x66
>>> +#define REG_REPOWER_TEMP			0x67
>>> +
>>> +#define REPOWER_ACTION_REBOOT			1
>>> +#define REPOWER_ACTION_POWEROFF			2
>>> +
>>> +#define MCU_POWER_MAX				0xff
>>> +
>>> +#define DEFINE_MCU_DEBUG_ATTR(_name, _reg, _format)			\
>>> +	static int _name##_show(struct seq_file *seqf,			\
>>> +				    void *unused)			\
>>> +	{								\
>>> +		struct sg2042_mcu_data *mcu = seqf->private;		\
>>> +		int ret;						\
>>> +		ret = i2c_smbus_read_byte_data(mcu->client, (_reg));	\
>>> +		if (ret < 0)						\
>>> +			return ret;					\
>>> +		seq_printf(seqf, _format "\n", ret);			\
>>> +		return 0;						\
>>> +	}								\
>>> +	DEFINE_SHOW_ATTRIBUTE(_name)					\
>>> +
>>> +struct sg2042_mcu_data {
>>> +	struct i2c_client	*client;
>>> +	struct dentry		*debugfs;
>>> +	struct mutex		mutex;
>>> +};
>>> +
>>> +static struct dentry *sgmcu_debugfs;
>>> +
>>> +static ssize_t reset_count_show(struct device *dev,
>>> +				struct device_attribute *attr,
>>> +				char *buf)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_read_byte_data(mcu->client, REG_RST_COUNT);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return sprintf(buf, "%d\n", ret);
>>> +}
>>> +
>>> +static ssize_t uptime_show(struct device *dev,
>>> +			   struct device_attribute *attr,
>>> +			   char *buf)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	u8 time_val[2];
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_read_i2c_block_data(mcu->client, REG_UPTIME,
>>> +					    sizeof(time_val), time_val);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return sprintf(buf, "%d\n",
>>> +		       (int)(time_val[0]) + (int)(time_val[1] << 8));
>>
>> Pointless type casts
>>
>>> +}
>>> +
>>> +static ssize_t reset_reason_show(struct device *dev,
>>> +				 struct device_attribute *attr,
>>> +				 char *buf)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	ret = i2c_smbus_read_byte_data(mcu->client, REG_RESET_REASON);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return sprintf(buf, "0x%02x\n", ret);
>>> +}
>>> +
>>> +static ssize_t repower_action_show(struct device *dev,
>>> +				   struct device_attribute *attr,
>>> +				   char *buf)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	int ret;
>>> +	const char *action;
>>> +
>>> +	ret = i2c_smbus_read_byte_data(mcu->client, REG_REPOWER_ACTION);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	if (ret == REPOWER_ACTION_REBOOT)
>>> +		action = "reboot";
>>> +	else if (ret == REPOWER_ACTION_POWEROFF)
>>> +		action = "poweroff";
>>> +	else
>>> +		action = "unknown";
>>> +
>>> +	return sprintf(buf, "%s\n", action);
>>> +}
>>> +
>>> +static ssize_t repower_action_store(struct device *dev,
>>> +				    struct device_attribute *attr,
>>> +				    const char *buf, size_t count)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	u8 value;
>>> +	int ret;
>>> +
>>> +	if (sysfs_streq("reboot", buf))
>>> +		value = REPOWER_ACTION_REBOOT;
>>> +	else if (sysfs_streq("poweroff", buf))
>>> +		value = REPOWER_ACTION_POWEROFF;
>>> +	else
>>> +		return -EINVAL;
>>> +
>>> +	guard(mutex)(&mcu->mutex);
>>> +
>> Pointless mutex protection.
>>
> 
> OK, I have seen the protection in the i2c bus. I will remove this.
> 
>>> +	ret = i2c_smbus_write_byte_data(mcu->client,
>>> +					REG_REPOWER_ACTION, value);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RO(reset_count);
>>> +static DEVICE_ATTR_RO(uptime);
>>> +static DEVICE_ATTR_RO(reset_reason);
>>> +static DEVICE_ATTR_RW(repower_action);
>>> +
>>> +DEFINE_MCU_DEBUG_ATTR(firmware_version, REG_MCU_FIRMWARE_VERSION, "0x%02x");
>>> +DEFINE_MCU_DEBUG_ATTR(pcb_version, REG_PCB_VERSION, "0x%02x");
>>> +DEFINE_MCU_DEBUG_ATTR(board_type, REG_BOARD_TYPE, "0x%02x");
>>> +DEFINE_MCU_DEBUG_ATTR(mcu_type, REG_MCU_TYPE, "%d");
>>> +
>>> +static struct attribute *sg2042_mcu_attrs[] = {
>>> +	&dev_attr_reset_count.attr,
>>> +	&dev_attr_uptime.attr,
>>> +	&dev_attr_reset_reason.attr,
>>> +	&dev_attr_repower_action.attr,
>>> +	NULL
>>> +};
>>> +
>>> +static const struct attribute_group sg2042_mcu_attr_group = {
>>> +	.attrs	= sg2042_mcu_attrs,
>>> +};
>>> +
>>> +static const struct attribute_group *sg2042_mcu_groups[] = {
>>> +	&sg2042_mcu_attr_group,
>>> +	NULL
>>> +};
>>> +
>>> +static const struct hwmon_channel_info * const sg2042_mcu_info[] = {
>>> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
>>> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_CRIT |
>>> +					HWMON_T_CRIT_HYST,
>>> +				 HWMON_T_INPUT),
>>> +	NULL
>>> +};
>>> +
>>> +static int sg2042_mcu_read(struct device *dev,
>>> +			   enum hwmon_sensor_types type,
>>> +			   u32 attr, int channel, long *val)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	int tmp;
>>> +	u8 reg;
>>> +
>>> +	switch (attr) {
>>> +	case hwmon_temp_input:
>>> +		reg = channel ? REG_BOARD_TEMP : REG_SOC_TEMP;
>>> +		break;
>>> +	case hwmon_temp_crit:
>>> +		reg = REG_CRITICAL_TEMP;
>>> +		break;
>>> +	case hwmon_temp_crit_hyst:
>>> +		reg = REG_REPOWER_TEMP;
>>> +		break;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +
>>> +	tmp = i2c_smbus_read_byte_data(mcu->client, reg);
>>> +	if (tmp < 0)
>>> +		return tmp;
>>> +	*val = tmp * 1000;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int sg2042_mcu_write(struct device *dev,
>>> +			    enum hwmon_sensor_types type,
>>> +			    u32 attr, int channel, long val)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = dev_get_drvdata(dev);
>>> +	int temp = val / 1000;
>>> +	int hyst_temp, crit_temp;
>>> +	u8 reg;
>>> +
>>> +	if (temp > MCU_POWER_MAX)
>>> +		temp = MCU_POWER_MAX;
>>> +	else if (temp < 0)
>>> +		temp = 0;
>>> +
>> 	temp = clamp_val(temp, 0, MCU_POWER_MAX);
>>
>>> +	guard(mutex)(&mcu->mutex);
>>> +
>>> +	switch (attr) {
>>> +	case hwmon_temp_crit:
>>> +		hyst_temp = i2c_smbus_read_byte_data(mcu->client,
>>> +						     REG_REPOWER_TEMP);
>>> +		if (hyst_temp < 0)
>>> +			return hyst_temp;
>>> +
>>> +		crit_temp = temp;
>>> +		reg = REG_CRITICAL_TEMP;
>>> +		break;
>>> +	case hwmon_temp_crit_hyst:
>>> +		crit_temp = i2c_smbus_read_byte_data(mcu->client,
>>> +						     REG_CRITICAL_TEMP);
>>> +		if (crit_temp < 0)
>>> +			return crit_temp;
>>> +
>>> +		hyst_temp = temp;
>>> +		reg = REG_REPOWER_TEMP;
>>> +		break;
>>> +	default:
>>> +		return -EOPNOTSUPP;
>>> +	}
>>> +
>>> +	/*
>>> +	 * ensure hyst_temp is smaller to avoid MCU from
>>> +	 * keeping triggering repower event.
>>> +	 */
>>> +	if (crit_temp < hyst_temp)
>>> +		return -EINVAL;
>>> +
>>> +	return i2c_smbus_write_byte_data(mcu->client, reg, temp);
>>> +}
>>> +
>>> +static umode_t sg2042_mcu_is_visible(const void *_data,
>>> +				     enum hwmon_sensor_types type,
>>> +				     u32 attr, int channel)
>>> +{
>>> +	switch (type) {
>>> +	case hwmon_temp:
>>> +		switch (attr) {
>>> +		case hwmon_temp_input:
>>> +			return 0444;
>>> +		case hwmon_temp_crit:
>>> +		case hwmon_temp_crit_hyst:
>>> +			if (channel == 0)
>>> +				return 0664;
>>> +			break;
>>
>> In practice this is the only break; in this nested switch sequence,
>> making the return 0; at the end necessary.
>>
>> Please either use break; always when returning 0, or return 0 here
>> as well and drop the final return 0;
>>
> 
> Thanks, but I have a question: as this break can be fallthrough to the
> default, is it better to use break;/return 0;, or just remove this
> break; and let it fallthrough?
> 

Either always use break; when returning 0 or always use "return 0;".
Please don't rely on fallthrough; it doesn't improve anything since you'd
have to tag it as fallthrough and you might then as well use break;
or return 0; directly.

Guenter

>>> +		default:
>>> +			return 0;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		return 0;
>>> +	}
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct hwmon_ops sg2042_mcu_ops = {
>>> +	.is_visible = sg2042_mcu_is_visible,
>>> +	.read = sg2042_mcu_read,
>>> +	.write = sg2042_mcu_write,
>>> +};
>>> +
>>> +static const struct hwmon_chip_info sg2042_mcu_chip_info = {
>>> +	.ops = &sg2042_mcu_ops,
>>> +	.info = sg2042_mcu_info,
>>> +};
>>> +
>>> +static void sg2042_mcu_debugfs_init(struct sg2042_mcu_data *mcu,
>>> +				    struct device *dev)
>>> +{
>>> +	mcu->debugfs = debugfs_create_dir(dev_name(dev), sgmcu_debugfs);
>>> +	if (mcu->debugfs) {
>>
>> debugfs_create_dir() returns an ERR_PTR(), which is checked in debugfs_create_file().
>> This if() is pointless.
>>
> 
> Thanks.
> 
>>> +		debugfs_create_file("firmware_version", 0444, mcu->debugfs,
>>> +				    mcu, &firmware_version_fops);
>>> +		debugfs_create_file("pcb_version", 0444, mcu->debugfs, mcu,
>>> +				    &pcb_version_fops);
>>> +		debugfs_create_file("mcu_type", 0444, mcu->debugfs, mcu,
>>> +				    &mcu_type_fops);
>>> +		debugfs_create_file("board_type", 0444, mcu->debugfs, mcu,
>>> +				    &board_type_fops);
>>> +	}
>>> +}
>>> +
>>> +static int sg2042_mcu_i2c_probe(struct i2c_client *client)
>>> +{
>>> +	struct device *dev = &client->dev;
>>> +	struct sg2042_mcu_data *mcu;
>>> +	struct device *hwmon_dev;
>>> +
>>> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
>>> +						I2C_FUNC_SMBUS_BLOCK_DATA))
>>> +		return -EIO;
>>> +
>> 		return -ENODEV;
>>
>>> +	mcu = devm_kmalloc(dev, sizeof(*mcu), GFP_KERNEL);
>>> +	if (!mcu)
>>> +		return -ENOMEM;
>>> +
>>> +	mutex_init(&mcu->mutex);
>>> +	mcu->client = client;
>>> +
>>> +	i2c_set_clientdata(client, mcu);
>>> +
>>> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "sg2042_mcu",
>>> +							 mcu,
>>> +							 &sg2042_mcu_chip_info,
>>> +							 NULL);
>>> +	if (IS_ERR_OR_NULL(hwmon_dev))
>>> +		return -EFAULT;
>>
>> devm_hwmon_device_register_with_info() returns an ERR_PTR(), and
>> returning -EFAULT instead of it is more than wrong (this does not indicate
>> a "bad address"). This needs to be
>>
>> 	if (IS_ERR(hwmon_dev))
>> 		return PTR_ERR(hwmon_dev);
>>
>> I am sure I asked before not to overwrite error codes.
> 
> Yes, you have asked, it seems that I have missed this code when I
> check the driver. I apology for this mistake and thanks for your
> reminder.
> 
>>
>>> +
>>> +	sg2042_mcu_debugfs_init(mcu, dev);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void sg2042_mcu_i2c_remove(struct i2c_client *client)
>>> +{
>>> +	struct sg2042_mcu_data *mcu = i2c_get_clientdata(client);
>>> +
>>> +	debugfs_remove_recursive(mcu->debugfs);
>>> +}
>>> +
>>> +static const struct i2c_device_id sg2042_mcu_id[] = {
>>> +	{ "sg2042-hwmon-mcu", 0 },
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, sg2042_mcu_id);
>>> +
>>> +static const struct of_device_id sg2042_mcu_of_id[] = {
>>> +	{ .compatible = "sophgo,sg2042-hwmon-mcu" },
>>> +	{},
>>> +};
>>> +MODULE_DEVICE_TABLE(of, sg2042_mcu_of_id);
>>> +
>>> +static struct i2c_driver sg2042_mcu_driver = {
>>> +	.driver = {
>>> +		.name = "sg2042-mcu",
>>> +		.of_match_table = sg2042_mcu_of_id,
>>> +		.dev_groups = sg2042_mcu_groups,
>>> +	},
>>> +	.probe = sg2042_mcu_i2c_probe,
>>> +	.remove = sg2042_mcu_i2c_remove,
>>> +	.id_table = sg2042_mcu_id,
>>> +};
>>> +
>>> +static int __init sg2042_mcu_init(void)
>>> +{
>>> +	sgmcu_debugfs = debugfs_create_dir("sg2042-mcu", NULL);
>>> +	return i2c_add_driver(&sg2042_mcu_driver);
>>> +}
>>> +
>>> +static void __exit sg2042_mcu_exit(void)
>>> +{
>>> +	debugfs_remove_recursive(sgmcu_debugfs);
>>> +	i2c_del_driver(&sg2042_mcu_driver);
>>> +}
>>> +
>>> +module_init(sg2042_mcu_init);
>>> +module_exit(sg2042_mcu_exit);
>>> +
>>> +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
>>> +MODULE_DESCRIPTION("MCU I2C driver for SG2042 soc platform");
>>> +MODULE_LICENSE("GPL");
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
