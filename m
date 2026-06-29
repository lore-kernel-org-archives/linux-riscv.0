Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80849C43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 04:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8ZACB31IbnFnizWCg7c08FIEwgB1F28txmZKDKiHrg=; b=w0GuN47HORRfoU
	grwU2HsBE2RKK1XpI9dQ8i8jlvEcNfKnP4ahHAuVLrHyrkhz1Dhoyt/PPHWBAK5jOTwOsBmF6eP2M
	FvWPM9/DytPiIiz5M7ZV1t+3s+/ehV1keVjxop7DpTZBeYpeFSu2Ij3tuONWG+q74MLhl/51/MgO0
	eiB7XudD6X2uGdRRthteXFQD5oFHrIOOgWopXu8szARgzcQGT4qVG0xAH3UxW0jwd6nGOqMx0BrNs
	OTcbR82cpBJMaIoML001AukuoFHeYnGeG/uliX2PJyQHZBgQLJMV1h2wvRKLNGfsk5xnTqBOVcvNh
	bMjckBu7qfSQJHUz0Plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we44y-0000000DggT-0HDr;
	Mon, 29 Jun 2026 04:58:44 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we44v-0000000Dgft-0hlW
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 04:58:42 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-30bf132969bso4139115eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 28 Jun 2026 21:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782709120; x=1783313920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QsB27okN3oIFcQCd02Iqvl+jQspzLnJ1Dz6viWpLCEI=;
        b=eSFhxB5aIMiLDcPhMTH/s1XGXNslJ/0y7P/rZtmfltOAAz48IcnX7gBpm6CSYB7O8D
         r/8DH+VoRlY/DRuaZ5fgv/LiEnHgnVjWjOKEQV/STUoWcx7ZN3TyCaCSTyvHlcHx5tN5
         4bAD9vtqxoLrVTi7w/4k/jLa5u7e0eqYPF2iR3J/uAWK0fst+dK7JWMGf5g6W1oYfMxX
         YB/ulWafjB6J4WZNO/FNyXN+8pNnLOAJSValJ48ClQI7cssuDYXhiIB+uaZ+peDdWJCE
         PmB3UfuQtWYRt8X1hLEkj7uUjgNg4pidAD56kmrxtu4KTEQHPqBSoKibr3xie0SNmuqh
         y5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709120; x=1783313920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QsB27okN3oIFcQCd02Iqvl+jQspzLnJ1Dz6viWpLCEI=;
        b=TSsCL6X7OOmYgR8cZZuiJTj6nwIzElxV1u2KR05AzUz2fnddtPTuISYv33+i2xs/sI
         B35ll0y4OKtU3LwniTA4H0XnNt90536EXSM/7rzP1X5G4yUQ5/kVjDIEoZVXaQXxPpnP
         +zewOWFsfj+9RpgoEKa051+yqBwntlutn3njTeR5kU42IWqeijOjXh4n5sc5vQAaKiP7
         JwClzMemro54PsBGzll/05aEbwTrO7Hh8swbiG3pPgFe6mw48t5ULT+/9Maatcn7/Sed
         /kLWKLuMpT/HhTXHl/6lp3BjFYj5iDWEvOZcfXtQC/4XLPHi5vvY9W9MmhgEI2Drgt/z
         xhFw==
X-Forwarded-Encrypted: i=1; AHgh+RoYw0q6Pax01o/TkSWzrWZCyUeWDu7TGyiRjWKdj16TqpY1D7mC43QCupGmqELybPxCqcofvsdU6ZQwaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4rkkQ762i5Vh802l9hSUPd6A0M0gzLEnSEhbTDVXnkuVcA7DV
	h3XulV7uOIDtIrVouwOnUM5OZm0gGGU+94hOG43KsARwUpFDsEOKympOKoEs2p0uQoM=
X-Gm-Gg: AfdE7cnqZMIfohOU7+r9Xth/L/sJm9ZPel0ibZh9wGwvftSNvl5+nAkaAjfFUwkOKN6
	IRjpp407r8Bbm+Rtr2rOSnx9WoTbJqSWWCOaZmId0JF5GBQRzeVOWkZu/c2QV+ByPTts53T9BEy
	4UVdh8vdQPeQW3B6eCvIK0FhKZsV6fOnGahxgcn9p+1f4TJM9lNtSxwh7gdthildxsma12uEKQ2
	/UutZJtHjrzBDWXKhMVNBodtetJaizygHQ1do2g++86Tw3DlRwHAN0EDuZXl1yU9qyI6dgB/PWL
	KoOpct5VGcg2CO8nxN//AdTxcyFVgyTnEjp9VT6e31ZMfcqGl42mcJHJTKO+USGooIs8ZpPnS6A
	3U8g1uKzkcpj+yT8z/OaJLmbwL4vOnfRtQiQaQ0XQELsqannWZmuaflyW5VvI+EBo5dobh0KyQO
	0iFSvDPQ1DSzJf
X-Received: by 2002:a05:7301:2a08:b0:30c:ab4f:46a3 with SMTP id 5a478bee46e88-30cab4f48e1mr7122599eec.39.1782709119287;
        Sun, 28 Jun 2026 21:58:39 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f14f8asm27880242eec.6.2026.06.28.21.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:58:38 -0700 (PDT)
Date: Mon, 29 Jun 2026 10:28:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cpufreq: dt-platdev: Add SpacemiT K1 SoC to the
 allowlist
Message-ID: <7x5mgpk3z3aiebifhxto2v7m5yrikj52lwf5pzegzhk5aiehhj@jqm6opm6nrub>
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-1-bba9831f2f1d@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260626-shadow-deps-v4-1-bba9831f2f1d@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_215841_221213_2BDE55B6 
X-CRM114-Status: GOOD (  17.91  )
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

On 26-06-26, 16:10, Shuwei Wu wrote:
> Add the compatible string for supporting the generic
> cpufreq driver on the SpacemiT K1 SoC.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
> Changes in v4:
> - Drop the K1-specific cpufreq driver and use cpufreq-dt again
> - Add spacemit,k1 back to the cpufreq-dt allowlist
> 
> Changes in v3:
> - Add a K1-specific cpufreq driver for the shared-rail, dual-clock topology
> - Add spacemit,k1 to the cpufreq-dt blocklist
> ---
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 25fd3b191b7e..e262394b56f9 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -81,6 +81,8 @@ static const struct of_device_id allowlist[] __initconst = {
>  		{ .have_governor_per_policy = true, },
>  	},
>  
> +	{ .compatible = "spacemit,k1", },
> +
>  	{ .compatible = "st-ericsson,u8500", },
>  	{ .compatible = "st-ericsson,u8540", },
>  	{ .compatible = "st-ericsson,u9500", },

Please take this via arch tree.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
