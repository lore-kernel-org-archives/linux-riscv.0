Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DB0C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Apr 2024 16:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QrV5kih887aZ2zEL7u5DowZb+Bg0PNEEersCmjHG/Qg=; b=MCy70NIZAViAtZ
	GOLqGd2Hp7KvgmA63D/kH60iHkPKlrCOCXjrj5fcrbbpeEgfbIjIqDMFlYVg12uR+lVDP7Bit+Fut
	Kj5FbBBktFH4xDQ7mQLchqKJyHvV1dV4aT6YU2ntabQ0IKC7vG8F4TMmzzHiJFa7chsbqYbJlVPk1
	aS18rSjC2Utr0Wu10rW73gLHWZu28DCrXZTjvK6B3bMnF40Oe4gNo9Bjnrg7UkNJyIvyuhypF120y
	QB0ua+rPFCARynvdhbL1CiY/pPzkqgKhRgNmU8T1mrRqKEQcr6Eq2IJVTnwTjwBpmV307fpTMExVY
	66fnXYGxKR3qQSUGOg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw32w-00000005vZB-3LNi;
	Sun, 14 Apr 2024 16:49:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw32t-00000005vYn-1b0y
	for linux-riscv@lists.infradead.org;
	Sun, 14 Apr 2024 16:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4E39CE095C;
	Sun, 14 Apr 2024 16:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04281C072AA;
	Sun, 14 Apr 2024 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713113372;
	bh=Wss0WbtUOhjUWhYJ8vc04bb0suWYo6mOU9+OkAYhBcw=;
	h=From:To:Cc:Subject:Date:From;
	b=d6Cwpm+fEoTII9Fi29J6au/DDKa2VJhKm96C02wk9z6fFDLf9pa+7rx//sI7lS9um
	 z32FGHATSjYDmQ4lLT6b31eXyCMnsz2Bc2eVA1JHTHQg8Ao/QcKdMVWhZ81WKv9+j9
	 uoVGS3cQcBXQqUwjz69L2KyX5egnTuyVUUJ4RZtejdeNxGbhtbF/m1c7A+80Q7xqBn
	 wgljKMzVv5HOZ2qkKFd5ZJQmZzze8yxY+HVtdQALEzbDfiWy9URP6557EMHYMkPz/j
	 gBSgfv8MuAa29XloP5ow/uBmZTemnlLEFyGRlHJJeLGpaOP63ATMfPv4Qqcz5JXohA
	 50VXUb/IvUmwQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: boot: remove duplicated targets line
Date: Mon, 15 Apr 2024 00:36:06 +0800
Message-ID: <20240414163606.2598-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_094935_625642_3F3F254E 
X-CRM114-Status: UNSURE (   6.20  )
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

The "targets:" is duplicated in another line, remove the one with less
targets.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 8e7fc0edf21d..e051c677f6c4 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -20,7 +20,6 @@ OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 OBJCOPYFLAGS_loader.bin :=-O binary
 OBJCOPYFLAGS_xipImage :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image Image.* loader loader.o loader.lds loader.bin
 targets := Image Image.* loader loader.o loader.lds loader.bin xipImage
 
 ifeq ($(CONFIG_XIP_KERNEL),y)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
