Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C87ECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Lp4DeLwN+CN+IB1Y/3VooQWTjls/BSNdNy4VfEZSFc=; b=pWQHpJBAiHzWKT
	4QcpB9GwQGmF4NSb353BruczRPAUvAn00aGNStvR+vv8WCrDRNSc+4aQk116lI0VvWGYGhTCIdRbY
	g/HLjH0gBEUrKd4rtHwjjSdsUXZfa8n/gJxVvt+xqGsOqPBBP52MpX7ChWLOdqtJLxGWtA0STdppa
	oAODUoZM1T+TtRXU/7F1Z8Sr+O3QhvP+bPl9krZuCLDl4x69Qw52SdbsyOVXdbi+k6TyHd9riakJ/
	nTWhfrY0Tdm+dnHt7RJ1TipMwdfi+FL5z0ukZK2CSK6HE9utm/aFEWzNzNgihH6rg37Tx8+PhqI5M
	w+MnJOswPm8pGc5XpLug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8lH-00CGiF-3U; Fri, 16 Sep 2022 10:39:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ8k7-00CGC7-PC
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 10:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E09B62AB9;
	Fri, 16 Sep 2022 10:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFC6C433B5;
	Fri, 16 Sep 2022 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663324719;
	bh=fQQ9LRUqfsx3cfYecZ/0UH/3uQDGIYX4CW3obG1yBZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzewtFsNS61ypGzXNK2PDmiBaEPZNyIkkIMymnIQXNEPqn+Q3M8xbXTEdBz6xbpwo
	 zRT6AofFaPWxrMpqjCfxOz3bGBf4wNMeK49pD3POBxZ9sBQnxIT+AJZHKgdkG0wwR8
	 9M0cyS+qdIqTYT94EQiSP2IeCvyshuhVLLr6FWWuBKOE7T7reC7WNxcb0yyvK7f6z0
	 Xcu86W32cEBNJXdtM2lG9HPyqyfRoL35gLMw20IxnkRmkNQpzyKJybShqm8hiwIygT
	 KQbFrehUKlkGr3zbHmXMRjeYE5Vx5+c9qbbSiAJmMiQWxv+ODqUIOASe5aCHaA7UIX
	 eenodqYgWuRCA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	rostedt@goodmis.org,
	andy.chiu@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	jrtc27@jrtc27.com,
	mingo@redhat.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] riscv: ftrace: Fixup panic by disabling preemption
Date: Fri, 16 Sep 2022 06:38:15 -0400
Message-Id: <20220916103817.9490-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220916103817.9490-1-guoren@kernel.org>
References: <20220916103817.9490-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_033843_913036_3CF91F53 
X-CRM114-Status: GOOD (  15.01  )
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

From: Andy Chiu <andy.chiu@sifive.com>

In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
forming a jump that jumps to an address over 4K. This may cause errors
if we want to enable kernel preemption and remove dependency from
patching code with stop_machine(). For example, if a task was switched
out on auipc. And, if we changed the ftrace function before it was
switched back, then it would jump to an address that has updated 11:0
bits mixing with previous XLEN:12 part.

p: patched area performed by dynamic ftrace
ftrace_prologue:
p|      REG_S   ra, -SZREG(sp)
p|      auipc   ra, 0x? ------------> preempted
					...
				change ftrace function
					...
p|      jalr    -?(ra) <------------- switched back
p|      REG_L   ra, -SZREG(sp)
func:
	xxx
	ret

Fixes: fc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Cc: Andy Chiu <andy.chiu@sifive.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
@Andy, could you give the patch a Signed-off-by? I just copy your most
important comment, so the first author should be you. First, let's fix
the problem caused by my previous patch, and you can continue your
ftrace preemption work.
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..b3454c843932 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -272,7 +272,7 @@ config ARCH_RV64I
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
-	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
+	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 	select SWIOTLB if MMU
 
 endchoice
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
