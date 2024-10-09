Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AF7CED60E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwCoPD7f95TE7kjXg05ijhhbD2WhTGIVco2j40R3ySU=; b=CFjq8LGKJQF1j3
	jU6BKPSkmpDXefz/+ZR/cWeDWuf2QOuSL3ZCSV6kQhAbjCQgDW88Ql81WZcuW54On7ryAsnwcX+cJ
	9boUxkEATjmUkMrynYQ+e5thNSAPAc1CQlIYxVbGLibdMu9A+m0gd7N+CB2GNzoxhVYI/+TCZB/HU
	9iIPLKNo8zBn2K1KVUqplD/zkvmW5g8Zcmr3mXI7dVUGJ12PowHuKtwl3ou1gip2yvu4H8yEAN/2f
	iX1oa1Sonq76HNwww1PxVdfA15dahRtStKH/cdYTMycdxxRxOZLKLLWQr+RRS0NpqKsBUsUqnq7TY
	Tg/8scH8oIkELqzo5bEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syQE0-000000086eK-0GsW;
	Wed, 09 Oct 2024 06:31:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syQDx-000000086dx-1Bte
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 06:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F2CF5C5CB3;
	Wed,  9 Oct 2024 06:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B21C4CEC5;
	Wed,  9 Oct 2024 06:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728455464;
	bh=i5bI9bYBkdQtiuRREOvIQVOmYuxX3Or8TeWiSNQvLek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9lBn07f2sVThjU5dMuOej0wAHVmWtRyI5nznSG1d0T+TmpWyWSKbs7hgnLA5gCiG
	 LnXsSpI4RC8XuuFTDLaWoNPXtkkncgv/9+NC1EZP02EZ2W0DYTwCsWxFU/IonMq3OJ
	 VzldIDoP/cfv8FDXyCGNLwbDoc3UqoviBTLDowTkyxrIyUPymHRrnUalHcdMxF1/E2
	 ouZaQTl42QxjLs8IPR85ZQqNegQkP/q4LNUudsWH9Lg1LezYW2QWigEgdPUC1Me1+z
	 XzeTs/PL2OU6/XQM19G4TXykzS0xvKyJc1wXHoX+rXDFsYK2beQ+B/SCCEEoOSe+Kk
	 UrPW0h+0DSV4g==
Date: Wed, 9 Oct 2024 08:31:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, 
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	m.szyprowski@samsung.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: mailbox: Add thead,th1520-mailbox
 bindings
Message-ID: <sknianfahozghrk6tdmcwxbbi6mixgw3y4vskzucga7r7hkfjz@yschcrxbbwm5>
References: <20241008174852.222374-1-m.wilczynski@samsung.com>
 <CGME20241008174909eucas1p1b34518ef9a643313d41349f476f0659a@eucas1p1.samsung.com>
 <20241008174852.222374-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241008174852.222374-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_233105_432006_92BCEE99 
X-CRM114-Status: GOOD (  14.88  )
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

On Tue, Oct 08, 2024 at 07:48:51PM +0200, Michal Wilczynski wrote:
> diff --git a/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> new file mode 100644
> index 000000000000..32c265f39c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/thead,th1520-mbox.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +

If there is going to be new bersion, drop blank line.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/thead,th1520-mbox.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-head TH1520 Mailbox Controller
> +
> +description:
> +  The T-head mailbox controller enables communication and coordination between
> +  cores within the SoC by passing messages (e.g., data, status, and control)
> +  through mailbox channels. It also allows one core to signal another processor
> +  using interrupts via the Interrupt Controller Unit (ICU).
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: thead,th1520-mbox
> +
> +  reg:
> +    items:
> +      - description: Mailbox local base address
> +      - description: Remote ICU 0 base address
> +      - description: Remote ICU 1 base address
> +      - description: Remote ICU 2 base address
> +
> +  reg-names:
> +    items:
> +      - const: local
> +      - const: remote-icu0
> +      - const: remote-icu1
> +      - const: remote-icu2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#mbox-cells':
> +    const: 2
> +    description: |
> +      Specifies the number of cells needed to encode the mailbox specifier.
> +      The mailbox specifier consists of two cells:
> +        - Destination CPU ID.
> +        - Type, which can be one of the following:
> +            - 0:
> +                - TX & RX channels share the same channel.
> +                - Equipped with 7 info registers to facilitate data sharing.
> +                - Supports IRQ for signaling.
> +            - 1:
> +                - TX & RX operate as doorbell channels.
> +                - Does not have dedicated info registers.
> +                - Lacks ACK support.
> +
> +additionalProperties: false

If there is going to be new bersion, this goes after required:, just
like in example schema and all other bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
