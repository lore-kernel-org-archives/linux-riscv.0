Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9681AC48BF6
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 17:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OEQsiD1HVYUV9+V/IpVfjRzDnvpG53AMRlWdHGIJ9Ho=; b=TCKkpD+vSNV1gI
	lXs4MvE/eIUHdmWdJ89K7I7rF6Hv5K0Yj2hwkRRJep4RVpOn+/aC8mSWVLMVrAlFUZ++aBEK3E6oq
	t7e9V3WFBNVW8Q20nFXKCfWvRoWigAqbfO/4cD8c8+LjQEmLrswBL2eLclz5U5A5o5ccdDKZ2I4m2
	fSc0JO1Bquxf5YJBNxVIdaIRz9Y6OZHiOaSkpZaccIHTmIhQ70wloh1GiJ2e7r084JUD/4JWsINXu
	3VZnFQb835mK9P1ZTPttvmQIzR9iP5chfPx3wysixAqeVoXwUR0NVYfcUnQ9cfmVz4uGv0zezVzho
	mgrKuul+1/s1ROWRYqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgpEP-00000006L9C-31fp;
	Sun, 03 Mar 2024 17:02:33 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgpEM-00000006L7v-2TcA
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 17:02:31 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-33d38c9ca5bso1752391f8f.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Mar 2024 09:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709485348; x=1710090148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXb8hGH2jHCp7nT3iUyBh9PSkpjh+LjZSwquxd8Rwc0=;
        b=MBw36Q0RnuZN5uSQDH48x1r/TiKb9uL6ufHS67YxRH1aAdDWuarf/Wqj7KfMlY3Alb
         rXVO6ueBD4o/u6PrDG4yEsOzYscDi+RkUhxGnzeNlAvp02HFTQAd7rlw3YHQG9iixwYC
         ytR9wR0tCB0EAHDNcENXeo3QdqiamRKRDL/OeL0Y2LmBLX72NP4/547aaTJRIc2Wlg+l
         5OoPswl+OTuWqBIj8yBZwT15TZPVXqgZD5Ih5NM9/9v/5IMNcLAbMqAbAjjFYHJQG/cS
         JaOR2o/0A6pz43TCml+HM3HQW0j3BGV+SAIusl0EE25tu3mXr7kbeVYecHKHrgtse1HG
         dtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709485348; x=1710090148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXb8hGH2jHCp7nT3iUyBh9PSkpjh+LjZSwquxd8Rwc0=;
        b=ngV9KmMGzgDIhPlkXSiCIE7BUg719l+tVzi+MMqdqERBq6UhACVo3Z+GQ0/Mx6oWIr
         zqQJUyfIiPDHObQx9K2vGo9SPqt0p3HSgjc+pxciNuPUyt0iULu1vohjYUMjW3ZOiFHV
         txxi088GctkP6ohARuyO73CM8ubG6lSzkuWFQYYuRODUysUn4aH2w9XKD/nxe3Xuvtuq
         /Za4SJgHxoauQsvnV4Xt0PPUnIV4cYJ0mK8XvP8ri51jodv8kmdxabtl3oeWg5OA0X3C
         L46DFLqq7xSgsmuMqNXqHcQcrGg3eEfkkXwu6vzGCubKW7tTJ4+jX37EsaGRuNHjawrL
         5fKA==
X-Forwarded-Encrypted: i=1; AJvYcCXJlo0Wc/y140/6m7R3qjeS/UVJ4L0vi2gLeW0HcTwCYIv8SZ+LUsQoCW3WSuLO5OCHu7wGyLoUokOZhV3/7NffXJJkZ/uBwXq3wT7Kz2VU
X-Gm-Message-State: AOJu0YyC+S7liJ0j2ETJpFNWSSzhoIZzGV7Lmy9g68kH0H9C+HGLFwAx
	Z3p4eQTLIARd2eEINXrMtihyxEgJcnA87G42vij5DSCWA7xE15RD
X-Google-Smtp-Source: AGHT+IF/TqX/I0NZGfvkrtdnuIrxpQgk8oUm1ToE2zC3uGin/sJGLVKXB2EguEYWlR9r7OLsWT2HLQ==
X-Received: by 2002:adf:eb03:0:b0:33d:2dd4:7f5b with SMTP id s3-20020adfeb03000000b0033d2dd47f5bmr4453339wrn.45.1709485347987;
        Sun, 03 Mar 2024 09:02:27 -0800 (PST)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id v13-20020adfd04d000000b0033d202abf01sm9986612wrh.28.2024.03.03.09.02.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Mar 2024 09:02:27 -0800 (PST)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next 0/1] Support kCFI + BPF on riscv64
Date: Sun,  3 Mar 2024 17:02:06 +0000
Message-Id: <20240303170207.82201-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_090230_672309_95E9D74A 
X-CRM114-Status: GOOD (  12.83  )
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

With CONFIG_CFI_CLANG, the compiler injects a type preamble immediately
before each function and a check to validate the target function type
before indirect calls:

  ; type preamble
    .word <id>
  function:
    ...
  ; indirect call check
    lw      t1, -4(a0)
    lui     t2, <hi20>
    addiw   t2, t2, <lo12>
    beq     t1, t2, .Ltmp0
    ebreak
  .Ltmp0:
    jarl    a0

BPF JIT currently doesn't emit this preamble before BPF programs and when
the calling fuction tries to load the type id from the preamble, it finds
an invalid value there.

This will cause CFI failures like in the following bpf selftest:

root@rv-selftester:~/bpf# ./test_progs -a "rbtree_success"

 CFI failure at bpf_rbtree_add_impl+0x148/0x350 (target: bpf_prog_fb8b097ab47d164a_less+0x0/0x42; expected type: 0x00000000)
 WARNING: CPU: 1 PID: 278 at bpf_rbtree_add_impl+0x148/0x350
 Modules linked in: bpf_testmod(OE) drm fuse dm_mod backlight i2c_core configfs drm_panel_orientation_quirks ip_tables x_tables
 CPU: 1 PID: 278 Comm: test_progs Tainted: P           OE      6.8.0-rc1 #1
 Hardware name: riscv-virtio,qemu (DT)
 epc : bpf_rbtree_add_impl+0x148/0x350
  ra : bpf_prog_27b36e47d273751e_rbtree_first_and_remove+0x1aa/0x35e
 epc : ffffffff805acc0c ra : ffffffff780077fa sp : ff2000000110b9d0
  gp : ffffffff868d6218 tp : ff60000085772a40 t0 : ffffffff86849660
  t1 : 0000000000000000 t2 : ffffffff9e4709a9 s0 : ff2000000110ba50
  s1 : ff60000089c14958 a0 : ff60000089c14758 a1 : ff60000089c14958
  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
  a5 : 0000000000000000 a6 : ff6000008aba4b30 a7 : ffffffff86849640
  s2 : ff6000008aba4b30 s3 : ff60000089c14758 s4 : ffffffff780079f0
  s5 : 0000000000000000 s6 : ffffffff84c01080 s7 : ff6000008aba4b30
  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000001
  s11: 0000000000000000 t3 : ffffffff868499e0 t4 : ffffffff868499c0
  t5 : ffffffff86849840 t6 : ffffffff86849860
 status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
 [<ffffffff805acc0c>] bpf_rbtree_add_impl+0x148/0x350
 [<ffffffff780077fa>] bpf_prog_27b36e47d273751e_rbtree_first_and_remove+0x1aa/0x35e
 [<ffffffff8294f32c>] bpf_test_run+0x2a4/0xa3c
 [<ffffffff8294d032>] bpf_prog_test_run_skb+0x47a/0xe52
 [<ffffffff805083ee>] bpf_prog_test_run+0x170/0x548
 [<ffffffff805029c8>] __sys_bpf+0x2d2/0x378
 [<ffffffff804ff570>] __riscv_sys_bpf+0x5c/0x120
 [<ffffffff8000e8fe>] syscall_handler+0x62/0xe4
 [<ffffffff83362df6>] do_trap_ecall_u+0xc6/0x27c
 [<ffffffff833822c4>] ret_from_exception+0x0/0x64
 ---[ end trace 0000000000000000 ]---

The calling function tries to load the type id hash from target_func - 4.
If this memory address is not mapped then it can cause a page fault and
crash the kernel.

This behaviour can be seen by running the 'dummy_st_ops' selftest:

root@rv-selftester:~/bpf# ./test_progs -a dummy_st_ops

 Unable to handle kernel paging request at virtual address ffffffff78204ffc
 Oops [#1]
 Modules linked in: bpf_testmod(OE) drm fuse backlight i2c_core drm_panel_orientation_quirks dm_mod configfs ip_tables x_tables [last unloaded: bpf_testmod(OE)]
 CPU: 3 PID: 356 Comm: test_progs Tainted: P           OE      6.8.0-rc1 #1
 Hardware name: riscv-virtio,qemu (DT)
 epc : bpf_struct_ops_test_run+0x28c/0x5fc
  ra : bpf_struct_ops_test_run+0x26c/0x5fc
 epc : ffffffff82958010 ra : ffffffff82957ff0 sp : ff200000007abc80
  gp : ffffffff868d6218 tp : ff6000008d87b840 t0 : 000000000000000f
  t1 : 0000000000000000 t2 : 000000002005793e s0 : ff200000007abcf0
  s1 : ff6000008a90fee0 a0 : 0000000000000000 a1 : 0000000000000000
  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
  a5 : ffffffff868dba26 a6 : 0000000000000001 a7 : 0000000052464e43
  s2 : 00007ffffc0a95f0 s3 : ff6000008a90fe80 s4 : ff60000084c24c00
  s5 : ffffffff78205000 s6 : ff60000088750648 s7 : ff20000000035008
  s8 : fffffffffffffff4 s9 : ffffffff86200610 s10: 0000000000000000
  s11: 0000000000000000 t3 : ffffffff8483dc30 t4 : ffffffff8483dc10
  t5 : ffffffff8483dbf0 t6 : ffffffff8483dbd0
 status: 0000000200000120 badaddr: ffffffff78204ffc cause: 000000000000000d
 [<ffffffff82958010>] bpf_struct_ops_test_run+0x28c/0x5fc
 [<ffffffff805083ee>] bpf_prog_test_run+0x170/0x548
 [<ffffffff805029c8>] __sys_bpf+0x2d2/0x378
 [<ffffffff804ff570>] __riscv_sys_bpf+0x5c/0x120
 [<ffffffff8000e8fe>] syscall_handler+0x62/0xe4
 [<ffffffff83362df6>] do_trap_ecall_u+0xc6/0x27c
 [<ffffffff833822c4>] ret_from_exception+0x0/0x64
 Code: b603 0109 b683 0189 b703 0209 8493 0609 157d 8d65 (a303) ffca
 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Fatal exception
 SMP: stopping secondary CPUs

This patch improves the BPF JIT for the riscv64 architecture to emit kCFI
type id before BPF programs and struct ops trampolines.

After applying this patch, the above two selftests pass without any issues.

 root@rv-selftester:~/bpf# ./test_progs -a "rbtree_success,dummy_st_ops"
 #70/1    dummy_st_ops/dummy_st_ops_attach:OK
 #70/2    dummy_st_ops/dummy_init_ret_value:OK
 #70/3    dummy_st_ops/dummy_init_ptr_arg:OK
 #70/4    dummy_st_ops/dummy_multiple_args:OK
 #70/5    dummy_st_ops/dummy_sleepable:OK
 #70/6    dummy_st_ops/test_unsupported_field_sleepable:OK
 #70      dummy_st_ops:OK
 #189/1   rbtree_success/rbtree_add_nodes:OK
 #189/2   rbtree_success/rbtree_add_and_remove:OK
 #189/3   rbtree_success/rbtree_first_and_remove:OK
 #189/4   rbtree_success/rbtree_api_release_aliasing:OK
 #189     rbtree_success:OK
 Summary: 2/10 PASSED, 0 SKIPPED, 0 FAILED

 root@rv-selftester:~/bpf# zcat /proc/config.gz | grep CONFIG_CFI_CLANG
 CONFIG_CFI_CLANG=y

Puranjay Mohan (1):
  riscv64/cfi,bpf: Support kCFI + BPF on riscv64

 arch/riscv/include/asm/cfi.h    | 17 +++++++++++
 arch/riscv/kernel/cfi.c         | 53 +++++++++++++++++++++++++++++++++
 arch/riscv/net/bpf_jit.h        |  2 +-
 arch/riscv/net/bpf_jit_comp32.c |  2 +-
 arch/riscv/net/bpf_jit_comp64.c | 14 ++++++++-
 arch/riscv/net/bpf_jit_core.c   |  9 +++---
 6 files changed, 90 insertions(+), 7 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
