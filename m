Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FA9C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 05:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScsdENxZ6IDOUDaB3rd8mK8WQiE2cMyVp8srVbGSEhg=; b=qq0kJ9al7CJFrd
	GZjiAexiXb4ykg6fEdue49ssvkJ79GgsCXizwm2bzSUasKL04dUyjbEszApNsafcqkPX4hsmsyBTS
	gQcsFJ5Nge7pk+FXiFN34l6I3UmXI0XFiZLWtZWjYNL/N/uZSHhzBkFsSbifnCNJmiVNXtSzm2zdo
	CzeiYKAuAgI9GeYifuRNByJI+/BRL82v3FuQ2O+snVQBGLdW5uDChQDIZ1zqZkH396przmIP1Go2e
	tV2beGbZELFy6rAeUM1J4xAqRRpvXSFrE+rYiSV7S4flbgUB4ajZDrSVrY39xXf6/ey9gIR1OG6o9
	deHYvr4Sku/PoLaFqvnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt0qI-00EKaV-BU; Fri, 03 Dec 2021 05:10:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt0qE-00EKXr-Fe
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 05:10:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A728B81C9D;
 Fri,  3 Dec 2021 05:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3BCC53FAD;
 Fri,  3 Dec 2021 05:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638508236;
 bh=Z9O0bsmRr34zqnd3Uvp4s5rM+blcuSgXDGFFVFUQkew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mr8jPQDEGXl+QN1k4OfnoglcVkDl2396AfCef8Jh2ewQWSdAg9Z7TRd9Tk1RZ8UnU
 EMyg9YIbn8xq7RapjYOw9sOyUfhffUG6DI6RmFkzPPR6dEiCiA2XkZtFAiQr8Mx9+k
 qQgnAHE5qPyVSfrt/mCW4IctFnd4eNH/gC6XW59lKLuIoS7V0R6RD8JPNX4mwyo1di
 fk1XWRg2MJ7vFQMp6+kFTNF8Ynk6FkcXdgLcOgPpjqE9vyAub2wUXLJgje40Pp1lwQ
 IaEY5uoWja9oar1QWrzVMjtl7TVd/Jb2vCwjltneZdVD9hGRjPwZoZk783qJeGZF8J
 WXDPZcq95/BJA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] riscv: mm: init: remove _pt_ops and use pt_ops directly
Date: Fri,  3 Dec 2021 13:03:15 +0800
Message-Id: <20211203050317.2102-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211203050317.2102-1-jszhang@kernel.org>
References: <20211203050317.2102-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_211038_702404_57A469EE 
X-CRM114-Status: GOOD (  10.52  )
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

Except "pt_ops", other global vars when CONFIG_XIP_KERNEL=y is defined
as below:

|foo_type foo;
|#ifdef CONFIG_XIP_KERNEL
|#define foo	(*(foo_type *)XIP_FIXUP(&foo))
|#endif

Follow the same way for pt_ops to unify the style and to simplify code.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bd445ac778a8..4d4fcd7ef1a9 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -227,12 +227,10 @@ static void __init setup_bootmem(void)
 }
 
 #ifdef CONFIG_MMU
-static struct pt_alloc_ops _pt_ops __initdata;
+static struct pt_alloc_ops pt_ops __initdata;
 
 #ifdef CONFIG_XIP_KERNEL
-#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
-#else
-#define pt_ops _pt_ops
+#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
 #endif
 
 unsigned long riscv_pfn_base __ro_after_init;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
