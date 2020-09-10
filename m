Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40FBC43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D64D20731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zWXJwkTh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fjlnvVWE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D64D20731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YKwQT2AjIZhV5lYKm1X6LpGgbb8aI2v66ypWVLiP6/c=; b=zWXJwkTh0oWaRAMGeJ6yeA3HW
	AplwLZ74jW3QwQsSC2LF6ud7S1vqIjwEyOKGEYthj712PGh+jBxDZCKw0U+TbTeIvN4O+35ImALB5
	kNSMo8pTXE+hLn2K53TQMKcWYSURzR9Mt8o2NhWqm3A3X+g/z7hCG0bMQ5S+h67k/OTznw5YQw4TO
	2jCnZ2+fuXMEoYvN8BTHby336fSLAsagkOekOh6Et1xcJYf8F80xDqikRzAan3kLjapxbA++BGYZr
	nVk2q6bhryUSb9lvK+Mf/SnLOwed0QWcYKopAOyq6FanHSGegL0QgnEtphzDYcocsiVkP0yCcLA/D
	Mskymv6zA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhN-0008Ft-Ha; Thu, 10 Sep 2020 08:12:53 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhL-0008Dx-H5
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:12:52 +0000
Received: by mail-pj1-x1043.google.com with SMTP id jw11so2674114pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ce1Cr9HrV3tBJGJ0t9KLA6wLyDwM2Je7xNmtW+DthqA=;
 b=fjlnvVWETnC+6Y+qjfA5cxp2pSO4p5quXLwSt7u3BYt+UpJjIXCpGJQmpHNlRoe1Ur
 ReGCCHDG3eDrCXAQ1qnd5gdIE6XCEF/gapf59sQtveWzp7tNInNhAY1U4bMK6sWzumtr
 DDtgf+qvTGdCucfNwSsjTLc3s8wqEJE+hZXFBjQ2rVOkSBUW1ETC2ySxxtq42/oTB3l0
 usTlGg1s8IBGDQPk0k5sCnY9u8FNYOICnBP3bbLXDhwqJITXqrLKOe90QRha1Zdf30wg
 BDuqVBNo3u0KEvuu0lTHInAAeceh3u5NgZLwzxeSsX/E2FOslICQvLbHwxNmsVUFTpKj
 czsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ce1Cr9HrV3tBJGJ0t9KLA6wLyDwM2Je7xNmtW+DthqA=;
 b=G2UE3S20n9A12tbYwxCrII++cQAlkjvNMNKX4gLsImH+B5/pqeCdMCAMSArwSGSyCk
 T06rG+szbUNaQrj1o7ccbw3dg32IisWtFeYT5KSusFDZAJ6QeTbDA/3eXELyQLHyo9y2
 wQ2FCLq638hGucOp9T/n/nPjRb5GWsMH5NzIbiXf82bWoWSZUpTwegFjSpBNiLcxtUzQ
 o76b2wjuBkhOeNWzgjzYRwMoUAdedVgIwLxFyvR/2Km51RhnRRjoRpWZtt4y7/P+8RjI
 sa8bY6gthOwjA8czbaAXpcBT4m6Tv2OQQbemlyWbbXDeJ8rHkDAwCHLpkEntcKjpQ97z
 bHSA==
X-Gm-Message-State: AOAM5304acOFZTr9e2Bn3dn4UEWglxlYSMoxmfYQmmi0hS1Cv32GmpIp
 LaQhc7tBZaH2O/5pOudrR+CMAQ==
X-Google-Smtp-Source: ABdhPJyai65Py1TqV8L/FUFi7cDFWoYRXd06+l/aYPNz2PTenCCc6YnHYzuHIjhwTD/+WiZw9JWlmg==
X-Received: by 2002:a17:90b:20d1:: with SMTP id
 ju17mr3970913pjb.134.1599725569405; 
 Thu, 10 Sep 2020 01:12:49 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:48 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 06/21] riscv: Add has_vector/riscv_vsize to save vector
 features.
Date: Thu, 10 Sep 2020 16:12:01 +0800
Message-Id: <d5aedcd12c8a2f777063fec8926ee396d1e263a7.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041251_590935_980437BC 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch is used to detect vector support status of CPU and use
riscv_vsize to save the size of all the vector registers. It assumes
all harts has the same capabilities in SMP system.

[guoren@linux.alibaba.com: add has_vector checking]
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/cpufeature.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f11ada3fa906..4d4f78f6a5db 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -21,6 +21,10 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 #ifdef CONFIG_FPU
 bool has_fpu __read_mostly;
 #endif
+#ifdef CONFIG_VECTOR
+bool has_vector __read_mostly;
+unsigned long riscv_vsize __read_mostly;
+#endif
 
 /**
  * riscv_isa_extension_base() - Get base extension word
@@ -149,4 +153,12 @@ void riscv_fill_hwcap(void)
 	if (elf_hwcap & (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D))
 		has_fpu = true;
 #endif
+
+#ifdef CONFIG_VECTOR
+	if (elf_hwcap & COMPAT_HWCAP_ISA_V) {
+		has_vector = true;
+		/* There are 32 vector registers with vlenb length. */
+		riscv_vsize = csr_read(CSR_VLENB) * 32;
+	}
+#endif
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
