Return-Path: <SRS0=x6/5=Q6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA9DC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:07:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB7020866
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:07:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FkflVPzb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwY/iCN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB7020866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+15+7d82ZdgOqn9YAY2dIjJM0bTY1NcMRcoSg9sDedM=; b=FkflVPzbodT2Fo
	dwczy0OAaUvmSVhFa9nfrVV7x6FykuiJEtZO2DLlNXXZpFlnN7K69jXjM60/P3sLZPzsTtuoR1eKo
	hlABd7wAQ5hrZxf1LaaJqKz3LvQ2WxA6O1Y/sc3BcZmSQ9zjEsd6zNjhu1JvqURo0NVqgC+ChtNXK
	L2UHRaaymZR52hXsq3nbO2FgWKNUH6Kq8qzZ9Nm+R6/fEMCnkRj+TVXZ0gvLN0RuCNYlO8BzPxCwy
	yeiFzTXMCzB83T4wskIKfoySwUEhkbGii/8K36FIOalSedYtXX1b62O2LVWWyrxrLdjTJWFtBReqp
	EgWBtHTRrfyGzUqhZC4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxeVs-0008PM-PD; Sat, 23 Feb 2019 21:07:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxeVp-0008Oq-UF
 for linux-riscv@lists.infradead.org; Sat, 23 Feb 2019 21:07:11 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1FBB20861;
 Sat, 23 Feb 2019 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550956029;
 bh=YDB4IuOTQz8jkL+GMIEQ5QZI603zNxn1Ra1X8nIh8js=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mwY/iCN4brmse6q3oak3YRoS0I890JGykbycDnIVIFMQoebyAXmfFu+cv5H3PNEDh
 GQ2MR7LkCBmMeGvia34fbNJhqc5Xn5n4aBMmJeHRBfoWCgAd0NfRnX2uCTDNSFNlTO
 y0BMCDwUsdwAv9wmzq1nfRRUsB9dTGu5NzEzmD/0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 19/65] riscv: Adjust mmap base address at a third
 of task size
Date: Sat, 23 Feb 2019 16:05:54 -0500
Message-Id: <20190223210640.200911-19-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190223210640.200911-1-sashal@kernel.org>
References: <20190223210640.200911-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_130709_988053_26B67822 
X-CRM114-Status: UNSURE (   9.87  )
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
index 3fe4af8147d2d..c23578a37b443 100644
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
