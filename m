Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A2C369A1
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 19:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=84Di6cBKKE5t1t6R/W8YyMZNE+uFCdlTc1Dekv1ynfg=; b=lSYyglIfLxxL13
	eAt9lmLu2bWKbv6UxQJ49iAuPmCC62Ax8/iAwUzKfRBO8/y/d487EhSmcaIneOaXq4WrRIKNH6zW3
	0Wi6DIh2OII7bWUzYt4pWAE4nzD8aHNZQ8OV2niTop7PQONhC+0Iq8sO5IlNf2ttSJ3QM3UIfvi/i
	i5E9SRMntdfwc30kQM8xn9oVIKkZf0ex2KPiIp/VH2dKYPgdBq4zJzwUf4fvsSsVqVrYvL8ztQ5oj
	iXjgUcUndXPA/jjVCC6s4yBEUoKnOYR3C5t7mxt7j6FN6cH0i8s64MCaomqpYRdKKx/xHwL8m3Cql
	a4+YjKumqU99J7VtmfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElJ-00000005FiD-1Ucr;
	Tue, 08 Apr 2025 19:37:33 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElH-00000005Fh0-0p9n
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 19:37:32 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-86135ae2a29so277473439f.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 12:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141050; x=1744745850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=iqekQIbiWO/eAALIcRJdhPgE5Bc1juhcFsZLVZBJ1NT89HKHVTyE7OCpRcG0ktZNzj
         dVtGMLO24IKCFmgZeAamH7E0/R1KT8EAajiidM5ahzCe1g+6x9abP35AmHNvQITtPdTr
         IjpsIJ8uggtzYp0UpUh9gP+ZGFgKycVr/SU/e69Rn3Mz7FvKST78hsKwbuxzJ1MabHv3
         17Hy/+MhwBJhjae5y2UFhYNOpdpnyhumm+QM+s39cUqjbD/DwgmnDcgUzO7QIMSW4cyX
         l1pfZkgNGURVwHtoOCOmRR5awslr/xtlGLfHR/y1nbt5fAum3Q5MPb2KDKqu0CrdEsNt
         76CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141050; x=1744745850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MmV03+3+73PF3Wnm576GGuQSs6MRwFfeF314mocZSr4=;
        b=fX4HKD3P6rf4JI8EbYVd4cQGAimFdNZHlG2dWzn2taYtzMzRhU+wy2SEA2LD2/xD0l
         G3wsbwr/5uns6CtLFsgxZvfBqrSr4XhljWEVgUgh4Fjmn047n7YffiednrF6LK4gdhq4
         csDERR8tx2oKXcnmyZWf4mdGvPyLB6b/qegyoWrprPxHECO9MIpndqUirDU6/z/8vVYc
         34jzmkSnlX894oI6rC2XJ9leQsGo+7RI292b+uIMcfnQGDfnkBRfJBcGTEKggZ8qTE3D
         O42O9IgSlIi9KU5zNZRwReFvhf97oAtW0TtL8c4AAFv2281Ee19tGrrWRklJE6E/mQY2
         9cZA==
X-Gm-Message-State: AOJu0Yz7dMJYQMSk7OGQlSw9I0V/nm2uC5SXPJb/r5g8Y4DXlIRuBh/C
	ShvmAivN8JhnjkX9WBemCy4XbU9eS663NQh3tqPmtTz0p2o4ZD/8CoM0POLmSSk=
X-Gm-Gg: ASbGncu+L0tIBzXyJR2xi0nA98QjWA0KfM+9dhyU/axNkf7M+Pp8l2dv8Khmk0yboe5
	L9QDogYFPOnIp2OSPZMhzha+Z61p6OjgJWxCpFj+u9DonEyfbzoUFiqrrKFmwLvrOqG3IKmvcFq
	mq5sTsK0pH28AbCoeA7TNs8GL6eLB3Xt4kE9fADthznG/VpbNpsc+BJPl6JX+QJKOWg6uT6he1u
	um7nZlhXeHa4CrDM1m4f+woId0Ln82hnBQxvbjltp9wZUsaxsUNhwGCVolZfNAFqNyAZ45xOepX
	4icxzNwxWHAg1RYRRWC5W9cTOeHbvAa5azLwrhXsVULWwPOI1vmXJAqcreswc7k4sJEMuJ6+Wa4
	ne+dfXRoi
X-Google-Smtp-Source: AGHT+IH0TSMJF+g/Z6xVX1/aYkm6TagQPlKzWAceXhcuRviJQOI+i72GhBsaY2XFvoCOzOyuaI7f0A==
X-Received: by 2002:a05:6602:4008:b0:85d:115b:bb3f with SMTP id ca18e2360f4ac-86161198b56mr61824839f.6.1744141050583;
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:30 -0700 (PDT)
Message-ID: <89385654-11bc-4cf0-b94e-15bf841ac215@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function
 clocks
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-5-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-5-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_123731_241130_41264E4D 
X-CRM114-Status: GOOD (  20.27  )
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

On 4/1/25 12:24 PM, Haylen Chu wrote:
> The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
> selection bits, reset assertion bit and enable bits for function and bus
> clocks. It has a quirk that reading always results in zero.
> 
> As a workaround, let's hardcode the mux value as zero to select
> pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
> is combined from the real bus and function clocks to avoid the
> write-only register being shared between two clk_hws, in which case
> updates of one clk_hw zero the other's bits.
> 
> With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
> controller could be brought up, which is essential for boards attaching
> power-management chips to it.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>

Now that I understand why, I'm glad you put this into a separate
patch.  However I think you should make a note in the code to
indicate there's something different about this one clock.
People can then go back (with "git blame") to see the explanation
above.

Please consider adding such a comment in your next version.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/clk/spacemit/ccu-k1.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
> index cd95c4f9c127..5804c2f85407 100644
> --- a/drivers/clk/spacemit/ccu-k1.c
> +++ b/drivers/clk/spacemit/ccu-k1.c
> @@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
>   		    0);
>   CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
>   		    0);
> +CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
> +		BIT(1) | BIT(0), 0);
>   
>   static const struct clk_parent_data timer_parents[] = {
>   	CCU_PARENT_HW(pll1_d192_12p8),
> @@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
>   		BIT(0), 0);
>   CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
>   		BIT(0), 0);
> +CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
>   
>   CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
>   		BIT(0), 0);
> @@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5]		= &twsi5_clk.common.hw,
>   	[CLK_TWSI6]		= &twsi6_clk.common.hw,
>   	[CLK_TWSI7]		= &twsi7_clk.common.hw,
> +	[CLK_TWSI8]		= &twsi8_clk.common.hw,
>   	[CLK_TIMERS1]		= &timers1_clk.common.hw,
>   	[CLK_TIMERS2]		= &timers2_clk.common.hw,
>   	[CLK_AIB]		= &aib_clk.common.hw,
> @@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
>   	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
>   	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
>   	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
> +	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
>   	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
>   	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
>   	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
