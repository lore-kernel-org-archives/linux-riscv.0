Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA91CD11DB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2024 15:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4qPMQo9E8JV8E7szr9o/zsWjM4YjPfNaCo2yCIBew1Y=; b=ay5QIHguR8Z5uS
	RxhNdawytQmumc6k/AQcEX/tYRYj7MWMSBiDLlcevGyuEPL/QTHNZX/GIWCRESlQt0CqisUVv36NU
	2nHX0dYZ7jleNzH4FDyrWuaDEK7gRDpWQNUlJXDNnvqQemj3FR0FD3/lRGJEpFfnylFxfZcnxYM6f
	uO4YsH7BZ2lNfSteRqI8emcJicBeSmm2+tXOeUZAzzZHLCQbbOXVTv6uSYBMkxLKHsxIskUL66OsX
	XICod++jx7dfmdDfCFmmqwbb2D5XkQsj/nb1BM78oqWTkL8RhGoIopsf7tOgNwd8Fc2Ov8OrrINKB
	SE0nCDtYC3xpiteCzAug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngvZ-00000007lrE-3uKd;
	Fri, 22 Mar 2024 15:35:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rngvW-00000007lps-0wwR
	for linux-riscv@lists.infradead.org;
	Fri, 22 Mar 2024 15:35:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41412411672so17852425e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 22 Mar 2024 08:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711121724; x=1711726524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F2r+Sc0zL+nf1gEPeJNoGBVBB9OnWPPwrmsFxPbOcOs=;
        b=YZeg2eM+xJfbMeFJZSrKj7aqJEivthGhZQcaloq7zcLHIvBjSQofN+7GniNO4orbm5
         hZhrtQ8fk8tn27l2n268ZQq4mZTomeLuKE7fMEzBiG2T5nS42EpX5tpYVG7BPr02CEzU
         NYF5HsEC61AYH+vsT90qwlHqTO38pwGC8uRi5ISVDxKAn7r/lFCQtDeoKvaPdlIC5jLC
         86PmorZzhQo/lSmSQYxuqcZT1Ob7p9eAKnci0cvianuiiYiMdytO6lNNGZVUb5S5jXmo
         ejd6f6wBHcIp1sx2aJpV4mFQ5G8SBZGj8CXyGRFXoqyQyMUsvcWt0mD1Fv5bd1okuzW9
         MYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711121724; x=1711726524;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F2r+Sc0zL+nf1gEPeJNoGBVBB9OnWPPwrmsFxPbOcOs=;
        b=GrEa9lENOHUCsK887PsY94pF1Xos4hzro4bvMFziFAV9K6FJYCl3PEHwipwAaI07nK
         8PSqQmxm7S5FbVqE0IgdUAaFnN9LNkoNEEG9K3uJykHVW10J/oSvQpd+SiXOPJjPRTL1
         lmL/YKveXlSRFJWCIweWpwNdidWgJdMVk+wak1IfzDiicTwPttcKBxk1dTjqpmpPh1Hh
         ySlDtmk7kmASh6QhNikblZ6j29HBew1Z3VU/IH71+NLH8t53K6tVF/KFQB8bmUq4opZe
         iIxXXkQGfjX+Bs56zSPK/6V7/LxBWxdAJgpHTjoBYSPbcPehC1tdN9pXXjXWD98EJb/O
         f2vg==
X-Forwarded-Encrypted: i=1; AJvYcCVf+w6q9l7+pkcVOMSW6SLgSsD+How+JZFzKOeVEywjtOzZ3tDWnWi2OMkwBhm9nULFuV68fven5Dso3z4b72ltxR7Hu+L+AGvT1vl8u7q0
X-Gm-Message-State: AOJu0YzGpB29VyjWZBfo7haXb1aP/O75JoJ30G0vUcQuLA71MLpVz8Z0
	92LVd0b5mdDj0M73S5SA14NHxMaEIHO5z4beLuTXu6DxzZHeWPWm
X-Google-Smtp-Source: AGHT+IH5r7ZjLfQkFRP6jpsoZPsttvkM4rwwQd8yGePSGbgBCVvxMXcPVOeG74OU0p9PqgPr/d9GtQ==
X-Received: by 2002:a05:600c:21d9:b0:414:f81:e512 with SMTP id x25-20020a05600c21d900b004140f81e512mr1722162wmj.19.1711121724010;
        Fri, 22 Mar 2024 08:35:24 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id s17-20020adfa291000000b00341b7388dafsm1573716wra.77.2024.03.22.08.35.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Mar 2024 08:35:22 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf v2] bpf: verifier: reject addr_space_cast insn without arena
Date: Fri, 22 Mar 2024 15:35:18 +0000
Message-Id: <20240322153518.11555-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240322_083526_449184_057919D3 
X-CRM114-Status: GOOD (  14.07  )
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

The verifier allows using the addr_space_cast instruction in a program
that doesn't have an associated arena. This was caught in the form an
invalid memory access in do_misc_fixups() when while converting
addr_space_cast to a normal 32-bit mov, env->prog->aux->arena was
dereferenced to check for BPF_F_NO_USER_CONV flag.

Reject programs that include the addr_space_cast instruction but don't
have an associated arena.

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

Fixes: 6082b6c328b5 ("bpf: Recognize addr_space_cast instruction in the verifier.")
Reported-by: xingwei lee <xrivendell7@gmail.com>
Reported-by: yue sun <samsun1006219@gmail.com>
Closes: https://lore.kernel.org/bpf/CABOYnLz09O1+2gGVJuCxd_24a-7UueXzV-Ff+Fr+h5EKFDiYCQ@mail.gmail.com/
Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
Changes in V2:
V1: https://lore.kernel.org/bpf/20240322143829.40808-1-puranjay12@gmail.com/
- Reject programs that have the addr_space_cast instruction without an
  arena rather than checking for a NULL pointer in do_misc_fixups.
---
 kernel/bpf/verifier.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index ca6cacf7b42f..7d0bbee10d71 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -14014,6 +14014,10 @@ static int check_alu_op(struct bpf_verifier_env *env, struct bpf_insn *insn)
 					verbose(env, "addr_space_cast insn can only convert between address space 1 and 0\n");
 					return -EINVAL;
 				}
+				if (!env->prog->aux->arena) {
+					verbose(env, "addr_space_cast insn can only be used in a program that has an associated arena\n");
+					return -EINVAL;
+				}
 			} else {
 				if ((insn->off != 0 && insn->off != 8 && insn->off != 16 &&
 				     insn->off != 32) || insn->imm) {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
