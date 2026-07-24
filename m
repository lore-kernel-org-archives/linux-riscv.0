Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBE3C531C9
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ddng9VIoTXUSlwzFtb/xPwTI2Gqu5EcZyHYJZmJAC7w=; b=MT43TIb4Q4IOdM
	frWybJ5EzkjgmJZXxwHTwwa+y2niYvDZV7yUAIUm/IkWJMkgcJK51Sg2CB5DwcuWsOE+9Q5HwPmZ9
	kNFCNQ1BlLXB0mBNIYmOiV8tEKRDPAyvfyCfJNsFru+6Szd7VboX4sew5vNJsxIoPRy7z3vjlaM3t
	GzT0OpRy7Vc2FtdQok7JrFSmEUZeho6ISMDTs+2LkSm6B01tUjIOrvWCFimoqg5XFtiHZDZ0eDhDh
	3ks6viQ4m+DJecMnihAEQE9BHUfs6NXo9A1Z0LKjYvxbIqHqGRAyTLrzpCbfqeoTIABHckPiHad9u
	7cE2ndIjy4LBoyQ2fdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG0j-0000000GTpd-14JP;
	Fri, 24 Jul 2026 13:32:21 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnG0g-0000000GTp9-1Ck1
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 13:32:19 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c15bf5000so2688071cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1784899936; x=1785504736; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkOeO7FvZNYqVYKq41a3VAqmcoUNFjFQHw8ZY64/eu8=;
        b=qo2c4hXNT3HrHhnjZJ8w/Mr9Cu8TIRXrKzoF8i31H9TTrEdf27JCkhEV6deL/znVhg
         MqSYHkTRaxMrB5MnLwOqwBR4baPrQ16qlmaNTpAHQZfRCvr0fkIf/8+N9S8Oqwk+jabg
         5hK4k/JfaLHXYiXXTRmm4+l+WerGz92chk2Yql4byGdgpQ1VPm6DlL4gfyIv7slAUjVt
         HJyzZs1ByzQvhQkj4oV3E6ukJ6k914oSNnOn/5dvNh+Ft3MM+FNamvKQVJu2OXAxMO6A
         P7I7fvN2V4mJCuYZleOIiHBEA0/0ZJcrVJjkIwPdjvVR5vjLQpJKoQ+ScbUXOjF6EQAS
         /+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784899936; x=1785504736;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkOeO7FvZNYqVYKq41a3VAqmcoUNFjFQHw8ZY64/eu8=;
        b=sK+j2Luf2k3Otqbcru6+Swx2Y+mESN4ZYYLa7a3lho01JcRkVsqj4dvdRyoBjyQ5I5
         mRg7uwB3UDy0g8MYEDzBw0G0uawYjOdPzKsEWb74HQFgsZ7gvnbTUFvBhT+J+9nxbwga
         vVaSt/gFXdxDX62dWWwB5NDTb3LUc0gV71wzNWobdzGb4iqWM+LTBIwrpuR3mkP2H6Co
         OweCBxw2v1p6kTzMU2YGSzFXZmgjLVJ3Tg3F0nr6vp1uT9j6mDf1+79A9FA5JsdpKj0b
         vwixr86jv+Ba5d4tnBSxINDNN4wMrgz0PxGTCgbXLBDKUuZd8s5snDJXHa10OjF3You9
         MY4w==
X-Forwarded-Encrypted: i=1; AHgh+Rp7MrBvMrSKgXbKXxcA2kvHJuzmVnvR0jUQhpca+Yi6fF0lezYy73STB9i1vR3bmOAseNhhULNtlmJB7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwUFKFXmDWBE1feWftqQr2fE1190LfrmoqkBtEEwIIwHR1mZAO
	V3ND/+13B8cYdUmOmy6BwgkSHI/qrYopHXmUwUTQqf1M2VaztQ6UpqVdysf0shTK7yG6/XVm5EI
	N8GEv2KM=
X-Gm-Gg: AR+sD11OgkgSDATp5T0Pm/9xvhRDWNIFDM27lXjMt7PW11JpoQdZ7AvbS1niSx6O1e0
	NMDIZvppAMzIbEV/u/pqit+QILb9TNT3tFZTe3RzwF7ijo1bl1oOvM9Ity6/aaLfAKntOk9Zk/f
	hJ8WeHj7gIyNcxNK54L3AE9tW9OWYlmQN5eLEoe4ibJMgjQUFoLSth9P2+gQUXu/Iq9gutCYNOd
	gCitwTlWdOp+92VH+HSeQmaVgioW+BsWNuYbYKZosOsWMlksKEmVsMpRwefqKuf5tS0qZnWX3Ji
	AIMUl1TVH64W8F4+bpYLaxub2Sl7ca6y3NZxznAYuvIlInEKVSbBnw8VRQdHUwwjwivl67hPcdz
	N3bSu5q87M/vwIZfUYjD93gxOOBcaO6Umng782eTkd4pQPW1mco0OXDtxUCO2WgbCC0+pfGRfc7
	N+aQ==
X-Received: by 2002:a05:622a:8c:b0:51c:db4:3cb2 with SMTP id d75a77b69052e-5283df63187mr68450411cf.63.1784899936358;
        Fri, 24 Jul 2026 06:32:16 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d0c4fe92sm53114091cf.11.2026.07.24.06.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 06:32:15 -0700 (PDT)
Message-ID: <39995013-3520-4290-a791-1f5d6a25388c@riscstar.com>
Date: Fri, 24 Jul 2026 08:32:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: spacemit: handle regmap_test_bits() error return
To: kr494167@gmail.com, alexandre.belloni@bootlin.com, dlan@kernel.org
Cc: linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260724024220.10113-1-kr494167@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260724024220.10113-1-kr494167@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_063218_596485_163F26FD 
X-CRM114-Status: GOOD (  21.37  )
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

On 7/23/26 9:42 PM, kr494167@gmail.com wrote:
> From: Surendra Singh Chouhan <kr494167@gmail.com>
> 
> p1_rtc_read_time() called if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> to check if the RTC was enabled.
> 
> regmap_test_bits() returns 1 if the bit is set, 0 if not set, and a
> negative error code (e.g. -EIO) if reading the control register fails.
> Using !regmap_test_bits(...) evaluates a negative error code as boolean
> false, causing I2C/regmap read failures to be ignored and incorrectly
> proceeding to read time registers from a failing device.
> 
> Fix this by capturing the return value of regmap_test_bits() and returning
> the error code if negative, or -EINVAL if the RTC is disabled.
> 
> Fixes: a6de182daa2b ("rtc: spacemit: support the SpacemiT P1 RTC")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>

This is an I2C-based regmap, so yes, we do need to test
for errors when reading or writing registers.

I think this is a good fix.  I have a minor suggestion or
two below but either way:

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/rtc/rtc-spacemit-p1.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-spacemit-p1.c b/drivers/rtc/rtc-spacemit-p1.c
> index 43ab62494bb4..c1820c920ba3 100644
> --- a/drivers/rtc/rtc-spacemit-p1.c
> +++ b/drivers/rtc/rtc-spacemit-p1.c
> @@ -57,8 +57,9 @@ static int p1_rtc_read_time(struct device *dev, struct rtc_time *t)
>   	u8 time[6];
>   	int ret;
>   
> -	if (!regmap_test_bits(regmap, RTC_CTRL, RTC_EN))
> -		return -EINVAL;		/* RTC is disabled */
> +	ret = regmap_test_bits(regmap, RTC_CTRL, RTC_EN);
> +	if (ret <= 0)
> +		return ret ? ret : -EINVAL;	/* RTC is disabled or error */

Since regmap_test_bits() can return -EINVAL, I wonder if a
different error code would be better to indicate "disabled".
It can return -EBUSY and -EIO too, as well as anything any
regmap->reg_read() can return.  Scanning through the list of
basic error codes I don't have a good suggestion, unfortunately.

Otherwise, perhaps just:

		return ret ? : -EINVAL;  /* comment if you like */

>   
>   	ret = regmap_bulk_read(regmap, RTC_TIME, time, sizeof(time));
>   	if (ret)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
