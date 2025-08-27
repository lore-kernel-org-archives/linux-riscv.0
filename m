Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836CFCA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xWTNFROo0Y/RxGFWAer7BuDcE8STEdB6TyAqvZ0CY2U=; b=vFWFDJhnEwPUvG
	o54P9q2Uhwd8T+jt3sVfX+hDF941JhzFqFpf2zvVUpY8l3SLIhD+Zr63QKJyaqxq3g8nXQatx2LmF
	3Sgb3IxZUNzy7WAW6aZndcpWPmL9OCWDcSPhM398WRnhEsTfdVTzLMXdN0qpCD2+VBoPacoYEB2Cy
	OV71ZOmAVXLgVk1QT1HRZSkVhESq1N0CRK0PpwDOOFVZp470BzDiThnF0k4SF1y8B3PkpmKXGH4iK
	MT4hrtFfLx9Xv6jxLCAygmsalAe0wQQzHi75IWatTqPJWp77ob//QEiM+OxSuvNmkkl+LiERGh7oA
	3Nckgp06KiXGdwsQMezg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIQV-0000000G0m3-07kU;
	Wed, 27 Aug 2025 15:51:07 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEsm-0000000FNKR-1UmV
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 12:04:05 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b109c58e29so125984461cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756296243; x=1756901043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh7qX3heP82/xvGRdFcTI045iSa1lfxsBF6MYN2KcOw=;
        b=Oj4eBRwZ6fy0NkJbFiZSL8UGOzyyVgC+3l0wtHHnIun7SDmeM96r5726g1SQWPyhYt
         IgqgZDEHsdLDmlCUkqZpz3GhAhUn5h5ejk9vnbB9iSX7FS5hwPn4F2bV1DACfjZYqb3/
         bt6JMluYeVMe/2B6l1CLJyk/cd1vTIJbc0N2UiByfd8wkpVmKRpUx/uS15s2IyUWqG5A
         Cl4syqp5v7YNI8A/gw1Oi1sSgpWYfyvOWTMc470Kg/CRNa0xo+ncxCDd0rhHa8F8M0Qu
         0Dgo1KL58TrJ4e4U4WkUy3zqpBK6CoSrY+iZN17DMwyMzBibAAp+5I+FKGLMkToxICvz
         ctug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756296243; x=1756901043;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh7qX3heP82/xvGRdFcTI045iSa1lfxsBF6MYN2KcOw=;
        b=MnL/qSPpX5zOkvoFRO446JkoSviIoaH5RtaqxD8QW84mIHfBh5strzJLMg8u2VZDRe
         0nrLqT+1nvNnA6Dqypfz/Jz/xq+K6qe0y19i1apY0tSLDmQ7Ss8xmDGT/PZhSSNPIZaD
         7sDwKSYWbEB4BlyZMsCNilczZxYl0snhbSJP+1K90MwZx2tS2b3Q3Q4Aumu9kJNEim7o
         b0PjGQn8uaExHBUZ2aZxN7UFAEURhjPqtpvDuDv9u1y3oJaGhL6uaJJrOylUADaZGlp/
         84Vq7oug0eo/CVDnrWIQYHgB903C2ude9Oih+xygOPjq+RVlNuRrLix11HTCwyKXw7ee
         KcrA==
X-Forwarded-Encrypted: i=1; AJvYcCVxttSO4a4gt3/+gkWa4ibsBfQuLHGwH00hEIXYmTMllsaJYPJhzDymSV6+Uary39E0CvrTElB3fK4uKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK7S+cMACaDZq28CIFWjGdIFGD87yQ5iX5FVkndMbgD3L4yglx
	/Vzwb005clSFQKE7VzRSLT2pdBoS5tRx1qz8BK2qTe64S5F6vWFn//wK
X-Gm-Gg: ASbGnctMb9LTTmzQVtAySCzqezLmahuKaXFdeLJLoQ1EdP9xf5W6kl8v27qSQG+cq10
	ajr9M3Hf0FHF0alIYiqBfyD0qU9fuv2pnXuShgL7kkxlR5SmNbkg7v66ZI6zwcQVbU6EWtrWmHs
	zL0XAD3eqWvqG2m0dJazok6oM7BXB3k++Iglxwc4bxJRYsqKgyDkBxS4qlKWfKYaDrgLWTKX9xV
	padu4dr1BpaI+i9U5cegdt3M0ZRySWzB4MunkLWNbezArDeZlseIZAx0KO3VMxfLYeaPTaFV1nd
	YERyXoi/TJZ8DnnxcJJ/mQuSiIoL/fAC0Laf2KAWZzUB7NnE/iyxYgFQsMg3gZYh0aYDJujMeJJ
	dNNqEQqgKh4+ilfo4foNse+dC/TmsNtgzg+rQZngP
X-Google-Smtp-Source: AGHT+IEkreAUdFea/dTdA/eLgslTv14Osti7kTMUmukoBVeQqTVBjgPGnMV/CBIaXJPNaKk1CQBCjg==
X-Received: by 2002:ac8:5e07:0:b0:4b0:6228:b3e7 with SMTP id d75a77b69052e-4b2aab4abf4mr197233561cf.43.1756296242625;
        Wed, 27 Aug 2025 05:04:02 -0700 (PDT)
Received: from ubuntu.. ([43.132.141.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8c61acfsm92067921cf.7.2025.08.27.05.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:04:02 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org
Cc: bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH] riscv, bpf: Sign extend struct ops return values properly
Date: Wed, 27 Aug 2025 12:03:44 +0000
Message-ID: <20250827120344.6796-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_050404_402863_99579414 
X-CRM114-Status: GOOD (  11.98  )
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

The ns_bpf_qdisc selftest triggers a kernel panic:

    Unable to handle kernel paging request at virtual address ffffffffa38dbf58
    Current test_progs pgtable: 4K pagesize, 57-bit VAs, pgdp=0x00000001109cc000
    [ffffffffa38dbf58] pgd=000000011fffd801, p4d=000000011fffd401, pud=000000011fffd001, pmd=0000000000000000
    Oops [#1]
    Modules linked in: bpf_testmod(OE) xt_conntrack nls_iso8859_1 dm_mod drm drm_panel_orientation_quirks configfs backlight btrfs blake2b_generic xor lzo_compress zlib_deflate raid6_pq efivarfs [last unloaded: bpf_testmod(OE)]
    CPU: 1 UID: 0 PID: 23584 Comm: test_progs Tainted: G        W  OE       6.17.0-rc1-g2465bb83e0b4 #1 NONE
    Tainted: [W]=WARN, [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
    Hardware name: Unknown Unknown Product/Unknown Product, BIOS 2024.01+dfsg-1ubuntu5.1 01/01/2024
    epc : __qdisc_run+0x82/0x6f0
     ra : __qdisc_run+0x6e/0x6f0
    epc : ffffffff80bd5c7a ra : ffffffff80bd5c66 sp : ff2000000eecb550
     gp : ffffffff82472098 tp : ff60000096895940 t0 : ffffffff8001f180
     t1 : ffffffff801e1664 t2 : 0000000000000000 s0 : ff2000000eecb5d0
     s1 : ff60000093a6a600 a0 : ffffffffa38dbee8 a1 : 0000000000000001
     a2 : ff2000000eecb510 a3 : 0000000000000001 a4 : 0000000000000000
     a5 : 0000000000000010 a6 : 0000000000000000 a7 : 0000000000735049
     s2 : ffffffffa38dbee8 s3 : 0000000000000040 s4 : ff6000008bcda000
     s5 : 0000000000000008 s6 : ff60000093a6a680 s7 : ff60000093a6a6f0
     s8 : ff60000093a6a6ac s9 : ff60000093140000 s10: 0000000000000000
     s11: ff2000000eecb9d0 t3 : 0000000000000000 t4 : 0000000000ff0000
     t5 : 0000000000000000 t6 : ff60000093a6a8b6
    status: 0000000200000120 badaddr: ffffffffa38dbf58 cause: 000000000000000d
    [<ffffffff80bd5c7a>] __qdisc_run+0x82/0x6f0
    [<ffffffff80b6fe58>] __dev_queue_xmit+0x4c0/0x1128
    [<ffffffff80b80ae0>] neigh_resolve_output+0xd0/0x170
    [<ffffffff80d2daf6>] ip6_finish_output2+0x226/0x6c8
    [<ffffffff80d31254>] ip6_finish_output+0x10c/0x2a0
    [<ffffffff80d31446>] ip6_output+0x5e/0x178
    [<ffffffff80d2e232>] ip6_xmit+0x29a/0x608
    [<ffffffff80d6f4c6>] inet6_csk_xmit+0xe6/0x140
    [<ffffffff80c985e4>] __tcp_transmit_skb+0x45c/0xaa8
    [<ffffffff80c995fe>] tcp_connect+0x9ce/0xd10
    [<ffffffff80d66524>] tcp_v6_connect+0x4ac/0x5e8
    [<ffffffff80cc19b8>] __inet_stream_connect+0xd8/0x318
    [<ffffffff80cc1c36>] inet_stream_connect+0x3e/0x68
    [<ffffffff80b42b20>] __sys_connect_file+0x50/0x88
    [<ffffffff80b42bee>] __sys_connect+0x96/0xc8
    [<ffffffff80b42c40>] __riscv_sys_connect+0x20/0x30
    [<ffffffff80e5bcae>] do_trap_ecall_u+0x256/0x378
    [<ffffffff80e69af2>] handle_exception+0x14a/0x156
    Code: 892a 0363 1205 489c 8bc1 c7e5 2d03 084a 2703 080a (2783) 0709
    ---[ end trace 0000000000000000 ]---

The bpf_fifo_dequeue prog returns a skb which is a pointer.
The pointer is treated as a 32bit value and sign extend to
64bit in epilogue. This behavior is right for most bpf prog
types but wrong for struct ops which requires RISC-V ABI.

So let's sign extend struct ops return values according to
the return value spec in function model.

Fixes: 25ad10658dc1 ("riscv, bpf: Adapt bpf trampoline to optimized riscv ftrace framework")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 549c3063c7f1..11ca56320a3f 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -954,6 +954,33 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	return ret;
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static int sign_extend(struct rv_jit_context *ctx, int r, u8 size)
+{
+	switch (size) {
+	case 1:
+		emit_slli(r, r, 56, ctx);
+		emit_srai(r, r, 56, ctx);
+		break;
+	case 2:
+		emit_slli(r, r, 48, ctx);
+		emit_srai(r, r, 48, ctx);
+		break;
+	case 4:
+		emit_addiw(r, r, 0, ctx);
+		break;
+	case 8:
+		break;
+	default:
+		pr_err("bpf-jit: invalid size %d for sign_extend\n", size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 					 const struct btf_func_model *m,
 					 struct bpf_tramp_links *tlinks,
@@ -1177,6 +1204,12 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 	if (save_ret) {
 		emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
 		emit_ld(regmap[BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
+		if (is_struct_ops) {
+			emit_mv(RV_REG_A0, regmap[BPF_REG_0], ctx);
+			ret = sign_extend(ctx, RV_REG_A0, m->ret_size);
+			if (ret)
+				goto out;
+		}
 	}
 
 	emit_ld(RV_REG_S1, -sreg_off, RV_REG_FP, ctx);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
