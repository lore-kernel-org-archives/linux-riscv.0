Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022CBC433E4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 08:32:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2B8A2067D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 08:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jnJrtr2h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="C+V70yBj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2B8A2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vlim7sRfsAoDmscAYnUtJinuPNyh4iKdh5ubzEkTddU=; b=jnJrtr2hAUtnC2ZUyRGS1oMvTG
	X7KDVLn7ZTwa15a7z/VLHZJxhjzYV+s+LYQ2LR+njvTT6ki6ijoLerofjlDntyZfz1qJocH6ghOJT
	ojGq92TnMn3w32b9bxeTtA8KPxvlMr/viHgzjJAIK4K6FZTeseN9Uj9Wa/V3c3R8HQrARFd6GODXI
	A11N+mytTiPkbB4Evx/CZjDbxlOQagxqKZ1exvVMGeHdp5QoIoGsszqVPwy+gwFSK5oSIlN3h0aAQ
	RRBm2WmkeRuOl7B9EEDBRvvzTmxwLJ+oXe3PyQr54dYNkWmfP7/XgyPDq8ZhLt37wVkg+XpVG6CwM
	2YUj+Jhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jutt5-0005T6-WC; Mon, 13 Jul 2020 08:32:36 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jutt2-0005RY-WD
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 08:32:34 +0000
Received: by mail-pl1-x641.google.com with SMTP id t6so2051370plo.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 01:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=do0EVSRhYwXWvYQE0QpCvGcNm4321TDk7C3/zMwSA+o=;
 b=C+V70yBj/ApmniBn0ppc0pMj++AoyBJpCWdsTQmKqGmy9px2OBUK/WeWHbzcrLcSkl
 x/jFOUbVTmuofDe3Z2UNTUD1rA6WhfyjVgu+SjoYLSMs/RhipvTUW6sxgbOsH4GIWuK0
 wfXI9lgbAq7jzbJyFIelA2QHxw8zWfaoCNpADloUCsYBVLGZ33CYO2glZNUBaDYy72iM
 zygrBzzXOIbtnna+ikduCz+ae0NIq9eJQyTSpEFJplbHsv2vdH/QYlJFBdaTnNQjYY3S
 RMeLUbCmWVt7j85uZxfoKLcHq9cWzNrjOltfgAQu4XEfH99lkoibIIVozlOXdXrfJWew
 PaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do0EVSRhYwXWvYQE0QpCvGcNm4321TDk7C3/zMwSA+o=;
 b=bbkE9INNqqguetxT+YMAlJaHv59o0r5lM5LOcxf/TcFx7S1H4J0+S4S5YM3DrETL0C
 h9/avmLkcoyTp7Bvm1VgJegZJHSQDVUFDSrQp0HfxLU4RM3O686GOPo3SN7bQ/FdGv+R
 rJ29wQ8PY2prjenNqtRK8ToA5FwwAkLA57QcvK8LGunyd9xdeP1CjOwcPA5Ev5sm9+XY
 MoVakMZSEff13i96szPdBuKxUlbw5Jv2s5l4i5hPe/S0VE6g3yIOIbm9VClL3VbwxcAZ
 NWJSqqOjuXneuVsD5AlZTs+5CfAqwFGBFYZTpHSk4usfcM091qPb0sUNQ74tyFI7oi9x
 kWXw==
X-Gm-Message-State: AOAM532h3RC8aivl90H/y0rsxFMnKgslpr7rTEFSoZDHxYP4r4aUJtDK
 3vJv4pXc6vQDOcM86PlRrmVSvA==
X-Google-Smtp-Source: ABdhPJyWY/4DfB7JskEyEBofMSG32V0Yik7AVH9GtgHNoR+If9MXl5zqVwxatmpMqKw+u9TN7kSR1g==
X-Received: by 2002:a17:90a:cd01:: with SMTP id
 d1mr19147072pju.212.1594629150596; 
 Mon, 13 Jul 2020 01:32:30 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b4sm13603678pjn.38.2020.07.13.01.32.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 01:32:30 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [PATCH 2/2] riscv: Simplify the checking for SR_PP
Date: Mon, 13 Jul 2020 16:32:16 +0800
Message-Id: <4bac52941700cd7b714a41606df7b53f4cf24824.1594629047.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <742f0a82a9d4ab62d8616784db5a88a95d8b5389.1594629047.git.greentime.hu@sifive.com>
References: <742f0a82a9d4ab62d8616784db5a88a95d8b5389.1594629047.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_043233_058859_F180CFFF 
X-CRM114-Status: UNSURE (   7.48  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch simplifies the checking for SR_MPP and SR_SPP. It uses SR_PP in the
code flow for both m-mode and s-mode then we can remove the ifdef here.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/entry.S | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 000984695cd6..597beae0d238 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -210,13 +210,8 @@ ret_from_syscall_rejected:
 ret_from_exception:
 	REG_L s0, PT_STATUS(sp)
 	csrc CSR_STATUS, SR_IE
-#ifdef CONFIG_RISCV_M_MODE
-	/* the MPP value is too large to be used as an immediate arg for addi */
-	li t0, SR_MPP
+	li t0, SR_PP
 	and s0, s0, t0
-#else
-	andi s0, s0, SR_SPP
-#endif
 	bnez s0, resume_kernel
 
 resume_userspace:
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
