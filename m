Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA9C30659
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 04:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZcQUuXXkiDQ2KFK/Dn0DgdBBvpolUeb0PbKERo/vfA=; b=OQM7N/b3lSI4eC
	4xtLDKIl9WR9H8eoDHX05GWSAbPRqo3QF3oVYQMcr6M3FYfh5qkTlTqLUZne3N4yLwxl1TDhOsgu3
	OiiMcoxE+ZPd4ujGzIBZCYPDrvi5GldNBwEDTumbcMuYq14Y1WKz1QLyjU7OCy1OKmnCLTciv5vGn
	CTyi6IeDW9wWHM+ki7ktXdsMEd1hTG9gRiUUy+/BiFb3kbhz1/HD9szc7TlDSg1nlrbrsS6UTY3v0
	mYaYR8Mzt0BIG3x4ZiMY/ttoRncmrjyzHQV5N2Ia8gmGVb6ztJqq2+VRc7wtkf4rVknC6pgQZb4jh
	swxrY8FI7cJ4E06INEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxeC-00000001XOp-2ccz;
	Tue, 25 Jun 2024 04:19:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLxe8-00000001XN7-332s
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 04:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECEE2611DA;
	Tue, 25 Jun 2024 04:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7CA0C32782;
	Tue, 25 Jun 2024 04:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719289147;
	bh=5yvcxNr6EfINb4k2kkXt3e0AscGuviAUNxRV+wtNX/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eu6Sm5jN/GREE9cN89U6psq/7I6UTjd+7K5yuIXCah5xsRCY4Jzc1sgpuy+gZg/Tl
	 D0Fg4puDPNIvbaxKpBL7P2kZiY8DzFjkoORnOG0bu2aM7SYN1JN8pt7C0bVIbMyln9
	 Nk4ne511q7i2gFgMk1P6oWyYE5V4irQ0y5Oo+YEdRESU0a332PRtOxAyisQCUlEcpF
	 fZvP9vUyacrjE+JMbkNURcLS2nywajgO+0G8Mrz83J2AnRH2yvLnJXBN/H3wJywTGR
	 I7aJ7npC+h7vEDo6/X25OXD4Qpu8ylwbhel0ynvjMHcC2BUbv2Qqn5S/Etl/wA/k+b
	 QKfb8pDED4tLw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of __put_user
Date: Tue, 25 Jun 2024 12:04:58 +0800
Message-ID: <20240625040500.1788-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625040500.1788-1-jszhang@kernel.org>
References: <20240625040500.1788-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_211908_839399_D8709647 
X-CRM114-Status: UNSURE (   9.15  )
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

I believe the output constraints "=m" is not necessary, because
the instruction itself is "write", we don't need the compiler
to "write" for us. So tell compiler we read from memory instead
of writing.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 09d4ca37522c..84b084e388a7 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -186,11 +186,11 @@ do {								\
 	__typeof__(*(ptr)) __x = x;				\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	" insn " %z2, %1\n"			\
+		"	" insn " %z1, %2\n"			\
 		"2:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %0)		\
-		: "+r" (err), "=m" (*(ptr))			\
-		: "rJ" (__x));					\
+		: "+r" (err)			\
+		: "rJ" (__x), "m"(*(ptr)));					\
 } while (0)
 
 #ifdef CONFIG_64BIT
@@ -203,16 +203,16 @@ do {								\
 	u64 __x = (__typeof__((x)-(x)))(x);			\
 	__asm__ __volatile__ (					\
 		"1:\n"						\
-		"	sw %z3, %1\n"				\
+		"	sw %z1, %3\n"				\
 		"2:\n"						\
-		"	sw %z4, %2\n"				\
+		"	sw %z2, %4\n"				\
 		"3:\n"						\
 		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %0)		\
 		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %0)		\
-		: "+r" (err),					\
-			"=m" (__ptr[__LSW]),			\
-			"=m" (__ptr[__MSW])			\
-		: "rJ" (__x), "rJ" (__x >> 32));		\
+		: "+r" (err)					\
+		: "rJ" (__x), "rJ" (__x >> 32),			\
+			"m" (__ptr[__LSW]),			\
+			"m" (__ptr[__MSW]));			\
 } while (0)
 #endif /* CONFIG_64BIT */
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
