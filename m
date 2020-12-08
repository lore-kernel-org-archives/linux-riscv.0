Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCDBC4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:27:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F49A23B98
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 19:27:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F49A23B98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R9qVR+6b2f3TcO1ZZkx1a5XFisSA9UXb883Ayv/3YY8=; b=YCYroSm46nJz+etrUcwoWsYkbf
	3aijEt2mwgBzasqze0krM3OFRIBYarMWznSpBBIrpSdhQkITmyoXTSLFxBrPpd3Ew8N2EMB3eMw3H
	GDMq/MpKQTCHIu2xQGdix8nINY2vuE6nKu9h92JQeJCshJpZc0fXEjZ6Yp5W7U1Y2gBiQC7NxNz+r
	li8oL4cY3QIjaSzjJos+0Akg3IEM7a3+eno4ZdxH4+W5ZHk15Ffd3b21ekcj07TG5QcUOBdOIVVgF
	X2C2oR4wfYp6XkXUYx9p8ulm+FyNTf1K+baGO1eZ6m0MWBpCbEBVLBc2YJtDPDurEQ6LkGZpR7DXg
	wRUmBbyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmidk-0006pK-8e; Tue, 08 Dec 2020 19:27:12 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmidi-0006ol-BJ
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 19:27:11 +0000
Received: by mail-pf1-x444.google.com with SMTP id 131so14827594pfb.9
 for <linux-riscv@lists.infradead.org>; Tue, 08 Dec 2020 11:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=fZWRBqMLt3ZPZkgUIc9kLPx8f58u7U8yzXzM7lkor2A=;
 b=O624UBNYJNZKB/KZZJNSkEJA1L+wVMQdO7lVR1NfDRxmNLx93SxXKhdPDKbLgGV2T9
 /7Ab9E3VOBjRWT3z5WJQ4+ZhxVulPJfiM2eMUJ1Hwwhql11qEbteaRPYK8nRgn3ME1kV
 VsR//YMPIgDfJ90LMDfhhSpZte8M4m1AOP21j3UBWyqsGJ+4chOfh3FBdOR4OTVp6AQo
 vY1wTe6jJe5syZ0vkHg3yAtK3U3oA6psrDf8RzOdgOIW8IjWuRf1j5BPo7iyIFByv7U1
 ka/6ql4v04MmsZ5hbtPOq08LudzjIXthtXlgBRI0CnNAuOGPNidN13pIZM2dIrf4qv3L
 ukuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=fZWRBqMLt3ZPZkgUIc9kLPx8f58u7U8yzXzM7lkor2A=;
 b=a5q4txIifcGOboWefukWP7sfvE7K4Up21INuiIuckxYwjWDodD/qi5G8WMa6Oa+7d/
 J8xjt/TX8hG1HMhqx9g6+IhV4Vn8gSfI+/OVcBWiI14bb2tmTu1R94Jzw840LC7ElQuV
 t9okOdqrRu2FQV11WFBZEXsE1QX1jDAGUNYC1TX3yua+WJWUaRqJyt1kYU8eI55rkhDM
 PPO9yBQ0OrJUgGEy2mriB6M1An4pc08/Qvk8CX5pcx41I3cUstRmlBBoVLQtiDBbQivY
 3EsXSjZuUwvVEWgCI2nG4093FBHgKKGrSanKee90A7Rn3gwyFzhDWMG2mITfOx5qd00c
 7xaw==
X-Gm-Message-State: AOAM532Sf4MJhmBkSiwIRDJWgwW8JileYlpn5tEMBH0KQdzLqOWw6NX3
 N/pbJS8auFX0oVSQvo8Er68=
X-Google-Smtp-Source: ABdhPJxD/Pd8ltpyet/A6OhPKlKdpTnc3xRBFQu8XHiYAaCMZb+LHhtH1XsRZNbOXMxynNQEuhB8mA==
X-Received: by 2002:a63:3714:: with SMTP id e20mr10365494pga.410.1607455626970; 
 Tue, 08 Dec 2020 11:27:06 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.179.87.107])
 by smtp.gmail.com with ESMTPSA id z17sm4121825pjn.46.2020.12.08.11.27.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Dec 2020 11:27:06 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 guoren@linux.alibaba.com
Subject: [PATCH] riscv: Fixed kernel test robot warning
Date: Wed,  9 Dec 2020 00:57:18 +0530
Message-Id: <1607455638-4436-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_142710_393035_1D1E8EFB 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Kernel test robot throws below warning -

   arch/riscv/kernel/asm-offsets.c:14:6: warning: no previous prototype
for 'asm_offsets' [-Wmissing-prototypes]
      14 | void asm_offsets(void)
         |      ^~~~~~~~~~~

This patch should fixed it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 arch/riscv/kernel/asm-offsets.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index db20344..b79ffa3 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -11,6 +11,8 @@
 #include <asm/thread_info.h>
 #include <asm/ptrace.h>
 
+void asm_offsets(void);
+
 void asm_offsets(void)
 {
 	OFFSET(TASK_THREAD_RA, task_struct, thread.ra);
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
