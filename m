Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7211CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d0Fl5XdWam7dTZSKpRVRzEtJnPd7HZpSYUF0yaTujFs=; b=ZgFQpCfBWDxjxi
	gGNyB7YFbMxosipi1gfYjdEA2kV10p3nBo6ZuoVoy6U9FdJ8pOiCAJj2YaJzLCz3H0Q0jZCgpn7NO
	QxCxb8bktn+/f+HUmsW17pVu/R7cKtKuIvlsar547qYTYlB2gj125vK6XvKTdEkwYd8DOEUg02iGR
	zC3fQ0gD66K+fg6/1dqkazXKLo1iRRgoy1dLBg91STxKUL6BgsUBlFmpy5pGw928U4gUpLML6PWOg
	6Os8L6T2jRLdVqNow8uNqJRaTEqMfsP7zMbUGmbsXtKOe1EyslN5yod7sk+RqBQn5QYLfMgnNd81/
	P2YhvuOfJVgBHWRn34lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEw2-00000000xG4-07cG;
	Thu, 21 Aug 2025 23:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upA32-00000000AoQ-1eNQ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 18:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhECXnCIPDw3Lg4MBh/5jtv3LHZEJ/t3IMSb4dezezI=;
	b=H2KFGkXWgJAdQlpgsCOLDxGJQj0U4xbf6vsk2KTo1olge5RG6Cp6oQHvZjM01VY9UGEIqx
	tvCnIL8FcSzisrepmddLczNZr2NB+s+v6nejhuejMAlNtcO0/tzaOtfg94yz2PS8M3EGSf
	01j12HDd5efAhlKdiJ9EphTvXHbKHfU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-rZhuflprPkS9FaG5QTZI9g-1; Thu, 21 Aug 2025 14:29:59 -0400
X-MC-Unique: rZhuflprPkS9FaG5QTZI9g-1
X-Mimecast-MFC-AGG-ID: rZhuflprPkS9FaG5QTZI9g_1755800999
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88dbf013so29102686d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 11:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755800999; x=1756405799;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhECXnCIPDw3Lg4MBh/5jtv3LHZEJ/t3IMSb4dezezI=;
        b=o8/hGDt5n1ATJclcE/bFsyk6CUHlUN+YP2W86BuILEK7D22tyT/1COTlY2PoCWP714
         9Te6V7hpln+QXIWADnrwVwmsAKpKgvWNXvnwcaG5h+melN7HHOielSJw0tYKt6yTBzEW
         912cX/6LLc0oHiyU2goSxfD3G7zYIjZAcVmx/GjwvKRHsrYKTX7V4wZCJFywjtO/NXpQ
         3rYUMyLeEpq93t3OBDQ6ApnmhV996uHs9pX+i7xGhBnCkxhu2GABL/8A+j3MxAw8PDfc
         uaOiaeWkFJmlYGhMqhgsTswtF4T6lio74NVX5XFT0ZTLp0EZ5leWhQpZmnvc9t5g/TeD
         emaA==
X-Forwarded-Encrypted: i=1; AJvYcCU+He+NoJdbrGIZXUd6Uy5qgQSN5pvyw6VJ/0SO/vuv4soZACC75JhMgL4adjC4RYoLMSa1Ak8an9M5nA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvsCJrdf0OT4OWEE3M8rjS5aMGW30QYNfM+sn/lR/Wk/ttKvj+
	tX6syp/JGfr0qV4k/4Or16I3fEGj42vW3mr5pWIsKK6fqq56J8SwNvV73wZKsP/V2yO7L+9C0xF
	eF8GnMrPE7E9v6kao1Nh/jyvMt0TUCK95hMh/fpSM5BTijq+VIx12vC/1+pufzQy7golUWQ==
X-Gm-Gg: ASbGncvhLGhlDB4D6L4RrcAqRBx8JgLkHTta7RmCIgqvvgb9ZJLItWAxIcmVTFRqnt6
	FyPOYtrZfeg8l2IFaZKOn5BAG4cZ33df031xVSw9OLICaAyY23sdW5ttYt9SXGbiMGwWNxONuxe
	xl2xOxU/Vmog2NOKfJSfRnfBFCRAHKQZhI8AKR3oIqlYhgSQri5hyhvJLd38OXYm7ENzUBYpJQO
	womydOddVdgKUyLO6Nc5qGsZiHB5B6/EI8U8Hxor91dYSSzR0bZ6POa83Jy/EXfKrwvgaXAB1wD
	ZZzXAK0E2U7EIpRsyvhygk9VpKm5y3FHRB+is5nld57B5ovfgxO+1xDt2culQ2k=
X-Received: by 2002:a05:6214:411c:b0:707:5d90:5e92 with SMTP id 6a1803df08f44-70d9712564dmr7627246d6.23.1755800998826;
        Thu, 21 Aug 2025 11:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe8EN56eHT/hjQKp2x48P3siaQqYBM5dZ5CGM9Mf8D+ZZvBzIAW/a9XWvDRsldQ0ClduM2xQ==
X-Received: by 2002:a05:6214:411c:b0:707:5d90:5e92 with SMTP id 6a1803df08f44-70d9712564dmr7626826d6.23.1755800998251;
        Thu, 21 Aug 2025 11:29:58 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9097dc4sm109917596d6.26.2025.08.21.11.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:29:57 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:29:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: thead: support changing DPU pixel clock rate
Message-ID: <aKdlo6R3ER99klYn@x1>
References: <20250812054258.1968351-1-uwu@icenowy.me>
 <20250812054258.1968351-3-uwu@icenowy.me>
MIME-Version: 1.0
In-Reply-To: <20250812054258.1968351-3-uwu@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cMN0VuCkJBYjy17O_99PpY48kX3lV75zKPIptQd8xpY_1755800999
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_113004_508318_D8476D94 
X-CRM114-Status: GOOD (  21.46  )
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

On Tue, Aug 12, 2025 at 01:42:56PM +0800, Icenowy Zheng wrote:
> The DPU pixel clock rate corresponds to the required dot clock of the
> display mode, so it needs to be tweakable.
> 
> Add support to change it, by adding generic divider setting code,
> arming the code to the dpu0/dpu1 clocks, and setting the pixel clock
> connected to the DPU (after a gate) to CLK_SET_RATE_PARENT to propagate
> it to the dividers.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 87 +++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 2f87c7c2c3baf..3e81f3051cd6c 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -55,6 +55,7 @@ struct ccu_gate {
>  
>  struct ccu_div {
>  	u32			enable;
> +	u32			div_en;
>  	struct ccu_div_internal	div;
>  	struct ccu_internal	mux;
>  	struct ccu_common	common;
> @@ -198,6 +199,78 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> +static long ccu_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct ccu_div *cd = hw_to_ccu_div(hw);
> +	unsigned int val;
> +
> +	if (!cd->div_en) {
> +		regmap_read(cd->common.map, cd->common.cfg0, &val);
> +		val = val >> cd->div.shift;
> +		val &= GENMASK(cd->div.width - 1, 0);
> +		return divider_ro_round_rate(hw, rate, parent_rate,
> +					     NULL, cd->div.width, cd->div.flags,
> +					     val);
> +	} else {
> +		return divider_round_rate(hw, rate, parent_rate,
> +					  NULL, cd->div.width, cd->div.flags);
> +	}
> +}

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
