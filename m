Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE95CCD1BF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WvQKUAgAb+rMA4tvB/KNKW5iFA59tRw7bubK9OBx9ss=; b=cwfEYQWXjvJoyL
	R6J7Qi6Ozq6W5JBHqHRH6lrR/CXftkDH8J8nCWMvEvqdU/nDTkNUKH3QigtJmpnUFgwXT1rW4/qO0
	fsdZT9yzQB4UCzKGAuIUMEzISuHEr6zjqPw1XZ9Y1Vhv59WBgNcaxbrj9cPJZ1Jn206ioxCOOAyoZ
	4JsJznrolzjQ4BvynBc3G28v5IlZtHfp2xc6VIbXRsOPF22HHmwkgm/Kii7tKd+q9NYD99Ts0xOL3
	easUEbBSkNtOknC4ZADpiAj/QF/TzjE/G5b3frEA0TN/kTvWdk98OOoS/Emej7S1WNFcmm1kmzFZo
	9x2cZf5oYaeUdqILRUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnzd-0000000GRfs-07dc;
	Tue, 28 Oct 2025 18:00:25 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDnzV-0000000GReN-1KBS;
	Tue, 28 Oct 2025 18:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=Hg4yk8h2S9UFPnNuzCx8HQK8YMdf20o+Im/dr85/zXQ=; b=R8Ovmd8NBwXulNQtyTfLsMwMIN
	QaO+L7OCqIGgkcse7iaihMcTfHlToyTu5bL/vSk1H1i70G9Dsd7TfFfH9+33HE1vEmN7rTZv5Ed8K
	axV3kiRfH5LvXNPtmrDchc+LFcgS5UU2Pov1xpNZ43/a15QOHqa6omz2q+sPsFHtYxLUPI0gvdHR1
	/ZRwZ+u66zpkOu9Fi8i1vzvyEfx8vrn1/JV+Iv1Enczfcz7L67mWJoN+pnsRK1QNciZyyLsgfCOnp
	AckH7GcqIZNRoTHMsuMSzm/X7snvQftdDUwPafT1TdeSdKLxj22nogPSixHBQDL8NUZ3Ed20HEA3/
	ILrcPEmA==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1vDnz5-00000008hSt-1qV2;
	Tue, 28 Oct 2025 18:59:51 +0100
Date: Tue, 28 Oct 2025 18:59:50 +0100
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
Message-ID: <aQEElhSCRNqaPf8m@aurel32.net>
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
 <aPEhvFD8TzVtqE2n@aurel32.net>
 <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <92ee253f-bf6a-481a-acc2-daf26d268395@riscstar.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_110017_931680_91195043 
X-CRM114-Status: GOOD (  38.32  )
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

On 2025-10-17 11:21, Alex Elder wrote:
> On 10/16/25 11:47 AM, Aurelien Jarno wrote:
> > Hi Alex,
> > 
> > On 2025-10-13 10:35, Alex Elder wrote:
> > > This series introduces a PHY driver and a PCIe driver to support PCIe
> > > on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
> > > Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
> > > PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
> > > one PCIe lane, and the other two ports each have two lanes.  All PCIe
> > > ports operate at 5 GT/second.
> > > 
> > > The PCIe PHYs must be configured using a value that can only be
> > > determined using the combo PHY, operating in PCIe mode.  To allow
> > > that PHY to be used for USB, the calibration step is performed by
> > > the PHY driver automatically at probe time.  Once this step is done,
> > > the PHY can be used for either PCIe or USB.
> > > 
> > > Version 2 of this series incorporates suggestions made during the
> > > review of version 1.  Specific highlights are detailed below.
> > 
> > With the issues mentioned in patch 4 fixed, this patchset works fine for
> > me. That said I had to disable ASPM by passing pcie_aspm=off on the
> > command line, as it is now enabled by default since 6.18-rc1 [1]. At
> > this stage, I am not sure if it is an issue with my NVME drive or an
> > issue with the controller.
> 
> Can you describe what symptoms you had that required you to pass
> "pcie_aspm=off" on the kernel command line?
> 
> I see these lines in my boot log related to ASPM (and added by
> the commit you link to), for both pcie1 and pcie2:
> 
>   pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 AS
> PM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
>   pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
> 
>   . . .
> 
>   nvme nvme0: pci function 0000:01:00.0
>   nvme 0000:01:00.0: enabling device (0000 -> 0002)
>   nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
>   nvme nvme0: 8/0/0 default/read/poll queues
>    nvme0n1: p1
> 
> My NVMe drive on pcie1 works correctly.
>   https://www.crucial.com/ssd/p3/CT1000P3SSD8
> 
>   root@bananapif3:~# df /a
>   Filesystem     1K-blocks     Used Available Use% Mounted on
>   /dev/nvme0n1p1 960302804 32063304 879385040   4% /a
>   root@bananapif3:~#

Sorry for the delay, it took me time to test some more things and 
different SSDs. First of all I still see the issue with your v3 on top 
of v6.18-rc3, which includes some fixes for ASPM support [1].

I have tried 3 different SSDs, none of them are working, but the 
symptoms are different, although all related with ASPM (pcie_aspm=off 
workarounds the issue).

With a Fox Spirit PM18 SSD (Silicon Motion, Inc. SM2263EN/SM2263XT 
controller), I do not have more than this:
[    5.196723] nvme nvme0: pci function 0000:01:00.0
[    5.198843] nvme 0000:01:00.0: enabling device (0000 -> 0002)

With a WD Blue SN570 SSD, I get this:
[    5.199513] nvme nvme0: pci function 0000:01:00.0
[    5.201653] nvme 0000:01:00.0: enabling device (0000 -> 0002)
[    5.270334] nvme nvme0: allocated 32 MiB host memory buffer (8 segments).
[    5.277624] nvme nvme0: 8/0/0 default/read/poll queues
[   19.192350] nvme nvme0: using unchecked data buffer
[   48.108400] nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0x10
[   48.113885] nvme nvme0: Does your device have a faulty power saving mode enabled?
[   48.121346] nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pcie_port_pm=off" and report a bug
[   48.176878] nvme0n1: I/O Cmd(0x2) @ LBA 0, 8 blocks, I/O Error (sct 0x3 / sc 0x71) 
[   48.181926] I/O error, dev nvme0n1, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 1 prio class 2
[   48.243670] nvme 0000:01:00.0: enabling device (0000 -> 0002)
[   48.246914] nvme nvme0: Disabling device after reset failure: -19
[   48.280495] Buffer I/O error on dev nvme0n1, logical block 0, async page read


Finally with a PNY CS1030 SSD (Phison PS5015-E15 controller), I get this:
[    5.215631] nvme nvme0: pci function 0000:01:00.0
[    5.220435] nvme 0000:01:00.0: enabling device (0000 -> 0002)
[    5.329565] nvme nvme0: allocated 64 MiB host memory buffer (16 segments).
[   66.540485] nvme nvme0: I/O tag 28 (401c) QID 0 timeout, disable controller
[   66.585245] nvme 0000:01:00.0: probe with driver nvme failed with error -4

Note that I also tested this latest SSD on a VisionFive 2 board with exactly
the same kernel (I just moved the SSD and booted), and it works fine with ASPM
enabled (confirmed with lspci).

> I basically want to know if there's something I should do with this
> driver to address this.  (Mani, can you explain?)

I am not sure on my side how to debug that. What I know is that it is 
linked to ASPM L1, L0 works fine. In other words the SSDs work fine with 
this patch:

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 79b9651584737..1a134ec68b591 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -801,8 +801,8 @@ static void pcie_aspm_override_default_link_state(struct pcie_link_state *link)
 	if (of_have_populated_dt()) {
 		if (link->aspm_support & PCIE_LINK_STATE_L0S)
 			link->aspm_default |= PCIE_LINK_STATE_L0S;
-		if (link->aspm_support & PCIE_LINK_STATE_L1)
-			link->aspm_default |= PCIE_LINK_STATE_L1;
+//		if (link->aspm_support & PCIE_LINK_STATE_L1)
+//			link->aspm_default |= PCIE_LINK_STATE_L1;
 		override = link->aspm_default & ~link->aspm_enabled;
 		if (override)
 			pci_info(pdev, "ASPM: default states%s%s\n",

I can test more things if needed, but I don't know where to start.

Regards
Aurelien

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5192d9bb0e38bf831fb93e8026e346aa017ca8

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
