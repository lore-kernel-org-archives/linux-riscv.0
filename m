Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247E1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PuAsCrfC+jn9dGUDrgkU1QCy9OSdtfEe09bA3UwyR9g=; b=UfCsdIWNU6OPrV
	G0UP3o4uWYgRYAnRH7Kac+a7HV6AJa/l3ufmNHxL+5FO6ORO8CeD4lcUxO+u+PDLT7LhzbBLO/1Hp
	z+5fu1g9yxkULB3vueCxawo9j8tTEpPN9DOAY+cxMUeitDd/ecKIo48JDzwWHUSG9/IZvQEJ25cxY
	HpOO0ZWXUPo1zmD25sP3FJ7VD5sx32Y8QK5HqcikkbGUD+zps2Hh3OqoEgCLiFOfifURF7lwXEg+P
	04ha7XnLVx4/0I2M4UfYz2vHmobF2iwnQQHevk+PQ5pM87SgdkbzA+5GlC9l+OpqTUcZAkvJBZPHl
	+kzfi6ZiWfk4rqRCaHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsbQ-000r4f-UC; Wed, 23 Nov 2022 16:28:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxsbM-000r2X-J5
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 16:27:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A45E61DE5;
	Wed, 23 Nov 2022 16:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 159E0C433C1;
	Wed, 23 Nov 2022 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669220875;
	bh=RbFg5SUvS3xFJJRTRaVHi2bX1Rc8bI0Z/xmm4da0qQw=;
	h=From:To:Cc:Subject:Date:From;
	b=gTvnwSCYZ0wF4boR8aVWXndodyYNlX7xtCHMDLuAKCVA9rq6Kcy+XPbwZB+efS2sP
	 ePy9soNF95TLT+xdeDx5hY66ofX4M9nWWEtUP2oVJkcIDl6CXtAINIpYPyHA5sRVjq
	 +PLEp5/RNeu7JXuUlmd81XnM3hbOYziJKTKrJcI/BT/esU864J02NRp4hvzm/HtR68
	 DayvsbEUfIBGyYFs9YEY1pUqFA3L9wWbqLw4FzJ7OkhXzCSSeUgnZomdKkrBtthhJp
	 WmzttKvBIcFq5ymMgoGJk+JCunnO3LDK/QIHXlX1NveT3hhFXckFAc2NgBNRus6z2a
	 W8kK6Qt0M+IDg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [RFC PATCH] riscv: vdso: remove hardcoded 0x800 .text section start addr
Date: Thu, 24 Nov 2022 00:18:05 +0800
Message-Id: <20221123161805.1579-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_082756_688134_2A76EBA4 
X-CRM114-Status: GOOD (  10.55  )
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

It seems the hardcoded 0x800 isn't necessary, but removing it brings a
small vdso.so and aligns with other architectures.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 150b1a572e61..7be7e618d59c 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -31,13 +31,7 @@ SECTIONS
 
 	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
 
-	/*
-	 * This linker script is used both with -r and with -shared.
-	 * For the layouts to match, we need to skip more than enough
-	 * space for the dynamic symbol table, etc. If this amount is
-	 * insufficient, ld -shared will error; simply increase it here.
-	 */
-	. = 0x800;
+	. = ALIGN(4);
 	.text		: { *(.text .text.*) }		:text
 
 	.data		: {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
