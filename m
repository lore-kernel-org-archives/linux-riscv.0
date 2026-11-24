Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425BA606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4P9I6Kum;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=irQ3zDUz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E+YDMEQoyhPxiLQRqhTZOYEs0UT7EsqhT2kH3dnd5hk=; b=4P9I6Kumn+Z2UiWfmB+oCh0/Kh
	0y5wuRt9kZf6JLdzh7ONMEXXXl5Nlxo0FELbeheanYVjyC695qoLQwHJUqYJifZdu5wi6I3AEsS89
	2QDCNQn8OT+ftsIvmyiwuPfmQJshupI+U5eSW2w6gTdjUh6U4RU/GFB2fXKEuV6lNidxIPo4F0P7a
	i5WdkaUjsLb15MOqEdaSap5ci5efax5zTwtF07FxhhkUjh9KJ0Gb585YH1ipO+lm1upRPpLEymoyD
	1C1Bq3OpqFD8DyvGFSI/0sdEGfAm2/R+9I3y/OQizfDcVQFvXPs3cFr+Am8/M7hkWGOvi/P6jKA4V
	0DmT23Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVped-00000006W5h-2lOZ;
	Tue, 24 Nov 2026 12:29:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpec-00000006W5B-0Q9o
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 12:29:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D450D438A6;
	Tue, 24 Nov 2026 12:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A4B1F000D2;
	Tue, 24 Nov 2026 12:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795523385;
	bh=Aa9xIw16gVy0GcSyhGDzNe0nCFeciud8dQ7Mcn7z3mU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=irQ3zDUzKESe/ZV6XYKciROknj8NLqJh8Jmr6ZNbIWMDJlrX8/Iv407ZyDyzuQyn6
	 MWEtLELQZHi0zpu16KYdA0H/aAHk5PbIp70lq/++v59KQARknxUuYMG2Bw3x/rWt7g
	 X69zfj0DVMXoLvpaLJKQxtX7pba4IE+EogZxYz7E13p6SWCF7AV8pl4D99ySmtT4vB
	 6t7KrvfjVx2iYObdEJa61AlJrwawOtTfxN1iO500NUjuF3c7tLrLWSjxUsYPOGFK3/
	 w9yDWese3yG3rgB04QeuxpSBqjefMfx4FcCghzeyqUlL9YwSl/Tvk4f5DOt3r4Rjiq
	 3QUAuxoOEgyIw==
Date: Tue, 24 Nov 2026 12:29:42 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] riscv: dts: spacemit: k3-com260: Set Ethernet MAC
 from EEPROM
Message-ID: <20261124122942-GKM100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-5-138b39d74602@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The EEPROM on the K3 CoM260 module stores the board MAC address in its
> ONIE TLV data. Assign it to the module's Ethernet controller, so that
> every carrier board using the module gets a stable MAC address instead
> of a random one.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index f94607cb2eeb..1f5c958c9d6d 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -42,7 +42,7 @@ eeprom@50 {
>  		nvmem-layout {
>  			compatible = "onie,tlv-layout";
>  
> -			mac-address {
> +			mac_address: mac-address {
>  				#nvmem-cell-cells = <1>;
>  			};
>  
> @@ -216,6 +216,8 @@ dldo7: dldo7 {
>  };
>  
>  &eth1 {
> +	nvmem-cells = <&mac_address 0>;
> +	nvmem-cell-names = "mac-address";
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac1_rgmii_0_cfg>, <&gmac1_phy_0_cfg>;
>  	phy-mode = "rgmii-id";
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
