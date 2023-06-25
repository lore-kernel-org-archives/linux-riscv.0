Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD46EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 15:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIF6AtgTabMvJ9a5ZgvoK+cnhcBVY9DYgBJ5WmImrIo=; b=tLDgMSiQ0kbVNK
	oqvgspJWKPqar5zPmdEZVGWSIdeggl/IB7B8qzKm6sy5f3fvKhH+wy+83saOjPYyce5/vtKr88ckd
	I6O+gondzeeOCJh+JKfLeyNV0qtV9WWa0sPN4+E9qj+ummg+ub6+xWQKYhWN4Rp5vt9SEoMwsRoqq
	a/b7m9iVctTI9RuunwCDhY0CzLJ207PilCuS8656iAt/oxM7TByLazykszyqxIWEWyMHLSR6TippE
	7e/3Eyu86N+AwK5FA4PbsgZ+JBXP/fSIMB109vivapqUq2qfBJg+hT4J2S96C5Xq/Qq7qWsApn4at
	fG5/3Gyc1+i87U5lmwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDS4V-008FQg-0h;
	Sun, 25 Jun 2023 15:54:39 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDS4R-008FPo-2z
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 15:54:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-668711086f4so1541051b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 08:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687708473; x=1690300473;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm0YHk9E4TjGi+mptYCEwrzbtCNHUYnN3tCdH8cG8RE=;
        b=LgAYrDKt/VuX88XVOEOOemi2wCnDBfvu9GjOFVgoRZAsrMAS+9yTqxFfIMPu8cnPkN
         MG4GYKYuxCth3GoGMXXZfbRlKKmx8KRQ+UFO+HuA8MqJ6RQmk+txdGq5IMjZnJPOnJdG
         BzMm0uG6IRiFKngAUNvpI2UHVA16QlHEcpueWgegGr1UxrlV9vqln7IgDjf12FwXT+Ep
         GpInU1uGySQVbSoU6hEbnALoQ06n/3q6JIgCDX6lCBwoBONUUmUmKd/ON1TVg0f5a+Gd
         NAD/a6PTCEiqeEK09DWRUKb8hUa2GUF75qJpNiRu3luKIRHD3GaO3/nNEXCHp/527bmh
         leTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708473; x=1690300473;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm0YHk9E4TjGi+mptYCEwrzbtCNHUYnN3tCdH8cG8RE=;
        b=NqlfiuRW8eygIe4lcvJjL2hDyvvLSXqeyiHlR9mIjrKQt3x0hmMu9Mvyth74VU5uJA
         xlQUEsA8xlKBa+9ln18daQbGqTxJyKOOczKQdKejKgNh9YOk96rlbEQzhfjVoQGgxj0Q
         yll1VAKc4s5bX+bO6zGdsSpejX8nJ2Du/1dispCtvj5pBeKKKi/14rnLRMiZGPW389eK
         PfCavRcaE2qYP9YW5+HUhFc/E8XSC5+bdRGgVXF+NnuHcO3di43McMwE1/eXQa2sYpya
         dTzK1T/HiUATrRfD6Z55RF8MtVTC5cNqX28DQSwB+uZkvl5+s9HznwvSfM86YXESA1oK
         hDdg==
X-Gm-Message-State: AC+VfDybdVAz9BZJmUFGbt2GGRPO89gWZYtrJJyDog2Ni9GJa6L+txHk
	jPRu6D2K9K3CuTNQs+f9Sq3ymcmRA+pS50Epbdzrjv4BNmRwisGMQ/yj10mEX9xDvTOJv7Tepb7
	NkHcW/4BPrfEY74FtUXf4L7PR85g96+JuqYRG9g3JcwStm1KNpYAKWXVF8TfFO42GtKiie2EQ42
	RzxkxVxOoPCiA+
X-Google-Smtp-Source: ACHHUZ57GFMQXQ7wTN8tUG+n+M0yxpH2Z1TavLPCGspR5byEl4VCFnRW1SfwJC9naZ62gDXvzkoZ1g==
X-Received: by 2002:a05:6a20:a121:b0:126:23d:cd10 with SMTP id q33-20020a056a20a12100b00126023dcd10mr8673939pzk.21.1687708472818;
        Sun, 25 Jun 2023 08:54:32 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id x21-20020aa793b5000000b00673e652985esm985123pff.44.2023.06.25.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 08:54:32 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Mattias Nissler <mnissler@rivosinc.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] riscv: vector: only enable interrupts in the first-use trap
Date: Sun, 25 Jun 2023 15:54:15 +0000
Message-Id: <20230625155416.18629-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_085436_035168_6705E8CC 
X-CRM114-Status: UNSURE (   8.56  )
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

The function irqentry_exit_to_user_mode() must be called with interrupt
disabled. The caller of do_trap_insn_illegal() also assumes running
without interrupts. So, we should turn off interrupts after
riscv_v_first_use_handler() returns.

Fixes: cd054837243b ("riscv: Allocate user's vector context in the first-use trap")
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/traps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 05ffdcd1424e..1595e246bda1 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -149,12 +149,18 @@ DO_ERROR_INFO(do_trap_insn_fault,
 
 asmlinkage __visible __trap_section void do_trap_insn_illegal(struct pt_regs *regs)
 {
+	bool handled;
+
 	if (user_mode(regs)) {
 		irqentry_enter_from_user_mode(regs);
 
 		local_irq_enable();
 
-		if (!riscv_v_first_use_handler(regs))
+		handled = riscv_v_first_use_handler(regs);
+
+		local_irq_disable();
+
+		if (!handled)
 			do_trap_error(regs, SIGILL, ILL_ILLOPC, regs->epc,
 				      "Oops - illegal instruction");
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
