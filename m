Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA24C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nKK8E1/uCqD0n8qccV0zLKZqA7ecs7TUOm23HDpiSn8=; b=PrPF8Z+z1IYUbE
	Dny+4U3z1PHYnzf0gQGjGkbs0iw4J8qlUjf/2amCZOWRS3Ro/kR2Aqrth5tG++fKG0bZP89TobpWM
	fK8KM2f/l86HJi8TTb6347BVC/DUHAJmfwLeNcVLhyt819TgmW7wpIj5DmLSwJcvKAiCucUAIZe3L
	Hqo9IHx2LD4eiQloaqDjeFDKo2Bsob7TdvphJb7pNklEW3wZNntVIOu1vvY4xmQeH6f8I8dgr7MGC
	gBBiXoHfhKO8UQLiXokFs/RteDrxEWNnNjts+D6M2ot7D7C4hjMM6uztFg+HjGhGC0dC0VsV0fteX
	fL8Iqxop/xqKdCmtLb4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrQf-000KSY-V4; Wed, 23 Nov 2022 15:12:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxrQd-000KQl-9x
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 15:12:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D6DF261D4C;
	Wed, 23 Nov 2022 15:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245BEC433C1;
	Wed, 23 Nov 2022 15:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669216366;
	bh=sRAK5WjulD/KwNHjgNz+jEe815cMtfQqjqgbH8VwekA=;
	h=From:To:Cc:Subject:Date:From;
	b=g3SwGTECFbfI6ncYLTEOmMkGc2weuIVarAuI2Ucxn3U1LYGuel8V3OAo25/l919yr
	 gG0uuE0HN+5brTS7sbYH5+stqVNXmpZethvigWJvn7nDnCXf0JGur4XvBBEXDpbNZg
	 LjSPEAmd7eXfRAeLWjPD5Jk5YTRtTRrxoCswo/MUnLsZZpFo77617w3DDbI1k+a8lo
	 gSMyhrDlvHbEFlOUxKhOH2fauESUm5zvCQiRYsT7kV1UOnY3yTRH3wP7rIVm60Xsh5
	 eMfimX5R2EFGj1c+ikMb/s5GIfzAX1uh5kpE7cE8/HwJGtDLnDBvGhwV3CQCstpxLS
	 FcwQjcXCqj4Ag==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Terrell <terrelln@fb.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: boot: add zstd support
Date: Wed, 23 Nov 2022 23:02:57 +0800
Message-Id: <20221123150257.3108-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_071247_400922_7DD709CD 
X-CRM114-Status: UNSURE (   8.81  )
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

Support build the zstd compressed Image.zst. Similar as other
compressed formats, the Image.zst is not self-decompressing and
the bootloader still needs to handle decompression before
launching the kernel image.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index d1a49adcb1d7..c72de7232abb 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -56,6 +56,9 @@ $(obj)/Image.lzma: $(obj)/Image FORCE
 $(obj)/Image.lzo: $(obj)/Image FORCE
 	$(call if_changed,lzo)
 
+$(obj)/Image.zst: $(obj)/Image FORCE
+	$(call if_changed,zstd)
+
 $(obj)/loader.bin: $(obj)/loader FORCE
 	$(call if_changed,objcopy)
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
