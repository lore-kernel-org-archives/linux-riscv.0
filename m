Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFAEA8550
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 09:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS1IsHMToXBxlSnrWJqOzZvdNsLjHXve8y9GrMfRTUY=; b=v5a0vURTrqP/ST
	LQ2UVnxx5CVBnAlLsmADN16TmUGNJJKeJ3xmxmZWgJ6+QZ2oOhdWSUYfM59oaLSxWPMx3h4sNCYx6
	mQpAOLBtnmK08Cdyf1o09ScOZqbG2rzF/ZQgg43B3/QwJRM3j/uUYEr8XG3Kx927OFsvGZ3RAtY06
	R0a8U02PAyzRBUtdDDMmHfHFTwAEFmMqcT61fei9Mmhy9k4yxAIs97bbrtdNVQD1QCezn/x4+fZq3
	L0qEeufaUwrrUMBjJMm7zvH+DxdjBN9tw96g8CIZ7aig/LZJN+CcPOzzRK+x0h721E590/Z/GNROt
	pC6uMoUSzjcclQfSoC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt0a-000000091jR-2iw2;
	Tue, 10 Mar 2026 09:04:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt0U-000000091iP-2HVJ
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 09:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32965429D5;
	Tue, 10 Mar 2026 09:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E22C19423;
	Tue, 10 Mar 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133442;
	bh=WZXCyE3t/S/NiszlvHQc1cUrNJ/Xxt7fDuRcWPppb9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XqN6L5yU2yH7gnbvFALBQeCYBkuoxgARvdPyGbqRRZpk7C8AxZlykoxp2B0xM/ahI
	 g59Q3GcwxxifTE/NdPmge15adkcWMdNkyfbLYSGerLM7mmfwjgFMXkpKNXnEtkayev
	 Bg5vCzNX2sNT90aFDU8uNPI32RYIHpnAaOdqD5jlxxmsPkKSOv+tpDbioXsYVRQE3F
	 UfC1gtLcrAhClTFcHbpgjyHEcIzHdAqDOarPm9TNmQgOmC6fCGeyKt9U5rVe/so2vj
	 xH+LeOahp/JT9SP2ZSsunJrG4z5885gVdoe8HLE4Xq/7LRCz8+JJkFnT0YLFdawrxu
	 Q7RjTZ87uPGNQ==
Date: Tue, 10 Mar 2026 17:03:59 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: gaohan@iscas.ac.cn, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
	rabenda.cn@gmail.com, robh@kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/7] riscv: dts: spacemit: PCIe and PHY-related updates
 for OrangePi RV2
Message-ID: <20260310090359-GKF302167@kernel.org>
References: <677085181a4215c517907f44b363ef7777fd407b.1769895215.git.gaohan@iscas.ac.cn>
 <20260204140619.47536-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204140619.47536-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_020402_599040_F6A4D0B0 
X-CRM114-Status: GOOD (  10.36  )
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

Hi Chukun,

On 22:06 Wed 04 Feb     , Chukun Pan wrote:
> Hi,
> 
> > +&combo_phy {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_3_cfg>;
> > +};
> 
> This pinctrl is clearly incorrect (including BPI-F3).
> Checking the schematic reveals that these pins are for CAM_I2C.
I agree, if the phy is used for USB, the pinctrl info can be dropped
Do you want to submit a patch for this?

> By the way, combo_phy connects to USB3, so it should be enabled
> in the USB3 patch.
> 
I think this is already done, check usb_dwc3 node in k1.dtsi?
https://github.com/torvalds/linux/blob/v7.0-rc3/arch/riscv/boot/dts/spacemit/k1.dtsi#L1180

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
