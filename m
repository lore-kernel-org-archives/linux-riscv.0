Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C2DC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 16:37:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41CCE60FC3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 16:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41CCE60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H4yqeazKRoqco+HmV7LgoiTa2Q8AzRWWRieJ1mkYGRw=; b=dxkO9rZDwRV4uJ
	Q3TsjaZpCY6L6HeASzSNTD1ELCj355UeZVd/whu8N4OOM27LZy+w2g+XVspRsUvOG4m9ujXPFFJzN
	6mynfA4ASS7bIpTu/si2o4SWJPjj8zPLF+HPa6cJWw0yo5Z1qOUJI0mw77fwoyIy0fDFsv8Q/N51K
	/ZMg25a0d57cBY01dvsxSF6K49Omx4RFCo4xVsvlHRMTuyfBgFxXtjQUuk8VE+G//ui4Oblzqy/yF
	7Wgyi0HletAB/jO359WVau0eEKCEvTlG+FjvRf1+mc32ntvQ9XdTBteZKt9b/ngX7E8YcGInr1zWa
	kT6qnwDyiVz2CYmQrVAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBJtB-006mKS-R8; Wed, 04 Aug 2021 16:37:05 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBJt9-006mK2-56
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 16:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=Juw2cquMzDaAGLJ5HN2u+Sjovrp9iaYMrFDeyu1bTo4=; b=qayyDRT0YgUuF
 AKTemStdlBo34Sr+cDLQ6lsgAwYlmxmprLArXWyQM9HGAi97H1b2EySRIXvHd/ym
 edg4oWGgbEUdC6SqaI0bY5NkwZ1Dat4wvsqhe7uByKoOQRSjMJimxMuUdsGSqyQg
 63a4zhKyzs5nevr0mmxiH512D0QmoI=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnbPwtwgphJO2UAA--.18797S2; 
 Thu, 05 Aug 2021 00:37:01 +0800 (CST)
Date: Thu, 5 Aug 2021 00:30:59 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Enable Undefined Behavior Sanitizer UBSAN
Message-ID: <20210805003059.26b03ec0@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnbPwtwgphJO2UAA--.18797S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3GrWrWw1UAr48XF4ruFg_yoW8Wry3pw
 sYkrn3CrWUGrs5WF4Iy3y8uFyUtan3Xw4agF4qyay5JrWfCr90yw4qvwsIqr1UXFWDArWS
 kF98u347tr17J37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC2
 0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
 0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
 14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
 vaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5BMNUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_093703_681273_22FB2561 
X-CRM114-Status: UNSURE (   8.05  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Select ARCH_HAS_UBSAN_SANITIZE_ALL in order to allow the user to
enable CONFIG_UBSAN_SANITIZE_ALL and instrument the entire kernel for
ubsan checks.

VDSO is excluded because its build doesn't include the
__ubsan_handle_*() functions from lib/ubsan.c, and the VDSO has no
sane way to report errors even if it has definitions of these functions.

Passed lib/test_ubsan.c test.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig              | 1 +
 arch/riscv/kernel/vdso/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f133ac72572f..cccb95bf8331 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -28,6 +28,7 @@ config RISCV
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 24d936c147cd..30a5335bd317 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -36,6 +36,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
 KASAN_SANITIZE := n
+UBSAN_SANITIZE := n
 
 # Force dependency
 $(obj)/vdso.o: $(obj)/vdso.so
-- 
2.32.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
