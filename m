Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F4DC36000
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvaLz35CTGd3npPtbXGyKu+/TPz3U5Pe+Un2vlKIBxM=; b=KMXvo/WDvj3aw1
	CjmecCDsNdbMN57QIXuMCdo1vHU6DwK4NF0JAbgEaaPOmhXLHy/PL+YUImdPzGOSLeYAaYiuDMtYC
	Wd5qaVYwnCj1BnIv10FTCspkh2nXtks6GwvcEVYDUJp7rdth9NvY1B3jvOxKp83nfNOld7xkp5ayG
	abmpGxuetwLJ1BvRJ3EHCKqhNnq4jgEDI5njFk3Thv79lEdo39cRRA8zJf6exEEpZL9LbDf9Ce99w
	urYLEs+I0Wgmr7EZ4E4Owy3ILipZKz3WW9W7j3KOrudjRZECN0hu3iQxc1TJ0FK5JhfYkwjm4EXGv
	C3IKKlU2iBY/f9f0Z6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjCM-0000000GEEU-0kOp;
	Fri, 21 Mar 2025 20:42:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvjCK-0000000GEDt-07tP
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1238743799;
	Fri, 21 Mar 2025 20:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F691C4CEE3;
	Fri, 21 Mar 2025 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742589751;
	bh=XsHupZXq9mP47xdssh7YIG1V2VG9jPjIpAnsYfLZZeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZ10bVPP4aa+uN6spoypuceQTO8SP4QPWeccXxsIlYlhuZoJ1zdJeO97DazL3pHq8
	 J/LoW3kqmiWfiAWymzcYpWcOyWFQSwDTe8Me1eYvjjv5XWRF2RLmn1BoZCYHf3QeAV
	 pnh1JHINei16ioRte+fZdGRzVe+r4sNwPkQeR0l16Lw6ng+PXHGpmtXP0D+ts9smCJ
	 JIpBRM7izWWBv3mb3ONwX8kKI22pDB+mv0VBX7cmyAj2KurPgMo78wqp/n2NvOl4s0
	 Zp8AOrnTmQPpYCB3Dqa7hWUTC2picFAyqVgMfJYx7kxhniuJxg5l+dbRqR2WHZIyUk
	 gLNVmPUkxAbHA==
Date: Fri, 21 Mar 2025 15:42:30 -0500
From: Rob Herring <robh@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org, dlan@gentoo.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250321204230.GA3902727-robh@kernel.org>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-2-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250321151831.623575-2-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_134232_109768_2641A1A0 
X-CRM114-Status: GOOD (  13.08  )
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

On Fri, Mar 21, 2025 at 10:18:24AM -0500, Alex Elder wrote:
> There are additional SpacemiT syscon CCUs whose registers control both
> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
> previously, these will initially support only resets.  They do not
> incorporate power domain functionality.
> 
> Define the index values for resets associated with all SpacemiT K1
> syscon nodes, including those with clocks already defined, as well as
> the new ones (without clocks).
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
>  2 files changed, 143 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 07a6728e6f864..333c28e075b6c 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -19,6 +19,9 @@ properties:
>        - spacemit,k1-syscon-apbc
>        - spacemit,k1-syscon-apmu
>        - spacemit,k1-syscon-mpmu
> +      - spacemit,k1-syscon-rcpu
> +      - spacemit,k1-syscon-rcpu2
> +      - spacemit,k1-syscon-apbc2
>  
>    reg:
>      maxItems: 1
> @@ -57,13 +60,15 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: spacemit,k1-syscon-apbc
> +            enum:
> +              - spacemit,k1-syscon-apmu
> +              - spacemit,k1-syscon-mpmu
>      then:
> -      properties:
> -        "#power-domain-cells": false
> -    else:
>        required:
>          - "#power-domain-cells"
> +    else:
> +      properties:
> +        "#power-domain-cells": false
>  
>  additionalProperties: false
>  
> diff --git a/include/dt-bindings/clock/spacemit,k1-ccu.h b/include/dt-bindings/clock/spacemit,k1-ccu.h
> index 4a0c7163257e3..a1e1b1fe714ce 100644
> --- a/include/dt-bindings/clock/spacemit,k1-ccu.h
> +++ b/include/dt-bindings/clock/spacemit,k1-ccu.h
> @@ -78,6 +78,9 @@
>  #define CLK_APB			31
>  #define CLK_WDT_BUS		32
>  
> +/*	MPMU resets	*/
> +#define RST_WDT			0
> +
>  /*	APBC clocks	*/
>  #define CLK_UART0		0
>  #define CLK_UART2		1
> @@ -109,6 +112,7 @@
>  #define CLK_PWM17		27
>  #define CLK_PWM18		28
>  #define CLK_PWM19		29
> +

Stray change?

Otherwise,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
