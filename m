Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B404EEA877
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 09:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/OCZuXGxGxdpaNvVB7YHlRToP+jvn921ooJtJ752fI=; b=BCheE0HgdunXrU
	9Vs8EzGKf8tc63HebuT4mNI2LpXBG+/QcuaDPbCxamV847j9fJhKVVYtnO1b13BNtNNRMvDFq+NJ7
	p5W6LD+RztVnBNsilO07MiwV6YrHr9irsy/bOkutWz0+5SosXBzsOZUy479+cWWsQpJ+tdOacF8FS
	jEPYkuWaDClJQ8+nOo97sj9wBhTDOE4RNUwX2VGz1VjKqYDUm7/cwh2ivMWry9xkpMA2IWQ4e86de
	WFjr78fy+WFC1VfTlFYQAamQn/XkUhPS42WEv91Pe9sNHz+CBqSBK56qaAmgAHaZiPx5qMp8rbG59
	/sckcGfRK8IT4GWaVBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqprv-00000003Gkn-1uYJ;
	Fri, 13 Feb 2026 09:53:47 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqprs-00000003GjE-2B5g
	for linux-riscv@lists.infradead.org;
	Fri, 13 Feb 2026 09:53:46 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770976422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72eoGgJO5ddhbol9MbsMucS0SkPZEg51bHhsJPdTAVs=;
	b=gVpRnejPyYJwmtliXsmDS6NFLhmTgmFAwznoFyCZajguD1iqJt51pDF9I0GIq6woTomhEh
	RatFLLyUD2ywFQxggsXxBxmeVw46hWSEU4+WlGo9IFSpp6N99O1AQiKmMoEdT+1o8fL+DX
	LwbQCLzI1KxgDzkF2C9UoxAjD1DHekQ=
From: Kunwu Chan <kunwu.chan@linux.dev>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	zhouzhouyi <zhouzhouyi@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@linux.dev>
Subject: [PATCH 2/2] riscv: head.S: fix typo and wrong #endif comment
Date: Fri, 13 Feb 2026 17:52:41 +0800
Message-Id: <20260213095241.399068-2-kunwu.chan@linux.dev>
In-Reply-To: <20260213095241.399068-1-kunwu.chan@linux.dev>
References: <20260213095241.399068-1-kunwu.chan@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_015345_174753_6DF7A0B6 
X-CRM114-Status: UNSURE (   8.11  )
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

- Fix spelling: "intruction" -> "instruction".

- Fix #endif comment: the matching #ifdef is CONFIG_XIP_KERNEL,
  not CONFIG_XIP.

Reviewed-by: zhouzhouyi <zhouzhouyi@gmail.com>
Signed-off-by: Kunwu Chan <kunwu.chan@linux.dev>
---
 arch/riscv/kernel/head.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9c99c5ad6fe8..1618d2cb91b3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -81,7 +81,7 @@ relocate_enable_mmu:
 	sub a1, a1, a2
 	add ra, ra, a1
 
-	/* Point stvec to virtual address of intruction after satp write */
+	/* Point stvec to virtual address of instruction after satp write */
 	la a2, 1f
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
@@ -287,7 +287,7 @@ SYM_CODE_START(_start_kernel)
 	/* first time here if hart_lottery in RAM is not set */
 	beq t0, t1, .Lsecondary_start
 
-#endif /* CONFIG_XIP */
+#endif /* CONFIG_XIP_KERNEL */
 #endif /* CONFIG_RISCV_BOOT_SPINWAIT */
 
 #ifdef CONFIG_XIP_KERNEL
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
