Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1E1C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 09:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Powb0Bj9is3LC5uqZ7MwPQszLlydv/+IS7S/IsxKo90=; b=ZI9BUqfRhvk/6z
	Xa0pi5GeGeO90Y0K8UsGKWWr/xwtiuYJ4D1oBro8o1PYrR+UQveTJW6ZyTy1QeY+0a30olORDVpYs
	RkQD63yxt63KESZNJYiHh6p8aM4EgFMgPWX8NuyghKJz+kM3Cq/i1VL4s2HVRpL7b6bIQbvjXEuIg
	j4RDuXOGJ6nbMxI2UZwUjvOPHlBcJCcneuumiLOYMJTGp3hQY6PoGcNtTfjiXF1u5xr3FPR+1iaJG
	1dngcZa04H48Yp6HX76m2LqQk/KmWEgZ56k6TRmG9qevAWKRJ7KladkOlk8q17/maNgIuhqtDjOle
	8ksOuTAOknH92BaUTnAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNWVv-00DwDx-23; Mon, 15 Aug 2022 09:36:03 +0000
Received: from mail-177132.yeah.net ([123.58.177.132])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNWA4-00Dfds-FY
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 09:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=kPe+D
	iNBqJ6/HgvpYh3VftNtWARBVb1LkIVFX20Rr64=; b=Iw3jQWLiK6+OqjsP64l8R
	/+Y9eOYBNo/1TDZ2NEECU501knbDUGhAiHIB1KYNwJIQn0eU5Hxs4RWmW2d63EH/
	dzLYrMKkGfn0cA/iRqKx4ywyQw6jMv/LyHBprOvHLv814Dvxv4StVzHLBcse9NMl
	5CRZ2drtzMTG3E5J43F28U=
Received: from localhost.localdomain (unknown [221.226.144.218])
	by smtp2 (Coremail) with SMTP id C1UQrADXKonnDfpiueIOAA--.9104S2;
	Mon, 15 Aug 2022 17:12:07 +0800 (CST)
From: sugarfillet@yeah.net
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	song <sugarfillet@yeah.net>
Subject: [PATCH] riscv : select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Mon, 15 Aug 2022 17:12:04 +0800
Message-Id: <20220815091204.1629234-1-sugarfillet@yeah.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CM-TRANSID: C1UQrADXKonnDfpiueIOAA--.9104S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr1kXrW8GFy7Aw1kWFWktFb_yoWDJwb_X3
	97ta10kFWrGrW3KFZ7XF4Fgr13Wa13uFZ8Wr4xCrWDWr17Ww47Jws8Kr1qqr4Uuw40grWf
	ZrW8tr47tw18AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8XeOtUUUUU==
X-Originating-IP: [221.226.144.218]
X-CM-SenderInfo: pvxjt2xilozv3w61vtnkoqv3/1tbiDwdeSVnxatW27gAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_021329_656212_F022A1D2 
X-CRM114-Status: UNSURE (   4.45  )
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

From: song <sugarfillet@yeah.net>

riscv uses -fpatchable-function-entry with dynamic ftrace on `afc76b8b8`,
which means we don't need recordmcount.  Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
to tell that to the build system.

Signed-off-by: song <sugarfillet@yeah.net>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..d23fa73774b4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -271,6 +271,7 @@ config ARCH_RV64I
 	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select SWIOTLB if MMU
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
