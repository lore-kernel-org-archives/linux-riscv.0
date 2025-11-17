Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D941CEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPa/vMSpL1TA5qO3CZ6A6i4t7g43x3L/s2Gw8fNSjVU=; b=IGCSWif5xP87Ah
	QlJoS5w0YHMjp/kL0VxClDmH+bJnQSHWCRyaOK3IJW7nQxo48NEuRC+HSK/kWKiyVftighUMkhbsi
	mLbYc23xH589RkRwNUpM2OxhvylNxoD6eaHHxRUeZAszRUQF+wBMwfQGnR8YKVrE65qkLYOg0I6WW
	WjXfhB1okAsj13d4L37JRvx7K5smcfdTjSZk3Jyb9DsnoTRdi6I2RBpzFeqh70RzV6SpFx3XkVG53
	33HoWwnM+7XRoJptDQYAQMDM/zgzrSGniYSTd1dCmGCnviki+f0/UQKJZ6xKTqg8XIHHU5RA52sqa
	u9ppct6QWTeuJWvypi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fe-0000000Gidl-28mM;
	Mon, 17 Nov 2025 19:13:50 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL4fb-0000000GiZ0-17F4
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 19:13:48 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-948c58fe8c2so192469939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 11:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763406826; x=1764011626; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WbpLosukaGmb6Q4C8J4C0DP31/eNIGANA8ASBPiU4u4=;
        b=A+Xeibk8u7udGBRfsvqzyIL9YqmjpOW6iw+HH/ozKGMa9ALhAd7eS50yaIhhSSXi8w
         PrPfYpUl9MlGRej+X994y8fjI1O7r1mcdQsXHzrJBt+KprXCBgflapUJbuGuWGaHcCka
         rgnzmPkLaYgRVG8aOkFWKdhYKR4WL2lUNQl3dPt9voJ5+6gCGM1FsScUsLivWIE/nytC
         3T2XMgIOKic5dABteg+/C3idjQU/6fSNhjnyHtROTAatyg8npDjLtbKTsLVrx7XlL04S
         l6FKG9QSPHAhRaFP0P4AA+YdYx5DX+DBzyyCn7ZKQh01QE6XSiPb8pjxB2roQIMVT8c3
         tyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406826; x=1764011626;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbpLosukaGmb6Q4C8J4C0DP31/eNIGANA8ASBPiU4u4=;
        b=WViY1awNb2D/bO3kRXA7pvCnFmAlcgo/+HDOlOH79JQ1YvG8JD248w+liwum80PGyK
         uETgXa6bMlJpfaYQcqY88PqEpy30AmbCSZG9Zs7ABild60yBsye0efYKDfTEWOMW0Crk
         CvmwvDI7S3R/b+zYC+wuEBIm7mnYYEHD/3TfqqDb0gjpsiGpPSD6vPoBemLSN8ggYXL5
         oUWZl04MURacam/SMsxVl0FKsDPvR0W/5MuSji6EbI9AYDbz0yUNKgPIUusbRLMY7SrU
         q0RLrEvj8CZAYlfA25GnkEzDHfX81EqxeKbwDvsitMZgubrKFlugb/vEUTt92pglTLqU
         AnGg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Em6A9HJtWilFiW6JgBcz851oVwr8eQ2sFx808l7UdAJMbPnL/tZeXft1BIPUhhtUje81nqb+LPDZjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzric76ZBTtSOX6ejH8UE9/YP2X2GMWX2ObsDS+A7c956Jea7W4
	exDidizUZ8vkcNRa4DOeSdkQHn/UuWZkPWojG6d5dtl9rivqlnjSj+YZfAbfqNrJWmk=
X-Gm-Gg: ASbGncvOejS0qdobbF80lm2PwW7122tyRRnCw5INqw/TEgL5QyGKPVE4EoheD343Xgz
	7RApMt9PAyzLmOZFK775YDhEfJCFDoaU1sgpgkh1N6OQn/z2Jqu4HidIp4BDmNY73Mhy/7kuSrK
	G/pyq2qHeouKVwvu4Qj34/K1Ao9ydx3pYDJmubTvpW2HRk4DUl+JwCp1FIVcZhBchonYUe2zf0J
	meuaKsZd0ZViw7dgAbSW8OycviDPGiupxyyQ/W3ggFLsehYc9q+PNtkgcvRFFY3oEgGv8Um91Vh
	UYgxYxn6pjpuXuLinPRP3OMvmXERuVrQPTM29X8ofJUVBGs53XoLlyQ7AQ/3glGiRfNiQBgJ/2J
	0+LZp7r0tea09M/LlL0Csmknc/bxDSQoNqsLbKd4gYuIq3tOulo0oAAbY+VfRiLknNnSqk8Rfca
	5NzUGzFYqchUS5jeYWnRkGzJmXy86HrjmDnwpZr5N9NRNtzp/wBWgJiIuKw0kH
X-Google-Smtp-Source: AGHT+IH8eFCp4A760FkF3tQiu/jqIcK+hIc5E/QznWtjRo4yEGgDGtrgNoK16294y1YPQeLGg93T3g==
X-Received: by 2002:a05:6638:6401:b0:5b7:d710:6626 with SMTP id 8926c6da1cb9f-5b7d7106756mr8951851173.21.1763406826144;
        Mon, 17 Nov 2025 11:13:46 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd26fdfdsm5209811173.18.2025.11.17.11.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 11:13:45 -0800 (PST)
Message-ID: <d74628b6-9441-4853-9c47-6fffe8d654e6@riscstar.com>
Date: Mon, 17 Nov 2025 13:13:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix UBSAN warning during probe
To: Charles Mirabile <cmirabil@redhat.com>, linux-kernel@vger.kernel.org
Cc: spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 dlan@gentoo.org, heylenay@4d2.org, troy.mitchell@linux.spacemit.com,
 inochiama@outlook.com, Yanko Kaneti <yaneti@declera.com>
References: <20251117190329.1337250-1-cmirabil@redhat.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251117190329.1337250-1-cmirabil@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_111347_472575_EFCBDA2F 
X-CRM114-Status: GOOD (  21.97  )
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

On 11/17/25 1:03 PM, Charles Mirabile wrote:
> When booting with KASAN enabled the following splat is encountered during
> probe of the k1 clock driver:
> 
> UBSAN: array-index-out-of-bounds in drivers/clk/spacemit/ccu-k1.c:1044:16
> index 0 is out of range for type 'clk_hw *[*]'
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc5+ #1 PREEMPT(lazy)
> Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2022.10spacemit 10/01/2022
> Call Trace:
> [<ffffffff8002b628>] dump_backtrace+0x28/0x38
> [<ffffffff800027d2>] show_stack+0x3a/0x50
> [<ffffffff800220c2>] dump_stack_lvl+0x5a/0x80
> [<ffffffff80022100>] dump_stack+0x18/0x20
> [<ffffffff800164b8>] ubsan_epilogue+0x10/0x48
> [<ffffffff8099034e>] __ubsan_handle_out_of_bounds+0xa6/0xa8
> [<ffffffff80acbfa6>] k1_ccu_probe+0x37e/0x420
> [<ffffffff80b79e6e>] platform_probe+0x56/0x98
> [<ffffffff80b76a7e>] really_probe+0x9e/0x350
> [<ffffffff80b76db0>] __driver_probe_device+0x80/0x138
> [<ffffffff80b76f52>] driver_probe_device+0x3a/0xd0
> [<ffffffff80b771c4>] __driver_attach+0xac/0x1b8
> [<ffffffff80b742fc>] bus_for_each_dev+0x6c/0xc8
> [<ffffffff80b76296>] driver_attach+0x26/0x38
> [<ffffffff80b759ae>] bus_add_driver+0x13e/0x268
> [<ffffffff80b7836a>] driver_register+0x52/0x100
> [<ffffffff80b79a78>] __platform_driver_register+0x28/0x38
> [<ffffffff814585da>] k1_ccu_driver_init+0x22/0x38
> [<ffffffff80023a8a>] do_one_initcall+0x62/0x2a0
> [<ffffffff81401c60>] do_initcalls+0x170/0x1a8
> [<ffffffff81401e7a>] kernel_init_freeable+0x16a/0x1e0
> [<ffffffff811f7534>] kernel_init+0x2c/0x180
> [<ffffffff80025f56>] ret_from_fork_kernel+0x16/0x1d8
> [<ffffffff81205336>] ret_from_fork_kernel_asm+0x16/0x18
> ---[ end trace ]---
> 
> This is bogus and is simply a result of KASAN consulting the `.num` member
> of the struct for bounds information (as it should due to `__counted_by`)
> and finding 0 set by kzalloc because it has not been initialized before
> the loop that fills in the array. The easy fix is to just move the line
> that sets `num` to before the loop that fills the array so that KASAN has
> the information it needs to accurately conclude that the access is valid.
> 
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Tested-by: Yanko Kaneti <yaneti@declera.com>
> 
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>

Looks good to me.  I haven't used UBSAN but the report is clearly
complaining about exactly what you describe.  Your fix seems like
exactly the right thing to do.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index f5a9fe6ba1859..4761bc1e3b6e6 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -1018,6 +1018,8 @@ static int spacemit_ccu_register(struct device *dev,
>   	if (!clk_data)
>   		return -ENOMEM;
>   
> +	clk_data->num = data->num;
> +
>   	for (i = 0; i < data->num; i++) {
>   		struct clk_hw *hw = data->hws[i];
>   		struct ccu_common *common;
> @@ -1044,8 +1046,6 @@ static int spacemit_ccu_register(struct device *dev,
>   		clk_data->hws[i] = hw;
>   	}
>   
> -	clk_data->num = data->num;
> -
>   	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
>   	if (ret)
>   		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
> 
> base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
