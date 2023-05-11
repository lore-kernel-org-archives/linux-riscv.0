Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A48C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaWZ+8wJYBZz9G5LLDGNA4ZtexUeSiyIw1rn+hTq7Y0=; b=3RsTizhmYdJxPf
	4nEUBCZbYPhN8RkIBU1el4eg8ZyBYijhIihHbzOXg46PovbhSLUmyWgQ6KOJG/47osvQlUe2XyCho
	mZXIihlWh2TgRZg86B8CCoXZCuLVokpwgt05wccID0+bFoTbrSwfrAbn0XYINPc+XH/Vn6Y+qrCwE
	b79Td9+XyvyZxTjyudT0HlfAZiDPYyOd4mzDfak34/3/UiPjwlXwScM9Ndvc8Pc5cpTFn1/m80uGc
	AGI6Fqdc2vhZC91yqc/VTGben1mcj2d0Mb9ebC6GW9DEVcJmf+uDgIc6HgTLB30y9lZeSkLjCLQ6i
	s/aQFS6Odpp4y+PZ/Wlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Su-0095SP-0g;
	Thu, 11 May 2023 14:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7Ss-0095QT-2g
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 May 2023 14:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KQLkrzwE28w39a6wsJfGHr8VTTBSiVuuIFiMskHqSL0=; b=XbX7DaaUfDdTVQ7E1c3NebSQ0p
	0OO3VUlyE0G7Bk06MSj3dbcQVp6QP0RcTSSSlx0PK+lUViTluKh95VsAspBLl7B0y+J3iXhwJUjI9
	/BVJ87rVBYBt0KTaGRV42jrmlBF6/5M0TiPlq8bHpM3V0ve4HhbnyHLG6esYL8nvMhCz+eo8U/1uo
	L2lnd5MlO/aiufzWVfArNWdLWEFxBgn6QQ/K0fH2HwceYkCp0vhr/jWqBoIXzmozNJG8DGsBORYL5
	9BLBwXtRVl52vNSUZhimBiSvfcxcOWlGao5T6AwZKmH9l1CnrmKN9HXjqaWgO+5wyfhDwVgQ6el3R
	Hko8CJUw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px7CW-008GAI-0K
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 14:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E91A664E03;
	Thu, 11 May 2023 14:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFA2C433EF;
	Thu, 11 May 2023 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683815002;
	bh=Qsoh2DY7RYTsIMpTH0GDqs55ax7692t2wbeau6VO2qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXb2rCTojbnqqTn8P5YlUMw1+SbNkb9+0LGdTYGVAsGB5VW7NiYN9ojgrezU7ny/I
	 /4/MfKa1ZkIhiwP4Pxwvia4Fb44hFJFum1axBzCT0AunQRiQJYmqbeHky99hKG3Y4y
	 hnlCgZd4yJo767E4hiQTcj2oSoQZWYDf4edI6H05y3e8Axa8JuV6dUrNTeQFkv/82C
	 WFc2+SUJR7u6hIGjtwp9qNR+SpzY6xENyrESHr4WgLFQdLbO+yqP06u2gCFY0fWZZD
	 EvQeqAUKXv2u3eUDWLZl+kZdcJYBvi+BLAY6Rch79ST0BeLCol71cqzKsN5l2GhPpX
	 WYB2MfCiS68NQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 2/4] riscv: move HAVE_RETHOOK to keep entries sorted
Date: Thu, 11 May 2023 22:12:09 +0800
Message-Id: <20230511141211.2418-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230511141211.2418-1-jszhang@kernel.org>
References: <20230511141211.2418-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_152324_318661_3F0F6C53 
X-CRM114-Status: GOOD (  11.89  )
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

Commit b57c2f124098 ("riscv: add riscv rethook implementation") selects
the HAVE_RETHOOK option for the first time in riscv, but it breaks the
entries order. Properly move its location to keep entries sorted.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 348c0fa1fc8c..f0663b52d052 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -110,7 +110,6 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
-	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select HAVE_PCI
@@ -119,6 +118,7 @@ config RISCV
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
+	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
