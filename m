Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5ACC4451B
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 06:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K+IYbqlYadtReaMsXUQuVkVlQPkx3aiNsUUynYwEf3g=; b=G1KrLWAOGMTzBs
	Tghr5Fy6v4W19o1frCEHt+CRS+d43EJLAsfBr6hp8XLjm+0w2j4JPoIRboPeYuSPKlyD/TxOD1pZ7
	k6MuOKuHb1cUI/TnFpOSkCHvSykKNkkri4ru9I4hddJDgAIWqxGRuKZ//kfrq6stUGQWqJ8G3LALW
	iMVIqazYue1RhUZefHYR19uGrnBgbDgG8l87MnyB8xEFnQ3NxHneV7UOdvIxmIgo77xK6X6NGx6ok
	cJjLMgpfWEaudYrS6sZAeUylQKy1lKisp0GZSahuh3piEq5BL6ejFo6CeNwsfDvn4q97vIpINkPHH
	cmuiyrbk1/+gLxuI5BLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBX-00000005uz3-1yf9;
	Mon, 20 Jul 2026 06:09:03 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhBU-00000005uyJ-1Iyj
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 06:09:01 +0000
X-UUID: 797c7738840111f1aa26b74ffac11d73-20260720
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e842f246-0682-411d-8e80-3c8cad9ea7d7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:bde4576465f2b3ea8be096613a95cf6d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 797c7738840111f1aa26b74ffac11d73-20260720
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1546217824; Mon, 20 Jul 2026 14:08:49 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	dlan@kernel.org,
	elder@riscstar.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/2] fix and cleanup in spi-spacemit-k1
Date: Mon, 20 Jul 2026 14:08:42 +0800
Message-Id: <cover.1784527556.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_230900_645893_189CAC06 
X-CRM114-Status: UNSURE (   3.74  )
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

1.fix TX DMA descriptor on RX prep failure
2. drop redundant dev_err_probe() around irq

Pei Xiao (2):
  spi: spacemit: fix dangling TX DMA descriptor on RX prep failure
  spi: spacemit: drop redundant dev_err_probe() around irq helpers

 drivers/spi/spi-spacemit-k1.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
