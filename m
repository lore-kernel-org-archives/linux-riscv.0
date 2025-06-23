Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FE3C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 07:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66xkxutRT0cCXc8772DZgAS18Nxq//Xw3aZhOPCRqFY=; b=jeSKGUE983TYcW
	u82Y0f0fbBR0BHuF8DSHwCuT8zP3RlEP9ssHvKvRgjB7fg1IG8lmBaKHxHw+yr8IGXe/Hwkwcp1hT
	qR8nco1AjLR5ifIBHg+9ZGEHM5GuSIx6TgN7b+Y45z0SnBv6vg5eWlgH6ClbGE5EvEe+bHiMUFXcB
	wTiA3SLb3EX1xMNcwdypynpRgyHGpxpP4VvsmJhgXMOasWH+DZgJyEdOe49dCpAWmjDajsjioHCDi
	uKIvuncFvll1u6imeMNqpX1jF/kTbOyicgzmICWjDyLB2ohjT2fKFuzhxHghNcEf8Lbm760vhHt5t
	sCijFXs0hgHNMrXptXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTba3-00000001rfQ-1EoN;
	Mon, 23 Jun 2025 07:27:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTba1-00000001reu-0Ydu
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 07:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=j5uT5DWaYtpQ2U6usaprpgbgjh4e7uOTUA89hl1Rr7I=; b=RM91PLVd+vFdJAn3Amhhq9fLnp
	78a0HZ43BM06fd7yO6f7errbSVBB/F89x+pLm80wcJJ7vAcTafJfay8RxIN8snu5DaYDpXQp/yveI
	33pQFPD9vdU2NyT8x/9cUNgGI0JffYC76/fMqIz88BHR9qFKF7VJTIPNgxWNTz770UPA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uTbZj-00GfK8-Gc; Mon, 23 Jun 2025 09:26:43 +0200
Date: Mon, 23 Jun 2025 09:26:43 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next RFC v2 4/4] riscv: dts: sophgo: Add ethernet
 configuration for Huashan Pi
Message-ID: <bd1485c7-e6c3-4360-8e3c-e584ea0b8040@lunn.ch>
References: <20250623003049.574821-1-inochiama@gmail.com>
 <20250623003049.574821-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250623003049.574821-5-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_002701_172396_0A29F82A 
X-CRM114-Status: GOOD (  13.17  )
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

On Mon, Jun 23, 2025 at 08:30:46AM +0800, Inochi Amaoto wrote:
> Add configuration for ethernet controller on Huashan Pi.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> index 26b57e15adc1..86f76159c304 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
> @@ -55,6 +55,16 @@ &emmc {
>  	non-removable;
>  };
>  
> +&gmac0 {
> +	status = "okay";
> +	phy-handle = <&internal_ephy>;
> +	phy-mode = "internal";
> +};

Since the PHY is internal, it should be part of the SoC .dtsi file,
same as any other peripheral. The board .dts file can then enable it.

    Andrew

---
pw-bot: cr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
