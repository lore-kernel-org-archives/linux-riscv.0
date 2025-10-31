Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBF2CCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36TEczHihClmiy57sJ9rgYDjHnUbagelMNUckcPUYsA=; b=yTwAGLZUTHrw90
	Ym6X+pm2ucLhgf1umSHz3i56sZdxXKWFsT2kUXrkdbp1s74TbDMjzB4h/KdOkgAbrkTwAm3WsD/me
	FzRMi/v4tRSYMgBPV4XR0+S26yEuMVPChOYsPIJRGvSK54tO4TJTMmfqsKZq6vEWoXxBqaznF+tpa
	NhrJiSNTxvTjMpGqDzRqcdbgPTJ2Sxeou+98F4eWXvObFWgFmngfsCz/TlFzo4LrE75MbpCog4SAs
	E76isYvCbKf5xPH1fhD31yQva57zOKIbjIR+strMEatqsO565iCyZu2hGX1gV8Pis3GiriOLNRta+
	tdEsx2WS+Q46+S2fAWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExen-00000006rrq-3j5W;
	Fri, 31 Oct 2025 22:31:41 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vExek-00000006rq2-3D6g
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 22:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=rD2JIdANTZru7tnoty78FxFPBqnheT+Ouf2ZxL1AylI=; b=M39vuJwqwXyMI1cEG79o39S3fV
	pg3hdjeCchwqLht2MWcV2mPu9yi571rh04hAjJBtVHTRwz+ndwhBcvUwctdsVo+LVCWFV5CVcDxPA
	+aMHDZutukWkSVr8VUGA5LLK2ikEdv8XVCzbdKuVT4edJCJAhAB3AXzCW4XkY4BvwNqljKfJPxas2
	QX0c1OiOYgGKMgdc3u+KGc7JyepotbXrOh5W+G1rktQvwSPSkimoir7GpDpdVWBgnw9MCxegxQ25p
	Bpz9faVEn4JuIHYjrX+H0GOarFyZj5aMQ90Emhjl7ThdwqKvI0Q8gghX3CPx1ioC+5IRtbvo/v+my
	4DmCI6aw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vExeJ-000000049Fl-0m2N;
	Fri, 31 Oct 2025 23:31:11 +0100
Date: Fri, 31 Oct 2025 23:31:08 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex Elder <elder@riscstar.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org,
	johannes@erdfelt.com, p.zabel@pengutronix.de,
	christian.bruel@foss.st.com, thippeswamy.havalige@amd.com,
	krishna.chundru@oss.qualcomm.com, mayank.rana@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	inochiama@gmail.com, guodong@riscstar.com,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
Message-ID: <aQU4rGzrB1-Vu7C6@aurel32.net>
Mail-Followup-To: Alex Elder <elder@riscstar.com>, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	bhelgaas@google.com, dlan@gentoo.org, johannes@erdfelt.com,
	p.zabel@pengutronix.de, christian.bruel@foss.st.com,
	thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com,
	mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
	shradha.t@samsung.com, inochiama@gmail.com, guodong@riscstar.com,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251030220259.1063792-1-elder@riscstar.com>
 <20251030220259.1063792-6-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-6-elder@riscstar.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_153139_233470_B0E73B8B 
X-CRM114-Status: GOOD (  14.22  )
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

On 2025-10-30 17:02, Alex Elder wrote:
> +/* Disable ASPM L1 for now, until reported errors can be reproduced */

Thanks for adding this function.

> +static void k1_pcie_post_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	u8 offset;
> +	u32 val;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	/* Turn off ASPM L1 for the link */
> +	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);

Why not using dw_pcie_readl_dbi() instead?

> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
> +	writel(val, pci->dbi_base + offset + PCI_EXP_LNKCAP);

And here dw_pcie_writel_dbi()?

> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
> +static void k1_pcie_deinit(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct k1_pcie *k1 = to_k1_pcie(pci);
> +
> +	/* Assert fundamental reset (drive PERST# low) */
> +	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
> +			PCIE_RC_PERST);
> +
> +	phy_exit(k1->phy);
> +
> +	k1_pcie_disable_resources(k1);
> +}
> +
> +static const struct dw_pcie_host_ops k1_pcie_host_ops = {
> +	.init		= k1_pcie_init,
> +	.post_init	= k1_pcie_post_init,

Unfortunately, while I can see the effect of the change with for 
instance lspci -vvv, this happens way too late in the device scan 
process, i.e. after pcie_aspm_override_default_link_state() and causes 
L1 to still be enabled.

I have tried to move it earlier, in k1_pcie_init() after writing the 
vendor and device IDs. This works as long as "nvme scan" is run in 
U-Boot. But if I don't run this command, it seems that the change is 
ignored or lost (i.e. I can still see L1 enabled with lspci -vvv).

Moving it at the end of k1_pcie_init() works fine, like moving it at the 
beginning of k1_pcie_start_link(). But my knowledge is too limited to 
know where is the correct place.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
