Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BC1606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 23:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HDiRiVkY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooPODiqh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=L17OAkZ9Yb2i+dQy3zFViqep8o1tx3J055cU/XRqDt0=; b=HDiRiVkYdXopwUdQQE2/Ay6cWs
	ROyqfeVXZFl2DA8g5xLwizXuoKPSz5dlm4PzaNpn+gNQD7adLB+Ej++9W/fypV3eQWBujXutkNSkY
	G4hchLfGDDgwooroUrsoY443+TIA7PbRNmwQGKBgsiZ7kL9YWZbudB1AZTKeeaV4sPbekojwgxUgP
	EutSzZ8OsF+R1Os/+roFZv3hELzuPRxF2EJZEezj4NJP9TKo5uk+b4Qi6zH3Da18ewulfw/6aSM+V
	Kc2wrAddtlF5w0wholoR8aYkckL1YPSMzbamac3QI1otBtt12EBDBYfmxEJLKfryLkNRcfsVJFZHl
	inS1JwrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzn7-000000083yZ-2sH9;
	Tue, 24 Nov 2026 23:19:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzn6-000000083yT-296f
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 23:19:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E4484325E;
	Tue, 24 Nov 2026 23:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB321F000C4;
	Tue, 24 Nov 2026 23:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795562352;
	bh=SRWWMd+yzuA6S+ZzDttweE7vNGF2Hx8rwgs6Wuiy3ZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ooPODiqhP96bXIhoVPrnYtH5/9wmyGxrQBG4wgzt0BL2f25b/6lKOtsnmT4tvBT7T
	 nAqDnBBxjWb7MBDfHHZ6/JefncBErm2Pcb7T4H7TuWKJaEQmFzUvAVP7A3lwWnNxn/
	 54jk4xVvT8IXm6koQbJSzYwy96d0n700WNpGDXPRyS4Vvm5pmMd286xk46DZssGcAW
	 iksh7sRP7JAB7MR0Vd8v4dLxST9TGZB82+vWDPo2zkbMbCH6luHwOXv6XuFMJnrYvN
	 hPxNTzqQyymFeufwt3VJjMVYbf3YTZwBWL8y80nXjR4kbs+oKhuDeGaodVT0d3AEUI
	 cHyEE4kI7IY7Q==
Date: Tue, 24 Nov 2026 23:19:09 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes
 bootph-pre-ram
Message-ID: <20261124231909-GKB245721@kernel.org>
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024092558.143621-1-alan.tseng.cs@gmail.com>
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

Hi Hung-Chun, 

On 17:25 Sat 24 Oct     , Hung-Chun Tseng wrote:
> On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
> that stage sets up DRAM. This series marks the nodes it needs for that
> bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
> in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
> the PMIC rails and the SPI NOR in the board files.
> 
> The vendor confirmed that the BootROM itself does not access the
> EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
> sets up SDRAM, and DRAM cannot be trained without it.
> 
> Testing: all K1 DTBs build, and dtbs_check is clean for them with and
> without this series.
> 
> I used Claude to help read the U-Boot SPL and the device trees. I
> checked the changes and ran dtbs_check myself.
> 
> Changes in v3:
> - Reword both commit messages to describe the hardware instead of what
>   an SPL does, and drop the U-Boot paragraph from patch 1 (E)
> - Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
> - Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
> - Drop the Assisted-by tags, see commit 1e035297ffda
> - Keep E's Reviewed-by on both patches, as the changes are the ones
>   discussed on v2
> - Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/
> 
> Changes in v2:
> - Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
> - Rebase onto the spacemit dt-for-next branch
> - Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/
> 
> Hung-Chun Tseng (2):
>   riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
>   riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
> 
I'd not put this series on hold, we generally could address other
remains of issue/improvement later. so with

Reviewed-by: Yixun Lan <dlan@kernel.org>

>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
>  7 files changed, 47 insertions(+)
> 
> 
> base-commit: d05c6236496071916e19012cda7149465f15e66e
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
