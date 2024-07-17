Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45160C3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 04:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+0Xa+DEj20MfnuD3HA3haNW5t4yAyNGxt42KYmF9sgc=; b=LtqB+kjuESB73y
	jlYFrye4ShscXzPZeL7/ELaJpWaXg5kQL/zQ6rpWrARkoetG7+OPPLb6V2i/MCoV+EKVWmG67UdN/
	KRVRNR85bZvR9tD0J0FOnwSpQRRbbEl4MWTntfl8yqgVZO3AY9VqmiJOjLJ2tXb5QDYcl/+gXpiB3
	jAZXfOSZoBE0u17hDPxEJEYjjZJgXF0lon6Sdd9OzsFSWv1EM+8aXc3yZdTGZThyANFPK0LQ0dVGw
	DHLoDzgsAKV5M1bCdF2dWR1YVdkAXaSfN06m5vDoOWub37CqOh782Oj5Y8sfpitkKAlfz0hOUSaZr
	eBURf67hxCZQ8fU28PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTwJG-0000000CcL4-3XrN;
	Wed, 17 Jul 2024 04:30:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTvAV-0000000CUi4-2x3h
	for linux-riscv@bombadil.infradead.org;
	Wed, 17 Jul 2024 03:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EWFTiGO2f2frr9eRub/zRL4HHqNe2quijaeDAf3euww=; b=HNV5P6Dg0HTz6jTRUY0c90hM2F
	7qdzRkpZxa57bKfGapbcAu3+zfk7ThtK3xNM/bOfqL4aX3VEflGBqr+q8NFDsN/S3IkC+7ViqR7ZY
	WQqVH7QxxYRcLho6OXGEhSDQyNjy9RvN4H+D3sJIwflruv+lzWqpw3I3/Xil1AVzk9uz1cWHgSQqT
	N9GzvhxKNP9RmEpP3dqAlPoxwzxpx2maN/kj4CTCzU4NazL1CsFrTynsVeZNnXwk6HLznIxd5BZBJ
	lJ9Dci0oFchHufwdF4+Qmqef9dqTFEkItfAJie0wJEUen8q2okq7yjLrHPm3QZQxySlf2lLa+0puu
	gGYfQWQQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTvAR-00000000HEr-3YeF
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 03:17:26 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70b0013cf33so4639200b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 20:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721186240; x=1721791040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWFTiGO2f2frr9eRub/zRL4HHqNe2quijaeDAf3euww=;
        b=GrOIPQizEjFs3u+8/131Bu03y0nTLueuj34ZRt64NtNN28lgETR6imWIaRbcM5gyQU
         egdIqJCzusXh583C/UTYtSgs6I/YxvdxY/E5zi/xWNd1DUs8YvEpYA0oruGMq9HQs48D
         SSDs4HnmpWit4oK8Xt3v2OgokUo+Q8vufy6Of6pFopo7y1Sh4aN3dDqXWgREHMX7m75y
         w1qP+Gvf4qTayg2yhgSQdaGyHzn9QWrOk1evwksb09T8Xq0muACNMxud6KlFfRXF6x+x
         HQA2rBBObqlcA7B767/LTUfZnz2Ijs35en70u65AYiZ7G0z7pDCFJugQ4gGOy/CK61iV
         GAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721186240; x=1721791040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EWFTiGO2f2frr9eRub/zRL4HHqNe2quijaeDAf3euww=;
        b=fnmyLnDHuiDL8T0c5VmlGLbLT6ptsWEuAknoofLQvTLSu5+qtv8aqpSGw9vVtytuEx
         e8dMHdLARhizeNVoxklFMS/86HZS6+5gEholv2Cbbjq1ejLVsyBGljtjqiUfwhfbo8ee
         RaRYm+1u1IYYH1phwKiz3qRx85cO4BulgA8lPDMA5QCTJGDUPcacH+vev2rJJ1ychw0X
         gyeiXH6XpldVwavgeXYG4od0j+vwqwVFuTlbSItOBmBghQilIKz5wRqLYa3OxBiiIV0g
         i4bNj0pK5IUsDYtaI9LwdCNQa4aXoFia2Qm4fd3YSHbuzv/T9nsMcmTnXWN/imi8H7VR
         PLYw==
X-Forwarded-Encrypted: i=1; AJvYcCXOX7duDv4H8Tt8Cu/Cy7LhggJWxKDp+TeTmN+g7aMcdu+elMmog3XppGuYxK9jf5Fc5Q+gKu7fUU1Et7hPUhxkqtXqeck55+y88fz4X+kt
X-Gm-Message-State: AOJu0YzQrq6LpCmASUGqOZ+cbxmWLm3h/1l+x6jeSPiWQLgcipnZYG5j
	db9kJAtp3oKuEPFc867lqXojdLqX4OacICefiu5ASDD3XkCRkFTTyI82ZayDUHY=
X-Google-Smtp-Source: AGHT+IGGGKe/YDY7Jqbt+uu0lBcnWReQ6Ngm795GpgDGZAx/hc0Kd5oCqQl26XxwWyLa4NjoXv1cdg==
X-Received: by 2002:a05:6a20:918d:b0:1c0:e9f7:29da with SMTP id adf61e73a8af0-1c3fdca1d6fmr668586637.24.1721186239453;
        Tue, 16 Jul 2024 20:17:19 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bbc4db1sm65392615ad.112.2024.07.16.20.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 20:17:19 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	peterz@infradead.org,
	anup@brainfault.org,
	samuel.holland@sifive.com,
	tj@kernel.org,
	alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com,
	zong.li@sifive.com
Cc: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v2] RISC-V: Enable the IPI before workqueue_online_cpu()
Date: Wed, 17 Jul 2024 11:17:14 +0800
Message-Id: <20240717031714.1946036-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_041723_955991_D27335B1 
X-CRM114-Status: UNSURE (   9.23  )
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

Sometimes the hotplug cpu stalls at the arch_cpu_idle() for a while after
workqueue_online_cpu(). When cpu stalls at the idle loop, the reschedule
IPI is pending. However the enable bit is not enabled yet so the cpu stalls
at WFI until watchdog timeout. Therefore enable the IPI before the
workqueue_online_cpu() to fix the issue.

Fixes: 63c5484e7495 ("workqueue: Add multiple affinity scopes and interface to select them")
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
Changes in v2: Rename the cpuhp_state of sbi ipi

 arch/riscv/kernel/sbi-ipi.c | 2 +-
 include/linux/cpuhotplug.h  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 1026e22955cc..0cc5559c08d8 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -71,7 +71,7 @@ void __init sbi_ipi_init(void)
 	 * the masking/unmasking of virtual IPIs is done
 	 * via generic IPI-Mux
 	 */
-	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+	cpuhp_setup_state(CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING,
 			  "irqchip/sbi-ipi:starting",
 			  sbi_ipi_starting_cpu, NULL);
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 7a5785f405b6..0a8fd4a3d04c 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -147,6 +147,7 @@ enum cpuhp_state {
 	CPUHP_AP_IRQ_LOONGARCH_STARTING,
 	CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 	CPUHP_AP_IRQ_RISCV_IMSIC_STARTING,
+	CPUHP_AP_IRQ_RISCV_SBI_IPI_STARTING,
 	CPUHP_AP_ARM_MVEBU_COHERENCY,
 	CPUHP_AP_PERF_X86_AMD_UNCORE_STARTING,
 	CPUHP_AP_PERF_X86_STARTING,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
