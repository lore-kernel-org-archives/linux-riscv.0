Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6D6C433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:14:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D461B6139E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D461B6139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jnVeBtRK02W0mIMY7sw3oMhaXnAIxv+dzPD2K6tqeuM=; b=D1Ydh/AkAk9nXsZIPBAw5AR+D
	532R9DX29v1QutQCe3hvQWvFcrsDnkGR3r4HuIgCizipfN2rvyMmMUHYYD7X+FSp7CSYoglNpc8jD
	Pe+a77S3++2K5JeZRpz5U2GHCFpdMKkgTeS3+UFGhde8BZ6GA7wz4OxzapX2RVznDKAeFrAC9IBCe
	TmARECWtpCHmnsOkNeepIhZSKX8yag2A2H0NSwNKDCwZAEHruCW+15BZaF3p88fWrKYBJAEzI2DXS
	6RxNSDPImjwL/BcKNmCsNNCo4aYs5L/a66pUm+INHwBcsLSnhX59IOgp7uObEuyuGv+b15+vH8zpn
	IBXr5tmfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTRrf-0002co-Ds; Mon, 05 Apr 2021 16:14:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRjk-00HaoU-CQ
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:06:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47453613E7;
 Mon,  5 Apr 2021 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617638725;
 bh=czU1BBx5gFfWn2AkdLFSpb+b7yuGXEGeypDvJmsYFWU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SLc8mG9PN+/yaBXDrc2t+3g7KW1yXKh17UZU+ERdCfwi7DF/V/NcVIjphzCKfaEB6
 /GzsqUQWkVCyJz93VgQMraYKJU2kZ+IcaefNKxMMEAly4E3MEPqaHHJxHuq/PMmETm
 vajDD0n2ydR2eOVdhFCsEqLFADfouIoUhaQdJNYwTOWAEuI+Cmvcljp3ZKh+93KHo6
 EmU3w4C6+B4yNHvnvcsmvCL+l8LhyxZCFroO+fds+7vZEgBvFcwsoYzqSEAVCgw0sN
 XCNiHWhjOp7yNtW+SgmF1ODucPBK/3r/y/WVZuSxByeLhtTyt50qdBmp0lmWKDz0K8
 QB7yUCTxGUzPg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zihao Yu <yuzihao@ict.ac.cn>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 8/8] riscv,
 entry: fix misaligned base for excp_vect_table
Date: Mon,  5 Apr 2021 12:05:15 -0400
Message-Id: <20210405160515.269020-8-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405160515.269020-1-sashal@kernel.org>
References: <20210405160515.269020-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_170601_379382_3B9736A5 
X-CRM114-Status: UNSURE (   6.95  )
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
index a03821b2656a..d9de22686e27 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -449,6 +449,7 @@ ENDPROC(__fstate_restore)
 
 
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
