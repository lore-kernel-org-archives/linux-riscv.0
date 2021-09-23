Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224CFC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:21:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A6D604D1
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 17:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7A6D604D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSznCmWt8LI4XMTic0LoHZNYHopEBVvFS/gio4By6jM=; b=Izq2u/FvkAWZRt
	dfy05MU25JROtucEVhTmd8PfOmPDIQSM+1R9R3i2jRKbY14f+uVE+9xfWbhpBo9n2ADLhAOnvteTU
	xYkXxxMYON1G6/GVScodRKoTZwkjPgAQ3Gqjgb05u7IbaCMb1IGIefNTlDC2LzMCJn8cudxRrrFVe
	h3hJi24XwffU6PmN0ODUjgoMOS5GMQ0A5RqSWa0qXkmgNj9jPK9J0A3QkNd5Ur4GKpbgwpNFSZw88
	VIh9C1mkkgrka+7fwQmS/kMxypJ/7XEk93kMe2OjpgpRoRePf3ggNTIEdvkq788WCbYeWvT64xdbI
	BU7GrjWls8kWNvlGlmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTSPa-00CGvc-E7; Thu, 23 Sep 2021 17:21:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTSPX-00CGuu-BJ
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 17:21:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D77526109E;
 Thu, 23 Sep 2021 17:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632417687;
 bh=s2lEbsUK2QSTVWOGxFPXmMQe0lxrblhhxihNsi7x+iI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iI4qnQcfSOrNmU4uK7Z2ToKa0FxJ64z9GjA1adg3AIblkTmaVPQW9sAuInXDE40SK
 IVrZ1bFQOflf+TTx7Ltw4JgIJ7WFFCI82BbdZAj4aO6GaWLi76+9SycX5g9az5Fhet
 ttyaOCMZNPTZIhrvpTIy46AWnZ1PbthWAbuMHBENJAU8B0o0OAGjLohk1s5lBK5IbQ
 Gt+nIiSiCHYjCKVDuEI6N1cX6ZDCjhBIYKn/DQNX7zNAslbK0XjoVLMET8F5r849uE
 BRKjrAJ47yi1MIBPvAghs+eY+mBdlQnpvvWYZgc534ELbeGzTjqWJEz3fzFQG2eGa0
 63BOs4zTIWlhA==
From: guoren@kernel.org
To: anup.patel@wdc.com, atish.patra@wdc.com, palmerdabbelt@google.com,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 hch@lst.de, liush@allwinnertech.com, wefu@redhat.com, lazyparser@gmail.com,
 drew@beagleboard.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH V2 2/2] dt-bindings: riscv: Add svpbmt in cpu mmu-type property
Date: Fri, 24 Sep 2021 01:21:07 +0800
Message-Id: <20210923172107.1117604-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923172107.1117604-1-guoren@kernel.org>
References: <20210923172107.1117604-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_102127_445672_EBBC0E9D 
X-CRM114-Status: UNSURE (   7.81  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Previous patch has added svpbmt in arch/riscv and changed the
DT mmu-type. Update dt-bindings related property here.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Rob Herring <robh+dt@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e534f6a7cfa1..5eea9b47dfc6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,15 +48,18 @@ properties:
 
   mmu-type:
     description:
-      Identifies the MMU address translation mode used on this
-      hart.  These values originate from the RISC-V Privileged
-      Specification document, available from
+      Identifies the MMU address translation mode and page based
+      memory type used on used on this hart.  These values originate
+      from the RISC-V Privileged Specification document, available
+      from
       https://riscv.org/specifications/
     $ref: "/schemas/types.yaml#/definitions/string"
     enum:
       - riscv,sv32
       - riscv,sv39
+      - riscv,sv39,svpbmt
       - riscv,sv48
+      - riscv,sv48,svpbmt
       - riscv,none
 
   riscv,isa:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
