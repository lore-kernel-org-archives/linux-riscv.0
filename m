Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC88C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rVfy7/qIrOYd4NNmzVonlh4q01ixUWhQ3oME9xo1mrw=; b=clPZP+tZzr+dDO
	8OexTcM4e315XDgiIJdgz5Ze05jMbSSCpnbrae+TWI7zNgq+NhUZ9x8649Q0Nn9p8Fn9tEz0I8Wrm
	DV0ZssQH51LFiS6WhI5sZboNefukAvqhVnRWm7xd4Iqhheh/tkjiDG3qJC0EgVvO/E77sOOTLaLuy
	KE3WNd8WbabNtcZbIE8937YZf6u5AwX/XpVJPIGJN6Y6EZ3Naa14NM0OU/p4tZOOZyx7FfHJC9Hkv
	wiUACO/yabXNksgSqSV66sbtS2O4FGLJ43lZegwUH4bATTCgin4K5c+PWsyZdSste35HvXYKXh3jW
	LmVKBd44BsnHaBUHGVlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romer-00000000c62-23J4;
	Mon, 25 Mar 2024 15:54:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romeo-00000000c49-1Zcr
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 15:54:44 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4148bd2ce39so3612355e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 08:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711382079; x=1711986879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epYSjFUVIoqSYnJF4jivkOHZPoqysXSoHtzsW/w+7kg=;
        b=R37cpzl8GwASh2UcFCEV34Ftamp1VY2+Y9YzDp9Jiis8mcrokeArzxmwTMt1wJEv7/
         Rqn/nBBcP7G2cleVv7PrygyIT/pH7YjfDBPK3DI/QiXN8nT4Lu1Vq7YitQ3I5xZQhDzS
         fxFWLoZ7YW1c1DgGhC7BtInaCnSfcd03VAfi79qS7QJdbp4dVx6j7uxw0ElanMlz7GUw
         NJzKMRC5hqShNlZMzytArRxDL3MW32f3HreYVtzarJUcIonU9sTg09oaACiIDBSC0TsF
         fBSHj1s/elCHzh4EOcfRjnynKNMSil+7Gn3+ItCE7PuKJtXElVqIFNHgvMVBTrlMZtXN
         27SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382079; x=1711986879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epYSjFUVIoqSYnJF4jivkOHZPoqysXSoHtzsW/w+7kg=;
        b=VViwOieHa9hr47wNl3YQjf5EE1pUV5xQA0zqKDkmJE0o4BfOIbCLvjBVcpYjTa2CNU
         aU0MO7cKT5N5bwHL3gHPH8IUB6lNNzvzM7+BJr7lQm4qPsw0RXLogY0IwPqG5rsUVEKf
         oEOQnHrjMmQPU1qWWeC+SCMIH1nXKIEEZSppmpuFiQRHwVrtYUeU7Pkx1dgSrsWw8mdO
         yGU+xvngEeHsVgrPsuyJnBiH8tO+BMEtPwl0W2l83dYcf9iXzzulnUQ5I/iaK+fUFgbR
         L+0YuEGUCeh53DXfTclQxtF+gJx+qYpzqa+Vp8UPal7A3J51UmXwzsYR5xsx+gM7r/4A
         NtdA==
X-Forwarded-Encrypted: i=1; AJvYcCV1+RNW/+ZdSSj4YvS/ZNoQBzzTu9QfOeJIgfMfXQxemX/ZGZRe6G9wEUSDPByGqGb+R0+s9pJgUgv9xTLH6mU13OxcHcjmPGkcHC7UGICs
X-Gm-Message-State: AOJu0YyQVxCgBumkwxZ8GVU1nCwVwVOp+gDcwoI0CzIdx+nOYRq/+RSC
	MXSfdXrKpqQJsQOomjvx1xvBVv56n6yffhH/lScme2oWm9H8DPDM
X-Google-Smtp-Source: AGHT+IFEbz9WdYcx8pprFZzZ6ugY2QPqSfQqT1rwAKa5KzId0YSU+8eOqXKCBySntr6UDCXhk7+wgg==
X-Received: by 2002:a05:600c:12d2:b0:414:cd1:e46d with SMTP id v18-20020a05600c12d200b004140cd1e46dmr5220541wmd.23.1711382079166;
        Mon, 25 Mar 2024 08:54:39 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id ay19-20020a05600c1e1300b004148a667953sm2663300wmb.8.2024.03.25.08.54.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Mar 2024 08:54:38 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
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
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	bpf@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pu Lehui <pulehui@huaweicloud.com>
Cc: puranjay12@gmail.com
Subject: [PATCH bpf-next v2 0/2] bpf,riscv: Add support for BPF Arena
Date: Mon, 25 Mar 2024 15:54:32 +0000
Message-Id: <20240325155434.65589-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_085442_437191_83957793 
X-CRM114-Status: GOOD (  10.66  )
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

Changes in V2
V1: https://lore.kernel.org/bpf/20240323154652.54572-1-puranjay12@gmail.com/
- Used S7 in place of S11 for storing the kernel_vm_start
- Used 17 in place of 16 for DONT_CLEAR marker
- Remove an unused variable
- Removed some misleading information from the commit message.

This series adds the support for PROBE_MEM32 and bpf_addr_space_cast
instructions to the RISCV BPF JIT. These two instructions allow the
enablement of BPF Arena.

All arena related selftests are passing:

  root@rv-tester:~/bpf# uname -p
  riscv64
  root@rv-tester:~/bpf# ./test_progs -a "*arena*"
  #3/1     arena_htab/arena_htab_llvm:OK
  #3/2     arena_htab/arena_htab_asm:OK
  #3       arena_htab:OK
  #4/1     arena_list/arena_list_1:OK
  #4/2     arena_list/arena_list_1000:OK
  #4       arena_list:OK
  #434/1   verifier_arena/basic_alloc1:OK
  #434/2   verifier_arena/basic_alloc2:OK
  #434/3   verifier_arena/basic_alloc3:OK
  #434/4   verifier_arena/iter_maps1:OK
  #434/5   verifier_arena/iter_maps2:OK
  #434/6   verifier_arena/iter_maps3:OK
  #434     verifier_arena:OK
  Summary: 3/10 PASSED, 0 SKIPPED, 0 FAILED

This needs the patch[1] that adds the insn_is_cast_user() helper to build.
It also  needs the following patches/commits [2][3] to work correctly.

[1] https://lore.kernel.org/bpf/20240324183226.29674-1-puranjay12@gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git/commit/?id=f7f5d1808b1b66935a24dd796dd1a0612ca9c147
[3] https://lore.kernel.org/bpf/20240324103306.2202954-1-pulehui@huaweicloud.com/

Puranjay Mohan (2):
  bpf,riscv: Implement PROBE_MEM32 pseudo instructions
  bpf,riscv: Implement bpf_addr_space_cast instruction

 arch/riscv/net/bpf_jit.h        |   2 +
 arch/riscv/net/bpf_jit_comp64.c | 207 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |   2 +
 3 files changed, 208 insertions(+), 3 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
