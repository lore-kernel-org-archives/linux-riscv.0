Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E16EC433E0
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 10:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3759E20DD4
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 10:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h+6NZ0vI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3759E20DD4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yVpDCe0J2RTpEKWyFamTW3OGqwTBB+KQipIdM+azv3Y=; b=h+6NZ0vILXvOlt2qtT0tC2J5C2
	DT1EQ3mShgBqiU8lW/49DtAyrs1L46pK849mBjJPTTf6GmyNdKOEbcpsGG6t0zdBSV8X/HzZOtodc
	JNaEFCZF9e3ljh7rN2wF/hv+9fBwITYah8U2dkKiEpyvsP+PMIgkwmXCiHL3DZGxJ+BZa5EAoU0c8
	aECPCL4sEXyhdkuAHtLyL6Bmqj/OgpH2NIUjBOgSf+Xo1BExmFpZVVEmAuhGWHpIpCxQfQx7tMWWs
	BewPU5g6i9XhBRqob3CEVRIUYNFRPcMLgSpY6/9lSIF/R92D+7O6LRdeKQvVH6eaI9UcNDF/vfH7a
	wdMA6rig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8QE-0002Zi-W1; Sat, 27 Jun 2020 10:50:59 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8QB-0002Z6-Mz
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 10:50:56 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49v9XC1Lybzvjc1; Sat, 27 Jun 2020 12:50:51 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: Add kmemleak support
Date: Sat, 27 Jun 2020 12:50:50 +0200
Message-Id: <20200627105050.11088-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
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
Cc: linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tested using syzkaller in QEMU's riscv64 virt machine.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a7d7f8184f15..c0834ea1b583 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -55,6 +55,7 @@ config RISCV
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_COPY_THREAD_TLS
+	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_EBPF_JIT if MMU
 	select HAVE_FUTEX_CMPXCHG if FUTEX
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
