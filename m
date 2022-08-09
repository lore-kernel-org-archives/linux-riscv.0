Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566CBC25B07
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 14:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gF5pbY81TJsfPyeUDSs4VFu5dZHh1QLub7TR1F6INCg=; b=DFGbOnqupaFar+
	BDiMUYaPW/NE7RSsBO1tKPJA8SR78DJ5eo2Nn6rh6gT3L+d6Jt4Luwvebdltv1/tEO0MUFhOOIMUh
	lfzGhWm4yPf9Ejoj4DShzRp07HRP0MPTsqJxhHQVNHKfuTW1CRwW2IE0CYP0W7QLYPSQw/l9FjyKI
	zAqFsiOFoeOB6t/fWtJ90aW1ZF+uVLOumyquvJnWahRlOGEnZfMlc2B/IxvJ/FV/6PspFE4hu/z2w
	g/WAxmMJuqWny7ZG7lUJEob5qN9Anahfc3+SfspMIArX6wtW1vhBg02eMv/9oPTZdl+WL+dmrgRu7
	KD88d4ex3CwclnE3PGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQgl-004Vf0-F8; Tue, 09 Aug 2022 14:58:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLQgi-004Vd2-Dp
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 14:58:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA1F261210;
	Tue,  9 Aug 2022 14:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABCEC433D6;
	Tue,  9 Aug 2022 14:58:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PH7ldJjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1660057104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=px8/HdkMo6US5z7ja/JlaEW9vqFb9APKakGAgHhwdbw=;
	b=PH7ldJjCn4chsPHLlNVmr+SlX0RV6M0KhrmxnC8kSIJURTtlkfm0fGDW4iV/W0OeQr+74V
	RaRxAYCFIGexrrDzVKlSY5Tk3bD/2hspwFK+2Jt/HfHKkSwD9XVaO/zT2Xi7ny3iSiBVXV
	PXiLKcr9Zz0P5kEshKCZIRQzSxbee40=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e5796b6f (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 9 Aug 2022 14:58:24 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: palmer@rivosinc.com
Cc: linux-riscv@lists.infradead.org,
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH] wireguard: selftests: set CONFIG_NONPORTABLE on riscv32
Date: Tue,  9 Aug 2022 16:57:57 +0200
Message-Id: <20220809145757.83673-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_075832_755075_8A7BE883 
X-CRM114-Status: UNSURE (   9.75  )
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

When the CONFIG_PORTABLE/CONFIG_NONPORTABLE switches were added, various
configs were updated, but the wireguard config was forgotten about. This
leads to unbootable test kernels, causing CI fails. Add
CONFIG_NONPORTABLE=y to the wireguard test suite configuration for
riscv32.

Cc: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Atish Patra <atishp@rivosinc.com>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Guo Ren <guoren@kernel.org>
Fixes: 44c1e84a38a0 ("RISC-V: Add CONFIG_{NON,}PORTABLE")
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 tools/testing/selftests/wireguard/qemu/arch/riscv32.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
index 0bd0e72d95d4..2fc36efb166d 100644
--- a/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
+++ b/tools/testing/selftests/wireguard/qemu/arch/riscv32.config
@@ -1,3 +1,4 @@
+CONFIG_NONPORTABLE=y
 CONFIG_ARCH_RV32I=y
 CONFIG_MMU=y
 CONFIG_FPU=y
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
