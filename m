Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9EEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 12:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLfwZltWIj2xPWHRAGfPawSV49xO/x4cmjI5bj9s3y8=; b=c8TZ6vbxMDfr/7
	tOjvgQ0ygDe6RukJhPeOogks4F4fDWBfIiCWja9yfKP/qDD4EYqhbb0PG2PpB2i5jVOoOMjLMXsMr
	Ebl5TP3P0macIhwjw1ZbKVKMUXaTkXcQqGLAxmkNHYAbpgxIcrB8JhaUomySoumZoOaOqRykJC+Qs
	vnPQdNOhTN8az+AJQVzQ3zYO/rQBOK4d2/Rb2nBWb9FipDT8xXpbOiWPe/rlLA4xgHE5Ns2NvDQdU
	H72M1X3KpvdpgPivl4f6146AVLRwEI0RHMTm9AZH333HVsWQLY0yeOzTnLgkxdhd8Ko7VD76XMNuu
	LVxqDHp2hNxzzWMRfZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1LA-00CDxZ-6I; Fri, 20 May 2022 12:02:44 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1L5-00CDvD-KQ
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 12:02:41 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 044B13F338
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 12:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1653048158;
 bh=qJUgF2uIsMxkljS/4yaisro4oqOzykJLvWhhsyq41W8=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=EQ4ByDnuf8SQPrp3EFyDIhPHNrs8l8oYCLqe1eVLVuNf7ymTYg2sUFMNWBayvgHYK
 gUZK25KbWla7pUu+kuSoP5UZGz19yePVL+Dsb43W+Yhhz7ZBaZ8PFa9NVIcii76lbY
 I25fmg9W5nJ+HQuqt45ntu1OwQpIHumpqntChWdDUs+pThkcSJKsx8VsYDhD25CJe2
 GCPwer4JrlIiArdMYl5dmfA+tkFBGnRMILNPLT4US7/iwJHHvKu6NPkYQNaNhl/HEC
 iUZy4ddlGXY5zvtPiAavfPvHBqPdCY8TiUVrEjLjlzq1ASn5nHL/wh6DJUMNLa6ZjS
 1q9WWJdu7q+lw==
Received: by mail-ej1-f72.google.com with SMTP id
 ga27-20020a1709070c1b00b006f43c161da4so3931755ejc.7
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 05:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qJUgF2uIsMxkljS/4yaisro4oqOzykJLvWhhsyq41W8=;
 b=mJgWApxeeBOWErl00KpiPYdf+dcadggRhewyoLDBCp0Ttg3wfK9tW9ab7KV2DXS+vb
 2DzQhz5f/gSwjLOnUOxxbMW1MkkKttB+cnCtCV0Zt20vtTIgXptx2Es6qkJA1cfZHEQV
 0mAOYij5sNCla1dQ+Su+iLjiBwb01JKl25ENvyh0OzocFLErHhJTS+mtE3oX5eCPetSk
 dbedxPkUaPKv6CSOFC1TUNOh9bdu0db0Ne8DkLz5HUnkjFK8KUtWnsgq+PdoWYq1sZD3
 COMrLkPkLlhAakkTCKQWSMsAjN3tCFd3VozNcIqy13Z+X66Yb6pXMQ4gV164vAEqwfu2
 oEXw==
X-Gm-Message-State: AOAM531kE01mhFkSw1FciSyMmIzneO/syPakHhAm0azfQLHjpQdrm/da
 mTvjXPhZLjYEas+WtP0Y+MWO9MZpKTBA0WDjMoK749DbOD4Qwxi16TnwkVVJfwE7FowJglJM9he
 PvjabjuzoachXmBbWwy/fFx+8/pNTyx3gv7B8qrjt4KsUWg==
X-Received: by 2002:a17:907:7243:b0:6f4:1ce5:4ac4 with SMTP id
 ds3-20020a170907724300b006f41ce54ac4mr8246064ejc.198.1653048157723; 
 Fri, 20 May 2022 05:02:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx85Zt2rXo3aS3bxfgLeu4hY741HrqpGlVQ0XP/HkoRMsVc5ltw/pyBzC7DfFPWQ1vJSsLR0Q==
X-Received: by 2002:a17:907:7243:b0:6f4:1ce5:4ac4 with SMTP id
 ds3-20020a170907724300b006f41ce54ac4mr8246047ejc.198.1653048157519; 
 Fri, 20 May 2022 05:02:37 -0700 (PDT)
Received: from gollum.fritz.box ([194.191.244.86])
 by smtp.gmail.com with ESMTPSA id
 fg22-20020a1709069c5600b006feb002a620sm560042ejc.1.2022.05.20.05.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 05:02:36 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
X-Google-Original-From: Juerg Haefliger <juergh@canonical.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Juerg Haefliger <juergh@canonical.com>
Subject: [PATCH 1/3] riscv: Kconfig: Fix indentation and add comments
Date: Fri, 20 May 2022 14:02:30 +0200
Message-Id: <20220520120232.148310-2-juergh@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220520120232.148310-1-juergh@canonical.com>
References: <20220520120232.148310-1-juergh@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_050239_861256_1854B34F 
X-CRM114-Status: GOOD (  12.87  )
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

The convention for indentation seems to be a single tab. Help text is
further indented by an additional two whitespaces. Fix the lines that
violate these rules.

While add it, add trailing comments to endmenu statements for better
readability.

Signed-off-by: Juerg Haefliger <juergh@canonical.com>
---
 arch/riscv/Kconfig | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..4507847d7c9c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -328,11 +328,11 @@ config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
 	help
-	   Adds "C" to the ISA subsets that the toolchain is allowed to emit
-	   when building Linux, which results in compressed instructions in the
-	   Linux binary.
+	  Adds "C" to the ISA subsets that the toolchain is allowed to emit
+	  when building Linux, which results in compressed instructions in the
+	  Linux binary.
 
-	   If you don't know what to do here, say Y.
+	  If you don't know what to do here, say Y.
 
 config FPU
 	bool "FPU support"
@@ -343,7 +343,7 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
-endmenu
+endmenu # "Platform type"
 
 menu "Kernel features"
 
@@ -394,7 +394,7 @@ config CRASH_DUMP
 
 	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
-endmenu
+endmenu # "Kernel features"
 
 menu "Boot options"
 
@@ -430,7 +430,6 @@ config CMDLINE_EXTEND
 	  cases where the provided arguments are insufficient and
 	  you don't want to or cannot modify them.
 
-
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
@@ -522,7 +521,7 @@ config XIP_PHYS_ADDR
 	  be linked for and stored to.  This address is dependent on your
 	  own flash usage.
 
-endmenu
+endmenu # "Boot options"
 
 config BUILTIN_DTB
 	bool
@@ -533,12 +532,12 @@ menu "Power management options"
 
 source "kernel/power/Kconfig"
 
-endmenu
+endmenu # "Power management options"
 
 menu "CPU Power Management"
 
 source "drivers/cpuidle/Kconfig"
 
-endmenu
+endmenu # "CPU Power Management"
 
 source "arch/riscv/kvm/Kconfig"
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
