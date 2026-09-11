Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DDEC88E53
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 19:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3fp2ysXzmZUJE6AJEi0Nh+ORKrH2do/zDusSbQa3Gx0=; b=n1W15biRegZSxH
	u5RWHFFIIWbhZC8/RPCRsZ7dwozcHaFiJS4UTRGUtSBAvMOef9fNCOsocjThRedoTlkDw2j7wBRad
	EM1WyiLVvZV2B6UJMyha/tdC/pEdwtEZA1bhNfr6ZMdc6rbARoRzTIbMkRIzMmHrQARhpxgGHteHD
	WAJzS7g2dn8T5ndDjmIT78RRpogt2703cI8iXafKFzHtXX9ssnSJMuYa+LtIvBqgebCIyMfqWX4Uo
	Ee897XIsaBY58pN8z62ZU7BtwEVkMc0Cb+p95nN0fMImnKDWXI186s7DFN8ylaWyb9Axoo/sNtw28
	TD8z7A6CJ1G7NKBASoHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5794-000000001Hq-11dE;
	Fri, 11 Sep 2026 19:42:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5791-000000001GG-11sH
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 19:42:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=G2WtBM+Xo86zPU2H3M+cinHev6QJx7KF9qsuxH6vzTk=; b=jmBBVq5ORSOSbJofw0nNlV0m3V
	tGakfsi/Js0+aRu0CAzeiQPxTvyojx1DUKBMCtLjPmrMUgMke66+DPLrb/AevJ91CebedR1xJB+4t
	YeJO+2z/AH1Bs5EiGK0Z/IQMpgWVAbnLeriFBNk4IRbaRw70HXsNVbv4xn2EseALB0MYkhhlx64gC
	EoNHvD6M4kSBDtNivy3lEO9Ws5an9qLt+3lquZVDH+/YvtzCrHyKiW0Lf797fwgJge1Y244c8uHsa
	XIYb/VyZTwzO4NTzWkz6rXhUxWkhQ73/QGu2EjsBDL+KKlsOOh7SQQdkFE73QnEfJETsqJJpllQ5w
	1UkOb7mQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x578y-000000097AD-3QDI;
	Fri, 11 Sep 2026 21:42:40 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Cc: Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: fix RVG_SYSTEM_CSR_MASK width mask
Date: Fri, 11 Sep 2026 21:42:33 +0200
Message-ID: <20260911194233.3379532-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_124243_314631_D2662C39 
X-CRM114-Status: UNSURE (   8.81  )
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

RVG_SYSTEM_CSR_MASK should be 12 bits [31:20], shifted down by 20 bits.
Replace GENMASK(12, 0) by GENMASK(11, 0).

Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/include/asm/insn.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c3005573e8c9..ad348d8b8857 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -142,7 +142,7 @@
 #define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
 #define RVG_SYSTEM_CSR_OFF	20
-#define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
+#define RVG_SYSTEM_CSR_MASK	GENMASK(11, 0)
 
 /* parts of opcode for RVF, RVD and RVQ */
 #define RVFDQ_FL_FS_WIDTH_OFF	12
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
