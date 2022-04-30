Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF5EC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aELp7t+l2j2MJ+3m1u2KfftnEejmK1sMhbR5kLEN0UM=; b=SIO6yV8e0U90nf
	SXvicSriQyAeGwBqqDlEiCiLcorrL53zvuZ/krGxp8+lWuQK/aZJVWhMx4nsbUaVyUb4UH9K84VIb
	ILRxFG+ptu91QqeCwohKAREFacP5O+xcB1RdymYE+VuDbxHqbSDpqL166GMGLf5eyuP/Z6N6e6iSn
	Q54WTgadEctsStUgsUZX3BMmnHDUH3I4orQOpuloEPU14n6r1MROmj/i8boJkYDOs1y9nb2d3pMif
	T6AjIP7AMZuBiYtoX1mdbkl/ZVJx1uNCYgtang3zL1jBSATUCtTfSYX9gW9HlZ8JCJExxyIK0UWHa
	PtreWmzRaHur8Q33WHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nksVP-00EzQr-Dz; Sat, 30 Apr 2022 19:11:47 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nksVK-00EzOO-Gk; Sat, 30 Apr 2022 19:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uJF7w0KVfCE/YA1nGgKtXl1p7lo511Mm0AmaJ0sR/yk=;
 b=eQBk0LYzQjD6XGO4wy1hoKaVqmTjjWoetmyGs+Cz90N0tC6OjrITc/od
 rro6gWjwNjE8QcRomslEDFe9YpTFv2tWfOlCYi15NTOQYOMMkVA1emIC9
 yhBNfViZV5FwOHNeSme3Wg1bbXIOQGPHCGvX7ahrxldHe4lLwphv00Bpc Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,188,1647298800"; d="scan'208";a="34084619"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 21:11:33 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Anup Patel <anup@brainfault.org>
Cc: kernel-janitors@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: fix typos in comments
Date: Sat, 30 Apr 2022 21:11:20 +0200
Message-Id: <20220430191122.8667-6-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_121142_840983_0C026796 
X-CRM114-Status: UNSURE (   8.70  )
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

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/riscv/kvm/vmid.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 2fa4f7b1813d..4a2178c60b5d 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
 		 * We ran out of VMIDs so we increment vmid_version and
 		 * start assigning VMIDs from 1.
 		 *
-		 * This also means existing VMIDs assignement to all Guest
+		 * This also means existing VMIDs assignment to all Guest
 		 * instances is invalid and we have force VMID re-assignement
 		 * for all Guest instances. The Guest instances that were not
 		 * running will automatically pick-up new VMIDs because will


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
