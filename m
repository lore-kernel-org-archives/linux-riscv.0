Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03667C38150
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9VtiilcVSEhS1Xn/YniX6UotO7rm1mPX8EM+yaPT7gs=; b=AbZNJLr78nRo6O
	N5ykeZQUVrnzTtWEXWqGz0g7o1N8+4YuRSeEwaBqItiFMk1XneL5Ch63H7cvbi8O95iZ8zmLFuoFf
	z4mgGn5R8oMUbqypZxxGeRTH77FUqyXSxXEp2z9pXnaPIRwmfPnwNkvr/Ls3i4peeFo+Z8ufhVE4j
	uPGxP1g9ZiYO5pT8zpB1jPhBxHInY4IXyzu8zUwZhlnmC44FUsCETJuNGzIcY2BmQKrc7cmsHnGsJ
	BdjwE2677f53eqThwgFsHcUuZEWkqKiiJQbSSz9o+03d+JUH89Kp9zPEyxgku80NiTTf13fx6iF5i
	DIMyKkAEv1Dv44RI08Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmY1-0000000GWcz-3daK;
	Fri, 05 Jul 2024 17:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmY0-0000000GWco-2ywT
	for linux-riscv@bombadil.infradead.org;
	Fri, 05 Jul 2024 17:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lBKaHwbO6ljlejCxub1t+ztIWm5xLO2FtVBYzphggu8=; b=k+TgILbCzU55WtHpLmxR8F7kr2
	RX0Kq/3o4ER6pBmZP1GhLS995qGDvfRjdVg7UFrSsuH7Z+cF2+mAQKOp9qIFNzVGe4XNoXQh8dQNx
	iPgU1Lb4AlQlyvD7uC6ziMhGddzuvNnib4w+oQxbcR69GF/BXfQrh1ztA9b088AiZp4Wuy1t3eETh
	A/CyILZ0R32/3Z9p+Qim66baCc3UQWIWGBAZLC0av/nL817nsh1L7uByymimzxizDwvCvrUa+Uuye
	bA8zeP12UILKtILL81MWztLOdhftpGCSEmkOFrhFySQkGU4uCOSFcaTuGh+sNZ+7eG8fx8q7ulA3z
	U06QKg1A==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmXx-0000000ALaP-1Lra
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 17:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B592CE3E48;
	Fri,  5 Jul 2024 17:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 531C1C116B1;
	Fri,  5 Jul 2024 17:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720199785;
	bh=dZatnfiMmvVyQvxnLAthSs7cidZ3zTY2scBacLP4/ts=;
	h=From:To:Cc:Subject:Date:From;
	b=XBxQ5vZk06C/im5YRl0yWGYNvv0atoeptxbTu4NwBVIwU81cBtCssfbSFKOsbT/HP
	 taUOUud4Ve618OwKydjUqDeX+kIT32CJypeqGHztysz83f2CfKJCtkfMoAfV5ybCai
	 9/ujs7olM0wjJBwpzwNF7JOoAAx1EI0angj7BUpMnSdwEMOec3sqRtYbxp2dRkRIV9
	 KbBaPCG/zhTYV2kGRm/ORhONd2oFmbry5LWeJ6jWaMU2XTwto8qQyXrkwMW+QGZ7v4
	 gEzSTwooOConLeYdZruaNy6hKNYXyALJ2JQVQ1xb1Xc0TopnEUAIrNVMFee+I+7QLN
	 YobCcQYBsGdGA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: define ILLEGAL_POINTER_VALUE for 64bit
Date: Sat,  6 Jul 2024 01:02:10 +0800
Message-ID: <20240705170210.3236-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_181633_789373_C398142A 
X-CRM114-Status: UNSURE (   6.84  )
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

This is used in poison.h for poison pointer offset. Based on current
SV39, SV48 and SV57 vm layout, 0xdead000000000000 is a proper value
that is not mappable, this can avoid potentially turning an oops to
an expolit.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

Since v1:
 - fix typo:s/SV59/SV57

 arch/riscv/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c51b32a8ddff..c992eabbd002 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -313,6 +313,11 @@ config GENERIC_HWEIGHT
 config FIX_EARLYCON_MEM
 	def_bool MMU
 
+config ILLEGAL_POINTER_VALUE
+	hex
+	default 0 if 32BIT
+	default 0xdead000000000000 if 64BIT
+
 config PGTABLE_LEVELS
 	int
 	default 5 if 64BIT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
