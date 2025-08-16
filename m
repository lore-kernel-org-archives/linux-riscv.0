Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709F4CA0EE6
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 23:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axeUmNJxYO851nJrOvgnjEqKbbv67qutvh7ah5bSBUo=; b=gysnvdT2Jtcdnm
	LpGtGFSsE7Sdv/6wbbafE+MZl1y9IQBdtb1yvdJRTBnVg121yM9u6DWla0kDKs1CZVzlbmF0gWZTo
	sLivGLF/3G6es2NbALqhD3ge7FTJK3EmTsSDtP6Bh4a0r6O0I1GGkxytcIjhnUQSR/AOTIhvgH01V
	F1mvuklGq8DDJowBDG/myhioW6t8aPv4dezCs/5XlEF8GW1u5QuLS5u54/TXUTzlSUVGwiOpK97CS
	je0z5IzeV+XmRS+NJi8+URUCBpYopMAkEf6m+AIAc67RztqGYZMJOrZBpeFOrD4zzWdtxc55aCyx0
	EKBQfMmFNUrvuFM4keTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQVv-00000005EA0-2ozZ;
	Sat, 16 Aug 2025 23:40:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQVv-00000005E9u-05S2
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 23:40:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A81960051;
	Sat, 16 Aug 2025 23:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBE0C4CEEF;
	Sat, 16 Aug 2025 23:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755387641;
	bh=ckJymq/i3D1MkEmQ6AWtMEkQD94nmnHooah8eYxorOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmQ/pG7+7LZIToInyHvBssDG18YQizWD5E/PtLWtCnTesyY1d7b0sciHOQQ+j0HJP
	 hm1y8VU79OZ9kQGzVLW9vE/ZZzPghl5Go5Vlj034273Rsi0y1ClwqRg12fHDEuZAVy
	 x+eekyH5Wvox9Z2t0XC+Gte53ulwVatFwFfIuodIC1ofVPjLgPGTrEGoE7lBVansfW
	 KUM8Pvwvj6rmmb0gTpt0Q8NduKR1hC5KUv3kY8rs1CWwtsX62rIF4S/USd9R1Ax6/c
	 GELmSwFTb702jIdUJPEKd1/UP1Iw4tFWbX2vsNbFGDRIx/SUnoZkyr2OSKGRApMFFB
	 EpR13QJmMYPoA==
Date: Sat, 16 Aug 2025 16:40:39 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Initial thermal management for Lichee Pi 4A board
Message-ID: <aKEW99MyMU58GCwb@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816093209.2600355-1-uwu@icenowy.me>
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

On Sat, Aug 16, 2025 at 05:32:06PM +0800, Icenowy Zheng wrote:
> The SoM+Dock design of Lichee Pi 4A is quite bad at dissipating heat, so
> active cooling is quite important for it.
> 
> This patchset tries to do some initial active cooling for it, by
> utilizing software PWM to drive the fan.
> 
> Ths 1st patch adds PVT temperature coefficients, as seen in the SoC
> manual and BSP 6.6 kernel device trees.
> 
> The 2nd patch adds thermal zone information for the 2 thermal sensors in
> the PVT block.
> 
> The 3rd patch adds soft PWM + PWM fan, and makes the fan an active
> cooling device of the CPU thermal zone. 
> 
> Icenowy Zheng (3):
>   riscv: dts: thead: th1520: add coefficients to the PVT node
>   riscv: dts: thead: th1520: add initial thermal zones
>   riscv: dts: thead: th1520: add soft PWM fan for Lichee Pi 4A
> 
>  .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 53 +++++++++++++++++++
>  arch/riscv/boot/dts/thead/th1520.dtsi         | 29 ++++++++++
>  2 files changed, 82 insertions(+)
> 
> -- 
> 2.50.1
> 

I just tested this on top of:
[PATCH v3 0/4] clk: thead: Changes to TH1520 clock driver for disp
[PATCH v2 0/2] clk: thead: th1520-ap: allow gate cascade and fix padctrl0

The fan is spinning when system boots at expected. That is nice that
GPIO can be used until the PWM controller driver is ready. hwmon0 shows
both temp inputs holding steady at 43.3 C and 44.4 C.

Thanks,
Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
