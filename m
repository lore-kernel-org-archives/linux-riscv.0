Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F20AC43461
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 06:07:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1F8208DB
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 06:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMUps30U";
	dkim=temperror (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="sIJrizAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1F8208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4WreczLwqpya1Af05Tj27kjYPoXrMk4beOOcVURZ7Vo=; b=JMUps30UGwzvRTYd6Z2iLW8huV
	knB2onWYcFTykfbQzk0unSzUFHR3aS2HywX8SVkRz4ySHvMMU6x3cGEZH2/q6eP4Ox8g6Xn/KRH9r
	BQHEi9RfiF0E6BP+FOPxUdYhYWWQ89MMDuMQT88MZPBLs0uyiB6jSTqBh+HKKl0OZchGSeUy3vXVW
	G4vzBXKdipOP9XcjsIIBJ+W4xJOKXmCYZyCS4oJYlH9KjPy7D+FMpT7U9etc3sDZg1PKw8PkcunOR
	0awHqjQPY9/14zttGs6OnuCp+PmMe+4d9A4RqfO2iKmYTFqvWMRzcUtJ5vNGLSeAV98AiQvMO7/mq
	cNnVQhrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kERMU-0007eA-J7; Sat, 05 Sep 2020 06:07:42 +0000
Received: from forward4-smtp.messagingengine.com ([66.111.4.238])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kERMS-0007dn-ET
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 06:07:41 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 107E119416EA;
 Sat,  5 Sep 2020 02:07:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sat, 05 Sep 2020 02:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hwdpGcWMy6s1+eLl8
 +zjNCg8RTkZk5fWdap0A2pspVE=; b=sIJrizAVeqV+eOcKRx7D0L8TwnF45sbur
 6cyk0hR15KJJPWWhexTDx6pEYQzn41Kr17sOnWNqUKVBkAWsAxuWK6B98iFz0pIH
 THyIgloIIwlEMU3vaFjauTf6JC8ReUsSVl1eLxxw/xU5AeG5kEKB6SLzequbxRPC
 yMRakB4Lrhzu4df6hw1UXS3PNAJisvleDXzgem64k7FaMiIDFZTFN/3stgDlzwAg
 8bJvwgyQk4ixIlyE1zP6nfzMxHoRFqbZP3gsGBrPBoxAso3M0zijtU4C24n7AbMn
 A+bKea4HdljN899kneMu6vYwmhKX9f8LzSoJ0xhz5G7BHicHWK0xg==
X-ME-Sender: <xms:KitTXzduD8rjVIYSYRf5dMtMlSudYJsDgxPqtgX7yL8avL81yS7I5w>
 <xme:KitTX5NzQXpvLSCxQTdTgtkcARjJW2Nb9MIkdeEsmQvlRA_1osmF7UWQhOKl1Td5v
 kzPVZXSV9-UHF7Y3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeggedguddtgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpefrvghkkhgrucfgnhgsvghrghcuoehpvghnsggvrhhgsehkvghr
 nhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepleehfeffffekvdfgieffueduvdeuue
 elffdvgfefveeifeeujeelffdtgeefudevnecukfhppeeivddrjeekrddujeelrddufedu
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvnh
 gsvghrgheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:KitTX8ifmNi4ObFRV2EfbwiAQr10RSV29xexLdwRgOH6-FxfJQ3ghA>
 <xmx:KitTX08kzVlTcI3u7iGg9F0i5GHwVsi5u_Fwpw2qEbtbIf3pNbKwRQ>
 <xmx:KitTX_szD8Lc1sTO0wVpqBHYJZj86VdTmURYc59_J2Um8cH1dgz-TA>
 <xmx:KytTX_Ia-_pgzsjSz5_zwum6iBXyBSJ_diYx9OhGaAiD3NvqQbqvSg>
Received: from nero.bb.dnainternet.fi (62-78-179-131.bb.dnainternet.fi
 [62.78.179.131])
 by mail.messagingengine.com (Postfix) with ESMTPA id E90E53280059;
 Sat,  5 Sep 2020 02:07:37 -0400 (EDT)
From: Pekka Enberg <penberg@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [PATCH for-next] riscv/mm/fault: Set FAULT_FLAG_INSTRUCTION flag in
 do_page_fault()
Date: Sat,  5 Sep 2020 09:07:26 +0300
Message-Id: <20200905060726.529182-1-penberg@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_020740_518643_63CEF8DD 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If the page fault "cause" is EXC_INST_PAGE_FAULT, set the
FAULT_FLAG_INSTRUCTION flag to let handle_mm_fault() and friends know
about it. This has no functional changes because RISC-V uses the default
arch_vma_access_permitted() implementation, which always returns true.
However, dax_pmd_fault(), for example, has a tracepoint that uses
FAULT_FLAG_INSTRUCTION, so we might as well set it.

Signed-off-by: Pekka Enberg <penberg@kernel.org>
---
 arch/riscv/mm/fault.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index a173432ccf82..1359e21c0c62 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -234,7 +234,8 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 
 	if (cause == EXC_STORE_PAGE_FAULT)
 		flags |= FAULT_FLAG_WRITE;
-
+	else if (cause == EXC_INST_PAGE_FAULT)
+		flags |= FAULT_FLAG_INSTRUCTION;
 retry:
 	mmap_read_lock(mm);
 	vma = find_vma(mm, addr);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
