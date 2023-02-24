Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B9DC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0iASkAgLlBGiu441dimR5MygSuO9Dp9dK2d+aaleHb4=; b=1XfQdWx2rALbF9
	oduKEjkvWYDO0Tju58W8saNxzLkJkB7CSpM++EoMYoLtxcrdnqTdbinroX/98f3YJIi5D5IejXXoL
	e2+7id8Wj1jkH/8znj8WozTbz+S2GZxDIO6v2GXC1Jfm8w9hr9Kvgng6hTsrFldopNG5dCI0z93kZ
	7VsV0eWUHkCeI3118lE/MjmYiwU3VfO6D+wCPqvzy6qCgPqS+zRjC+erB5gKaK1vJzeiFCaQ4dg7y
	GVauHO35AU4cpheIUN0DC9UbDnGVSZRYAsQz70FmFsEWcBZy83Z1/rcQsJT4OkZtXgzZC2RlzVVDp
	1wt0FyIQ/F7X2aWsn4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSR-003DPs-SX; Fri, 24 Feb 2023 17:02:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSP-003DM6-K5
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:06 +0000
Received: by mail-pl1-x634.google.com with SMTP id ko13so92512plb.13
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NUxvG1XG6bOZdb2vYKQcTDKK4B2zTq/9lRnOgI0kuro=;
        b=G0iOZJZU7g0E+B7ftGmEs4i8CQpL/Z0a/Aep9Cro6JqfVmeywMvkv+84OYPhgWTAT7
         c2p2zdzp6vyBY92oth6ReHpW3TbslG2tSkC6VH6t9Z3CjuSJCLw/KLG2XckV0LJ6/Fyx
         i7Tlxs8TMGPmCPV1cw8f6C0NRhSRFwNXz26Huf55J11yozjRu133bYWrhf0qrG+fnfBS
         4maHfEVg80sB7J9tyvL1nuBmW4qHULVT+V9y2imf7P9jQkJuyLrcaW6D9CGs5o57yEVT
         rJEreQYHlG1gmEjkdOpcVTB6Lg0x+oBvIru137QoeIkQs+nQCFBgeu4bDOHDJWT0GjP2
         NwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NUxvG1XG6bOZdb2vYKQcTDKK4B2zTq/9lRnOgI0kuro=;
        b=cGpJuAP3ISDCngkKVbVICVxe3UFYcuC+7YPdTOCIgL/sAD9b+od8o+VyUiNezYAC+b
         HGYW+9kJgviNJa7OTxUmW/F57AOiO839xNYXoEFUgm0Y5WXqlwj1Y+NjST2i7E1f5cdV
         JPnMD9tJTfqnlRxVi5myoA6LtuGKidZZaJcrnSoAs40TG0kDzVbFHp0B8FMvcG5UyFf9
         mCiF20hiPldG6cupxi/nEqdeDHgHNqD9tI4/myNuAUg38njKV7RvkfLclwfsIzhoxpV6
         zPXdbFLMci4gTmcxL2N8TbzsDYc/UYySPXaArE7GBaNVoZm+NURGrUx7bJ3rMxP8OUnM
         tUyQ==
X-Gm-Message-State: AO0yUKXUsBMH7csYIHnGwvDK3bFxRf48pEgMYVHauW4tASX0WcXjwOhV
	/sjImve6Cz3Cjwda+l7+yxVVQKzohx2K1mx3J/xSJbKfu3O5hoDCf1vw6efwIIy5ueI9ac34pNv
	qUBw+PoALDydR5omqwtG7gruzWMXOFZwbQSckqCIbjbdrSh3WcejQD5eAGOo8SSPxOWpvGiWXvh
	9zspNaGwFERw==
X-Google-Smtp-Source: AK7set8PG3CgJDVTtyOMQ2Hcj3pVUAvU3+qxMsC1I6XUdc2RpmwQZtCO2jyHZbw+gZEpuPNqFUGVjw==
X-Received: by 2002:a17:902:e545:b0:198:ec2c:d4e6 with SMTP id n5-20020a170902e54500b00198ec2cd4e6mr20124361plf.38.1677258122140;
        Fri, 24 Feb 2023 09:02:02 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:02:01 -0800 (PST)
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
	Frederic Weisbecker <frederic@kernel.org>,
	Changbin Du <changbin.du@intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v14 05/19] riscv: Disable Vector Instructions for kernel itself
Date: Fri, 24 Feb 2023 17:01:04 +0000
Message-Id: <20230224170118.16766-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090205_669487_DF75E519 
X-CRM114-Status: UNSURE (   9.10  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Disable vector instructions execution for kernel mode at its entrances.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
[vineetg: split off vecreg file clearing]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 99d38fdf8b18..e38676d9a0d6 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,10 +77,10 @@ _save_context:
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
