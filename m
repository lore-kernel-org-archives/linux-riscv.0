Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB533C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGhUx3WPMXe1D9XI3G2gC/oHVn9h+Za7IQP7Hl+CFaY=; b=tViEUgcXTFGnOd
	bLlc1oeSvzHo4WGzGC32TzbNZoq8ktJGPsQEIgSuugSkL2i9mfH6TNMY/U6R/iXdhK7ZGvSiKbnfe
	MlxNA8jsMimj6TdqGDY+bW8T5Zk+1tzz828kgBC9bzLG+vpCBSgdwjSko6zLXa/e144XRR7DEhSyl
	O2nHe2/UL7rkfnuX34rAuT4I1E2MevZY4XbBsBqr/S0ZimHsifnTcxdm/o7rwd4Ythhv1+nx22pRN
	ERIsgqZ5jKHJCD8BIQdyeqjJTmEHtrkz8aHKH5/NhJMGtO/+Gbz2JmhZaPLIgJyYES0q0721T7IV1
	D+eOoeeQU3mQNVmqdrsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDSW-00000006NJR-451K;
	Tue, 26 Mar 2024 20:31:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDSS-00000006NEW-3yRE
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 20:31:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so296841a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 13:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711485095; x=1712089895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lh9U/vyewLtbDFJmjDS8r3hvigj8QyKr7Iw+wfw7H8=;
        b=dcYpGJdd0Jgqlzg5elOzbsQ7eP8haypYwdrVWgf4qj7BH3R29rofuquDv7M7hQ5ZSl
         fjJyzEV5RxsdSLGya8eXU3BX1NdAryE/pvlgJ003Ctz6Sq3ZDXlTNA1z1yNmMIi3saJB
         /tRxePwURkgvO0OpIZ+CbsV5cy4AAS71mPv+MZGxYYHh/1vmNLnFU3/qn3qNFioUcFKz
         Ps7aSbqLCrit8Pc1fb88dd9p7oALah1qL1QBWlDsSvCXlUK2l0Y1HpD8/W2IMdli4rj9
         GejZiV/LAn9Zc1WMxa0qONyfXt37sDTZNkZJPYbsTfT42/Gnrkce5W6vTmNfW/OGY2LU
         B2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485095; x=1712089895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lh9U/vyewLtbDFJmjDS8r3hvigj8QyKr7Iw+wfw7H8=;
        b=nqN+DuJUgbFpbGTeJPD2mtRtYNFpH45UNSFGrpRXoK+dUm4DGKYbw2fAMYluBcKVCh
         hEHjBjXDGpra1coQvxSb7iLKP8UzcQ6Nmzf2XoLnyS4ocDQ5qaQRx7CFwilYNFMUD3h1
         qIk8+nXFyfSIxT2VU12G4QGri1Ac9tJA0gm+JgP8tsgDEDfUQnYKHtWeo4LMMcG81cAK
         JZMCPi+WI/zLqDs2vuDoBd/FbsvxexbbLtewsGwFB1cLUd2VVvBBXTlC1/YCsQcbAWa8
         xmuorfgBlGx411Ar799Ir1YZiBfrAMEYGNH1GpEMzMF5DtJxqAien6JyHPC2FV9FHgxC
         Dk0A==
X-Forwarded-Encrypted: i=1; AJvYcCWHLrX1iZNjvzxuzy1GHBQosnpcR2rjZR66mtig8UWXgntkuHT/ZN6gWYgqxyfzyNv1dLpYgePsvCzxBlUJS+Yd3ej68rFPZLfcX6y+PNi7
X-Gm-Message-State: AOJu0YytzozYVb3R7tB1bxfRWkzT8/fVmXD5dTNHLV+7jzlvcuF5zTqh
	FOVCuGXTzORRoUR2DiCo6xJ6XWNPXdLmotDokgtYNmGngVxHJ7Bq8Fgg5Uv5RfZdMVLDVaSiYYG
	M
X-Google-Smtp-Source: AGHT+IHn5ukEbrOXa/xSQN4+acm8vFx4OO0mc31kNe5p13cGaOnb1+adQLu+u+OBPHzLUDOI3daDvw==
X-Received: by 2002:a17:907:7213:b0:a4d:fb90:4a4e with SMTP id dr19-20020a170907721300b00a4dfb904a4emr1302204ejc.2.1711485095264;
        Tue, 26 Mar 2024 13:31:35 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2a02:8440:5240:d2b3:9657:7432:d88d:84a9])
        by smtp.gmail.com with ESMTPSA id ae12-20020a17090725cc00b00a47522c193asm3273954ejc.196.2024.03.26.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 13:31:34 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Zong Li <zong.li@sifive.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>
Subject: [PATCH 1/2] riscv: Fix warning by declaring arch_cpu_idle() as noinstr
Date: Tue, 26 Mar 2024 21:30:16 +0100
Message-Id: <20240326203017.310422-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240326203017.310422-1-alexghiti@rivosinc.com>
References: <20240326203017.310422-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_133145_124969_A110DB31 
X-CRM114-Status: GOOD (  10.21  )
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

The following warning appears when using ftrace:

[89855.443413] RCU not on for: arch_cpu_idle+0x0/0x1c
[89855.445640] WARNING: CPU: 5 PID: 0 at include/linux/trace_recursion.h:162 arch_ftrace_ops_list_func+0x208/0x228
[89855.445824] Modules linked in: xt_conntrack(E) nft_chain_nat(E) xt_MASQUERADE(E) nf_conntrack_netlink(E) xt_addrtype(E) nft_compat(E) nf_tables(E) nfnetlink(E) br_netfilter(E) cfg80211(E) nls_iso8859_1(E) ofpart(E) redboot(E) cmdlinepart(E) cfi_cmdset_0001(E) virtio_net(E) cfi_probe(E) cfi_util(E) 9pnet_virtio(E) gen_probe(E) net_failover(E) virtio_rng(E) failover(E) 9pnet(E) physmap(E) map_funcs(E) chipreg(E) mtd(E) uio_pdrv_genirq(E) uio(E) dm_multipath(E) scsi_dh_rdac(E) scsi_dh_emc(E) scsi_dh_alua(E) drm(E) efi_pstore(E) backlight(E) ip_tables(E) x_tables(E) raid10(E) raid456(E) async_raid6_recov(E) async_memcpy(E) async_pq(E) async_xor(E) xor(E) async_tx(E) raid6_pq(E) raid1(E) raid0(E) virtio_blk(E)
[89855.451563] CPU: 5 PID: 0 Comm: swapper/5 Tainted: G            E      6.8.0-rc6ubuntu-defconfig #2
[89855.451726] Hardware name: riscv-virtio,qemu (DT)
[89855.451899] epc : arch_ftrace_ops_list_func+0x208/0x228
[89855.452016]  ra : arch_ftrace_ops_list_func+0x208/0x228
[89855.452119] epc : ffffffff8016b216 ra : ffffffff8016b216 sp : ffffaf808090fdb0
[89855.452171]  gp : ffffffff827c7680 tp : ffffaf808089ad40 t0 : ffffffff800c0dd8
[89855.452216]  t1 : 0000000000000001 t2 : 0000000000000000 s0 : ffffaf808090fe30
[89855.452306]  s1 : 0000000000000000 a0 : 0000000000000026 a1 : ffffffff82cd6ac8
[89855.452423]  a2 : ffffffff800458c8 a3 : ffffaf80b1870640 a4 : 0000000000000000
[89855.452646]  a5 : 0000000000000000 a6 : 00000000ffffffff a7 : ffffffffffffffff
[89855.452698]  s2 : ffffffff82766872 s3 : ffffffff80004caa s4 : ffffffff80ebea90
[89855.452743]  s5 : ffffaf808089bd40 s6 : 8000000a00006e00 s7 : 0000000000000008
[89855.452787]  s8 : 0000000000002000 s9 : 0000000080043700 s10: 0000000000000000
[89855.452831]  s11: 0000000000000000 t3 : 0000000000100000 t4 : 0000000000000064
[89855.452874]  t5 : 000000000000000c t6 : ffffaf80b182dbfc
[89855.452929] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[89855.453053] [<ffffffff8016b216>] arch_ftrace_ops_list_func+0x208/0x228
[89855.453191] [<ffffffff8000e082>] ftrace_call+0x8/0x22
[89855.453265] [<ffffffff800a149c>] do_idle+0x24c/0x2ca
[89855.453357] [<ffffffff8000da54>] return_to_handler+0x0/0x26
[89855.453429] [<ffffffff8000b716>] smp_callin+0x92/0xb6
[89855.453785] ---[ end trace 0000000000000000 ]---

To fix this, mark arch_cpu_idle() as noinstr, like it is done in commit
a9cbc1b471d2 ("s390/idle: mark arch_cpu_idle() noinstr").

Reported-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
Closes: https://lore.kernel.org/linux-riscv/51f21b87-ebed-4411-afbc-c00d3dea2bab@yadro.com/
Fixes: cfbc4f81c9d0 ("riscv: Select ARCH_WANTS_NO_INSTR")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..6abeecbfc51d 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -37,7 +37,7 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
-void arch_cpu_idle(void)
+void noinstr arch_cpu_idle(void)
 {
 	cpu_do_idle();
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
