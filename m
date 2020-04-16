Return-Path: <SRS0=YukA=6A=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949ACC2BA19
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 02:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65988206F9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2020 02:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhbKMlyT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C/HFZhb/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65988206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=; b=PhbKMlyTEeAtMV
	ZbhQgSZGVMI8eA6Zlbb/W+GfjF6IxT/JRtQnD3xsDqBFdXRzsmQ//0isF9NqkSbvCGgjpDUT72QmT
	AEokodESQ2xPwTXH5xYGStmpBobyaYby/A0L7Bcabk9vG9De/jv2zrCu5R9YMhRceL+bvnKf4JS6W
	nmgM1dd18dL5ewffUifS90YEr+UiMQNbF/gnvKcSPrYFa+tZB0QQS7wkqIrPYjQna+POk4zu7hgXw
	JbkQxmVoJINFZrL6NMOIr+EOMrW5ktFotyTtY27n9y2O+6Hhb4eLXY8oswHEz1H9833ehgS2GgnRR
	hFHzYYjD8tYlTzGvdUiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOuQE-0008NU-GN; Thu, 16 Apr 2020 02:38:34 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOuQB-0008Lx-VM
 for linux-riscv@lists.infradead.org; Thu, 16 Apr 2020 02:38:33 +0000
Received: by mail-pj1-x1042.google.com with SMTP id o1so726243pjs.4
 for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2020 19:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=C/HFZhb/VBa+5fbIzMCnK9pU2PPhmSkmTZJxSmF3ptbNd0mCOMNO6Qw4f5UU2lKGCw
 gUuEsNNz0m+7GxqHbXzWrLK7x6Okc3SOgCoQq81DI+VUphwlT6Zc/PaE05u/W2628+1L
 ummBI7lfYLy4s5PzcLInAvsOm2Cja/PjadbkLvYGw+qD4Mhue6EEg+bg5xxlOjLZtLBB
 dizsIK+NOCwYmPH6v7yIJHL2xbpSRo1DEPNZJbl6wzr92CoQzehqaAlWvY8EmOoPUBvP
 PHDwoOTIBttAtrnAU5iUUZ1dTPMTXE+qhUvIsbEdWB58fJWhvd6fXn5047sGoS6vNDSK
 Y2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5aQkCdg3OoDULAq8LLMFvMfwkl2FbDtSgUr/S5jyTE0=;
 b=Q5M7/TF3IZCY/Kuh//u4/m5pmotkiVDgaDBDmEGcbE0FdCvla+k/pSFtbj2eG+GO8s
 P+u2nOWIrJpF60/5vYAdMGWbhYve1SkwevOxgwDMRX5q/SodJ0SiVQY9ty1eZ8gFysw1
 Ed2o5Bd39pYqU8SLxIToESVh7deGiVVyfitQPssjiJRpuSdGsk7hvr6oXOfohzrrAMKL
 hUO3ylEYFYfctunqbDyZl6+z5Zc4ojHgLP6mZpTFgpywTWQoa89AksRelwxeL3QAAntv
 wXGolw2l0zcp3I6Gb49bMXpIDWhisgksDJ1MQBdNQjl4wKy0y4308sBsIIOMDX6bsCHy
 uA9g==
X-Gm-Message-State: AGi0PubphotXhEd4mxpr0lO1hjw/NdgzbGutHkekuJWCcEtou2D4sMpB
 YWyc0Dw8PDOQp0Orzu7F9DJxA3P5Tdc=
X-Google-Smtp-Source: APiQypKCWhzi+OoAToima71fdEOLjpWXaW775yUGc7XWNuEnAPZruwtOOM9mJrJBtlQjq3BpmLz83g==
X-Received: by 2002:a17:90a:a40e:: with SMTP id
 y14mr2364584pjp.151.1587004711170; 
 Wed, 15 Apr 2020 19:38:31 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i25sm11347536pfd.140.2020.04.15.19.38.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 Apr 2020 19:38:30 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, daniel.thompson@linaro.org
Subject: [PATCH v4 1/5] kgdb: Add kgdb_has_hit_break function
Date: Thu, 16 Apr 2020 10:38:04 +0800
Message-Id: <1587004688-19788-2-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
References: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_193832_019598_BBAE6782 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The break instruction in RISC-V does not have an immediate value field, so
the kernel cannot identify the purpose of each trap exception through the
opcode. This makes the existing identification schemes in other
architecture unsuitable for the RISC-V kernel. To solve this problem, this
patch adds kgdb_has_hit_break(), which can help RISC-V kernel identify
the KGDB trap exception.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/debug_core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 2b7c9b67931d..01bc3eea3d4d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -417,6 +417,18 @@ int kgdb_isremovedbreak(unsigned long addr)
 	return 0;
 }
 
+int kgdb_has_hit_break(unsigned long addr)
+{
+	int i;
+
+	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+		if (kgdb_break[i].state == BP_ACTIVE &&
+		    kgdb_break[i].bpt_addr == addr)
+			return 1;
+	}
+	return 0;
+}
+
 int dbg_remove_all_break(void)
 {
 	int error;
-- 
2.7.4


