Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFF0C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 04:39:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE0E20674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 04:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GltCRUwV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d8hxSgcP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE0E20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q3SAkxmvtXm3mFuIAWE3a7ejfQ2J1kPisOKsUnTMl4k=; b=GltCRUwV0rQS5B4ORPatO5XIEg
	/p2cGcKQ4xDZgFWZtqwZYz9vppvg29o3PHtnIBjD5izFJS5OV/+aLHK5YM5Itd1KIpV3kDBy4ku59
	ttsq7ouOIgJj8Zop4PKHld8bmYSvR1FnuvHMft2pzz9qlizeQf7jYbTt9yVELYfgjFEPKJ+Bhc5Co
	UFQyl85OHpBlvK3iCR1VtkDuVIAUC5uhphSS1/4Qp2A8xHPYeLVTPGSV/qTDxYI7kBsEJNh59e9JW
	1tekhRBgS5AqMR92xMwpOllTgLNMlEb3zK9dRutPpkPDIFieoARpBkice2oUNM2NcJ7J84Rz1jB7m
	QUA/cL0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtOLQ-00062f-Kn; Thu, 09 Jul 2020 04:39:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtOLO-00061l-0H
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 04:39:34 +0000
Received: from localhost.localdomain (unknown [42.120.72.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2196D20674;
 Thu,  9 Jul 2020 04:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594269569;
 bh=EzEck5pK05sjzHneaktRgOUwg6NdvPNK4uNthDpoQk0=;
 h=From:To:Cc:Subject:Date:From;
 b=d8hxSgcPxbbd08TV7oJ+807uJ7gS/2ZfhyWs5TQWkLCFurJsAjhQnErf8p/c+BAB9
 l7DJP93A6bvQWdYn9Z8p9ArLTP+BDu3z1K5ZQbRjcHB5Yb1z/aag2vWoxXOffgVblQ
 rHRj6EoSocX1nEDAGlV7FSo9+1v2YBoxx6m8c38k=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, me@packi.ch,
 bjorn.topel@gmail.com, atish.patra@wdc.com
Subject: [PATCH] riscv: Enable ELF-ASLR for riscv
Date: Thu,  9 Jul 2020 04:38:30 +0000
Message-Id: <1594269511-13340-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_003934_167684_C79F7676 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, guoren@kernel.org,
 Greentime Hu <green.hu@gmail.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Let riscv enable randomizes the stack, heap and binary images of
ELF binaries. Seems it's ok at all after qemu & chip test and
there is no founded side effect.

So just simply select ARCH_HAS_ELF_RANDOMIZE :)

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Zong Li <zong.li@sifive.com>
Cc: Greentime Hu <green.hu@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 91bfc6c..eed6647 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -20,6 +20,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_PTE_SPECIAL
+	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
