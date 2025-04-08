Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D2FC36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CKF7OuKLRjEn1fATQLHIaYP+1MUHEs116mi/dxgN7Q=; b=y5tFvdn2Ezy+at
	31G+zQQJuK0itxWqO9ONR4zQ9Qd4IGthhDpRJdtYUpUvhsVd5AqxT0sA+AAvBEUrSrOzflwoPHl26
	h4raiS4259qC0H16JQmVTiENvGCwVu4EYEY3kdoQ4rYWEQNS/j9Ws7rlVn90w56eUtGC5aDr7zyBh
	kqONJXARnXfAxz5i7V8VL2HaVKoEru5beMIWDwmD55aKAD33HlISa5c0gLbzyub8c1MEPtAVDwWyO
	DHiAcT98FNY0jadERSNyI9qfuRKjremjD+y+9kgfjuwLpcbDxZP7bmVF7D7Q8kTLZtmkiuHG/00M+
	3+p9y65f2Qdvfh6dr79Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElQ-00000005FoU-2ooC;
	Tue, 08 Apr 2025 19:37:40 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ElO-00000005FmT-1eum
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 19:37:39 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3d4496a34cdso20014685ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 12:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141057; x=1744745857; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=uWonhGAe1IIjBId4MGfCNTGJaZxMXcYFNz81SR39cTDveKTegPb07yHI/gL5gtYVHE
         lg+cbP7LPL74id3k74XIEe06cJd7fPynYZK8IWv4zD7aSdy+uZoc/ufKUs7pMLdxZAK2
         WHf2nxoNsNGQRCLFP9/7ZrWmvEZx2zG+efPRyd69zJOSfs4iaDS8a/ZLpYo2UBOL8SUJ
         iaRX7U7E4+jb/yso5EJLwctXLnIVFjdUotWp4hsRsj/QN//mDK70vwBxC6UYFfn5Otef
         1keGLZqRDWlFCHeKxOHh1/UJbLuE0H+6bSy2OceUzsC3cD9uIM4c7iubccAE0TZcmnDU
         vveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141057; x=1744745857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RqTCyVarb3HOJMAA+PoO2FMbP6+BrxJ4VIEUqNGh+4=;
        b=sQM5q0WJ6Sq74C44YcAE1Lq6KdzEtiPb5xMYhUFiRNCEjDdPN6oybuqRBqw9ywWnlW
         9t4PdtxmqYILg1pVRRvmtFY4hjdL9wQohuAJHONA4tmEeDQWKi1/grRDJbqlIJunJLnj
         3AFPepoucVf8T20+BCdvhmfBk/88rX9cnXrwV0tZvuJ4yB2bHV7q7VD6HWlR5O+hUClX
         I57IrJE4gfmW5f6iUHeRurftOJFZOlTeBxKbEzO413YT4uFH1ifsdH68BQGiFRm6fImK
         xWn2zMMA7Emyg1wKI0QP49L7jc4CsoAKHGpI9Ye7xvp+Uz2Js702U9I9ZoX+n9ysdoqZ
         nVWQ==
X-Gm-Message-State: AOJu0Yyi+YV6AcHwlXpP40IRsX66Garsf2/gquBJfbjJdu3vOGcDkojx
	45naQQm2w0mT7x6cIQkmmWB8QZC/88TGlQc3wLb/0Ya4qXHsTzCoSBhKNO3zajU=
X-Gm-Gg: ASbGncsbZfKDT6Jbxn5hZc65LMum2gmE5D1w1T8PNlQo9RRJ4u1w+CvTY59XRisZR4B
	dcNvBT06Wr9hbzZR2z2xGHk5IKNw41mvMlUZO66eBsA0BE4kD7YZ7N/USEcZkV5f70pZFGd1L2v
	9/+AFSCyGRLpLwD4FWXbIt6Ra/+N5WO0TIQVhFtA43P1D9qPQddrCE6t+SSt3K7Xz5T3H3QXuq6
	YSOIlEz0PfK9w1dKIAHg3KRfPkdDb2F5LjOFaPDlG7vp0Hc1D/WJ7E2HmOjt/PBs3tgM6S2Ohz+
	y7j5KjrK69AcPXgHqeSeIB9M9ekGgMeXSbVpx3qVHruhktP9TV9fptUwdDcUtR5EMgtX+ATXwaW
	bZoj6IAaP
X-Google-Smtp-Source: AGHT+IG7rW/jA34zO9YwR/Uhv4tZyavVt40Io0eZXrFxdcpUtJcFv8zQCXnlCLGlof0n9kin5siP+g==
X-Received: by 2002:a05:6e02:2587:b0:3d5:be65:34ac with SMTP id e9e14a558f8ab-3d776c807acmr2719605ab.2.1744141057452;
        Tue, 08 Apr 2025 12:37:37 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d703c0665esm5904485ab.50.2025.04.08.12.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:36 -0700 (PDT)
Message-ID: <e2c5c2c2-61a8-458d-8e95-521c5ea752f9@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit
 support for SpacemiT K1
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
 <20250401172434.6774-7-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-7-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_123738_447041_B49F3990 
X-CRM114-Status: GOOD (  12.97  )
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
> Clock controller unit, or CCU, generates various clocks frequency for
> peripherals integrated in SpacemiT K1 SoC and is essential for normal
> operation. Let's enable it in defconfig.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>   arch/riscv/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0f7dcbe3c45b..011788d16d93 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
>   CONFIG_CLK_SOPHGO_SG2042_PLL=y
>   CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
>   CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
> +CONFIG_SPACEMIT_CCU=y
> +CONFIG_SPACEMIT_K1_CCU=y

Maybe these could be specified with default values that
are based on the value of CONFIG_ARCH_SPACEMIT instead of
forcing them to be defined here?

					-Alex

>   CONFIG_SUN8I_DE2_CCU=m
>   CONFIG_SUN50I_IOMMU=y
>   CONFIG_RPMSG_CHAR=y


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
