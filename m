Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2269ECA101F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 01:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7EiymsAUbuCVb1Czw2x7ESVolnwOgidQyaVhGg5NVUc=; b=opoXYvE7tvGO0x
	D8FhLCCHsXmHDh5xA8nurxOvA3CUHEmhgKC3eBzQchoAiYfmKFDKKBae6nYQY2YgnmNXpFEsSo5XL
	s6Zlxhxq0owijELs4CT/k9jJzyXy6yitDhr8lN74TgBoU6tmnayVXfz1998NDehL5ouB2ecXqmc1G
	hJp4ZeWsHfmdAcg+wQCBQHb8BJ6x1crVBdFOHK6FtthL3mWTCnH57GrJh6YRq8rozB1/Uoi3P5IM6
	dsDL4bq9NuG8x8gA1DtCNKpQlgc4qCgveSUdy9wfdMErnTfrF/uorM2hnEiyfiiR/CjAwS2oTTt3y
	YzZ4RtEZkVxvvv6+bwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQkR-0000000Dnc6-3QIC;
	Mon, 08 Sep 2025 01:32:47 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvQd0-0000000DlbC-1Lry
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 01:25:07 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so2407819a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 Sep 2025 18:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757294705; x=1757899505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uzw6hQQ7M5B5xk9kBfDEuQjeyMGC+VPV/lN83f90R+c=;
        b=VCGXAid8jrrKBiMC1vMDJ5ODPX1Mkz4bJjfJO8VCqIG5HsVYdfbm3UKdovLBEk/YZ4
         XlYAtpJx35dtIjQtwJS9dUzda1uhzd2aTB8T+qciOZL8L2j+hbERrkXlSTssDexgTpuK
         RAyFO3EA3ZTamWNlIrOE0VITx1iDYhncl4Sd1IrLJHqhn1Pc2QGecf3gPWS23QsLorr4
         I2vGlrwABjG6nzC3XfLT9rbjmW28rvQo6dIP/NccwYT4JPW+Rpv6uOdCShdM8C6G2xpI
         Xc+CUrLcpiWo7I396n7zt2JhZAA8nUCYdg3bFFD6mH/fvPBSz9/bekRQy6wQyKCHT+rp
         Z6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757294705; x=1757899505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uzw6hQQ7M5B5xk9kBfDEuQjeyMGC+VPV/lN83f90R+c=;
        b=sedF8wHAGAjCEaYGi14YJuMHmcIXWfAy5evD60C2ganxbPIx1jdV29Lno+vn9/VCc/
         2g3KSXDnNo3r7czMNKxsZkgl7AoiwsImZI9BfSLVmSpA/oCDGoHcD4Um3kzEjqMM8rjP
         syNQFbRROSfwIqmhE2W0ipSaPP4ldiD0KX5en49MDQyFfEwoZAbq6AZwpcrYhEahW9+L
         celVJqurhRKvKhGWC0/a6JDgLRES4orv/adV64EoTED5jtdz1GBnhmy9ucGJene05jo1
         93HjHkTQ42Nni5JJRgIpXcKTlsh/+4+Yax2CluE4xYlUyillhpKnWOc8W2XVDbTsZ35F
         PgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY0js0KMygnHDWM3SuJIjEbSVZ1x90L6CNoPczLVaSrTU1ToodNH4wavblyX1UJ3ZwR2GfO1He3i1YxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk4LGCT8QcLGpLfZf23vkCZX2WBfDM/dk+fc0I3vszZIYB1+8p
	YVfivf0UxrJtevX0X+a2GOGxhZ7u9s11EQNtGoJBShwSrHdWqyJKhvPl
X-Gm-Gg: ASbGnctQ6r5c2kaB6sZGSICh7+BsvQ4eKxvYVCUHfGd0z/kPZs/+j5pUOAcsZm0JG7w
	P5SRpPwn7vVyohPUWKfhv29R8skG0lipAfq88IxzVH0uG/WpvgUR6CQUU5B5LR1KttseWQukKQB
	ZRdeY+bNZvH32YrKOdYwq2JalpPNwrtZ3I1TOHC19yc1ujxMWCCACKTcAsc5bNMuJ3ax4+v35XW
	tzfBPtf2u9d44GdeSSy/28QHa90Ns0xsyspk2g/1jd2V+sr+CkQLFic3tgQxW0KozNZIu1Ps5K8
	rNaFamBGhxKLjNmNJ1GGQPMtlDX6IyyN10CctNHUrIjUeLB8yNdWO/5yoBBzWraBi1U6NhkDH56
	RQ5O2ZYTqWMB69iH48KeZnSK2+o36OWR6An2kiMmUoJGb
X-Google-Smtp-Source: AGHT+IETyclgoC3/kP2x/Xtmcnc4HLt8X24CdhRyQ7WeY9046AXJnN9GiR46XdEO9ZMshU4kGunA6A==
X-Received: by 2002:a17:902:ec8a:b0:24b:74da:627a with SMTP id d9443c01a7336-2516f050096mr100680835ad.11.1757294705193;
        Sun, 07 Sep 2025 18:25:05 -0700 (PDT)
Received: from ubuntu.. ([43.132.141.24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ccfc56ec1sm94646545ad.59.2025.09.07.18.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 18:25:04 -0700 (PDT)
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
Subject: [PATCH bpf-next v3] riscv, bpf: Sign extend struct ops return values properly
Date: Mon,  8 Sep 2025 01:24:48 +0000
Message-ID: <20250908012448.1695-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_182506_363099_583FC970 
X-CRM114-Status: GOOD (  14.11  )
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
 arch/riscv/net/bpf_jit_comp64.c | 42 ++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/net/bpf_jit_comp64.c b/arch/riscv/net/bpf_jit_comp64.c
index 397968d6ee09..a860be52dc49 100644
--- a/arch/riscv/net/bpf_jit_comp64.c
+++ b/arch/riscv/net/bpf_jit_comp64.c
@@ -711,6 +711,39 @@ static int emit_atomic_rmw(u8 rd, u8 rs, const struct bpf_insn *insn,
 	return 0;
 }
 
+/*
+ * Sign-extend the register if necessary
+ */
+static int sign_extend(u8 rd, u8 rs, u8 sz, bool sign, struct rv_jit_context *ctx)
+{
+	if (!sign && (sz == 1 || sz == 2)) {
+		if (rd != rs)
+			emit_mv(rd, rs, ctx);
+		return 0;
+	}
+
+	switch (sz) {
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
+		if (rd != rs)
+			emit_mv(rd, rs, ctx);
+		break;
+	default:
+		pr_err("bpf-jit: invalid size %d for sign_extend\n", sz);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #define BPF_FIXUP_OFFSET_MASK   GENMASK(26, 0)
 #define BPF_FIXUP_REG_MASK      GENMASK(31, 27)
 #define REG_DONT_CLEAR_MARKER	0	/* RV_REG_ZERO unused in pt_regmap */
@@ -1175,8 +1208,15 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
 		restore_args(min_t(int, nr_arg_slots, RV_MAX_REG_ARGS), args_off, ctx);
 
 	if (save_ret) {
-		emit_ld(RV_REG_A0, -retval_off, RV_REG_FP, ctx);
 		emit_ld(regmap[BPF_REG_0], -(retval_off - 8), RV_REG_FP, ctx);
+		if (is_struct_ops) {
+			ret = sign_extend(RV_REG_A0, regmap[BPF_REG_0], m->ret_size,
+					  m->ret_flags & BTF_FMODEL_SIGNED_ARG, ctx);
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
