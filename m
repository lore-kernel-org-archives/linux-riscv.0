Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE22C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B707A61247
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 15:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B707A61247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NZS0CXgw7xeVIu15K8HhTlwxz+/YT5XjTHff7xCMfY=; b=z0culsq1Oomk+z
	AJRDl41LmJEy4piQbMS84EKd8A7LRS1GINDDt4uTb/P3m7uRC4yA0l4Y/OuH3R9hnPW19C8CCYGhD
	5op3+A7zkIh2wp/KgGE/Xp/0V7Jf9g9JPjZoUJLwE5ft/YB+AfxlhGvj/PskK2Xvy/RiZK0OWyea0
	qqkliOfZqljn57NCWysrp/aQouiVAGI5H00FLivhyM5lF2XBBOeVT5BAmRKzI7Dw45w/yHXdY++9S
	Rv7J4+jIsZr0ysefYWMrDNmd9bky41LseXrIpaEwR7J0vegN/VlxGitssSoZCUg33c0WwL6u2BmSh
	Aj2MLleFIqj7IRKOc23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQAhm-006I6r-0V; Tue, 14 Sep 2021 15:50:42 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQAhi-006I4x-78
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 15:50:39 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 g66-20020a9d12c8000000b0051aeba607f1so19126474otg.11
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 08:50:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnTeP9MXgZMY0ccObwY7v7BGqeBnLTs9n9kuMAleLtU=;
 b=BebDfSO/3Py5MmSLwzgaO5ySnQt7/XpYRbChsb8EkfpKRh43hh6RQR9xCAKzzOoO8E
 oYBbh+Vw5X1e/e9u475KLpOS87F7GwN/t4O/vsHizRqpKjJ7UxTDQGI3pyZQN1AlOT8X
 hOh6lvZOIjdYOrR/ePj58I3zWrqMiIpVy91GVLmXTcwJzP+YRodyzvl9FxVpnWWnR1qs
 twgGLM/8rjCdNKqWlbl+P/ajTQKeRbFRzKFuECBiS1+KQDd8cRuKJNTqPTdOvwysSBSQ
 vppcO5t8GCLNvbXHUHQTB9me5tVEJhh3QXTGs/tDoEKod25mN1j+sSaUvemqh2hvXinG
 rS+w==
X-Gm-Message-State: AOAM532DMVR4w2/JfNk1xoYwWB8UMTiY5UrU6llXvdntI1JOF7RKpE0/
 k1jvB1i1HIoZb1IYKV3bkg==
X-Google-Smtp-Source: ABdhPJyt6EAx6ms2TgwhAmHferJKtGDUssDln1uxGGEcAReE4RxZo6WxwJ5mhvyQn7pkyGrkHd3kuw==
X-Received: by 2002:a05:6830:4124:: with SMTP id
 w36mr15592836ott.72.1631634636081; 
 Tue, 14 Sep 2021 08:50:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id a13sm2726549oos.4.2021.09.14.08.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 08:50:35 -0700 (PDT)
Received: (nullmailer pid 3462681 invoked by uid 1000);
 Tue, 14 Sep 2021 15:50:33 -0000
Date: Tue, 14 Sep 2021 10:50:33 -0500
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, devicetree@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Jiri Olsa <jolsa@redhat.com>, John Garry <john.garry@huawei.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [v3 06/10] dt-binding: pmu: Add RISC-V PMU DT bindings
Message-ID: <YUDEyYQvjCo83h5B@robh.at.kernel.org>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
 <20210910192757.2309100-7-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910192757.2309100-7-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_085038_310764_456BCC3D 
X-CRM114-Status: GOOD (  19.74  )
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

On Fri, Sep 10, 2021 at 12:27:53PM -0700, Atish Patra wrote:
> This patch adds the DT bindings for RISC-V PMU driver. It also defines
> the interrupt related properties to allow counter overflow interrupt.
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  .../devicetree/bindings/perf/riscv,pmu.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> new file mode 100644
> index 000000000000..497caad63f16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pmu/riscv,pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V PMU
> +
> +maintainers:
> +  - Atish Patra <atish.patra@wdc.com>
> +
> +description:
> +  The "Sscofpmf" extension allows the RISC-V PMU counters to overflow and
> +  generate a local interrupt so that event sampling can be done from user-space.
> +  The above said ISA extension is an optional extension to maintain backward
> +  compatibility and will be included in privilege specification v1.12 . That's
> +  why the interrupt property is marked as optional. The platforms with sscofpmf
> +  extension should add this property to enable event sampling.
> +  The device tree node with the compatible string is mandatory for any platform
> +  that wants to use pmu counter start/stop methods using SBI PMU extension.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - riscv,pmu
> +
> +    description:
> +      Should be "riscv,pmu".

The schema already says this.

Just 'pmu' isn't very specific. No version to attach here?

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +additionalProperties: false
> +
> +required:
> +  - None
> +optional:
> +  - compatible

Besides 'optional' not being the in vocabulary, 'compatible' is never 
optional.

> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    pmu {
> +      compatible = "riscv,pmu";
> +      interrupts-extended = <&cpu0intc 13>,
> +                            <&cpu1intc 13>,
> +                            <&cpu2intc 13>,
> +                            <&cpu3intc 13>;
> +    };
> +...
> -- 
> 2.31.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
