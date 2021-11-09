Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302BEC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6CC611F0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA6CC611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rcb8B0NWSJUOXZAsyopCt/YPjGsdLy8ooQaWgqoDl3U=; b=RBQAHd7nIrUSTK
	8iwtnYyFEVTGfEWCOe9J+MW4F8NB21lV6TD0m34THOZA+fwUs2QHnsnhu+ub6MY0vnOgI4CS2pdEg
	aWpWbZFnLcpLFmKThZpqggmjQz/iad1mPzL3sVc6U/Qy/CpaHRK7Lw0PYUR6qerdIBigs/UaL1yFT
	yIegN7wYim1xL7I0gW0CUz/AD1ptQ8Wbhpg2Gl3Xcp5T7pxKrV+cFjYKPSNMbKMeekRQ9uNxcLRbm
	DQuxGvfo+Z0r3vyREo66i0ZudGGlRjLTmhBUsAwx71BB4Fgf3rMY/qGO9nkK2BxA1snrPb4FbIrcT
	ukVzL2+WNvx1UsKXh5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNmD-001KGD-N6; Tue, 09 Nov 2021 09:50:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNk4-001JRS-Cb
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:48:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id t21so19924805plr.6
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SzySQXHTaCH/jeJ8V7t+kf/QD6+VmDcSCT1AxKS8udk=;
 b=JFuz72h/+N7c9t70d7T3be4Wf2/WOwpEDM87a3jx5Y8UkP9s4PS74W0/N9ecKeA9wn
 wyv+tpboLULvJnx84ld7EiAVabh11TKwqf8dTejkIPTGjZqMwl5KhiU17dtWrsauM5vw
 qwBWxCHa9bociIUzBCCdBWs1eqxGJx0i6KCeMpdi2rlB+h3EuC+GiC6gSMl59TxGb0NI
 t52sgrBNAeiofAV85guN03HAL1Mnc4ioItC7sWJitkyiIPShvQ1XYEbhM3Z6i37qUulH
 bWpTjVE4tiEyuvOIwWqjGlbuFVQPFoSHJmaJtfRYdEOcH0UMlhRjhDwpr9Ms8p2gVLZj
 aZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzySQXHTaCH/jeJ8V7t+kf/QD6+VmDcSCT1AxKS8udk=;
 b=r0mmEaXxUwIH1nLeb4jHJLu5sv8oEoBo71Mspw3rUed1ngAq4nWAyqhjIK7rEPrM5p
 qVpsqee7E9kZsmoCRYq5ZgNWEBe2lcapGUI/S8o4zzOQ/W7zZIsNYT9Y8qmuT05oZiVw
 WBvPLV3V1p8rmUM1gklM02K8h2xwq7LNW92UrXGXtCNiBWwFTqOsJXKfIlTANyxEp+6o
 xvUo2+F0F7QZz4KSF4cx2OxWsDkImz27cWQG8AVxKGM2kZN8+bYAlxGAeejohKntPJDU
 c+Gw0fUdEYGgWxVACrC8yL7q9lBcoLry+FmOf3EOZ921IkYCuXYc76TUBBDBfnR7ZgX+
 N/0g==
X-Gm-Message-State: AOAM533j7mJoclvwUWkiGPuuVUraX6YrQYTgiIBBSUAUDrSWI5dOipBW
 4TeeTH0nv59TqCJ1uLDrzh/sfjzuLCSqLQ==
X-Google-Smtp-Source: ABdhPJygDxGYUIR7vhtU/P5aTvMHEW0mnI1Gtq1FZCTF/RNDB3IDrD70htt7KuWh5VeCLXjvqPK2fQ==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id
 oa4mr5765834pjb.179.1636451315544; 
 Tue, 09 Nov 2021 01:48:35 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id cv1sm1940511pjb.48.2021.11.09.01.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 01:48:35 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v9 02/17] riscv: Rename __switch_to_aux -> fpu
Date: Tue,  9 Nov 2021 17:48:14 +0800
Message-Id: <8e02819b9f8220f64ca43c330192c20594903ba9.1636362169.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636362169.git.greentime.hu@sifive.com>
References: <cover.1636362169.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_014836_480107_88848D49 
X-CRM114-Status: GOOD (  10.60  )
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

From: Guo Ren <ren_guo@c-sky.com>

The name of __switch_to_aux is not clear and rename it with the
determine function: __switch_to_fpu. Next we could add other regs'
switch.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0a3f4f95c555..ec83770b3d98 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -45,7 +45,7 @@ static inline void fstate_restore(struct task_struct *task,
 	}
 }
 
-static inline void __switch_to_aux(struct task_struct *prev,
+static inline void __switch_to_fpu(struct task_struct *prev,
 				   struct task_struct *next)
 {
 	struct pt_regs *regs;
@@ -65,7 +65,7 @@ static __always_inline bool has_fpu(void)
 static __always_inline bool has_fpu(void) { return false; }
 #define fstate_save(task, regs) do { } while (0)
 #define fstate_restore(task, regs) do { } while (0)
-#define __switch_to_aux(__prev, __next) do { } while (0)
+#define __switch_to_fpu(__prev, __next) do { } while (0)
 #endif
 
 extern struct task_struct *__switch_to(struct task_struct *,
@@ -76,7 +76,7 @@ do {							\
 	struct task_struct *__prev = (prev);		\
 	struct task_struct *__next = (next);		\
 	if (has_fpu())					\
-		__switch_to_aux(__prev, __next);	\
+		__switch_to_fpu(__prev, __next);	\
 	((last) = __switch_to(__prev, __next));		\
 } while (0)
 
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
