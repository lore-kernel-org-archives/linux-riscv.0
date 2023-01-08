Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB55EC54EBD
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jan 2023 21:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OyHL6+51et3BV0zMefz9ZnRhGeM+RWb2jT+jv5023Q=; b=SDAsv5Yw/XXLpL
	WvgwrhPf6jvuHnUWb91qdbPKcS5VCCMhbvh6zB+j1nfbNaScwHOdIGsrSqCeyhLBzjflGBw91O3rd
	/sgBP7zh5UR2VJaogMZHPaZ98DHEDaDqyGDdqcw33JhsM9yMYNkmB9jSQOQALDt6U7whb8UpA0d/T
	JxVrwDRhmSvgcGeREm3/hSxp/raDQNHygVm8LmdUNWM4wz6uv5RS1IXy9Oo8KE3iikPrS/mxUDdJh
	XbM7z1P46YvbMXDBeOctXZ8e/0/EgbMHKdaFlGzIjr8Mi3hme/nB3DfG/YiRinu20LaHX1KnevcNm
	s8sYtM9TgI572Wz1y03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdXD-00FvhZ-2E; Sun, 08 Jan 2023 21:48:55 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEdX9-00Fvgw-S1
	for linux-riscv@lists.infradead.org; Sun, 08 Jan 2023 21:48:53 +0000
Received: by mail-qv1-f43.google.com with SMTP id j9so5062539qvt.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jan 2023 13:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doqDUNC8qP8MatRZPOWaIbEXI6pyG66qGtlsOqIvLa4=;
        b=dOtqqTryrSkrFYYEmiX0KqbcPpIIBxVf4pFS+xby5WJlo2Uk2Nm/KgVwcJ7FJvoorY
         cF4NWqWKIZiOuES8MtwZGcG09JHd0Mlhar9kAtvmXtdrvJJc3mMKnOh4XiMpTtW6Jbf4
         EVw2duoGX8eTa/EeuQ5jcOKyxNZ3BX1ZoqEcxXJ5/+vA2aSVan9rGm2FoXoKxlU/onHI
         +0vtOo1Revg3VyldN1KBz0wAY6cy3j92lmVQkf9ue7WreBJHOJG744JEulDWFr87mqH7
         furBHbaef4orLoJg8PaeuHZwVsnJIRB+jFUrbwaM8ZPL+HJfy68jDTF6uRBiHtAXv4Wu
         d8bg==
X-Gm-Message-State: AFqh2krKu5UuUHw4foWxdxgc4nvBl57bKULbQ4T3mdfuwCKjtCVeXXt0
	0kY6mfH11ELWZeSWqWP3gQ==
X-Google-Smtp-Source: AMrXdXuJK76yoUULVOufb3h+H7dZYcnVxyHRRL8gez4abYicxWTNDCrS40HwAyq8xawVU3SX6+vCZw==
X-Received: by 2002:a05:6214:3302:b0:531:bde2:365a with SMTP id mo2-20020a056214330200b00531bde2365amr41642578qvb.7.1673214530049;
        Sun, 08 Jan 2023 13:48:50 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80a5:9b51:39ae:24d1:33f3:811e])
        by smtp.gmail.com with ESMTPSA id w29-20020a05620a0e9d00b006fcab4da037sm4277502qkm.39.2023.01.08.13.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 13:48:49 -0800 (PST)
Received: (nullmailer pid 325297 invoked by uid 1000);
	Sun, 08 Jan 2023 21:48:46 -0000
Date: Sun, 8 Jan 2023 15:48:46 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, palmer@dabbelt.com, devicetree@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-riscv@lists.infradead.org, Alex Shi <alexs@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Yanteng Si <siyanteng@loongson.cn>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: move cpu-capacity to a shared
 loation
Message-ID: <167321452534.325217.3239534782123890748.robh@kernel.org>
References: <20230104180513.1379453-1-conor@kernel.org>
 <20230104180513.1379453-2-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230104180513.1379453-2-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_134851_947653_4926391A 
X-CRM114-Status: GOOD (  15.10  )
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


On Wed, 04 Jan 2023 18:05:13 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> RISC-V uses the same generic topology code as arm64 & while there
> currently exists no binding for cpu-capacity on RISC-V, the code paths
> can be hit if the property is present.
> 
> Move the documentation of cpu-capacity to a shared location, ahead of
> defining a binding for capacity-dmips-mhz on RISC-V. Update some
> references to this document in the process.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I wasn't sure what to do with reference [1], but since the property will
> be the same on RISC-V, I left it as is.
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml               | 2 +-
>  .../devicetree/bindings/{arm => cpu}/cpu-capacity.txt         | 4 ++--
>  Documentation/scheduler/sched-capacity.rst                    | 2 +-
>  Documentation/translations/zh_CN/scheduler/sched-capacity.rst | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => cpu}/cpu-capacity.txt (98%)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
