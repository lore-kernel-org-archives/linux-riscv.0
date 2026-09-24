Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF4C98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BEyRfRZCCa1yMVPqcfJcX0ZrMCsaMhmlNDvy3VjnBU=; b=mgZdkhK86IH0NU
	09I8CjoS9KXWcO+onhX/D3IWQFWjpmkIMNDdIWIWNWBMigAvpCfgVEqoyJzzewo3a8N5cr7E75D7n
	g+jjWplxMWPbnKUgAB77YUdXWYRe51wzVsZEi74c9Tv/LS48i6x/o1SBaePAcSzSXbvdViR6tXm1i
	I/uFkRlnlM4Y+ZG442zxh+X7UPJRtatvugMqZKFJEMz3fTIGbGWIT093khvda4Ddnz5vqtV1Z0O4q
	XQKZTr18VQeFeYjh58YJWxfYdeBA4GMyZ9ZDZIzzo+0F0KROHp5FGaODTlM0rxULzu0cixwx7r81X
	aoAsx4sEz/WU2Y4pu6RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nc5-0000000Bq7n-2Rvg;
	Thu, 24 Sep 2026 17:52:05 +0000
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nc3-0000000Bq7B-0dfz
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 17:52:04 +0000
Received: by mail-yx2-x0d.google.com with SMTP id 00721157ae682-8a860e5505aso342717b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790272322; x=1790877122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=eDJ4B2uk6GuLL27CukFme6BCDr7H6y9CGsKR9pG1hWWCt+Z/qBypHNYf6pVQOKq+gt
         BAkIUFVYljKp993VVKu7Lpe6Th0uZsAx+4c6MEUX4kh32khLKkr8gYyIzWEdJMoUG2Fx
         8BvGXtsdz2+4N5TfzNyD0ee1aAfcFcm0A9MqT7OQeMOT8molLs0oWrBvHirXZ53ycdBc
         l62cpwF04mOSn+lpd8hhJPTqpfoudNpAKSeffUQRRXQGahwRfTFZQtQLtjVGT7DdM3Ro
         GPyzf9dLh4hasrWW/43ewVn15SbXs1Qd+Z+emxjuFy2JAuR/t0mKAr6SyS+8oTGxBeQA
         2jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790272322; x=1790877122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5iUQbHVoGs8+CjCsGk4c/TY+BmqzXWWcR0ocJIehM8=;
        b=Sjliqcggd0eOf728ouvZCBugoNafqLY6Ed3+ILZwU6nxJHvy/xqbbHxkWKYW0izA0i
         7sF2VTTo1sxtJuFFULmWGotFBxCII5vqrXy94ooOJT408BjU2fNSwubrG61b3LOGGd0i
         K1mveIIulsCTlRIwsTtNt3Oas1GahFHaqsDBrY6cDhm/RY+22m+XbebebYpzd1ik55PZ
         1IB4RWk0bb+IwLR75FmtMrO6fo4dTXi6+uMqI0PvrwiXqHlzx9SDKz92mpj/yF05AytN
         c5CdX56/Se5vZ48/uyeO2am1ufwxiNeJxW8ZPaujRmLHeF4lN2kNvL0PvLPHZTTdc0Jd
         mwxw==
X-Forwarded-Encrypted: i=1; AKwUvBxSCZe+JJPlwK+JdHJAXCf+I0oQiv3f0dOKoZg2RTDYe0KzBZ7LRieur0kp6ObFTYXnIs3KlxS76F0Q+A==@lists.infradead.org
X-Gm-Message-State: AFuF++keQFGbuUbsVlBpNut6hUDgFUuDRtrOCmH3ujAnDSK9Wa0Y4fRQ
	kDpcEolbKpsR1rOYFqRlnM26RQ0adx1UXkducO3e8WDkCE49W+/R/3OgkPgPT0iw0Ic=
X-Gm-Gg: AYBFou22F+skMGFGLbvdFIbwgg0S2XcVANKjFm/PbHqGn4ggyWIg4qVoSeCdZJKu97b
	uNyWN/oUOx9j5VxP7NXyjv5NMtvzYLKTTtCnVsqjt6g8VnU1TAUVx2gbygvmIAztviZ0uVCp0o+
	94VTXPj6EBpqQvqdouGsWvYWNALyfG+EuoeH6O1beOVJtOWsENP8W0T0EtaPtn+7KN8AUIYFqM7
	gSTTbPrbq3aE78mqHGpL1iw2Aw/m9+jRPIU2VKhbhYd9TJbixlEF7CKidJ0BeyyIaaKNESAeldM
	jDan6nVWWAcNBE8ynRGtm/gR/YZvzxCTsNHwMYnO366zdAiMBAUcVcDO3DACoFVUvuPirJz1Tno
	r15s1ngP/NVfhfWZVDdOtnXN7Rk2LeL83IMGawQmhRdg91i+gM5+Z0WLXx3VaegJOzTROeZRU6x
	Tcbmyb9nHms//hE2H/NKsUoryxezuKKbvcMTzrnURUm/EpAyqwdlsCjIkVi5lSrzDuLjAw3KWpx
	Rrdjuv9SBrTYEWNC+tI6iic9DTU7Yc1yEUHGaGzGAaWTH8L
X-Received: by 2002:a05:690c:312:b0:882:27d8:8ca6 with SMTP id 00721157ae682-8a64d9f08b4mr26331337b3.53.1790272321920;
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Received: from toolbox ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86106b298sm165627b3.46.2026.09.24.10.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:52:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 12:51:42 -0500
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, 
	Joel Stanley <jms@oss.tenstorrent.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, linux-riscv@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: tenstorrent: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <lv37wl3d5oonioc562vl25hs5yfytqpi3qlmxk6c27tmjbvqrb@msrlsxkbisji>
References: <20260924083439.461769-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924083439.461769-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_105203_202919_472419FF 
X-CRM114-Status: GOOD (  14.76  )
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

On Thu, Sep 24, 2026 at 04:34:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else blocks using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/tenstorrent/atlantis-prcm.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Thanks for the fix.

Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

> 
> diff --git a/drivers/clk/tenstorrent/atlantis-prcm.c b/drivers/clk/tenstorrent/atlantis-prcm.c
> index 6d4386eeb7dae..854b9c48816f2 100644
> --- a/drivers/clk/tenstorrent/atlantis-prcm.c
> +++ b/drivers/clk/tenstorrent/atlantis-prcm.c
> @@ -205,14 +205,9 @@ static int atlantis_clk_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct atlantis_clk_gate *gate = hw_to_atlantis_clk_gate(hw);
>  
> -	if (enable)
> -		return regmap_set_bits(gate->common.regmap,
> -				       gate->config.reg_offset,
> -				       gate->config.enable);
> -	else
> -		return regmap_clear_bits(gate->common.regmap,
> -					 gate->config.reg_offset,
> -					 gate->config.enable);
> +	return regmap_assign_bits(gate->common.regmap,
> +				  gate->config.reg_offset,
> +				  gate->config.enable, enable);
>  }
>  
>  static int atlantis_clk_gate_enable(struct clk_hw *hw)
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
