Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E65C76196
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW3Ff5/9GiJaKmYCQl7s6SpsJEYyJ7eFXZtr7ONWcRg=; b=Ps5paYLAHVijMN
	T9IFSepdsIYK3o2zaBCC62DPYM1UcB5uGzBfyaRVzVVDdcfXCYeQdzA5EUQh90mKHtkKa6pL5qwH4
	OLqOJSnqohc9XVAxAK18AkW68e4gZPBA5NX6AREBofc/oLHI4sw2lVBYabyUW1hacudNvWy0pNTsd
	gjTMZJgu6eUSbbL6jORnG1eaeQQWo+OBIzYMMjOh2F/9r6bQNoQ9FhzYcFkCVmgZcfk7H/L9aGuZY
	mdejTZTjs+V7W+W8Gzr4LJSx85SzfxBLGjqJuGEwxWQnWOSOfsDeVLeQTxSebU6KqzwdrZkCgfsm5
	kzTKb/HjSfD7k4BfU1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQ4-002GiM-1E;
	Thu, 23 Mar 2023 15:00:00 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMQ0-002GfJ-2m
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 14:59:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so2367660pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583595;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=YZmF4D5+ASu+0FbybKdp/QQW9kNTxyCx5YsT6ZvM2DG/OesJXHQ+aDXBJlPpA/hNuc
         6Ok2Cqe/0ncNLp8Mo6vJqHdPzwEjZZW2E/qTUILb1ds/11rWsZLPg1ULU9sRZNlJtX0e
         RLywUoQ2+Gk3ZsR0AtYjUYnMExlwFt7XFe5sx0VlC7XSB2iQuY7iwCXW4DcTDzLUXj8H
         4VHAMluEY0zmLjuaXhhHMQqnsGuRw6fV7o5U6rpZZj8nBGQB7ctBlVTA5KmDh6fVFxec
         rMpDpvayB6Y69AQ542RP4xGTxSXcMT1SghG8eEJIBMo5uCkewwP1Dk8B8xUg3VgHwOnc
         L5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583595;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=W/UT6+NQ1s+pM180tVSVqoWgMk+a2NApDYqCb+ItQqvIMX2VrBC7Vk6OaQVgpbqNzS
         3JA9/A6Q/wp10GOilMBgqGknEgPfVrrWg7J4Tf4ZhhOEdIVPgFZs93LP65J0f2knn/f7
         iwRdVcUlAKjp8su5GkSG7DCBN3+0f+69ayoNk9jIKlrOUkQB+5bEJXashMvoyRjZ2hWL
         agcAxdxm9KMVueyhqsFrsbyHEkPI3VqMwnDHnjajF7QsN+BXxtt0ghCD5L37xy8xFufy
         aJ+SegXxqDeIztasTOY72CAjh1UL2rQQqbsNI6ny5Rq6UFEMeDMgSy/9Z13ifvoc/pdg
         P06g==
X-Gm-Message-State: AO0yUKVk9ONtKYAyBAbGqnmVPO2+gn85gNj8f7bvUp9wPSouY5iI12Mg
	0EdMmEIvy2g9gf7p/luCYbr13Pgb/t9V82fSv3f49t6LqFIzDMPwRQTtRhGwubLH43v9zlhU9IP
	wCpAq1RbnHHj6kfsV8LR3LLnQSauSfkkqPPmvH9dWdn3evs9Rc4hOL1jlhHVMDXkNmm7itAIcIV
	twHjxK6cPma8Ip
X-Google-Smtp-Source: AK7set8A+aZ2M7mxzfToXXBNFwaoRnGD4RaT2KdE16M9huLbT1x0LNbyAUn8zoOUaP8wkbeGiMTSjw==
X-Received: by 2002:a17:90b:38c4:b0:234:67ef:304b with SMTP id nn4-20020a17090b38c400b0023467ef304bmr8717993pjb.37.1679583595508;
        Thu, 23 Mar 2023 07:59:55 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.07.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 07:59:54 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v16 04/20] riscv: Clear vector regfile on bootup
Date: Thu, 23 Mar 2023 14:59:08 +0000
Message-Id: <20230323145924.4194-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_075956_908933_9D779C02 
X-CRM114-Status: UNSURE (   9.94  )
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
