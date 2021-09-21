Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B6AC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:25:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEE760E54
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 10:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECEE760E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzK6lYJB8rQ3hKSkh3nbl4DZHwShzyFbA5myJnP+/wk=; b=QmNUtOUoFsWeMnREe6pY6V0f/f
	GlqLVkzB306PdwXup93Js/CwRZ9VkTuGJsZaKQhem1Mx2bdYK0Jh5gocT2aSHhVj7RfytwucM7hDQ
	XxOBQvf8ewq2prwGKCs1bcvwj6ZzO9Wyw2XEZ3bMfiZnEpzRAZHHY5fKW9yqf6cQNTPkq42HT9Lnb
	U9i+FSK2jltvau4EdF3QIkc5MrtMrtj36zL631psQTg/W0MIweBy18iGt+K7szixkUOI7ZBwfp1WC
	6r6EG4nOGRVQEGfaZyav9Dpqd0zIbQPoue3a3COJDnUeM+mVSLPSuxc0mPKGSIM8IUXtmpzfuYaao
	0OYMfjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mScxm-004Hny-Ao; Tue, 21 Sep 2021 10:25:22 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mScxj-004HnH-P5
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 10:25:21 +0000
Received: from [167.98.27.226] (helo=[10.35.5.170])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1mScxX-0002QA-8i; Tue, 21 Sep 2021 11:25:07 +0100
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <28072b8e-2c32-e67d-19d3-026913c0bc7f@codethink.co.uk>
Date: Tue, 21 Sep 2021 11:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_032519_876550_C0A3A205 
X-CRM114-Status: GOOD (  25.20  )
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

On 21/09/2021 06:33, Alexandre Ghiti wrote:
> The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> notifier that will execute a small i2c sequence allowing to reset the
> board.
> 
> The original implementation comes from Marcus Comstedt and Anders Montonen
> (https://forums.sifive.com/t/reboot-command/4721/28).
> 
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

I've got a couple of comments here, mainly is this the right place
and has anyone other than you tested. I tried something similar on
my Unmatched and it just turned the board off.

> ---
>   drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
>   include/linux/mfd/da9063/core.h |  3 +++
>   2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> index df407c3afce3..c87b8d611f20 100644
> --- a/drivers/mfd/da9063-core.c
> +++ b/drivers/mfd/da9063-core.c
> @@ -20,6 +20,7 @@
>   #include <linux/mutex.h>
>   #include <linux/mfd/core.h>
>   #include <linux/regmap.h>
> +#include <linux/reboot.h>
>   
>   #include <linux/mfd/da9063/core.h>
>   #include <linux/mfd/da9063/registers.h>
> @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
>   	return ret;
>   }
>   
> +static int da9063_restart_notify(struct notifier_block *this,
> +				 unsigned long mode, void *cmd)
> +{
> +	struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
> +
> +	regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> +	regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> +	regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> +
> +	return NOTIFY_DONE;
> +}
> +

Firstly, do you also need to force the AUTOBOOT (bit 3, CONTROL_C)
to ensure the PMIC does restart.

>   int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>   {
>   	int ret;
> @@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
>   		}
>   	}
>   
> +	da9063->restart_handler.notifier_call = da9063_restart_notify;
> +	da9063->restart_handler.priority = 128;
> +	ret = register_restart_handler(&da9063->restart_handler);
> +	if (ret) {
> +		dev_err(da9063->dev, "Failed to register restart handler\n");
> +		return ret;
> +	}
> +
> +	devm_add_action(da9063->dev,
> +			(void (*)(void *))unregister_restart_handler,
> +			&da9063->restart_handler);

there's devm_register_reboot_notifier()


> +
>   	return ret;
>   }
>   
> diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> index fa7a43f02f27..1b20c498e340 100644
> --- a/include/linux/mfd/da9063/core.h
> +++ b/include/linux/mfd/da9063/core.h
> @@ -85,6 +85,9 @@ struct da9063 {
>   	int		chip_irq;
>   	unsigned int	irq_base;
>   	struct regmap_irq_chip_data *regmap_irq;
> +
> +	/* Restart */
> +	struct notifier_block restart_handler;
>   };
>   
>   int da9063_device_init(struct da9063 *da9063, unsigned int irq);

Note, the watchdog driver for the DA9063 also has a restart method
although it also does not set the AUTOBOOT bit either.

The best thing is to enable the watchdog driver, the SiFive release
does not have either the core DA9063 or the watchdog driver for it
enabled.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
