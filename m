Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1163C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmdIeSASzI/BxXF3hHqiWgzUr7N1rHUgV2c3DqxUErA=; b=AzYGT+sam+U3kI
	DteePcIDVuf9KyxXWRggee4reiApxWfjcwmVnUJttCkOYWDcdVXTBLmF3ckFl28K4rQ6cUv0nA9HM
	MtkHKMnPgr3dskBbVOayMCOg2K4mFvf53CoWBlvKb35hCr7ZcacH9+L7EXn1CNlLZLkIJtN+lyWFR
	3AagUFGQ20eXxjoVORFibqEs1ZEsstJqRzaW7lPAErt+wKX0htWd13x1bh+cvQLn3W0usj5tkScFt
	BO2L78agiEB9MwyXC3Ecys6EtaQoLxSZtqhd7s7GgTwngLhurTFFaTJ6+W5P7OEJDKy9Pchp1joq2
	dOFD52HG4/xBAqj8O92w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6X6-00GCfv-OO; Thu, 27 Jan 2022 15:17:56 +0000
Received: from out28-125.mail.aliyun.com ([115.124.28.125])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WW-00GC8B-Pr
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:22 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1905793|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0580845-0.00345395-0.938462;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047194; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P0E_1643296636; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P0E_1643296636)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:17 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 12/12] mailmap: add Icenowy Zheng's Nuclei mail addresses
Date: Thu, 27 Jan 2022 23:16:47 +0800
Message-Id: <20220127151647.2375449-13-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071721_095897_EC6A323B 
X-CRM114-Status: UNSURE (   5.84  )
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

A mail address is assigned to Icenowy under @nucleisys.com for
supporting Nuclei SoCs/CPUs in Linux (and other open source projects).

Add it to the .mailmap file.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index b157f88ce26a..4bacaef7b06d 100644
--- a/.mailmap
+++ b/.mailmap
@@ -144,6 +144,7 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Icenowy Zheng <icenowy@aosc.io> <icenowy@nucleisys.com>
 Jacob Shin <Jacob.Shin@amd.com>
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk@google.com>
 Jaegeuk Kim <jaegeuk@kernel.org> <jaegeuk.kim@samsung.com>
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
