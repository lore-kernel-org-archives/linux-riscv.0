Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E60C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 08:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xczker7VL8hs4L0CXeYWafBLB8D8fZ6hw+RxIWtwAjU=; b=38cXo9zHuh+GsY
	pV/+q/81QA1GU0cVrBZy0z554AZDIQwQY6pqxBnq9zG6+zgGTz8UyjB9BKtnBZEZMiTGv8nHDzZ8s
	XdqFCHCQYEcP4zHM0sMjVMJUYBFChkFi81cknKhZuxZ+Lts2+MzvbJS7YFO5PLbPl9Llzg2BB5Jzm
	C2dZ1Zd2+Q4Rjkipzee6INmb0iu+3HFHSbMsjne+88XSv/HDlmkRPuCVDnr9w5jybzug8/nqORhK3
	5tY3B1gy8cut1S1HfGIC9P5Ct5HmVSlc8vlXQmu4i5if/cwt5JwlhkZycf9jdp04I6b3UuJ180fif
	jbHm+8b158KmoWSsO0CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0RZ-0000000DDfd-26c4;
	Wed, 17 Jul 2024 08:55:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU0RW-0000000DDeI-0I5J
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 08:55:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2D2D3CE14EA;
	Wed, 17 Jul 2024 08:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C068C4AF09;
	Wed, 17 Jul 2024 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721206519;
	bh=DHZSdFj12CNoCuzszmzk1V86rPvtnt1xB5Fb8oSp9OA=;
	h=From:To:Cc:Subject:Date:From;
	b=pK+fggm7RCbX+rv3w9xGhY2LhgtENb6q3oqIU5XVw4tliZBtLUuTnPBN/CoPdoGqF
	 fOaDZK/Wh/YvCA/UXLxZUww66bZq+nl9wculpRitIHnEirnxhXGUjV+0Raf3mqfxx+
	 InYhHB8AOD7ionSDaWwlxXyVn3SGhu2D7WtTAz3hrOqzMfux4jyXD//5wcQ5LqpiOP
	 kwXyDXijHb823bNlaY0mNT9ih6ij07uXa2M+C1FCO4UVYdUNQr0ADYZ+kscylUdDBW
	 vwrCVzR18f9fJgSOQGcYYQ1ek4nrT0bhAHcMkU3Rda3OH7AF8QA+OyMNXrEeLI6DAI
	 dAixryMtZdRzw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: hwprobe: sort EXT_KEY()s in hwprobe_isa_ext0() alphabetically
Date: Wed, 17 Jul 2024 09:54:38 +0100
Message-ID: <20240717-dedicate-squeamish-7e4ab54df58f@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6NJp1/sgFysXap5wH5veGRgn0KXcr6TsXGlfdh3O0z4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnT285Z1jQIrRT62hcml2eZ/f/zCt1M3oP1hy/w56WFO GoUmVt1lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCJeyYwM92brNDZ1/7qgcPrs TP9pu76wl9kExC0XZf+d6hPf0WIRwvBXfMqEOfmyVyqmdq58OKu+9ur3O/GbD4jvrJt6z+iYX9U VbgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_015522_509544_94DC2887 
X-CRM114-Status: UNSURE (   9.98  )
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

Currently the entries appear to be in a random order (although according
to Palmer he has tried to sort them by key value) which makes it harder
to find entries in a growing list, and more likely to have conflicts as
all patches are adding to the end of the list. Sort them alphabetically
instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/kernel/sys_hwprobe.c | 43 ++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 685594769535..8a1c9ce170e8 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -93,44 +93,45 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * regardless of the kernel's configuration, as no other checks, besides
 		 * presence in the hart_isa bitmap, are made.
 		 */
+		EXT_KEY(ZACAS);
+		EXT_KEY(ZAWRS);
 		EXT_KEY(ZBA);
 		EXT_KEY(ZBB);
-		EXT_KEY(ZBS);
-		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZBC);
-
 		EXT_KEY(ZBKB);
 		EXT_KEY(ZBKC);
 		EXT_KEY(ZBKX);
+		EXT_KEY(ZBS);
+		EXT_KEY(ZCA);
+		EXT_KEY(ZCB);
+		EXT_KEY(ZCMOP);
+		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICOND);
+		EXT_KEY(ZIHINTNTL);
+		EXT_KEY(ZIHINTPAUSE);
+		EXT_KEY(ZIMOP);
 		EXT_KEY(ZKND);
 		EXT_KEY(ZKNE);
 		EXT_KEY(ZKNH);
 		EXT_KEY(ZKSED);
 		EXT_KEY(ZKSH);
 		EXT_KEY(ZKT);
-		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZTSO);
-		EXT_KEY(ZACAS);
-		EXT_KEY(ZICOND);
-		EXT_KEY(ZIHINTPAUSE);
-		EXT_KEY(ZIMOP);
-		EXT_KEY(ZCA);
-		EXT_KEY(ZCB);
-		EXT_KEY(ZCMOP);
-		EXT_KEY(ZAWRS);
 
 		/*
 		 * All the following extensions must depend on the kernel
 		 * support of V.
 		 */
 		if (has_vector()) {
-			EXT_KEY(ZVE32X);
-			EXT_KEY(ZVE32F);
-			EXT_KEY(ZVE64X);
-			EXT_KEY(ZVE64F);
-			EXT_KEY(ZVE64D);
 			EXT_KEY(ZVBB);
 			EXT_KEY(ZVBC);
+			EXT_KEY(ZVE32F);
+			EXT_KEY(ZVE32X);
+			EXT_KEY(ZVE64D);
+			EXT_KEY(ZVE64F);
+			EXT_KEY(ZVE64X);
+			EXT_KEY(ZVFH);
+			EXT_KEY(ZVFHMIN);
 			EXT_KEY(ZVKB);
 			EXT_KEY(ZVKG);
 			EXT_KEY(ZVKNED);
@@ -139,16 +140,14 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZVKSED);
 			EXT_KEY(ZVKSH);
 			EXT_KEY(ZVKT);
-			EXT_KEY(ZVFH);
-			EXT_KEY(ZVFHMIN);
 		}
 
 		if (has_fpu()) {
-			EXT_KEY(ZFH);
-			EXT_KEY(ZFHMIN);
-			EXT_KEY(ZFA);
 			EXT_KEY(ZCD);
 			EXT_KEY(ZCF);
+			EXT_KEY(ZFA);
+			EXT_KEY(ZFH);
+			EXT_KEY(ZFHMIN);
 		}
 #undef EXT_KEY
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
