Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25B9C7115A
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 12:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IlOPVxcOoVgSn67yUSNbqypF7g6XcYguQ39Dgy4Xl4=; b=snUBoopsoI6G4N
	rP5fwe7zG9QBqTt6Fnde9dp2V0XVRFvbHfUdpHyY/Hfcz+k5KWdtdj6JmtU8mRdMaZqo30GSXvlzr
	IDPqN2hnF6WhqBEvYqUsW5GVm+W/uw8DWZ8Z/fbA5xnDHAddbNgTjv3szxDUHRBh0Mdp9SsgXimlY
	NEfejJiPYXhK6n9anXUkQJQCNKFrkKF/YlNSgmpYDs+cNaH0EKpJvVrHg94Zf7qfUUOdemTLk5Cq1
	ySV9Hxyz6a1PpCO86t6fqETeNH/vzJSpMP1/ZB8mJcvW+Hy4DcFpF3SbdxKyhXAfKfLTLVdLJmtS9
	59AZTpn50FMqo0N9FpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsNt-0000000ACwu-3h6M;
	Wed, 18 Jun 2025 12:59:21 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqpS-00000009v5M-0CbD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:19:43 +0000
Received: from localhost (unknown [116.232.48.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 624F1341E61;
	Wed, 18 Jun 2025 11:19:40 +0000 (UTC)
Date: Wed, 18 Jun 2025 11:19:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, heylenay@4d2.org, inochiama@outlook.com,
	guodong@riscstar.com, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
Message-ID: <20250618111935-GYA156140@gentoo>
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
 <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_041942_105242_4FF33FB5 
X-CRM114-Status: GOOD (  14.42  )
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

Hi Alex,

On 21:44 Sat 14 Jun     , Alex Elder wrote:
> On 6/12/25 8:11 PM, Alex Elder wrote:
> > Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> > device is an auxiliary device associated with a clock controller (CCU).
> > 
> > This patch defines the reset controllers for the MPMU, APBC, and MPMU
> > CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> > and ACPB2 CCUs, which only define resets.
> > 
> > Signed-off-by: Alex Elder <elder@riscstar.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Yixun Lan <dlan@gentoo.org>
> > ---
> > v11: Redefined combined reset definitions into individual ones
> 
> After I sent this, I realized the clocks use a different
> naming convention for two of the PCIe symbols.  I think
> reset should follow the same convention.
> 
> Yixun if you accept this series, would you mind updating
> these?
> 
>    RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
>    RESET_PCIE0_MSTR -> RESET_PCIE_MASTER
> 
> (And similar changes for PCIE1 and PCIE2.)
> 
sure, done, check here (let me know if I did wrong)
 https://github.com/spacemit-com/linux/releases/tag/spacemit-reset-drv-for-6.17

> Thank you.
> 
> 					-Alex
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
