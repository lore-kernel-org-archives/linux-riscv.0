Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86684C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4szcs546fVKP1pLRWXwcpepD99QUhjhLceKVZe0INYY=; b=U3hox/kjoxn96V
	Fv3RY3bdpN2kJMb8spt2Mk1okttfUq9VKGJabhg0pu7aas4bHRPWwYhsbzUkV4plaU+dH3O23VtNv
	/JZ6LBgzhqCcomCsVBZDb36V+bmg6Lu5bFG+DpJbUL9Nsbg5Mg8TroaqfkaKmYoLmcEMvInujvMVp
	9bqECQUGXG/1XJLm3I9YZamQy9jG25lXcF9zHKmAxxCbK3T1tTTmAoDfpiTLQgad89r15+RI5LDDI
	e86RlPO7u3JRGtN0unTiegWsTOhr6+pKf13RR2km2C0p7GQ07W1vnhQDr+mUj+9gh7Yhz/khEbKLz
	MYp7UMF2RK5M/PDgNe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLsQ-00GOZY-1Q;
	Mon, 18 Sep 2023 21:33:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLsM-00GOYG-2G
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 21:33:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8CEDACE0AD3;
	Mon, 18 Sep 2023 21:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B348C433C8;
	Mon, 18 Sep 2023 21:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695072826;
	bh=HJnD3hDCAKtTDtsEuzBCabBIEMAOgegcnbNytmQ7rTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/lXBeKiRldFnvNecwB87VK4iPzybzfdxFTpW7N7DEWOG0ePMwhWA1QBHQj7CZmOE
	 rwJzCyjXxuHxmWV776xSnXJnCwS1Y0dtd49ta/JFo05fQvVVmUH9rfpcqiiHynzYD0
	 flE5SBBnlLaWbqmFb7RF8ps2D0Ihih5XNYo3kHtAHgWRfOaX8wu1HaIhcdh0iLlGUY
	 KabrMyZUZcxyjJ9ucBFNbR4CiTALYZUcRIrBfnguxGFT2r2Y8y5skAJRpyLr+U9nqZ
	 Vqe8hmZXeZDTvMroRHiK3s4IbOQCqckidhK+CPVHdLxFVrKwD6eqW0HmNH4e3LiZ6Z
	 RVzOdVIeBJsIQ==
Received: (nullmailer pid 1791762 invoked by uid 1000);
	Mon, 18 Sep 2023 21:33:28 -0000
Date: Mon, 18 Sep 2023 16:33:28 -0500
From: Rob Herring <robh@kernel.org>
To: Kwanghoon Son <k.son@samsung.com>
Cc: p.zabel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Document th1520 reset control
Message-ID: <20230918213328.GA1771303-robh@kernel.org>
References: <20230918045125.4000083-1-k.son@samsung.com>
 <CGME20230918045134epcas1p1b80b338b66512a976c3783cd0e51da50@epcas1p1.samsung.com>
 <20230918045125.4000083-2-k.son@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918045125.4000083-2-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_143350_911793_C3E98022 
X-CRM114-Status: GOOD (  15.33  )
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

On Mon, Sep 18, 2023 at 04:51:23AM +0000, Kwanghoon Son wrote:
> Add documentation to describe th1520 reset device
> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  .../bindings/reset/thead,th1520-reset.yaml    | 44 +++++++++++++++++++
>  .../dt-bindings/reset/thead,th1520-reset.h    |  9 ++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
>  create mode 100644 include/dt-bindings/reset/thead,th1520-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> new file mode 100644
> index 000000000000..49ea8c6a331f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/thead,th1520-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: T-HEAD th1520 SoC Reset Controller
> +
> +maintainers:
> +  - Kwanghoon Son <k.son@samsung.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: thead,th1520-reset
> +      - const: syscon

Why do you need "syscon"? Are there other functions? If so, please 
describe them in top-level "description". If not, drop "syscon" and use 
device_node_to_regmap() instead of syscon_node_to_regmap().

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
