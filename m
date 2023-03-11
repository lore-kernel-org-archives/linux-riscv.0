Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D040DC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69JWVkIO6VxW7JNVhkEWAU/ClYPHJ3pKctiZUYRzg0I=; b=nIvXaVn9toRnUD
	JdpadUiViMEuWTUUPITC1VK0r7v+xElg1sPptu4BPCqbIPEXmQsiQPYl03OZ0W5kkbWxzV3yxPlMI
	HQGVm99O5yAjScswphDxZg01Jo5xI2TrqQa7uscEB0T7BTddaIKc9m5IucOdQdwBpIoDmpkcSdvri
	0GRfqX4niZX9nLoh0YPObgFWu+n0EUFxgRLqnHKARM4s9MFf+o7P9ZSoph8cuuqITlb9/jtI86tBs
	a/Vpmiib7OWZpQ36VSJvFkdgV1uifUlOpb7ayCDjljsoeDpIqyjG66wPLAk53XyLeLHcwhSaeQrqB
	FbQq8MdJ+R2pWdkaVxsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb033-000iEI-3z; Sat, 11 Mar 2023 14:18:13 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb030-000iDg-ME
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 14:18:12 +0000
Received: by mail-ot1-f41.google.com with SMTP id e9-20020a056830200900b00694651d19f6so4476447otp.12
        for <linux-riscv@lists.infradead.org>; Sat, 11 Mar 2023 06:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XV/mrDBGKbRUqTXikDz3w8VFKTgqnuQ8vz5vXQLzCt4=;
        b=XEQj+YGX5E9JSRAGvQiSm4aBeJ5o89zzqpf6C4OeDO4QwHXu7CiuTlRkhbjSPP1WJH
         BuMAWX/HX/Fwrtn1K+48NN+t7cvlFfYhmfxD7mNwJRPAbCC6fVM+OGcgmWZz6No616Rk
         Qq6MSEIcPu+7X1qxJYVWDuNj6RqEk7jO4BB9VlatkxvmpAVNdorBkrIsC/rKg0uTWYou
         d4+IhjolX/yXub7dCrcm5MyAJc8gHicU9X2jNxxUyFe+giJBUjmyF6moPN6JESVuKemE
         Gqalf5z7jklOnC8Y6qE/q+HbCcMOVRtyilEnHvsg7ACkblL9JFMDEEpJvH5JS9t/jLnA
         8Nfg==
X-Gm-Message-State: AO0yUKUnDeYB9OW2I7ULXIQPvqbj0LcgHfnYDkUrftEZX+bQdV5OflMm
	mdRNDF7vCuQk1dDfA2NfkQ==
X-Google-Smtp-Source: AK7set/I2cIlMz9mjzMsoaRlf96D2re3kZv70KnZkmskujOeyOmASWokfFmrMBBd5MHvRaSiMvy+MQ==
X-Received: by 2002:a05:6830:2b1e:b0:693:d8a3:1816 with SMTP id l30-20020a0568302b1e00b00693d8a31816mr18572913otv.16.1678544289266;
        Sat, 11 Mar 2023 06:18:09 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f1:6fdb:8060:4df8:4037:6d6f])
        by smtp.gmail.com with ESMTPSA id t9-20020a056830082900b0069452b2aa2dsm1172512ots.50.2023.03.11.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:18:08 -0800 (PST)
Received: (nullmailer pid 142278 invoked by uid 1000);
	Sat, 11 Mar 2023 14:18:03 -0000
Date: Sat, 11 Mar 2023 08:18:03 -0600
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 12/21] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Message-ID: <167854426637.141815.17209731765325744156.robh@kernel.org>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-13-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230311090733.56918-13-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_061810_933622_7A133612 
X-CRM114-Status: GOOD (  13.46  )
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


On Sat, 11 Mar 2023 17:07:24 +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add bindings for the always-on clock and reset generator (AONCRG) on the
> JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-aoncrg.yaml         | 107 ++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   |  18 +++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   |  12 ++
>  3 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Reviewed-by: Rob Herring <robh@kernel.org>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
