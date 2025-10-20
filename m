Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B19CCD195
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 01:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+LAxp0UtYR4sUaL6Elf9sZ/WP2gmjmaJyW9bWsocxM=; b=XawMesmQRQYPn6
	wV11+Jq6maTLuALjGP5aBHdgWWLx0ALEZNdGK5A0ppsFgYEgw+WQh/15kXwkWz/e1c5OHoFi83U5I
	ya6nammXU+nHQSdWbK1i3ymagTO1WIke0Mv43QlaRVYylADupEyIxAR40jRtSdPjpeIyoMMlwmZ51
	VU3A+pe8k2oNr3cetSla/zwdlZq7DkbjlgOktyURV6aDFpblRbOMNk+K/CoEqf0sykukjVEMvkQib
	9sRBf/Kqbh56q5+zL3Nn2gKfZ65wsvsGJJPcfVFjyf0e3IJHujC22adx5lu7zTWUuXljkTSXbv4HB
	McpTFzsb/et/qjvOJ1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeu6-0000000BeFX-3rj4;
	Mon, 20 Oct 2025 01:41:42 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAeu3-0000000BeF9-0eKi
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 01:41:41 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 664F0341540;
	Mon, 20 Oct 2025 01:41:36 +0000 (UTC)
Date: Mon, 20 Oct 2025 09:41:32 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: add MusePi Pro board
Message-ID: <20251020014132-GYE1506524@gentoo.org>
References: <20251017-k1-musepi-pro-dts-v3-0-40b05491699f@linux.spacemit.com>
 <20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017-k1-musepi-pro-dts-v3-1-40b05491699f@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_184139_781452_078C6020 
X-CRM114-Status: GOOD (  16.41  )
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

Hi Troy,

On 13:52 Fri 17 Oct     , Troy Mitchell wrote:
> Document the compatible string for the MusePi Pro [1]. It is a 1.8-inch
> single board computer based on the SpacemiT K1/M1 RISC-V SoC [2].
> 
> Here's a refined list of its core features for consideration:
>   - SoC: SpacemiT M1/K1, 8-core 64-bit RISC-V with 2.0 TOPS AI power.
..
>          This suggests potential for light AI/ML workloads on-device.
drop these additional marketing info, just give neutral technical description
>   - Memory: LPDDR4X @ 2400MT/s, available in 8GB & 16GB options.

..
>             Sufficient for various workloads.
ditto
>   - Storage: Onboard eMMC 5.1 (64GB/128GB options). M.2 M-Key for NVMe
>              SSD (2230 size), and a microSD slot (UHS-II) for expansion.
..
>              Good variety for boot and data.
ditto
>   - Display: HDMI 1.4 (1080P@60Hz) and 2-lane MIPI DSI FPC (1080P@60Hz).
..
>              Standard display options.
ditto, please check more bellow yourself..

>   - Connectivity: Onboard Wi-Fi 6 & Bluetooth 5.2. A single Gigabit
>                   Ethernet port (RJ45). Given the stated markets,
>                   this should cover basic networking.
>   - USB: 4x USB 3.0 Type-A (host) and 1x USB 2.0 Type-C (device/OTG).
>          Decent host capabilities.
>   - Expansion: Full-size miniPCIe slot for assorted modules
>                (4G/5G, wireless etc.). A second M.2 M-Key (2230) for more
>                general PCIe devices (SSD, PCIe-to-SATA, comm boards).
>   - GPIO: Standard 40-pin GPIO interface, as expected for an SBC.
>   - MIPI: Includes 1x 4-lane MIPI CSI FPC and 2x MIPI DSI FPC interfaces
>           for cameras and displays.
>   - Clock: Onboard RTC with battery support.
> 
> Link: https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> 
no blank line here
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changelog in v3:
> - nothing
> - Link to v2: https://lore.kernel.org/all/20251010-k1-musepi-pro-dts-v2-1-6e1b491f6f3e@linux.spacemit.com/
> 
> Changelog in v2:
> - modify commit message
> - Link to v1: https://lore.kernel.org/all/20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com/
> ---
>  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
> --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -22,6 +22,7 @@ properties:
>            - enum:
>                - bananapi,bpi-f3
>                - milkv,jupiter
> +              - spacemit,musepi-pro
>                - xunlong,orangepi-rv2
>            - const: spacemit,k1
>  
> 
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
