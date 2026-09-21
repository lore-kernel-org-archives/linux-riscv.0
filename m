Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2269C982ED
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=itNN7hsfDDLCXjv9kg9sP5De67m57OmFnTWWp1STMtk=; b=JXUYtvqqC7s6wf
	eMG2Go5tmX6LJ9XkDr5zsY4d5RIiXRJmiArcbvlUGOqEYe0H+QK23CZKAqfMlc6BgPDJ6o5LAEEzR
	wZ3lySMXR/35Ee6szHcaLiFu+dclHaCWswogbFskuFUVd+e+gxyQVwiSnWEghl4XIBrx7giST57mm
	gaqzByRprvq27ur7MA3ebZ8KLGd3r8Oz5GkaSdGcI86QfUPi8LkuMUvlukhCJDzgF59r8THotZQpy
	l4jGNxpcTP///tm13MZSrfZ3kog/Cmo38uj6rtFK4e/gugaIApo9Ui7HThLh57b1cGxOz8aASz8tA
	PbaRDL1dLtC4jxDwHagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dGb-000000025Dh-0q4Q;
	Mon, 21 Sep 2026 12:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dGa-000000025Cq-3LFU
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 12:37:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32F4F43DE9;
	Mon, 21 Sep 2026 12:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EC6B1F0089C;
	Mon, 21 Sep 2026 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789994224;
	bh=mVyAaJeaChtzQ6OF0Z5CWn+l4xCID2ZJZHbDAUH1Op4=;
	h=From:Subject:Date:To:Cc;
	b=Cb3PSJDoFupnIoWd1GQH18R2JGcVBY1qlSvdhg0SUlsd91j6uKpsDGa9RYJSNTof+
	 Rr4q0bQyAdKu5gB4++6Fnqdj6479DwoYyc00MFD96zfCWVFbrR9qYQ4TG1NMEJIEtn
	 THOlLph1EH+UVECUYaqAerPkQs/bG0s7cYvKH5vDZ9mt1/oNJQkHQB/26gVuHVxP7g
	 2y0oDaENCPQtXfwLKLuAFsYY0AYGJYf51lPnJCFWb1Gyw3WRTEp3nDhgmomE4Jf6Z4
	 PlvElUPTAa4EQLNSbzf6IwPbFV5f6v4bwrNlKBSTxfrVyI3jsl8ijAP3zTlrc1gaFn
	 dtebure/CcxeA==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH v6 0/2] Add UFS Host driver support for SpacemiT K3 SoC
Date: Mon, 21 Sep 2026 12:36:19 +0000
Message-Id: <20260921-08-k3-ufs-support-v6-0-3479768a2299@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23QTW7DIBAF4KtErEs1DL/pqveougADCU1lW2Bbr
 SLfvThZJJVZPmneN6O5khJyCoW8Ha4khyWVNPQ1qJcD6c62PwWafM0EARUokBQMvXA6x0LLPI5
 DnmhnHAcTBJMBSe2NOcT0czM/Pu+5zO4rdNMGbRPnVKYh/96WLmybu/sasOEvjAJlVgnLrWNo4
 vsl5D58vw75RLYFCz4R2DpxqS4VEriyaFEwsyP4gzCgWgSvBHAdHUe0nXc7QjyIY+03CFGJWrb
 o/FF7vifkE8GaV8jtF1F6zSID1P4fsa7rH92GlxTRAQAA
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
 Yixun Lan <dlan@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817; i=dlan@kernel.org;
 h=from:subject:message-id; bh=lQ7+ODtYODGQ2WtkpanJMBFN8HKPdBl6D6z2gi762NQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqsSTQ7e8a31139KrE6Adk1R3CN0MdH8LwlkJ+K
 Jedq922pfWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCarEk0BsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0RjA/+MyuPt3j9QGkFqyVuGBTCm563VmObHNLZ+Gp4wQqw7qhirpiTQtdUr
 sOk74KSvNGTjl8lIWPxj9o1k9+MczqPH3HV1+UFzo5QIgzvRT+ww44xZj/Q1uUR+0/QREAfe+WQ
 CrK6/AkCnRFXoj+sb30JPxu9v4Nvgox3g1DkEUU0pkVIoWUzp8wy8b7AQo3x1wC0KE+HCHDAeJS
 twFcHOu+TVaRM2aWIGpyzSEmApg9CQHGYWgk2jyS+teXcPTSo1/GFDsrYsw3wbaQ/qeex4FzusJ
 nEFG8bhMClsYPsViE8IwIa9yB+Z5odVQkQMyKDQG6XKsS2X7RdnQY0v/aUqUYgrC2bh2xwwdRnf
 G22at6LJM4FRpIYfBkBsaRtRIUKIF6W4f6eMrpS3P9aEOg8ymV3s9grN+W4pH5KAPn+B6L5o02M
 qZ4A2IhFtu7pQ2Y/s7oKyZi3d0frB6YGzzXtsPR0KMBWxi1u9NMapRl+RbYe6zftRYJeXXS0N9J
 J9U5sKCLY3TVFBY41q33D3M+OghPczc43H0u/AoUUxbLA/K71ltoBeo0NWZdo9LECpU3ObL9SPg
 7KDhQQsJ3As4yKvfmhfOWr1ABQzix4kNcFThMVNx+n/61d/lm2mQMuItv0WGc/NrEYn97SkAhLJ
 37lcO4WDZUJVkFZec18GJJJf1LLNG0=
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

The DTS patch has been dropped in this series [2], and will send
in separate series once this patch accepted. For people who want to
test UFS driver, please grab the DT patch from version v5 [3].

One known issue is that the device will occasionally raise BKOPS interrupt
when doing some high load test, log from dmesg shows

[  806.710763] ufshcd-spacemit c0e00000.ufshc: ufshcd_bkops_exception_event_handler: device raised urgent BKOPS exception for bkops status 1

Link: https://spacemit.com/community/document/info?nodepath=hardware/key_stone/k3/k3_docs/k3_usermanual/09_memory_storage.md&lang=en [1]
Link: https://lore.kernel.org/all/20260918-belligerent-succinct-kraken-7fa592@quoll/ [2]
Link: https://lore.kernel.org/all/20260916-08-k3-ufs-support-v5-3-1f5d71f1027d@kernel.org/ [3]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Changes in v6:
- drop unused macro and dev_req_params
- use global PX_xx macros
- fix axi clock name
- drop dts patch
- collect tags
- Link to v5: https://patch.msgid.link/20260916-08-k3-ufs-support-v5-0-1f5d71f1027d@kernel.org

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
Yixun Lan (2):
      scsi: ufs: spacemit: dt-bindings: Add UFS controller for K3 SoC
      scsi: ufs: spacemit: k3: Add UFS Host Controller driver

 .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml |  56 ++
 drivers/ufs/host/Kconfig                           |  12 +
 drivers/ufs/host/Makefile                          |   1 +
 drivers/ufs/host/ufs-spacemit.c                    | 649 +++++++++++++++++++++
 drivers/ufs/host/ufs-spacemit.h                    |  77 +++
 5 files changed, 795 insertions(+)
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
