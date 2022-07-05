Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B88C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 10:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gc1tuXQv8qogsYrlneXb3TfGQDdu5ObwReGX08BR8rk=; b=IyjF0uxaD7o/HE
	f/7NEC+ib/oEWQTb6roZWJgZ2D/eLydhGYcFk7xK84P0QqYmZ8G6qkocpa0fw/AWDB0JQTRmvVQfI
	t2HgBEVRxeCYem65GFdDgdDm6of899eRvr+J4hY6ms4CEue8v9R963v9jdp5aZZcvnScNEGswBe2r
	eVn5h6V6cZiOtZjO/3dNJ5/xP5YfqMGApB0NC6NGqBnadOblh7J3yfMEga6Mp60oKNC7QWsBShMAX
	pxho8p4tGIVIQL7x7KIPHpWslO5bY09dbSJ7QphrS615INFbvOOIL/VdXemO5uI2CmdD8yjfLk3XR
	l9IusMARffgD5MZOINog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR6-00H4Fz-NU; Tue, 05 Jul 2022 10:05:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8fR2-00H4Dw-IB
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 10:05:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57F58619AF;
	Tue,  5 Jul 2022 10:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C5AC341CD;
	Tue,  5 Jul 2022 10:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657015533;
	bh=LnaoRQFhIthlZ8pFDCdivsK0ujNVQPkKNpO53MRrx0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxgLN5etuLS/NVaabKmxbqxwj+4UlKr11rt4nyuFs5BNgzRvTt4nw49m9W23xUlc1
	 t1tSXCkCFUxNIbT5fCxolarJZvd+KtIec+MjTslsaaFJsC1b7k8BmBGJQ6ddSExaUo
	 3Ky2Hxdm7ZafwBIcttQFDAkRk/Z2LLBhCxIvyv1U94eL7Ju6VNWJN6GhIhZRcEL9C8
	 /sF1GyK+xyeCmNz1UIvqZIaBh+Yx5RcM8abSTJ3SX+99iIVd9/6tUdXfbbPvqSzD1y
	 SLFndRTu8shiRzOpayqc/3qz7dbqmb0LO6ZgP9TOBeicP33LtGe3zT9oqOAByXBXO2
	 4y+T7I2dlI10A==
From: guoren@kernel.org
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [RFC PATCH 2/4] riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
Date: Tue,  5 Jul 2022 06:05:21 -0400
Message-Id: <20220705100523.1204595-3-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705100523.1204595-1-guoren@kernel.org>
References: <20220705100523.1204595-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_030536_692003_BB086AD1 
X-CRM114-Status: GOOD (  10.70  )
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

Make compile cleaner and don't reference the THEAD_PBMT data struct when
CONFIG_ERRATA_THEAD_PBMT=y. Next, we could cleanly make svpbmt to
support rv32.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/errata_list.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 416ead0f9a65..47175d91773d 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -47,6 +47,8 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
  * in the default case.
  */
 #define ALT_SVPBMT_SHIFT 61
+
+#ifdef CONFIG_ERRATA_THEAD_PBMT
 #define ALT_THEAD_PBMT_SHIFT 59
 #define ALT_SVPBMT(_val, prot)						\
 asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
@@ -60,7 +62,6 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
 		  "I"(ALT_SVPBMT_SHIFT),				\
 		  "I"(ALT_THEAD_PBMT_SHIFT))
 
-#ifdef CONFIG_ERRATA_THEAD_PBMT
 /*
  * IO/NOCACHE memory types are handled together with svpbmt,
  * so on T-Head chips, check if no other memory type is set,
@@ -90,6 +91,14 @@ asm volatile(ALTERNATIVE(						\
 	  "I"(ALT_THEAD_PBMT_SHIFT)					\
 	: "t3")
 #else
+#define ALT_SVPBMT(_val, prot)						\
+asm(ALTERNATIVE("li %0, 0\t\nnop",					\
+		 "li %0, %1\t\nslli %0,%0,%2", 0,			\
+			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT)	\
+		: "=r"(_val)						\
+		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
+		  "I"(ALT_SVPBMT_SHIFT))
+
 #define ALT_THEAD_PMA(_val)
 #endif
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
