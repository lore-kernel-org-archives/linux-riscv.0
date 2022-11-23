Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055BAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+TdWRSWhXwQPFvlkp6TCrgNF/+SPn5Nv+YOLm1bwM4=; b=z28NFE4WdmQTHK
	M3xRAlKATFEjoOeJ1rZiS6p6O8ruZVJJApi+9aABNtZVb8aYH4Nb3xxSqquCbGzari9TuPxm6tnCu
	XC5IanETrVGb0PUV1df2nTdMvmUbsw6N6CKzTFfvBLKB2vs+R8iYxtBWsPaXmvdIs2dpFArN8xpj7
	eLfXKujXu7V4nw4mntSd2TlRBd37/NZriOxaoBMTFKmdjV63L65SgrqIagxQ/v+KqjLefQXtQYI7L
	0ux+z9h3dbd3CgkCP7IQkPto/u6/Hdo1vuPLYles0sJO6IdYDGreh/wDnAYwIgJzh7IwnlUlEzQLr
	3fw/KUDSbH8m9WkEVnDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrrK-000X4g-Hf; Wed, 23 Nov 2022 15:40:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrrA-000Wvj-Bb
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:40:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6B42B8216C;
	Wed, 23 Nov 2022 15:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDE3C433D7;
	Wed, 23 Nov 2022 15:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669218009;
	bh=klemdwhmvdHm8UXMNKhz8vGyWWFdhO3duaUDPADUSqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BSGNtn91mrpp3bPJslAbgOWWcK/5+OU23WPXON7/FejtddmER7EHhkkS7MhuXO4ca
	 W0AcRvSsbkvIBDYZ6REPQVDE5h+PZtldLD6nC5VqrbD0EDTg2YR0+Dk0WiZ2b1lo5T
	 f+ILD5bLCug436RG/pF8ojzCrvAiCKp/ef8gLaAr6Ty4naE0Evd41erwlbMMHxZkxG
	 mwAovIg1UoZDcga8X/4pR/UGIhVdbR0rf5SuCrL3GrWxVvheYVzmWL+OvdtnvYTO1m
	 YKOlNf2BVVW8AlIORzuzO1o5NNbkYrJ8z96wXJmgqc+AGB1J9EFf6srFoptvADgZoj
	 SLOnrRYMjC/MA==
From: guoren@kernel.org
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org,
	suagrfillet@gmail.com,
	andy.chiu@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V3 1/5] riscv: ftrace: Fixup panic by disabling preemption
Date: Wed, 23 Nov 2022 10:39:46 -0500
Message-Id: <20221123153950.2911981-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221123153950.2911981-1-guoren@kernel.org>
References: <20221123153950.2911981-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_074012_670116_58F9F262 
X-CRM114-Status: GOOD (  14.72  )
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
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
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
index 7cd981f96f48..1d0e5838b11b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -280,7 +280,7 @@ config ARCH_RV64I
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
