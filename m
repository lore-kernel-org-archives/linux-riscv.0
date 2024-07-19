Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B960C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uI3HFrqUWnMv//khMuXcjRMFoej/W65ZP8xDUArlVnA=; b=zZHkkg1oPikePs
	WR4L8XFT26juqat4W4Qm92bj58jwN5Cb/xvx+CMRBFNZZHoSJV5cJw/4aPsy03mjGRrwcxHkcRMP2
	bFNgWvMLtlciKKfHOMlF1NK7OzlvwO99kd0B1q0OMqyG+XE53opb5Ef2+cbHMJA55J1bHOqrUUVSg
	oZxPe2VfXmJO7VqgkGts6ao4MRvyYJa0a6zw3ccaV3AZaA7t4640+34SV58IFwPo3SyDozBA61xQH
	YzJfkkigG3sxvS6xkLkKcZfiFCAUGZ0vEWkFlnB7DZpY18Q/nJAbMcOLtkpApbelaPufJ+lg7+UvS
	N/0Z0OhlmZ6fg67gs8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUm8X-00000002YWk-0sXt;
	Fri, 19 Jul 2024 11:50:57 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUm8S-00000002YWB-1tWb
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 11:50:55 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1fc56fd4de1so14705045ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 04:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721389851; x=1721994651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVtxIMKdmscS/o7u8DiflVJHHXOzMHg1+tf2aCpyfEQ=;
        b=CM6IIo1qCAmtyTRC7Ltn11RdCPe5L59c7qYZE+BUQ98KVnJarpvb31BUfmxWUS3KFW
         ZwSTJUizNY9keTS8Rk+8Lq4TYEdaR0gVvkxGzCFTeTTvb6q8v3aHGwJN7Z3Hixk4YIS4
         OSc30kGBbQhJdVgbiahwSkxXX/SXjB1On3SthPELm5EywforFQx0FJkWwfz7ytDjZPHd
         Gjt0Hm9ENZiHiO4aGiQcZfLZQDSq1lgpk0HrZ6FBwrx7+yFdTBu9S+qAHW4nweWipOWg
         9KEITAYgEYb6jKzMBfpVZSXGQ28j+S+PRiQJqakjJzSrZhjhZfbb/VcyuJj6TTWNiGmc
         i1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721389851; x=1721994651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVtxIMKdmscS/o7u8DiflVJHHXOzMHg1+tf2aCpyfEQ=;
        b=sf7xyB62zH3a2UY0IfBnJ8Rf+oRoBM8KnxKMT0/96XC3ULwCxx3ZNnxiAZtpnY8fDf
         0tIEmU+6uTBSrxsr9gi4I9M6sP44t7SjubnvxUB/SLURh95lUzGw3GkuF7IvREbrwi9a
         gvuQq8Tz9VKFuUHKyapFz8HqCOwIiC+GL499DgD5RauBvUjDpuv/2ndh+aBVc2bhX0wX
         57FR1XJZSHPkq2KA87Hc9eY5Sog8a+4rdjFSIuYDqlFXrr6BY/iQ5fZTgxRVlV8lFyML
         EWjNhTvT05v9Aeq0VgK4x8M5boeuicqBHhkGfJXx3yFUEIvLO5OpxvdyupoN6rE3xKZ8
         zX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCJ7gKBhSqt6bS5dR9sPor0DTq4xpY5Gwcsk9GA4BYzwLZF+F7DFhz66f6m1DSq+fpjZGKgSqeimT7pufM+dNtmVxsMYG+xut99JTTNAfU
X-Gm-Message-State: AOJu0YyQHzStLptHs/YGjRAFwsAE3+RYKorK2/1Ih5OkUHPoLBs7MUdk
	vQX/QJ46QzTqnWarULzMxjG7d7s/t6A+gy97t2d2QmV0aZy6oZpCnNxzdb/LYtE=
X-Google-Smtp-Source: AGHT+IHiq2nRMIb+cCUNS9RgmKaSW0ZowUVhXRGuZHjMWBQJkKfjSbT351Hq+x1XMf0TtCGjGJZ0ug==
X-Received: by 2002:a17:902:e54e:b0:1fb:6e83:7cc5 with SMTP id d9443c01a7336-1fc5b58436dmr84582635ad.2.1721389851242;
        Fri, 19 Jul 2024 04:50:51 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0a3deaeasm236589a12.1.2024.07.19.04.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 04:50:50 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	peterlin@andestech.com,
	dminus@andestech.com,
	locus84@andestech.com,
	jisheng.teoh@starfivetech.com,
	inochiama@outlook.com,
	n.shubin@yadro.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Eric Lin <eric.lin@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] perf arch events: Fix duplicate RISC-V SBI firmware event name
Date: Fri, 19 Jul 2024 19:50:18 +0800
Message-ID: <20240719115018.27356-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_045052_753540_06AD3787 
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

Currently, the RISC-V firmware JSON file has duplicate event name
"FW_SFENCE_VMA_RECEIVED". According to the RISC-V SBI PMU extension[1],
the event name should be "FW_SFENCE_VMA_ASID_SENT".

Before this patch:
$ perf list

firmware:
  fw_access_load
       [Load access trap event. Unit: cpu]
  fw_access_store
       [Store access trap event. Unit: cpu]
....
 fw_set_timer
       [Set timer event. Unit: cpu]
  fw_sfence_vma_asid_received
       [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
  fw_sfence_vma_received
       [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]

After this patch:
$ perf list

firmware:
  fw_access_load
       [Load access trap event. Unit: cpu]
  fw_access_store
       [Store access trap event. Unit: cpu]
.....
  fw_set_timer
       [Set timer event. Unit: cpu]
  fw_sfence_vma_asid_received
       [Received SFENCE.VMA with ASID request from other HART event. Unit: cpu]
  fw_sfence_vma_asid_sent
       [Sent SFENCE.VMA with ASID request to other HART event. Unit: cpu]
  fw_sfence_vma_received
       [Received SFENCE.VMA request from other HART event. Unit: cpu]

Link: https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc#event-firmware-events-type-15 [1]
Fixes: 8f0dcb4e7364 ("perf arch events: riscv sbi firmware std event files")
Fixes: c4f769d4093d ("perf vendor events riscv: add Sifive U74 JSON file")
Fixes: acbf6de674ef ("perf vendor events riscv: Add StarFive Dubhe-80 JSON file")
Fixes: 7340c6df49df ("perf vendor events riscv: add T-HEAD C9xx JSON file")
Fixes: f5102e31c209 ("riscv: andes: Support specifying symbolic firmware and hardware raw event")
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Nikita Shubin <n.shubin@yadro.com>
---
Changes since V1:
 - Add "Fixes:" tag for every patch that copied firmware.json
---
 tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json       | 2 +-
 tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json        | 2 +-
 tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json       | 2 +-
 .../perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json  | 2 +-
 .../perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json  | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
index 9b4a032186a7..7149caec4f80 100644
--- a/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/andes/ax45/firmware.json
@@ -36,7 +36,7 @@
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
   {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
   },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
diff --git a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
index a9939823b14b..0c9b9a2d2958 100644
--- a/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/riscv-sbi-firmware.json
@@ -74,7 +74,7 @@
   {
     "PublicDescription": "Sent SFENCE.VMA with ASID request to other HART event",
     "ConfigCode": "0x800000000000000c",
-    "EventName": "FW_SFENCE_VMA_RECEIVED",
+    "EventName": "FW_SFENCE_VMA_ASID_SENT",
     "BriefDescription": "Sent SFENCE.VMA with ASID request to other HART event"
   },
   {
diff --git a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
index 9b4a032186a7..7149caec4f80 100644
--- a/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/sifive/u74/firmware.json
@@ -36,7 +36,7 @@
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
   {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
   },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
diff --git a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
index 9b4a032186a7..7149caec4f80 100644
--- a/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/starfive/dubhe-80/firmware.json
@@ -36,7 +36,7 @@
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
   {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
   },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
diff --git a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
index 9b4a032186a7..7149caec4f80 100644
--- a/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
+++ b/tools/perf/pmu-events/arch/riscv/thead/c900-legacy/firmware.json
@@ -36,7 +36,7 @@
     "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
   },
   {
-    "ArchStdEvent": "FW_SFENCE_VMA_RECEIVED"
+    "ArchStdEvent": "FW_SFENCE_VMA_ASID_SENT"
   },
   {
     "ArchStdEvent": "FW_SFENCE_VMA_ASID_RECEIVED"
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
