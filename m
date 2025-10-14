Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A42CCD18E
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 23:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wv5uuXSDlHPC1a0A+O38jOsZQLTinjMIxenXXchRkWE=; b=Mm4rjidQ3E2NpI
	kRwbT/Peh9XqefgBZ+yhlmhgZlD/4GDSjl/D3tmnvVahc7NzG1j/lq3fyi3juhRNwDueY74DMEKwB
	T3alA0EkU+83hfJS71qX43LKEBQsLjhn/Jwz6gOxS9znoYaMr3r9xwUUPGV1+FZyAHHI3pNjFx1g3
	3e7PuncKIvSEL8+cRhp7KLeSzpmFW3g/CAKFf6OMXT0j7yFGFHpMdwpW6sMlrj0EUnZEKygDr5vgu
	beI8HdkDdWpeMYm06xyKolSxBr20zWTr91n3hMsVpU74NdHDD8UURvzVps2NoSM+N8z578+t+P42n
	XB9hUKPEpLHXlZYWSh3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oOa-0000000025u-2buA;
	Tue, 14 Oct 2025 23:25:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8oOY-0000000025o-2YEj
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 23:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD1AA6230B
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 23:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5041BC4CEF1
	for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 23:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760484329;
	bh=tNPTMHclE2v1kj66z9fmApyzZGk8eFYa8VAHD4wmVm4=;
	h=Date:From:To:Subject:From;
	b=uZjJNpRNUB8aJIZhFvpnY/don0upx3ZYJLqAaa7+2x77aZilmh2naU3r0rvb0uLmz
	 zIONTskUtzTmUoi8vPosQvBb6F4NFxkxwI6wVaibF/Z+tJyT2kZ09ktHASaVrIoJ/g
	 65k41Vwc1zqCP18jVlLIQ+WyPKvtGxyMvS5ATXHIUIs6waoQBvQuzs/4CONyvArDY+
	 D+wzikx9H9H22W/7LaUfRSy6Wu3G8ufyMTD+dTAcWTGZ43fibXkciVIA5mWgufl5m+
	 eRDHEBcXqMLR9OUSqi++P4AfIbl35ZZpG+dGZ8XX7z2Qrs++RbRZizZtUqDVZHOBKv
	 Ki929IwZ+PuCA==
Date: Tue, 14 Oct 2025 17:25:26 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: add a forward declaration for cpuinfo_op
Message-ID: <b831f349-5d0c-f7ac-8362-acb20bc6221a@kernel.org>
MIME-Version: 1.0
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

Add a forward declaration for cpuinfo_op to resolve a sparse warning.

Signed-off-by: Paul Walmsley <pjw@kernel.org>
---
 arch/riscv/include/asm/cpufeature.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..62837fa981e8 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -31,6 +31,8 @@ struct riscv_isainfo {
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
+extern const struct seq_operations cpuinfo_op;
+
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
