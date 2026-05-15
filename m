Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D05CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 07:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtyU+rZ0snmdWXqHZjrTsJRM6x2ho8bGlgfh+OGCwWc=; b=N4tNraCIIHTNUK
	7iXJ64fmSLQcbtbPLtrDw4K5pQ0XbncxhKbJtr4wRzPE5n0vU/So1NeX2/4z9IwZlGNtjCxWt4riS
	N3UML3FnwE+aeUnjJYPKPPm27ZYLllC4lkCKZuonyeeVS03nvUr4kLX5x9ojqIgtJigoYBIzOuzPn
	Y62ClPPLilxf2uUii0xZKfJNwFkwNMYS7ZZmiyeK8Z6JVTkKr5P4+C3lfQRd3YuQOdExdlbcm2M0l
	AxSlRqyZGi1P30qRvR3TvTK4ZktcO/5OwbyttP/UdGSEqRtB9qVQpjCLaAvPXfyh85nwFxErP8HVW
	GW/SC3Z22nS7TU8r9Yjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmZG-00000007ZuF-498R;
	Fri, 15 May 2026 07:02:42 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmZE-00000007ZtQ-2KMS
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 07:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1778828524;
	bh=qCTfWv8m4cc4h0EHyDjm6M3IOtAl6o28GT7LNvnI1Zs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HdZf2y+MPudCZ9scJCptwAzjRP1aFklSKAVj8rhCRZcVOE6VdK2u25KLcnEirUHQd
	 HO3lj7np6/Dgn9Tz6hhktTRVrSsR8UNcWxiO7ChlderQrikAtZfzWFYhe/38pgsUoZ
	 2tSFsN6E0fv5bBYHAd1YK/JXZFQe1IxIfI2ojBzjA7PTesjw6PTPFBAbiBJq9sG6d+
	 Uxx1ypuyocBX4yIlnM2Be5YVCQM/LFD41EspuWdu7yOQXegfGmRzh0wuZCArDxtRKV
	 M3LuJaWjBRMHYJEjMOuJZnIYx8ExctZJC5hMq3CvInLw56YvRjSWeowLNiRE9KE1Gn
	 pGS7Q0lsbEa1w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 9131EB2201FF;
	Fri, 15 May 2026 09:02:01 +0200 (CEST)
Message-ID: <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
Date: Thu, 14 May 2026 23:49:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 "open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20260514160356.1642075-4-aurelien@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_000241_036673_FC5116FE 
X-CRM114-Status: GOOD (  14.58  )
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

On 5/14/26 08:56, Aurelien Jarno wrote:
> The Milk-V Jupiter board has a connector for an eMMC module. Add an
> entry for it in the device tree and alias it mmc0. As it is not
> populated by default, do no mark it as non-removable.
> 

The meaning of "non-removable" here is whether it is expected to be
added and removed during use, requiring to be probed again; not whether
it is a user configurable module or soldered down part.

> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 450d28e438293..b9b8ddc8e7fb0 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -17,6 +17,7 @@ aliases {
>  		ethernet1 = &eth1;
>  		i2c2 = &i2c2;
>  		i2c8 = &i2c8;
> +		mmc0 = &emmc;
>  		serial0 = &uart0;
>  	};
>  
> @@ -138,6 +139,15 @@ &cpu_7 {
>  	cpu-supply = <&buck1_3v45>;
>  };
>  
> +&emmc {
> +	bus-width = <8>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sd;
> +	no-sdio;
> +	status = "okay";
> +};
> +
>  &eth0 {
>  	phy-handle = <&rgmii0>;
>  	phy-mode = "rgmii-id";

With that, LGTM

(no R-by tag, I would want to test this I do not have the hardware though)

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
