Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4C2C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 17:51:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D01060230
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 17:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D01060230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1w4AAVCOd78m8xNK2SGDEXqfQgwF/B7DtfbX69lPZAQ=; b=OfH7wt5hdixSpLiWHtoWngojyZ
	AnTIh7EARh6dGIo+3zs1WX/eRGDks+We8fTHKpRlcmuyeuwNE4k7GhaaXEkE5u0Bag1GlbKa9NE4b
	2F5j+LPkU8OLOmHzZ41fcXI7qgLo1uIiJXTezfyS/QI1Cw7Y4mJkVevIzqMcdgjamAgTe2zlEQpxw
	2KeHYcrmqCycSGlRhcuQEgQuVkrMaGpZsK6Lj2e+XtRXSBurMIn3WuLZORpH2aIbWBJYwbYU7iQLi
	FIjb4Ivi1p5u6AXGaa5NiAOz7QmNlZzryJxd+N0+H7HlRqTGrejB6PHTCg9Dwoflz5VNK1ADMavti
	j3Wg4W0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkVln-002tPI-Dp; Sat, 22 May 2021 17:50:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkVlk-002tPB-9n
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 17:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=; b=wIWM2xA5igU7Xw915lr+rjqkxo
 94VlO6lDO/YbgBL9wXWkg/JbmpULhPQW3QC0WIzwgRWEFa4x63AvG0YRLHWxfO5rYQfDI3p6p0mcs
 k2AUunM8vf8hFc+xsjNuiZFHq+YQ+O/fVU7XTUjmV7pmC4/KXzcEQ06JSwX7ldsBMxdgkkUBgR9Il
 yMjqVNWjISi2SApaYVX3H5lKELYkFxpJQicWg9U55Po/FsYFaSlMloU6uMoZGAUxF2rXM8WEjUfBS
 ALeP1UIN1ezekVbgGaUPjAvfi8ICMNoJMkRpwIX4dzW7xKraCrvUKzP3SoioT61F4SephhGA9Wfhd
 pgENfj/w==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkVlh-000AFm-Nz
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 17:50:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id 69so12583272plc.5
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=;
 b=N0AJ+ALPOrzh1DCLx2uqK9LPCRe6C6D18hmoYnjNxSDFm7zc3ZsCfk78gXgIzjYyiH
 cGcN0HsnlNrwij0ZK1qmQzez4GBaZUdqC0ptaqHSolT9vM9wxd/+KBPC8nB/9XhdD1RB
 GAAqP0D+GGQC9dm0S/bF/D1w0xnkFaxGvTPWRHv1U8IuhBV+7BJVW9hQdpwDP1hLzdZ4
 k56qJHoJadqCGPQVL+c7OV/P5g0+/zgD7y/KdgEj4Y4q5FM+7cmrSNTFJLVJrX8h8OOJ
 e6stl3+zVE/JlHPZCEvtqD4QwjF/MFm0J+eNZD9laIlxROrT4E3qfLKTYpfQI2tNuZcJ
 AE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pedPYH9wJV2LGdJ/WHZruYTZCGLAeJLk8AuVrE6wM=;
 b=MO+7p69upACm+ZMUOLpIHJ+YVLZX4tHVOVrNpsa15zb6H6qJlMu34clOsIRxUvnebo
 lpxhTPezAHIrwiMfCq87UeYBv/wzH3lCYbWeIYA8d7t97QkZEq7GyKq0NKaQvTpYozIg
 OuPvBqtLrpn/2uQHr02yXV1Is9s4J/ye4vlwzSGb3BmexIdRG/tt9jUNiQVCpA0KGSII
 /qgDampMNgN+rH+RaO3QW8zUpABY6NSNu8mahd216QBkA6E9m442YVmA67AKmyz+3oKk
 DPQKs28VaQAxf2YSuUxSvgDBKihs4/Xt0POtgS8+LE4Cs5YKxf1HCWeeM9G1D2pcuZ7A
 TcxA==
X-Gm-Message-State: AOAM530X7G/QQHmM67fGU8LvfvRegxULGT6/Z3cZ1ZsDjeV6qdHE/KEZ
 YNBpg3fx1pBbmfPO1zp1GPzERd1UqlPr4qbh
X-Google-Smtp-Source: ABdhPJySapwUXxrpDtho9rP61l8iI4fB2eDoBgjqqYlAoCSkPsF+Ibpfw8CSiV0Pb/3jsH0b2CIg8g==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr16462813pjb.218.1621705831915; 
 Sat, 22 May 2021 10:50:31 -0700 (PDT)
Received: from localhost.localdomain ([2604:a880:1:20::1f:7001])
 by smtp.gmail.com with ESMTPSA id l64sm7820672pgd.20.2021.05.22.10.50.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 10:50:31 -0700 (PDT)
From: Wende Tan <twd2.me@gmail.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu
Cc: Wende Tan <twd2.me@gmail.com>
Subject: [PATCH] RISC-V: Fix memblock_free() usages in init_resources()
Date: Sat, 22 May 2021 17:49:51 +0000
Message-Id: <20210522174951.377107-1-twd2.me@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_105033_827106_7858713A 
X-CRM114-Status: UNSURE (   9.93  )
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

`memblock_free()` takes a physical address as its first argument.
Fix the wrong usages in `init_resources()`.

Fixes: ffe0e526126884cf036a6f724220f1f9b4094fd2 ("RISC-V: Improve init_resources()")
Fixes: 797f0375dd2ef5cdc68ac23450cbae9a5c67a74e ("RISC-V: Do not allocate memblock while iterating reserved memblocks")
Signed-off-by: Wende Tan <twd2.me@gmail.com>
---
 arch/riscv/kernel/setup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 03901d3a8b02..9a1b7a0603b2 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -231,13 +231,13 @@ static void __init init_resources(void)
 
 	/* Clean-up any unused pre-allocated resources */
 	mem_res_sz = (num_resources - res_idx + 1) * sizeof(*mem_res);
-	memblock_free((phys_addr_t) mem_res, mem_res_sz);
+	memblock_free(__pa(mem_res), mem_res_sz);
 	return;
 
  error:
 	/* Better an empty resource tree than an inconsistent one */
 	release_child_resources(&iomem_resource);
-	memblock_free((phys_addr_t) mem_res, mem_res_sz);
+	memblock_free(__pa(mem_res), mem_res_sz);
 }
 
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
