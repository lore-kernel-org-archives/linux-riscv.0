Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04617C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqZ3DLAeU6rwHQnMvnH4NQgvtm2Blhk1P/reRWwOYtg=; b=rza0DYIJ1GuYb/
	WWbzMub+gIa5F/byMpp+p3NIsFPgbeC3lkMVOyazS/n9MbZCxDNVacbVq250ywsjUZVvXvJNS3Tct
	21oZmexP+lKh73ep+azDDVhmVl9TcgKUtny1LGPU7CdqRjagFucO0/aMz4OXsQ5riOLGQxnJbfVoK
	CSYgzJ9z2ErHKyU7B676SQPuyrXg9nwxM2z44jE6DlBLSn0drG27LIZ2hKpALJU4asyt8NpiXr39b
	pGr4O+wBLDze2L6JUPo2HNzSLd0uz/03F6Ljqsusk2R7WYUTMChujchsQsA9QUOnjVTNp4eTYFCHK
	k3hQxJcFyj+dNRVQfuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAT8-00ELUB-Jz; Thu, 26 May 2022 10:11:50 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAT5-00ELSx-HJ
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:11:48 +0000
Received: by mail-pj1-x102a.google.com with SMTP id w2-20020a17090ac98200b001e0519fe5a8so1324897pjt.4
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wbBG7lEDJH2LFVXucK5oQ/R2hCfil/fSiH5Kza4Gi8k=;
        b=V5XR0cYmYpPHz45TXlrQdMJrLi9mC6lsy2W+x/KJ31gATxWb3Jcl0MrAB+D24bI7f3
         4cWVas5pCyylxxCZLBWe4mQfSoke/VDU2WYlrymgElTYZAOaG723fCyOoELiQShkPJOT
         1JZwGsy0Lp23kfxFyXK4dhbP3HKfGwYOKkJB0bxLkU+akzyGUbizbF/W22JUzStz/kvb
         /YZE17RoALpfuH1WSU7xai3fAWdlXw2P6hUoIe1PwT4W09BwfsX4JWi9svdHWlFZSnTi
         XZgvOErgNi8zbTcAf6Ej1LPhdSLC9CuCpS7dDMCmuN5koT27cwVrnYTiCV3TrhPaZwT8
         /aOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbBG7lEDJH2LFVXucK5oQ/R2hCfil/fSiH5Kza4Gi8k=;
        b=CcjQSivyNCUZE6DKloT3ZD6TWGeI0i2F4sYlQCEc4fXeEQMLFoFlkLdKN1zyxrzY0X
         XFLutoJnmaUr1AP+WAApgcLt63tp5n0AtnWNs7Ydrf3p21i4EeJjoqjPATjE72K1lECI
         hI/yg9WG5s2emEzGIp6OorCr/jUOOxPMdHY63MUHkQdj3Yk7cDx6PCOqDW4Ak2kV5ULN
         NmjfHUJcU5yyScgY4VwmWdpdO2/UqIn8vcW0q0+JV+/ElM/kqKVhchX4OgEa0y0I2lwb
         fSYl5l5IB1zCOot68ckbv5eBLhOH5I+Cv3HVXpUUHX7b2yG+q69k1CgGRywSQtx5G2xX
         HF9g==
X-Gm-Message-State: AOAM533rpdAYDEDoVJnDRuztLf1IA7HWUyMpnTM6kKVSAKzNFAfF/bis
	X6LefFvMLdDWdV8COmSQXoTQiw==
X-Google-Smtp-Source: ABdhPJwr+qQVKMcopGMW+cRM74SlJB+kkVtaSsSNVzIL44tSlSNiDBT302sF2fUP6vTOWuit+8GjCQ==
X-Received: by 2002:a17:902:d50e:b0:163:80b4:30a3 with SMTP id b14-20020a170902d50e00b0016380b430a3mr937520plg.159.1653559907098;
        Thu, 26 May 2022 03:11:47 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:46 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	stable@vger.kernel.org
Subject: [PATCH V2 2/5] riscv: spinwait: Fix hartid variable type
Date: Thu, 26 May 2022 15:41:28 +0530
Message-Id: <20220526101131.2340729-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031147_586968_EF1878DE 
X-CRM114-Status: GOOD (  13.63  )
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

The hartid variable is of type int but compared with
ULONG_MAX(INVALID_HARTID). This issue is fixed by changing
the hartid variable type to unsigned long.

Fixes: c78f94f35cf6 ("RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method")
Cc: stable@vger.kernel.org

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/kernel/cpu_ops_spinwait.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c b/arch/riscv/kernel/cpu_ops_spinwait.c
index 346847f6c41c..3ade9152a3c7 100644
--- a/arch/riscv/kernel/cpu_ops_spinwait.c
+++ b/arch/riscv/kernel/cpu_ops_spinwait.c
@@ -18,7 +18,7 @@ void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
 static void cpu_update_secondary_bootdata(unsigned int cpuid,
 				   struct task_struct *tidle)
 {
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	/*
 	 * The hartid must be less than NR_CPUS to avoid out-of-bound access
@@ -27,7 +27,7 @@ static void cpu_update_secondary_bootdata(unsigned int cpuid,
 	 * spinwait booting is not the recommended approach for any platforms
 	 * booting Linux in S-mode and can be disabled in the future.
 	 */
-	if (hartid == INVALID_HARTID || hartid >= NR_CPUS)
+	if (hartid == INVALID_HARTID || hartid >= (unsigned long) NR_CPUS)
 		return;
 
 	/* Make sure tidle is updated */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
