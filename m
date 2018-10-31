Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187B2ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 00:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D92DD2081B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 00:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFu02sTc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="fk7GOstm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D92DD2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rOIrP8IOmPzRa6BDF8Eq6cHzEXOjXNDvUD7Bcmzlh6c=; b=hFu
	02sTcM5exqJpWTW7CA6eHzSg0XuuM7bFZ+Xge4I70vKdRCmf7n8Y9v0amjeTgt3FYNWTIEg46I7uT
	5L9bC5ggd3gTWAcz2yPVVYjZK1kI4Sf6phmCLmfGPdZwBxFr26JPjxPDPKiTwU5gI0BBq4QQYKDJX
	QQRkUfRu9ZGJGhfTAAK2En6P84/UXNfaAGpWHx3G8iuG2swUkv9l9USh9vkaMex4aOR1wLxWlPVKF
	v9+w9S+sQWXupxbWrvJfopdDP5IKS6cIy+EL4VYVyeqZT0qnE1FMuggQXHTu21hFZWvg8aAyumLRE
	sFrAZX2kulwooz2O4H80Avz0hn6aTPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHe04-0004HU-2C; Wed, 31 Oct 2018 00:04:44 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHdzy-0004H6-Pd
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 00:04:40 +0000
Received: by mail-pl1-x642.google.com with SMTP id t6-v6so6332954plo.9
 for <linux-riscv@lists.infradead.org>; Tue, 30 Oct 2018 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=FSOhZ3ryZkqtCoQg5utGGQFoOYf7wfsxoCZco3ZZqSw=;
 b=fk7GOstmST086IhkAIsRudbrBOE+2OSd9s5SZZs9D7MMmXwWaEHpzcIgZDYE76JPt5
 5Fo/RKUNGtU1YtpqO+yDzODGi5U/dN/lbHB68MI7Rf2tdmNZsh8xLp770BfgL9qj7T5v
 Uk7bKBuyVPd/HY80Kwm3IvBWOyhkk/PAthSLzVdtJE9Vq90wf1khjYGgUH9pIECHr5D0
 BV9sgEvRrAeG3eq7b76E7Fk5ryaV1m4bH+uo+yZZPv1hiAfKXQFg1TTdKqo+ooNJ/ByR
 dixyhPJLaWISj+gtwFQq+dtmpn7yrfLEPqSV7y/dVDvoofNbSYMEX7p9yThRwg8tXMo/
 lq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FSOhZ3ryZkqtCoQg5utGGQFoOYf7wfsxoCZco3ZZqSw=;
 b=VIckDOrCnQtk6so0vByjHPY41KZy7HvQFCWk+Z41d9fcJfT9N51WbfdJREpkvKAp8P
 M3cZ9woPuV83I2fAx8B2UcCDxi7jByn5CK8Zf9t3KWtN7POTZWiwm2Ndzkcfsv5NPpLy
 6TvS6DJOWhq0a8C2JExR3nKWdCzsUal3rzZ6K+bW4uQCNorp23qnqq41zBMDZUoDzvm2
 0XUouiZttEIiSga/7tbgFyAlGAdjlMf/66jZdhcoHee7Tygl2fTHK78+ej826DJYTedP
 e8n723aXSFj3pEcm9l1LCLepyxqyb50MZiG4Dotj87DbIZcnJUCf5ghLaaxe7VJKDqK5
 Qepw==
X-Gm-Message-State: AGRZ1gKE+CI9zCeTtrIMYycs/TearHYQyQlEAsYJLvrHmgngpT1K4+11
 ICkTW1DKTrsHnZr9UxHbwdl6OA==
X-Google-Smtp-Source: AJdET5d4C5aguF2pRpzDV6dMBqd4M1NPEmDfeN1SBzUz+TYB4B6fpZzsNUj5ZQavTp3mU3zPET3BAA==
X-Received: by 2002:a17:902:14e:: with SMTP id
 72-v6mr797127plb.299.1540944267051; 
 Tue, 30 Oct 2018 17:04:27 -0700 (PDT)
Received: from localhost.localdomain
 (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
 by smtp.gmail.com with ESMTPSA id o27-v6sm24638235pfk.85.2018.10.30.17.04.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Oct 2018 17:04:24 -0700 (PDT)
From: Olof Johansson <olof@lixom.net>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH] RISC-V: lib: Fix build error for 64-bit
Date: Tue, 30 Oct 2018 17:04:13 -0700
Message-Id: <20181031000413.30123-1-olof@lixom.net>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181030_170438_971481_2B298E4A 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zongbox@gmail.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031000413.eUCnkRW0UvArf7wtNH7IExHGp6xERNoQVhHseSwnkKk@z>

Fixes the following build error from tinyconfig:

riscv64-unknown-linux-gnu-ld: kernel/sched/fair.o: in function `.L8':
fair.c:(.text+0x70): undefined reference to `__lshrti3'
riscv64-unknown-linux-gnu-ld: kernel/time/clocksource.o: in function `.L0 ':
clocksource.c:(.text+0x334): undefined reference to `__lshrti3'

Fixes: 7f47c73b355f ("RISC-V: Build tishift only on 64-bit")
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 arch/riscv/lib/Makefile  |  2 +-
 arch/riscv/lib/tishift.S | 59 +++++++++++++++++++++++++-----------------------
 2 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 5739bd05d289e..4e2e600f7d538 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,6 +3,6 @@ lib-y	+= memcpy.o
 lib-y	+= memset.o
 lib-y	+= uaccess.o
 
-lib-(CONFIG_64BIT) += tishift.o
+lib-$(CONFIG_64BIT) += tishift.o
 
 lib-$(CONFIG_32BIT) += udivdi3.o
diff --git a/arch/riscv/lib/tishift.S b/arch/riscv/lib/tishift.S
index 69abb1277234b..237bc9fd07636 100644
--- a/arch/riscv/lib/tishift.S
+++ b/arch/riscv/lib/tishift.S
@@ -10,33 +10,36 @@
  *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  *   GNU General Public License for more details.
  */
-  .globl __lshrti3
-__lshrti3:
-  beqz  a2, .L1
-  li    a5,64
-  sub   a5,a5,a2
-  addi  sp,sp,-16
-  sext.w a4,a5
-  blez  a5, .L2
-  sext.w a2,a2
-  sll   a4,a1,a4
-  srl   a0,a0,a2
-  srl   a1,a1,a2
-  or    a0,a0,a4
-  sd    a1,8(sp)
-  sd    a0,0(sp)
-  ld    a0,0(sp)
-  ld    a1,8(sp)
-  addi  sp,sp,16
-  ret
+
+#include <linux/linkage.h>
+
+ENTRY(__lshrti3)
+	beqz	a2, .L1
+	li	a5,64
+	sub	a5,a5,a2
+	addi	sp,sp,-16
+	sext.w	a4,a5
+	blez	a5, .L2
+	sext.w	a2,a2
+	sll	a4,a1,a4
+	srl	a0,a0,a2
+	srl	a1,a1,a2
+	or	a0,a0,a4
+	sd	a1,8(sp)
+	sd	a0,0(sp)
+	ld	a0,0(sp)
+	ld	a1,8(sp)
+	addi	sp,sp,16
+	ret
 .L1:
-  ret
+	ret
 .L2:
-  negw  a4,a4
-  srl   a1,a1,a4
-  sd    a1,0(sp)
-  sd    zero,8(sp)
-  ld    a0,0(sp)
-  ld    a1,8(sp)
-  addi  sp,sp,16
-  ret
+	negw	a4,a4
+	srl	a1,a1,a4
+	sd	a1,0(sp)
+	sd	zero,8(sp)
+	ld	a0,0(sp)
+	ld	a1,8(sp)
+	addi	sp,sp,16
+	ret
+ENDPROC(__lshrti3)
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
