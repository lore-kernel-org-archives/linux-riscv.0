Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86AAC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BP5poHEyD6nWG4kDUNfq3Gt/iPQMg7WJIZFk5gDv5J0=; b=z6R/xGVqpBUD6o
	IxfjWTp7KJO8BfNSzi6Nfyh0fBHQBosYqkGAal48Qyymbt2L/fbjHCL7NQ2KHwQfpBZOLNDPY/fRa
	V9fp1tFqObULmBA2xS8tldE8+XHDLjK/4Kand4YVp2DbVm3wTmwEv84XmYPavW4+QiZfjXpdHtyqH
	w2YrbWk27mwAITcofi7pEvno6fUO8ERt/updA0hLfVYCe6vOpqTpXZJpdh2WEQlwQux98R/w9YYqe
	u247bGWatcrcWqbtQow/+GyqYCkYJGMR/s7yPxF5wDEkWe3VYhNsW3CYu0i6w8z9B5ex7Ec/9KcfR
	skQTLP0delYLlRC/DRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8AD-00000004fEb-34xN;
	Fri, 10 Jul 2026 10:08:57 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8AA-00000004fEA-3wBr
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 10:08:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-493b1710405so3581915e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678132; x=1784282932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lRikmQyOKgqKnyLuQ+vxx3W3W3hQlqGIgJrN16gls5I=;
        b=eNqsAsyqfM3wdbxsP4f76O2Ld0Xhrn4r+AHZUd0AXymO9mjRvx9255Bu9HLongd1MK
         iKeycDZv9gav4Ey/lRLQFUrsOWFimCr2ptUc8e9ZyTjzJ+5bbqLf2w1n3fg5URxVHyy2
         KDx7NM49rCI0ZZJl/AzzUkwQ7+xxo1A4n1ypUHrgu0kkBHHbW70KljmFY28S3hvfNhSY
         n66hAeQ2VCKNcm7ZQNfQ9v4KknakIYAl+lzhqkTodK0iV/Vb+N8X+QYTzJoGR/IOPq7I
         LhgeCk5467+ZMeae7d+wx6QSeBAQpGo30y7g8EmHaN6CuCaN5x5hUg9KXRLDXO3VBCC7
         iYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678132; x=1784282932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRikmQyOKgqKnyLuQ+vxx3W3W3hQlqGIgJrN16gls5I=;
        b=AJHIbxeoPE0h5ndUpHDJ0x1IanWyPjfmY8AKP54VRxoON9FYZiXD5Ck4NWLZr7eUic
         R3SVlFg+9+QKYWj5ZxiXkRqv5U4mqJsO8PyXXlLELexMoWvdcYbUPJq6NvMsI4DQO2sA
         wydfCvix5ACq5RVGfvKukjgxwg9gnM2QLRSQ+LgSOOOq7FcKZaJFD98Pry8RDsWE4b6b
         94t6hECDOBNNDtWaD+yJlJyyKryCAradMZ1AYykT2kuXVZcTiD4LW4j1DMuZ2NzEG+J+
         6Ra9sveethzpfKOOWpBIJHcOEDgh165TNkgHWLm4imTtwDLnRwSM8x5Qy8kd1zBD68is
         pngg==
X-Gm-Message-State: AOJu0YwSBWKmJffluKgzkgQfm4ayl9qE1VhBDe/wRUKQ2it2yJHMXMdk
	8euTIAI8S3EpYZxmAaDo3kisHa4hZledD23x4XcSkzb4kt/XuYCeS6lqG4VCHutnmjzjEg==
X-Gm-Gg: AfdE7cmSdEixXXSAqFatru5mp/S7sbYq8/AzNj5BdNt70BEJTFEoUpRoqoue3nWXmY1
	IbxglmGEARzfRvu2hT6yXm0T8c1O9VN2szhNTq+wYz0MUHu3n9S1Jw7Qn625xPon74yOBnOCC/s
	/x1C6Rn9s35O04oQQiAo3ftzrZs4Xj5wHHlhdWvWPkEunj/+A+0xGLsUzU2eGZP9hjFCP7i3Gpc
	LewqNkqns2pSxKR3f3RV67/2iH6fzNPT/2F7XkAIXvmSKj1MGFSF+2NytXPT4eaFyBGE8pIn2w1
	o33rxV0NjQCFMEJb7ie7eYhUwgnfGhJ2i6IOOFdPUPH0O2G/SmrgGikeWIt/CZB9uGV9q+xP+Hb
	1QRkEK+VCr1v/30kTKGEtjGeXoEAtpQSVshtsgP0RpkGo8v3jNhOPfwDtWeeAkfFhFNDmDXiOT4
	BZMm3XBHt82rmOSK4r
X-Received: by 2002:a05:600c:6208:b0:492:3e44:214b with SMTP id 5b1f17b1804b1-493e6843fb6mr101057725e9.13.1783678132163;
        Fri, 10 Jul 2026 03:08:52 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3b85sm207711765e9.2.2026.07.10.03.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:08:51 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH] drivers/perf: riscv: handle legacy fallback in event check
Date: Fri, 10 Jul 2026 13:08:35 +0300
Message-ID: <20260710100837.1362558-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_030855_022810_64391BA9 
X-CRM114-Status: GOOD (  11.99  )
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

Common events PERF_COUNT_HW_CPU_CYCLES and PERF_COUNT_HW_INSTRUCTIONS
can fall back to the legacy counters. So do not mark them as invalid
if OpenSBI reports that they are not mapped to sampling counters
in PMU DT node.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 drivers/perf/riscv_pmu_sbi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dfc886dee5ad..8f7aa71dc96f 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -335,7 +335,8 @@ static int pmu_sbi_check_event_info(void)
 		goto free_mem;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
+	/* skip check for cycles and instructions as they can fall back to legacy counters */
+	for (i = 2; i < ARRAY_SIZE(pmu_hw_event_map); i++) {
 		if (!(event_info_shmem[i].output & RISCV_PMU_EVENT_INFO_OUTPUT_MASK))
 			pmu_hw_event_map[i].event_idx = -ENOENT;
 	}

base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
