Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6FBC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 04:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4K1VPcUq+vePdYuWL6kFIUKDK0NpmYWn/D+b/i9/e4=; b=ach9XJVIMTplXY
	IMBQrBZ7UGgOsyDJRDasQ2W3RNmcMSucT3TTGeAd08uBzLXY3xFn5vhKG9Nf/wguJro6KhDyf47BX
	oHN7afQe5XgAOlFHvOpluGartqVaGKWUUwBK7SnW+sySns9HESo235X37P7wDv0UVB1u52P8UIaj2
	Pw6HAJ1yd5znkO0ofkV3JshfrhCAS7N+GztYRpxXo9PBw2QTldF7Nc289PUPDka0lYPE2Bh3Gz5l9
	ulKI70xhBtJIhTS7gNddCNti/lTp7VNZd3gkRapFOWthvy6fwZbyRFi+Gzl46wEZUih/oJq0Ep0tM
	2gh2SlV4U4ALv9l56a8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFg-00000007SHP-13DV;
	Wed, 27 Mar 2024 04:51:04 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpLFS-00000007S5P-2gfT
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 04:50:52 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6e67b5d6dd8so3499274a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 21:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711515048; x=1712119848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8r90DmKfTzo12+b9oHF/xBbsXVRSBOTytxxA308aMe8=;
        b=GxO3Xank/kMjp5XH4evAv3gt3R6MOoCT78H3wxxp6lZK4K8166EPpNdFTCH3usQ45L
         lvylOgut4TgM08rFs3GhM8mnnXJum9ghNkutz6cH1TrTXgVBLyDydDv37Id2K5sKkwfu
         1VNfRwM3bzKgDD3rXfe8ufAsDNXaKO2WUohopKNYTlJv40uy1V0Otjk4SiMJlg3YWGpx
         tCLQ46w2fy7b6BNHeJAMyeEL6ju8brwaXAgSMVo7UFrfbRUB1Rcm51kkg7YN+Eninc8f
         8a/3nRihwYLgzS3VO3WF6ZvMeHDoyhGzeXm0ePxtxm8fji64eqDefQFvH/vsyCP+OdLS
         yGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711515048; x=1712119848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8r90DmKfTzo12+b9oHF/xBbsXVRSBOTytxxA308aMe8=;
        b=l+ddh1XruM+GUeKHlD866zrRGgoliSskZ9S4RavM+OScA3I47G7s0p/BnHB9ysIYTZ
         dwigtLm72Kuw3629kYZ92SLzqI5Gcb9zq98dxu98Scg8b4ddUeJCIzPdOWWm4LqfEo5o
         iGtas9mvMeivyrdPYtl3TuNB+vX7p/+Y6mUmsAzsMykmJrAZ6qsLiJJXkNcjbpb8mnSK
         1Mx9lG8u3ow0tXgYD/78O4Entyn2JX/bQc93WsjrzaR0Wu6XL40IB8KHI7m6ik2MiacO
         gmDHD5yuDxoLsbAx1kPWWjPhmhHUif7g737/TK0D4ssr3JT1393w0zIvW3bZC6RgWL4J
         S3Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXg2MEFluTXXXf/x80p/zgMM2yK/e4al/tEnFjg/mG6zYP5l4v518CS3rSNvBqE0JtsOLhc0fbQ3GW8h1aoZZSH0tmh87WQPQJAKM+ubIyk
X-Gm-Message-State: AOJu0YxcQaupzyuPrXRt1N3zQMF8AzksTu0I9kZ4vXT21ursS03xe2Ep
	v4/JIZNHIxTeh6hKKi/n4tCLpxS7NVwsVltdeycVo5QOtnlsmpzIdNBIb19J1Tg=
X-Google-Smtp-Source: AGHT+IE/gtW/a2EQvN+qhLpDTcQ1EZrF+9VNRUlZn60iPj1iarim6P+gGyjDapgmLmO07m/XYQ3rgg==
X-Received: by 2002:a05:6830:1e72:b0:6e6:7db1:b444 with SMTP id m18-20020a0568301e7200b006e67db1b444mr154078otr.36.1711515048291;
        Tue, 26 Mar 2024 21:50:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8351500pgb.50.2024.03.26.21.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 21:50:47 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v6 05/13] riscv: Only send remote fences when some other CPU is online
Date: Tue, 26 Mar 2024 21:49:46 -0700
Message-ID: <20240327045035.368512-6-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327045035.368512-1-samuel.holland@sifive.com>
References: <20240327045035.368512-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_215050_737926_17540266 
X-CRM114-Status: GOOD (  11.95  )
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

If no other CPU is online, a local cache or TLB flush is sufficient.
These checks can be constant-folded when SMP is disabled.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v4)

Changes in v4:
 - New patch for v4

 arch/riscv/mm/cacheflush.c | 4 +++-
 arch/riscv/mm/tlbflush.c   | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index d76fc73e594b..f5be1fec8191 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -21,7 +21,9 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		return;
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index da821315d43e..0901aa47b58f 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -79,7 +79,9 @@ static void __ipi_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (num_online_cpus() < 2)
+		local_flush_tlb_all();
+	else if (riscv_use_sbi_for_rfence())
 		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
 	else
 		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
