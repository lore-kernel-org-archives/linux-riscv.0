Return-Path: <SRS0=mVFr=UJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D296AC4360E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 22:16:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A855D2086A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2019 22:16:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F/Z6etW5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A855D2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPfymVl/q/SUNWNpIitdDXYtbVqUMi4EdgLl3K4SNGg=; b=F/Z6etW5BGVwfU
	r0lXGTEcwq7iZcpFHzKgjKss5jKH5Eq5hg1oCWyGg7bWf+VDLpa0j6kT/mW17D4sgc+A5q8HW6h+i
	nYHdwBjXgVUh/8iQbwKYdEDbMSnhdjRrJcTeBwvgIyCUSNRFvFblul8FXnNnD8cQwwlSo+mhsDeL4
	Zy5ytz/7B/pqkfsgH+GNADLYUPEvznh7/gtlEFZTpUZRLlwgUQYd9kashf3dxzeIqdaLHBThLbbKV
	+G9artA8FHV+Zx44Zijg0AAVHSeIIEl6cZCyCy+Fwby6Z8eZxOHlLVMpnN7BhZZclnkX1oMQqcO+c
	S/ot6WI6KFyZYyuGw1iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haSb3-0003fE-5U; Mon, 10 Jun 2019 22:16:57 +0000
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1haSaz-0003Vu-7L; Mon, 10 Jun 2019 22:16:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 11/17] riscv: read hart ID from mhartid on boot
Date: Tue, 11 Jun 2019 00:16:15 +0200
Message-Id: <20190610221621.10938-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610221621.10938-1-hch@lst.de>
References: <20190610221621.10938-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mm@kvack.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-dev@uclinux.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Damien Le Moal <damien.lemoal@wdc.com>

When in M-Mode, we can use the mhartid CSR to get the ID of the running
HART. Doing so, direct M-Mode boot without firmware is possible.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/head.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index cb5691d82b0b..e05379fd8b64 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -25,6 +25,14 @@ ENTRY(_start)
 	/* Reset all registers except ra, a0,a1 */
 	call reset_regs
 
+#ifdef CONFIG_M_MODE
+	/*
+	 * The hartid in a0 is expected later on, and we have no firmware
+	 * to hand it to us.
+	 */
+	csrr a0, mhartid
+#endif
+
 	/* Load the global pointer */
 .option push
 .option norelax
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
