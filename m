Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8A2CA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 06:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI0hUUesu5ZWY1gK/UQhRZskmIUOG7iCE6MhW6lmGkE=; b=j2WMDt0lDMm3Ae
	GiFXUHWZb8z0LmcAPD1r9RkCT6IACn8vqjFDPbsEw0DQsElWIPg8LBozzXvOz+MF0Nnve8iVApErH
	yap+d1SizQ4EECSJSYrRSwdUWUJC5H5KTB+8d4/B1UtVXgqrBcyxImIzttwyb2HiuvsjpsZmr4GZz
	f2wsmWWuSv1gbT8OSBEIKdPr9osxbh8mOzYf7gaiT+eUIZ7gW4kz2nftCTXxtkxEVFCMRbWFX6SHe
	tFuYqNl21rvFwS0UDqAZgq3Slg8kbwkflPzqYG9Z6l5Y5t9IK+eJjoLuLxvDo/U4DzCizeh8lEcft
	Zqoq9lbwfOcAlA0NygoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphvH-00000004Blu-36Rg;
	Sat, 23 Aug 2025 06:40:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0f-00000003CYo-3hHc
	for linux-riscv@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=RBjBiRgGCr3AUzfT5Pfj8TBJZtdD9IGtUwpXP88KXx4=; b=fQ6qXV4vI+mOM1qF/GdVA3fGCZ
	M2hebjJH/cFoSQIEi5BXXZEXw4xbdJuZq3fPxU5u1ZmmughfQtEjKMtt/UUXuWXGMR6ng/7Xo2RO9
	X+hGn2Ah0hfP9TLJcaz4fDzpU0KI9IZLDb44AbCrtA5Q1/aJX6pwnGBZ/uHvToL0y3Sm1jGc73b8d
	aEboP0N5QnC9LGq3sLV2Tgrcozl1O39KBUk/Woa528zjF4QrnfpLdDhv1gIRKZ0hWj2W2VygIs/oW
	vmYNgTUiKda026GT1gbDNDzoBXzGEnnMp4D5Ps1/uFfo/WMqsneUNPra0xLq6k6vE82zilnSRwqSo
	sglG0Png==;
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upV0c-000000011s2-3INW
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 16:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RBjBiRgGCr3AUzfT5Pfj8TBJZtdD9IGtUwpXP88KXx4=; b=o24YbKpR6I04DFO+6b+vKcCRlS
	4H9nJcn6CUixBPtxm0+9kMr97B+UomAx7vHg2QcY+LXNU8PudCk6iIB8lfLJVbbQ0G6UD4PmkuINw
	S+m6wLqXkvlwlVyAfcFjzEojAjsjF3dwxo4qSwqjdheGVxFGZIA3gKOgn775h7jvhAezxXjGIHkMq
	UoRQ0zCWil2tnsRiy4DMTN+ipnlFy6+/o2W/+OcwQFvudKtSplRZG/SeAcWg+XOygfiYIBGLzeShJ
	8nfcsasHkHE9GXvp80BIiRjevxwTNW2JP1fXow6uJr/DL14T+jJxXnIOaLv9NhawE7g4MVHIZFh8L
	skAS8F9A==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1upV0U-001NGr-C2; Fri, 22 Aug 2025 17:52:50 +0100
Received: from ben by rainbowdash with local (Exim 4.98.2)
	(envelope-from <ben@rainbowdash>)
	id 1upV0U-00000001DP8-25xK;
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
Subject: [PATCH 04/18] riscv: word-at-atime: move to generic if we're big endian
Date: Fri, 22 Aug 2025 17:52:34 +0100
Message-Id: <20250822165248.289802-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
In-Reply-To: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
References: <20250822165248.289802-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_175259_100276_756187DD 
X-CRM114-Status: UNSURE (   8.95  )
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

Use the generic word at a time code if we're running in big endian
for now otherwise this doesn't work. Add better support later.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 arch/riscv/include/asm/word-at-a-time.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 3802cda71ab7..78468f91ddcc 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -8,8 +8,13 @@
 #ifndef _ASM_RISCV_WORD_AT_A_TIME_H
 #define _ASM_RISCV_WORD_AT_A_TIME_H
 
-
 #include <asm/asm-extable.h>
+
+#if (defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)
+/* use the generic one for big-endian */
+#include <asm-generic/word-at-a-time.h>
+#else
+
 #include <linux/bitops.h>
 #include <linux/wordpart.h>
 
@@ -47,6 +52,10 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+#endif /* little endian case*/
+
+
+
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
 /*
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
