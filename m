Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E82C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tyNw/UiK2ilpAab+mIBGbL75X/opUM4ZFWG2JQMLWuM=; b=m9/Bp7NJgArdyM
	4yGhL6UAqgSfUvI4zFBWJ2mp+jM8hP+bX9iRPPJSElkudbcZ6dq9X8ba4Tz2biGzVHd0fq1l/SToo
	/zbLdP2qdAZjJ7AnKz3H1VhPw5J/jwNAbvTEcRjzW/fkiAK2lDaELhLIiQE5pp8Yt7D0Dr5nlr5iN
	Xw51E9LNHfB5bIJHhfShnI1Ox+LxxMHv7ej+8xCA94RI9VDJ5MfuJemP4ELFNOPZKQSkD/KNL3d0a
	ywv90IwBygOddVPwHXYLGsS4PvFUJVXwnneRVVSpo4OoL564C3h9Psy/Z5BnqWOKhuCeXQ4v7HZSu
	+XJUJq9go2d3HLigIdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSyV-0000000HQzo-23al;
	Thu, 18 Jul 2024 15:23:19 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUSyS-0000000HQz4-1EWM
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 15:23:18 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso621703a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721316194; x=1721920994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hlSS9tFK0jyY2/f4QS94AO70MXLW8ulRLZCmaIHwXQA=;
        b=WVs/mNCefvsrKsJrG2Huq1PeXBTatXr9Z1VPdKdx23wB3wp83moJq/TiA513iaorfy
         TVDwutafhzFqOW6wul7R6Md6MfUILxyC38VXkl9Sw3d1CfdarAusaiSqYSMEp3Whf7+t
         Wu0WIirQq6/8Cz1TumR26ck/aEmIrw9ETTrelFQhrpNHQoaTCL/azpxqrkoRf6+7+RKS
         n3fOaGeQTQQwU9cz/G4u/crcxrmUdzXatpayttG0KBVXFt4CvteXiOaWYCTTtFh63ut1
         qxTSrigfwOpYemL2RUWLoNHfnCiB8BAyKbAX05XbTc1b5QqgMgpUcCF4EsCBz5cOlPlO
         aFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316194; x=1721920994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlSS9tFK0jyY2/f4QS94AO70MXLW8ulRLZCmaIHwXQA=;
        b=ZpSlllBSa9yGcu7Yd1WbVS/QaWSXSlp4K8smU4In4i9cR41dQGelncXQjGPg9yHOdW
         P1kVXgrBDu47Gfem+NIpm9Zo0nLo+ZZ8vsWmPeDQzBDEBWbvIn9NqTZIB/IANxPzXUuS
         cTuo6SQ0X+lI+9XLSZFcbbaJ2nhQMR3Luhz9HV8LrV6lwkf+V8j8FR05d2bGClEtMK+l
         +GfEQrAP0DuuT/AX99JVXwNgLA1k1XP2fYeQ5rFXuChC7cSRO8eSjoAYCt3ydT4CDImE
         DNaD/sjIgII8uNtUnHnN4DEWaItRWK/9SVTXUBlphpppd5RAhreQe1ZZQTSr2aCK63o9
         7aJw==
X-Forwarded-Encrypted: i=1; AJvYcCWKVuTKAp9HVq93EJhreUnsog1fTG9avr2DJVKXiALyHSS64Y48/SExvukvsXEwMVrdqsyg8HOMTfDgFssgn5ph2ngagLy5/EjZYKMEtw4H
X-Gm-Message-State: AOJu0Yx6n5zjyEdGiuKgXO33d+KMG9KKL9sGb9Q8mnnqvfMnEDkriqfA
	VujZx1359jiqrfAR6JjEj8NoK7fWvsxg6OCFKm3D2CXYq7DwFlKCyLSuSt9tQqo=
X-Google-Smtp-Source: AGHT+IGYiT8Y8eVtORah7pg5+CDI8AQnZirmt9fO5DQfBE3quaBqJnjCZLTnRCt2ZV4FKuosjPfDtQ==
X-Received: by 2002:a17:90b:144:b0:2c9:66d3:4663 with SMTP id 98e67ed59e1d1-2cb7755e41emr856950a91.43.1721316194279;
        Thu, 18 Jul 2024 08:23:14 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb77a01046sm810525a91.14.2024.07.18.08.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 08:23:13 -0700 (PDT)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
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
Subject: [PATCH] perf arch events: Fix duplicate RISC-V SBI firmware event name
Date: Thu, 18 Jul 2024 23:22:54 +0800
Message-ID: <20240718152254.16007-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_082316_535790_173A9734 
X-CRM114-Status: UNSURE (   8.29  )
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
Signed-off-by: Eric Lin <eric.lin@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
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
