Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0856C43461
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 15:25:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A2FE206A2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 15:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uyTlYulB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A2FE206A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=igEMV4gOLcDwroKbXuC07Rc1zfdYnCfVzzSuaQX7dr4=; b=uyTlYulBYl1iq0YwXNJtv6hJ0
	A1+3W1K6Dwficg6EyQzjLm6YRggqXdXDL/+m1YMhO/7Cy+SctiYr9MUb22aKUq4969L6PoS6CFCw5
	+meuIGdQphD8xGFPeCMxOo2pJ0Nrxyrmpr+gXHyLvnt0IQp7L3XxlZe7fy1K05cOfPgK34Ezvky7O
	7f/yl4uglt4ZItGhkmafqNiDWG+PviBE31Dp2J+dy/oxYaZ95WGMV67HZZHWHNsYjx6sZzsuxuNmq
	zMWJuWQoYIB9WUi+3FciQ4pRWWNMUyLu0EtKV81oCJEep8gfgQqKdzZMeqClQl19YDesregvJmMim
	Qv6tmKL9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICp9-000837-Pt; Tue, 15 Sep 2020 15:24:51 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICox-0007yB-CM
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 15:24:42 +0000
Received: by mail-io1-f66.google.com with SMTP id r25so4566085ioj.0
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 08:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TQwbsrSpPsblvvewNTAvygU6LX9JkoPG3XT5duFS2B8=;
 b=h+fs8V3caLUM5oquzv0w6AAWFK/hDaD4yCluUixqRtf0TColWVPX81taeKLn/aU3x0
 VmZkPfJqUJz2Agd033k+2NQl5O5iISGE38BuJPZpmBsWge/FqN/TKANCcarxCZRJGxr8
 8X06mBT/V0QCf3zCbvZ89n7BRA4Q8750waQW7JjcT7K5UnJ70MDzXsaMPGKermTk1gaQ
 v6l2vgNYR5L3feRjryv6nO5k3zV7ZBg+gF702S2V3UDfgcxz/LQ1eV1XssgOmS88Dtle
 3eqvq28cqqv4IG/VyUnIwSl4cBuzoL8O58N70LByhVPDTQS8laiBZMm1KmImKqccd8JN
 g+fw==
X-Gm-Message-State: AOAM533r31YgSXVTck05GVOBUc+oLDAFEAcm4zw/ce68HXfmxfbLK82R
 F3yNvz/AbcwVZ7Y+CK0qCg==
X-Google-Smtp-Source: ABdhPJyqKFyTIVHyJqHIrEsdIMGqq15HhgpOa6nWJTDsqIgRo7dmwPY2ATDZsR/bup7/2N61XSAUZw==
X-Received: by 2002:a05:6602:2c4d:: with SMTP id
 x13mr10837671iov.94.1600183478508; 
 Tue, 15 Sep 2020 08:24:38 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id i9sm4609484ils.34.2020.09.15.08.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:24:37 -0700 (PDT)
Received: (nullmailer pid 1973925 invoked by uid 1000);
 Tue, 15 Sep 2020 15:24:35 -0000
Date: Tue, 15 Sep 2020 09:24:35 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: Add DT documentation for DDR
 Controller in SiFive SoCs
Message-ID: <20200915152435.GB1940827@bogus>
References: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
 <1599457679-8947-2-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1599457679-8947-2-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112439_493922_B349F6AD 
X-CRM114-Status: GOOD (  18.01  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, tony.luck@intel.com, james.morse@arm.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 aou@eecs.berkeley.edu, bp@alien8.de, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 11:17:57AM +0530, Yash Shah wrote:
> Add device tree bindings for SiFive FU540 DDR controller driver
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  .../devicetree/bindings/riscv/sifive-ddr.yaml      | 41 ++++++++++++++++++++++

Bindings are organized by function, not vendor/arch generally. This goes 
in bindings/memory-controllers/.

>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
> new file mode 100644
> index 0000000..0288119
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/sifive-ddr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SiFive DDR memory controller binding
> +
> +description: |
> +  The Sifive DDR controller driver is used to manage the Cadence DDR
> +  controller present in SiFive FU540-C000 SoC. Currently the driver is
> +  used to manage EDAC feature of the DDR controller.

Bindings describe h/w not drivers. What a driver supports is irrelevant.

> +
> +maintainers:
> +  - Yash Shah <yash.shah@sifive.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sifive,fu540-c000-ddr
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    memory-controller@100b0000 {
> +        compatible = "sifive,fu540-c000-ddr";
> +        reg = <0x100b0000 0x4000>;
> +        interrupts = <31>;
> +    };
> -- 
> 2.7.4
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
