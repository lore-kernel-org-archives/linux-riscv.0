Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF53C001B0
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 00:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Y3j5QRXCCmzHKQEDc/6RxJOZAW71u5oG4ICpk5qO64=; b=xsVPdpCz1hdrb6
	V2JHTtgo3b4oxEJBib8GPZOYpPkgJQSbhuBcKHAmMbMFbKlaUU9UYWrAAluuhbVHpdja0pxwXO47+
	aQB3rHckCfTRXpU7JnTCqK+qjKFd70jdATkb2zGquX+AA3qCD0wIInV38IUFCObzeYpAD1NPypfzX
	4+pEPq5O/7bC+ZHFCLcUGrRkRc4TfzkQuM+Td4PcRYa8f5tybyckZwtwgRaSqEZCbtjF5a+uxjzPw
	+jBXqxT6UwQuOaFTppMhoEqcoeASC6dsMCPQBW7aaMzo8PndKxqx9VJn+8c0ykhKU0R3J/vIkQZ4B
	Pvxdn84yLj+En6s0Z5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpQ3-009j5D-2E;
	Sun, 16 Jul 2023 00:15:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKpQ0-009j4H-2b
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 00:15:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B014C60C55;
	Sun, 16 Jul 2023 00:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB014C433CB;
	Sun, 16 Jul 2023 00:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689466519;
	bh=E/jFfO+retDoLdPOyJc5wmE7Q3RkrIB4bLkvlh5cMyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXkVAhKOvak//vq4NvrYl/XxauhW+hxgcoEqlbfIhk5u6YsST3l0Y8/WwnaiRBB+N
	 zoUDoiPMG1GzOnlMYnAdvJWdXPUCS9ewLprgn1W6oDd+rd9fFeZVgBkRaJioYAx7Gu
	 aRNjFMp4gmIM3r7wtXqJbKfMMUFuvq9Kn8c7MaZmEbVgRZTzKfT3UMQemGnUKIPQ35
	 oiGi/2zjVxCy2JI8oSa90MiJENKU83yZAPbcZSWUiKdhTRnJzt+WM6Kv83e73bmMB0
	 s1UjLKbcd1E+cb4Qt502xDb7nhaYkeGEpdCnY5BOnLU3VGklJpW9TPMFUBa3ZRxHwK
	 Su5ONNJ3QNw3w==
From: guoren@kernel.org
To: guoren@kernel.org,
	palmer@rivosinc.com,
	paul.walmsley@sifive.com,
	falcon@tinylab.org,
	bjorn@kernel.org,
	conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 2/2] riscv: stack: Fixup independent softirq stack for CONFIG_FRAME_POINTER=n
Date: Sat, 15 Jul 2023 20:15:06 -0400
Message-Id: <20230716001506.3506041-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230716001506.3506041-1-guoren@kernel.org>
References: <20230716001506.3506041-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_171520_903954_AE79C58A 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The independent softirq stack uses s0 to save & restore sp, but s0 would
be corrupted when CONFIG_FRAME_POINTER=n. So add s0 in the clobber list
to fix the problem.

Fixes: dd69d07a5a6c ("riscv: stack: Support HAVE_SOFTIRQ_ON_OWN_STACK")
Cc: stable@vger.kernel.org
Reported-by: Zhangjin Wu <falcon@tinylab.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/irq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index d0577cc6a081..a8efa053c4a5 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -84,6 +84,9 @@ void do_softirq_own_stack(void)
 		: [sp] "r" (sp)
 		: "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
 		  "t0", "t1", "t2", "t3", "t4", "t5", "t6",
+#ifndef CONFIG_FRAME_POINTER
+		  "s0",
+#endif
 		  "memory");
 	} else
 #endif
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
