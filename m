Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0CEC7EE2D
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tNIsh6gW+uyArKcJOwYBZ5LnHrkXswuyR8J+dArSCDs=; b=dwMQsQ8qZ6cbvn
	ud3seMTRgDCRIABNgfA0S8pMevsZD2C886wyPRlbnixp4WS0Uh92Le7FVpjEhG+m7P2E9iU3CiQEO
	2+DRA9Owa8LUsGlRozZ6rAwyBP/l0um7QTyUkA6l8pN/WiacxCtkIekzNHVWafpzwHkZ+ncuaD1vL
	3JJOhjs9iBB07aPP5jHofvIgAYuACzPRTdR3RO6X+E3nrsFlQCy/FssfXM3t6nylCHwQHG63LPFer
	ZPYCNUD2nwZqas3zHCaX+NpyRNH0itBxDYhva9Qrcc6/GNx25UHIqBDlaV83r9Jb9eL6B69dpMRH9
	uMk6obb54KO/1B8B34ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSN-003DMX-D1; Fri, 24 Feb 2023 17:02:03 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbSK-003DGr-0P
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:02:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id ky4so150060plb.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tr4IaNHJV/yxI3LzfdUHpHdNHRqmUrR0SAE9fALA7gA=;
        b=X53N55kzCDwGxM9gSR6D8s5MXnNjsLx2+RUlkJVVBzk/V6dMb3r0KJppvVhw26wVPU
         L78d/fw+nkpxWlEmjRU/BJIeKiyDiGmx1NCAuv4cO1ME8iBNadGmWyTkWdxSWKiDufvH
         xvL9sKASZJFov+erCKEqqs/RsdbhdVvJqczJEYLwXQlheOA4sqEN9vpANkdfOU7zffZf
         rLHX+d2iPWPwwmExzo/fXrBgbUNzdABXZGquLl4gKl3F4uvqAYTNS8TF/bq1M+VNiHs/
         Af0/y6LCGtlX7758PWKW3He8yEpTsCFMt1tQilv0SMyR/Eulu4uywRYkQ+JFysGs6ECD
         VUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr4IaNHJV/yxI3LzfdUHpHdNHRqmUrR0SAE9fALA7gA=;
        b=chZm3yuJlnEOscaqNdJbttm2MyXCC/VOxkXLxGxvJ+CNMlCUUK2Nhf2HliHLiM50Wr
         VwLPo/1n+dhgKm28bY9R0M9/lg9hxaDTkzQys46gZ8R99bcYrMZFnMTiuWw5N7KR+PyX
         KWfkTsFuQmYz/a69DxVh6JPGj3HbqaYLCSAozXKopCFyzAM+lFB9ld3vEtlPmobdgLw6
         5Q0YS4MBmHk1wVFK/+JSX6S/k2fCANGaa7biyeaSPle/77keOWnVeAUqbbZ08xRx3Eg8
         ebIXgOTwK8USpietN/0IgKKOisWaJT+mm+S/VwYKlc09cloAOq8U2CaI/ekbkRzrU6ow
         vtqA==
X-Gm-Message-State: AO0yUKVooDyo6uuWoJVCcJLso0D1aNCS/t1jcDaY/CFUmBD7CjO57j+z
	QbjmAb3xr09oYJWVdpuIZDHt8NZdJeuRoDuTdOsJ9e8YNKo/aUn4aZ+WDTU8MJQYAMD/9vX2sRH
	bDdniRBapzgJLzC9nn3rtKiFBnDBZXvWzwIqzRoaPC9U3xjxuBvBsmL7MrhUXtcgb/3Cb4MDrjg
	57sL+EToKafw==
X-Google-Smtp-Source: AK7set+8aW8jIXiwNWQYy8PDbH2Lpbn0VJvyhHm3YPV4EoNE/73HyNmBg8yX59BdCxrIImwbAxeIjA==
X-Received: by 2002:a17:903:11d0:b0:19c:b7da:fc44 with SMTP id q16-20020a17090311d000b0019cb7dafc44mr8203309plh.34.1677258115602;
        Fri, 24 Feb 2023 09:01:55 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:01:54 -0800 (PST)
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
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH -next v14 04/19] riscv: Clear vector regfile on bootup
Date: Fri, 24 Feb 2023 17:01:03 +0000
Message-Id: <20230224170118.16766-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090200_063094_BA543307 
X-CRM114-Status: UNSURE (   9.83  )
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
[vineetg: broke this out to a seperate patch]
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
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
