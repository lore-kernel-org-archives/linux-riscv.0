Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2791C6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sevLiGq1Kqj5V2xb3QGGtDbZdo/N4p+2FChUOBqKvio=; b=0weYBGj94SldAF
	JZXezLjYtIlbPLRBqtyVjaRvCm3WoQh5EVkKnWMeLVDD3TBd059cNX+4HwlYXxEVCqamN0OGgGf4n
	Ifbqxv2xD0VwqL3AoRjSFpm0vlbfyjY+GCafPyL3K7vAwLav+q9gu53XIi9Tc99EE31lSLal/GpvT
	z4WRuCTjNy1SmvGnARsBJS760SSYv+CFmXwUhdLK9Ip95pHAA7klONI8JO0BKgLfQl6RVw/9c3spO
	lxmdEXhnSu8F6EFDu3/BOpikikqXmc/jkwGSGaUd7qa0nsiH5lEGktPTCpo4/l80vZntakmRvBAg2
	ZEJ4bJe0jiezjfvWcAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2td-00C2us-Be; Wed, 21 Sep 2022 16:48:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2ta-00C2s4-Qw
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:48:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id bq9so10895769wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=bCwFGGiYjvgxFVbbvI83I9ZZV9BKobbourF/lTUeiTk=;
        b=Ei/PzGmXjiM06pJA0uzqeeOlNWOjgBr9044m2+nSEqji3tR7WHIexkzoK+wmLB7BHb
         wjBpsyoZsxrgu/a3RCzbGgmvSkocfLd0R9oJtqzyTNJMgbpnCTdL/jMHFUR6wvX/iNV8
         izPPR41atsjCag7jxYJvtqn9nA8+RuB6H8npMm+owRY9dCIcGeEjqMrV/WK0rikpF78o
         Gbp/9H2JtLA2YRHvHvnpYWJB7K47NQVE0FWKirkHsHYRj6N+Chd1hFUSfSL819r0NnbG
         tulK/ox/kvMUUW2vDTZkhbwnxcs+fbNTfhzJ0YqEsyjFIm6zS/oBhbDMsnRL9NMlAQX9
         zNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=bCwFGGiYjvgxFVbbvI83I9ZZV9BKobbourF/lTUeiTk=;
        b=nxvgxvJMpA9NFwsw57BQCOcrApqbiQoJWipsnAAWIy9CUp9GAKfDt7LmXtJ6j6Oaqx
         WuhDXovcXCerNpCHXPFbcvTjsNmKnUHdnqwgcUjMbv87D3QxzScJSQMFYAzwsAsrHL/v
         WCzqJZFe90BGsEsiJgGgJanxqABXjHIX4cqcVbJ8bT7uQYDH/IOPvDjLAN6k8qp7yAB3
         vnEyox1aKIKjgdavp9NPaF1HJdr/DkOP9sOwkJFxfZkiUzjns9TL1GvVhyj849N0wzoG
         OR/+eCfhQ1zedmUENSluSV+QGxeWjMKWiSas4toiBphM2KgQQi0dtJlsn7O/V4rWb4sq
         /sbg==
X-Gm-Message-State: ACrzQf0kTbuMzliVnFsw5xgJj1EWOV0IwID0DzvzhDn4ETcR38zD//Qw
	rMKNRHyrkqVlum70Rz9HjPZh7KRrhs3aQ0X1zvJ7oRv0A2fNUg==
X-Google-Smtp-Source: AMsMyM5CkzTsg1tH2O/s4oC7YcvnLgGuV40sXjGbBGdfSbzQFpEFcyehwFKqEgrsrdZ3rj3fGAqxQpd97yeu1OYaLKw=
X-Received: by 2002:a05:6000:243:b0:226:d241:11e6 with SMTP id
 m3-20020a056000024300b00226d24111e6mr17455107wrz.187.1663778898900; Wed, 21
 Sep 2022 09:48:18 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:47:43 -0700
Message-ID: <CAM2SziUSPkCf+GCVQu5k_H6TzUD117zCVe=Tyqv1DuwUq-Ls3g@mail.gmail.com>
Subject: [PATCH 06/17] riscv: Reset vector register
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094822_913059_272AA2DB 
X-CRM114-Status: GOOD (  11.46  )
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

Reset vector registers at boot-time and disable vector instructions
execution for kernel mode.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/entry.S |  6 +++---
 arch/riscv/kernel/head.S  | 35 +++++++++++++++++++++++++++++------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index b9eda3fcbd6d..1e9987376591 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,10 +77,10 @@ _save_context:
         * Disable user-mode memory access as it should only be set in the
         * actual user copy routines.
         *
-        * Disable the FPU to detect illegal usage of floating point in kernel
-        * space.
+        * Disable the FPU/Vector to detect illegal usage of floating point
+        * or vector in kernel space.
         */
-       li t0, SR_SUM | SR_FS
+       li t0, SR_SUM | SR_FS | SR_VS

        REG_L s0, TASK_TI_USER_SP(tp)
        csrrc s1, CSR_STATUS, t0
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index b865046e4dbb..2c81ca42ec4e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -140,10 +140,10 @@ secondary_start_sbi:
        .option pop

        /*
-        * Disable FPU to detect illegal usage of
-        * floating point in kernel space
+        * Disable FPU & VECTOR to detect illegal usage of
+        * floating point or vector in kernel space
         */
-       li t0, SR_FS
+       li t0, SR_FS | SR_VS
        csrc CSR_STATUS, t0

        /* Set trap vector to spin forever to help debug */
@@ -234,10 +234,10 @@ pmp_done:
 .option pop

        /*
-        * Disable FPU to detect illegal usage of
-        * floating point in kernel space
+        * Disable FPU & VECTOR to detect illegal usage of
+        * floating point or vector in kernel space
         */
-       li t0, SR_FS
+       li t0, SR_FS | SR_VS
        csrc CSR_STATUS, t0

 #ifdef CONFIG_RISCV_BOOT_SPINWAIT
@@ -431,6 +431,29 @@ ENTRY(reset_regs)
        csrw    fcsr, 0
        /* note that the caller must clear SR_FS */
 #endif /* CONFIG_FPU */
+
+#ifdef CONFIG_VECTOR
+       csrr    t0, CSR_MISA
+       li      t1, COMPAT_HWCAP_ISA_V
+       and     t0, t0, t1
+       beqz    t0, .Lreset_regs_done
+
+       /*
+        * Clear vector registers and reset vcsr
+        * VLMAX has a defined value, VLEN is a constant,
+        * and this form of vsetvli is defined to set vl to VLMAX.
+        */
+       li      t1, SR_VS
+       csrs    CSR_STATUS, t1
+       csrs    CSR_VCSR, x0
+       vsetvli t1, x0, e8, m8, ta, ma
+       vmv.v.i v0, 0
+       vmv.v.i v8, 0
+       vmv.v.i v16, 0
+       vmv.v.i v24, 0
+       /* note that the caller must clear SR_VS */
+#endif /* CONFIG_VECTOR */
+
 .Lreset_regs_done:
        ret
 END(reset_regs)
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
