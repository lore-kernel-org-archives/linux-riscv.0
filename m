Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79EC6FA99
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RQav57HYEjHiUh71H9drMqEpCeWlyIj9Dg2Kh1PLdDo=; b=pp8mks1ucjmiun
	fzG8dUijgIxpgOeOJ21qHrlVLuXbIVa8/PTazAoCtSWlYWx7Z3qGsgvFI7O4yMbA2GVn4M31no2WK
	8G2+OHcOqyQN9cUkWd1excEpjKtp28oepc1UCqY3sVCMRLRV8JxVnXS5FnlVN7+3hUK5hmz3o7DR2
	fIc7pMqaWEaIy1ENlJ9uSPn/KOLv9a7RzRCuKTtLYFvX/ye2XQ2kQ6DnNWrtLxSQhMwg3HMuGRPYC
	4kTYqagQfmw68gLc+J+yCp/MUeJxQz+sv6vrRRUNbysj1sVxxBdzzDzOuTTZydOsbbmbjOPfOGvF+
	/LJ8gvZsObeKMfAkFJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaXW-00EHk5-EC; Fri, 10 Mar 2023 11:03:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paaXT-00EHim-CA
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 11:03:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id p6so5206088plf.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Mar 2023 03:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678446231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XleH2qRgkAjKfAnH5lQK+hOVQ6pdsI7iaFiOV1K3KNM=;
        b=XiDRYO83T5IVLmCtEQZzT/BbHCGItwcuH07SlSFOmcpngXMzlga/wCh7ysxNP/A/YE
         mcmmyycGgxwXys5FmYygNt+dHSwtRvgQCTBpLCDkhKmgMk9zL43qMYMTK8ghH9WC3Pto
         pwsC0jhjGGJ8w8mjTBLpZIgDEkjF4nvpIhLfKyYUMCJVbZ6Kj7LMbhOBSSJFvZcd+w9A
         4/yzqWqpiav55hJxJEbgCWoLuygmsYjU25r+HK78EDFbURJC8sEEhsPiu3cYyar5h60s
         2tZPNiCKcwM6l9e8egZz5PlLwmKjvdkEdPlChyQklWegJw3SkLY7kFR+DZNDgrThPcwZ
         hl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678446231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XleH2qRgkAjKfAnH5lQK+hOVQ6pdsI7iaFiOV1K3KNM=;
        b=VBf8bezjYGyPqCZjUsMcilaSJEurorUG3p2sciVP6KPG2RTJ2Z4jMwGYM0BEElcCWc
         bHnPJ4HIfE150AHSnuq1CInDF15xDJ/MndepMWXVtS2CVYUlN5wl0UEG5YnE+fKsNCr9
         dwTHTOvwbV+4bO5EKoZPABGLaVPjMMDxkv4S+WlW605A1PjpYFchamKHfFFGebc3mhdM
         JuWHSfkLoEt//Funi/WlRmDbq1pG5fgkwOEGmfz9ROtaQl5xfpqho0mT4P1CGTK80xWy
         oAIi7Lo7Wmiw9f+DfLFi7kVl7E+g5JA4HErVMW4GSF9Rr/LIHuWbOhxeYdXF5a5V6ctJ
         ye6g==
X-Gm-Message-State: AO0yUKUUj3BshZvdOZ0Eiw76nwITLdiz8uzgWfQ3sLWxgPbO/dxmtRGO
	P8ylDZDZgsXjRizVF5D14eI=
X-Google-Smtp-Source: AK7set865FCFoop9BrawhZE2HX6WtNHrkBhZoeCOU2feBTrWr6GfrudljpNqhP6XTj11I6XM2ExoYQ==
X-Received: by 2002:a05:6a20:6909:b0:b0:3329:c395 with SMTP id q9-20020a056a20690900b000b03329c395mr2409010pzj.30.1678446231342;
        Fri, 10 Mar 2023 03:03:51 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id n7-20020aa78a47000000b005d3fdf7515esm1171477pfa.81.2023.03.10.03.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 03:03:51 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] riscv: Kconfig: enable SCHED_MC kconfig
Date: Fri, 10 Mar 2023 19:03:36 +0800
Message-Id: <20230310110336.970985-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_030355_451010_58A46118 
X-CRM114-Status: UNSURE (   8.93  )
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

RISC-V now builds the sched domain based on the simple possible map.

Enable SCHED_MC to make the building based on cpu_coregroup_mask()
which also takes care of the NUMA and cores with LLC.

Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/Kconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..5b9fdc1a619a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -320,6 +320,14 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+config SCHED_MC
+	bool "Multi-core scheduler support"
+	depends on SMP
+	help
+	  Multi-core scheduler support improves the CPU scheduler's decision
+	  making when dealing with multi-core CPU chips at a cost of slightly
+	  increased overhead in some places. If unsure say N here.
+
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
