Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AD0104C00E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 10:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J9QDPTv8rpavHnE/KIKSZ03lM4iFXV/vwMpFK+4R4eg=; b=te3rAuQvuJhn7O
	Y6wyJzFG9f0IXYqwELe8zIvt4zaG60qOtnvuENNSFSUKH4baB7Lr9uaviNmcAjs+h9k4IBccZb01p
	0tkNlTxXAyHKSRns1mv+jJqbkH0/EnlH78Vy9w9TKy8V1sAPJMIw07Bk04L0LZzaVVjsX894Ibghz
	+Gn3NOq3BbEYlXutuFRkt8Ug6OccxVubakV6QtZFxvmQEczd3SLFixRNNhU16wjY9gZwcbtJZk7ej
	BKWhqurB2rNdk/VKDqhc/cqaWGiIVFcBVY75gAhLqswtS+SekoHKt2feaYzXR55LvrXjC8JO4e1Sl
	HgS3BmPSIIm01XHB1/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HAT-0000000BSNr-2qgS;
	Wed, 11 Mar 2026 10:51:57 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0HAR-0000000BSNU-24iB
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 10:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=qKmAeN5wQLc9dRpMyHH2tpIX9ilAu06aGK0dD5wjViM=; b=L06BnIcfftzRUF
	kNgkqnYACtJADobJTuqw6IssL+01WdGqd91Y8zhDW4QL6uU5wBh5nvBJ8Rqj5cIDhSNEmnsOL4sL4
	0LTWlFWdhk61a7O0ckdraXnubulLBcBsgSla+jx7953qJJ3OnLfNpxjBHBvOU9FRt3mPGBLlF2H1b
	L9tppm2c2rsi/ZrpeM66mYyKK6K1aRxJH7g5uG0xDtq0ZTxY9JIB0bxpCZXOt+u3ZYEhCj/p5tPKM
	XHod7nwi0PUo0BqMj3DnIlcXo289CC16sEuaaDGj9bo2fZSa5PEAtPzMH8wXmvt4uxpbLA9zt7zoH
	BxbCtZCgnxtm+AZicwng==;
Received: from [63.135.74.212] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1w0HAL-00F7fH-HD; Wed, 11 Mar 2026 10:51:49 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
	(envelope-from <ben@rainbowdash>)
	id 1w0HAL-00000001sja-12ZV;
	Wed, 11 Mar 2026 10:51:49 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Cc: linux-kernel@vger.kernel.org,
	alex@ghiti.fr,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] riscv: uaccess: fix sparse warning about cast to restricted type
Date: Wed, 11 Mar 2026 10:51:47 +0000
Message-Id: <20260311105147.448717-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_035155_719816_69B41480 
X-CRM114-Status: GOOD (  10.49  )
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

It seems recent changes have made sparse warning about casting to
restricted types whe using __get_user() in drivers such as the
drivers/pci/proc.c.

Fix this with a __force to fix such warnings as:

drivers/pci/proc.c:148:17: warning: cast to restricted __le16
drivers/pci/proc.c:148:17: warning: cast to restricted __le16
drivers/pci/proc.c:148:17: warning: cast to restricted __le16
drivers/pci/proc.c:148:17: warning: cast to restricted __le16
drivers/pci/proc.c:157:17: warning: cast to restricted __le32
drivers/pci/proc.c:157:17: warning: cast to restricted __le32
drivers/pci/proc.c:157:17: warning: cast to restricted __le32
drivers/pci/proc.c:157:17: warning: cast to restricted __le32
drivers/pci/proc.c:166:17: warning: cast to restricted __le16
drivers/pci/proc.c:166:17: warning: cast to restricted __le16
drivers/pci/proc.c:166:17: warning: cast to restricted __le16
drivers/pci/proc.c:166:17: warning: cast to restricted __le16

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 11c9886c3b70..5d4ec15584cf 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -112,7 +112,7 @@ do {								\
 		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
 		: "=&r" (__tmp)					\
 		: "m" (*(ptr)) : : label);			\
-	(x) = (__typeof__(x))(unsigned long)__tmp;		\
+	(x) = (__force __typeof__(x))(unsigned long)__tmp;	\
 } while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_asm(insn, x, ptr, label)			\
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
