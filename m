Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248BEC88E77
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2026 03:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vESAjnqhnUvwtCu6P7UIRWVBygJX0ARrwGFmiz099F8=; b=BPOcTDdouqMr90
	xMbe0I0MtpTpC1ew6Y5rhyI++/o20J0+KuphttMtwh+GT1pJxVDih6DUMpPlQpiTlP19eE7AiKfXO
	eE5qOEpsr38lb2k6QcpSYnKL1kG5tTx2GfVN+L/I0KK3+jqDEtSKAiuCHeXhR+w8M5Zd/afga/NL/
	sooGSLr7tEAEnBhKGGwggDLt4V6vP/nSPIm7rAXOGuxJpA8bkBOLtwLKewjg/AFMW1WBimXEUnTpL
	Gb/1SOBP4Z1BP4qCPlJXvdrCqosviTsNoqpFVh8jQTTpE4NyodW6oVcbmPJ0A6QVxDO55K/nfTCoH
	6siK+HGW8wT5oK47J3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fsc-00000008D2O-1P1u;
	Wed, 16 Sep 2026 03:00:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6fsb-00000008D1k-38pt
	for linux-riscv@lists.infradead.org;
	Wed, 16 Sep 2026 03:00:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 023D342B7D;
	Wed, 16 Sep 2026 03:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85C71F000FF;
	Wed, 16 Sep 2026 03:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789527612;
	bh=2bdF78kpI2KMtKEo1UhtIDs9SRrcav8S/mCxdPezFrE=;
	h=From:Subject:Date:To:Cc;
	b=L1IaNBKRMh7tkpx0TO4JxumQ+lDv54WoXC7lQc6Vff1HOHQ3LntVjYadJvNJ6qC5P
	 mHY2MLjxGtBjg3Mx/CDJ7uy8kSvKdWZrb+kz08oyT84rsYROD9Ot9CU1Ba/3BZPx/8
	 VrY+3oqpPiZ4fCByRXh5BNG7TVUry4Y7hauks/HMQgk90ihspl62d7n5ly0vHqPoP6
	 SGfQmQV8VkKbN4YqaE0ksYjb0HjCBjdPQw0AV5Py8dMefOqb3e0HNdy/2T8Cgs0Q+I
	 VHQJow0bRLwuxHVsLP2Z5xfd4YmL5OSEoKX8vb6PR7qdzduG6j7v25oNjTS9RM3E8i
	 N1Sj5v+/GU1kA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v5 0/3] Add UFS Host driver support for SpacemiT K3 SoC
Date: Wed, 16 Sep 2026 02:59:52 +0000
Message-Id: <20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23OQW6DMBAF0KtEXtfVeMYYJ6veo8rChiFxUwGyw
 UoVcfeaZJFWYfml+e/PTSSOgZM47G4icg4pDH0J1dtONGfXn1iGtmSBgAYMVBKsvJCcuyTTPI5
 DnGRjPYFlrSpGUXpj5C5c7+bn8ZHT7L+4mVZovTiHNA3x5z6a1Xr38GvADT8rCVI5ox05r9B2H
 xeOPX+/D/Ek1oGMfwjcejEXV+oKyDh0qJV9IehJWDBbBBUCqO48Ibqm9S+EfhL70t8gdCFK2aF
 v93VL/4llWX4BoBGquI4BAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3425; i=dlan@kernel.org;
 h=from:subject:message-id; bh=+SacVXUkr8j5POKRnHb0Al+tmH5nubSQVqCvfMvF4U8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqqgYrD6CluHigzTNYp9BAViOiHlWDbTZB+eC8q
 XP28inYDTmJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaqoGKxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0FFg/9FLomF8pxFXX8jY0C0hu25u5AKgzCurSfBEExbJ65t4SfMgTDCZh6q
 L5wTX5yeSAJy9upPc5KjXyECAWFqPD0Anl3zloVs/v4OJfhA5eQ2ILIMGnYT5jgYthEAiRwAEmN
 4ntY2aXhw3r093ukfQIc//TqnPlck0JamdQD1u2jUIEZI72QsBW1AIWBwnr/KejQyCOyZjdgcnY
 PG4vesQOUPOeUBmhv54tNlLyvUubOZQ/bjOlEZRGPsnyFO6BtCH/ThzdrwvIxkPDl1FZXRawq0t
 +Xe1nbL86+XUHzv2ZC0iLQoyi8xeK6g3hnt2CANG+bEoHhwZhDCHLowoR8DKpaw0dYUQ1y+U9b1
 WEyaSLyyogYfSPX4al1rbI+hA8YtQjvuqYrk1D1eYt8HHiqY3wrVRcR8cXtbYcwQfI78Gbd9pYS
 Jj6RNfAHQxhL/6bqDwSK2Nz4IdIllAeA9miGbwkcDCJRKri+XXoMIcr+Ia92zK/+o7Yfrj7MvnY
 lArLsnQ66XLrjJQhZDJdvoxVFAHyTHLiZs4ALLxmINoR0laqfJ4NuSGj5bccNQHKz+QCZRLtCFx
 D+2f+QQYe3CsHrWJH7YcHpsZw10XUWHu9quVmRhGa5wwzhPrwGM0VrRR2y5ov7Mr7hZMsVJSi4N
 YWzuVg8uPdQT09zP4xsnyoNh1VICQc=
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
Changes in v5:
- adjust clock names
- add runtime power support
- collect tags
- Link to v4: https://patch.msgid.link/20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org

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
 drivers/ufs/host/ufs-spacemit.c                    | 688 +++++++++++++++++++++
 drivers/ufs/host/ufs-spacemit.h                    |  79 +++
 8 files changed, 866 insertions(+)
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
