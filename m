Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A64C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E88420782
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 16:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eNMHK/g7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="aDlbWI41"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E88420782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9VOXN1TNVeS11FUniLgIjph644GwHsyuYWVZJaEX5NE=; b=eNMHK/g7VAOSArFeiapE/EZKG
	IjJ1QGPniDRPQacw4Z5a0k8VjmOW0AM0WtIVAsHeFVT6mscS6W7fkaw+Ds+lU/bFPbDcFA6CHmKo2
	Ww4n1o2MCqDWm801qPRJwVRTe5fbqfunRByOcabhb+Le9D70P9+kbA9hRzSiOg3z/XGQUEyeCx8ko
	/Jozt/tPs0tdsedfT3nil9H12Klef5W2zSG+sKXG4lQW24HUXK6/g3DhLQccPwK6KPMjE776Lhehn
	hjiMk1QegbsN/PH0gZbCRFOg6b9RGGxzN8PF0364i6oW7H73oTP9gRBWb/+sj5le8YW+R3tHAgHl4
	kqXY6UoKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAbPX-00048n-Ns; Tue, 25 Aug 2020 16:02:59 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAbPU-00045x-1M
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 16:02:57 +0000
Received: by mail-pg1-x542.google.com with SMTP id h12so7128877pgm.7
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 09:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KPkLZJgZoXiLJffiihBupgXf4zrj4jokhwZeTXsnTGE=;
 b=aDlbWI41jY6pIx7QLbALlOlZ4VvpjQBnUpX9orTDHefzfXPlapLoMkrMZ01zGUGjk8
 5ahNPY6spEthv1QWrR2y6eWmBHQrMNSONkdxxlTzXsffWrylY9+6K8P6ryiPVZ5WC1i+
 4z/KKPpPw2+JBaAMNJd6/0F8hO4uMJesatg0sZ4G4KGpZvLHTNAJrIMjLsgAEPspW9/V
 F667p0bwmn6FmU5BjKJYD3VnPBir5RlBT8DF/w92lvjhisgnwK9VX0c+gBBptGF/KWl8
 aAR9hrR6lVF4ylWYCyLoToNz+ozfJSwdPXe6pbX1Xr2Mg3ImhrSwbrwNFnWxfJR7L7B8
 ukoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KPkLZJgZoXiLJffiihBupgXf4zrj4jokhwZeTXsnTGE=;
 b=LdYp2Uj74J8y7MbHI94YryFW0QdiV1heDrHkVu/YouYAmNoO3yWibGcQEZTr5BxgZe
 lNK8lyUAygQ30321TAJkIRlaJQZ2pwknIs0ddxVIigZHbmv6UQNpFxTpTHps5PoNRhgH
 KWtRVpwpE9BAs0j8klN2LvTlfSuv3tZXac+Hu7uFN+aPPeZcO/dA6yp9gSoHZBXgcqp4
 yKsTCqzIL24ylVngY3XYUnIaQPg+3BXZwuKo0nINKvFrezKHFnKDdXjz9GI+w1/nFjTk
 x7+pl+SRrueJcpMmRPBHInR6/22guEn+rjnpucMSylKB4q9PtfgtxX2vMW2qnNYrpbId
 DSaw==
X-Gm-Message-State: AOAM531+7Hjfpr7ZTide8DMgMMREYzhWDZ8XQd26Tm2uwlCjysJEXmS5
 MPZNC9UQp1zqwNMn1lJC+bvvpQ==
X-Google-Smtp-Source: ABdhPJwFkVnCpRijagKF/eo1R4lg5/JWfJN9V6X1I79qjxwyzwaRx8jYAPMLkIGwV6qy4eXXe+qikQ==
X-Received: by 2002:a63:4f22:: with SMTP id d34mr7393022pgb.320.1598371372168; 
 Tue, 25 Aug 2020 09:02:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s125sm15564588pfb.125.2020.08.25.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:02:51 -0700 (PDT)
Date: Tue, 25 Aug 2020 09:02:51 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Aug 2020 08:24:30 PDT (-0700)
Subject: Re: [PATCH 1/3] dt-bindings: riscv: Add DT documentation for DDR
 Controller in SiFive SoCs
In-Reply-To: <1598357182-4226-2-git-send-email-yash.shah@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yash.shah@sifive.com
Message-ID: <mhng-45ab2484-537a-45da-8fb2-b19329728caa@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_120256_111323_8664060F 
X-CRM114-Status: GOOD (  19.01  )
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
Cc: devicetree@vger.kernel.org, tony.luck@intel.com,
 linux-kernel@vger.kernel.org, rrichter@marvell.com, sachin.ghadi@sifive.com,
 yash.shah@sifive.com, robh+dt@kernel.org, bp@alien8.de,
 Paul Walmsley <paul.walmsley@sifive.com>, james.morse@arm.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org, aou@eecs.berkeley.edu,
 linux-edac@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Aug 2020 05:06:20 PDT (-0700), yash.shah@sifive.com wrote:
> Add device tree bindings for SiFive FU540 DDR controller driver
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/riscv/sifive-ddr.yaml      | 41 ++++++++++++++++++++++
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

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
