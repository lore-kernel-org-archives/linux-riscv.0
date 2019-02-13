Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D9BC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:40:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B16F2175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SU967J0g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B16F2175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xxcw/iT2roA/CbzmJr2d74YcNuOIxBTGt2yj2r6M4IA=; b=SU967J0gC2ASQY
	jg/MXSRqSkitOOkpPprU9+CS2qkZGlMGI2JoE/0AlH3xwdWxQnPQQozlJc3wYdtWroi8nrcgGvztT
	gXW6rHiBeDj/qvg9ohazhRk8nvC6DG+tfaKND1NpPr0JPlocV/xOrNst5HWkQ/aDOpnbfgUskqEH7
	3ILuLQcWSSp/WvV9BbBVMdVl3gDCbN5uCFdOdaKKXN4X3ym55LSj80fnsHgowGYhLSSEodg94L8pu
	D9wJjos4PCSHEdXPYVnXF9uW4Qj3AQuYxLdra2iIpduZiMdLK3HOy5KGopi/rgWecqdRHVqJygnVL
	hFLEMOY9epu6Kg0z5ARQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyWb-000096-A2; Wed, 13 Feb 2019 17:40:45 +0000
Received: from 089144210182.atnat0019.highway.a1.net ([89.144.210.182]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtyWZ-00006E-CO; Wed, 13 Feb 2019 17:40:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 11/11] s390: don't redefined the HAS_IOMEM symbol
Date: Wed, 13 Feb 2019 18:40:05 +0100
Message-Id: <20190213174005.28785-12-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213174005.28785-1-hch@lst.de>
References: <20190213174005.28785-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-xtensa@linux-xtensa.org, linux-s390@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Rely on the common defintion instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/s390/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9a25e19364f5..0f62e33ffcb2 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -159,6 +159,7 @@ config S390
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE	if PCI
 	select NEED_SG_DMA_LENGTH	if PCI
+	select NO_IOMEM			if !PCI
 	select OLD_SIGACTION
 	select OLD_SIGSUSPEND3
 	select PCI_DOMAINS		if PCI
@@ -708,9 +709,6 @@ config PCI_NR_FUNCTIONS
 
 endif	# PCI
 
-config HAS_IOMEM
-	def_bool PCI
-
 config CHSC_SCH
 	def_tristate m
 	prompt "Support for CHSC subchannels"
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
