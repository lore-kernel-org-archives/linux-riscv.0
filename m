Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E829AC43217
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4q4D+85vjoptBkwvU9yalKvB/5SPollxIRXoQ6xXgc=; b=lDW6fBgj3awGH9
	/wuJzCBiIVGj1D4a9ObjFTif1UR2o7sJgrISMADYJal6utZd8YW2jR436841JhkmFAm+tm8E9MWff
	qeM93NCx//zrp0C5Y5e2a9r7v285m8MNIzg7Ubb3s6iUrH6T9f7ZfH5Ag7UPd6OmsWqdkFKHFnInC
	y6qXcREMgziSnojPFZmIczj0Ene/oE75XiHM8cVWn6eYSrdNrS+QqfZ3Y2qhc9gSC720C5DTOWnRi
	aA2vsPYc91Ti+N7eQfjIecEw16xJuVafpfQuB+c8aL/GJmd3F6rIxxMqH0Ysu8aXBPrHXfVEE2rGM
	G1hh5F7/0dErDk4yNOzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns4oy-00DJtU-OQ; Fri, 20 May 2022 15:45:44 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns4oe-00DJhw-Un
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 15:45:26 +0000
Received: by mail-pg1-x52f.google.com with SMTP id z3so6558470pgn.4
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 08:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=avELjSEfO4YwxdS1hy2OFqCYNIZpTM4Eec2OkZMhhf8=;
 b=uzwPDcC0XNDiwV+Mifx3alyGqhvqonpDCfcELm9PIplNCWzW/NqPcz7dO5AZvP9aD/
 9DftJ2uI7dj8WLDMyULQL9Mzmc1Sw3yvKBYHDYFq5mmlt9/FBMk4iD2EQWZueEc2SOPY
 XVhWu4TTcLkAOsWufKOvZedwA75506ErlcRUoG/dg5Yzf/7w2VdM2e5A3R0RG/jQrebr
 WUB0GKOJ4kmaKKnMV38ouro+kV5lD5ureu3IhSzvLXkIPBO/tOcRZZnJcLQKaOJ4pIFD
 ivVBRmb/1LPO2IfDj8CG9AXLvr+6Wf30+Cf7gop/trMMi003rY5ezCy3QBoYTgXe1rFB
 h7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=avELjSEfO4YwxdS1hy2OFqCYNIZpTM4Eec2OkZMhhf8=;
 b=c1ke/2z7JAll2KHmwW83GHjPowk9lhaZbea3GZZ/AzJ4q88nbmV1sHIdblU+hTg+yW
 FZjLcLKaXCfIE+DS9BAfE+aJihAJRPk+SjJyLSZuohkx0E+xcSugqGnskNFKClCm8dwd
 FEJ3lR3qEm8Gl3Orv3GujY3TyL4g36hIGiGaKrV+Ato6S8lNy+D1hngGVH50iPyN82ud
 cOIBKGiRcG6oPeebDIETqcRto3GWV7ReXP40qHQzj9AdY5o79oYYoSC9foFMLz6PNUc6
 Zhjy6BTH4hzBfu2QwsuTTgfO7PLQieSoH8Bt99ZQDnQncsaKFw3GO4WbhAb5zBqqIXQl
 ypeA==
X-Gm-Message-State: AOAM532xi1vgFQZzQvJjNylQ3uyup8EEFoDhRxUmuY4xD5ITCyzS1Yac
 sDdFUL6Lh+Uz1A02EoYsoVSHXw==
X-Google-Smtp-Source: ABdhPJy0cSSVWa5pAf0mHY5fITaZVq1V36HgsUtNvAxSOP+5C4C+/tqwdW6Q0EnMt1H6wgdEVX6jxQ==
X-Received: by 2002:a62:1413:0:b0:518:4259:200e with SMTP id
 19-20020a621413000000b005184259200emr8368526pfu.41.1653061524395; 
 Fri, 20 May 2022 08:45:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 t10-20020a17090340ca00b0015e8d4eb29esm5596985pld.232.2022.05.20.08.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 08:45:24 -0700 (PDT)
Subject: [PATCH v1 1/5] drivers: of: kexec ima: Support 32-bit platforms
Date: Fri, 20 May 2022 08:44:27 -0700
Message-Id: <20220520154430.18593-2-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220520154430.18593-1-palmer@rivosinc.com>
References: <20220520154430.18593-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, robh+dt@kernel.org, frowand.list@gmail.com,
 zohar@linux.ibm.com, 
 dmitry.kasatkin@gmail.com, jmorris@namei.org, serge@hallyn.com,
 liaochang1@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lizhengyu3@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_084525_064907_A0E3015A 
X-CRM114-Status: GOOD (  11.47  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

RISC-V recently added kexec_file() support, which uses enables kexec
IMA.  We're the first 32-bit platform to support this, so we found a
build bug.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 drivers/of/kexec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
index b9bd1cff1793..ed3451ec2b24 100644
--- a/drivers/of/kexec.c
+++ b/drivers/of/kexec.c
@@ -236,8 +236,8 @@ static int setup_ima_buffer(const struct kimage *image, void *fdt,
 	if (ret)
 		return -EINVAL;
 
-	pr_debug("IMA buffer at 0x%llx, size = 0x%zx\n",
-		 image->ima_buffer_addr, image->ima_buffer_size);
+	pr_debug("IMA buffer at 0x%pa, size = 0x%zx\n",
+		 &image->ima_buffer_addr, image->ima_buffer_size);
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
