Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7E2FF8875
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o4Yn76eTpg8hBy8vjU6VtUUWB1PuLnQVWJZ9XImpfWA=; b=mMGfFFuQh2WyH+
	bdKdf/P8Oe1BOcg/QlmrwBuWHu5Xkc52V0KoqvDxSEDCnRT6YcYWtoOjGnbbZYfzLEnLqZgybuitb
	FyJZeZk5dVINNAYMBuhbpY1RuLgU2reGTgB1Q2j7S3x1yzCk5/zZa/wFnQq9VVazhRSp6QHRlxuaK
	ID0e1h1ANFS7eCbuLruEqZSnaRTZbewaQ3C8ILMpXVQangDgsZCD5tXwl+nBbfPHsy+WOnFGBAYWi
	FnCfXYk+7f65YT85O+EKlJXfZpjkN1KOaxgL4hcxUHDlBye4QfeDukV3ZuA4UFOc8RtTT8xEUfuts
	LMv/a/m5SzBr4ZMWFn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJPb-00000004fuc-0mrd;
	Thu, 30 Apr 2026 04:54:07 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIJPW-00000004ftu-1Qg1
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 04:54:05 +0000
Received: from hwang4-g16.bbrouter (unknown [183.236.147.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id E7F433F69B;
	Thu, 30 Apr 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1777524837;
	bh=nv54BxlPj1Kp/kgG/Scn7s+8ENuHCGjlGz2o5HBkdLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=SWTVUa1SlHGLJBbXF4L0FypdxtybN0WZGbAx2NoW3Mk1iRdSi6RUnQEWBzjiBtazj
	 UBxh3aIZgVSDCsaiw8Pi0W2GQV08FUZ57SEqqlpFxb7boXh1JO5KoPzGgBY21O+Er7
	 3X9HBHA6OxNZ7zU9g+uIe4W1COWUf6aUmIpjahjuNiQhgf+Ge7utLsQFh+y29ToRLg
	 cDWQ00D6pZAl9j38DKUGEcspMnqmjGawE/TcBFclhLbDBrhkZjS3llBpltlhu26yPS
	 2j9Pb9YL7p5/0kFc97H+3kEFzxUFbQV4EK+LhzlHLrxio5L2yWq77xH8GIgTqsGfYh
	 g4s4A5aMC8Rs6CBgu3eF47e6FWfoxgVmBzm49jxPijMdnXS9GwbZsemBYfaansP/dW
	 cdhwWdbWlMQ2pa92aX/XbLbAth/JUQAe39y0l597Pm76rRvdLeU5YMLxXDRdrgEb/2
	 Jyi8jc5ClWGQnfAEroWGm9jWHoRKt9Nb7HZwiTSDqeWkgRLS7LNk7JmI+s6qEYTXlO
	 hjU4jy5z7b7984UZq3VUHHTS2Mpdo8vsjsC71KAmoX6TNMhN9zydt287HjHSqLsg7j
	 2VGgXovvSJuAHarUzIpkeZiv+3aldZW++nXFxUXIsr2mqLI1AOYyPCxE43IA/3eiJt
	 grCcNMzm4Rt552go9ORYVarM=
From: Hui Wang <hui.wang@canonical.com>
To: linux-riscv@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: hui.wang@canonical.com
Subject: [PATCH] riscv: cpufeature: Drop this_hwcap clear in T-Head vector workaround
Date: Thu, 30 Apr 2026 12:53:50 +0800
Message-ID: <20260430045350.22213-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_215402_767141_F6571094 
X-CRM114-Status: GOOD (  10.07  )
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

The variable this_hwcap is initialized to 0 for each loop, it is not
necessary to do the bit clearance since this_hwcap is still 0 at this
point, clearing the source_isa is enough here.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 arch/riscv/kernel/cpufeature.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1734f9a4c2fd..3dc4c0d31550 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -896,10 +896,8 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * CPU cores with the ratified spec will contain non-zero
 		 * marchid.
 		 */
-		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
-			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
+		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
 			clear_bit(RISCV_ISA_EXT_v, source_isa);
-		}
 
 		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
