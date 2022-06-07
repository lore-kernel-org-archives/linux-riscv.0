Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEECC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDjy1yzExr9EmRbYSU1wr0JHNP6zDFwggMZRSLRAOIg=; b=uV6H4addidDznz
	E1YdCeZfW7XO2+GANAVc8rZUcrcrjVb63iZ6+7osF/J//jdK7QS/i/awy6ZB2JfGHCFF4QlUd538s
	MXTRkTzchUJpqZFBQezOUOPG2l99EhiyxvyBLt4Z5PNiwEsUKGLxpIfo7AoleVaD9YPhZbdlWGkqw
	rzJuvx0wpGdf4JPRfnd7GpNyus1rYfd3FR10aJfLsHCMdDYI0haHG+zT4BbJjdJRvozd4JQt+Cw0A
	3N/XUDS+7a2Zv4q1PNuu2wSXE80QH1+o0+l7yXkbjp49aQayU2gG0kS/H7rVB6k3/ffOoa9EuIISM
	ufSJjddVA25Gg7eqbtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF3-0085l6-Pg; Tue, 07 Jun 2022 14:31:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF0-0085iz-E4
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 14:31:31 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyaEw-0008Ra-2f; Tue, 07 Jun 2022 16:31:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	mick@ics.forth.gr,
	samuel@sholland.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 2/2] riscv: convert the t-head pbmt errata to use the __nops macro
Date: Tue,  7 Jun 2022 16:30:59 +0200
Message-Id: <20220607143059.1054074-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607143059.1054074-1-heiko@sntech.de>
References: <20220607143059.1054074-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_073130_573576_56461C87 
X-CRM114-Status: UNSURE (   9.43  )
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

Instead of manually inserting the list of nops, use the recently
introduced __nops(n) macro to make everything more readable.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/include/asm/errata_list.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index 416ead0f9a65..398e351e7002 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -68,13 +68,7 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
  */
 #define ALT_THEAD_PMA(_val)						\
 asm volatile(ALTERNATIVE(						\
-	"nop\n\t"							\
-	"nop\n\t"							\
-	"nop\n\t"							\
-	"nop\n\t"							\
-	"nop\n\t"							\
-	"nop\n\t"							\
-	"nop",								\
+	__nops(7),							\
 	"li      t3, %1\n\t"						\
 	"slli    t3, t3, %3\n\t"					\
 	"and     t3, %0, t3\n\t"					\
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
