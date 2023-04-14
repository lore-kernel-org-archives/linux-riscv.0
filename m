Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37563C77B71
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgLbPaJvzDtC7o0IZbLRhlLYg9kI9XhGfkAXIeUeVK0=; b=a8WBQ+Btq/TO3s
	tT4dATugeTQfHa1P/6z5rbM6el40WRpOMbqBtdFoQcPwnYdPqGBxWKRm3T6juvxJUkIuH4o4Haa1X
	IP2x9TfwtfnmKW9hXIOsCNfq4wd9BKQNuZYZZOQx5J5YC7PhyvDeMgb2HCebu2WGs3bY+xPmbR7xe
	aIik/CUBX3kw6KyjQyNJuwE2olGA6DhiwOW7cEj7ZCAYRsUUfyZeZVGOION4jPZknkqAvOR8/aMJR
	ityQwkPWVTr1CSyymgSqSUX0MEs0iCe8yhgJgUwwJfjg5GLzHx70zmpdPZZd/fG1rC95GigOWbECk
	T53rd2MZkWU4ncyOHBug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpY-00A1ag-1U;
	Fri, 14 Apr 2023 15:59:20 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnLpV-00A1YL-3C
	for linux-riscv@lists.infradead.org;
	Fri, 14 Apr 2023 15:59:19 +0000
Received: by mail-pl1-x631.google.com with SMTP id la3so18549936plb.11
        for <linux-riscv@lists.infradead.org>; Fri, 14 Apr 2023 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1681487956; x=1684079956;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PG+A+9/fIV/ExGi75FEqrU6haa3ykbx364k88CAqjOs=;
        b=kdg9Yczwyk4e80R97KxMxEhoaYpdJL7tb7VWV6o89C7M4z3VvTwNyeIybXA8rBzxhW
         T8tH+KfF9EjEGeaKiZOKjJhDGcDF5/o+NvnTdiejZ31/hDs4nUgbNcT8U8yOLgk8hd70
         /ZnDyKiDekpbcSGE8lXcZq7l4qqyV88mzCLCCtPYGvy3gh10tQNZXxu67iyh4ye131lm
         9oiIErgg0c6In/JrOmhm0EHN0Di9QVr4GIV3K2uRBMIje+yk4v2+d88nRuOQMmRBfX8n
         yjvfH1YOJLzNsb0HzhhEatNpsnzy5YJt5lXOYFr1RNS4fgXHa7NlyfEgSX11eeqCI+An
         fshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681487956; x=1684079956;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG+A+9/fIV/ExGi75FEqrU6haa3ykbx364k88CAqjOs=;
        b=ifOx5UtoV4GZae7SBjI7zidgRmtjbqMj4pff+hdMAQRCMmoxQject58/2STlQRJtJG
         0fZLxtOFNykZrh7qYkrVnSyjefNsKsQNuGqPJiX/PglgaJHbp6/zd3yo3KlLegWIa6Qi
         h+E25MXhN7OVAX+PjqPBy4T2NJNIXzyfTiqb9AlUJUp5+ujw+U+a7XZKt33mPnV7i5pW
         yvcYSWTlY8RbtiHWtuDrXf8mRoApZD3aW7c+s+nZCXbSu6w9voQiB+foKtzNq8xKrLZV
         nbFcDOBLeIxEkMYOD1BYyPMyLwwR5HAOIjtWj8oHAH6hCI5lr/yiFba7Pb5FUAPWNni1
         UEcw==
X-Gm-Message-State: AAQBX9dYhO54jlEnTBaPgfzhBrr4ZxyfqWqrjHU0vPaHfjnYxrnIz7Rz
	cl0TXUbEulGUxKT9ox6nUQVx5yLFsW/OJm8MSqctNQ8iH8gTrHcKHVCpsV6nv3mtxeJ81iJOsgj
	cfoXuBI3qs57kyrYuVNUzHUvtwDjWZbIJGpSHrU6H4EqHAjlv1Ym30tyk57NpgIgV/Mkcw6rIsf
	LwGmUnHnwwJhqx
X-Google-Smtp-Source: AKy350aE0CypeJZKaZSx8L/smNEoI0EeS58SnlbMlAl+92nAEaS9HyCM6GRm4Kom+iZm45DgD9y9eA==
X-Received: by 2002:a17:90b:3649:b0:247:4adc:ef4b with SMTP id nh9-20020a17090b364900b002474adcef4bmr1277319pjb.47.1681487955712;
        Fri, 14 Apr 2023 08:59:15 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b00240d4521958sm3083584pjb.18.2023.04.14.08.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:59:15 -0700 (PDT)
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
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v18 04/20] riscv: Clear vector regfile on bootup
Date: Fri, 14 Apr 2023 15:58:27 +0000
Message-Id: <20230414155843.12963-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_085918_028148_69FC0860 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Greentime Hu <greentime.hu@sifive.com>

clear vector registers on boot if kernel supports V.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/head.S | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 4bf6c449d78b..3fd6a4bd9c3e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -392,7 +392,7 @@ ENTRY(reset_regs)
 #ifdef CONFIG_FPU
 	csrr	t0, CSR_MISA
 	andi	t0, t0, (COMPAT_HWCAP_ISA_F | COMPAT_HWCAP_ISA_D)
-	beqz	t0, .Lreset_regs_done
+	beqz	t0, .Lreset_regs_done_fpu
 
 	li	t1, SR_FS
 	csrs	CSR_STATUS, t1
@@ -430,8 +430,31 @@ ENTRY(reset_regs)
 	fmv.s.x	f31, zero
 	csrw	fcsr, 0
 	/* note that the caller must clear SR_FS */
+.Lreset_regs_done_fpu:
 #endif /* CONFIG_FPU */
-.Lreset_regs_done:
+
+#ifdef CONFIG_RISCV_ISA_V
+	csrr	t0, CSR_MISA
+	li	t1, COMPAT_HWCAP_ISA_V
+	and	t0, t0, t1
+	beqz	t0, .Lreset_regs_done_vector
+
+	/*
+	 * Clear vector registers and reset vcsr
+	 * VLMAX has a defined value, VLEN is a constant,
+	 * and this form of vsetvli is defined to set vl to VLMAX.
+	 */
+	li	t1, SR_VS
+	csrs	CSR_STATUS, t1
+	csrs	CSR_VCSR, x0
+	vsetvli t1, x0, e8, m8, ta, ma
+	vmv.v.i v0, 0
+	vmv.v.i v8, 0
+	vmv.v.i v16, 0
+	vmv.v.i v24, 0
+	/* note that the caller must clear SR_VS */
+.Lreset_regs_done_vector:
+#endif /* CONFIG_RISCV_ISA_V */
 	ret
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
