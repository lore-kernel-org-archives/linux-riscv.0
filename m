Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2E2C83030
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 06:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho4tI7f0g4OrfeCGOnW8m0b0+XHsiHf6V7EVMpt8Am8=; b=Pg4CaaRvvuN+Z0
	mWf2d5tnAYViEdkrVYDl/SlG5lwPYUuVs80owjGgcefvPKMVIHlE99atb75GMkc1UrVFuzgNq/hG4
	1rEDSBTKdGXKjgAvDDlfTMGShmMVu78D9IJ3t4AA3eUl8wCdJuZE1X5qlGfIjla+nnTP8P97Z890j
	zqfGO32A+d0zVy2t6DJ9MV49vDEuqndtyMTMILgHInNXZBU06NeNG5PZS6YY0I2rLSipknUyOG9+w
	EXUTRI70jUi/tAGxoKx/5z8AUVKyS3+qgO0sfps9c06qGhF1zRw7eShUr7XriO8hfD3tztvwXob/V
	8lSgOkInAdNoGNbC834w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDo7-0000000AQpD-46SP;
	Thu, 03 Jul 2025 06:52:31 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXDlN-0000000AQUr-3gbW
	for linux-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 06:49:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751525332; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mD8uUny1XYdpWeQP6SVaqolbEt3RDJk6TvOGlAxAVadzbU58ua9UfPewBALDrj9LYp7jYGK1+PDyQTEt18mkEMKhNXJKrTSXJHsjdFe0gSdCH563YyLSeocKbSHgcSdg+PB38ZTlCGQat5ox6UxRlDvsGNKq9840PPfmH+k3cQY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751525332; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JHSQpMjUPCAOTe05SvkTtkx5uWkYFZS0xHWecOXz3R4=; 
	b=iXQOgr+YJdkGpSD4cOaIkMRqrM7MVn7EjI+s8IgbNXDk3oc3E2jImPpM7zP66LansiUnvJ22x+0pQBhf7+rRMoA0NTKtaut2QVNS8hk2e4L1VvFa3C2NcJE7AtwmPy1JEb/PaYd1iDT+kp3y59MhwTWihrr45fqVq4/hXiZedLw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751525332;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JHSQpMjUPCAOTe05SvkTtkx5uWkYFZS0xHWecOXz3R4=;
	b=SB08K3UpsvQeF1hLVykmZ5rpp7nw7Io/5oOUFGLAyhb5sqp5oIF8BpXHxGS42wWf
	pTZS5fB+YK0aauSLEzaKS8xYdDrcU9wqgZESra8Y7iUPB1E5OrWxjE2YxTbKjtIA/Gy
	UJND0pWB0MXSctpwf236kTpk5St/yU7YfyTI80KM=
Received: by mx.zohomail.com with SMTPS id 1751525328226725.9805381687908;
	Wed, 2 Jul 2025 23:48:48 -0700 (PDT)
Message-ID: <a2284afb-ee61-457e-aaa8-49a9ce3838f9@pigmoral.tech>
Date: Thu, 3 Jul 2025 14:48:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] riscv: dts: spacemit: Add Ethernet
 support for Jupiter
To: Vivian Wang <wangruikang@iscas.ac.cn>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Lukas Bulwahn <lukas.bulwahn@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250702-net-k1-emac-v3-0-882dc55404f3@iscas.ac.cn>
 <20250702-net-k1-emac-v3-5-882dc55404f3@iscas.ac.cn>
From: Junhui Liu <junhui.liu@pigmoral.tech>
In-Reply-To: <20250702-net-k1-emac-v3-5-882dc55404f3@iscas.ac.cn>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_234942_276229_24FF64D4 
X-CRM114-Status: GOOD (  11.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Vivian,
Thanks for you work!

On 2025/7/2 14:01, Vivian Wang wrote:
> Milk-V Jupiter uses an RGMII PHY for each port and uses GPIO for PHY
> reset.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Successfully tested with iperf3 on Milk-V Jupiter.

TCP Rx: 941 Mbits/sec
TCP Tx: 943 Mbits/sec
UDP Rx: 956 Mbits/sec
UDP Tx: 956 Mbits/sec

Tested-by: Junhui Liu <junhui.liu@pigmoral.tech>

> ---
>   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 46 +++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 4483192141049caa201c093fb206b6134a064f42..c5933555c06b66f40e61fe2b9c159ba0770c2fa1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -20,6 +20,52 @@ chosen {
>   	};
>   };
>   
> +&eth0 {
> +	phy-handle = <&rgmii0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii0: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
> +&eth1 {
> +	phy-handle = <&rgmii1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <250>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii1: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
>   &uart0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&uart0_2_cfg>;
>
-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
