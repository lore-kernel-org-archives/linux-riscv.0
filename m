Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B522C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMgo2M+i9RgThn08KXiyxlvqpKfrFsuMl7GJBz3JR2k=; b=UbHaLsVd7m0oyf
	365B+9nx3Vvym9BYXu6YiFZ7VODWBpZFsNF6Hf5Sym6U0OkFMh6n8phoQr5aeWB9VOknZEtOda/Jd
	eSlFTa3m001qQbAqUaNrkgx9ZxMS+PKecLAsB+jvBh89TPSluLrDjGswAa7zAO16WKSLYzkxbhfWd
	SXKegHkBsc/HuUgjQMo8bL65VeTGSD1oUrC3rvKMXWWAwnVZ1wdmGtfuZD63VEGEmG69CQYV+WTTj
	ClqHE3B8Sl2RtRREyR+RTKj9AETp6H3LEnLGVC3BRotilSl595Zpc81+pDBkV5dDXx0t4CxgwSRxT
	yxeLjeZ7iCGSyvKC9HPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOit5-000000058hF-0TKT;
	Mon, 09 Jun 2025 20:14:31 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOit2-000000058gi-32yO
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 20:14:30 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6faf66905baso72778756d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749500068; x=1750104868; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=rfumsMdLwV5MwMObgkt0RjUOaMFEhA5t3vBernrgMtDONlomn52kDjyi05P7cm4dIg
         yUo7zUuX+lPeMKRk/Z4Km5z5pg5IhhPMsHXD+txLM8QYhr+mRzlf3peEFcZK2oncDczQ
         vNpQtFLbz59SttWyli4ruI1tib9Er7NQ7LHgKEAfv4VLmWQYU11addhPJ8wwrEbWIKK4
         0etGb941wZDPnl/SdrfcptAULD2d47tdb5L5h+vOhG66lygAthB1vtuoPPlTUSvTtXn8
         ywPF3UsYA139/Wb28sSXLG8LzjwIvDSPQrXdhkAocOPYrjE+206S+Pjimash6c5x+LYT
         11/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749500068; x=1750104868;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFj+rnVnwrli61+RW3pW0hp2hmvQPvdmAdNSR40r1ZE=;
        b=LXzmfj+hr/4Ck4swLH22j6wDJEsi3DCEHEiIvjH+oCU5LkRrnFNMOwibiNqerH1ogH
         c/JRZaoL57s0qnjJad0G+cS25K9ys8uN/GjaNNF6mf6Z9QvaJaXLqu9hBKI3OxEIf4s0
         CJ7qgdSRrpKjQulXxakLXt1jnx+M1bRMWeb7uatNJ8F/8Av1WroFm4hmKO+UVW4JV+C7
         iXX6kYEptcuW4tb7Dp+OPldvyip/N3RaWC6ojpUNtyqPW5jz5///vkfVF2IdWZQSrYYD
         FMjI6+fLDfDVZ4UWMbl9XYBuXtf5g+fYCGAvn2v+snfhmBl9LvI12tfPutKGh6h9gTUu
         EZRA==
X-Forwarded-Encrypted: i=1; AJvYcCVcIMJAWfjIvGrRsuJKA60cNULEXktEda7BpyXneleGBLSLw7h4uedadS6IWmbKps1D9TQWHr+nYFWLGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxManG7XKFkDGoQ2PJI7yEi8+ohUIwPBNkqn3KC/rYXNkqTRYPl
	j50/TkoebBlGTy5iw0yTIVoBhqcujvHUf8EJf7vmpWG5DwrceCDQcCrl5fJOqn8UhfI=
X-Gm-Gg: ASbGncuqdSW5Uv+QdQ/Iq1P1OkLe22giQYO6O++m510PryxTNHtft8rTdkadweZXY73
	le2w0aZqyWxwXyBBHdfjntR8DiQaQLHGqm1DNWzrEIV5smokrydEjAhSq/+XjNOBLg3bboEqnFO
	UYNaPIBk+LUIOu/9wv4z8qupC7Y2C66ft+XPqeWYWM0C3AfiL8yNgZwx+7bbZolmh/R9QMTwgYa
	ASI7q0r7OswMoSvrBMmzHeBNBdl2r2z7q8q8yJqOT66ojsmKSHp1MnBE2ZlM9wITvxrh46rEwrJ
	T311HQf77EIzciuPs/HoQbPZlEZJS5Jjmjhab1elXBUrz8l4w1Qz7kpNXELrA1Xbw/Bro/R52wj
	9hdeQO4LnpXtXmf7wajTCzvzcDjRs/0og+2dR
X-Google-Smtp-Source: AGHT+IEoxsMyfv1zl4Eq2z6OuyNYN5zJiRV3axkBglw2RaCBqnFhaHAJb4H6tYu0A3sn+TFxdgVaMQ==
X-Received: by 2002:a05:6214:1256:b0:6fb:14:5e89 with SMTP id 6a1803df08f44-6fb08fe7f6fmr255840366d6.19.1749500067642;
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac8415sm56510096d6.27.2025.06.09.13.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 13:14:27 -0700 (PDT)
Message-ID: <17a7ab55-aa1a-4d1d-b8f6-27bbe51fe761@riscstar.com>
Date: Mon, 9 Jun 2025 15:14:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guodong Xu <guodong@riscstar.com>
References: <20250609200822.468482-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250609200822.468482-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_131428_771421_A1D0A783 
X-CRM114-Status: GOOD (  18.00  )
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

On 6/9/25 3:08 PM, Alex Elder wrote:
> The pll1_d8 clock is enabled by the boot loader, and is ultimately a
> parent for numerous clocks, including those used by APB and AXI buses.
> Guodong Xu discovered that this clock got disabled while responding to
> getting -EPROBE_DEFER when requesting a reset controller.
> 
> The needed clock (CLK_DMA, along with its parents) had already been
> enabled.  To respond to the probe deferral return, the CLK_DMA clock
> was disabled, and this led to parent clocks also reducing their enable
> count.  When the enable count for pll1_d8 was decremented it became 0,
> which caused it to be disabled.  This led to a system hang.
> 
> Marking that clock critical resolves this by preventing it from being
> disabled.
> 
> Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
> be supplied for a CCU_FACTOR_GATE clock.
> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>

I'm very sorry, this path is v2 and I neglected to indicate that
in the subject line.  Here is v1:
   https://lore.kernel.org/lkml/20250607202759.4180579-1-elder@riscstar.com/

					-Alex
> ---
> v2: Reworded the description to provide better detail
> 
>   drivers/clk/spacemit/ccu-k1.c  |  3 ++-
>   drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
>   2 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cdde37a052353..df65009a07bb1 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
>   CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
> -CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
> +CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
> +		CLK_IS_CRITICAL);
>   CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
>   CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
> diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
> index 51d19f5d6aacb..668c8139339e1 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +struct ccu_mix _name = {							\
> +	.gate	= CCU_GATE_INIT(_mask_gate),					\
> +	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> +	.common = {								\
> +		.reg_ctrl	= _reg_ctrl,					\
> +		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
> +	}									\
> +}
> +
>   #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
>   			       _mul)						\
> -static struct ccu_mix _name = {							\
> -	.gate	= CCU_GATE_INIT(_mask_gate),					\
> -	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
> -	.common = {								\
> -		.reg_ctrl	= _reg_ctrl,					\
> -		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
> -	}									\
> -}
> +	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, 0)
>   
>   #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
>   			    _mask_gate, _flags)					\
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
