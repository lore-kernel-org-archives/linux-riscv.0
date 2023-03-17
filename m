Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60423C74A5B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Mar 2023 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gW3Ff5/9GiJaKmYCQl7s6SpsJEYyJ7eFXZtr7ONWcRg=; b=Etych4hpqN6mNP
	71haSupR0++oIjOKsG2BypuSzpq/DPP9/+vbaoJiOe271DSMPtCfv7t7j++bqKHoLnEjVZ8pDE40x
	fHYSzBOE0BXkqpISH/9w/6WdAk9YhLQWNu0zI+7gYAaiA28Ke8Eqw/YLUJvEOe8676pRbhpA/XmVB
	xT4Ji+qNQxfqjo8NjCKoEqk8rTiv7hGQ2FJUkjGI8Zwv/FEFACWQQt4SmDaI0FQysOpt9f4rZmlHi
	dj81vRkJIPhq4QOxdw1HKcHGLQj6UvR+PnGxbA6Z2YIheNOhAUUbwuSx9ZASKaXku4RQgX6+lSbAd
	N9F+ywUcNYMEAt7IP1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8O4-00251O-2h;
	Fri, 17 Mar 2023 11:36:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8O0-0024xu-2g
	for linux-riscv@lists.infradead.org;
	Fri, 17 Mar 2023 11:36:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so8773481pjg.4
        for <linux-riscv@lists.infradead.org>; Fri, 17 Mar 2023 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679053000;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=VZ6G3n18NY2ywh8ZJIP5a1q5vyUd1RSPTc04ndLwDgvZ7RaZVbAPNNVJeyXbP5PVHh
         SWXIxZb8pc879LhwRi6ia8U5cokPvvwQSbZaoap2VXP9FL1zSIyd0DOApw8FzA+WBRed
         HdQiBCilPYUrsXRKDPKGlOgw68NXZ8tzRqsh7HAmgCYo5uPiUSn69TjRDE9qgbDyGYUG
         D0gpqk1Hgh8UZCBsCc4MdXNYTeOgzwyndmX9Mj1DCOn/q7YQiNmG1brgM3poGw3kbWPU
         YuBLjVDDnVu3JLFxMQH5/o3aSzPrtZzB2b8zb8XS+xdL6PnlEmrbXuvdo6mP91cg7E/8
         JUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679053000;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CteMDAzkrOKUdcbIvPON419eHbnDZdFOKMS6mt0sWZE=;
        b=bFux4cfoKH3QE3JeTm3Qpeq0Bj56Kp/E2TW1eXVhw11t+W6wHu8wrOr1Vbw6s+TdnJ
         hvJSW5aIlzcCiUKv8JWfrm0UyUnZZ2RAfbI0quEN5WqYYxZl4r9K17J0/0ZYrc8bCy9z
         f+slQ92wBbJ628Ao1JrGCVScGc/x0i9OtcVqHiapIUqgIOHAhybLDXQJfSG/vPZ/jlaF
         /n7o4Ukts4u0tYCUtGYO2w/7u+f8wQYAPkX+kv4QLJIBUYtoHHlpHu0mwuzanyuUVoKw
         2pmVLibcOM+tFSNmQ4uQ+tDbNLWbgcm00/77EkILzpC3oWPZhDpVe2Wb0onBBCP6DYKR
         /gMQ==
X-Gm-Message-State: AO0yUKVLixhP25yeweL5enyMCUxqrOVP6hAuI5rxs7YWnHQy+JzBO48j
	dZ7NgfXhWv6lgYmsRkCgbtHm3uejwITmFm6xL56RLYGdXLBxwNJpOvtUW9Qjap4sUZz+kONB84u
	zLUMs66TVIxjG8GdWoPTfoG4wOcM20b+dks88dUZ9juTEd7Jk0L2yLefsokbsEB6KSsa9ujxehY
	7nlTREA22UNded
X-Google-Smtp-Source: AK7set8m1tJUb4yda0a0o5QrielGjo7ODOpMyvDqYBbbLmnWTKoi8a6Zp8otZtbVMpgo6xxjNbOVFA==
X-Received: by 2002:a17:90b:3a90:b0:234:a9df:db96 with SMTP id om16-20020a17090b3a9000b00234a9dfdb96mr7576262pjb.33.1679052999854;
        Fri, 17 Mar 2023 04:36:39 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id n63-20020a17090a2cc500b0023d3845b02bsm1188740pjd.45.2023.03.17.04.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 04:36:39 -0700 (PDT)
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
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v15 04/19] riscv: Clear vector regfile on bootup
Date: Fri, 17 Mar 2023 11:35:23 +0000
Message-Id: <20230317113538.10878-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317113538.10878-1-andy.chiu@sifive.com>
References: <20230317113538.10878-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_043640_867146_9E79E8C0 
X-CRM114-Status: UNSURE (   9.54  )
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
