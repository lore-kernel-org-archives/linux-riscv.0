Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF19C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZMISc7eSQ5NVLSV//SZ414O6kuJ1i2eiUkOyk0R0OYc=; b=MeNqRQdTZvkIfr
	XKazdBBpLuKpAGXtMEfKHdt9kFCRkpWRB9tUcgnATJ2oBW2acv2h1gpm+VyxPmw7StywPC9VdA4n8
	2lfD2sMBN/WXn6vcOtO0LQd7Zfgxh5EIjnX2w1W1jcF8JVIbbGXJ8oM+SiG+OrftwEBdQqBJE1WwK
	DkHgf+m8elgzfPMYV4D40X7qwDgIud9Fu45ePRkc4d3DD/88Hu37C2znozr48pYQVTsPQSsYMN6l+
	Dlh7m0+Fo1+8EbHiQtMoJ9fE2T20hD9UPfExb3c3j+9Hx0gV4oJqg4cevPxI9I+yrmwgL2v/mgpJx
	dMUcZEg10ZID+IXuunwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTJ-00000008Ipo-389n;
	Tue, 08 Sep 2026 07:42:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTI-00000008Ipi-3UlX
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 07:42:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E56141FFA;
	Tue,  8 Sep 2026 07:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CB21F00A3A;
	Tue,  8 Sep 2026 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853344;
	bh=Yt1ZLsvwz/wveJofjkyiXfvUzjQechzWtb2oZEGlA/w=;
	h=From:Subject:Date:To:Cc;
	b=jQ40zBgc23lic+NuVuVAzpZG44j577aLye3z8QU9/+wDtcXrubdlZdLtSUQScKw5F
	 jF1OAysQcfhMobuKNk33dLg9xzM0OYMN1AQV84fhaSNhxGWrt6mmsXTgD1E3vlSGdj
	 Pb24Me2QTue/rJCqxEf/rFLDRxc0FmYh3fdz88uVFhEC6+gvRDWDjUISHASB5CI1/a
	 eH/VcGgJMWES8MtHgfIZ3n1xRHjekd0M4IQ8tBkWAdg27ksuUAmFv7Sj/u9Lbhw+1N
	 Z2srWtd92wqhhGB/2KqwLzkOO+bK9O0gX4AXyFdByozKyWGwiA/LQ/diSm2DOAL8Dl
	 TgogVUPLh18xA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v4 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Date: Tue, 08 Sep 2026 07:42:02 +0000
Message-Id: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEq8n2oC/23OQW7CMBAF0Ksgr5lqPHaMxYp7VF3YYZK4VElkJ
 xYI5e51YNEisvzSn/fnLhLHwEkcd3cROYcUhr4Evd+JunN9yxDOJQtCMmiwArRwUTA3CdI8jkO
 coLZeoWUtKyZR7sbITbg+zM+vZ06z/+Z6WqG10YU0DfH2GM1y7T39A9KGnyUgSGe0U85Lss3pw
 rHnn48htmIdyPSPoK0Xc3FBV6iMI0da2jdC/REWzRahCoHq0HhF5OqzfyGWZfkF2kpctEsBAAA
 =
X-Change-ID: 20260605-08-k3-ufs-support-c8b308e415e2
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3244; i=dlan@kernel.org;
 h=from:subject:message-id; bh=mbQgsh1zPtyhIoEc7mEatFQs0vx3FMGzb/CQNHQ7ksQ=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGqfvE7I3t+a7bAehgD0o2WyQ3zVqB7WU61ZsNQvgOxfOjw8H
 YkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJqn7xOGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjEyLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277b5SD/wJL7El+uDwLn7vZJ2CtIW6GJUtmhMSIjA/F1PNlWTj/StgaNRpkRR6dRDsMPfp0
 7PUZQ8N4VN8423CmoZA2/Y6h6c9E9tWuUQerR8tS3lWRkubfRUVe0gfc2wbyjMMirABZIOg5isx
 Y05PIDPxVvyNwpzAZhQG2MHtjhj+/wosWg939Sni/yNwa2NfUIMB+0SFrWcJqRtbY0MhhcU7dqS
 Kg6wDsZC5hVn+HRmcjtdoDfJOq4EBEVzwU8pazstfquTU/O3djISyja4DQl3KokAGH9A/aHU9fK
 i2I9Mm4DB8w10ZLjhnAmpKKS6DJJ88QnAujoPBJgNFsZYNDZTjsC8PrjAebYj+E1BkE+QbP5nCD
 RyHahIUaLxpCKOtfWhteCjcDCZuXSAKd4k1x9oZPiuztj3EPjIohA8f8sc2Day8o7o5C8nZyUKQ
 O3fo495M0idcPnv7fzaPVt7vyN9qUytT3OlwddpVNBtXN5LuTCcHowHlJ9A/zj/3XyQV6zB+cL9
 KyAwxxjfXjROsJ4+cZLBv5plhf/YJL4v/jwxy162S0O4Zz8AM5wEQen0OZ6mN+0ChVKGdeRhOVp
 LVAcjNVFNiZ2f18rxryodcdOg/2pGrAqXLG8TIiMddeCi3/VUiTkrYGe8Y8ycsCnZarKDNJimHO
 HEDMiEq0e2RtZC1M8POPA==
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

This series try to add UFS support for SpacemiT K3 SoC, the controller
components consists of System Bus Interface Unit, UFS Host Controller
Interface, UFS Transport Protocol Layer, UFS Host Registers, Device
Management Entity (DME), Transport Layer, Network Layer, Data Link
Layer, PHY Adapter Layer, and M-PHY Interface. A more detail functional
block diagram can be found in SpacemiT website, chapter 9.7.3 [1]

One known issue is that the device will occasionally raise BKOPS interrupt
when doing some high load test, log from dmesg shows

[  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1

Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v4:
- fix clock and reset settings
- drop function which retrieve value of tx_lanes
- propagate return error of ufs_spacemit_dme_set()
- check return value ufs_spacemit_check_hibern8()
- drop call to ufshcd_vops_phy_initialization()
- handle compiling warning if CONFIG_OF not enabled
 add __maybe_unused to ufs_spacemit_of_match
- Link to v3: https://patch.msgid.link/20260806-08-k3-ufs-support-v3-0-037fb322acdb@kernel.org

Changes in v3:
- collect tags
- fix dt-binding warning reported-by sashiko
- fix low freq in opp-2 table
- fix err checking in check_hibern8()
- propagate err code in link_startup_notify()
- update documents for event_notify()
- ufs clock driver is merged into v7.3-rc1, update cover letter
- Link to v2: https://patch.msgid.link/20260725-08-k3-ufs-support-v2-0-45036a2a2418@kernel.org

Changes in v2:
- fix missing interrupts property
- move ufs node to k3-com260.dtsi
- convert freq-table-hz to operating-points-v2
- rework reset_control, fix header and drop global variable
- drop dump_host_regs() debug interface
- converge and refactor dme_set() operations
- massive reduce of busy delay() loops
- drop vendor specific hce_enable_notify(), fallback to default
- drop unused member from struct ufs_spacemit_host
- add COMPILE_TEST support to Kconfig
- comment style fix
- Link to v1: https://patch.msgid.link/20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org

---
Yixun Lan (3):
      scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
      scsi: ufs: spacemit: k3: Add UFS Host Controller driver
      riscv: dts: spacemit: k3: Add UFS support

 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi        |   4 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       |   4 +
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  22 +
 drivers/ufs/host/Kconfig                           |  12 +
 drivers/ufs/host/Makefile                          |   1 +
 drivers/ufs/host/ufs-spacemit.c                    | 678 +++++++++++++++++++++
 drivers/ufs/host/ufs-spacemit.h                    |  79 +++
 8 files changed, 856 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260605-08-k3-ufs-support-c8b308e415e2

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
