Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDA8C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcH3bmgZGNNpa4jcd8gdAsi6+3KUxK8/u2Xh3autlVw=; b=TsNcRZhrB9xbtL
	dvTw7VB3TUCS8eFvD5Y8cRIJttRcPHhwShiOHZhUn0WN8ao9Y7klDcQt7pNGzPNqNvDWYerRrSkVE
	P/7HYckYl28bWhlsZyq+SuKD5HdOaEM7H0uc0O/JqzQkqOJFxFgFcKAlrTv1f2rSzW/BBZFtTK2Uu
	vdH6YVeZdyYUm7afBXRxxATf3Byn3ncN+M8ugUdOKOVk45zWhXb649O1WiReloDU/qK83FL7xDCvz
	JwufxG3caYfV9cbVtOJH4I/QMCEzEuoBo0VF6MeTJUx+VD9TL5lviJ/R1yvp5UTEZOWSmLfhtxLwy
	CYr4umVoR1xr+76WrVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQL-002GvM-08;
	Thu, 23 Mar 2023 15:00:17 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQA-002Gjm-2q
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:00:09 +0000
Received: by mail-pl1-f170.google.com with SMTP id o2so15147466plg.4
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583601;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q2CeCkoiCmH3/ws0KZkp+HQfm92M4kXVwNFV93ZjvNY=;
        b=lLHa8zxeOUxzOBWvUjn7GcGuisfOvitnbjturVsZByJRIeqv9N8MIxb7OnvTwqVShG
         wo9qCRlhw9kGNSJLIjTl7MvXQ2+hUf8eSnx7A2q/Qo5Qz4fJooE3k/Jy4EdERcWzawJJ
         VyBl3bkA5Xfd6cjaWeUWGoB5AAA42bLqLvJHZp7uUsflwO4BLeyBaYIdIs0j3lURmsoD
         zrXgpdMOBKJcWpsTi5KXJyVGXkiLKpEYV7rCREQwFT/B3fv2qIjdys5PkiBmagpov9Nx
         sHdlKpQXE9U21Kn4WarsBlM6edRYD+aFFotkOANTGbIRJg2+ZVub/aCfPR51cxiqc9RO
         V98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583601;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2CeCkoiCmH3/ws0KZkp+HQfm92M4kXVwNFV93ZjvNY=;
        b=EU4yf0kcQXcuXfujvUVLp34AC45GF0MiJb9Bjr/9iE0LqMT8BxUSsouxrr/pP2jN91
         JdN3Rwi1NzPsDGxcNUo8SLfUNeC2lKjECXXZSC+ruC9kRYuLfXuM0eLiK7HjyEKaZpsw
         Rv/IljYJy+6G1KcFY93tWWVwwjZ0NBtFLu8n5ia3QeS7mr2jXCTKGDSsZuOepkoa2rWy
         FQQIagXhoLzUbt/sTnMMDCoraaISB2wUce64DehgHyr/zgadQCiexx1wc/tbjWpLUNgW
         XPxfHznkHzATt+5M399oFa0nOMDB8H0ZYIoX41Ic6uJBSvEaqDFo5JK9LtPIIqETrgvS
         M9Vw==
X-Gm-Message-State: AO0yUKXw08KcGPyKMXMatbLudZsj7Am7Z1TKBqLmI8qQ1KY3YY3GvmG4
	ecwHChYtA6ffDrmGm8GW5kYUIlwOMiFYu/5bfd9/gR1mU7WUcXAx6EAZrzzLGqRoG6FKPOwhxHU
	NRwCcO48Fazmsy5prAcK4ynLGOz7D7qYFX66k7X84QjOlR0AaB9Gmo5UW+R8vEG4jCYoWUSxje8
	Xs9oxNZ7ts3rJK
X-Google-Smtp-Source: AK7set92WvDWc4ERqOKa4APMJXuFZedooI+dsnimgnByggGX+kJn+VyeIwql1XMYvpcM95bSWPxoRA==
X-Received: by 2002:a17:903:64e:b0:1a1:c0e6:d8d6 with SMTP id kh14-20020a170903064e00b001a1c0e6d8d6mr5930147plb.54.1679583601222;
        Thu, 23 Mar 2023 08:00:01 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.07.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:00:00 -0700 (PDT)
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v16 05/20] riscv: Disable Vector Instructions for kernel itself
Date: Thu, 23 Mar 2023 14:59:09 +0000
Message-Id: <20230323145924.4194-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080006_968585_89F4288E 
X-CRM114-Status: GOOD (  10.08  )
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
