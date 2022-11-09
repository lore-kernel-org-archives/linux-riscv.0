Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EB1C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9DnCtF0Xw4wMc3TikmK+8HVUW4qDMsSDJGFAe3bLZY=; b=qFTO6eDUJuJWqb
	x3TBdOtPIXp/Cr3hbVXkPGbwk2KUi2eVOglGcljDFUMVEnIVp8WoqzeQnv2rYjOb4nfSlS626KxcS
	KDn8XQ49wSkjpFspz26DMesBjHzpgLQyYBARUcMjZ98OVBYgTmAp8gFPDkMvT4HJo8b3+DllU+6L5
	og8RriAUVeUC9esAhIE7WrsKEHwoLLQDkb9FuqNs4Bw2FmyeKDt5RbfyFWHHiu5ELPHqdz013WfMT
	b2QBFvwGnYH+8tZ/PW54f4v/ldLobnlQ6sVaxikNANBThLK6C1pcPpxIDCLMt9a33zWm51oazH18u
	ZxV3a2ryAI+nKPNyzspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXg-00HOVW-23; Wed, 09 Nov 2022 21:23:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ossXc-00HOSk-8h
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 21:23:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EA6BCB81F65;
	Wed,  9 Nov 2022 21:23:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B33C4314F;
	Wed,  9 Nov 2022 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668029001;
	bh=VZ4QpluSuGSOGq5v/vlU5gZCX8GrnRCwhXb+eMkQg94=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=dJVGcq7w53YJ+v5ntjpfAFa1NCeWetTd0EAORNVrMBha8ArHDYKOyfi8SZzTA8ZXp
	 GVpYRlRBIa7niG7zHvEch45Dkj5C5pzr9C3QguyqKjBNhtnnVr+lXzADM5OGf7Omvt
	 /o4f0Z10i+j5KE0bOewwMIfVIKJpyr1/HpVFuErkJpVce70reth5M6YqyCxIj/DOsP
	 7jxoL2gCq3P16+mVkbNFTB9cNjr1xLW5qd3XUDXApshJsQEqhMdHDwG+9HJH+IA/NZ
	 07v3T7uu2qe40OfrekAN7kj/5/nPU/LUjTU9gT0DEGQE/td8m07BGPjR0+skf0lzhT
	 uniZa+Q2ABrAg==
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/4] MAINTAINERS: generify the Microchip RISC-V entry name
Date: Wed,  9 Nov 2022 21:22:18 +0000
Message-Id: <20221109212219.1598355-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
References: <20221109212219.1598355-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_132324_476332_9B094DA7 
X-CRM114-Status: GOOD (  11.86  )
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

These drivers work on our other FPGAs, for example the non-SoC PolarFire
connected to an FU-540 via chiplink. Make the entry a wee bit more
generic to match. While at it, remove the / from the heading so that it
matches other, neighbouring RISC-V entries.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b88ced1ff72c..a57c90be001f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17732,7 +17732,7 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
-RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
