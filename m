Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12737C433C1
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7F766197C
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7F766197C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzHdHtrdnrPe/JC6aW1467O/wuwfU+d7y7APsnoOPoA=; b=NTV23H5CT9r0hCXNC64ZoI8+Mx
	m3z9CFcZf4sKl4nLGJjqr0iLrRoWbyQtHkOcGxRFu9837eqtLpcsohiH7+PzkxixAAVdri3EMj2A7
	8XfwGVIeqNglk/xXMpcKeIuQ5xxaY7uvBalgyMSWPhQjhW3dMO/OXOz1GBJ3HivXaTSUV6D7DUoa6
	Xq3zSWMsRdy1s63Qq0h8XoXnUykMLmqaTFWj/Y1VwSk4+3feCJF4E9WoEdOa9bzl7UOw1uI9+I+f5
	wbrP4zBY+PZ1e7ZHoOmr10zELbSzNoGY42r9p79Cciizukly/qjAuMFPt+BnSU+lODaudH/m3DWhM
	HucPLnUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxZ-005uxT-9C; Sun, 28 Mar 2021 06:31:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxV-005uvs-D5
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9D806197C;
 Sun, 28 Mar 2021 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913096;
 bh=Bg9d2w1WAX5KFLAnbnlQNHWx+c16ctVJTJF6+EgKbfQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wf0uvxCQIWoezH2Q//Fy+0JLf/n/JQM1fgGTIy+LNlK2ke3/GfMHR3INbhImyBKub
 PYoWfqkNgd/16507YS2V+9oXcBGnlB31xMCYPq4i/42w/2S/VMWUBfiWhHpcJilL8F
 3Ug35ynRWtusIYmXztSQi1aR21Tlyp2sgtUPmJYRmC8gtc/K5PXnkUmkkt1jKh3C9F
 TyjzDm/lKbQBpjG+hHUIJbOwh7gFQOtovJe5DUrQIogSJfInGNEiZgiDba+jknWCpx
 2kwyOHYg5WsCDiNR70IA5XNcpFv4vfIXOBFYCliK9/b+BMC46SrVQb0cTyEhy0/v1K
 h7HNGGnm6y0Eg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Subject: [PATCH v5 5/7] openrisc: qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Date: Sun, 28 Mar 2021 06:30:26 +0000
Message-Id: <1616913028-83376-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616913028-83376-1-git-send-email-guoren@kernel.org>
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073138_023055_ECA21BF5 
X-CRM114-Status: UNSURE (   7.28  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

We don't have native hw xchg16 instruction, so let qspinlock
generic code to deal with it.

Using the full-word atomic xchg instructions implement xchg16 has
the semantic risk for atomic operations.

This patch cancels the dependency of on qspinlock generic code on
architecture's xchg16.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stafford Horne <shorne@gmail.com>
Cc: openrisc@lists.librecores.org
---
 arch/openrisc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 591acc5990dc..b299e409429f 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -33,6 +33,7 @@ config OPENRISC
 	select OR1K_PIC
 	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_USE_QUEUED_RWLOCKS
 	select OMPIC if SMP
 	select ARCH_WANT_FRAME_POINTERS
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
