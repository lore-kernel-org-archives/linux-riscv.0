Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3707EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekf2qRZ0aQTrLAPulJl16rA9hLquRu3HvkH6zbfZC2E=; b=wREweyGoc0Pc5U
	1pNfWNNXt53u4WluZ0TCVvVy3+DDZm91ZKqeAklht3SkGz+evA6E6ZEfD5yLM0eKTpP368dz4Ikzu
	Ls5WOOyo5LFgCMrwbDS7mSZQ/46UK//fgMWQZdF5TRs6h104KtIH6kIwl3+/fg4y3gRwwyHEnKPMU
	Oiylz8MtzJ/TaVNWH6c7m+WHR/pqNEsuMD3c5kpK37kASFOxAPPaLLh3RgwSKJ3X9zpiSJg2GmzqW
	xu79gMcIhKi8/+7conQ8xcMdrbPGn0QLa9HjzS2dWauBX3uEIDuvbHM5OtKg3mbOHTtoK5OD08tBO
	CFmUUAL1ARNrizB1UNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIzF-00AWw9-0o;
	Mon, 03 Jul 2023 12:49:01 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIzC-00AWtV-05
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:48:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fba5a8af2cso44755295e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688388531; x=1690980531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=i16J4ni9PRmgjYqxfrE1XbOUgfjftUIExJgrCxjMKUpNa0UHu4g4yT+G0k47/9OXnB
         1QZB5ciPxLMxQpV9Unfp9f38KrhcDrdpy19aiupbprTf6ktj0XEUYYpWnKBXfnS7wGnK
         1jnDUxYGgsa6sX3GiT/5N6zso6Tc56ROXb4EybFyia6SKn0G4VbXTyoksin6FNg45DCn
         F/LPCUrj8h4B5eRcFhh1e5sEkDM8anr5dq+g86J0nGpmQUjeO0YiV3ZN8NGYAaRQfSV3
         PvNJk0trAcDdP1lOMdY1spR+0ZPZsTIr6rZhwBUjfQWCajqHVMWOW8LuUebj+kMlwQBo
         UCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388531; x=1690980531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=WMJONqMCuzuMZu8wX/ANKTqfnc3ZSdxps3qzdGbhXDOBJw2suiXzTN7J8cd6mSW2A9
         MwNwLDUkBq/TMbUgx5qBEmy/1uHbmTAsyxBw4kOt6zE75ZnT8lM1tPYPC30xlpQWfWfE
         jTKpm43bOB6JXpaae1WQv0ouhawLzQ8vXVokB+4uQnneGBknRqlherfUG98HAhuGi1sX
         MgDFbmafeVbjUI0PHhWxmC4b0k1Ngpx6iR6e0LFHNV0//ImLbQpAm2PkKWB3asanaH3J
         slrywN0fWWZVYBlKbh1clJtqLDrXV1cMERWXvA8QOLwuXBY+gLRZGb5/U91PSU+fWGMY
         iksw==
X-Gm-Message-State: AC+VfDyn4q2dbo6UXn7nbMdXaeukiIr0AMobyeT6IkTdHrkdAdk9kBVb
	TTQfqj6+vlqapV/RExaIsqNJBg==
X-Google-Smtp-Source: ACHHUZ5hXaX0d50B/MxYY7zmUATcMLkAUWf08O2mNTD1GDuz0rdbpLxwVWR6/kUM2N1nPey6Tok//g==
X-Received: by 2002:a7b:ce0a:0:b0:3fb:b1fd:4172 with SMTP id m10-20020a7bce0a000000b003fbb1fd4172mr7691263wmc.22.1688388531708;
        Mon, 03 Jul 2023 05:48:51 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c211400b003fbb618f7adsm12744165wml.15.2023.07.03.05.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 05:48:51 -0700 (PDT)
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
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Mon,  3 Jul 2023 14:46:39 +0200
Message-Id: <20230703124647.215952-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703124647.215952-1-alexghiti@rivosinc.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_054858_063857_E7BB4B57 
X-CRM114-Status: GOOD (  11.58  )
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

The current include guard prevents the inclusion of asm/perf_event.h
which uses the same include guard: fix the one in riscv_pmu.h so that it
matches the file name.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf/riscv_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43fc892aa7d9..9f70d94942e0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PERF_EVENT_H
-#define _ASM_RISCV_PERF_EVENT_H
+#ifndef _RISCV_PMU_H
+#define _RISCV_PMU_H
 
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
@@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 
 #endif /* CONFIG_RISCV_PMU */
 
-#endif /* _ASM_RISCV_PERF_EVENT_H */
+#endif /* _RISCV_PMU_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
