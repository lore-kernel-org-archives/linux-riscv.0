Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287C0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jan 2022 16:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ziOorfVT0oU5qPZzqZ2cI+f2Wwgc45NmpPaoGlxFA0=; b=em3wl12kzMCNI4
	lIlKrbWxcAeQimQjJ7FoCsXzKIX88OvRThVYpPu6zaXkjRWvUR9aXeA/hZXE9ZHk6ae69IAktB2Zr
	akFgZpIBIfd9FFXjJmpGazHf9vhuQGb9MLt7ClUnSln3d4q/pymIOgZV76RVRpnLo4D5ml6NP1IsC
	Gdbcl0wvir++JWIqbhnvk/MXKCCmhL2W+wq8XBBdBQoChcjRyhfId+SJNHcXgywJgjkYpa5i28TOG
	+4EhRLmJ+s/wtyyjRPeACkA643GQeeXTytM5umbZCi8YpSbNFGGVl6ZMcetIlfyYHNWh4mOhSYe32
	zk6f3fybBa8QIatI05YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOSr-008bjn-9n; Tue, 25 Jan 2022 16:14:37 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOML-008ZII-6w
 for linux-riscv@lists.infradead.org; Tue, 25 Jan 2022 16:07:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C641FB81737;
 Tue, 25 Jan 2022 16:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923C9C340F3;
 Tue, 25 Jan 2022 16:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643126870;
 bh=IdjPE/FcDNJAM0qD96J2RdCr8IUfsVB52t3qpnigWlc=;
 h=From:To:Cc:Subject:Date:From;
 b=Y+MbnJETvxadz2gQQIEjRRgYBsqwnTlXFwfLpi0QqZol2TQxy+NOB7fgalVp+EORF
 3lLyCk25bKOj4NUnKjR8YVfGR/K4yUY1965Ztl0zulgudJqI7kls+pxeFM9W401L1W
 GSDDNyt3NV5PTzDpyuh82wPDOW1qHUv3FbtsKgv0j+z9xtjxyvsyA/Byz5F1IheZRK
 Y6mNSY7V9VE4/rH/l2cJpiQb7ibyPsH14bO+WoGs33BJKKTofRg6pTYLVo/M3WCErw
 qHBfyrJQoMiS0suvJv7F+dT/E8D3esrMBm400snFevzT3ZLNPNXH7u132eO0Nxvaz6
 Zw+y8GdihuBlg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: init: mark satp_mode __ro_after_init
Date: Wed, 26 Jan 2022 00:00:12 +0800
Message-Id: <20220125160012.3884-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_080753_430637_7F81D339 
X-CRM114-Status: UNSURE (   9.97  )
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

satp_mode is never modified after init, so it can be marked as
__ro_after_init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8347d0fda8cd..35586688a1b6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -38,9 +38,9 @@ EXPORT_SYMBOL(kernel_map);
 #endif
 
 #ifdef CONFIG_64BIT
-u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
+u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
 #else
-u64 satp_mode = SATP_MODE_32;
+u64 satp_mode __ro_after_init = SATP_MODE_32;
 #endif
 EXPORT_SYMBOL(satp_mode);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
