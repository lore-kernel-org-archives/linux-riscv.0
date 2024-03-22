Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18C49C47DD9
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 14:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybmKDO4QznRBV+TVc77NhS3ME/muNc/YWb1NP8dW3xE=; b=z1vgUlSlv6XtJh
	kOuZoggnNcG1D2Ignw6IxRTGeDMQZQHNRTWxFTQpp23RBtciUOOhBVmqxFKF8E38IuWS5hbHZfiTn
	4FrMQyEoq5GjvT0T10laMdz1pVD+bE8hrKol6vj4eWeZb7ITx2C0INu/MP0gEfSkl9otFH3PDCKFs
	IP1D19+u9XWovvQ4aduWCU7eglkN8ZBOcKfxe2sETOMNYalGcHsw6RsAu3CuyGfXl8baik8/PC2TN
	EBR91zffH0GRLQ+8b35LOsrnX+L1AV8aEJ9gofQfuAo69z7Mx9PBRfEoIW0Kmb6WpO/+DeSydLIgu
	YTpg+ETUD1q+XkplMOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rng2c-00000007aSc-2y9a;
	Fri, 22 Mar 2024 14:38:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rng2a-00000007aRb-0H49
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 14:38:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4147e735a0bso1931935e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711118314; x=1711723114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FKzLRPLFfDKfGP0XYZGykBAFy/DE3UMNbmNAv4XV4p4=;
        b=B8lOzim3Z4TtN0d4nl/xiteXq3Esf9zgdp6g1OAdU8zFkcqR91juYjCFgkQK/vnyRG
         kxils+gdllg56ilmQ+u3X9LHeLvSOdxQCGtW6TvlG7RtUpXHTSOaiph9lIEggj8t5b1R
         kjly7iCWHq23dpzy6m+MK13V8Nh5YH5tMhfLXCkoPcHvT7K+Cc56ZLOqsvCf4azjWYl2
         WoQTRc4zg60hEGzk9e9rQ7QIFIB3Oa8CZbN/+eSkQlDsgsGEksYJto5ZlOUub63TnJGG
         9XTSRuzQPXwAVR5BTjPmIkpaAU54X3ebhtze12C8+QigvFRZOKzmJaOABSosLEXoH4VD
         2fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711118314; x=1711723114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKzLRPLFfDKfGP0XYZGykBAFy/DE3UMNbmNAv4XV4p4=;
        b=s1xX1B8x1BArKTQ4rz5GO+Bcw8UJ/EomiBIKfh+j4kSmhtIojYvUn20vpP4tFEimzz
         8w+WHkksCn34/oV7S0bEbyGCW9pggYURly6K4SpjuNix6ENJvu1wnnlRQjZkW2Y8kt1q
         wuYlU6Ohr83A5JM2JyE9SOGjHaGzJm5MlN6KK5Pgi0+YRIPW/zVrtxU+SaOEDbVJap3B
         f9ec3dOTsxXKLErMP3ZKYM71gk1puJ44oRnFnzqC4nS77UcH2yhtDa99J+gXBh09xFCa
         e6zH5fcj91AgZA6mYW1c2nSxif7Pj2kuup1KBEranV6nPyj1MPh9jYI4yczxTZKQJuay
         RaQg==
X-Forwarded-Encrypted: i=1; AJvYcCUOk0qhQHp//31ZwWsOwEXZzUftIvOw2hEAZ3Tws5J1XleufUnVhaOZBqRtCeAmobdBfrqB6a5HxP+v/FSoAAp5uN3zD/Vem1KU0U0O2qjb
X-Gm-Message-State: AOJu0Yx4Az6SyhhSdPP6GC1P7GifukrXsmY7iY7j0XMl/kBRZQfRqM3k
	1h9rkPKMJToFX8m/J3fZe6gKKxl0aS7SkSE2ExoDBgX1DUGB7VqD
X-Google-Smtp-Source: AGHT+IGzQogvPhukuBYoDN9FrU8Da6oUbBGenCI8NWXeIhXKSt0arOEE+DvWr59JKV87Diz2jxEZRg==
X-Received: by 2002:a05:600c:1546:b0:414:71b2:73c4 with SMTP id f6-20020a05600c154600b0041471b273c4mr1811485wmg.12.1711118314000;
        Fri, 22 Mar 2024 07:38:34 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id fl21-20020a05600c0b9500b00414674a1a40sm3244029wmb.45.2024.03.22.07.38.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 07:38:33 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: puranjay12@gmail.com
Subject: [PATCH bpf] bpf: verifier: fix NULL pointer dereference in do_misc_fixups()
Date: Fri, 22 Mar 2024 14:38:29 +0000
Message-Id: <20240322143829.40808-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_073840_128334_10F04678 
X-CRM114-Status: GOOD (  15.40  )
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

The addr_space_cast instruction is convered to a normal 32 bit mov by the
verifier if the cast from as(0) to as(1) or if the user has set the flag
BPF_F_NO_USER_CONV in the arena.

If the BPF program doesn't have an associated arena
env->prog->aux->arena is NULL and the verifier currently doesn't check
for it being NULL before accessing map_flags. This can cause a NULL
pointer dereference:

root@rv-tester:~# ./reproducer
 Unable to handle kernel access to user memory without uaccess routines at virtual address 0000000000000030
 Oops [#1]
 Modules linked in: sch_fq_codel drm fuse i2c_core drm_panel_orientation_quirks backlight configfs ip_tables x_tables
 CPU: 2 PID: 265 Comm: reproducer Not tainted 6.8.0 #3
 Hardware name: riscv-virtio,qemu (DT)
 epc : do_misc_fixups+0x43c/0x1168
  ra : bpf_check+0xda8/0x22b6
 epc : ffffffff8017eeaa ra : ffffffff801936d6 sp : ff200000011bb890
  gp : ffffffff82293468 tp : ff60000084fcb840 t0 : ff60000084e38048
  t1 : 0000000000000048 t2 : ff5fffff80000000 s0 : ff200000011bba60
  s1 : ff2000000101d058 a0 : ff6000008b980000 a1 : 0000000000000004
  a2 : 00000000000000e1 a3 : 0000000000000001 a4 : 0000000000010000
  a5 : 0000000000000000 a6 : 0000000000000001 a7 : ff2000000101d000
  s2 : 0000000000000002 s3 : 0000000000000000 s4 : 0000000000000000
  s5 : 0000000000000002 s6 : 0000000000000000 s7 : ff6000008b980aa0
  s8 : 0000000000010005 s9 : 0000000000000004 s10: ff6000008b980000
  s11: 0000000000000000 t3 : 0000000000002000 t4 : 0000ff0000000000
  t5 : 00ff000000000000 t6 : ff20000000000000
 status: 0000000200000120 badaddr: 0000000000000030 cause: 000000000000000d
 [<ffffffff8017eeaa>] do_misc_fixups+0x43c/0x1168
 [<ffffffff801936d6>] bpf_check+0xda8/0x22b6
 [<ffffffff80174b32>] bpf_prog_load+0x486/0x8dc
 [<ffffffff80176566>] __sys_bpf+0xbd8/0x214e
 [<ffffffff80177d14>] __riscv_sys_bpf+0x22/0x2a
 [<ffffffff80d2493a>] do_trap_ecall_u+0x102/0x17c
 [<ffffffff80d3048c>] ret_from_exception+0x0/0x64
 Code: b345 9783 0024 4685 8b63 16d7 3783 008d 7f9c 7fdc (5b9c) 83c9
 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Fatal exception
 SMP: stopping secondary CPUs

Add a check for NULL pointer before checking map_flags.

Fixes: 6082b6c328b5 ("bpf: Recognize addr_space_cast instruction in the verifier.")
Reported-by: xingwei lee <xrivendell7@gmail.com>
Reported-by: yue sun <samsun1006219@gmail.com>
Closes: https://lore.kernel.org/bpf/CABOYnLz09O1+2gGVJuCxd_24a-7UueXzV-Ff+Fr+h5EKFDiYCQ@mail.gmail.com/
Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 kernel/bpf/verifier.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ca6cacf7b42f..78945e7b856d 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19607,7 +19607,8 @@ static int do_misc_fixups(struct bpf_verifier_env *env)
 	for (i = 0; i < insn_cnt;) {
 		if (insn->code == (BPF_ALU64 | BPF_MOV | BPF_X) && insn->imm) {
 			if ((insn->off == BPF_ADDR_SPACE_CAST && insn->imm == 1) ||
-			    (((struct bpf_map *)env->prog->aux->arena)->map_flags & BPF_F_NO_USER_CONV)) {
+			    (env->prog->aux->arena &&
+			     (((struct bpf_map *)env->prog->aux->arena)->map_flags & BPF_F_NO_USER_CONV))) {
 				/* convert to 32-bit mov that clears upper 32-bit */
 				insn->code = BPF_ALU | BPF_MOV | BPF_X;
 				/* clear off, so it's a normal 'wX = wY' from JIT pov */
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
