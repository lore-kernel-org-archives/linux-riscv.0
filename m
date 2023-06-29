Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E53EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TRXJAqf3vQlHowV9EDthxio7OaR3hQVY+A0IRTZ2khw=; b=PvJnSfuYBxH6UY
	Kye4FTozGo15zHFRLcARh2LruLvyBibmAWq6qU1SR5wQnTB4a1zICa1tvDqphLTJ4oWJwBjKdK7ZT
	Our8tkW/aSACcvEE5wNn8R4HTw15HZw9ES2aj7kOK3lntIAw4wNq4ZCh0RrKdVzoTSK0jfeYdG21U
	XSL9a8kWH9P6hRDt/4kCx5jWCyY+fTGYnSvSP2R0nKdsfp+m+Jh/SRPf6verqeLcDiRfEmKk5aSd3
	fRvVBDFX96zqCZDZrLXja6zisRdSVbaD+stQyDIQd0C6+KR+BlshxBMLKqZjm2nw1iU9gO/bMGm6L
	mV4y7vySylEpGNAzhkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0QP-002O6p-1I;
	Thu, 29 Jun 2023 22:47:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0QL-002O5s-1L
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 22:47:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6686708c986so1152078b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 15:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688078854; x=1690670854;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=C52/CXCSY4Upl0oELDjR0PG6LH5basJXKneC5qhpY00=;
        b=X93psiTh00DlUZ53mb4l6h1YQC3+18ZcZGvqWxVUVju37snbolacY+nwMoVw0Xy95i
         NzLQi/hvByqympaPP3UP7qjfAcAOfqqJx/olH6DWf+eQPrKcMVvJdLIM+7ZJJN3Jd6we
         +6Sj3tKfn1uI96+6IEQwn+dv/9Q7hJJ9BocBQEWeCOulXCqlr7GAZ/Ex9mmFi0oASaZr
         wNSUxiYy5nRy2TLC2hgMMzCeHyZXrvoo8Ui/OPvGGqzpyg4Ryeq7qxZgwWrlw+BWz1BR
         fbkDlgQbIiDXOtoFHjey70DItb/sqQw12jgSErc2JewugZ4ltqrL86tTNXNachIPoqbb
         BFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688078854; x=1690670854;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C52/CXCSY4Upl0oELDjR0PG6LH5basJXKneC5qhpY00=;
        b=N0DVfUlDhIcJxdMhG09gZLuRRvwup5OJTGJ2vg1xfFlEoAQtbDr5c3RzUToGrv5Hx9
         14hNr1RxPlD0PT+9dwR+bnu0hIPSbdy2dvhsEjfgf5F3OxCftrBstGhoOfJvtXb8jygo
         hVsASaBu8Up+hwKJ43MsCvsubQ77gDQmlE7OaTOUrMOoQ3BnG4SmA9+lr6a/vX2Xn/XB
         ura4IdbAFHrFTCM/Q3MYgiK/QhzJQY0X+ieulDd78cjxi1LzHDt0AuxZDXdoSX5Avb4U
         J5klw7IMUAQ2xMufIOkiGhbGyuWpff0kNlcMWk3Xdfi1LIYPrXYOH+MV6J5UxxXeUYh1
         cgEA==
X-Gm-Message-State: ABy/qLYMsAIyaaaRCKewSNoNX2VUUq3shNbTHqqPwVofljVbdbi/q2YP
	1xR+yVC1RFG8SX6UBm7E3ekmnpVAUpEV7vkMW+I=
X-Google-Smtp-Source: APBJJlEmZnhL1whyU7HiGSjyVxLbV9RU240Fk/yu5i8M4SPHPYZJ2RvrZA94t+PVjjGTnWMD11BsFg==
X-Received: by 2002:a05:6a00:2d1d:b0:680:98c:c595 with SMTP id fa29-20020a056a002d1d00b00680098cc595mr1633755pfb.13.1688078853809;
        Thu, 29 Jun 2023 15:47:33 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7810f000000b0065da94fe921sm2618103pfi.50.2023.06.29.15.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:47:31 -0700 (PDT)
Subject: [PATCH] RISC-V: Provide a more helpful error message on invalid ISA strings
Date: Thu, 29 Jun 2023 15:35:03 -0700
Message-Id: <20230629223502.1924-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_154737_693692_32088CC5 
X-CRM114-Status: GOOD (  15.04  )
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

Right now we provide a somewhat unhelpful error message on systems with
invalid error messages, something along the lines of

[    0.000000] CPU with hartid=0 is not available
[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at arch/riscv/kernel/smpboot.c:174!
[    0.000000] Kernel BUG [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.4.0-rc1-00096-ge0097d2c62d5-dirty #1
[    0.000000] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.000000] epc : of_parse_and_init_cpus+0x16c/0x16e
[    0.000000]  ra : of_parse_and_init_cpus+0x9a/0x16e
[    0.000000] epc : ffffffff80c04e0a ra : ffffffff80c04d38 sp : ffffffff81603e20
[    0.000000]  gp : ffffffff8182d658 tp : ffffffff81613f80 t0 : 000000000000006e
[    0.000000]  t1 : 0000000000000064 t2 : 0000000000000000 s0 : ffffffff81603e80
[    0.000000]  s1 : 0000000000000000 a0 : 0000000000000000 a1 : 0000000000000000
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.000000]  a5 : 0000000000001fff a6 : 0000000000001fff a7 : ffffffff816148b0
[    0.000000]  s2 : 0000000000000001 s3 : ffffffff81492a4c s4 : ffffffff81a4b090
[    0.000000]  s5 : ffffffff81506030 s6 : 0000000000000040 s7 : 0000000000000000
[    0.000000]  s8 : 00000000bfb6f046 s9 : 0000000000000001 s10: 0000000000000000
[    0.000000]  s11: 00000000bf389700 t3 : 0000000000000000 t4 : 0000000000000000
[    0.000000]  t5 : ffffffff824dd188 t6 : ffffffff824dd187
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff80c04e0a>] of_parse_and_init_cpus+0x16c/0x16e
[    0.000000] [<ffffffff80c04c96>] setup_smp+0x1e/0x26
[    0.000000] [<ffffffff80c03ffe>] setup_arch+0x6e/0xb2
[    0.000000] [<ffffffff80c00384>] start_kernel+0x72/0x400
[    0.000000] Code: 80e7 4a00 a603 0009 b795 1097 ffe5 80e7 92c0 9002 (9002) 715d
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception in interrupt

This adds a warning for the cases where the ISA string isn't valid.  It's still
above the BUG_ON cut, but hopefully it's at least a bit easier for users.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I haven't tried this yet, but Conor posted the log as we were discussing
the DT deprecation at
<https://lore.kernel.org/all/20230629-angled-gallantly-8fe7451a25fa@spud/>.
---
 arch/riscv/kernel/cpu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..3af2d214ce21 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -66,11 +66,15 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
-	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7))
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32ima", 7)) {
+		pr_warn("CPU with hartid=%lu does not support rv32ima", *hart);
 		return -ENODEV;
+	}
 
-	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7))
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64ima", 7)) {
+		pr_warn("CPU with hartid=%lu does not support rv64ima", *hart);
 		return -ENODEV;
+	}
 
 	return 0;
 }
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
