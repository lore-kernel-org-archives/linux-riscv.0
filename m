Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E17AC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMOh8ZvyZjKggCaz9pf+1kf5mol2f4XaJzE7rugkxCA=; b=Exnf6MW8DSBa1s
	MGRorGdKVWVHjB90YStPN2CqFqGlme+93RTD6+hNxWW43cHAQsvfeBnFyAK+S1XRb4sA7HOdEiQTz
	wQgTP+5NP4ghJ4ohxBEem3M9alzc+928kjm3eq//L3NBwdDcazwK1MLm8/kej0cCFTzjiPQMIO6Hs
	yIIfKuq8lCqs4vs168tFyg3Fnn2wk7K7Hn2hMYbr/Jh5peYOhqA+s9HsmKntFSoEMAN9PzsSbds1i
	dX5JLKTGexnruLLKXSMDxshOmtYyizvqUlu+gwsDCUwQjFGjcdbt6GJ/1Dx1805rRVkLsIAQvlmXN
	USBztU1aba6Ay8n9sEzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdI-002t0h-1m;
	Tue, 09 May 2023 10:31:48 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdF-002sgO-2G
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:47 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64115e652eeso41442108b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628305; x=1686220305;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OMViiC6TRgUBy+1t9x/tkF3qbB8zyqTk5+4zqct9RAc=;
        b=H2H87NzV+z4a95p/WDxeVW9lVOiGG3MSpJcPfFkIIbEFcdgH1iXqaTbeCOJcldkmgZ
         QHzCfmsREI1BjPcHxgpky6/suqYvVCrBU2VKm8ciawCSYnisvkIn4xLZEE6dcskpACU/
         8Z5gKCJoAjDk1pf5n+3cyj2NYeY80YiqmRFiKBumv78pSA5HpqnCi4cuhxXHZvEasMeI
         HvStYT06za8kCu6usOo4fFwHI/HF8U0+oaCx74xK8NeKVqLickCbRYZ24zOkqx9x+zLc
         TLvD5yKb5/qul3mGcfNl//kzaRDsysx/EZ2zWQ8z4TFqxt1K85yWgR5K80C9mdDxED35
         5AAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628305; x=1686220305;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OMViiC6TRgUBy+1t9x/tkF3qbB8zyqTk5+4zqct9RAc=;
        b=Bb4UHBRWBXaDUkA5chHulVpPxVw6sOD/5ilrC4/qsHNhhxky2uuUW5QGMNXw2VteSV
         k0FiW0YqiAiZxCqtZ+qq7yUYtDDPzh6+HmcRtO1toRdvM0TVT1h13+9ID/8wMCeehl5D
         lG6vnlR9RBDdi3DrJGXZmnbGIJ6BPzzYXCR4mIMwM4XLFHoG4rNHYdcXrO8gFDBizWcS
         o2wXaFGERCkiYLboFVxH+7Oz/3WSEgjfiLUMwQGhiBJfRg3ieiBmsAJ9xvV3FS0UkVhE
         34dcQ7hHrL1Vsr+DLojxn22wjFukFcaAv7wmB2bQ+pX2x6GpvWFMwWI2K9uO+aVbmVDo
         uy3A==
X-Gm-Message-State: AC+VfDx+qc8DbSe/WddbkyxuEtSws3swiABuAsn8/tZf22pX0QBGoGWF
	2+GQaHhbOagXlpxArsvKFmINHrpdrNdCigNZ0yZ+HexpWqD/3dLvxPoJEOuh3rkYvyEU4YVF0na
	GeYfYSf7BuE45SP57HwjNqD0mKDvHBUX9QIhcgJqQAuCGmy3efs/ikGOT9ahgZ6JriWc2/SC2WK
	+J6PSYNx2EoDcZ
X-Google-Smtp-Source: ACHHUZ77LjVJMMtiEt2KLQzAUBVsb9v7+qxLpSGV6oaLIZ1n//HV6AEtIF0juAPI98sE1sXMla/j7A==
X-Received: by 2002:a17:902:da8b:b0:1ac:7e95:74bf with SMTP id j11-20020a170902da8b00b001ac7e9574bfmr6630959plx.6.1683628304718;
        Tue, 09 May 2023 03:31:44 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:44 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v19 06/24] riscv: Disable Vector Instructions for kernel itself
Date: Tue,  9 May 2023 10:30:15 +0000
Message-Id: <20230509103033.11285-7-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_033145_747317_9A2EC9A9 
X-CRM114-Status: GOOD (  11.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Disable vector instructions execution for kernel mode at its entrances.
This helps find illegal uses of vector in the kernel space, which is
similar to the fpu.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
Changelog V19:
 - Add description in commit msg (Heiko's suggestion on v17)

 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 3fbb100bc9e4..e9ae284a55c1 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -48,10 +48,10 @@ _save_context:
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU to detect illegal usage of floating point in kernel
-	 * space.
+	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS
+	li t0, SR_SUM | SR_FS_VS
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3fd6a4bd9c3e..e16bb2185d55 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
 	.option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 	/* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop
 
 	/*
-	 * Disable FPU to detect illegal usage of
-	 * floating point in kernel space
+	 * Disable FPU & VECTOR to detect illegal usage of
+	 * floating point or vector in kernel space
 	 */
-	li t0, SR_FS
+	li t0, SR_FS_VS
 	csrc CSR_STATUS, t0
 
 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
