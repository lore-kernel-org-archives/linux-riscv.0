Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD71C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikdIZ+BSpvXmJaLJSHdgBOuTiiiyQ6iH5Vgj6WzlVlk=; b=H+CBgq5h+JyyCw
	0nrZR5QZOTIU1yrhavVcKkxIQqF4Oa1SqTlI/iJIe0s8/sebAFmQRRs2BuYsmv2nuGKvvS3Gk+Qb0
	5yqgqlrxgGDy9XzR73lZvkdiEJ6bkBescCPkCdmegqhs/Sf9nD5qO+xIlXdKUrT8g49pcg1qqkm/X
	WlJelmoQVmUjjlQNWUzsUF0VwM21mfZs5Hr6jDcezvp2LCpVjRJiaIoxzwrZZDXNsHM1yDTlklzq2
	yQQCxcZ+SbZtdTb2KRSUiEWhRpcM6+mt//L+aXtpY5nTge8Q8S+l+kBp6mpqe1WYPxWW0DFJcDDzF
	RMYvbzg6ythb05CUqS0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMr-00DR3G-1k;
	Thu, 18 May 2023 16:20:41 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzgMo-00DQvk-32
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 16:20:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-64d1a0d640cso637736b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 May 2023 09:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684426838; x=1687018838;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=peA7uNBICYxq78TCCLilok9fr+B5gTYL7MG+xHpLNFU=;
        b=e/Cx4vjZipW38IBRBhUU8aPV0WQ9CDgtfZvd9+SXlt/oc76sjLdLw5K70UY3tOULvQ
         Uo75q6vV/vSwRTYT52hqBU4Qo0xGiFYv/bSmD02LXYS5IUu+ULXNazVfHjLoBc9p4Liq
         fmcbqts6++pNaHxtj++N4bKR61wnEPDpjKXniaxs0OZqL0JWm9isHY7z3n6rwKC9vbFk
         iU/dZG5sehiRUg9heZN+R/XkqC0f10nDGhyqVSgy23w0V5bOs9MdYSsM+pSqvvWef+5R
         2j/s3iCLJRzL0Njc1G8wnZoViBzLBV0/EoxVNNNJ1l8IV0YN/C9XFGV2dwmkynCe3Iw8
         L53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684426838; x=1687018838;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peA7uNBICYxq78TCCLilok9fr+B5gTYL7MG+xHpLNFU=;
        b=WHFmfJCBzvq6etIMFbXhvhtWXJkPEgoV8xRT1dzHrj1dNulCmWQLW+6gaQG99/nHxv
         iZm3vXYRCc6tPRCtT37nBrE7vxYYcT0dwMIP2tRAw5b++Ubsw4L7cQ+AYZdyBoLnE87x
         HEbHPPccy9XE7AexmDOzjIvwIYJ0Zq9swwnh4bpE/WLxSga+eQ18BY440p/DrfOcYkW8
         UesIyTupWqiYJaLbcXi40Xe6r+h6xhHdRx4+fhgY/TSFbG54zIuVG5xx2VQGiOGzULdd
         mXyLZ8BGuDIMjmKOPy9lxMQozcnTCbkz3Tr50pW54DJWUXWcnjDd30kMLU8HN9qEPY8V
         U8qg==
X-Gm-Message-State: AC+VfDzlbshWKF/4cLs3h/HYum8Tgiwk5CM8OI2vMkieP5J9562hScMi
	ke1dAwAkTX2Iad0EqRQNIVnQzyDC7fZpxubIqqk++FMmBFW8HjoMayg+dzHdK4oCNkmQc+85Srj
	zib1xE65Fq2mopaKWiTjlO205ca+ZONHHxk1+6+La0PV1p/AjpdENCEi0/8E/loUE+JG+800jsY
	i8cEXXrL/swARRBwk=
X-Google-Smtp-Source: ACHHUZ6GXeuq6ac3dk1QjIBXlTMLesMB0FjJ96RzZemGCdDJ9H4Rc4dGccTHPTd/M9zRn4/iLuk+DQ==
X-Received: by 2002:a05:6a00:1908:b0:646:59e4:9514 with SMTP id y8-20020a056a00190800b0064659e49514mr5466238pfi.7.1684426838150;
        Thu, 18 May 2023 09:20:38 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x23-20020a62fb17000000b006414b2c9efasm1515862pfm.123.2023.05.18.09.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 09:20:37 -0700 (PDT)
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
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Vincent Chen <vincent.chen@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH -next v20 05/26] riscv: Clear vector regfile on bootup
Date: Thu, 18 May 2023 16:19:28 +0000
Message-Id: <20230518161949.11203-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518161949.11203-1-andy.chiu@sifive.com>
References: <20230518161949.11203-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_092038_980860_A988B668 
X-CRM114-Status: GOOD (  10.17  )
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
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
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
