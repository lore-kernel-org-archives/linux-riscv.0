Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B55BEDE99E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNE+XZLvyFTVwtv6D9wZ8Y8oHXC+YPSK76klZiDiR1g=; b=ZtOrImivo+YwRw
	XlizACZcvZ/fwp+YbJx28pHffPguRdtRy3SWe3GugmucHf8e4hPPhMBPlqraHkntq8sdWWDEgzL6+
	qShlPfKZxpSJNhONjnFtAh+03Ypi1jQ+RR8eHwOIEu570+b0c1tNi2cl3WkUMQZWOl3SRJMrGGNEh
	tUyEXUxMcW+wXxuW0l2d6IyH1RR23Dv3Zbw3gGU9xN3AhXoDwiYrKXl69l8ufv5JfszOsy5Z35yhP
	/U6cnSYfPK7vlctTOI+rY1NtupKSVaDv3X365nsWsZNxiNNpRyHcPPOgkAhQFRbjrXDQ5HTC94C5F
	9XbVlLGawVj4Hwh3aJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiQV-007oh0-39;
	Thu, 14 Sep 2023 09:14:19 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgiQT-007ofy-03
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 09:14:19 +0000
X-QQ-mid: bizesmtp73t1694682827tlz1i6o5
Received: from localhost.localdomain ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 14 Sep 2023 17:13:45 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: CR3LFp2JE4nYED5orq4xNbGCHZt0equu6uLslwzQkn9bzwZLLtMcHQM+UJQS6
	q8a4vVZNtlwe5E0SDTAN63nnOD5D9BnkKmoZ8jpiOl3Whuq2rjGJKTbLEMy1xGw8rr/PY5I
	wDzvFupyyeOXxuNVm28pTmnWbMw9I8alXmA6NVjbTGfJ6+Nzsyw9BwA3PTWeDL9/SYQfpaj
	0x019CPO5/oJxYCG0axv0PAuz8L35JavaxK+QiOq1BjIhlHc3SgAnbPAbjZkhBRQ5V+o6sa
	6nhsKHFu6PjdB7C5beR3tG3EtrwHfmJBgu0MBtb+yK5B5opyDqVZuQXbhBuTpiE61Pcfls5
	nJ8y3X+G+TRbZIZamtU8keRUAHqsQeWfBr1q5a31krVw4H3+2E=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10526122010686381623
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH -fixes] riscv: Remove duplicate objcopy flag
Date: Thu, 14 Sep 2023 17:13:34 +0800
Message-Id: <20230914091334.1458542-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_021417_380585_131C98E5 
X-CRM114-Status: UNSURE (   6.51  )
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

There are two duplicate `-O binary` flags when objcopying from vmlinux
to Image/xipImage.

RISC-V set `-O binary` flag in both OBJCOPYFLAGS in the top-level riscv
Makefile and OBJCOPYFLAGS_* in the boot/Makefile, and the objcopy cmd
in Kbuild would join them together.

The `-O binary` flag is only needed for objcopying Image, so remove the
OBJCOPYFLAGS in the top-level riscv Makefile.

Fixes: c0fbcd991860 ("RISC-V: Build flat and compressed kernel images")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1329e060c548..b43a6bb7e4dc 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -6,7 +6,6 @@
 # for more details.
 #
 
-OBJCOPYFLAGS    := -O binary
 LDFLAGS_vmlinux := -z norelro
 ifeq ($(CONFIG_RELOCATABLE),y)
 	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext --emit-relocs
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
