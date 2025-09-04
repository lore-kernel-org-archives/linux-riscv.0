Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DEECA1015
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 11:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FPdF3dN8N2UqFB1vnKyehTmw8rirTz7g5N9AVNXRKvo=; b=XLBk0Vf+4RVKZD
	AS4Kv8XzvkSRiWQ4VTF5LoB5pcfpEpsJN090SMAsugbeD/g+fce2SE+PFld/2ZbIse+oOgJIZbviV
	kjl++6USWKeWOaPHLip9kflZQpryIZSaX08acfVRgFLW+75YRUeeGUdkgeCyEyQP1qSmCnqK8sBLb
	DdCfoEixI9gjiyb1NaSsXBJqEhxTxv6xr6A8sRzdzujfRZsH4CKC8r17rl08VNSaSBjgbiURah1Zh
	Fs6abnen0qxT6fWmPRfdpxXZH2WHT+9Suwoc/c3SpNMY/WXY5BGOPo8AjibA+IjTXydQG9BAKp4/R
	pA6Dq/C+rxspBCfSuLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu8LU-0000000BIl3-02xW;
	Thu, 04 Sep 2025 11:41:40 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7MB-0000000AwkH-30tP
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 10:38:20 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24c9a399346so7808395ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Sep 2025 03:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756982299; x=1757587099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ktLj96eC6qDTAhpOr75D7Fncxnep+JLnT4FtcC40JJM=;
        b=f8/X+FavnGbwQ7zTxj8mU6krJntIaDh1R+88DOJtVh0cvuDjKiWjaQHE1eUrpF+bqZ
         Rix9Jatf+sakkJxsEsa30LvuxIoFhBChTXH6I7W7Jhca0q+LAftbZ/BzECiI67YHM3ij
         wzR2rNYn2zZISsT6rX8ecaLazJXa7XT3dtZZR91GVC2DBKdcVEJaoHDqW22IKhQvxv8W
         XaF1jsnHqEYc2eqYkE04zCcbiVP/WhjTSLjnvfkaj6iPHfZIA2Ys38EaHEeQ0/cxD+Gb
         c0BOdCkpuoCNF04y3DjdlUwhIAEhCp52qUSAL3bP0Q8/idiZlohDfY+U52t+zb6ZUTMG
         gi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756982299; x=1757587099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktLj96eC6qDTAhpOr75D7Fncxnep+JLnT4FtcC40JJM=;
        b=Youif7Gig7jAKtDi85w8nole8LwDReW9FUjHHgyiVr/6jXKcTeWd3NUMAlgdWH8jik
         Kv6XHkI8+fbgD/wHSPP4FZOWMX6lQiXztNuBiVqK8nYA852ts82Fae+ltku2cO8kEIBF
         SxOBs9rzCTd6sX4QWLGICshc87drG4NfeAwixETVfCZJhawmEg419TEoLD/eAdgY3veJ
         mqGk7fNNaZKGIzz1RUsAIJGKz45Xg+QfPQYiLd/LEPrihvQYQQrHquSEhjuywDJndg82
         ndV606YGLjjDYFMBLVWIOVnOozpoZnGN9IV6tiybFs8jI2dOyIyJFgCw55fjcbW9BGN4
         uAfg==
X-Forwarded-Encrypted: i=1; AJvYcCVlBUMeSOWq+wCTwZWD44yIa/UQGIqVaI+LdvtAnLAyey2ru/WkNnyxKsUzfU3ciq+pTRyp5Twit5fNuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTkGW5Jq/iT5BgdCLzD5metn1CfqWgzQmF/PBYOJBrp58vCrQx
	ZbT3WKKPtgv1qIF8FYRbwC6HnFFjYfPY2jlTeVCtkx7fzgca/gW62H73xmzh3H1VewI=
X-Gm-Gg: ASbGncucbd+RJsFPi0rkhJwnkxZHgg1qUXdcByCcToQM0WmcAHo+Liq9zcKDP6h7v50
	+MiOlvUCCTPK2iBC8QsaWc5inYzzYEdIzcts681hk9gK+xb2SMsgkDRQuQlTXQCTKZEnr0lOQ/n
	2gZZQmbPejerN88QVyHzcmR1zwv4yhDW0XHtn44vHSmNlJmhbKGPLbNIQ4OpVxdK+y9JhPV1CNw
	eYuB/B3OSCysI2vmwusuFRpUqZFBsHVdCeVFbbwnXsF2TMH/bA2VAhNPuP6jqFK7Xyq/Bw8dizB
	nDu4kmXIbWf5ymtrZoGsdSah4Fj6IR+dCTtA4eKoIlkGeeTxnmHWAMgpy0Ltu/NuTUe3LzP6X1i
	RvchRjJjGTfzV10vaPTWNs7Y2/2vAFODnobBJ8n0F1E9VwaT7gHAIDVwdTJ0+zA==
X-Google-Smtp-Source: AGHT+IF9aIk2Z0pYg1hmNIhs1ASNOseLkrqCWdDHEovVy0k8v3ZcvjJUkYiMeYUhSYJyHVnI5ta6nA==
X-Received: by 2002:a17:903:37cb:b0:242:9bc6:6bc0 with SMTP id d9443c01a7336-24944b73618mr248272765ad.55.1756982298763;
        Thu, 04 Sep 2025 03:38:18 -0700 (PDT)
Received: from ubuntu.. ([43.132.141.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77236d7eb7fsm17257854b3a.54.2025.09.04.03.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:38:18 -0700 (PDT)
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
Subject: [PATCH v2 bpf-next] riscv, bpf: Sign extend struct ops return values properly
Date: Thu,  4 Sep 2025 10:38:06 +0000
Message-ID: <20250904103806.18937-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_033819_771012_A1B3ABE2 
X-CRM114-Status: GOOD (  13.65  )
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
the function model and RISC-V ABI([0]).

  [0]: https://riscv.org/wp-content/uploads/2024/12/riscv-calling.pdf

Fixes: 25ad10658dc1 ("riscv, bpf: Adapt bpf trampoline to optimized riscv ftrace framework")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/riscv/net/bpf_jit_comp64.c | 38 ++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 549c3063c7f1..c7ae4d0a8361 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -954,6 +954,35 @@ static int invoke_bpf_prog(struct bpf_tramp_link *l, int args_off, int retval_of
 	return ret;
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static int sign_extend(int rd, int rs, u8 size, u8 flags, struct rv_jit_context *ctx)
+{
+	if (!(flags & BTF_FMODEL_SIGNED_ARG) && (size == 1 || size == 2))
+		return 0;
+
+	switch (size) {
+	case 1:
+		emit_sextb(rd, rs, ctx);
+		break;
+	case 2:
+		emit_sexth(rd, rs, ctx);
+		break;
+	case 4:
+		emit_sextw(rd, rs, ctx);
+		break;
+	case 8:
+		emit_mv(rd, rs, ctx);
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
@@ -1175,8 +1204,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
 
 	if (save_ret) {
-		emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
 		emit_ld(regmap[BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
+		if (is_struct_ops) {
+			ret = sign_extend(RV_REG_A0, regmap[BPF_REG_0],
+					  m->ret_size, m->ret_flags, ctx);
+			if (ret)
+				goto out;
+		} else {
+			emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
+		}
 	}
 
 	emit_ld(RV_REG_S1, -sreg_off, RV_REG_FP, ctx);
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
