Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED064CEE345
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 17:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y5q44y3QIPKpC7APoIHBQIWyC8FgJ6MoBOutomVp5ZI=; b=gInPkVquBv6aPX
	xaVW6hpZB7j8lhhrV3kZwI4Da0HzAdE4JeeAiPQiiP+O1XBjPsCGHXBnXMHCxUdzeyQT2dqiLkDn2
	FQMhTlWmyqJYkXh9mYUsf8pybyusUBViUoZ7eP3VRl9dPKFKD03MdAcjFPQPpb006DhHNk19hL7pj
	1mnWAht639fpPLhIXgy0AZ/Wy9wHwpJl72IdOUDLAZqVDRwPNGb0atX7lriZ987vL3i47kZ8H84eW
	+yekN916wAiFzQqzAa9L1F6BKi8PYbY0LNXRVh/Pz4mUvBRpyXAvjxfUPnIeOaWkDNR/WhBVVBXR1
	LEdOejMwiWM0EgL9WIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZS-00000000rma-42qM;
	Tue, 18 Nov 2025 17:32:50 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPZQ-00000000rmE-1nCn
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 17:32:50 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-43346da8817so291915ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 09:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487167; x=1764091967; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pu4RaW/adRJl1MfB7vv6yTOog/9xDSRA44tjj5hdSvg=;
        b=MvtGwgHYdYEj0fOza9CT9ipg7Z16hl5AZZSqVFMoZcSbrZT/bA/9MPWVG0ogAhv1LC
         BIBT9OFhfh42ZAIG2xl3fepF6HHMmobwlgkCMFTcGwxy8z5/Lly5RNa87adThkSAd6PR
         i8+U/o81DEInXc62s6zrIDKa5Oy+iyZuTm0/rxkslh0O7fSY+H2p3a04ks16f5yBfR0c
         7A8LsJx94s5m2/twwAGYYMrZLCppuAX8LE4lt3TkGMGucDo9xlkRGeqFPNhal3J5rOeB
         iZWcYadWl8J432Sp37DbWva4IdKR4OtGb6jM3KOjiXsF6dKDQtRhFJ2KWwFTLL9DE1nf
         m7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487167; x=1764091967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pu4RaW/adRJl1MfB7vv6yTOog/9xDSRA44tjj5hdSvg=;
        b=qdT1k/s01xn/PLhMS0G6QSEg6fz2o+v9bzEXNGL7iko5QPQl7fUoxt8XPcSPeIYp4o
         LEns1v5Rm2PWWtCG6NojOYg7E+o4tjZ51DK1uha2KbIOjVIbtqNePwnb7gOQuHqTi5UK
         OEa6Hi7yJsC2EwXd8YjdwVZbAVqSaMeMVYaEdGT71qqfUBHxofGdoVLcnkpCDjgTJ/6G
         qCIA8Rt5nvQ9uoJSquAmCHPAn/64YTxk+tbOuKLau7qlHEQaC8nrQPKMV0PMeIGnkTK5
         Ap1rWL8RwmJ7BiY3SX9RtMWLwWVCFv16xTqtJyMtHIK6PzyDT9fYwsEq3uYnsQF7xruV
         4PgA==
X-Forwarded-Encrypted: i=1; AJvYcCWosHc8GciuwhVdEvNH2HFomakYKdMZ5QSgNoOe9rfTvsQuKN+FkSCbtsF5rruYFCOWuLDxbzQByWErFw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaY3PVfJhTAqvGChCHbxvY7iiqd3bykIKPxKHhd6ztOCwMbbDN
	oyF969XHoQxIfYufYpfEFVeUwEbShFA75PSlb9RvZIMJgp265xIO45b3GGn/KIfuZeo=
X-Gm-Gg: ASbGncsg03iu9Liu3oVC2W6wVbK2mZsB6Nq3x2SvcTRyyFmdWYBHDTVNVnVoJbtzwNh
	zZxeOzH5arJucGZSZ2hqIdk1Wvv8LXco3qbNghzghLCeUT/oNgwhHQnq3XhcX5E/q09rgGH2t0W
	6iVevh/O0F5TEWqBdkB6CPGnxNHA7Aj2F/svFN8uT8t507TJLbYlNZpUTiPF7Vr+LtdjPONANTN
	oOr/g0v2amSTY00yrFbUvdadBztco/zOxmJuHJbkmHQayHMUx1DfVzoeexWEpiRc2BufN/9w/9+
	4W0MiIHh3HVwHEH3s3xNAdxtEVrZZalgyfrIowyvTdtBbti/GWnCPqphgDEpc5jvyA1G17Vt5D3
	6n+RDIfCyrWBQlIqZRXofBw1ZyDlQnHjEaZayzm8Y/BvOxK0HPfzYhMpBD7+I/dAbNiIKVMLw+B
	+8npNVO1fhTKWFlTdEoPAhYy/wOOKhMsobjEYIYAAQtXAp7qKX0NiisHpvdSe6
X-Google-Smtp-Source: AGHT+IHwAjz5WOp6SuJ02HMWEOMskTUmCII/9UYK0mDD5ujh5qsPthyqvTdOSpZtXRbXZYu6uypI7A==
X-Received: by 2002:a05:6e02:156b:b0:433:7842:7967 with SMTP id e9e14a558f8ab-4359e80ff22mr3391905ab.11.1763487166617;
        Tue, 18 Nov 2025 09:32:46 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:45 -0800 (PST)
Message-ID: <81eca0ab-47a3-4b12-98ae-fbd46a15ff93@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] i2c: spacemit: configure ILCR for accurate SCL
 frequency
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-1-8839c5ac5db3@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_093248_608945_97A8F440 
X-CRM114-Status: GOOD (  46.31  )
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

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> The SpacemiT I2C controller's SCL (Serial Clock Line) frequency for
> master mode operations is determined by the ILCR (I2C Load Count Register).
> Previously, the driver relied on the hardware's reset default
> values for this register.
> 
> The hardware's default ILCR values (SLV=0x156, FLV=0x5d) yield SCL
> frequencies lower than intended. For example, with the default
> 31.5 MHz input clock, these default settings result in an SCL
> frequency of approximately 93 kHz (standard mode) when targeting 100 kHz,
> and approximately 338 kHz (fast mode) when targeting 400 kHz.
> These frequencies are below the 100 kHz/400 kHz nominal speeds.
> 
> This patch integrates the SCL frequency management into
> the Common Clock Framework (CCF). Specifically, the ILCR register,
> which acts as a frequency divider for the SCL clock, is now registered
> as a managed clock (scl_clk) within the CCF.
> 
> This patch also cleans up unnecessary whitespace
> in the included header files.

I have a few comments below.  Sorry I didn't comment on
earlier versions. > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> Link: https://lore.kernel.org/all/176244506110.1925720.10807118665958896958.b4-ty@kernel.org/ [1]
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> This patch was affected by the P1 Kconfig, which caused the maintainer
> to revert it.
> The current commit is a direct cherry-pick and reserves the original changelog.
> This note is to clarify for anyone who sees the cover letter marked as v2
> while the changelog entries reach v4.
> ---
> Changelog in v4:
> - initialize clk_init_data with {} so that init.flags is implicitly set to 0
> - minor cleanup and style fixes for better readability
> - remove unused spacemit_i2c_scl_clk_exclusive_put() cleanup callback
> - replace clk_set_rate_exclusive()/clk_rate_exclusive_put() pair with clk_set_rate()
> - simplify LCR LV field macros by using FIELD_GET/FIELD_MAX helpers
> - Link to v3: https://lore.kernel.org/all/20250814-k1-i2c-ilcr-v3-1-317723e74bcd@linux.spacemit.com/
> 
> Changelog in v3:
> - use MASK macro in `recalc_rate` function
> - rename clock name
> - Link to v2: https://lore.kernel.org/r/20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com
> 
> Changelog in v2:
> - Align line breaks.
> - Check `lv` in `clk_set_rate` function.
> - Force fast mode when SCL frequency is illegal or unavailable.
> - Change "linux/bits.h" to <linux/bits.h>
> - Kconfig: Add dependency on CCF.
> - Link to v1: https://lore.kernel.org/all/20250710-k1-i2c-ilcr-v1-1-188d1f460c7d@linux.spacemit.com/
> ---
>   drivers/i2c/busses/Kconfig  |   2 +-
>   drivers/i2c/busses/i2c-k1.c | 159 ++++++++++++++++++++++++++++++++++++++++----
>   2 files changed, 146 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index fd81e49638aaa161ae264a722e9e06adc7914cda..fedf5d31f9035b73a27a7f8a764bf5c26975d0e1 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -798,7 +798,7 @@ config I2C_JZ4780
>   config I2C_K1
>   	tristate "SpacemiT K1 I2C adapter"
>   	depends on ARCH_SPACEMIT || COMPILE_TEST
> -	depends on OF
> +	depends on OF && COMMON_CLK
>   	help
>   	  This option enables support for the I2C interface on the SpacemiT K1
>   	  platform.
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612e098b8ad17418f420d87c94df166..e38a0ba71734ca602854c85672dcb61423453515 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -4,18 +4,21 @@
>    */
>   
>   #include <linux/bitfield.h>
> - #include <linux/clk.h>
> - #include <linux/i2c.h>
> - #include <linux/iopoll.h>
> - #include <linux/module.h>
> - #include <linux/of_address.h>
> - #include <linux/platform_device.h>
> +#include <linux/bits.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
>   
>   /* spacemit i2c registers */
>   #define SPACEMIT_ICR		 0x0		/* Control register */
>   #define SPACEMIT_ISR		 0x4		/* Status register */
>   #define SPACEMIT_IDBR		 0xc		/* Data buffer register */
>   #define SPACEMIT_IRCR		 0x18		/* Reset cycle counter */
> +#define SPACEMIT_ILCR		 0x10		/* Load Count Register */
>   #define SPACEMIT_IBMR		 0x1c		/* Bus monitor register */
>   
>   /* SPACEMIT_ICR register fields */
> @@ -87,6 +90,13 @@
>   #define SPACEMIT_BMR_SDA         BIT(0)		/* SDA line level */
>   #define SPACEMIT_BMR_SCL         BIT(1)		/* SCL line level */
>   
> +#define SPACEMIT_LCR_LV_STANDARD_SHIFT		0
> +#define SPACEMIT_LCR_LV_FAST_SHIFT		9

Why do you need these SHIFT symbols?  Just use the masks
and FIELD_GET() related macros.  I'll provide examples below.

> +#define SPACEMIT_LCR_LV_STANDARD_MASK		GENMASK(8, 0)
> +#define SPACEMIT_LCR_LV_FAST_MASK		GENMASK(17, 9)
> +#define SPACEMIT_LCR_LV_STANDARD_MAX_VALUE	FIELD_MAX(SPACEMIT_LCR_LV_STANDARD_MASK)
> +#define SPACEMIT_LCR_LV_FAST_MAX_VALUE		FIELD_MAX(SPACEMIT_LCR_LV_FAST_MASK)
> +
>   /* i2c bus recover timeout: us */
>   #define SPACEMIT_I2C_BUS_BUSY_TIMEOUT		100000
>   
> @@ -104,11 +114,20 @@ enum spacemit_i2c_state {
>   	SPACEMIT_STATE_WRITE,
>   };
>   
> +enum spacemit_i2c_mode {
> +	SPACEMIT_MODE_STANDARD,
> +	SPACEMIT_MODE_FAST
> +};

Will there ever be more than two i2c modes?  If not, this
could simply be a Boolean.

> +
>   /* i2c-spacemit driver's main struct */
>   struct spacemit_i2c_dev {
>   	struct device *dev;
>   	struct i2c_adapter adapt;
>   
> +	struct clk_hw scl_clk_hw;
> +	struct clk *scl_clk;
> +	enum spacemit_i2c_mode mode;

Perhaps this could be:

	bool fast_mode;

> +
>   	/* hardware resources */
>   	void __iomem *base;
>   	int irq;
> @@ -129,6 +148,79 @@ struct spacemit_i2c_dev {
>   	u32 status;
>   };
>   
> +static void spacemit_i2c_scl_clk_disable_unprepare(void *data)
> +{
> +	struct spacemit_i2c_dev *i2c = data;
> +
> +	clk_disable_unprepare(i2c->scl_clk);
> +}
> +
> +static int spacemit_i2c_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lv, lcr, mask, shift, max_lv;
> +
> +	lv = DIV_ROUND_UP(parent_rate, rate);

Would DIV_ROUND_CLOSEST() give a more accurate value?

> +
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD) {
> +		mask = SPACEMIT_LCR_LV_STANDARD_MASK;
> +		shift = SPACEMIT_LCR_LV_STANDARD_SHIFT;
> +		max_lv = SPACEMIT_LCR_LV_STANDARD_MAX_VALUE;
> +	} else if (i2c->mode == SPACEMIT_MODE_FAST) {
> +		mask = SPACEMIT_LCR_LV_FAST_MASK;
> +		shift = SPACEMIT_LCR_LV_FAST_SHIFT;
> +		max_lv = SPACEMIT_LCR_LV_FAST_MAX_VALUE;
> +	}
> +
> +	if (!lv || lv > max_lv) {
> +		dev_err(i2c->dev, "set scl clock failed: lv 0x%x", lv);
> +		return -EINVAL;
> +	}
> +
> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +	lcr &= ~mask;
> +	lcr |= lv << shift;
> +	writel(lcr, i2c->base + SPACEMIT_ILCR);

	FIELD_MODIFY(mask, &lcr, lv);

I suppose this might give you trouble because the mask isn't
constant at compile time, but anyway I think something like
this is simpler:

	lv = DIV_ROUND_CLOSEST(parent_rate, rate);
	lcr = readl(i2c->base + SPACEMIT_ILCR);
	if (i2c->fast_mode)
		FIELD_MODIFY(SPACEMIT_LCR_LV_FAST_MASK, &lcr, lv);
	else
		FIELD_MODIFY(SPACEMIT_LCR_LV_STANDARD_MASK, &lcr, lv);
	writel(lcr, i2c->base + SPACEMIT_ILCR);

Note:  I've never used FIELD_MODIFY(), but it looks like this is
how it's supposed to be used.

> +	return 0;
> +}
> +
> +static long spacemit_i2c_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long *parent_rate)
> +{
> +	u32 lv, freq;
> +
> +	lv = DIV_ROUND_UP(*parent_rate, rate);
> +	freq = DIV_ROUND_UP(*parent_rate, lv);

Consider whether DIV_ROUND_CLOSEST() (in one or both of
these) provides a rate that is as close as possible to the
requested rate.

> +
> +	return freq;
> +}
> +
> +static unsigned long spacemit_i2c_clk_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate)
> +{
> +	struct spacemit_i2c_dev *i2c = container_of(hw, struct spacemit_i2c_dev, scl_clk_hw);
> +	u32 lcr, lv = 0;
> +
> +	lcr = readl(i2c->base + SPACEMIT_ILCR);
> +
> +	if (i2c->mode == SPACEMIT_MODE_STANDARD)
> +		lv = FIELD_GET(SPACEMIT_LCR_LV_STANDARD_MASK, lcr);
> +	else if (i2c->mode == SPACEMIT_MODE_FAST)
> +		lv = FIELD_GET(SPACEMIT_LCR_LV_FAST_MASK, lcr);
> +	else
> +		return 0;

You shouldn't need the last else here.  You can probably tell
by inspection that it will always be one mode or the other.
And a Boolean reinforces that.

> +
> +	return DIV_ROUND_UP(parent_rate, lv);
> +}
> +
> +static const struct clk_ops spacemit_i2c_clk_ops = {
> +	.set_rate = spacemit_i2c_clk_set_rate,
> +	.round_rate = spacemit_i2c_clk_round_rate,
> +	.recalc_rate = spacemit_i2c_clk_recalc_rate,
> +};
> +
>   static void spacemit_i2c_enable(struct spacemit_i2c_dev *i2c)
>   {
>   	u32 val;
> @@ -147,6 +239,26 @@ static void spacemit_i2c_disable(struct spacemit_i2c_dev *i2c)
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   
> +static struct clk *spacemit_i2c_register_scl_clk(struct spacemit_i2c_dev *i2c,
> +						 struct clk *parent)
> +{
> +	struct clk_init_data init = {};
> +	char name[32];
> +
> +	snprintf(name, sizeof(name), "%s_scl_clk", dev_name(i2c->dev));

What if dev_name(i2c->dev) is longer than 24?  You should
be checking the return value here.

> +
> +	init.name = name;
> +	init.ops = &spacemit_i2c_clk_ops;
> +	init.parent_data = (struct clk_parent_data[]) {
> +		{ .fw_name = "func" },
> +	};
> +	init.num_parents = 1;
> +
> +	i2c->scl_clk_hw.init = &init;
> +
> +	return devm_clk_register(i2c->dev, &i2c->scl_clk_hw);
> +}
> +
>   static void spacemit_i2c_reset(struct spacemit_i2c_dev *i2c)
>   {
>   	writel(SPACEMIT_CR_UR, i2c->base + SPACEMIT_ICR);
> @@ -246,7 +358,7 @@ static void spacemit_i2c_init(struct spacemit_i2c_dev *i2c)
>   	 */
>   	val |= SPACEMIT_CR_DRFIE;
>   
> -	if (i2c->clock_freq == SPACEMIT_I2C_MAX_FAST_MODE_FREQ)
> +	if (i2c->mode == SPACEMIT_MODE_FAST)
>   		val |= SPACEMIT_CR_MODE_FAST;
>   
>   	/* disable response to general call */
> @@ -538,14 +650,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);

I don't think there's any need to warn when the "clock-frequency"
property is not found.  It's an optional property, and the default
is specified in the binding to be 400 KHz.

>   	/* For now, this driver doesn't support high-speed. */
> -	if (!i2c->clock_freq || i2c->clock_freq > SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq, SPACEMIT_I2C_MAX_FAST_MODE_FREQ);
> +	if (i2c->clock_freq > SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ &&
> +	    i2c->clock_freq <= SPACEMIT_I2C_MAX_FAST_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_FAST;
> +	} else if (i2c->clock_freq && i2c->clock_freq <= SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> +		i2c->mode = SPACEMIT_MODE_STANDARD;
So this I2C driver will literally support *either* the standard
speed *or* the high speed frequency.  Is this a necessary
restriction?  If it is, perhaps the DT binding should be
clear that the speeds should be one of those supported
(because anything else will result in using a supported
speed, not the one provided).

(Sorry, these last two comments are not about your patch,
but about the driver that's already accepted.)

					-Alex

> +	} else {
> +		dev_warn(i2c->dev, "invalid clock-frequency, fallback to fast mode");
> +		i2c->mode = SPACEMIT_MODE_FAST;
>   		i2c->clock_freq = SPACEMIT_I2C_MAX_FAST_MODE_FREQ;
> -	} else if (i2c->clock_freq < SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ) {
> -		dev_warn(dev, "unsupported clock frequency %u; using %u\n",
> -			 i2c->clock_freq,  SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ);
> -		i2c->clock_freq = SPACEMIT_I2C_MAX_STANDARD_MODE_FREQ;
>   	}
>   
>   	i2c->dev = &pdev->dev;
> @@ -567,10 +680,28 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable func clock");
>   
> +	i2c->scl_clk = spacemit_i2c_register_scl_clk(i2c, clk);
> +	if (IS_ERR(i2c->scl_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->scl_clk),
> +				     "failed to register scl clock\n");
> +
>   	clk = devm_clk_get_enabled(dev, "bus");
>   	if (IS_ERR(clk))
>   		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>   
> +	ret = clk_set_rate(i2c->scl_clk, i2c->clock_freq);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to set rate for SCL clock");
> +
> +	ret = clk_prepare_enable(i2c->scl_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to prepare and enable clock");
> +
> +	ret = devm_add_action_or_reset(dev, spacemit_i2c_scl_clk_disable_unprepare, i2c);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register cleanup action for clk disable and unprepare");
> +
>   	spacemit_i2c_reset(i2c);
>   
>   	i2c_set_adapdata(&i2c->adapt, i2c);
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
