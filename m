Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A61FFC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:24:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6AE6139E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6AE6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QySWD4M0kLRoac4rR91iqL8gIROFONzf/F5b0I7A1Vs=; b=Pimp61K77zQ/PARynxWl47y/b
	5ylXMSGV3G3Fl3T2AZfZUdLIL5A1NsyuV9VQ5BCtjTILLxc1JutyWATi6AVnGD3LEW3CuiqkA+WBa
	WGtGbM8/Npz+RLYNxpWWOt3vCHzjOo0gp7G8JDZ3DGUYvzR9BAxi3MGup2R72FhsCzc2cbgAjDrXZ
	dxX15AqIOPyiqSkoeJr4cd7A8H1xDvIlxRHrRXovgMClGIEfMmIg/uFNlkuRKFNq835O9teqhLFCU
	/TLMZSsNQDV92M+S91Ah19K6fPCaFk/vzqOJA51OF3+rehlYPlzROM1IQGBUUySg9Pt0Z6rCrrCsx
	mpJW6ZGSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTS1F-0005ZJ-K2; Mon, 05 Apr 2021 16:24:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTS16-0005VR-VO
 for linux-riscv@desiato.infradead.org; Mon, 05 Apr 2021 16:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EU/1mNg4pbDa+j4Z8j0mb/Q1QQUngpV8rykUjuqwIMM=; b=SU4x/1atMvGjvjZ6xhEF/dBKV6
 vPXzQLG8H5oTe94G4QobI1FQe7pgYB+Xnatnbl59fHtirkzxW8mqTNFIFmTfpgPEwAvRqbG/YKevX
 mbqD/kwNp+/ASVHqoTbvgJpiv2PXCuA5EbFkNwiuQ6ujM6Xd2L6C5rH8vj+wnDjKygis9//EudKA5
 tZ/ZYWhVpggPhG/d1mPugAPGKvyWqdjNSFE8psGofkuz5h4pcRaIR2CaPu6dgPKp54QaCXJTd5n8W
 3rUa5iNRFO73Zf4fCkUNGI96Tt2WGbc+AG1vCC1PTE6l4RYJ0Dtstuki6ZDjaCqqmec2pA8llFm74
 xGTm+MuQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRiO-00BZlP-Ap
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:05:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 603EB613CD;
 Mon,  5 Apr 2021 16:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617638670;
 bh=QTHRy0qn11avl2j/plu94sJH14RZCJpjJZGTvzB4E+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fFXSpUgut1XaJfC371dIaXArrWjxCzVmeDQHi77xBuxL6vak7wugpbg9xlNOyDlo+
 YNyiG8JtCldqTtndZqMStfjXbx3vjaw73LyXmIH2S400MkupwSiI0Xz9u4wFqQtonq
 7WrVphEeMuOrNl06MFuOJ1UCk3CtE8pKbjPeFRFznfyM16ugjLGLpYfPHuKxMMTW1O
 W6gpIF32XifQzEZSc3NtrmD96cEsNEUv5PhGAf8F+9YAoMxkyw6JVAITUmb8BlONZZ
 5XVMjRWvGiYZOpC/tTDzjs+Yx8V733/iEy+KraiPy7+h4/wCqhK6cDjB/iQTBRPQfB
 B7yEp1b/LMOSQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zihao Yu <yuzihao@ict.ac.cn>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 21/22] riscv,
 entry: fix misaligned base for excp_vect_table
Date: Mon,  5 Apr 2021 12:04:04 -0400
Message-Id: <20210405160406.268132-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405160406.268132-1-sashal@kernel.org>
References: <20210405160406.268132-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_170456_368143_9D754940 
X-CRM114-Status: UNSURE (   7.53  )
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

From: Zihao Yu <yuzihao@ict.ac.cn>

[ Upstream commit ac8d0b901f0033b783156ab2dc1a0e73ec42409b ]

In RV64, the size of each entry in excp_vect_table is 8 bytes. If the
base of the table is not 8-byte aligned, loading an entry in the table
will raise a misaligned exception. Although such exception will be
handled by opensbi/bbl, this still causes performance degradation.

Signed-off-by: Zihao Yu <yuzihao@ict.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 744f3209c48d..76274a4a1d8e 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -447,6 +447,7 @@ ENDPROC(__switch_to)
 #endif
 
 	.section ".rodata"
+	.align LGREG
 	/* Exception vector table */
 ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_insn_misaligned
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
