Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3098BCA0EEB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 23:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JI6WlsLfNAk0V0RTjUpMsNW0lG6J66Eqm0GVEJ88j9M=; b=wUtIGcRwgVYuj8
	yenv0RLFu5MOBlBdhVaHx86of2Q7J1Svz4JsIzjtyMUbD27uNRHo0eseQaeVeDQb4ek2jiuk6gGHm
	6DZNTTOxB5y3d7g2xET+Jgr5/TBPd6zWi1tF2AmO2UhgcN/hOGCPDqRO3QCNzuGqWnGaY2EW3WpWC
	ItxCwXPVdRlcTJdMaxyCkZj/JF/c74KGQW4Oj/jClnodYYAjlhfnZHN27E12tX6DsLJX4rRmj/Su0
	XNzZGyxEiwQZ/maWbmi4daO0KjBvrR++ZpvZ6bSPieGSvKnpJ8ZSM0e21nMJNIJLIWE8L3oJQR8fu
	GLcbpH8CS530rhdcN+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEw2-00000000xGA-2ZbM;
	Thu, 21 Aug 2025 23:43:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upA5e-00000000AvX-3V52
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 18:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KON+Q6whUKmJdJeXPPkBBlZNmW3IaSDriSZEFUK+R2Y=;
	b=KdTQnqvO/YQ+ueqFA2tkcWwHwUNk5Xe/8/XwrzqKxIF5LVHMJ/yqS4yZiMQKuftIlFVl4K
	OvDa0GXQSEtHW2toMcqhHnX4kNnI95gkY9SXQtUtnF9lkGBdjr/TJkZh7wrFONitIQgi1a
	KNDbCXIGjZP+0kFJm3U9RIntmBIMQhI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-K5637gS3OAy6Fv75I7nq0Q-1; Thu, 21 Aug 2025 14:32:44 -0400
X-MC-Unique: K5637gS3OAy6Fv75I7nq0Q-1
X-Mimecast-MFC-AGG-ID: K5637gS3OAy6Fv75I7nq0Q_1755801164
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b0faa8d615so63107981cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 11:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755801164; x=1756405964;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KON+Q6whUKmJdJeXPPkBBlZNmW3IaSDriSZEFUK+R2Y=;
        b=Cv7V3FXHuowleknNO4G+GDGNhQC5zAH7L333WLUVAjAfT8vFWMiFKGRvWYrg/3mShd
         IPHTJsauWBZPEjT/9ykmKPvPUig4NWN5iQy5xJbz0UEL9JI6Srlrd7n0UZlqnysTpr5P
         UBjAajJ3zXQoZd0Q3BKg74SGJtM2RIFvtQwnJyUUQLmkEu0xg98eRhO5cNDEARGW4h0O
         lLZm0J/uSsozQ530aDb5kDopZUfH1wKn2Wve4AIu0MfyCSLEVQl81mXV1e/rgT4OsO89
         fQupj16j1JmRxNQY+yO5KI35Z2GOjBc427bdyE7orAiJyxhKnUxTCBScNeJ4fBqS//FE
         fA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIEo/glDxmM9+/CL0kOed7ajub7LbXsyhlLvqfd/sTsB5B1Rli1zf+iuSIFIUerM+QtEqEqGfYWSH82g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy1qznDmOxELvU5KPvtZCT9U9nv8N5wNOkK/nZ2rMnlXcVezbe
	Mj+5ICs2HOvHdtch/wLR0uo004KkfHIGJeNKWm/uDEkoDcSWrrOVzm3F5xobluD78RjWBCgtbvM
	tZy0NdUCkz7Kva8mhCf8TJWewtWbV7sjFkSD0+nxjZDM3Z6KcVqJKF+qTU7doffmWCTQgqQ==
X-Gm-Gg: ASbGnctaCzOeVOiUUPdetskwcZZYSqZHD7nDHvtYyL8tTHLhfhHK9ce20LghLVQzE77
	x1pKodpxyXD+olcmRjw4X2mi3mhtS5S/HDEJZHwH0TkeTrxwHUMcEBzyaREV+wHSJXSK+93tPkA
	J+PPAn1JHWR14prRTHqnhWlwdc5+taWyvwEryrVqpGxE82VUrcWPNX8oNoLdudajoYD0tyg5+ME
	Iyn/eud2kc7uXdK2MOVwW7ZE/8pXeLxUX4+vXid349xrWbDBRw20NyYb4VTeM8rpPNku+VEpXNV
	tzojyKFKjugsv/CzzyTGpoyqg0c32flbCITch3lD9zisL7sIntEmjVQYO3vSBBQ=
X-Received: by 2002:ac8:6f14:0:b0:4b1:1109:6090 with SMTP id d75a77b69052e-4b2aae2cc8bmr2120581cf.4.1755801163651;
        Thu, 21 Aug 2025 11:32:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8u9mZep+thwTChGyaQOwVjhjsZ4znq9OEsEjARCqM1Fbessm7gFZ796HVd8qGyD2EqIFVpg==
X-Received: by 2002:ac8:6f14:0:b0:4b1:1109:6090 with SMTP id d75a77b69052e-4b2aae2cc8bmr2120031cf.4.1755801163034;
        Thu, 21 Aug 2025 11:32:43 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd693asm104533501cf.37.2025.08.21.11.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:32:42 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:32:40 -0400
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: [PATCH v4 2/3] clock: eswin: Add eic7700 clock driver
Message-ID: <aKdmSJtTrs6n7ZXI@x1>
References: <20250815093539.975-1-dongxuyang@eswincomputing.com>
 <20250815093720.1088-1-dongxuyang@eswincomputing.com>
MIME-Version: 1.0
In-Reply-To: <20250815093720.1088-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wleuF8ey6Qs1yNtH0WU4heJo4j__lyTr0DIn40-sLkk_1755801164
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_113246_943727_C40F9EE1 
X-CRM114-Status: GOOD (  12.54  )
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

Hi,

On Fri, Aug 15, 2025 at 05:37:20PM +0800, dongxuyang@eswincomputing.com wrote:
> +static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	const char *clk_name = clk_hw_get_name(&clk->hw);
> +
> +	if (!clk_name)
> +		return -ENOMEM;
> +
> +	int index;
> +	u64 round_rate = 0;
> +
> +	/* Must be sorted in ascending order */
> +	u64 apll_clk[] = { APLL_LOW_FREQ, APLL_HIGH_FREQ };
> +	u64 cpu_pll_clk[] = { CLK_FREQ_100M,  CLK_FREQ_200M,  CLK_FREQ_400M,
> +			      CLK_FREQ_500M,  CLK_FREQ_600M,  CLK_FREQ_700M,
> +			      CLK_FREQ_800M,  CLK_FREQ_900M,  CLK_FREQ_1000M,
> +			      CLK_FREQ_1200M, CLK_FREQ_1300M, CLK_FREQ_1400M,
> +			      CLK_FREQ_1500M, CLK_FREQ_1600M, CLK_FREQ_1700M,
> +			      CLK_FREQ_1800M };
> +
> +	switch (str_to_pll_clk(clk_name)) {
> +	case CLK_APLL_FOUT1:
> +		index = find_closest(rate, apll_clk, ARRAY_SIZE(apll_clk));
> +		round_rate = apll_clk[index];
> +		break;
> +	case CLK_PLL_CPU:
> +		index = find_closest(rate, cpu_pll_clk,
> +				     ARRAY_SIZE(cpu_pll_clk));
> +		round_rate = cpu_pll_clk[index];
> +		break;
> +	default:
> +		pr_err("%s %d, unknown clk %s\n", __func__, __LINE__,
> +		       clk_name);
> +		break;
> +	}
> +	return round_rate;
> +}
> +
> +static const struct clk_ops eswin_clk_pll_ops = {
> +	.set_rate = clk_pll_set_rate,
> +	.recalc_rate = clk_pll_recalc_rate,
> +	.round_rate = clk_pll_round_rate,
> +};

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
