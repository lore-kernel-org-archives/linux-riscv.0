Return-Path: <SRS0=x6/5=Q6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F81C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:05:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D78EC20675
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:05:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I+NEjC8d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdtNm+JS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D78EC20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PtbMa3EdK9sQ+77ig/bxm5Pp+O47ngMK+XuN0wKIMAs=; b=I+NEjC8dpXBhTB
	8kjCZjIQXcKKdP38vL0BVxHWh76Kc30wi8KCL4/TAiWfH2q4bH+hZwSOMzAh3Rq6U5Q3TTU/+GyU/
	QZTPbIxoYZ/8sg3hPGDzfIRKuW4aGWbopMt31y3PcXlPQCmscsHgWjSILMRBmT54ex6jaZJ5Gw+dm
	VcGDhYwAw53kSarLZa3+69oTjPDEzSPV8JJDHUjQnJwy/BAHUZYYi4KYd7EAx0jmUDUYX4UqTTPzc
	pzeNJeHc1TCvS6ZTXkc05/bEGxqnXu8p8YqO1dZWyP9IUo8pzL5lCpHlfcst0YJ8N8R1/uC0p/grY
	wl/gSMhK/T5acERW2Fuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxeTn-0007AH-Vc; Sat, 23 Feb 2019 21:05:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxeTl-0006pO-Qw
 for linux-riscv@lists.infradead.org; Sat, 23 Feb 2019 21:05:03 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8A54206B6;
 Sat, 23 Feb 2019 21:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550955901;
 bh=GE+mPLyhh69BARRWnXLLzoROZAHtbTM/OsFr8vTvpl8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TdtNm+JSXegYRUuJf11/kcIJz2NX61EZ1E6Q9QQ/STCF29px41tzJ4XQCyU7cXriW
 Q50to5Uo79WZ80o/iN7tcJ7usukJgEMIVVX/RUbSBsI0UmwF7PgJF5UaeJaahhxMn3
 Zp+aG0onqX6aTXpceWoF0z8RD9Bvg9MUP5np68Gc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 23/72] riscv: Adjust mmap base address at a third
 of task size
Date: Sat, 23 Feb 2019 16:03:33 -0500
Message-Id: <20190223210422.199966-23-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190223210422.199966-1-sashal@kernel.org>
References: <20190223210422.199966-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_130501_908561_D3B170E1 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Alexandre Ghiti <aghiti@upmem.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Alexandre Ghiti <aghiti@upmem.com>

[ Upstream commit ae662eec8a515ab550524e04c793b5ddf1aae3a1 ]

This ratio is the most used among all other architectures and make
icache_hygiene libhugetlbfs test pass: this test mmap lots of
hugepages whose addresses, without this patch, reach the end of
the process user address space.

Signed-off-by: Alexandre Ghiti <aghiti@upmem.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0531f49af5c30..ce70bceb8872e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,7 +22,7 @@
  * This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
  */
-#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE >> 1)
+#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
 
 #define STACK_TOP		TASK_SIZE
 #define STACK_TOP_MAX		STACK_TOP
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
