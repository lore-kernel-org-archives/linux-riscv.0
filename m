Return-Path: <SRS0=t5Vp=H3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1AEC433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 07:00:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC57464ED9
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Feb 2021 07:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC57464ED9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PRbHB8TlrIdB0MoSpbhlLXfB6ry6FzT7Y4DTj09aLMc=; b=K9jj549C92N7QFyDwEXQdGF7x4
	4pK5683zEhW4dgdjwyPtk+2Rob5BB1BdPA1xLvt8ajdhb0DGgWGoRrFo4dz7kQM/qUYi1rsL7rYwD
	oqg5aRXx+Pp6XWcSE9WEY4twGH1MMn4orORPFJfHjTXTWjIG0Mvo1El63fXXKnkxrEAmt05qXdOUV
	ILGKHKhsYQvBPSllNUQtsJfwzoJ1va6iMpABqPdB9QoywREacALAMxoUMrv73YcdFXxSdYk+RuxKI
	cQASEryh7dJYSYh/UWsvhronFjx2cxBW+xjX4Cy/4f0VafZO4NibfxA0tUF4OpSIg4kqAx+0S82Hj
	Bj//1n4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFAde-0000qH-8V; Thu, 25 Feb 2021 07:00:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFAda-0000oi-CQ
 for linux-riscv@lists.infradead.org; Thu, 25 Feb 2021 07:00:40 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmNsv4P1MzlPCK;
 Thu, 25 Feb 2021 14:58:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Feb 2021 15:00:21 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH next] riscv: Add ARCH_HAS_FORTIFY_SOURCE
Date: Thu, 25 Feb 2021 15:03:03 +0800
Message-ID: <20210225070303.90530-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_020039_773618_40365885 
X-CRM114-Status: UNSURE (   9.02  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: atish.patra@wdc.com, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Paul
 Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

FORTIFY_SOURCE could detect various overflows at compile and run time.
ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and
run with CONFIG_FORTIFY_SOURCE. Select it in RISCV.

See more about this feature from commit 6974f0c4555e
("include/linux/string.h: add the option of fortified string.h functions").

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/include/asm/string.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 53e66347366f..fa30fbf66879 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -20,6 +20,7 @@ config RISCV
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_WX
+	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 5477e7ecb6e1..909049366555 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -23,5 +23,10 @@ extern asmlinkage void *__memmove(void *, const void *, size_t);
 #define memcpy(dst, src, len) __memcpy(dst, src, len)
 #define memset(s, c, n) __memset(s, c, n)
 #define memmove(dst, src, len) __memmove(dst, src, len)
+
+#ifndef __NO_FORTIFY
+#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
+#endif
+
 #endif
 #endif /* _ASM_RISCV_STRING_H */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
