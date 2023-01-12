Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A79BC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 09:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UvU7xbrCOkygT++D+Lkx05chrce2Voh2o76I7y9ao5Y=; b=sNoBuVtn+nwIvR
	SJFz7vNVQ1QyNw1fLqNF30kArCpW6M3scW7RdXC8LlJ4CubeF5zoL1DezTYUhy3ncMAzWWnbQfH3E
	/PhO4kpVfnJedEBx/jhEVR1MNF/irju3u+n4t4kZuKwIMKhsgJ2fSbad6lzVBIpy0taOOF7R+Sgwp
	rHYArKOcBMgPyuE4lUSC1ykPUjxFQiZTm2Dqho+SF4aiVcuP1dR3WK0JW47tk4cXlRl81NYudfmsJ
	rW4+Q6UNO0THZ1PtoTyChm8kQ+b2Gjzud2J+mU1weD+NP4VQmLd6xz4zZ0+6zJbatXRGne0hSJl7E
	pWVtz36u2AafgbJ7zahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtYl-00EHHT-LB; Thu, 12 Jan 2023 09:07:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtY2-00EGp7-Co
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 09:07:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 580F361FA4;
	Thu, 12 Jan 2023 09:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47097C433D2;
	Thu, 12 Jan 2023 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673514413;
	bh=TPEEMc3HaWaP+Mt2KfPXle42oBuXI/4U/PIW+OSCPxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LGou6CSsyBFI9CXvpokX7hLPkUAbBBGr+vvBqv9qzab6cLmHGKcMeC72ZlN72Au6G
	 roB7MPUJJeCZ7Hm+JXwTzoh9yFqV85VTZkiI6yeMKS47HfXWYnvPBpt3REOJ7mUCqD
	 blu4PuntvUh7mYqUBzf4viixWYj5CoHfh12pDSgvnVxPJwr/ztDN2lbEQvzbB7KXha
	 4yQgZIqbp34m+BMpDVILulJURT62vzsy4EQ9wy6lRx0khX9zoXnEEENaFxTcdbQy1S
	 cULaeZTSZYk05qh830JIgo0FKyrKPiqYHOGWHBQlmHnwv6aKh1HE7vo8L+SeJpNh38
	 zlMOCz5PqLVYg==
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
	andy.chiu@sifive.com,
	e.shatokhin@yadro.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH -next V7 7/7] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Thu, 12 Jan 2023 04:06:03 -0500
Message-Id: <20230112090603.1295340-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230112090603.1295340-1-guoren@kernel.org>
References: <20230112090603.1295340-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010658_560567_26625DFF 
X-CRM114-Status: GOOD (  10.64  )
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

From: Song Shuai <suagrfillet@gmail.com>

In RISC-V, -fpatchable-function-entry option is used to support
dynamic ftrace in this commit afc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT"). So recordmcount
don't have to be called to create the __mcount_loc section before
the vmlinux linking.

Here selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
Makefile not to run recordmcount.

Link: https://lore.kernel.org/linux-riscv/CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com/T/#t
Link: https://lore.kernel.org/linux-riscv/Y4jtfrJt+%2FQ5nMOz@spud/
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e944af44f681..a78d39780b76 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -54,6 +54,7 @@ config RISCV
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
