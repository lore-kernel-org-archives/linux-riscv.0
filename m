Return-Path: <SRS0=ik8O=2Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF29C32767
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 03:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C68217F4
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 03:36:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MxWb4phu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vhFWat4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66C68217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNQrHpvy8QJNwnEPY/zLQoLiTDO6B8R5doeMm0gXcaw=; b=MxWb4phugXdMVi
	ZuEEwmnQqQWqI1Ue+wNk4l0OSl2GBB6ECJKxNFL6cGtoY2pt5LvHlPsPi8N9EYkuFZQfGOgpAJw37
	PRSvnZzqfYWRV1N6J1QrJENuDbw+LH7iNwhX130/VVQmzz8ZT9SZ1D8MOL7F3oBoukQHHwIgyQx/T
	V6NjwhSsmnMKNbH39PL3HKVAbuxKYRpyo5Yxmw7JoPVuX2YBwzrbIZHyXjBeN/9MfLlXnp1rCPHec
	f19NPIkjmVi9ILR0QNobCLeN1zFbffMTC5zPmRbvrBDcV+f3EhQm0zvGvhDyTXbyc1F+XKRV8HP42
	xzJ1i8jZbTvIUC0e+omA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inaEv-0004bN-LI; Sat, 04 Jan 2020 03:36:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inaEs-0004ai-Nj
 for linux-riscv@lists.infradead.org; Sat, 04 Jan 2020 03:36:36 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01DAC24653;
 Sat,  4 Jan 2020 03:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578108993;
 bh=IBG7E2GJGbsNjViu333rtmT2J38bDQmsbxsfWNMJyGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vhFWat4ziehRmr8odw2hF0ahqRy8BfBYig6Au7c3abyAUq+737zA558P9uhdRNE2i
 JUtGL5jzJ5Kc/pZyn3PbZxOO2Et2Pc2dPvIwtNJgumJNQtFbGd8/SMNfJnqw3/Q0HN
 eT4viA6OdLVvTCCzIUC9UEtQuznicH48qCWYCtvw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/10] riscv: export flush_icache_all to modules
Date: Fri,  3 Jan 2020 22:36:19 -0500
Message-Id: <20200104033620.10977-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200104033620.10977-1-sashal@kernel.org>
References: <20200104033620.10977-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_193634_793816_36823AAC 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Olof Johansson <olof@lixom.net>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Olof Johansson <olof@lixom.net>

[ Upstream commit 1833e327a5ea1d1f356fbf6ded0760c9ff4b0594 ]

This is needed by LKDTM (crash dump test module), it calls
flush_icache_range(), which on RISC-V turns into flush_icache_all(). On
other architectures, the actual implementation is exported, so follow
that precedence and export it here too.

Fixes build of CONFIG_LKDTM that fails with:
ERROR: "flush_icache_all" [drivers/misc/lkdtm/lkdtm.ko] undefined!

Signed-off-by: Olof Johansson <olof@lixom.net>
Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/mm/cacheflush.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3f15938dec89..c54bd3c79955 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -14,6 +14,7 @@ void flush_icache_all(void)
 {
 	sbi_remote_fence_i(NULL);
 }
+EXPORT_SYMBOL(flush_icache_all);
 
 /*
  * Performs an icache flush for the given MM context.  RISC-V has no direct
-- 
2.20.1


