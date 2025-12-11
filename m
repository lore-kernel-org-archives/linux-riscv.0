Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF216D3E79D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Dec 2025 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bzaqnQiEwVMuHVDUz6vb+EQEp05BDO1HrZACFuoUw8Q=; b=RVX4W7niE6NDJT
	pqxF52COxs2JeoA86eLwPSuKli4MK2/dieSFN31uuw5ewvCqTxOd9k3qGL8EiGwiX7j2VLLQKBTui
	LVwTsL8VQSAZt3AaWTyGZhigjOed31z+hvRvZuLfgUVs/LEgjpW1lfe7kFFG9zntPIHAsnoh/Tq5f
	+VLcIejmjA2t4R5Ep5fM238UyqM6yYbWm4howd/jmfv6SKlel49D4TPvRGVDJlxGDMT8nxxZw2g+u
	iJMRdxf5+4j2guiVwCPGFQPXcGqJOKy6SpQl0ejP4K9bJ+YiKIfcqsrrJGvOhAVrHuBzzzc/nc+6y
	mTKc5b4L8VwcdCf8Fm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbDF-0000000GKhs-0h4C;
	Thu, 11 Dec 2025 07:35:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbDC-0000000GKhB-3CCy
	for linux-riscv@lists.infradead.org;
	Thu, 11 Dec 2025 07:35:44 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso487453b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 23:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765438541; x=1766043341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=mnlldDPuEU5Rl6vsOyT/JgCeujfh6bq6AoTktYhKm5eggKiBEIDU/kPSxYUIA55DgQ
         5fWK25/WYHUaJJmWmi1EOD3R/N4rEq/8OzEPJoM+au73A36br5cCOID/vN1eFowoqC/M
         traKwSRiwF8OqgrkC5cUezywN3NjjeVpeqknAHJNs/E2G7LLuBkCv3PylTVkFy1rveBg
         bBPGYR/KEtQo4nXnLiXootDeDFJ/qFwNqKS6oQIcyc0AVaLEZehJClRZtmI0q5wRgy7r
         qS2R+QijlgXnQJhDgh8BqjkNhPcofYXh+iAOJrC94FoxLmb9n+E8hkhcltdx8nztftqk
         Qx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438541; x=1766043341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5cRIyUToWBqfDVg5RwgWa/mJtHaJ3ZD2Xr1P/TceRSA=;
        b=t7v6MH0c7c38eUEODPbm0jvxC9mWyCzqMlNiFuQ4T3e94AFf4wtucR9mQ0aD1QSJd+
         0DAotJn2q6megVbhKKGnjW4kcOsSsu/iYRS0kA4Na5CEqC0dgORRrVkH2wqYYUznESMj
         ZNPOTLspu6C18+Kf2mxErCeXvC5leOJ8YqI17Vf9YfxhBA3wT8xg8/oGE4wVJuSn5kYy
         jo8/dNdXSgvnEyX2MpPmcQsFvNVHoGDrWyklKluetK01eeIC3uIf2UvBUYbiXwtc37K5
         x22wQMxGwWapwBHCfRLmQrOoB97SF1R/wtU0h3hJlLllVADoWnV69uhnLXZcKNLrI/Db
         9YSw==
X-Forwarded-Encrypted: i=1; AJvYcCWtWiQwa6neHylvkmpemFWFQIa/Y2W4jbQ3Wi+rE7ZRI6eMA/DHDi6WTn34Ptio8ggrQiIFHM1xq9GQVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6kQCIREyJyjymjlZHJhp0sedEMbYobMYeyB32uLvo6+9tR957
	hx/VNiqaR1QnvuDcVjZ2XujL4rR4ZycjDnOCbkznN0az4EA7kLDu6Jjdck8R6svuD5o=
X-Gm-Gg: AY/fxX6Cj94YrtUJoyXvmWRJQSFZ5uKpas403Ai2XVJxiy89tPlHE+qYAWoPASa7bTI
	G0p6lraVS4xcCK5m8HwX/ey7+yovZU3DcOuM9O9HNE3swNQ52o4nFt0SqsgQVCkk0R6rprd/7/4
	nNSb+3gEh6GotGWYqBWgDQRkP5gnpklwGvk+nQ4eM8ZxRh55k0++X194e6F3vTyl4eMNWDcChO2
	MjEtvrt8zSU2nM6gHzvyIGbCqog8lZJDduiza9TFjfQ3oiFm3iUY94ofkOBElfwg7+YPn5WA0lL
	059eaKhWuCjWu5L1v0kTBHrdhH0df7ZkvrTtt5VMiJjbKVAP7I8K/fEd0CuyYwN2qZalp1LGS66
	KB1HohX1NUkgzKZFYTtVYynd5EzMuC8TaV4f8Ovox2SWiSbvlwns7yX1lct+LISFX3sVOgBB9RV
	4u95PVuE51nbqK3RKqtxkPANYv4khzY2aBqPv6kTTK4EDc4cE=
X-Google-Smtp-Source: AGHT+IGoUuUHw4G8GEx6LIfCNmK4Wz0P7Vv4+W+//KXKrKQNRYKoJQHJnPyRAtlt73kARbQ3vU0CQQ==
X-Received: by 2002:a05:6a21:3086:b0:366:58cc:b74b with SMTP id adf61e73a8af0-366e07dae21mr5212459637.21.1765438541298;
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Received: from localhost.localdomain ([2a12:a304:100::202f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a9277e13dsm392594a91.5.2025.12.10.23.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 23:35:40 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: Re: [PATCH 2/3] i2c: k1: add reset support
Date: Thu, 11 Dec 2025 15:35:26 +0800
Message-ID: <20251211073526.3164875-1-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
References: <20251119-i2c-k1_reset-support-v1-2-0e9e82bf9b65@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_233543_037868_3C5A34F0 
X-CRM114-Status: GOOD (  19.05  )
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

On Wed, Nov 19, 2025 at 07:46:44PM +0800, Encrow Thorne wrote:
> Add reset control handling to the K1 I2C driver.
>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> ---
>  drivers/i2c/busses/i2c-k1.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
> index 6b918770e612..64d817d8315d 100644
> --- a/drivers/i2c/busses/i2c-k1.c
> +++ b/drivers/i2c/busses/i2c-k1.c
> @@ -10,6 +10,7 @@
>   #include <linux/module.h>
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
> + #include <linux/reset.h>
>
>  /* spacemit i2c registers */
>  #define SPACEMIT_ICR		 0x0		/* Control register */
> @@ -113,6 +114,7 @@ struct spacemit_i2c_dev {
>  	void __iomem *base;
>  	int irq;
>  	u32 clock_freq;
> +	struct reset_control *resets;

Thanks for the patch! A few suggestions to simplify this:

The reset_control structure doesn't need to be stored in the device
struct since the devm API automatically manages the resource lifecycle.

>
>  	struct i2c_msg *msgs;
>  	u32 msg_num;
> @@ -571,6 +573,15 @@ static int spacemit_i2c_probe(struct platform_device *pdev)

Please use a local variable in the probe function instead:

       struct reset_control *rst;

>  	if (IS_ERR(clk))
>  		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable bus clock");
>
> +	i2c->resets = devm_reset_control_get_optional(dev, NULL);

There is a new API, I would suggest this:
       rst = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);


> +	if (IS_ERR(i2c->resets))
> +		return dev_err_probe(dev, PTR_ERR(i2c->resets),
> +				    "failed to get reset\n");
> +
> +	reset_control_assert(i2c->resets);
> +	udelay(2);
> +	reset_control_deassert(i2c->resets);
> +

Why you need to call assert() then deassert()?
Wouldn't the single API fit?

Best regards,
Guodong

>  	spacemit_i2c_reset(i2c);
>
>  	i2c_set_adapdata(&i2c->adapt, i2c);
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
