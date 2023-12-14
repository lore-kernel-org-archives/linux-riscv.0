Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB97C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 16:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvuhR3dRfG+1YS3EUDZsQiXGpkOP4nBdGwEO/CUmOtE=; b=OJQKkw4dPPHrRs
	4Sh1E8UxcJ0GdZ8mw6ZQ+OjLVb3mZWHi0YizH24alSSanNY5zCl3jIyqWeoW/f14Gxl32sE90nVwt
	L6/3MCRe1MulYJk/7zPXLDc6eK5oK1/pZgAmITy7wEiGQ+8Aa/Fz3cvwdHOMNE6riTLZx8wG8Stcr
	AClqvD4eui7w3g5lRTjqfz1vkkb5cIc6lb4gRnwA5M/SOPE+VJ2XdzpMw8FV4zs9RxhSg7nYNFSNi
	93YP9azBmkX6/bSso/Dael6Kr4/lX0D/Q/rv10vuH3HaflJiaPnjXGYIbD+bNztmOCuAeyLOAdIhk
	T59kZY5vmccNhbXyewKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoaf-000nhc-1a;
	Thu, 14 Dec 2023 16:29:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoac-000nge-2y;
	Thu, 14 Dec 2023 16:29:36 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40c6736d10fso4882335e9.1;
        Thu, 14 Dec 2023 08:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571373; x=1703176173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YzQGVhzK9qgzTVRhSljpGjlLUwC8cdffhqMfyCAFf7I=;
        b=Q2n7njDtR2NjKFAxmC5EYfAtU5gw42rshIjuZ25IL8Z2V8ebIZYxrhukAb9y+/OGFr
         3eqJR9+KFKqzac8bLNVR4Sl6IXI3NT48SqbgYr5QUZWiaUqShTf0QIPnpaj1a9OJmiTz
         DKUoRzELRYaJIRlyzlTTZEY3SXXPPE0S3Og0onXwV5KzWG6B9jUJ+719e0Ey0KOtlKh3
         SnQ7cDnO0fGvFbIkhxlq84IMhzDVwIa3GFjDDvq/bZ3DD5LUHc6GZcnezf3JdA08hrc4
         d7BPH3JKicIia6ndaLLqffkgYXaqp7JRJyTmGjvtJTUxQ979zMrygnVNt2D+yXkCuXrX
         jWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571373; x=1703176173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzQGVhzK9qgzTVRhSljpGjlLUwC8cdffhqMfyCAFf7I=;
        b=a08Cv31bLMrOWRfbxRWhJvE7s+oDGDyLc3DllZ6vdVnRujQRLZ2moUqOAIH4RVmYGs
         faB3So7XwqkYIKUnE6RUgfRgWPtEQn4AS8Q61LbypBF+LKul9/6ySIhrMPdGw1ZlzG0w
         mcCOqGv8xi24dqRui9LwVJhjxIQIV+GwRl90l2Fmvbus4HyNs3yAbdm4Lz6yk6hKduW3
         J5typ24C52fCYAYBEj22mvZyfleS3Zl6exNPO056934tBm+/gf/+Ka1hJI6xz96TansT
         +pSNnzRwcMqzZF1wX3VHpZ2W9b4sJ3nYfMog+rrOnGcUDI4iUjhQ+hrUITrDF+lx8zpB
         UkoQ==
X-Gm-Message-State: AOJu0Ywux7nX1fcw+XgEokZwuzR8Mv+OiOmCyz7CPurecY4M/QX7zxV+
	c57tMcjRXS/7TXrzWf9ZRps=
X-Google-Smtp-Source: AGHT+IFN5ZJPrgJWQSUN0ieEOEfcOtwuEvWwJAPclnmbsShFkrfXSYtGFxx2cJxfVHSsuqkS0Ivihg==
X-Received: by 2002:a05:600c:d1:b0:40c:26f4:dda9 with SMTP id u17-20020a05600c00d100b0040c26f4dda9mr5404229wmm.187.1702571372498;
        Thu, 14 Dec 2023 08:29:32 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b0040b3515cdf8sm25377092wms.7.2023.12.14.08.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:29:32 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Brandon Cheo Fusi <fusibrandon13@gmail.com>
Subject: Re: [PATCH 2/5] cpufreq: sun50i: Add D1 support
Date: Thu, 14 Dec 2023 17:29:30 +0100
Message-ID: <8351928.NyiUUSuA9g@archlinux>
In-Reply-To: <20231214103342.30775-3-fusibrandon13@gmail.com>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214103342.30775-3-fusibrandon13@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_082934_954884_4898212C 
X-CRM114-Status: GOOD (  15.38  )
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

On Thursday, December 14, 2023 11:33:39 AM CET Brandon Cheo Fusi wrote:
> Add support for D1 based devices to the Allwinner H6 cpufreq
> driver
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> index 32a9c88f8..ccf83780f 100644
> --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
>  
>  static const struct of_device_id sun50i_cpufreq_match_list[] = {
>  	{ .compatible = "allwinner,sun50i-h6" },
> +	{ .compatible = "allwinner,sun20i-d1" },

This is not needed, as there is no functionality change.

Best regards,
Jernej

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
