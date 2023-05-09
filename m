Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B6CC7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgLbPaJvzDtC7o0IZbLRhlLYg9kI9XhGfkAXIeUeVK0=; b=UHOqgV/spI9P1v
	yAEQB7DQ0j+MlHHSMrGbRA/TV42qTGq+q2JgInrVO82b8md4k9LufYi/nZ7BD59q9krBI+D7sdHLH
	T8CIdqYafKLTS5JC2b6+r+T678hylmnPD+xrIaTzHmyQiEC17OF0vCng7Dwddnetoq3/DCZuEEppn
	588Jz5OeoMjPknFzMcBefhYRCyLQfBbGTc4zexCDLDf0yHd0A+CuJPUEPmYukgLHWPPUhUFRvBrHe
	51ypvX8X1bZh/edQGGJdxA9TrJ9+gkqCaxQuK6ehFr1RDjSrCsB7kfccWDFMHlpRIhpFhIh5UvVUI
	9vlukOA8YMuHQBOKmTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdK-002t2L-1K;
	Tue, 09 May 2023 10:31:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdI-002szy-1a
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 10:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PG+A+9/fIV/ExGi75FEqrU6haa3ykbx364k88CAqjOs=; b=QZ7vCA88+ff2fWwK9wmwr7aKlp
	unXBae42Si7FQ8oXm8XlfPL37TmSvh5PuHLUUHeq68xiOBFC0H3QxFe/6BTePZSOfBhkrCfXXo2lP
	JUPguP6AKG/l8KLQsiU4T1caVw6Urk1dxAFbNtXb6LtEphh1Bh3EuQT03eEMICpun2jmgZZ/YfQyI
	as4CIV1kTR1/ZYgiYg1ROpF8vbG4X/oO3o2tYoolo0IO/SHD7TBY1BifnLW1B1JZItUvuP5wwT9wA
	Pnl3qvRdRqpGh0qU2kqwYq/0eTC2JVKB7RWTbsuvV3ObUXDjQxXCjnIaDEzR8B9IjS4BINFA/AlO1
	xs/OUyIQ==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKdE-00666C-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:31:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so38938975ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628299; x=1686220299;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PG+A+9/fIV/ExGi75FEqrU6haa3ykbx364k88CAqjOs=;
        b=B9+GWY5AxyRstg0w2rDdp310x+FpVxN/5CyJUkdglxX17elf8YdK5332Ef/a8by+tt
         RYIViO4Uq7YrL3M8ZuFC8G/dtupwplGp2Kj1+GsdWWsduEQgfMVPiaUs4T4aI/6EpQmP
         A7zGjGB8fjBmU7ldGuZqLmIKodSLyzdnZYjE7cv8xyhQQigXE11lJQB3ErstpwC9JdgR
         0Sb/LgTEWCNLBOm3ypPPMhonQ12RL6arBExtZyPdEwehNjh3nKgJcnEEQTssHUrGDi/y
         4ofwA48T29MiRMt5WyZwXfzIFJpc/DlBGA/9qMQhnAduvI5P06wM8xCAt/i6iHhxVD4I
         Zkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628299; x=1686220299;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PG+A+9/fIV/ExGi75FEqrU6haa3ykbx364k88CAqjOs=;
        b=aOrlBrLgsmIVoqewOURWtmUZGrzIZbHLzM+4/zXGcuHWHbpsM8jMZaxnIVBwA8e0wV
         XjseCYE6tSIOEQ29k1Yr+lyoHHOgjZtrottzgGlsGt+nw1+DxgNHbp5h/w5b7PdZp4n7
         UeitVt6xOPVx4nGHrybNceNQLs8M9qpSVlZdlkAQuQGTwWgXk5uJYjKAZXL4Yn/sOQMP
         pnK1C1E/0DjlhKNlAivsNT1zSuaGDZBwajs33DB+OSL6xaqzMp/p/Zn6GonjVq8oCDO2
         vPo9XTe6u1HhxM64qd2J2nGGgDWZsSjnr1NP5DNzaSNh6aNH7K/yn7kk6wtwM/S+pyMq
         9RWw==
X-Gm-Message-State: AC+VfDwjK0XsdyuWiSH/2wD6uf56GaH+AN3Jb6NqE6nvq9e42odd264n
	E7CKo0r8hntGcdJ1At9KTUIaw4l4Ae51MzZlDWF1veDyOR3p620CchkV3GmBdagrvMQvgCVMrxf
	IGWnZQALf9Bh4sbuCE3MAbI/QLxp4AMCDOsz3TXa1WbK2e7wSrpUvXPxKQLVSdVMirrVCR7nvhs
	eEzVsn27u+D4tW
X-Google-Smtp-Source: ACHHUZ5CLHLIAeI1mcgv08ZYoV9tvksZf4THmfiw41Juia/dv6ItXzsNsWolGM5RhjaOcyfX1QYZAw==
X-Received: by 2002:a17:902:ceca:b0:1a6:5fa2:3293 with SMTP id d10-20020a170902ceca00b001a65fa23293mr16306391plg.56.1683628298789;
        Tue, 09 May 2023 03:31:38 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:31:38 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v19 05/24] riscv: Clear vector regfile on bootup
Date: Tue,  9 May 2023 10:30:14 +0000
Message-Id: <20230509103033.11285-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113145_044717_7F129015 
X-CRM114-Status: GOOD (  10.56  )
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
