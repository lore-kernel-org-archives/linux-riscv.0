Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F0EC3DA7E
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jul 2024 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NT7lom85bM9Db7ddOVM/2AiuoCAJ6NNI42X3LowZyuc=; b=H8lvpLrKBGU3UN
	oHvG4aNCu53tlUf4CYtfv3SNZNeZqV4l63udzG0E/7mWUDZ7+3R8lbkI09TNjOHuKi9kpSKVxBaMO
	h8UNfHlQbDKdBs5X+kGoKim6UnN2tbod3tEA02UWT0OZeRQrg4x37TdpGyR1gn+qfEV6KYTdY7MPP
	AUGrF5TKXHKuOo5gkOipYAvLIe72oh4F7+TCium+O96bmYgFtOTem9QxiTkNaDgEV4letA/jLVYYQ
	gvAOq1lsDyL5oEia3EL+2jYZ6otP8zKduvvxv2rOlvDEoyMsIpnUlq+Ty3EoPqSLfzIkN04KI1CEx
	1//WjrIMwNyxOf8di9ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrM-00000005Qes-3M4l;
	Sat, 20 Jul 2024 17:27:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVDrG-00000005QZY-0k21
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jul 2024 17:27:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6DA4C61171;
	Sat, 20 Jul 2024 17:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA31C4AF0F;
	Sat, 20 Jul 2024 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721496417;
	bh=PS9GETIFotMXHbuFrtVxV4bYZ42Bdzp9+Zn0gjyOdnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s/rP/PyGYs4PM91YBMl0YbrBayzt4Kt/jSe62G6momR9f39KhwggHvETfJRuFWbjb
	 lrmjhNUkFw6spRPMkBRpQpY1mSdm04chjCkZcA4Ug5ONjd1NJn+uQUdHQ5TpVNALeL
	 Ajogh2zDCPgwIxQ0zebSHVrDSUSX7EiFqgsWuNViCda7BwUn+bJOSKOo1ZhEx0Q9Hl
	 bhMTwUjyww2Y3zktoq7+ABmGksGl/86pifrZvxVYHIDQmxIbHj910AlLeCxyTrlvZc
	 F/kFUngUxFt+iAZZsOTOuaybDumo7n1kDhed5stC1a5zPZtbKjSSxkYnGB2cEcCK8t
	 AYdeziyZy0pxA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Clement Leger <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] riscv: errata: remove ALT_INSN_FAULT and ALT_PAGE_FAULT
Date: Sun, 21 Jul 2024 01:12:29 +0800
Message-ID: <20240720171232.1753-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240720171232.1753-1-jszhang@kernel.org>
References: <20240720171232.1753-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_102658_299798_0962A872 
X-CRM114-Status: UNSURE (   8.86  )
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
