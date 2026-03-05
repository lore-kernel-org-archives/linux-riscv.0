Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25603F30954
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 12:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uL96LFrtxAOsWwvYASK8X1Jkap8WjS1tZAVcZUwRW0w=; b=X5YJtGWYFNwQzB
	W1M5xO26gqBc+JjuAGXWUHlf7WRsRvE5BB2YErjoC5DM4Xu25b02221OZQ3X9UvpE6aocX5XWCyZM
	cr2Del+RuLbO6YT2D9JgIMxFhyDwX9vEkiUWidufbFViuNO4b8wZxbejJCL91d4K6Tmcmg0p5GfMb
	XbHZlv/qmDu2qftKncx/yVA+Zyy/++scpB0ggebMt/TG0HE4z4o4NsvvsRyOWJLfxRZ56fKLi5uGe
	Imeev3eZfXI+FWcecDC92/Xenm8fFulkIA0Ud+e0wBVX44F4Lr2optocwo2pRxlxG0cpHWcEO1HVS
	679yAEMO3+VhLGyCqk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7cB-00000001k6i-43nH;
	Thu, 05 Mar 2026 12:15:39 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7c7-00000001k4i-2wbq
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 12:15:38 +0000
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-35983877dc5so2192180a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 04:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772712934; x=1773317734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yS764krKV6WfB8kOxjvP29bXooB1nm1bNBDNiujlO4g=;
        b=dwYV3jXor5Pl1e9RreTX/nzXB3FMUKyTleZaMVrOW2jkl1+9iMG/7TOF+YL1DO9cSt
         ljOGp3ICQgbh546++4NoVzPkySGkS/cFUqRJzHoI3mVfNSPhKORVPiLs2U8bwYNUhvk7
         rGRJWL3Av7J6U/F7TmEs9VW/J9HibLqtTFrKVJeVXHNWGJCTKg7wOdLOcNdzNldNJTFj
         gdwTP2oBCurSGoVIZieEXsD40hGpxphmevRocJUsOWtnzB+qYcpvpK26pQzpqU/aTths
         RYNxuAthQdT/qK4gQb+tVvrkRQB82V8xbvljeaBrW9vInzngAjUFf9nafafdzYnErHwz
         /bvw==
X-Forwarded-Encrypted: i=1; AJvYcCWwFG1YMdaYvhXHcpFEiKGpRZYQU3yAhOmdOIiFIb1OWZ6cXyTpNfJabsCLTk92M/C3RUwni8rWYuMTOg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gl7YyvjP5FTTlyyS5MoPM46a9F/I8fCVZjpm74FmOavaXgZ0
	r6KCGcwc44JyH4nM2mt+o/7D1L29bvkfo368sqN9sjKjeuFwRoSDyPBf
X-Gm-Gg: ATEYQzwoo6MU6b+B+/vz5UeYm/HHqi/5t4Y97v6if8XRqSYdAiQJPF/+txgN0NrFeIB
	x1M2ivZVkix0J3mDSxyHV+/fRaJO3BQtClAoywuJffVSq+RcrqplZe5pav308oBtWrwCoDlAwOl
	TnBz5jhzebifnUt83f4/aRVfqjVu/giyHss4WWCxMPds0A1eXmM2U3QdMCeQ8lClvT2UpShwd46
	tlU55nnQ1xV+QscRS+oVH5bPPOMD+qmA/xVjDuUT1NzOKoaPp1/VlLcRu66VEZdyYk4zytYEacr
	NThQRFUhlxjMRmYWlfdF1Lo/eSiTyipSzcyCp4fXVGM+zeuY4mEf1fTMo/Sb7dRCmab2KZkw3s+
	+gYRWVV7fjwqX/Gxos0tLlfU7DUZJ6PmrSQYYdVmGLWQsLIL6s6gf8RXzf8+Dc0nsZezL03if8Y
	rpP6GVIiRShlm63t5HZSNu6oi+VMLVs48B/tdNovvc0A309nHIAZnCm/3xNfkkO8VjSmF0oMXzQ
	pY//noeAX8RM2NEAQg8nZZvIOYWdV8i1YnWlXl3ksvBmJVk+JojxPqs0fsykQ==
X-Received: by 2002:a17:90a:d44b:b0:34e:630c:616c with SMTP id 98e67ed59e1d1-359a6a92750mr4210979a91.31.1772712934483;
        Thu, 05 Mar 2026 04:15:34 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2c1daa6sm2391359a91.0.2026.03.05.04.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:15:33 -0800 (PST)
Date: Thu, 5 Mar 2026 21:15:32 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305121532.GA1649635@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260305114352.2f7btqixg4tu5bzl@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_041535_733628_4F0418EC 
X-CRM114-Status: UNSURE (   5.31  )
X-CRM114-Notice: Please train this message.
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

Hello,

> K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> K:	\bphy_(?:create|remove)_lookup\b
> K:	\bphy_(?:get|set)?_drvdata\b
> K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> K:	\bphy_(?:init|exit|power_(?:on|off))\b
> K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> K:	\bphy_(?:reset|configure|validate|calibrate)\b
> K:	\bphy_notify_(?:connect|disconnect|state)\b
> K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)

What about

  F:	drivers/*/*phy*

or something along these lines.

	Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
