Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60A7C54F51
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 22:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AyzoYi2BpL5Bn4BSS1vLq1oS92qS7Xugrp1pZEzufA=; b=ew+bY2JtlVQLA6
	zvxtmOwmDXbPFbkOU237dusTyHE2AYfQQ/VTwnXZ6GAt6G8lWFEFw8PxSUA6pq8CCoPSRrt02/kFM
	16fZqtC1T93KxCmIIykWjN38mt4ZQdy2ZvxPTn7x4x4kRYlxKPiwuQviJsX4m7nIJnaUuSlBO7adW
	JgUB44Es2ttwQ0W+WwoysJg9cjCpnJEBmVPjJL+AzVC4Ly4tNf7aJfaX7Pzc+CPK7s5cDp5SWibR9
	T0vCiKpTgvl+ajeomjtLDqN5whlG4Mp8tUKTYyMMlEUMyOvh98SVP5/KVf8XJ6joNorlv5Jhi5frZ
	NSrqc1QKT5vYJRbyTTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq4w-00000006OwK-0Gue;
	Tue, 28 Jul 2026 22:15:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woq4t-00000006Ov2-0Vs3
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 22:15:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caed617615so4578845ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276910; x=1785881710; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=LN6MRfresXO0MhQ2vysnkSeGL01MhVKo/QlG9An2TjlPZc2gkFKtTFpCGG9xEhONgO
         O2TdHvTX/cnxwkqJXuBXzJAzP+6vWzKohzY+iZ8ajhbtYKHN5e5uPPsUXuBJzeFCJ9Vs
         rsZ8pt0IDd9UqQFj+oyqKJmvoPWHz6DBkpmENWl1Hbgzr9lj36iEonAeZQSv9XZZjeXW
         2z4ASQ3WA9fNk0F1oQ9j+Ev4/QnudmoKXvQfFjYg6fYlO7nGbwIa4mJGz4joVm9Oa/Ia
         4x3hjniKVz7DMrybYv4FEl+ZEBRnu6R3VY8DYhVBKr7ZWXjJfayHCU1fmpggeW1UQ+V2
         bFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276910; x=1785881710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=MXwhXmwn57yTHRZw75RBZ8BxwtbE0AkhoaVIs0NJde/B8X6f9NZbn796sq40v0+FuA
         J6zT38v2WYDRCAz3Q9auVTz+2d1qy+/n0q0FL5JJNO7CTspFSyCcuwCO0VjZhU637Np/
         q8qf40XSuw1Tm6loUf9NTwUJw+YqUzSP3BI4MIqB8Yx86ZUz1wvDEHp6DY77nrOZXXRd
         uEcOZuXQpelmsHjszTkNCCU+JV3RUfKakhGWioE2c7hcO1gCckp+bQNR9rOfNDqBPcd2
         Ebc9qr0o+ti0drcueXP2zPgsUSv4KWLtThWGSWE6tJH4OXNTTWcA3Y2McEEcCw/lIu+M
         fc9A==
X-Forwarded-Encrypted: i=1; AHgh+RovL9dZRZXmH+fXE7ipBm9//0mc7DzbhuI/1F9G5exKaUF8XhzNODXfY94zH4K9phUPvN8CeDgBn2ICyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8+19Lr0YfBC9bwJtQJPczuDVzEBX/4HzCd3DAdvQX8nRDJglR
	z2LxmzZX6r12BGFXfPlxL0ot3j0biP2btQvxqf4gF5ArkxMBq+g0Bhl7
X-Gm-Gg: AR+sD12QQABdF6JPkOZe7QYYsuX9Cioi//wbjepCs9Bqb11gBw4mKm3bLCyR2uCbRaY
	TYY1dwx3hD9JIMIfCWm4uN4/dd04CQEO/Qie0PTRsISYslkCyF4UqWv1zpDwgY3CLmEq2XZimi3
	l5A/KtxilWeECzPQy0YCMvV6l+UC4RSMXwanO2hyJvNGCOD0Y78U11KnlUtmnUBLi0v4oTou4vb
	FTOfolkJwUE5KnUXBB1+/j3wPJMTaEz9ySZ+qH3OZy65pAvcQ/Zg6jm/kqyovTBUNsQIPQ541RY
	P1MLYv1ZJChvhZ+sDyIT0B4dIDJSrll3W4f0ZCl5z0LOdIOIrpbiRxmCPJ6zbuRNqQGCXWwjhbC
	6lluqhXmHPHwSYwkTQvBvHfCxSg299ck2CbXbtIuHJe92sPDVs/qAK+gcp/OFBNW739YwuSL4Rl
	12fFdqmqmlIRXh+p28GWmcyd6nPJUwIIu4nvkR3pvycYQXIg8JPCRLW2u+7vs=
X-Received: by 2002:a17:903:4b46:b0:2cc:a853:1311 with SMTP id d9443c01a7336-2d015eddc78mr55167005ad.47.1785276910228;
        Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a18abasm2246025ad.5.2026.07.28.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:09 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:14:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 5/7] irqchip/aclint-sswi: Add generic
 riscv,aclint-sswi match
Message-ID: <amkprTVtjkRVEo7G@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_151511_394034_77C861A3 
X-CRM114-Status: GOOD (  14.51  )
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

On Wed, Jul 29, 2026 at 12:36:31AM +0800, Junhui Liu wrote:
> Add match entry for the generic "riscv,aclint-sswi" compatible string.
> This allows future SoCs with standard ACLINT SSWI implementations to
> directly reuse the driver via the generic fallback compatible (at least
> until hardware-specific quirks are identified).
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/irqchip/irq-aclint-sswi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> index ca06efd86fa1..2bd40c3ea288 100644
> --- a/drivers/irqchip/irq-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
>  }
>  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
>  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> +IRQCHIP_DECLARE(riscv_sswi, "riscv,aclint-sswi", generic_aclint_sswi_early_probe);
>  

Again, use vendor specific name for irqchip declaration.

>  /* THEAD variant */
>  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> 
> -- 
> 2.55.0
> 

Reagrds,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
