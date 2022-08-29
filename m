Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8676ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 15:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F1oLkIcUEWpuwg4n3Ny8+QFjngvyZ0kUWq8m1qPaEH0=; b=Fzradx1ooV+sBL
	fhli7oRXRyC5llYLYdG2c+VvSSxBXevj3Dw2odmq+GOkqMZn981IvH9i5Ah+eg0y1gcj/+QoIA8SW
	9GDR9dWzC41FnI+uIJ08aMBmitfW8Ad9rARugZexUSVRxB7ATsFerEVoXEiAuh6tqgRMTT7RSkS7Z
	WeNw3XYarEyRZTztnHQ9H8FmYRAAL4Yckz3iHXy+yJ7gqcOYla/s5fclMZtGJINnwmAHU3/fwer+1
	R4oRIA+UYwPnExpnFQGVzzce+TXHgs/sQ/cVLrrTyk4+9TDQwhy4SzlUApZbI+WfAwEPGVShs598x
	rts7HNIuM2SlhEXgGCMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSgLy-00BGUW-3E; Mon, 29 Aug 2022 15:07:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSgLu-00BGTe-OK
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 15:07:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0811610FB;
	Mon, 29 Aug 2022 15:06:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 954FDC433C1;
	Mon, 29 Aug 2022 15:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661785618;
	bh=K2Sqs5g2tp+43xxFZspN1D8v3qOT6RryXTyaXO3QnJY=;
	h=From:To:Cc:Subject:Date:From;
	b=YYXlnOUgStpRCiFT6xNptSzJyFRT4JucbhZeoUfkRrgmPajuUSeKoR2RX375IVAwW
	 fWUicxuedS/yJYoXbHl4oSA/B2FW4Hz1VP9bGfUEJlbJX8b/18ozyR5dvuBNk65C/1
	 0qtiP53v9e830gxaaZCnzYMnKam3CbPRjQ4nOKmzqo5F3Jj+l1hxIot9mlt3Y0BGiL
	 fKvlG2pZGtIPoSDEMmqaV1Mh/qCP9u7wSb8asYue/vJJuJQ8Lc0UToDR4WpIVVJLP9
	 Ew2MdR07uCX8N1dG2rJ8pMmJIueJ2b/CS8S5qxyNZBtoIJx5RjYNRLyepRzDAfq1Qb
	 SMTZRKKlK8L/g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3] riscv: enable THP_SWAP for RV64
Date: Mon, 29 Aug 2022 22:57:42 +0800
Message-Id: <20220829145742.3139-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_080702_926539_4D7A1605 
X-CRM114-Status: UNSURE (   8.52  )
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

I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
memory optimizations such as swap on zram are helpful. As is seen
in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
swapped out"), THP_SWAP can improve the swap throughput significantly.

Enable THP_SWAP for RV64, testing the micro-benchmark which is
introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
shows below numbers on the Lichee RV dock board:

swp out bandwidth w/o patch: 66908 bytes/ms (mean of 10 tests)
swp out bandwidth w/ patch: 322638 bytes/ms (mean of 10 tests)

Improved by 382%!

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
Since v2:
 - correct reviewed-by tag
 - update commit msg

Since v1:
 - collect reviewed-by tag
 - make ARCH_WANTS_THP_SWAP rely on HAVE_ARCH_TRANSPARENT_HUGEPAGE
   instead

 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..79e52441e18b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
 	select BUILDTIME_TABLE_SORT if MMU
 	select CLONE_BACKWARDS
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
