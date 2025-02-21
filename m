Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB95C021B7
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GkR79wiuhsu0+PIfkmWVmXvotHR7UmV5EAxnnDOMpEY=; b=cgRfK3moPvimd3
	wC5MNcMeaMKy5S8KJIcwoTOZmwNg0AeEMO3Mg/2hy9+6hqeFz1MwZ4oak5oR8+0zwOYXyZmlBShPK
	zKFRG2MEvK1fCJ0Y74vAXUonxdO6l7rQiPxjfYaoM734sA5s75N7zKl4S07dJdFAEum9a5RUR5Gig
	3Wu5Traxk5PnZyOjwe1wOGhs6femhKzLdktMWaBMO7+4ej+kEPvFmkE6Wx57f/JIgu9aDhLXNiSrn
	cTwoGaDdklcA78sQW4YDJasLuWihm3Z4RrYmxRV54hsTkkrEWEo9NzYIwVPaViaNI5XcsgVABtNgi
	gj7G0D9mqa9/IWmmdaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT3-00000005tuU-05pf;
	Fri, 21 Feb 2025 14:57:29 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlUT0-00000005tsH-19a6
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 14:57:27 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so19138705e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Feb 2025 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149844; x=1740754644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=GV+WewvjNCU/3MFiU7XzuHLekd0aLKfyMw1XxRg7T2hmb4xJj8zAOwF3b7+VkRDZmv
         Xi9MVCIRcMQRCthCCtixmQ8R9xnYsX42SgtzMFjG9AluE3n9O/IcFS/KdA4BI03W5YQa
         lrh3kKDdjCMRNz7Pw0yhQ3AtNCEs7Qq3a9HQbAgmI99/NSVTKd6avuZzYbw/HUOttJS0
         j5RBQA64MtkDLXrg+KOKrvo864dIpR4MHeZ8samerR6aD7SXcF5SkKKHC6jYl/vkywUr
         jFw7EbBMGfBi1mg8UVCpenXgJe9ij6EDHO4qiOKlyatA24dqC7WOhNrh1G+BYC9vI2LO
         xZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149844; x=1740754644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BL25umXnpXBBzwUoMnOj2fRLliDIrDaDucRmmKK49J0=;
        b=e0FpOQ5jTzuGHvLzucOpYdD4UIBD48R+x81v6xJa+jGgXPb08N4vFt6Ko5ev3u9Ley
         yzaHGPGDipZxF+org2p72OX4peApfRetQJe7uRIzXNoR6KZ4Ypu1id1+fq6RkBC1K8+X
         siSaaxmpJlEqDDTl8dwHX7jh89W/FXPJdJgA04hiME6URi4WQWYawkfaQ+qBaSVTPbyL
         lf1IJ3QtXAyXCT32NPsJCTpsSR4/cncfSdjwwVJ8OVn+6Cu/10R9wMwvyWf+EsNDrf+4
         FT+mqSUqLqj1oGXWE+hsBYaIYZoroEcesFXYyx8JnujKemustcCkRCFwmom884i1BGPA
         YMTw==
X-Gm-Message-State: AOJu0Yzk8xtCAZ30Y1Ipoav7LYcLCqzN7+0GX8VLnHYgBVbVNtlDkn4X
	5WN7OvSqF3JgYG84B45o0/tuE1Ui3h1OexRTCyjqA0nESCXkTHwHOR45I9F+TqwqRyaz4o+rBrb
	H
X-Gm-Gg: ASbGncvpgvD4z2yWBH1RwVVLFCGxmRGHJ/3t9trWY80Twxo7B4XMNcKb27SAUzCWcee
	hOT2Cu72fyWyXhqpkGhK40MCXmmXh4nePyGuDfcuRP3k8aov3qOX/7RRGvRF6htBnozaeMK3eoW
	QXyaLa0y6Tv/u1KnXfAMTkrKlc7QQZChIxEVaawdNXYr+1Or8FMpZF3nN3e2M7CZFUwXfcYHMiu
	StV9bjUEWdxyaBxGtNg9cQ0WCFzHX4xQIj2a02w9I7kMrh9AlBWNeHp9A4Ian7D3QGUDK+w0Y35
	BYh60v3+cwdI+g==
X-Google-Smtp-Source: AGHT+IEUAirr8QCvcHPxcSxcdTz/htKaV3QDGHz78tljhwlnJaYoBkEeV24i5MRcuIDBul2oYPovkA==
X-Received: by 2002:a05:600c:4e8d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-439ae189b90mr35989955e9.0.1740149844345;
        Fri, 21 Feb 2025 06:57:24 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce740sm19898235e9.4.2025.02.21.06.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:23 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 3/8] riscv: Fix check_unaligned_access_all_cpus
Date: Fri, 21 Feb 2025 15:57:22 +0100
Message-ID: <20250221145718.115076-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_065726_311933_003E8636 
X-CRM114-Status: GOOD (  12.04  )
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

check_vector_unaligned_access_emulated_all_cpus(), like its name
suggests, will return true when all cpus emulate unaligned vector
accesses. If the function returned false it may have been because
vector isn't supported at all (!has_vector()) or because at least
one cpu doesn't emulate unaligned vector accesses. Since false may
be returned for two cases, checking for it isn't sufficient when
attempting to determine if we should proceed with the vector speed
check. Move the !has_vector() functionality to
check_unaligned_access_all_cpus() in order for
check_vector_unaligned_access_emulated_all_cpus() to return false
for a single case.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c       |  6 ------
 arch/riscv/kernel/unaligned_access_speed.c | 11 +++++++----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index aacbd9d7196e..4354c87c0376 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -609,12 +609,6 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
-	if (!has_vector()) {
-		for_each_online_cpu(cpu)
-			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
-		return false;
-	}
-
 	schedule_on_each_cpu(check_vector_unaligned_access_emulated);
 
 	for_each_online_cpu(cpu)
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 161964cf2abc..02b485dc4bc4 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -403,13 +403,16 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 
 static int __init check_unaligned_access_all_cpus(void)
 {
-	bool all_cpus_emulated, all_cpus_vec_unsupported;
+	bool all_cpus_emulated;
+	int cpu;
 
 	all_cpus_emulated = check_unaligned_access_emulated_all_cpus();
-	all_cpus_vec_unsupported = check_vector_unaligned_access_emulated_all_cpus();
 
-	if (!all_cpus_vec_unsupported &&
-	    IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
+	if (!has_vector()) {
+		for_each_online_cpu(cpu)
+			per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
+	} else if (!check_vector_unaligned_access_emulated_all_cpus() &&
+		   IS_ENABLED(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)) {
 		kthread_run(vec_check_unaligned_access_speed_all_cpus,
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
