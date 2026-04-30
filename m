Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9F7FF886F
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 22:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0eqjDdlJEKxjwJT+Z2H225r2Tff4ofa4f9DuB633Oc=; b=V7rppBUxRcZI91
	2HA/bwmI1GxMIqD5E5UsNP8wRG5PF21A+lNFGb8C6WMjJ6gV5JQVHPnU4pyiwcCvLb/Oae3FPBhYc
	9er2ZlNtegYk5vX7DRD6wxYb1m0+8MofA+dzTsKD1jXPafhbGqrDQvl1ZJTWmZl51VE5L1No72kZm
	Nj6/B4OuQMhYtyR7ge38WeB08I3OysW08XLEQ+AasPwxdpM2Yzo0pYfywToJyY+9g/dZCkHA/k6Q2
	TcJM96m97zyLnFj0hrPKZFC9NF9soDGMHSaq1C6Tj3B/OHvlmJtfAxWSFnyKfnU9ATm76rW0yMpoc
	xxeade7ZpVyPU7IG9jig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIa5K-000000064A8-3phr;
	Thu, 30 Apr 2026 22:42:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIa5H-00000006495-1k3u
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 22:42:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777588932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/1cSzGnnBDcTXUhWLIx7rOMO3bSL40zQakAMBJWPaQQ=;
	b=Cxg6PACkH933hsmLO5q5VzvXz/G7hP9VCQtw3zvlN1Ek4bCWVoGGp+QmBnaCPc72YvFuMb
	1GjH0GgX/YHl6dfBMBsy37bzmYP03OEEA/ZCh3HyZvv6VMLfBPuG9Hdor2YUWZOLlKYt8K
	2hqsB2jsuzVdE1V8rJ7VFdBBU/BP+sM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16--q6yqOpCOduQ2teruTXs-A-1; Thu, 30 Apr 2026 18:42:11 -0400
X-MC-Unique: -q6yqOpCOduQ2teruTXs-A-1
X-Mimecast-MFC-AGG-ID: -q6yqOpCOduQ2teruTXs-A_1777588930
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fae95c82cso47458141cf.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 15:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588930; x=1778193730;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/1cSzGnnBDcTXUhWLIx7rOMO3bSL40zQakAMBJWPaQQ=;
        b=pf7GLCYGZTSkPcxrO3CwAX4AfeDBfSdtzvKXcdrxtun2C5/c8hAKUEgQdH2GefqoIs
         eXuOMelkVUvgcDRhdH0QYJDz/UHC5C6DYogArQngiIqyoTedPQMkdEcv6tLwffIchJvo
         oUfzj9/LlbFn+2Rgs4xceDQU5fEP0nk/lOMlKBJE0shMylirgQrIdBE2qa2rChnvbXPx
         U438Pe5lrj3nruugRRNia9KFUIRspiXeDFGIa73wlpPuF/ijSa+xEYvMIPHLkEK/ZK/z
         vmkREtKQOBafNDiLOoUejP0ddPmGClNeXAlmxDuDbMirI7odgdhUkaXMRSJFSvoIohrO
         h4mg==
X-Forwarded-Encrypted: i=1; AFNElJ/OIihPSIjMPJPHTLi8nSTPKpR6oiXfa1DfIvHfedpczAfBG+WNOTxOLd52saJP9J7niDGSd7jzWlOIqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwU4O4wpJoYZcGY5cOVsvjkIkpw9U913V5Pz6d6Q9jriIKQOtJ7
	FYpGRRaiqRlrCzGDvf2NLx/nyLGFKNDO9z8UQxoZo76h78QYFegW3r8orIPKotiYlSISxyrY6WK
	Mxvhf8f7TkSZk8hjlGjRfZhsXPV7Lb+7h2+03JLY4MPIt9NvHsYkV3KJgfiUUwlsJZXbdKA==
X-Gm-Gg: AeBDiet4bBQ3ZoyZfMQlKn8EhlZEbbIfuexYDa2+suPvPwlBNb4OR9bHQuVTnF5hgkX
	uPw7WbxyIIUqVdsAW0ij+5QaTZatvIHwsEQhpaVKS/TR3pzB3MDz/sLVdfavdhAkex7B4JyHNGG
	+BrqCmi0/+rISEiXxyVWOUMePMVIBuh+0ID+4wX7KTLl6lkK9ko/ZdA2pK/+qVrOAOodH2lbbb8
	NlqnkiKhKW0u0HWIb76DH08fh4JoAuQHETz0ufAnUDLqClJUkm06DKO18LL2z/oz5jznG28eMep
	VmJTWjZqIyvb/2fqbI7sRTSu6LKLAGL0QEpKqTSXyKmmHkA+q9U6/+dS0ubUbiKJn1Yip2De9YC
	mttvbn11k+DS6u87flUlv6RdkwUJj7kI=
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5102ab1eeadmr73739651cf.18.1777588930289;
        Thu, 30 Apr 2026 15:42:10 -0700 (PDT)
X-Received: by 2002:a05:622a:145:b0:50b:48e3:47a7 with SMTP id d75a77b69052e-5102ab1eeadmr73739151cf.18.1777588929738;
        Thu, 30 Apr 2026 15:42:09 -0700 (PDT)
Received: from redhat.com ([2600:382:7701:f83c:fba1:9a93:4c64:db25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53ce7e796sm4571016d6.41.2026.04.30.15.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:42:08 -0700 (PDT)
Date: Thu, 30 Apr 2026 18:42:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix peripheral driver
 registration failures after oob fix
Message-ID: <afPavvW89sHTx644@redhat.com>
References: <20260430-unmade-overpay-28d175fd09a3@spud>
MIME-Version: 1.0
In-Reply-To: <20260430-unmade-overpay-28d175fd09a3@spud>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hz5Up6A1-Saghy8gQh4jA0iQnrdQhpTrJURbTnyjuyI_1777588930
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_154215_537885_1314A362 
X-CRM114-Status: GOOD (  23.68  )
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

On Thu, Apr 30, 2026 at 07:30:28PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Commit 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds
> access during output registration") fixed the out of bounds access, but
> it did so by packing sparse indices into a linear space. When
> peripheral drivers request clocks, they obviously don't care for this
> compression and use the sparse indices, and therefore try to request the
> wrong clocks or clocks that don't exist.
> 
> The most straightforward fix here seems to stop being clever with the
> packing and just overallocate the array.
> 
> Fixes: 2f7ae8ab6aa73 ("clk: microchip: mpfs-ccc: fix out of bounds access during output registration")
> Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Michael Turquette <mturquette@baylibre.com>
> CC: Stephen Boyd <sboyd@kernel.org>
> CC: Brian Masney <bmasney@redhat.com>
> CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> CC: linux-riscv@lists.infradead.org
> CC: linux-clk@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/microchip/clk-mpfs-ccc.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> index 0a76a1aaa50f7..40c17593e5941 100644
> --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> @@ -32,6 +32,7 @@
>  #define MPFS_CCC_FIXED_DIV		4
>  #define MPFS_CCC_OUTPUTS_PER_PLL	4
>  #define MPFS_CCC_REFS_PER_PLL		2
> +#define MPFS_CCC_NUM_CLKS		16
>  
>  struct mpfs_ccc_data {
>  	void __iomem **pll_base;
> @@ -178,7 +179,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     out_hw->id);
>  
> -		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
> +		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
>  	}
>  
>  	return 0;
> @@ -231,17 +232,9 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
>  {
>  	struct mpfs_ccc_data *clk_data;
>  	void __iomem *pll_base[ARRAY_SIZE(mpfs_ccc_pll_clks)];
> -	unsigned int num_clks;
>  	int ret;
>  
> -	/*
> -	 * If DLLs get added here, mpfs_ccc_register_outputs() currently packs
> -	 * sparse clock IDs in the hws array
> -	 */
> -	num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks) +
> -		   ARRAY_SIZE(mpfs_ccc_pll1out_clks);
> -
> -	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, num_clks),
> +	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hw_data.hws, MPFS_CCC_NUM_CLKS),
>  				GFP_KERNEL);
>  	if (!clk_data)
>  		return -ENOMEM;
> @@ -255,7 +248,7 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
>  		return PTR_ERR(pll_base[1]);
>  
>  	clk_data->pll_base = pll_base;
> -	clk_data->hw_data.num = num_clks;
> +	clk_data->hw_data.num = MPFS_CCC_NUM_CLKS;
>  	clk_data->dev = &pdev->dev;
>  
>  	ret = mpfs_ccc_register_plls(clk_data->dev, mpfs_ccc_pll_clks,

Reviewed-by: Brian Masney <bmasney@redhat.com>

I confirmed that there are 16 clock IDs defined at the bottom of
include/dt-bindings/clock/microchip,mpfs-clock.h.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
