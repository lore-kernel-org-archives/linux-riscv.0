Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8184C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 20:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=71/NE7Qv1iWwGW6NvPvmaqrpyLLyhCi07UfnC/DAYLM=; b=mMPsZLoANzi3Pj
	6IWCiTWtiX5hJo8Utv8UX4Va4e0aLuzKp8o7pQNrpjz8J/R9aESvcsiDA4oZtvmbu3V2fuMLxV3Eq
	6htX6Evk8KPnM5ogxS2NmNJWox17/mP7uux9utjksTL8/JIoKsz0ByQxphVsgAWJeoaR17CJ/h/ZL
	U1gpHklJnhZAp52KOFfJUhBP8L9w8iLMoZpVVjKtR09yAz5F7d3tBu8Xmp4VgXctpR8rTDI5lErKx
	GK1F0+zivb0QzcUtC9FZ8tA24+18nbzmYaFF3vO4P0dJp1OeSNEPoCRUVt493108/4uYr7N3iJsGa
	fq1ZpTXmbPkpdRaB3qxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxPk-00Bo6o-1l;
	Fri, 21 Apr 2023 20:31:28 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppxPf-00Bo5s-36
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 20:31:26 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:ed8d:a29e:2b31:5e96])
	by albert.telenet-ops.be with bizsmtp
	id nYXB2900E3ESaBb06YXB6H; Fri, 21 Apr 2023 22:31:17 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1ppxPT-000CKc-HJ;
	Fri, 21 Apr 2023 22:31:11 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pps9Z-000FzO-6K;
	Fri, 21 Apr 2023 16:54:25 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] libgcc: Add forward declarations for generic library routines
Date: Fri, 21 Apr 2023 16:54:24 +0200
Message-Id: <5cdbe08296693dd53849f199c3933e16e97b33c1.1682088593.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_133124_156935_750E254D 
X-CRM114-Status: UNSURE (   7.62  )
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

With W=1 on platforms that use the generic gcc library routines
(csky/loongarch/mips/riscv/sh/xtensa):

    lib/ashldi3.c:9:19: warning: no previous prototype for '__ashldi3' [-Wmissing-prototypes]
	9 | long long notrace __ashldi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/ashrdi3.o
    lib/ashrdi3.c:9:19: warning: no previous prototype for '__ashrdi3' [-Wmissing-prototypes]
	9 | long long notrace __ashrdi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/cmpdi2.o
    lib/cmpdi2.c:9:19: warning: no previous prototype for '__cmpdi2' [-Wmissing-prototypes]
	9 | word_type notrace __cmpdi2(long long a, long long b)
	  |                   ^~~~~~~~
      CC      lib/lshrdi3.o
    lib/lshrdi3.c:9:19: warning: no previous prototype for '__lshrdi3' [-Wmissing-prototypes]
	9 | long long notrace __lshrdi3(long long u, word_type b)
	  |                   ^~~~~~~~~
      CC      lib/muldi3.o
    lib/muldi3.c:49:19: warning: no previous prototype for '__muldi3' [-Wmissing-prototypes]
       49 | long long notrace __muldi3(long long u, long long v)
	  |                   ^~~~~~~~
      CC      lib/ucmpdi2.o
    lib/ucmpdi2.c:8:19: warning: no previous prototype for '__ucmpdi2' [-Wmissing-prototypes]
	8 | word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b)
	  |                   ^~~~~~~~~

Fix this by adding forward declarations to the common libgcc header
file.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303272214.RxzpA6bP-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/libgcc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/libgcc.h b/include/linux/libgcc.h
index b8dc75f0c8308bd4..fc388da6a027faaf 100644
--- a/include/linux/libgcc.h
+++ b/include/linux/libgcc.h
@@ -27,4 +27,11 @@ typedef union {
 	long long ll;
 } DWunion;
 
+long long notrace __ashldi3(long long u, word_type b);
+long long notrace __ashrdi3(long long u, word_type b);
+word_type notrace __cmpdi2(long long a, long long b);
+long long notrace __lshrdi3(long long u, word_type b);
+long long notrace __muldi3(long long u, long long v);
+word_type notrace __ucmpdi2(unsigned long long a, unsigned long long b);
+
 #endif /* __ASM_LIBGCC_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
