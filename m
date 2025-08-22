Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51640CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jzvyvha0MmQQAEMBhPw/8mnavZJju2vrwfgx3OitSuw=; b=hGxaecj5bIJbhc
	ZefjPGhyfAErotTOIDWG979aHRVzYZ8nBngytccEVf4Itu2jTS/M52xwcpreNTF5f33Aep7vNYaIo
	AA4CG5svqDNz35ge5E/fdfoBxJdO6xbmcWR+QwQqKWJn1ArwmYZoz6rd07RT78hiOF3MYCquROQoW
	v0ribu9aPov2F2CfEKI9NqtXR9NmfkzWzU7KnXZNiU+LsY/bKy9tBw+oxc9tp4T/x/bXYPZgz4auB
	6BobT57oXbIchy6cj3Y3EfwQYU4x7bANQJalGiqaAmSrZdYF4nGzi6CwulP04Z1cVg5MyHvIdaMgc
	rFxWCz7WjM1EIY9KojPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfM-00000004Udx-0e2T;
	Sat, 23 Aug 2025 09:36:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0i-00000003CaX-2pk8
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=P4wTzrsT/xwNrd1hOlluc2KMdmJ1fRQkZdNQ1DQnMEo=; b=pQmuts46PCa7Vuyq4I8eFJZbvN
	I6bckQ80xLoogPy6tUaca5ToXsfDfLS/ECWcSyn9H/U2SiNLu4n+1n5x6r4QPkpSt5anlFyUgKDsY
	uFg7a7RdUjZrRx2uIXX+Gt0M5oirBiE4niOmox+vM6Sbcpnr6KQXj42LOCN5SzVMJwOe1avA+N9Y/
	+AlzP9938ZOrwvv2txkOqqt4FChCWM8WSVeSCwOfYHqIzjLaGDpRjgtUnAsjMgNuGtZHeAHQsF+HS
	mhFD//AqMBJeoBZkvqgJ3YuUv3JZkTonBDpAB6XQ2ztKUrk/9QFlZUwdeNjrDwsqcUUrDav4A25XA
	jAFC3qwA==;
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0d-000000011s9-02wh
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P4wTzrsT/xwNrd1hOlluc2KMdmJ1fRQkZdNQ1DQnMEo=; b=q7reV+H8j//98KQ0y70JvAbDMt
	J5Qcs+VNjHxHSQrVABngNnZq4qReKQsvKjqTsWSTeYb3kBuHro3bIJ2VvS6Y3ddoo1gWi5+npZbd6
	KZHeqAuYM3v+cuE2/OxOekaUTdkxT1rMigMSagUE3dHonNQwVsK82m3y+0FSlCLiR668ggHAz6tUM
	zhWTNiY6NjTw+eRha0z73iMY5GthexPQzz5PQU505+pFvm3Q+Skcz4nInfdntDTd01dosMCIEwEpK
	P/omqtxuiJXi11zmaGGYR6Qlri2DVdBqIl2MjR/NcgKgAFglX50SVY7lhrH2jZTYNeA0sZtDqRGaj
	QXsAI7qQ==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-0015co-25; Fri, 22 Aug 2025 17:52:51 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DPj-2ywb;
	Fri, 22 Aug 2025 17:52:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: -linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Javier Jardon <javier.jardon@codethink.co.uk>,
	Ben Dooks <bjdooks@gmail.com>,
	Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
	Roan Richmod <roan.richmond@codethink.co.uk>,
	Sam Grove <sgrove@mips.com>,
	Chao-ying Fu <cfu@mips.com>,
	Mukunda Aprameya <maprameya@mips.com>,
	Umesh Kalappa <ukalappa@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Kurt Martin <kmartin@mips.com>,
	allikarjuna Gouda <mgouda@mips.com>,
	Vaibhav Chauthmal <vchauthmal@mips.com>,
	wapnil Agrawal <sagrawal@mips.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 13/18] riscv: fixes for big-endian library routines
Date: Fri, 22 Aug 2025 17:52:43 +0100
Message-Id: <20250822165248.289802-14-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_426544_B33A08CD 
X-CRM114-Status: GOOD (  10.57  )
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

Update the unaligned handling of memory when in big-endian
and the byte positions inside a loaded word change. Do this
by wrapping the shift macros and swapping the left and right
shfits.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/lib/memmove.S | 28 ++++++++++++++++++++--------
 arch/riscv/lib/uaccess.S | 16 ++++++++++++++--
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..6971006a8eb6 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -6,6 +6,18 @@
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define M_SLL sll
+#define M_SRL srl
+#else
+	/* in big-endian, swap the direction of shifts to deal
+	 * with the fact the order of bytes in a word has changed
+	 * from ABCD to DCBA.
+	 */
+#define M_SLL srl
+#define M_SRL sll
+#endif
+
 SYM_FUNC_START(__memmove)
 	/*
 	 * Returns
@@ -133,8 +145,8 @@ SYM_FUNC_START(__memmove)
 	1:
 	REG_L t1, (1 * SZREG)(a1)
 	addi  t3, t3, (2 * SZREG)
-	srl   t0, t0, a6
-	sll   t2, t1, a7
+	M_SRL t0, t0, a6
+	M_SLL t2, t1, a7
 	or    t2, t0, t2
 	REG_S t2, ((0 * SZREG) - (2 * SZREG))(t3)
 
@@ -142,8 +154,8 @@ SYM_FUNC_START(__memmove)
 
 	REG_L t0, (2 * SZREG)(a1)
 	addi  a1, a1, (2 * SZREG)
-	srl   t1, t1, a6
-	sll   t2, t0, a7
+	M_SRL t1, t1, a6
+	M_SLL t2, t0, a7
 	or    t2, t1, t2
 	REG_S t2, ((1 * SZREG) - (2 * SZREG))(t3)
 
@@ -195,8 +207,8 @@ SYM_FUNC_START(__memmove)
 	1:
 	REG_L t0, (-1 * SZREG)(a4)
 	addi  t4, t4, (-2 * SZREG)
-	sll   t1, t1, a7
-	srl   t2, t0, a6
+	M_SLL t1, t1, a7
+	M_SRL t2, t0, a6
 	or    t2, t1, t2
 	REG_S t2, ( 1 * SZREG)(t4)
 
@@ -204,8 +216,8 @@ SYM_FUNC_START(__memmove)
 
 	REG_L t1, (-2 * SZREG)(a4)
 	addi  a4, a4, (-2 * SZREG)
-	sll   t0, t0, a7
-	srl   t2, t1, a6
+	M_SLL t0, t0, a7
+	M_SRL t2, t1, a6
 	or    t2, t0, t2
 	REG_S t2, ( 0 * SZREG)(t4)
 
diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index 4efea1b3326c..71ee4811db68 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -6,6 +6,18 @@
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 
+#if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+#define M_SLL sll
+#define M_SRL srl
+#else
+	/* in big-endian, swap the direction of shifts to deal
+	 * with the fact the order of bytes in a word has changed
+	 * from ABCD to DCBA.
+	 */
+#define M_SLL srl
+#define M_SRL sll
+#endif
+
 	.macro fixup op reg addr lbl
 100:
 	\op \reg, \addr
@@ -178,10 +190,10 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	 */
 
 	/* At least one iteration will be executed */
-	srl	a4, a5, t3
+	M_SRL	a4, a5, t3
 	fixup REG_L   a5, SZREG(a1), 10f
 	addi	a1, a1, SZREG
-	sll	a2, a5, t4
+	M_SLL	a2, a5, t4
 	or	a2, a2, a4
 	fixup REG_S   a2, 0(a0), 10f
 	addi	a0, a0, SZREG
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
