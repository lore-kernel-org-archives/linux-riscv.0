Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24840C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 05:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsZUspVLldCS4wen3FbWBVMrE8zK8nLFEG5f4QzuKDw=; b=ZwBKfK2Pkx2BZr
	IS00a4UGWLCzmu66WnAmEV+v/SU4PGeU3I/aw3B99V57Op/lmcLJku1TzngGaq2jvAZiaHU7qtfxF
	W9QUfDJxYQ2gdsaYzcYg99G59gH8fnusIFTU1+YA5ljnUXV0VL4KCT1z+jcj0GegYOn4flJ1rgj2r
	iXT7xt2A1qfqXYntwXvlAYhbmGyp5B8K+4+dKo3HBK6BGhUGWt9EOaFQIZa2ZWLRAg7KHWYZPTy3F
	5MY62wsVWclQYo+GWA5dpMs8KjrYxoI4LMDQI3abs+IDnUuMXVeJdE3bpdEPPUbK2GmgjcGkD2+uR
	32S1qk5c/iuSRDUWFryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bWA-000RsN-Jc; Fri, 24 Jun 2022 05:06:06 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4bF8-000HLu-1E
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 04:48:31 +0000
Received: by mail-pg1-x534.google.com with SMTP id e63so1359731pgc.5
        for <linux-riscv@lists.infradead.org>; Thu, 23 Jun 2022 21:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding:cc:from:to;
        bh=YbFhCGzhKhLbr2G2ThS1s0sN7jwXYQ4vWhYkrXF5osc=;
        b=kkxvDxX6n5CO12HAysNPgLTCaKTovZj6n1W4WM6NrdWPKdt8jHf/gjXiqu7I26pISm
         ua6NuOBU0e747Hkio56Q5FXCk7rSyhq3Y6Zq55CZ25pU97Fj2MfR7zJOcZ41hi7FIff1
         UZdKWwl3KHRXa7tdvTwjrgx6d6+yqM9BG8AZIhTjl1u7f/aVNNosUAXA5LKe9/MYnIvG
         LlPZDl/L+rPWYZtuuiuwai4BFZqZ2PEnrQKWLvGk7JAWOVawnMXlmZxb2Q+2Kgculowg
         wQXZjqI2+6jVMZLja/f8RD2VIlQY6lApwCHArAD4TdMuo1d9XJYF0lETVOugyAaATC3x
         mPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:cc:from:to;
        bh=YbFhCGzhKhLbr2G2ThS1s0sN7jwXYQ4vWhYkrXF5osc=;
        b=YRDoeIqcjpqOJL501xpKFEtK7bld54uP6qWRyC8rcuBmlXO+Nfi74Gd0jrQ8l0GKC6
         0WxhcpjUExAEW6JFdR/8Hgn5NBhZuoHL7KCYZz7JKDCgJrVm/iNXlopsGU+BPEaURcXL
         ZI7D3u8squNvnWZNlNy7CI4M7O8BZ3Vzwxq2z6tXmwMxsvqbFBb87GQ7d37L9wRuPZeb
         UjMo2uUXl3CH6q4GvUtv9PR5WaSEsUx4zKedFAHB330VLqnWUWbdsyBQOfDJD6H1r/Zf
         IQWGEGDz580x2J3ah2oaBDxoc53cKyBtDE//6eb8S8Xkh0nUUQX12rXSTKB2d0ynEUTh
         Gnnw==
X-Gm-Message-State: AJIora9K3e81fsQWNNTnlv+CPF6KTWQmCf8whPqQGB6DrEgzfcFbUohS
	2kvjmEhhzL3SrTyK8gfaa7mTLG+Dd3Q7Ew==
X-Google-Smtp-Source: AGRyM1vJW29/sVxuMxr0tG1PDaIe69h+YLS81Q9kQN6GZXjLMUjcoObBkYAeIvvbIZG+ephEELUDwg==
X-Received: by 2002:aa7:9470:0:b0:525:4214:bd9e with SMTP id t16-20020aa79470000000b005254214bd9emr13914582pfq.11.1656046106909;
        Thu, 23 Jun 2022 21:48:26 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id j5-20020a63ec05000000b0040d2f92d30fsm503488pgh.88.2022.06.23.21.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 21:48:26 -0700 (PDT)
Subject: [PATCH v2 2/5] ima: Fix a build issue on 32-bit platforms
Date: Thu, 23 Jun 2022 21:48:08 -0700
Message-Id: <20220624044811.9682-3-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624044811.9682-1-palmer@rivosinc.com>
References: <20220624044811.9682-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-security-module@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: zohar@linux.ibm.com, dmitry.kasatkin@gmail.com, linux-integrity@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_214830_111282_D815E5EF 
X-CRM114-Status: GOOD (  10.89  )
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

ima_dump_measurement_list() took an "unsigned long *", but was passed a
size_t.  This triggers build warnings on 32-bit RISC-V.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 security/integrity/ima/ima_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/integrity/ima/ima_kexec.c b/security/integrity/ima/ima_kexec.c
index 13753136f03f..f2a94ec3002a 100644
--- a/security/integrity/ima/ima_kexec.c
+++ b/security/integrity/ima/ima_kexec.c
@@ -15,7 +15,7 @@
 #include "ima.h"
 
 #ifdef CONFIG_IMA_KEXEC
-static int ima_dump_measurement_list(unsigned long *buffer_size, void **buffer,
+static int ima_dump_measurement_list(size_t *buffer_size, void **buffer,
 				     unsigned long segment_size)
 {
 	struct ima_queue_entry *qe;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
