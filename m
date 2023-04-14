Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0364C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h2fyFm07+nn2ahfB60CxlNiPFSokEkf2cHvGIXDYfx4=; b=T1FanA2x1nIbsb
	/QBb+r/E9mSUI8QDOO05EJRA691dsj3FzLl2VXOfAeeG6zeHnF2QfrZYwkXwFaP8znipwKqtdi3Mi
	3KmkvIUS0ykHpZnyl7kuKeYeduks7APlk9Fl634HLufQ6EGnrtepFrhQyP/eHdHxIa3PCgnoJTY9W
	WnmaNWR9Q5tWfxbNAIR0jOC4nci3ix4mMYXmr/jLdBq3SdSEcNMsA4oXaMhkhBGItMb/+hqlsD4uD
	/3tS5XcSdIVe4v/QnNpy/oPvD+zvRrEOokTCaR6yHzLBhZeIvEQB9AJr2uf7xx/SkrxJXhMOhn4MP
	a4tClZ2YyX11tWZ+AhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpe-00A1dA-0T;
	Fri, 14 Apr 2023 15:59:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpa-00A1bi-29
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id n17so2755796pln.8
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487962; x=1684079962;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRENwq6Q5h6bJkuLEU9y2ZlvRnSbbBagGQhAGvyqbY8=;
        b=eV93yDj+Cvno/AR2Kqbp7T2X+jNoQ0r1Gm5oWicJqdZQBTQoW8zQMKqcIu2ZK8qm57
         YoSs3FvjzFcpICELt84PzxQLl7L6iEzZDv2cSCM1UpETOR3hDXewrSMOXeN/pvUS7+vt
         az6AEvDKtT2we5KD8H70GqYRlIflTmBjlxHUXJzxoAtBAGccGgMeu3RHIPxnJ2mhY2gh
         sJEyNWIXhgUDw6a5s9dhisff3Oly8G524Sc9mjCiJo/+5D1d0oE1rb4ks4yexgrIPG/h
         yRf8TxjynIs9s7HbwQiOJKJTCT6LCUkJ160ZyoZhNugeH1DsgnQtMaoRp2StX6kS/Xxc
         07bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487962; x=1684079962;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRENwq6Q5h6bJkuLEU9y2ZlvRnSbbBagGQhAGvyqbY8=;
        b=HaRT/bOl9QCcrlCnzBnlSnPmIHJOdkNemf8qU8SZYyZV4bGO9dzc821MfwPOU07j+V
         h22jTGbBBX4Q4SznLBLJnHI8SgJz++5UWlXc3KVkZ5aP0fiCr3MFNwC/8yUW20vM+Bvy
         AzNHWK+Vp4R+egXPzRvXpaLvTKrpXuMoM6Pr6Mftnxa62RenElI5u1jNDv13Al7IlaHZ
         c3BWbfZTm0wvrNPGSmDEQHY78WdhmQTp5CWNMnpoitH1Q39sJLubyiYHvTXeT4hwlrS/
         y18XnGFoge+Di2wjeOYV/AU7dqW/+Zd9SsmBe7L1seDxIZG/ME6Pirn/GOaFyg7Jp+7L
         9Xlw==
X-Gm-Message-State: AAQBX9caMr6rOdQ34kXRxUJY16sy/iDy5cXRGv08m1PVwHYzqMnsf4dK
	qpYAbafmobte9FNy8RkVGpkgyc0fmt6+O+y+TFoAb614nvjRbObzwWcWmQdGfp7gPbyJO59ZV0g
	iEJsiF2u3yBLz/AGyRvbO8245oDnlQmB9o5bx9pMvOVUjDGPpdV7hdRyFnY/1tpT0u6pxrdJXXS
	Hv2CkGy7Ftzk1y
X-Google-Smtp-Source: AKy350YHJaKAhtMi3NPY+rjWgsiPejyppDLmmbC6OaSfsoWJPScFQLerfIgZudmYoZqZM1BdigvDvA==
X-Received: by 2002:a17:90b:1e0a:b0:246:ac68:d4e9 with SMTP id pg10-20020a17090b1e0a00b00246ac68d4e9mr6316947pjb.6.1681487961697;
        Fri, 14 Apr 2023 08:59:21 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:21 -0700 (PDT)
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
	Jisheng Zhang <jszhang@kernel.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v18 05/20] riscv: Disable Vector Instructions for kernel itself
Date: Fri, 14 Apr 2023 15:58:28 +0000
Message-Id: <20230414155843.12963-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085922_704560_F9E56FCF 
X-CRM114-Status: GOOD (  10.20  )
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
