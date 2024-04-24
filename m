Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5ABC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 10:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=87u+gfJUCCMJoDEk/d/UV/qAeaLbSI8XJ8PFr6Xai18=; b=Atfoqy6qBq0rcMHPSArcIyfW0X
	3YbBWYu0RG32qsky67M8rC5OCemGYGNpUDdw47YtX2Rt4iu/8smmwrn5d17OcauHPPszOffJ8FKDc
	qtGHPvASb7C3kS60lPGW9Pw/0/3TOfYhgX92ESTOJ6L0utDBu0DbtWRx+PWnI92HNWqVBsJ9eypUd
	IuB0VV3I1N9jnQJM/Q3PpHjETGvz5fMMA62Mzc2t/m0eMSEMUW2IR69awSTKZckDzyEZu75gdJ1BB
	St5JeDQqy5ezoeTZij8nnJ92m2j712CqACvBzSGgCqAA6tUNvckM3kgeEDb0eKQDtUHWTvlwYzhkK
	t/blKlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQ7-00000003bJP-3pDw;
	Wed, 24 Apr 2024 10:00:07 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZQ3-00000003bIJ-4AZr
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 10:00:06 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 34EE13FE10
	for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 09:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713952796;
	bh=S2dZSeR9LCzi8J1OpoztZzAdz+9TX12tp6NKUBGWijE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=WEadfsC76zjEwReLrXF4EdNY6e2KqKdUpvYwl497JQ+VkN/NdEmR6Fu+PI61JStRB
	 znZuObYg7RuRexz2sRUM/dK/P/fcR3pe5s/f4QibPzQaLPEXTYYMsvOjIWE66wVZGH
	 L/8qClmTE09I2t84OVf85/Osmk1B+7+cosjTrvrpX0IzeJ1sikt/UfC+XAQZsYxcl1
	 PpsdEsY7GcFudoimv+YNCpp96UbdWeP0V9z11hu1Xsa2EuZxMCMZGi+w2ILiF2DHR9
	 /pOSnHnKsbvHod9nNWoxKeFrGU9A8RN5RCFzCZcpGLQ3XOl4sqlVtvDOfBUf+qjHIG
	 rhKECOjnZsCiA==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-43a2a23190cso2724351cf.2
        for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 02:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713952795; x=1714557595;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2dZSeR9LCzi8J1OpoztZzAdz+9TX12tp6NKUBGWijE=;
        b=xI8aBcUeFAtsaRr+SGxHbYMCXW8FJDfu25mMcu1W0j22Y4wavl0NDwFOYhUwra7Qzo
         /Vky4gL/JH4QOWkbqfte7fY97jxWItUpZaoTrHiwhtKgxbb/r7ITPPTzvEWQ1gu1hHNg
         zlgEjHiGjkLbeuVXgLAQl31rXObMFi6LBdM8ClSudEQWQW3PBkuhOqE3XGLt/7iewJEN
         txgATSjTSGH9M9+MFdhms+oNSEhTk2ktktjFRYyVv8vOGGruha0CEc9OE6keQuykV862
         tXE/pNQzHGC3xQNi4gT9Ekl016JT/FyBcttQIhg+p/unr/sJx2QtymTfxKz8m/0RtHJA
         jG8A==
X-Forwarded-Encrypted: i=1; AJvYcCWK31LVnbRgNPF/ImzoMaDNuH1EwwVYtCVfhrzJt3FMe57C10GBbERdK/0PCprqCwdYEl64XTLwyZ9Eqk1wgSG0hfYS5BO+k5rHyEnUnzGW
X-Gm-Message-State: AOJu0Yz6OuoEW6ibX2JFvoia55E93m6JmSPOJdeDm5A0f0w0m/R9fl4w
	sXWmDYoJgm8PTVk9buwKGVnbZPU8vZJKoJn6ABx7ZvoKTlJAOA0sPJj6TTuMoLa4Bp4+zw5Inp4
	T7p8yqqMZ32EahdXZrPLdQwMxExg+3aoVv1Zy43oRrIaA+gHup3wnwmEjU6n5CHOdjI1HX9cUlO
	ZlEMz5u6ajaEgPZa4AM6mhqEvJtfKrnLekilMRPf7SYQL+Bk3asY1Pr2J4
X-Received: by 2002:ac8:5fcd:0:b0:439:2dd2:8c29 with SMTP id k13-20020ac85fcd000000b004392dd28c29mr2632663qta.53.1713952795218;
        Wed, 24 Apr 2024 02:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6L8U6dPY+IwDuihju7OczEcUyPW0NUseAoFBQBuD16x08m9IflcpytSNV7vfl8H2u2zH90ZPc/+Vym43bEtQ=
X-Received: by 2002:ac8:5fcd:0:b0:439:2dd2:8c29 with SMTP id
 k13-20020ac85fcd000000b004392dd28c29mr2632629qta.53.1713952794863; Wed, 24
 Apr 2024 02:59:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Apr 2024 02:59:54 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
References: <20240424075856.145850-1-joshua.yeong@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 24 Apr 2024 02:59:54 -0700
Message-ID: <CAJM55Z9hObw7T=Z92w_5pYVcuR3UDW-Mas5YpCoGv4Y5s5M9xg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add StarFive's JH8100 StarLink Cache Controller
To: Joshua Yeong <joshua.yeong@starfivetech.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, conor@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, leyfoon.tan@starfivetech.com, 
	jeeheng.sia@starfivetech.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_030004_470354_7E38CB55 
X-CRM114-Status: GOOD (  12.17  )
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

Joshua Yeong wrote:
> StarFive's JH8100 StarLink Cache Controller flush/invalidates cache using non-
> conventional RISC-V Zicbom extension instructions. This driver provides the
> cache handling on StarFive RISC-V SoC.

Hi Joshua,

As far as I know you didn't tape out the JH8100 yet, and you seem to have
replaced the SiFive cache controller with your own implementation. Can you
exlain a bit more about why you didn't implement the perfectly good Zicbom
standard instead of adding yet another non-standard work-around like this?

/Emil

>
> Changes in v3:
> - Fix code syntax
> - Link to v2: https://lore.kernel.org/all/20240423072639.143450-1-joshua.yeong@starfivetech.com/
>
> Changes in v2:
> - Change patch title from 'Add StarFive's StarLink-500 Cache Controller'
> - Remove StarFive alternative from errata framework
> - Fixes warning from https://lore.kernel.org/oe-kbuild-all/202403151625.boKDjHGr-lkp@intel.com/
> - Flush completion through atomic timeout function
> - Link to v1: https://lore.kernel.org/lkml/20240314061205.26143-1-joshua.yeong@starfivetech.com/
>
> Joshua Yeong (2):
>   cache: Add StarFive StarLink cache management for StarFive JH8100
>   dt-bindings: cache: Add docs for StarFive Starlink cache controller
>
>  .../cache/starfive,jh8100-starlink-cache.yaml |  66 +++++++++
>  drivers/cache/Kconfig                         |   9 ++
>  drivers/cache/Makefile                        |   5 +-
>  drivers/cache/starfive_starlink_cache.c       | 135 ++++++++++++++++++
>  4 files changed, 213 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/cache/starfive,jh8100-starlink-cache.yaml
>  create mode 100644 drivers/cache/starfive_starlink_cache.c
>
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
