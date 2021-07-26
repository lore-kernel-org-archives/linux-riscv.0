Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF0EC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 11:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F0CF60F0F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 11:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F0CF60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VaNDxlPgJrInG2tgD4vRNmFxb2lZR1EO0oDVFyIHBb0=; b=abZr0LLB7a5aR3
	jtXLMYbIBmJ0/UuhX6l7PQSpAWCuRyBdxUMjMV62Zk4XDBFitFiKxL/f6Pz3iCRFwAoiY/DG3GeKn
	1SEVl8kYwXiUdCKJUh+Sc4ROhUU2Q34W72rdx/eMZuc8q5is2LkHFzzLyvj+w1YzKbFLSXkwLeCex
	RNEqwmw3Or6LrNgSLAIme3Yi/Bjq3KeqooxWqeEvZIYTOecGTnj8lwsNKWAsZwlXtotz2UnyhbFYh
	X8dSZ25Er7cWp8PICFikKkdaJZ+n+WFid9eUV7Hnyz4f0QmUhv61BKaiI3hh+5nVsA6Z+QpA8vPU4
	LJA3yj7p/BbuLActExdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7yjr-00Azpa-IK; Mon, 26 Jul 2021 11:25:39 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7yjn-00Azod-TW
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 11:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627298726;
 bh=ci9hKgw9ZpK5R8Rr9kidSzAQ7LebRavx39L3IleFBgM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Jm3n+Va6OnsjAyyPz/alHQGkuFKuLwMmjs7YygEbBIZeg1sEUlt0tXVy43p3QH5g7
 VZeV8GoO6Nvzo6J86hgk16XMW2AHTnpY9midn7WIBp+5br+1NAFUH2tgq5f8IJxPZB
 UT2EW23csYKAmpd0rLSUSUKQ0IFldVI5FKzeCfMQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from workstation.fritz.box ([88.152.144.157]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1N8ob6-1l2HcO0G2w-015nBm; Mon, 26 Jul 2021 13:25:26 +0200
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/2] riscv: defconfig: enable BLK_DEV_NVME
Date: Mon, 26 Jul 2021 13:25:11 +0200
Message-Id: <20210726112511.78350-1-xypron.glpk@gmx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:J2pEnBmcl/6kUvPt5Ucpu+qCUQ2Ksn5aX9IuWkWpclAG45E0oZL
 5gTpKu1soqQCnSoaMAdm5ocAfsAjMsDTvf0IR5J7CMSCMocjD8oXyk7Ozo6yhCA6p6XX2ep
 X5TgoaTI4UEUqBTuS4nwxGFREZi4syEpjXzBwBDOEnJwLaQGRAlu2trA5QW6lztX628+y3p
 x7Cc7fRN7QP3Z4R6rYdNw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S8dUEILjgFQ=:M5QqZES8TMyvb8vIBs8iPB
 y7mUOqAMUsru/6texw5t8LYYmHaXlg3d6FyMbnY62MNckR7yZtCpz7c4Nfj8vTJ0pdIlRvyQF
 Zqlfbs1/Oez4hX08MPKx556uZAuQJ9UJ0x1/o6EbBvJcLxZgJEfRjAkQZfw3qtDC/aaPfIy9f
 LkdqcC/9TmalfVU+fpPWEI4m6wMsKWRzy3I8dHIX5KL5UWrSzrExFAEUAzEBufmuTpr9Rgd2O
 U074L78HDRFUzrOjk/pT4Tw6iJhRht8LZvP1E3pEAVx2DMsSmBCSDRYYM/niexZ5H/vFeKAc5
 nW4lKu+LjlmvqbFf0BJn7UGutjgREvTaOGfZfa2myDIcrf4z2u+iTyYcfQPPWXEaYX3Bs9nLM
 uElImLeAS6yyJ81Tm/vxDRSeXz7tGwP68ochRKCR/HRqD2HOWf9NB6sc1X73SrU5RrU5RPFh4
 RMqLn9AfbUmcQrADzMyOTShJfjtW5fDic8ARVo9tiL54ovv1xwFIWC3osLTZEueUOFRkkI0SM
 2Depe1jTTxvMMLRNBrkPXCIKOWjve/H9tS34tZ+Vwfw4KIsbeZJkNlQkRizlP2g9SZ9EZXC9n
 oTLo0OJEbH8PLwBz/uzt6VASSG8IoAdFYXghfWDhnFU6DZKGW0GeF+H7cMJoKaHB8WQgmzTzy
 wUTg73ig3CnLLvdIagXPmaajbOerl9mwn/bl/L/BcFjVaKjeJrBRwPJWLmFfeBVLaT1ThZATM
 OwHG5H7Juv6p33Yxn4EiUMipiJXvXfp0CsOPrARHcc+QrOo28GkSa+J+b6cMqZ1/2nVMjHM1g
 BM7GLksGisJNq0NpA60RNwwBNFbPuH6U7Z5EUlPSNBGdhTrcirdPiLmuCW2Ht/dMlyA95/uLU
 OStpLQolCvmA4m7UAohewoF1AjtZY2CcOomzxuYoBdwmTwAN/wFfvJUyqVLsskUPL+beTlXAf
 cP6lxWuzRyuxKI7PchS94ZEv1/Yw5MXYELfK0IFkYqlT4GP2zkF+QmXxJya75K7g6rQ3vHR4l
 xUNVabsfWNWvuS9zCjRA5l5K8Vps609dC7kukj6SWgyQprlifYmi5o2JbR1BexxD0wNSAQjE8
 RKMzR8r1OQ9mRH8iGy6/cguo2BC9DV3t2aX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_042536_300689_00CF3937 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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

NVMe is a non-volatile storage media attached via PCIe.
As NVMe has much higher throughput than other block devices like
SATA it is a must have for RISC-V. Enable CONFIG_BLK_DEV_NVME.

The HiFive Unmatched is a board providing M.2 slots for NVMe drives.
Enable CONFIG_PCIE_FU740.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 1f2be234b11c..393bf3843e5c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -39,10 +39,12 @@ CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
 CONFIG_PCI_HOST_GENERIC=y
 CONFIG_PCIE_XILINX=y
+CONFIG_PCIE_FU740=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_NVME=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_VIRTIO=y
--
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
