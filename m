Return-Path: <SRS0=5Ln/=PP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D79C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 840192087F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  7 Jan 2019 16:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q8Ygp6cX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Zgngd4Gp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 840192087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Z5J6yWGQnZPdIy0XF+nxopA92zaV1oFkHPs/J8OOiXs=; b=q8Ygp6cXvUjAYvhiKP9x4p0xpr
	dDPIFmhudDeVpD/M1OxJO1YYBshOi2YuXzD1Vgoi/hizbjHHVGdSLNYdnmKZNVEHwin2R2UdAEKAq
	Hr5poaKFpwr3VhweeWh4Q6JyT6/pFSHDlkCOGagoBY/OVivNhNmCkY5wV4VRXf2LcO8fLNez9ULNy
	HLrga4mTjx7wp0cxt+V0JhJOP77ShmLh7kHhl5KzWqWeUrcxEzGIJjd6TVEd+ycs1XE7EURKKwMrk
	fruhydLht57sGFway0gTqHC+PRC8X0kYMVHaV9f35Sybj6vO35gKpVtNGgbJtNmkbUvI1BYAdvVIV
	Ip0yjEjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggXUj-00056Q-Im; Mon, 07 Jan 2019 16:11:17 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggXUg-00054P-I1
 for linux-riscv@lists.infradead.org; Mon, 07 Jan 2019 16:11:16 +0000
Received: by mail-pl1-x641.google.com with SMTP id b5so360879plr.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jan 2019 08:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZaKrDnHRaJTR4IomjvSGKZD1Tygses0EL569fMSHM94=;
 b=Zgngd4Gp1H53m2Qe2zWQk2wO398PgVsT+ZHTKDh2XRITX1i06Er7yGFYAiP+zpw5FU
 Q/Kh0e6hxjZoyhW2SaLvccSWEkEcqSvbtNgL5kAOkOLiDZJJzqjrCoMwisjTvCo/SEkg
 FdXFLX0HKo2GPFosJVUGacQgbw1M77h9a5nj8L7OJlt0g7+oz++zZM8Z8XU4EIOx4jVB
 dP6sCPCe2aaGQOw8o2TeT4ckoUeG4rRDT/hHO4vfyfLW7VbtpxhIYm3tN6bHymNdufd7
 XIxAUFy3gI9QLnGPsHGmZAcp0qtdGaayFfgv9f66X1htuvACphEbwLW89litgLS9Rzuy
 /kWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZaKrDnHRaJTR4IomjvSGKZD1Tygses0EL569fMSHM94=;
 b=Y9s1N08Eb9Hpsql7e1zcfjdOli7zpGcQBTs8AiLSW6BhRXhj4nCVhWVawmh6vWeU6p
 Y4nDtWU6KkFh+5lz84rBlSBSQ2WPikQqNoAOFNBZ4jKLVzXaB85uY6itQZ7MnwyMxSS9
 zgfbCN/ekompsXCTKlLI6LpRJ/nyr0QyVdlkHq4uMkhoStSw36tDnRqLz2Cf1cxFjZMQ
 8F4azQ8Z0HcJGvBDVg6E+kvXwb8nHFNK7iVyqIko9BXkphM9yM1MPiQPUFUC60E7wxWt
 0tg3+Z0t3Yr2Gz4tbiNvgV5uNVZkziQGGKKrUB/U+QhxQj5jgHQEQ3rAqHZblliVT5Bm
 tlaA==
X-Gm-Message-State: AJcUukeVI22rPoGDGf++FHhklTSkdDrMZClBu7IhB1/Vr2CWoTf/34Y8
 h/EDQ6BgKHpKOaVYjfVS5PgIOw==
X-Google-Smtp-Source: ALg8bN6j4G8Z+93Wuqw2y7pZioxENiinBLcR0tTRLcPEkAa/SDw2F7eM50llrZ7maSEFpoYcWvt3ZQ==
X-Received: by 2002:a17:902:6bc7:: with SMTP id
 m7mr62838655plt.106.1546877473820; 
 Mon, 07 Jan 2019 08:11:13 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.214])
 by smtp.gmail.com with ESMTPSA id a10sm93243512pfi.138.2019.01.07.08.11.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Jan 2019 08:11:13 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 1/5] RISC-V: Move free_initrd_mem() to kernel/setup.c
Date: Mon,  7 Jan 2019 21:40:43 +0530
Message-Id: <20190107161047.10516-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190107161047.10516-1-anup@brainfault.org>
References: <20190107161047.10516-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_081114_767527_4FA3C397 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Anup Patel <anup.patel@wdc.com>

We move free_initrd_mem() to kernel/setup.c so that all initrd
related functions are in one place.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kernel/setup.c | 4 ++++
 arch/riscv/mm/init.c      | 7 -------
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index fc8006a042eb..64646d0b4d53 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -96,6 +96,10 @@ static void __init setup_initrd(void)
 	initrd_start = 0;
 	initrd_end = 0;
 }
+
+void free_initrd_mem(unsigned long start, unsigned long end)
+{
+}
 #endif /* CONFIG_BLK_DEV_INITRD */
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1d9bfaff60bc..f354486f9b78 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
-#include <linux/initrd.h>
 #include <linux/swap.h>
 #include <linux/sizes.h>
 
@@ -63,9 +62,3 @@ void free_initmem(void)
 {
 	free_initmem_default(0);
 }
-
-#ifdef CONFIG_BLK_DEV_INITRD
-void free_initrd_mem(unsigned long start, unsigned long end)
-{
-}
-#endif /* CONFIG_BLK_DEV_INITRD */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
