Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF75BC6FD1D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 18:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW3Ff5/9GiJaKmYCQl7s6SpsJEYyJ7eFXZtr7ONWcRg=; b=Udzjg98TTBZyjl
	h+1k40EdxkK+6zSocezdsKvC/vEMN9+cVJT/KV7DLPgqXdt4Fq35ZPoRA4/TOIJ3nYXvLD/Tn5Mfv
	kJxCGMQYV2c8NYTTUiI1pA79WMQ7UWTeXBQsoJp61EOEq4I+ItAOHTCr+nlTl/mPLIhLHVGh+/o9R
	D4Am8VoZ1LO7JSLdZDm28CwvVxCodO+7pGreWy7zxNRSL+xU46k2/MZv3EBBxWL4EhGLM6DTJsJ04
	LgZFF+S72APs+e1ehpRMX0+a2lgiYVBqviXU1xknBIag0KzO1n+GdX3vx9us8JpyEfVxr620/HHfB
	X2BO8NHY3upQrSUbccQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgr8p-00ByZf-12;
	Mon, 27 Mar 2023 18:00:23 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgq2w-00Bl4t-1U
	for linux-riscv@lists.infradead.org;
	Mon, 27 Mar 2023 16:50:15 +0000
Received: by mail-pf1-x436.google.com with SMTP id s8so6121212pfk.5
        for <linux-riscv@lists.infradead.org>; Mon, 27 Mar 2023 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679935809;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=NZQUMJm4UhSWq4HMnsWtalvxApw4dZHQUz288i4sRF4WGaZumUVTEMbqVJAFZ84jSb
         WbmQ30+apNxyzGO6yiVHQCHYO6SNgltix5W1Q1BR9otT7H1uQiU8icnM/sauEHn3kOMW
         TxhrZ9cQuW9RZUfqtiz6Q3NoZUWnaWedxQYfr6V+2/eXO2eVaJjMk+dSOt4HXZ9y/wR2
         uIHGjihEBkhv6Cg+jTfrO5LTyUx+safew3qHN4KAdERbXkarFy8Hf1Peiuix0+CCL4L+
         Wr+MCHq2StWede9u206lrINH0Qq6SDuG3xtHKxuCIps9op09h+4TG6AaRAiclUxgBeG6
         nihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679935809;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=j/U2gNczoTH5yo+/7ZfjKT77vKhBp5pASaj8r9FWwZMejRzKqjD/bchCcz0K+NgM5/
         vh0wLnv1mSlev92gsAH9LMKyiQ+FbOffS1OZtXKFL2FPxWJa0G6ysNPzL26jJh2tC/PW
         C+B9sFEvz6hp4JZLwbFPMSMN0llQwR0VR1TonmlCgKU2UJaPLtMZUboH10bPGdUSWkVJ
         keHsFVjatcqHOsxxjGrQMyOARbtM9t3C5xPxVjVq1zxNm87cQxywemSux2gJQeLrllHK
         Mit3+en50B9Erb+7ZmLSo0bfjVbtub8WCbIcKxLq7AtAPWDnZC1oSTFw9s9ieUfVS5aK
         U2DA==
X-Gm-Message-State: AAQBX9d31D4GSwbz8M82eKcJGs/RA8QW+wFlqLnYb2OEX3ryqEGrh0Ts
	IvigyBCO8B0j5DFzHchiFAJLWLerP28zE2FXMipPa32p+EYQzUsZ4x6OLLIqCn+VRGBKHn5xgyn
	1NOzPqCV7Qgbwz1j77Q1YzHz60pUy5KY+RNmhKNc0wxwQu9S7KNApemzfv9Kegg1l2pRFs9hcA+
	ZJTfmkHMDLm4yT
X-Google-Smtp-Source: AKy350bLjud2+4aNJDUYz8on3CavSs/U3XeCm3794fOlo+5cZqKNXnQmdb8hboD4NZoSVUv6RquMIw==
X-Received: by 2002:a62:7b44:0:b0:625:e77b:93b2 with SMTP id w65-20020a627b44000000b00625e77b93b2mr10800860pfc.5.1679935808887;
        Mon, 27 Mar 2023 09:50:08 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id q20-20020a62e114000000b0061949fe3beasm19310550pfh.22.2023.03.27.09.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 09:50:08 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v17 04/20] riscv: Clear vector regfile on bootup
Date: Mon, 27 Mar 2023 16:49:24 +0000
Message-Id: <20230327164941.20491-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230327164941.20491-1-andy.chiu@sifive.com>
References: <20230327164941.20491-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_095014_495902_A729D4A6 
X-CRM114-Status: UNSURE (   9.90  )
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
