Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6A0C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 09:57:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A6F96135C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 09:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A6F96135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B9ZhgBYR6IBTt6XVXYX3RCJClsKNRw5OXQWgjV6sQLk=; b=Qq2D2B650GeH/opDd6C6WaWjY0
	CwUlPMVYIw61+YSaVPc0bPbAhaOuWo9rw7Ubd2lUDkz9Zq/thL7zY2NlHCa4b4dAkXeyisAJdC5RE
	m01+ngFiaqNDYL/erR/mxp5NCPJIknvUxsrZqt+W4/INYt9Krft/fct7WYozOckfOWwwzTRntSzLq
	WDBYIGLNB6gPgEaZ5TH/fgivdkvvqmUp2a8T5CANTcbU80BFdUL3udtvHSmJIDGyopTFsZRTEJYXc
	QVZgb5/YyuyR7xzTpjzVMjwxBcd7Gx8QGvAtjiIdtn7KCJsYIhB6uN98FVn5roo2pIjLidDgcUhI3
	N9g0S7Fg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk1uT-004psq-1X; Fri, 21 May 2021 09:57:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk1uQ-004psD-EK
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 09:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=B/wYYnHWo9E2E1l8xoCZhuUpC95MUnqnQUm4SUKotV0=; b=EwP1lOobANwKn3+IWdR3vMLKgu
 g55aNwDXwz6OKRw6mSpMWyI0WnMuRXbtnQiWHDbd7dMqMDtcf2qZn9wu7zkgKJCkQtpk8LrGEwBDq
 Hkh/tFTx5M4kNjSnMviMgA34Rm7M+UVK1wOt2iXUbCFSAM9AGO2W2deXHU7Ywmy5vIbZ//yzSSYgF
 3H4pUZVNb6GlMCdRNSkzmRkfOlQgbIVKoTS2ZvE57d2sLrpxOj6zXjWpsPDh0ex1I8/7JdQLGRdd7
 Hu7VcqVM6x8cnWaWISNyRwRghigFrXwReLsPC1cioWfIsz1miM0cHVHInjADXqaO89nQ1Wq2Yc07a
 wdYcv/ow==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk1uN-00H0xc-J6
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 09:57:33 +0000
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FmhmT6WrlzmWxX;
 Fri, 21 May 2021 17:55:05 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:57:23 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 17:57:22 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH] Documentation: dt-bindings: Fix incorrect statement
Date: Fri, 21 May 2021 17:57:20 +0800
Message-ID: <20210521095720.5592-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_025731_824955_DF4E169D 
X-CRM114-Status: GOOD (  12.82  )
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

It's found when reading the Doc.

In a SMP system, the hierarchy of CPUs now can be defined through
four not three entities (socket/cluster/core/thread), so correct
the statement to avoid possible confusion.

Since we are already there, also drop an extra space and tweak
the title alignment. No real context change at all.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 Documentation/devicetree/bindings/cpu/cpu-topology.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/cpu/cpu-topology.txt b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
index 9bd530a35d14..8b23a98c283c 100644
--- a/Documentation/devicetree/bindings/cpu/cpu-topology.txt
+++ b/Documentation/devicetree/bindings/cpu/cpu-topology.txt
@@ -6,7 +6,7 @@ CPU topology binding description
 1 - Introduction
 ===========================================
 
-In a SMP system, the hierarchy of CPUs is defined through three entities that
+In a SMP system, the hierarchy of CPUs is defined through four entities that
 are used to describe the layout of physical CPUs in the system:
 
 - socket
@@ -75,7 +75,7 @@ whose bindings are described in paragraph 3.
 
 The nodes describing the CPU topology (socket/cluster/core/thread) can
 only be defined within the cpu-map node and every core/thread in the
-system must be defined within the topology.  Any other configuration is
+system must be defined within the topology. Any other configuration is
 invalid and therefore must be ignored.
 
 ===========================================
@@ -91,9 +91,9 @@ cpu-map child nodes which do not share a common parent node can have the same
 name (ie same number N as other cpu-map child nodes at different device tree
 levels) since name uniqueness will be guaranteed by the device tree hierarchy.
 
-===========================================
+============================================
 3 - socket/cluster/core/thread node bindings
-===========================================
+============================================
 
 Bindings for socket/cluster/cpu/thread nodes are defined as follows:
 
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
