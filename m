Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2AAC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 21:22:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C8860FC1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 21:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0C8860FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzwM3pPm57EXh1cdwTfZUGTLNr10rAwVXvkgkt0p8mU=; b=CeJHfaTtaFp13v
	84tb+dVyFUnENTetGrylPE0Eft0oeP4V2jTxrENFeQ0Gw879Igmfes73nxm2+Hbi9VRmThjCi1Sq5
	P2CttveJx+ohp3jC82MaK18+MZ5sI4h/y136oxxpXMrePLMWmFuuTDl6UZcNLAR2NTnxf2PUvjCfe
	s21F0TNXVO0FiU5lcCpTI7p1JgTYoH/aF1m1H+yzRkkya8gfUI/nrgnt2QI98XrrFRDXTvkdZO4zV
	6rvQDkEBnhys9Dc3OXG0cS7lgPHCJEcr8owByrHZVA0Vh76sgLs/4sr7kGjoaVQUuHfXuMHUmY4CT
	34uDmI9Rt6g4oSJiYc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1me1zd-00BzXo-RX; Fri, 22 Oct 2021 21:22:25 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1me1za-00BzWr-F8; Fri, 22 Oct 2021 21:22:24 +0000
Received: by mail-ot1-f42.google.com with SMTP id
 d21-20020a9d4f15000000b0054e677e0ac5so5890415otl.11; 
 Fri, 22 Oct 2021 14:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CgddvVUw2mXha4aQsq+joAmwB7SJYgDFFKT+so5ZqWc=;
 b=0tZqb/Mu3aAzrwBVw5auAAQo4rGQQG+WpfAmnVBh0wLP748Q4Axt7QI5ElKsECj0aA
 6Zn0Ohl8H5RUa1+Fm0QeTBEhI4DZ9HBxB4203ZU2kf+2OefsqUduYVTURuxBHkYR4mpJ
 HJYNGyHQyvVOzpBuZ7YP9+v00cLom3WTaiHRw0r3UDJvSE4V8CIqQTiogOqtxrbyOgPp
 h183cnCSUcC72AI4IOL8kQRerAgE4tyrAqqbRs6CevhqF/jTE3lponoeoXwAhaiTrCTV
 vN5Z0Qd+DC4+ZSIP0Oz4P66FZ+LU2PyszmgBqo0ToL9u3TlZsikDk21VEFfg7N0ipIpG
 8gWw==
X-Gm-Message-State: AOAM530yLO+61x6ZDQnmuRjMFQByUC0g3puiLA5zpXxZM3xww+k0jbAH
 OjToorqiQgYiHYj/m0/DGg==
X-Google-Smtp-Source: ABdhPJy7J9nmIVAe1bK/WZgWHoAJVBT7jB213B2rYjuD6+bYmXBfbpTY0lKSrdEPyaGLpGGsaIT6/w==
X-Received: by 2002:a9d:d52:: with SMTP id 76mr1825166oti.350.1634937739427;
 Fri, 22 Oct 2021 14:22:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d7sm1858976otl.19.2021.10.22.14.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 14:22:18 -0700 (PDT)
Received: (nullmailer pid 3192660 invoked by uid 1000);
 Fri, 22 Oct 2021 21:22:17 -0000
Date: Fri, 22 Oct 2021 16:22:17 -0500
From: Rob Herring <robh@kernel.org>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Bin Meng <bmeng.cn@gmail.com>, Xiang W <wxjstz@126.com>,
 Samuel Holland <samuel@sholland.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 opensbi@lists.infradead.org
Subject: Re: [PATCH 1/1] dt-bindings: T-HEAD CLINT
Message-ID: <YXMriYWcOcgJSpKj@robh.at.kernel.org>
References: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020093603.28653-1-heinrich.schuchardt@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_142222_540766_F4CB9F42 
X-CRM114-Status: GOOD (  26.78  )
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

On Wed, Oct 20, 2021 at 11:36:03AM +0200, Heinrich Schuchardt wrote:
> The CLINT in the T-HEAD 9xx CPUs is similar to the SiFive CLINT but does
> not support 64bit mmio access to the MTIMER device.
> 
> OpenSBI currently uses a property 'clint,has-no-64bit-mmio' to indicate the
> restriction and the "sifive,cling0" compatible string. An OpenSBI
> patch suggested to use "reg-io-width = <4>;" as the reg-io-width property
> is generally used in the devicetree schema for such a condition.
> 
> As the design is not SiFive based it is preferable to apply a compatible
> string identifying T-HEAD instead.
> 
> Add a new yaml file describing the T-HEAD CLINT.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> @Palmer, @Anup
> I copied you as maintainers from sifive,clint.yaml. Please, indicate if
> this should be changed.
> 
> For the prior discussion see:
> https://lore.kernel.org/all/20211015100941.17621-1-heinrich.schuchardt@canonical.com/
> https://lore.kernel.org/all/20211015120735.27972-1-heinrich.schuchardt@canonical.com/
> 
> A release candidate of the ACLINT specification is available at
> https://github.com/riscv/riscv-aclint/releases
> ---
>  .../bindings/timer/thead,clint.yaml           | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/thead,clint.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/thead,clint.yaml b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> new file mode 100644
> index 000000000000..02463fb2043a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/thead,clint.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/thead,clint.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive Core Local Interruptor
> +
> +maintainers:
> +  - Palmer Dabbelt <palmer@dabbelt.com>
> +  - Anup Patel <anup.patel@wdc.com>
> +
> +description:
> +  T-HEAD (and other RISC-V) SOCs include an implementation of the T-HEAD
> +  Core Local Interruptor (CLINT) for M-mode timer and M-mode inter-processor
> +  interrupts. It directly connects to the timer and inter-processor interrupt
> +  lines of various HARTs (or CPUs) so RISC-V per-HART (or per-CPU) local
> +  interrupt controller is the parent interrupt controller for CLINT device.
> +  The clock frequency of the CLINT is specified via "timebase-frequency" DT
> +  property of "/cpus" DT node. The "timebase-frequency" DT property is
> +  described in Documentation/devicetree/bindings/riscv/cpus.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const:
> +          - allwinner,sun20i-d1-clint
> +      - const:
> +          - thead,clint0
> +
> +    description:
> +      Should be "<vendor>,<chip>-clint" and "thead,clint<version>" for
> +      the T-HEAD derived CLINTs.
> +      Supported compatible strings are -
> +      "allwinner,sun20i-d1-clint" for the CLINT in the Allwinner D1 SoC
> +      and "thead,clint0" for the T-HEAD IP block with no chip
> +      integration tweaks.

T-HEAD uses the same versioning as SiFive? If you use version numbers in 
compatible strings, the numbering needs to be documented and correlate 
back to the h/w design. See [1]. IP release numbers for FPGA IP for 
example. What it should not be is the binding author making up 0, 1, 2, 
etc. versions.

Rob

[1] Documentation/devicetree/bindings/sifive/sifive-blocks-ip-versioning.txt


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
