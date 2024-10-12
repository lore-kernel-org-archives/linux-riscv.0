Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A386BCF2566
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2024 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cs//XiWkegH2Jg5QejBI8u64gHR4vqDcQGE4OIIzQXk=; b=rJcU64th4rHCcg
	wYd7p7jEaH3wNfD/wFB8KxbqdCS3N6qakqSZOTOEL5wv7JMzuJCVf0/08x6/ZmqpbwaLifafQGY4o
	RIALbT8fHkZXZrnD2WZ/TzKPbj7K2qJBQCRPlC5pN0YBneEdYG7swzbBZvPBfijuknoVN1AMqhbQG
	GVpEF0WAMixBvhM7+Ah63+6LplFAJr6SrFJlJu2jF2q/zDiuDvL2QkeJs2L7F6DDaPjmTs8gzQjX1
	dxMTR/k0x0imlhK64F/5CF+TqzO+Dm7x1HYPMC9Z7Rs/Ti91FVtInWVM3qonoPbRkyTputfX8AzZ0
	n/OjQSsRHMiiWrWrUFHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szcBm-00000001FY3-2dn4;
	Sat, 12 Oct 2024 13:29:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szcBj-00000001FXO-1VsX
	for linux-riscv@lists.infradead.org;
	Sat, 12 Oct 2024 13:29:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=86LUFeiSctauCmIBlqHrJmZxrAIYPqEdqsSwFAfU0sE=; b=zZyBVo6BMQP1cuNJ6PGdOOkOVo
	ypvs/AkLg6J+QUOI6bBBIAxsFKMy1cfReTMN6clE7w0+77K4uGRINpQQfUGAAt2qqg/S5zunkUHh6
	uwsrsThwmHi/OsUz/w5E0TaWs+jfgyoTPWpVTHTH/2Xtwd5cxwUjUvR4M+UUJMZif/9p98mLAs+9G
	Fa8Z88v1Io4Ir1/1Pbe4AfOz+UFIGK7yT+ZGtbJl+/Xpn/g7pasfUzPJn9CFuV1mL949km3xx42VX
	ED6524KlLqGBqX39OOWN3q1ABwJMSkzxg7Fcy4aCa06yP8ebAAEHWsyHA/dbsrbeY2X/Pe+ZgUJ4b
	Ayo0vBAQ==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1szcBV-000lVG-0Q;
	Sat, 12 Oct 2024 15:29:29 +0200
Date: Sat, 12 Oct 2024 15:29:28 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	E Shattow <lucent@gmail.com>
Subject: Re: [v3] riscv: dts: starfive: jh7110: Add camera subsystem nodes
Message-ID: <Zwp5uFiGqxQa-yC9@aurel32.net>
Mail-Followup-To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	E Shattow <lucent@gmail.com>
References: <20240219032741.18387-1-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240219032741.18387-1-changhuang.liang@starfivetech.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_062943_872896_0A1D2F3E 
X-CRM114-Status: GOOD (  12.67  )
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

Hi,

On 2024-02-18 19:27, Changhuang Liang wrote:
> Add camera subsystem nodes for the StarFive JH7110 SoC. They contain the
> dphy-rx, csi2rx, camss nodes.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 67 +++++++++++++++++++
>  2 files changed, 116 insertions(+)

We have been asked to enable CONFIG_VIDEO_STARFIVE_CAMSS in the Debian
kernel, which from my understanding and given the device tree shown
below also requires enabling CONFIG_VIDEO_CADENCE_CSI2RX. That said
doing so triggers the following error in dmesg:

[   25.143282] cdns-csi2rx 19800000.csi: probe with driver cdns-csi2rx failed with error -22

From a quick look it seems there is something in the port@0 csi2rx
entry. Do you happen to know what is wrong?

Thanks
Aurelien

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..737ee97a3577 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -125,6 +125,55 @@ &tdm_ext {
>  	clock-frequency = <49152000>;
>  };
> 
> +&camss {
> +	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
> +			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
> +	assigned-clock-rates = <49500000>, <198000000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			camss_from_csi2rx: endpoint {
> +				remote-endpoint = <&csi2rx_to_camss>;
> +			};
> +		};
> +	};
> +};
> +
> +&csi2rx {
> +	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
> +	assigned-clock-rates = <297000000>;
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +
> +			/* remote MIPI sensor endpoint */
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csi2rx_to_camss: endpoint {
> +				remote-endpoint = <&camss_from_csi2rx>;
> +			};
> +		};
> +	};
> +};
> +
>  &gmac0 {
>  	phy-handle = <&phy0>;
>  	phy-mode = "rgmii-id";
 

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
