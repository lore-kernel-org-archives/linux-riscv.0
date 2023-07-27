Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23555C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ettnhZXTwVKs/JQHcj7/Lqle8D3Lw4yrnO6mBPBiQlY=; b=1XVFeXbtsVIYDM
	+ZkwftvlNqR3j4kofO7D41/DTif+P0NbbKjRCLz1mVbW9YIm/SUGg54gfH70mSVzXSrUzIASQYXjX
	vXL7pFD+iXSHbyhtzzTaZeZPRdfM7UJFsIwHjkte3EKlfDQX5ZghRavx7RizSJURGdr3rULz/whfx
	U82LpZe+cls7a57ZWL2qn7xr/s8ExFRKJLRDId4OoMWmQ6TyNVS/ntdS+3WVJb0A3agBznFzDbVDU
	pfptWHhOtwlK/9nESQc9uo/t5/KwrIKffoTqq3FwRFdmJfKMRLKYBa0jjsdj4329I/sY/oL5TXI7a
	+7MckTD4Bof5i/gYwe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1mK-00F3Eb-0C;
	Thu, 27 Jul 2023 14:15:44 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1mE-00F37N-0g
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:15:39 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b962c226ceso14959051fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467335; x=1691072135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=xCt9C05W1VphhOi6OHJ+m4dwlujqmo7vBPKV6Y0OWx7fRMj79yzK7Nk8K3icSTrYCB
         pK1An74ohRZpjEt3rQzR7XVUMbnHALMVMSiuUwVsTPgO6U2nFT32bnVt24n6iWeOdygP
         qGiBwgnHHZyNs8Zu6bl82tL45DJKrlbWEAie2pHhWl7b7Q3xkulmAe5LnJtUaYIJ74YY
         rZHO9fQZLQSKG+M0yFbH4cccCTi7qDc0BrkvL9TovzPwXCOPv2LR+/h7R9CWOKIzaWOZ
         EIneyUPToIo0bBhqEGKns6FSBA22SUVCCfcFMhHLi0Pgchs4o4M6pNRzBICX9X07vr3J
         hZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467335; x=1691072135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejdl0KVafWeUDCoat0LuZ8Fy/MsW+LGPGn9twtI85O4=;
        b=LBXGWoWLRQZT4lFtPVDXTEB/4tIV3ycVwFZexLvX3ekjttxK9ExO8cifWLX7IGqe3y
         hlTAAqmHAG9Gy/61WlypXy/XbDRy0ar8bc7FJYiUCmM1KT/5+oDKCHReobjXVGCgCG0f
         wU1AR1EZFFlvsMyVxiiIILpw6KFFN9cC16G1IeRVAkRr7hgKbKZPaxraBBVD1C0ixbjP
         KBSvnySNJOOSMOvFE8rAMW0UW5rGHf1/Yv1vuT95tI7xBxUMmIZniArzaOD/ZjC9l+BL
         HM1vY+URRzcD+aCyge0t1k8HIL/GjD8JnmwnBMFkkDzJQxUGwsOYwObhltl3LIKIQi1v
         Bn4A==
X-Gm-Message-State: ABy/qLZi5pDr4iCqshSwjGcB0zC8qQ5YksBw6FUITOmFnPlKknRCnzW3
	QxV+yBQVh1oqu4Xtis57dDqUsA==
X-Google-Smtp-Source: APBJJlHY17a6wPpkEEXxMQBJOAf/w61Kl62dSVUuEtexW6i7EBwi5BqZSmXnNR9+IbGjMAWrwBYHGQ==
X-Received: by 2002:a2e:9983:0:b0:2b7:7e:e95e with SMTP id w3-20020a2e9983000000b002b7007ee95emr1883680lji.45.1690467334531;
        Thu, 27 Jul 2023 07:15:34 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003fc02e8ea68sm4850057wmd.13.2023.07.27.07.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:15:33 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 01/10] perf: Fix wrong comment about default event_idx
Date: Thu, 27 Jul 2023 16:14:19 +0200
Message-Id: <20230727141428.962286-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_071538_263556_28DB7970 
X-CRM114-Status: GOOD (  12.54  )
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

Since commit c719f56092ad ("perf: Fix and clean up initialization of
pmu::event_idx"), event_idx default implementation has returned 0, not
idx + 1, so fix the comment that can be misleading.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf_event.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 2166a69e3bf2..1269c96bc3b6 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -445,7 +445,8 @@ struct pmu {
 
 	/*
 	 * Will return the value for perf_event_mmap_page::index for this event,
-	 * if no implementation is provided it will default to: event->hw.idx + 1.
+	 * if no implementation is provided it will default to 0 (see
+	 * perf_event_idx_default).
 	 */
 	int (*event_idx)		(struct perf_event *event); /*optional */
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
