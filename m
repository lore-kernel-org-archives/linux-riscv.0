Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE2BC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KOIbl6CYQHBeDa4f5rLVXlVHY92Kg1kQMS3goxEArKo=; b=C2j+YnN40usgP3
	uRvcnh5t4NxEPvP7Iji6AKFIqRwyfrDRWNRDI8dY+5760EQyto/Cv1vvbnpaSlGwy4VdmBpJKO3jG
	DyokUBdBCW3Df5KExjO02Z67hthlNT4F9RsLKINpSn0iR1Qk3tQH5JSx9c1DKFaS2Kyx5zz8IqScn
	XWrHALKjXlqxyl9G3JWUZlDARTYAtO7T7iSjxCsksSyCkodQnLiTAihHdaqMgqS+yR6QZaVTHVc0v
	Izgy8m8r//yoOcp1vLgdJv46aZjkbhyArb+l8EXetjrxTu/AnhfCU2nt8ZhS7Qkmp/pv7dQNeMtOT
	gox+vyGvyXWsxeuaih8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvB1-00BaML-2Z;
	Fri, 21 Apr 2023 18:08:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvAz-00BaM2-25
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 18:08:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99EC760E16;
	Fri, 21 Apr 2023 18:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B23C433D2;
	Fri, 21 Apr 2023 18:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682100484;
	bh=CMuxS8rneAbVoB8BDAV/FNDopMAUxx+b7ymKV1iTc9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=g4e5tsSCH1JSJjJ/hOwKFAuWD/SZ1frc8WfE8R8rGaNUGOrlsmATOnC24LCg6gxFo
	 W5Uzw2ViwJHj97GYjyGNXKBG5Hw5JcwCg5HVbb1YSYpWHe9rgo0ejXjUUyb+4HrTI4
	 dMsH5aXnorvO5FeRkRo1kxpYlLzmBBDu1qnI2oypWGu6bpf7SC/l+kIw/UJFrPJobS
	 mMA4f706Z9KDAoqt4By0FLoMOy3EYE/sYvrq6Y445j4ZDkud5/b9texij3oD9xlAkA
	 HRvl2BNbSyZMmOzoaYaTwymHCL+4x2PWveNXV4fyxmLTtJzx+CculskjBtuXvCXRpW
	 APIscLX6o+vQw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] dt-bindings: riscv: add sv57 mmu-type
Date: Fri, 21 Apr 2023 19:07:50 +0100
Message-Id: <20230421-voucher-ecology-7ddfdf801a71@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iG3dKBiOb3LcobsyWfmFohGfAIgxlux2esv3C3kv1IM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClOFz5/XM32rcgsvvlmp3ixPjdfudXhvYpJhz/f85q5b q3L7wfZHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZiIkhsjw6fPPAtUEkSTbj5b /GqSZpT2RG8vWePJbM8/PZ3iXvlijjzD/6Qqnjk3BP5c4xFh7uaxqti+tlzUUOC959NXnVF9sVq 7uAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_110805_723155_6948D51D 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Dumping the dtb from new versions of QEMU warns that sv57 is an
undocumented mmu-type. The kernel has supported sv57 for about a year,
so bring it into the fold.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 4c7ce4a37052..25d6e8dbffb8 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -66,6 +66,7 @@ properties:
       - riscv,sv32
       - riscv,sv39
       - riscv,sv48
+      - riscv,sv57
       - riscv,none
 
   riscv,cbom-block-size:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
