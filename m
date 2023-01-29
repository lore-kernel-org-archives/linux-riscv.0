Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2708C05027
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Jan 2023 21:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eMeVF1SZqazpYRm9SfpYyUfVHW7vbeBJZKROexbLY64=; b=PsbwsZw4sbooD8
	E9zMSx8/bU0ClveylybpMZUfiErph7qcHYZ6YX8l1eaQJNTMCF+xVlisuawoJVcbYTD0RFwhcj5ZD
	odpj3Vsyx8+7YYLsHLGHn1HuL5WyvZbF/jOaTNk+9LCR/jyooN2KMDugDhtCFAaRUeGupo2fGdErB
	nbKcngXH3W4SNoqj+vwNgDDh0xTTc4eqoW2WF3COJ9BCPtCozzj4ZHDYpCqePGA5Iis5V92ndgelQ
	WIlfDf6RYPG0YBch3lzUZgRPkPoK3MlFcvDDHy63aSlGlboh8AHeZo2MTYTdGClcb3Md12TNWei1e
	4LvAS3lXUFD5XMiZMyrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMF4M-001uEb-1c; Sun, 29 Jan 2023 21:18:34 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMF4I-001uEB-Hp
	for linux-riscv@lists.infradead.org; Sun, 29 Jan 2023 21:18:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id m8so19518edd.10
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 13:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+h+DwgC8kZ0XHiwjlH5j80VONawqLGbgf1k0XhI3HtA=;
        b=d2zBLtX4Ok999XFthxBlaBoWXcErjB9PFTYs/5wEai3i5t/qDPilG6Ump2Du/KJQcr
         kKmzsz8JnCNNIw8cqAOXaeFIpbPQRZ6E4hWW/PyvuVsPgDY+OWiyZcnT+Eb9DOtSrzTf
         2f9IoYnmGEHI9N3bqYGa226swI/EeoaZ/BQHblLSGcVtVTfj2sfj4jNdUMN+8C1ofHHe
         jtQ6tKS4/adIGV7VFCyq/0HN6cWpL4D5gDL9Lhhs2KOF023MEkGNNGyo7xawD+SPo5IF
         +AHbPIFSnI3PvvoY8YOsCZkzR9Sso4Hc/Til/qwDqa/TzKb084c+nG35SuLxE6xwP1C7
         AHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+h+DwgC8kZ0XHiwjlH5j80VONawqLGbgf1k0XhI3HtA=;
        b=Aci59e9NH3vLQuhkWUP7mdxOV7WPR9eCjRSrhAK//NGN/gLqEeVM0XCnkzIPheOJ9r
         6t9H7GM1ayL5f/fRRjlQChdcv2X39gRR4QbxzRGn0e3zBIAiTqeXefp8lA4WzeS0wi+L
         9DOyyMW4fdJ2iE1F6j062LVGTvUVJrkDkFtwGg3xYaaais9lBoGyFkVApb5WKBv/whcv
         UaGVHtQol06nKLuaXji7f/4y141FX/+luyOHFR8Hx12USjqRcE65Pi5Z2EVo+m4fS3o+
         drc4NsrwIwfs8yfHs7J02Kmmo78nC6x9dlSbIoTUmVcn4BkLqARDszP6EnTT2o5JKWTa
         2UMQ==
X-Gm-Message-State: AO0yUKUkOj8Mo/GgvHPnIXDAPbJOpNQQ49O/FuR4l92tXb1mHijKhnxX
	lIo1W3FhyDfQoGV0GQhS36mz79i330maQ8my
X-Google-Smtp-Source: AK7set/fjghCd6aQ47dcrbqhpVv6288Z8r+fI4E2Ox6BW/liWZcys3t01wTHRsqhbilvWAcyyCxJ9w==
X-Received: by 2002:a05:6402:24a0:b0:4a0:8f4e:52dd with SMTP id q32-20020a05640224a000b004a08f4e52ddmr24043009eda.17.1675027106821;
        Sun, 29 Jan 2023 13:18:26 -0800 (PST)
Received: from localhost.localdomain ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id g12-20020a056402114c00b004a216fa259esm3754491edw.60.2023.01.29.13.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 13:18:25 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH] riscv: mm: fix regression due to update_mmu_cache change
Date: Mon, 30 Jan 2023 00:18:18 +0300
Message-Id: <20230129211818.686557-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_131830_636131_7E8B5F07 
X-CRM114-Status: GOOD (  13.15  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

This is a partial revert of the commit 4bd1d80efb5a ("riscv: mm: notify
remote harts about mmu cache updates"). Original commit included two
loosely related changes serving the same purpose of fixing stale TLB
entries causing user-space application crash:
- introduce deferred per-ASID TLB flush for CPUs not running the task
- switch to per-ASID TLB flush on all CPUs running the task in update_mmu_cache

According to report and discussion in [1], the second part caused a
regression on Renesas RZ/Five SoC. For now restore the old behavior
of the update_mmu_cache.

[1] https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@gmail.com/

Fixes: 4bd1d80efb5a ("riscv: mm: notify remote harts about mmu cache updates")
Reported-by: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..4c3c130ee328 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
-	flush_tlb_page(vma, address);
+	local_flush_tlb_page(address);
 }
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
