Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15E5C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NT7lom85bM9Db7ddOVM/2AiuoCAJ6NNI42X3LowZyuc=; b=2veJAj9F/tLu4G
	BqXu1asv6b54Dym+E93FvYEEXwgljwR18CkTNNqR3OpJWcLs6LIFloVB0Uve/QASGAdky0SptX/i0
	rXxDbINEvXDtBep5OZM6Xa6TxjOcfJB6Wy1Qf/ujFOmFlMOaZ3gThfBxXD4D6xqZOrVyhkJBEoexp
	4xUcivj97kWSu8zhiRTsT98rx62hi6JXlBNocmceClRPgMrWS8LTafU4BzqDKBP2rsZJzOSasQ89o
	dRmVlOVoq+wrezvvJeu71cD+U3rNZu+krOI+z+MbY1O/JLWl3x3j1jACs/NqmYPfT5QEMwE8aqh+q
	weIqfaQPud8rBoDh3pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXt-00000007xHq-1c5z;
	Sun, 16 Jun 2024 17:20:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItXn-00000007xDZ-2jHc
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD02360EA1;
	Sun, 16 Jun 2024 17:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5568FC4AF51;
	Sun, 16 Jun 2024 17:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718558394;
	bh=PS9GETIFotMXHbuFrtVxV4bYZ42Bdzp9+Zn0gjyOdnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CG3p5u4oEXwi4LuMzZozu/wQCsY1FuA8N3QqG0uHG4qD7kLca5oO47qirIA2bhT80
	 GyKDJmvRW2JhYloosJEDu4SVcxE96dd58uHRFDfm1Ke8IkI746Ba1HR88CCNDtCk5F
	 yUdOaMDW2vOOGCrMI/aB4rBkLFLbCLdn+iwta83TFi39+xHcQmaP55sq4UvDR6JGsO
	 frXhe+T2YJTUgWo+AXZYGuaZiG8yoDPc4gnLez5zqdsaRqzleAUi2HhhusDxUo/olF
	 xcwCXw6XwkUmy7dgkKg7hiORh8qlOCojzYkBu78EIWaRQxHD6xs26+wTo7PeahMICD
	 /lu8HwEyKiH0Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: errata: remove ALT_INSN_FAULT and ALT_PAGE_FAULT
Date: Mon, 17 Jun 2024 01:05:51 +0800
Message-ID: <20240616170553.2832-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
References: <20240616170553.2832-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_101956_037704_662661CC 
X-CRM114-Status: UNSURE (   8.06  )
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

They are used for SIFIVE_CIP_453 errata, which has been solved by
replacing the excp_vect_table[] two entries in last commit. So these
two macros are useless now, remove them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/errata_list.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 95b79afc4061..46bf00c4a57a 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -27,21 +27,7 @@
 #define	ERRATA_THEAD_NUMBER 2
 #endif
 
-#ifdef __ASSEMBLY__
-
-#define ALT_INSN_FAULT(x)						\
-ALTERNATIVE(__stringify(RISCV_PTR do_trap_insn_fault),			\
-	    __stringify(RISCV_PTR sifive_cip_453_insn_fault_trp),	\
-	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
-	    CONFIG_ERRATA_SIFIVE_CIP_453)
-
-#define ALT_PAGE_FAULT(x)						\
-ALTERNATIVE(__stringify(RISCV_PTR do_page_fault),			\
-	    __stringify(RISCV_PTR sifive_cip_453_page_fault_trp),	\
-	    SIFIVE_VENDOR_ID, ERRATA_SIFIVE_CIP_453,			\
-	    CONFIG_ERRATA_SIFIVE_CIP_453)
-#else /* !__ASSEMBLY__ */
-
+#ifndef __ASSEMBLY__
 #define ALT_SFENCE_VMA_ASID(asid)					\
 asm(ALTERNATIVE("sfence.vma x0, %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
 		ERRATA_SIFIVE_CIP_1200, CONFIG_ERRATA_SIFIVE_CIP_1200)	\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
