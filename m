Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F9C77B61
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Apr 2023 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqjYzmQgPxwzHQtoyygokJaK4h53GOdZ2lOw9pQogwA=; b=r2euAHjqx7cqLD
	FD4zX2NFIrZHube9zW1o029kgZt9BEKd7ACMtFc/xiMVJARBMjMTiCmfD3c28Zu8jCF7iCH3MkxzB
	It2qCHm/gXzcyi2Qp0D7xlNvEiCtNLXbzILa3KdORLbBiuHLqfyDJI0aBjaq4daExuAls+m7eUWXN
	/KOsZE8ppJb0xGpdJyTxG6fTWOJCOFL6yAqhp37GiYs3G0LmuBt3Sb8TvWA3i4IMpWspj8HNphKVV
	Pn8PLXInJl6VqPttORc7OVI2WIx0+Q+bftnLLDEd/6sVeCovPxkuFEjXic/jyHi+bX+L0qOoZEj37
	JNWgfZMV3no7656uy7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzee-006dfW-2F;
	Thu, 13 Apr 2023 16:18:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmzeb-006dcK-2t
	for linux-riscv@lists.infradead.org;
	Thu, 13 Apr 2023 16:18:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id v6so14751756wrv.8
        for <linux-riscv@lists.infradead.org>; Thu, 13 Apr 2023 09:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681402711; x=1683994711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=jnYAXcdc2F/ZUYjwGbFde5j1fnjVc7M0pT4u8eeWu2p7a9wNVttC/D6yh195iVKys4
         mxVhroni/klSct1CM/u8HtxLFdwyp8gxBeK52u97EoUsZcYEPG2gbhqDiF3zDqXCerCB
         NiYRItU+QsjrhYXfzgriIL7Bq8c+QDOLPiydToeJ3LjmuvIfa/zHFQnEagnw96dZk03u
         pd3KVMh0PwwJ+kCSQtIFpnMRaviqT8YGPxin0RGwxSiSveSxjexCjxUGU1uXkFwYZmqb
         xTjttfIuMCcu+Ru3hr7RR5/IDoy+4Vxv8/vqM7xpir2d0R6HwPiK+R5voQ85on0tT3/z
         t3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681402711; x=1683994711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zC284Mx5M3d9WrVkxHAYpIwsSHj0B1udyIbm0+qXIw=;
        b=Tfdn1csFSPbyWVS65Xy/nw9sdevWYgwXpHNC2/k9tCzGvnCva5ZzmfURUEefViTWam
         bE/2qOP0C60xF/FIAWxF53h6RyuRnm+NgUChy1AQND0EacRE2EEP2sylh3lQrjUmcLbZ
         8ILWxnAbBKY9yLDQv+ANpKQjJn2SBwElmI/uUfwpMzGwzmRp7tud5eibaiLxpW+i6XpA
         rzAtB30I5IRVqohnDzLYXTbI8ArVUlbGpBygjFaiN72MvKav5f2ulGiT83LPej4AiUhE
         AgHoL/v6Gefe+dh3xB8Gjob+usigDrYjq61k69HYNME/prpEV5LdO6k9MOTB0psGPARj
         zkbw==
X-Gm-Message-State: AAQBX9fWdN3vl7V5i+wF0wOqsDjrt1wk9f4bfmyCyozfGPw3KWz5mFQx
	yR8wo99rp1jPAJd+E5XZMZ9zfQ==
X-Google-Smtp-Source: AKy350Z58ybJnlDv5ztRusjd7HwtKvOy6HCP/IazeXuo09NcPyvJkiRUBITxW1O8s8n9bpTCu5u2/Q==
X-Received: by 2002:adf:e352:0:b0:2ef:b1bd:786 with SMTP id n18-20020adfe352000000b002efb1bd0786mr1600755wrj.13.1681402711478;
        Thu, 13 Apr 2023 09:18:31 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d4911000000b002e55cc69169sm1598882wrq.38.2023.04.13.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 09:18:31 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/4] perf: Fix wrong comment about default event_idx
Date: Thu, 13 Apr 2023 18:17:22 +0200
Message-Id: <20230413161725.195417-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230413161725.195417-1-alexghiti@rivosinc.com>
References: <20230413161725.195417-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_091833_933027_0107118B 
X-CRM114-Status: GOOD (  11.70  )
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

event_idx default implementation returns 0, not idx + 1.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index d5628a7b5eaa..56fe43b20966 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -442,7 +442,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
