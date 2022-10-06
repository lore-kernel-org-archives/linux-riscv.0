Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA704C43219
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 07:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jCufELFX8/qzPDQkb/rLuxQaQfXDGXcY0MuPcrEPQt0=; b=VPWf/MoWajPLFa
	6Y4OIo41VqNDj3z7zQpnzgNXRM9GDUjIUdNq6MAFkq3jcvsHBkRjNCCmI45p37JpyohRpRsNTY5au
	iwJ0uRZs+JJbZ+LjmxtwDEOcCobDkfYjNj6AsTQkBcVUoIGRkDOVawloBt0b3vB49oW968SkXu+BI
	tSV+cc+NJ9id83RZ9Fj3Uc3qPBG8Fkx7rEdiOq1egvEni7Tm2qaAix7jqjBH+EbdBeCJiFSqhhvbO
	PqfcF3boqB/VECpqbMSU+yD0oOxJOfrt65FntS05gQ1Z5owwyrBI3t7hXheFPSQUvHv4tatp0YyfN
	eiP2SzSbIMEPweSYbvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8r-000MXe-WC; Thu, 06 Oct 2022 07:18:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogL8n-000MTo-NF
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 07:17:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26F0F6182A;
	Thu,  6 Oct 2022 07:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7645EC433D6;
	Thu,  6 Oct 2022 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665040673;
	bh=9fBsPwhvJZRdf+CU1/201DO08wpjks0kDIv6Vzm4XOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGhOU5BPOIuEr1AMhM3o0TySAQYnb7GXc/yNE8oGUnCzKZosX2CbfRpmOPVzPYaG8
	 xg7ukolKlHrHpfr5BY8AIY8hyQRRKlWxPDyipTKxyxW4937An4t67v3yDNJzGaXBEF
	 dqIj3O30QH4l+RH0XZJodmkxqZXW8m3ANj34sfkrH4qDEz0whtO5iCzHnUCJon9a3R
	 QrNpZJRbTKTa8ItDbbyG+3Z+5NJYd7uwIxn4007RdIUDkMcn1qDAZqXsl89Jh7iyIQ
	 iYeDoURySIx+mbLiveX1VEaJI1sIyrUUkwTNSMN6/ryEIs7WjbKX8qJ+r1TMwLHkvK
	 0AOYxi88PT0qg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
Date: Thu,  6 Oct 2022 15:08:12 +0800
Message-Id: <20221006070818.3616-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006070818.3616-1-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_001757_816566_C2E11681 
X-CRM114-Status: UNSURE (   9.51  )
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

Now, the riscv_cpufeature_patch_func() do nothing in the stage of
RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
boot" stage earlier.

In following patch, we will make riscv_cpufeature_patch_func() scans
all ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 03611b3ef45e..afa54635c180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -307,6 +307,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	struct alt_entry *alt;
 	u32 tmp;
 
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
