Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948F7E8FDBE
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 23:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwgV3NjWUWbAt6g4+GnIV03JPcNJQlawGXeedsWf5RM=; b=vajq3Hwwj2/s08
	Wl6IIMFGwvqu92Mgrv4B3whiVZkMet5uolL7vBYT5/UtSkckC1vqBLjCcAbNpRH4ZHrVnpKasmAqc
	G2FDWh6NFFyyQnO/4lwlJH7VfwKrwGpG5Mnqs+K8udx/gpoFYOOwMmTuxc75/9KRCTs3XV1MRWZ67
	9jzC58Mbhvkou1BsVEoBdPBnC2CbsMrhBzGpkuEsgSPZnKkHO6IGjXq8t1kEtWeRytc2PZ83cQ69e
	I43ODCwkSJqJmo9WZJ9KO6EIEU0b4ogkSkGAl74/A5b1TW1DlZ76phMrH12KCx8r1e2/quo+ucgk8
	FE1i6jmrzxew1K95QXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va07i-0000000365M-1fJn;
	Sun, 28 Dec 2025 23:24:30 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va07e-0000000364b-3dxE
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 23:24:28 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4f1ab2ea5c1so120454701cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 28 Dec 2025 15:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766964265; x=1767569065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=hUiEOF18mz5bRxSrN4psmH9R1l04n3UpDfUbwhVv6P2Ndz/m3LpOzC/rC8ohXS9tpT
         Ieq6i/iwiKkBShOJUCa+q95Ai5NEyDuS1/5VdsADK3kW+xt8J5LJl3P8ZVYsevCK6KCp
         W41/wtp8PD6Arp5qRqeNZRpQusPX+ZsHQFukFZfnIp/hAqkTfapxsGC+PCRDNO0Zlx5H
         yd9BThn6+jwSWMD2vfdglNn0AXZu/Zn/2Km2hQMPVHqpsBAYU3BKOZlOyBRazZS49Uze
         4j8S6w5JYFJKY/d/31pw+HbZkNaNI6aKb4xwHn9sMt7KxgRs9zppSgzwe+bISSRWM27o
         DJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766964265; x=1767569065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xydt6mikMK7J/ACpt60zKlMdVmmHvuDTKG/LIZvEl0Q=;
        b=M1qRw0qDR3jPbTjE/EcYq6QyeX/GBJ+Eg83/IlFePXqpjFyMRfBA5gp6t1OYW2RDvC
         lgl3xlqQwfiiZXrG7ex6Wgo1PsMfD9Q3ccoggPmf/J8r77A1iLwtMTsx4UKCvsDHk4A0
         mhKavaSZizs7K9iDNDeKcBeN71T284+zGoBi1xBCowQQ68y8kCoD4cjGaLKuZBLv8xHz
         ZFpoafoENc8ppEH4mugYXVv/PVyKj5sZzVCKuBxahc+n1vjlvOWgHDf0PCnzgsiNssHR
         qq3c5R+0mWMRpOZhcZQjBXB9fzggSgIE229woysuSGn9Z3GTq6QUkBQSyFv8nSY22zK/
         ovEA==
X-Forwarded-Encrypted: i=1; AJvYcCVy2kCVfp6qkD0KfZJKTvSfaGp5giwZg71ec6LbSYaTs3M0stDmB3NNRNHqLUzi78m/jCQFim8DcFvbAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/r+cS2zTfjVzse9wThYh2bOsRO6k/x0YYSim13k+gf9hX7+jg
	Q2vKlaiJ7bShiq6FMlpKExzS666y0N2MGo6T3iFEOLEmwl+b594PyWVPMs7T3HePRf0=
X-Gm-Gg: AY/fxX7RKcU1FIVSRNf8HyuMMUWYI0tZtCGzCrRDJhTFNycEI8QxtWy/ofAHdkLHGJP
	tvBBmp+iKyhSXm2M0ehFbek4TfqltS6NlKbENEFBn3i51cTlYGW2Axl/JcIWSw6kTe81Hvg0qkj
	qAAvWQvll+db/gHtQbyEd1NOcLW1eBRXS72tlQHUBdrqfenoZvEwG7JHv6NBaeR/hvG9XXqSl1t
	OYqDQkxuQOB4ZuBTHbqP0wteigyzJj04zfLhVd6ZANDUjETBrJ3HS4zcnWnJGFxQvc0yUUiICMP
	V8ZcRY32RYPH3Inwud0SbIJ36H9ru66/QBMQAsfECYAozx1jK0F8bTCmPaqk36kJY0QNRz7SBl2
	MOjqAw3kNxn+JiIyZgXxoxGc/DrFm9CcdptNLvzCCVA6VjjG05bbffNLCFwt9I1uC1FxvVw3clv
	1JXtlEfRptii5zZVXosdgTVm068sOBglGAX43i4cqvlX5zz1uTAUA=
X-Google-Smtp-Source: AGHT+IFxndCaQ3g5mQEld9CJ+Zg2xTQQHo+r3w56Ps2u11p4W4wTawdR8ANKUOQfAZjJSvAqZ/++TQ==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr169416911cf.75.1766964264478;
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac64c011sm207819451cf.25.2025.12.28.15.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 15:24:24 -0800 (PST)
Message-ID: <bb6665f2-e4c5-455c-b6d0-9acf41aa9e30@riscstar.com>
Date: Sun, 28 Dec 2025 17:24:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] i2c: spacemit: replace i2c_xfer_msg()
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20251226-k1-i2c-atomic-v5-0-023c798c5523@linux.spacemit.com>
 <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251226-k1-i2c-atomic-v5-1-023c798c5523@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_152427_165819_0F9D0B6F 
X-CRM114-Status: GOOD (  18.31  )
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

On 12/25/25 9:31 PM, Troy Mitchell wrote:
> The upcoming PIO support requires a wait_pio_xfer() helper, which is
> invoked from xfer_msg().
> 
> Since wait_pio_xfer() depends on err_check(), move the definition of
> xfer_msg() after err_check() to avoid a forward declaration of
> err_check().
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Other than fixing "replace" with "move" as Andi mentioned,
this looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/i2c/busses/i2c-k1.c | 62 ++++++++++++++++++++++-----------------------
>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index d42c03ef5db5984ea8e06b3d7eb485b4f899e616..accef6653b56bd3505770328af17e441fad613a7 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -304,37 +304,6 @@ static void spacemit_i2c_start(struct spacemit_i2c_dev *i2c)
>   	writel(val, i2c->base + SPACEMIT_ICR);
>   }
>   
> -static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> -{
> -	unsigned long time_left;
> -	struct i2c_msg *msg;
> -
> -	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> -		msg = &i2c->msgs[i2c->msg_idx];
> -		i2c->msg_buf = msg->buf;
> -		i2c->unprocessed = msg->len;
> -		i2c->status = 0;
> -
> -		reinit_completion(&i2c->complete);
> -
> -		spacemit_i2c_start(i2c);
> -
> -		time_left = wait_for_completion_timeout(&i2c->complete,
> -							i2c->adapt.timeout);
> -		if (!time_left) {
> -			dev_err(i2c->dev, "msg completion timeout\n");
> -			spacemit_i2c_conditionally_reset_bus(i2c);
> -			spacemit_i2c_reset(i2c);
> -			return -ETIMEDOUT;
> -		}
> -
> -		if (i2c->status & SPACEMIT_SR_ERR)
> -			return spacemit_i2c_handle_err(i2c);
> -	}
> -
> -	return 0;
> -}
> -
>   static bool spacemit_i2c_is_last_msg(struct spacemit_i2c_dev *i2c)
>   {
>   	if (i2c->msg_idx != i2c->msg_num - 1)
> @@ -418,6 +387,37 @@ static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>   	complete(&i2c->complete);
>   }
>   
> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
> +{
> +	unsigned long time_left;
> +	struct i2c_msg *msg;
> +
> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
> +		msg = &i2c->msgs[i2c->msg_idx];
> +		i2c->msg_buf = msg->buf;
> +		i2c->unprocessed = msg->len;
> +		i2c->status = 0;
> +
> +		reinit_completion(&i2c->complete);
> +
> +		spacemit_i2c_start(i2c);
> +
> +		time_left = wait_for_completion_timeout(&i2c->complete,
> +							i2c->adapt.timeout);
> +		if (!time_left) {
> +			dev_err(i2c->dev, "msg completion timeout\n");
> +			spacemit_i2c_conditionally_reset_bus(i2c);
> +			spacemit_i2c_reset(i2c);
> +			return -ETIMEDOUT;
> +		}
> +
> +		if (i2c->status & SPACEMIT_SR_ERR)
> +			return spacemit_i2c_handle_err(i2c);
> +	}
> +
> +	return 0;
> +}
> +
>   static irqreturn_t spacemit_i2c_irq_handler(int irq, void *devid)
>   {
>   	struct spacemit_i2c_dev *i2c = devid;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
