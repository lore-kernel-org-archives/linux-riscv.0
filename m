Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C588E92704
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Dec 2025 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkeDCZzwe7CstEAPNRTDE6O21l/MXEtrZfG9TK3+Lo4=; b=zXeE2+JRmEFuzz
	iJNxLwl5PgmSgvXGcVlz47/WgDxPgrB/NMZH9wfISN/d5URlPg8tZJOkhOkOnluOYfL35GclhbhT5
	97pGbt5XjQ1Gsmy1Wvr0EH5TLW+eLowJ2yy6ImTeZJomcZRZEVXPase9G0OxQ4Jl/xMXUfsBOlNMe
	NNtIonY4izSW2aFM8bnvNxBD/4UCt8nIy3T/tQGP7kjmSTe6D9F2wcqvECkIanvkZGCGYTg2WOoN1
	8igcRLwteiYGrsgQIyLhfjpV8iZMX7FNsVa6rba9SHQC86zKYmAb8OeZdd9SFvO2wYotCvdEXb5tt
	mbLNqX62Pyy9KpH1l4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTsK-00000001zQU-04H7;
	Sat, 27 Dec 2025 12:58:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTsI-00000001zPy-00F1
	for linux-riscv@lists.infradead.org;
	Sat, 27 Dec 2025 12:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40A55441D7;
	Sat, 27 Dec 2025 12:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1AAC4CEF1;
	Sat, 27 Dec 2025 12:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840305;
	bh=/pXRR/sWcGQCcY5EBpPQcvK8Drdg24de1jwnX3o0WXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lTWjKue4TjA1ChtdzFqrhqVW8jMA2ZJhY0FS9H3uB6ODx57QrTRsooBNJDU/sWjtg
	 l8oLOuVJ++slptmhKHpqpCQ3jOaucdGTxmTqvXoHAxCWj69XOE2zWZPBatwzcMwHaQ
	 ko67X//SoFPtUoxeJRL0QXKgOiRbYBfQrfWNAzqP92TSE/bpP1h3LTzxaQijJhkgql
	 Hrg6T1sQz2W3kdUvHPT/yGRqxYyDU2S3OStsZL/brZtjBOKB5S9LWm5KDeFElZrnI9
	 3odLcPYqreAbaryfcizU+3Szdt/r1qp80aIcK98G3gzs2E2lOwaNEO+kDRar5ZYS4g
	 GXFdCLv8Dutbw==
Date: Sat, 27 Dec 2025 13:58:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <20251227-sambar-of-imminent-persistence-fd8c51@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_045826_069202_7444C30D 
X-CRM114-Status: GOOD (  14.92  )
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

On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  .../devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index c5b0218ad6251f97b1f27089ffff724a7b0f69ae..4dc49c2cc1d52008ad89896ae0419091802cd2c4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -32,6 +32,15 @@ properties:
>    resets:
>      maxItems: 1
>  
> +  spacemit,apbc:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that access the protected register
> +          - description: offset of access secure registers
> +    description:
> +      A phandle to syscon with byte offset to access the protected register

Say here for what purpose.

> +
>  patternProperties:
>    '-cfg$':
>      type: object
> @@ -111,6 +120,7 @@ required:
>    - reg
>    - clocks
>    - clock-names
> +  - spacemit,apbc

That's ABI break without justification.

>  
>  additionalProperties: false
>  
> @@ -128,6 +138,7 @@ examples:
>              clocks = <&syscon_apbc 42>,
>                       <&syscon_apbc 94>;
>              clock-names = "func", "bus";
> +            spacemit,apbc = <&syscon_apbc 0x50>;
>  
>              uart0_2_cfg: uart0-2-cfg {
>                  uart0-2-pins {
> 
> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
