Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54B9C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcH3bmgZGNNpa4jcd8gdAsi6+3KUxK8/u2Xh3autlVw=; b=ZChTfXOubVLTIQ
	zqPwB2UHg0dSytMZfOMsy1P4Bivc0MhJlug/UzC/gmqSHUY60kLsuC93MS1wVV6i833VdIX5DPNmY
	nyHNEI8EsB5ND4p/8PXl4uPfi619PEoZvo3rz3A0VC6vvBYBF4+OaDXeGvvCo8Q9tszWQ7YEYlnrY
	J1yKkAKqQ4zZtRJ1SRinFJvr7S0Gyp+a+jofoMaqMm3DNF4XiHz3VDI7xiUP4LbAH5l8kyuBrJqp6
	+9rJ6mn+b/ODGgEWV5Y4ixr282J19crX52kz5l/nb3wCLbHNZdX/DmDL3n4rUUj5XzwqluQ9eJ1R8
	mNNB336BuLI5dL2ldflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8OB-00255o-1o;
	Fri, 17 Mar 2023 11:36:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8O8-00252f-0J
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id le6so4964012plb.12
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053006;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2CeCkoiCmH3/ws0KZkp+HQfm92M4kXVwNFV93ZjvNY=;
        b=B4MOa9IepBe7fu/GGyQMpi02t840NVUsF1YMHv1IHWQgDBAY8KAE0VLig75obbBRAN
         D97f7SkMS7O887HHAA9b4Roq1/r79WMLcP9T7gh7HJZsnpRtJRvsQk9UvRXcGc58yKao
         tF0KteeSLzOAngaNz/1+UR0VzpVA/A8qbNC1/NU+NDPz3eShXQ9A2lI3Aiw4Sb5pt33V
         4aGUeGm80Mb6VR5j1+lkO0MFTB/+N3/T6sRpl80mzcb4Y3B+vLbgm1LzEj3952Ge7FmN
         nIluRiTK6Qe2SZevotJVVFwSUQzOvvqA6UfL68RDPdyX8al/OlTgBP7fPPyIHMhvWUWi
         JXlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053006;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2CeCkoiCmH3/ws0KZkp+HQfm92M4kXVwNFV93ZjvNY=;
        b=iwqEGJs4xzP7XnBDYuK4ly517dp9cc3EMQX1v60yPrkBtdeBfBIwqzNPJl+xGDtQUb
         Ki9He5L8WhvPk80QIqLHOH4UY79e6ppQRhPzJdCqV1gK6MDTVB2SLdiwUg7VZvpcwUHQ
         4CP1mQLCN6SBNjiP4vUy+lq5H3nG4ikIm7LNjOhjvynOLyl019qQPsoBCCwZLjOrvXQi
         iyDVlil/soZY3EELXWPh9K8V2YLT84wwh4i2c5myVmg9psVIuhFcEkNT0B1DP8pT7Hr2
         ajz0usr+i5hfbY0AleqOxK/A3glidVF94jU/O/mKx4085HhI6QwTndPxj/okaGOQi5Kp
         AXaw==
X-Gm-Message-State: AO0yUKUv2UqIgxB05eteykJkqthkCFrzIp8tD+NONv8xS72jq2icA6gY
	rt/Pr0lKZkd/o/NhvV2TU6eF7Yna8TKvHxMXRVvTeGlrNWysNHAIWMETnPVPqEkngqS6DYsNDU2
	+HK9Xn1H9A8HM8XIz0z5H1wNe0qlptfeWeVXGg+d/iIuv3w9ljWUzhpbyu2kpT6dB8QYktkOZcg
	tJ0yBgOaHgKffx
X-Google-Smtp-Source: AK7set/jJt9RpQRdgFNr/nwnCHvluLee730CaOiZ9z5NnZShDPmF2cgAcce7IEv3RBA0ymK3/kp/eQ==
X-Received: by 2002:a17:90b:3a87:b0:23f:ef7:7897 with SMTP id om7-20020a17090b3a8700b0023f0ef77897mr7686906pjb.49.1679053005719;
        Fri, 17 Mar 2023 04:36:45 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:45 -0700 (PDT)
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
	Andrew Bresticker <abrestic@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v15 05/19] riscv: Disable Vector Instructions for kernel itself
Date: Fri, 17 Mar 2023 11:35:24 +0000
Message-Id: <20230317113538.10878-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043648_132541_68A54119 
X-CRM114-Status: UNSURE (   9.61  )
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
