Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18F3CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 20:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6twugW/zRjuD6/prSIyovIYy5zz8kc1foNGEBZsLWL8=; b=4D9qQ4YmOJzIRH
	J4C8HBFB+qpBof+e99z+/9EyYOrkVPBVTyiA88Fd4P7j74vZT6w5955OSnYzRoNUlTYpm9AR3aYpF
	b5jqtOG1qEAuaOrRNta/fKmzE4eTbRQHOt1Jd3cAyhhMeeZ7q9hY4+PHaruSMt9xB3dsO1nyxq0fI
	RU30AtQDqdAk7gFGz7juO7X9vrlGHwDIgluajSYoJIa/ufYZcsnhcCRGYZTxbMkrkumQTqAcO0TlO
	uByAGoRebLUrSCiHQAuQpaRxXGoi7S2pD7CKWN0YoJD94dgml+F+0hse+nKZ7pE8OcAI7ENpd/uSF
	yeiADsfAaXk87RS2aKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWD2-0000000Dmu6-3FEp;
	Tue, 02 Jun 2026 20:59:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWD0-0000000Dmsv-3UPj
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 20:59:35 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c8584bbbf2cso2481315a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433974; x=1781038774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtyaF8m6RLOpOeiX8WoJduU1Pm23yBD2PG4I02qCKQE=;
        b=VAXom739A4m3YQ6laZn7bpXJCb7oWlgXFEBGJnIINteFDhr9T5rRR2fJAOGnrmXMVo
         W0MU2QrM1CZzzoOYKDdFWyPSS36RqxYhc1WOuKuNmpk/t/y0t8JzcMvWr/t8K17VK7fL
         m5KcXzGY0f0qK/yYAQzjheGjDBzyCcu6huEtUj5E0oB6H8p1Y6f6/rbLZoKlvkpGx4pu
         0LwmWY429K0V+ey7FcsF1XDZwCZDyI0hcQ7pfl6vDs8tD+fbVGD+Az+wb1KmbU6fQvpR
         G+//RaWkWoRyEWmz2jm6MkJW3VcvorZACYm2eo0r8Mh1Qs97XEZt8iJJbH9tpuawr6Dk
         29mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433974; x=1781038774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FtyaF8m6RLOpOeiX8WoJduU1Pm23yBD2PG4I02qCKQE=;
        b=AhtL3rBpYWT6naphAIlMgjzJybyPMM/RR4mSK61MxgT5ZVvLR+33uwAaASDgUyvKb8
         p5cJNp+qL0N1cyU6A2Um1tTPXgnvBG2BsocUlOPrEAIpJ3s8OrV2Lxujdr7nWAWRGL6D
         SAC68AVqqyjgAxxBnWdwiaRKnLD2eu9PpzaCbh+BWHwQ+UPsQQ/xhFglWaqjyp7OFuKQ
         UaTevQ4r4qJq71bwsOqdcay5GQVRGUiRc+Nu6HbNgDWFnJ0uriZqgTdwMffG1G6TYmRt
         fji/QxTLyfX8GzBGtPEfV4XJDgNUPbjHJMmmdctT93I2dEUXEkd2RKf0mWGJZqFUJGYu
         mQEw==
X-Forwarded-Encrypted: i=1; AFNElJ8qUaUx01I0dGK/Xz5+HGMc5DYVqw0Edi+bhghIfGaWOyMWsx0JZkEQP65NowaNxlwsqloJ7tCXZySBFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwniAosu88e2vM1FOte6iIPlZuyzhINFKRdIw5w50tW660oWxwk
	0yJmPx8YZo+t8a9EVEzXCzuafNQu/Yj4XqsBfwcLhGaGGXCt7bvW60qv
X-Gm-Gg: Acq92OGDDU3CzlTu7nfe825o+CZnzSLZM3/e20G9dOLYUcA3gYOL7hyCxiRgAUtI+N6
	YSaB4Fz1145iJpeN5m+yFxzUgBOuNRzc00MOe/M2P0esY6/CQwA18j68kLPVH4dGxHwb8fTSFXk
	p4f+T1MCOx067lQGGl5uQv0ORyY9Cg0D6iZ6SfNYHd7uytIAKnCBKSOFaKJi96N5c6NTk6onF1/
	mjULuOCDTdpZCJMoT7f30URS5Tddogw17y7y7Jm7bGPOjCFpb9Vl5TPBVWll3QjOwADZt8h3C2H
	64qxgckGvDA5tYp8UDeH3OG1HHDv6vMIkKp44KqIfqGqWIP0bhrq8Gs/zMuwbY5EpatSi1SIlq7
	zdHXocJYhCZQvfOC48neQRk07nz/NXlhkgPnW8lTwFIoYU4UNqvRdxX2nsUduKcJcKDrRvk95lL
	sZDzaSA9wAOLRkR1wwppaeaLs4NNIOoumQu/9MU/kVcmY2D9PFPsleAztT4mQsg4QJAIULs/J34
	nbA43p+jEjSsWIQ
X-Received: by 2002:a05:6a20:b598:b0:39c:126c:93b4 with SMTP id adf61e73a8af0-3b497449d82mr542621637.9.1780433973930;
        Tue, 02 Jun 2026 13:59:33 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm157354a12.8.2026.06.02.13.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:59:33 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	puranjay@kernel.org,
	menglong8.dong@gmail.com
Cc: martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	pulehui@huawei.com,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next 2/2] bpf, riscv: inline bpf_get_current_task() and bpf_get_current_task_btf()
Date: Wed,  3 Jun 2026 02:28:47 +0530
Message-ID: <20260602205847.102825-3-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602205847.102825-1-varunrmallya@gmail.com>
References: <20260602205847.102825-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_135934_878137_E3AA00BF 
X-CRM114-Status: GOOD (  10.93  )
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

On RISC-V, the current task pointer is stored in the thread pointer
register (tp). Emit a single `mv a5, tp` instead of a full helper
call for BPF_FUNC_get_current_task and BPF_FUNC_get_current_task_btf.

Register bpf_jit_inlines_helper_call() entries for both helpers so the
verifier treats them as inlined, and add the expected `mv a5, tp`
annotation to the riscv64 selftests.

The following show changes before and after this patch.

Before patch:

      auipc  t1,0x817a    # load upper PC-relative address
      jalr   -2004(t1)    # call bpf_get_current_task helper
      mv     a5,a0        # move return value to BPF_REG_0

After patch:

      mv     a5,tp        # directly: a5 = current (tp = thread pointer)

Benchmark (bpf_prog_test_run wrapping bpf_get_current_task in loop,
batch=100, 10s, QEMU RISC-V):

              | runs/sec  | helper-calls/sec | ns/call
 -------------+-----------+------------------+---------
 Before patch |   173,490 |       17,349,090 |      57
 After patch  |   320,497 |       32,049,780 |      31
 -------------+-----------+------------------+---------
 Improvement  |   +84.7%  |          +84.7%  |  -45.6%

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c                         | 9 +++++++++
 tools/testing/selftests/bpf/progs/verifier_jit_inline.c | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 2f1109dbf105..e2c70c70cca8 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -1808,6 +1808,13 @@ int bpf_jit_emit_insn(const struct bpf_insn *insn, struct rv_jit_context *ctx,
 			break;
 		}
 
+		/* Implement helper call to bpf_get_current_task/_btf() inline */
+		if (insn->src_reg == 0 && (insn->imm == BPF_FUNC_get_current_task ||
+					   insn->imm == BPF_FUNC_get_current_task_btf)) {
+			emit_mv(bpf_to_rv_reg(BPF_REG_0, ctx), RV_REG_TP, ctx);
+			break;
+		}
+
 		mark_call(ctx);
 		ret = bpf_jit_get_func_addr(ctx->prog, insn, extra_pass,
 					    &addr, &fixed_addr);
@@ -2138,6 +2145,8 @@ bool bpf_jit_inlines_helper_call(s32 imm)
 {
 	switch (imm) {
 	case BPF_FUNC_get_smp_processor_id:
+	case BPF_FUNC_get_current_task:
+	case BPF_FUNC_get_current_task_btf:
 		return true;
 	default:
 		return false;
diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
index 885ff69a3a62..76d80605ec7f 100644
--- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
+++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
@@ -10,6 +10,8 @@ __arch_x86_64
 __jited("	addq	%gs:{{.*}}, %rax")
 __arch_arm64
 __jited("	mrs	x8, SP_EL0")
+__arch_riscv64
+__jited("	mv	a5, tp")
 int inline_bpf_get_current_task(void)
 {
 	bpf_get_current_task();
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
