Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5484C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:13:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B786112D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 12:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77B786112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPTvxdpCJkIhvW+nG5nSUnXN7403NHLNP0jq7GiNkv8=; b=5DP1CqDpr2s3qw
	rzWDONLTEjV0IEZznhl0rqR7wWFU0/Ap9M6awYHuewwvqtO8friPPvvR+zDugqqXe3IM9McdUXZBA
	F96oHejM0o3UxZUb3TyexpewSq70Tjrq9wXGoNK/J6JjlWC1YJXt2SxpLYK137YY3bfqtugriLrjG
	LwNMTw1KLmvd5qSL81ijLe7HWothgT0XrlvCj4t9Flgd+WHBupoaol+gyMzdcAUHihxsJBoJ835B1
	50pt1a05S5dZ1ZzrjPdSmuyutBgXCXwTjY6n4C4Ik+T4/2SfT70LClyf/OffOAdUxxI4d95lujqja
	ojZlBhz5IW88bXsHiJ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7J0-005Zq7-Pf; Tue, 14 Sep 2021 12:12:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7HK-005YtL-MS; Tue, 14 Sep 2021 12:11:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6A9D61151;
 Tue, 14 Sep 2021 12:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631621470;
 bh=0gZ7g4PrdHovHhvTbvNDdx6ByPhH72YCH9mSQcGy7nc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bWOE2FcgJCPImZMVbgRai97mW40puruvu263BNQpF0CEHWNMsO826h665RsNX/7Jr
 aqgwL0RlnK8VJxV7LLj9nd6yswsVqUQGV82MtpUJjfx0LwA9SHq4rk56b2jwiD+VgK
 cqD25xaieY1IenKCbr7MoLWsXxwK0Kgak0Wck7CgA3p0h7TjmCFBrR0IgSRbuA3fZ2
 yxbWKo/wj1bx49qHZiMF7N3XdoVIlTNx/u0Q/KzGeXlYQxfFlk8VTcGg1gTg5W6lci
 FGMqXMPbJDkb4kUSIPn3rntL0eeF3iDCcqaD/ilJ9Dh7doCYOr//PRPgiPV1swNdk9
 8bmEuLMDGLldA==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Keith Packard <keithpac@amazon.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
Subject: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
Date: Tue, 14 Sep 2021 14:10:32 +0200
Message-Id: <20210914121036.3975026-5-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
References: <20210914121036.3975026-1-ardb@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_051110_799375_CF0F71FA 
X-CRM114-Status: GOOD (  11.35  )
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

The CPU field will be moved back into thread_info even when
THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
of struct thread_info.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/powerpc/include/asm/thread_info.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index b4ec6c7dd72e..5725029aaa29 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -47,6 +47,9 @@
 struct thread_info {
 	int		preempt_count;		/* 0 => preemptable,
 						   <0 => BUG */
+#ifdef CONFIG_SMP
+	unsigned int	cpu;
+#endif
 	unsigned long	local_flags;		/* private flags for thread */
 #ifdef CONFIG_LIVEPATCH
 	unsigned long *livepatch_sp;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
