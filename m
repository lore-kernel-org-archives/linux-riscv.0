Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6D2C433E1
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:47:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDFE20826
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 13:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yuLUrsSI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CDFE20826
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVFxVxzOmK2Eu27J8m4W9kwTV7bWauARbwTmTEVzyR4=; b=yuLUrsSIgZfp2FxmhQjKY63KPw
	63mJyrLxGIOLFxL4Qqqk2tPtMQzZJqqXoyYVZQhyGOlG4HmPD4TBIzUYVnMiIDT5h2kBkVhmVTEnJ
	xsQLnlyhbJSPY70dfVKN164K9NgmfaUadyHPyUe2nCTr2BXDe1fvDP7os6jz+YdW3jnJ5OmD9f6uk
	8z3jfIQjcu/oNoRHqeUY+92HqH9LWCwHEjBffdohJiu3PWoZwkrWLOIsrcgFswaUN/pIBuglXlSFz
	5qfW2RJc5iwmyVV54wHDQfYR5AbI1hrG/Fmmzpz+r5vxVs+kIzACTnsjjsd0GK4BaHXD4/yZK/B5m
	hv8gN++Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrM2P-00054X-6S; Fri, 03 Jul 2020 13:47:33 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrM2O-000545-1p
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 13:47:32 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 49yx9H13KHzvjc1; Fri,  3 Jul 2020 15:47:30 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RESEND] riscv: Add kmemleak support
Date: Fri,  3 Jul 2020 15:47:30 +0200
Message-Id: <20200703134730.3319-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_094732_222523_86F7A846 
X-CRM114-Status: UNSURE (   6.07  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Dmitry Vyukov <dvyukov@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tested using syzkaller in QEMU's riscv64 virt machine.

Cc: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
Resent due to infradead.org mailing list issues.

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
