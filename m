Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3205DC433ED
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:12:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9B96139E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 16:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9B96139E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QySWD4M0kLRoac4rR91iqL8gIROFONzf/F5b0I7A1Vs=; b=SylGkem9nUvro2lpNWqglIbzL
	WGArs0Aam9x81+5KufTygN9dk6FJDtWpqJ7i1L6I0ANXUDeVDASFjirGR/myvsAea/uPVL3QMHt4i
	shtE30AqTS7vCCkRvpzKDjhVMgss4OnRb/JZadkPYWYUcly0V4+RTK3K19wKz2wza+bpZUh3CWfpE
	Z1FZJEUu4z68YZKSSAXpjBFoj3BanDuLtR1Qe7SwFJJIfddq6UOB2Vu2MWyGHd4kK7Xs8g4udGPph
	WJJQYNeOOl0h2qHI30FTBvfUJdGnm2RwYgOptkCJyqiTVYnFLWgxel8H1Q5mGjqQYYA6f/lN9Hbk1
	IhuJZ3a8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTRq3-0001nv-DI; Mon, 05 Apr 2021 16:12:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTRj4-00Hab5-0p
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 16:06:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91B90613CF;
 Mon,  5 Apr 2021 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617638697;
 bh=QTHRy0qn11avl2j/plu94sJH14RZCJpjJZGTvzB4E+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iUxS5UWn4yuzexH6xZz1oj/OYMUWqdMQ/TYx8KLMEBCQl1OiqBAhxWGcoH1BGclnW
 K2AziRLWl8b0DoCkUF+J97w+o0HNiCV8dCQN4+kodKiU4xkFsjF/4QDN3JC7HiAAeI
 bRBqhal8Qohyw2Dyhjg4MEvCwaDJKT8Suwh92nfT61MLdXxtnBiZ0rKj1Ok5KoqsVB
 YHGzqWeLXieZn6CuOSYvj4c+I331FIQje7Q7YOvFoXkPqGnVoM2ospI8jxfK432VOc
 O8MtaoMmGBFBp7Czwg768rMd2DCgjI2wfAbtCgL77R8pTlC6JtfrggGmHiqM8ZXsRo
 ZXE35wliuZ1Ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Zihao Yu <yuzihao@ict.ac.cn>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 21/22] riscv,
 entry: fix misaligned base for excp_vect_table
Date: Mon,  5 Apr 2021 12:04:30 -0400
Message-Id: <20210405160432.268374-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405160432.268374-1-sashal@kernel.org>
References: <20210405160432.268374-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_170519_145349_737C62BF 
X-CRM114-Status: UNSURE (   6.86  )
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
