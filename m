Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8CDC83F12
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4XTzedCPPF6vRWdh9feIMgfUrZuClcLzH7fiw/o1uHc=; b=z6VTdjPJun6Pzn
	LL8SPyDbyb/+MsNBD24av6ISwj/0Rhkd0OHynikctgty4awCyQkB1JNi36eVwDqim3wbk64nOzMK6
	LKZd3qNo2RyzlPXvheUZWqP2Toi5dVGHvCSkwTdCOVuhIcb6r2TpfgbZjKYmD4x474LVCqd1sgY5m
	N8NmI3ukxLG9WZgkdJUXDyq1U9+hZVNBD1rGWQ0o9ikX36bWQZWN7/A4DmEtt11CZ9PRq93BpXB0W
	TN2iCu8KdrAEGZxU+nmBS8irAn9VQBjAeq3zUItBBllPqnS4Ch/0tLlu/xPJJTUoLivl5IiHVUWoG
	aCjQQPkoPuaCKkM3xw3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRq-00000002TLv-3zFf;
	Mon, 07 Jul 2025 12:59:54 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYkp1-00000002Oyd-3kdZ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 12:19:49 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3df2f20f4bbso11154565ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 05:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751890786; x=1752495586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=Qrym/E0sTwn5x8904v+9VtLiykgR0smIVUx5QmfteCgtfdA1qYstyfw8yyYN6qZ8+T
         aU/x13cuXNvw67o37wm2I8RbVw2uYbkK/TtGj+0GZNFH60DF5kU4gt8yNQuzF/+1Kl96
         m3jh6XXh5y42qWeQz5puBH/PZs8Iv5IeMUR1fdPCIirZcz7dW3P8qYBKwY+x1aBAG/x9
         CH1JuJSlUcZyh75ObWl6qIJWXcFkq5P1NNlrXuAk3kLb+0i9dAQdB72r2HG3kcwnE6XT
         w+aEIo9dvUD4EgguNRFZuxgA+3YiaTiy2UmwcSegZANcql+6xT8Cq4ms+FJ0bLn2Xw6/
         OgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751890786; x=1752495586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nxogMmaQmgY2q2qzD7nC3CsZ+3t0oYcFl9XYA4Lsn1M=;
        b=NDX4iR160hWbJgWSAzYNyzK1Fcfz3qWqM580l2QThJK50eZ/Jbs3nmk7aNAmPfTFM4
         gb+L0M5y1bdhaj/Z1womgnEhmETfqNNCm4uPtZIBUSIXJL6I6nhhlJplobQGXmtObJYK
         QQqBl+C9IARpKgDND6S3zbpTCev8o/IdiuseQnzJjjT6VipNFVY8FNfBq/fQhwa4qNn+
         7SvQjpGpZ+rAaX4oMrTmRVCQ9IViicb9defsR3Jn5HoclqZLWB4jDJrJ4Z/BS4vEoR9+
         h0Zys+hzxi9WD0w2S0vQ7DtrZiKSdOiVMDgsQIxxrJ8QKyF96ZDjb2avFJ0x5Tu/BIvI
         9Kvw==
X-Forwarded-Encrypted: i=1; AJvYcCXUJH3kst7PYmUOzUiWWJi1LyX1GmweWzhxbXm4r9u8otEOOQO+5u+YC/cTgrwRR3vlVj2cOOYHSdT9sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWUaG5VILdy63RYxLnI9h4x1MKlu0ZLdkycMcV1A+DeDQ+v+2M
	/E2axeaxXL0vDzGLagL6rEYw2SgcjlY2fh4Np03YQ2NnjClzkHrLIn6JIdxRvHgTVPRrhEQ/8HL
	Mtm9n
X-Gm-Gg: ASbGncuxIaD/PJo3dYnhDiDygqEt9NgZiOdVo3UCEy1PDHPfhxI93Y+TuJ1nJBVbEib
	KS6U5hf56qcWqpL2um4onB1LGA4ihXRfhNtyoDdW7U1uEJImlFiQ7RPgjO95a5RBezdLUKD7H+v
	gfazAqJerFudHyuG1FssZG9wDe9tvrYYxTxWFUqYOQiJ34yBwbYtKQI/cvheB+Tif85MEHbTNcF
	PHhqNXLW8A3HGB4T08gebTkfGkRTie2EVyG/WL8eWX2fqeqtuYzZK3E/beUWPoXJ2EPKBhzM1/R
	z3MAxVimlNymGptWUd7p8w1gri51T6LG2o/klylU77rizMUE95wU0G/LfNBO2YCA06kS1CQ+GUo
	gh/6z3hJcp8YIfof3Beh02kEz5w==
X-Google-Smtp-Source: AGHT+IHhI0FQyOogd1s/uXHV7ed2uK3z0eA0h1VaUBWuw5Kj8IBh7AKQNpwKJDcN3xx1YzBfgWCFWA==
X-Received: by 2002:a05:6e02:1c0b:b0:3dd:d98c:cca9 with SMTP id e9e14a558f8ab-3e13ee8b5e8mr72520815ab.3.1751890786546;
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-503b59c92ebsm1619337173.46.2025.07.07.05.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 05:19:46 -0700 (PDT)
Message-ID: <7bdbef20-da43-4b23-9ae2-a0cf077fec92@riscstar.com>
Date: Mon, 7 Jul 2025 07:19:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 guodong@riscstar.com, linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250612224856.1105924-1-elder@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250612224856.1105924-1-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_051948_182423_52C5FA12 
X-CRM114-Status: GOOD (  20.07  )
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

On 6/12/25 5:48 PM, Alex Elder wrote:
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

Is there any reason this bug fix cannot be merged?  It was
first posted a month ago, and although there was some initial
discussion that led to revisions, this version has been waiting
for over three weeks.

					-Alex

> 
> Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Tested-by: Guodong Xu <guodong@riscstar.com>
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> ---
> v3: Define struct with static scope; added Haylen's Reviewed-by
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
> index 51d19f5d6aacb..54d40cd39b275 100644
> --- a/drivers/clk/spacemit/ccu_mix.h
> +++ b/drivers/clk/spacemit/ccu_mix.h
> @@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
>   	}									\
>   }
>   
> +#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
> +			       _mul, _flags)					\
> +static struct ccu_mix _name = {							\
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
