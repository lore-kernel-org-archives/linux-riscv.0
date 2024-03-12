Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EE3C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 08:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PedejQiolGHk0Ydb4Nyx/b9Lnvy7g61q53ujaUfRz1I=; b=Moblb5cAcgPv+Z
	hk+elMl74HBXkVNsgq7D/08QtU7ay4HcPWYFigy8DqvM0vAvh+9tw5KqEYk8isFROtMUx/5UtGH2l
	N6mQ61xxJEPxeni8aM+n83TcsJRA5X/3SKjpCEKiFimG0+hlFDsKSsqlPF/Ol5aV6aPgpGiyzItoc
	a73pFFGgSztvLcOpOkCbU4Q8d4XCm94FsGjwCpTG6XO54tqO0iTlqp0MOMJicjEw2PHxn1LBZZbhs
	cH8rPE9OwNISSmtb4brGcG1Z1L1RTEKqbfHSdEzwcnwuzyWSvb8jdJzoVO08CnTE+TW09NN4ATncB
	tLaEt2ViPMwTZrxpD9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxqR-00000004xW5-46xf;
	Tue, 12 Mar 2024 08:50:47 +0000
Received: from smtpbg150.qq.com ([18.132.163.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxqN-00000004xUB-0fs5
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 08:50:45 +0000
X-QQ-mid: bizesmtp89t1710233410tehccpoz
X-QQ-Originating-IP: DOnoOFufDcb5RVEBYIup+Q+tSpdOgyJSAuxSeC6ZaQ0=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 12 Mar 2024 16:50:09 +0800 (CST)
X-QQ-SSF: 01400000000000604000000A0000000
X-QQ-FEAT: ILHsT53NKPh80CFepxCx03JaEQRBUglHFn44X8fnE52yuofa7n7EYoqKg2fuy
	DlUJCK3NH1xgApGc9BEjGRLcMrzFyXQllUB18p275gGJSVUjXLh6jTopJxgkvxCqjxJgXns
	9Wcy/EoC28IAI25R/9npkWxUXOjFEWcebgfBMFfPFd933Uyb1ihDdx+AZFB8xCnqqbg7pBk
	6vP2rhQ+10gX896ql/utj1VIH6FUuE/wbzlDoM/Qpq4mLLmLAtQgD7+FNoCVLgbtpkdmxcy
	toGEM5Vga9af1qLZO6COKvLeSsjrtaOnaN/YB497nqGkOFvpiJ/FxpCHHm5grJB9aeP9td5
	u00cPLhETXfCgQ2rZcJXD5dnnnd/3aIIpzmOlXqlwoeAnz56wp6sEHzt63tXQ+/oa0WtYEU
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 10473114766742924544
From: Dawei Li <dawei.li@shingroup.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH] riscv: Remove redundant CONFIG_64BIT from pgtable_l{4,5}_enabled
Date: Tue, 12 Mar 2024 16:50:05 +0800
Message-Id: <20240312085005.298657-1-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_015043_683828_DBB35C4B 
X-CRM114-Status: UNSURE (   6.88  )
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

IS_ENABLED(CONFIG_64BIT) in assignment of pgtable_l{4,5}_enabled is
redundant, remove it.

While at it, annotate pgtable_l{4,5}_enabled with __ro_after_init.

Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa34cf55037b..204cdf5b829d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -50,8 +50,8 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 EXPORT_SYMBOL(satp_mode);
 
 #ifdef CONFIG_64BIT
-bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
-bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l4_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l5_enabled __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 #endif
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
