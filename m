Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AADCCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 16:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7M0+qG7etexLkOh4lsWrQyhO9aL/AgWg8Hlie91R1I0=; b=mLIJr+yzUPubWp
	1C/SDDOkwkO+iCHaEceinitdFhOLeDpuOjmgalsWMQbkV7eUjMlh39+gt1ZBuCEja+tk+NXw6m6Tv
	RDNbz3HnPki54Y74yFDCG/m/ITHfb+HitAghIDv553OYtP5o1co6hAcilbRehVSG2c0u5aOdvL6zG
	a6uIlosTJTdZ8hRW4Y1jisHWiXx1AvxT5zHpVD3b/wiGtXdyc5IiW7StENCISPgJ+4tYIii+NrAvt
	Ek1IcClCoOdmEVqrRAfh13kWwHb/oxziYMDJdXgwrvTQxLn2152meEbsFrkeOwCK8Q3+BKn+mugye
	P6Mxh8rmEQPlWDfMnJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R9U-00000005TBN-3rDr;
	Thu, 16 Oct 2025 16:48:32 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R9Q-00000005T9R-1ioo;
	Thu, 16 Oct 2025 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=9gkcy8583TeLV+YV4+SJjwY1l2WxECBbWEM4z0wYrI4=; b=uKWAdTtm22MCASRx16KB/LNFAI
	y9lpVvkGpyXHDK1VhdEMRj0gfNoBJ4SNB6t0Gm+tuBq1gJUba/367H91NN0eHs9zW9goPY5pfxTTE
	d3hAMWFzXA60K6GKe1hoFlgwewXfReNTkCr9/m4hC7x/zV8+govNCNdzkrMMilDhQYjIzc8or2AgU
	AR05K4SNxWhpQy2BhetpTnmHDD94HWownXfaH3SYXkhnQEmoRxzCURvoMsudoAS0dCEpLo4QbHiVj
	My+V5THMgMACXr/HcPNS8MI3Mh2xRRQHvORUdYxOwbQwKBr8ta4FnOQcqLJv39m2cLuYYk3vseIg7
	IyEqeKNw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v9R8v-0098Vp-05;
	Thu, 16 Oct 2025 18:47:57 +0200
Date: Thu, 16 Oct 2025 18:47:56 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, vkoul@kernel.org, kishon@kernel.org,
	dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	shradha.t@samsung.com, krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, namcao@linutronix.de,
	thippeswamy.havalige@amd.com, inochiama@gmail.com,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Message-ID: <aPEhvFD8TzVtqE2n@aurel32.net>
Mail-Followup-To: Alex Elder <elder@riscstar.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org,
	guodong@riscstar.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	christian.bruel@foss.st.com, shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de, thippeswamy.havalige@amd.com,
	inochiama@gmail.com, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251013153526.2276556-1-elder@riscstar.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_094828_900276_D7B1C205 
X-CRM114-Status: GOOD (  16.72  )
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

On 2025-10-13 10:35, Alex Elder wrote:
> This series introduces a PHY driver and a PCIe driver to support PCIe
> on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
> Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
> PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
> one PCIe lane, and the other two ports each have two lanes.  All PCIe
> ports operate at 5 GT/second.
> 
> The PCIe PHYs must be configured using a value that can only be
> determined using the combo PHY, operating in PCIe mode.  To allow
> that PHY to be used for USB, the calibration step is performed by
> the PHY driver automatically at probe time.  Once this step is done,
> the PHY can be used for either PCIe or USB.
> 
> Version 2 of this series incorporates suggestions made during the
> review of version 1.  Specific highlights are detailed below.

With the issues mentioned in patch 4 fixed, this patchset works fine for 
me. That said I had to disable ASPM by passing pcie_aspm=off on the 
command line, as it is now enabled by default since 6.18-rc1 [1]. At 
this stage, I am not sure if it is an issue with my NVME drive or an 
issue with the controller.

Regards
Aurelien

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3ac2ff14834a0aa056ee3ae0e4b8c641c579961

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
