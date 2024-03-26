Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6CBC54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SJ/XZ7irxJnczp6SYGG/LAXFz2XRAgcnMDFKr5MhBwo=; b=bmF0RrjFGQw718
	wY1MbPdCjkeA+U1yktUbxogyOkLHztxawr1ewNBUdmnR0xAEeS0UdzzH2QrBZjAUW2YETzAsoe8tT
	snultXB2B7cW+BjNDybXCOfWzAZMeFKtYiPx+Nq/ZqQctBs4TTkAMYSEVMJBmJMyI7qyVq20YWg7h
	y4GlhAMYMUW91lUCU86NdjKLc88H1L1fI7Uzj2EEbOHF4D5cj071TqGmW3Z6+CEtMG8iUBsuQVHFi
	bBHZYRCnylzqtWx9q7x0TuWybi9BSYCZfcDpnWxcT1wf7xoknfJv3MtrnHRZo3AqGXt3ItGtdQmmr
	h+BfjG+nqpL4nVqmfP5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFcC-00000006l9D-122z;
	Tue, 26 Mar 2024 22:49:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpFc9-00000006l8P-0Jgn
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 22:49:54 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4148c65e890so12082705e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711493389; x=1712098189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zT8/zXegG1a9wcJELvNhGSJACyR7iVf1nN14z4Po9Z0=;
        b=IjEkisfGilwwKNOigPCPP0okvurvGIftRdXAnfhvA6MXDpheHsnggW6FSheeXOnFBb
         EJNhWGs62IsZkHxVPrilFEjpANcPLRxWvBoDJyikpxqeyBz25vpEFz1pDI0bZX2KzwZz
         3E126v27j+GoPUMoLa6bi5KRJ6ju5WAOWxVU91UlTiuXK5g2oM4nbk7tRkdqUvZUzozh
         BSjWn3kYXdZUhKiXf4i7AjPExi7NfIwwGGxtyAGMfJKUqh2MVfVHLg4VsclJSDrIZ7Zf
         nm8+9LAOMFrCYU87ceNGGoNcLMOtel9EbdKO7D4keP+0e0UG+46VX2PV7q9wd1b0dnnR
         dx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711493389; x=1712098189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT8/zXegG1a9wcJELvNhGSJACyR7iVf1nN14z4Po9Z0=;
        b=FrmfqeQRVgeihBuZ3Feu58vcJF4lOnunLjgdrbYLJZlP7sGoewgLGijRDz5HOwhadU
         rzNXVSa7MvXHPDr/9cX6ufpXIS2oppoTq992EeYJT2+x96Kiiv1jGPMlOWhUi/xIJsE/
         dKTRpWDWnkZvSUsIJCncLhbzXeyhUjHVZNUDWGOPSjWR+3Fepm6sWYHCzZ5fxBfmVT9y
         X8NkS9PBsYlqqK7vJ8QbR/7u8Gpx4OF7bsFJq9xVXUEysQCSMxrt2hlr24Vtu6r5WWOP
         iPRqq2qs04skbvzPBvtNApOb6/L7IHHHubaO0EqPPDXy+xmkjy6OloVcEVI6HRfHft+k
         5c+w==
X-Forwarded-Encrypted: i=1; AJvYcCXW0BMgzzpKavrFbUoyGT4x0ukSV459EfYCT6lbGpQjV0fX/fRUh7PZx1utHjN4Oag3/Ctvi6uMjEIf9q3EJquwfUwnRXT7QArS/9Fxpl4X
X-Gm-Message-State: AOJu0YwreR/lsFU+fdlqAsFXXSWgKeUBcdCVs+yhGvM+uMlhe9bBe3/1
	4UkHZRKepvki+UQ4ASeGaZGHCJwuHU/CFMI8apxBh+jfY8KZTAhu
X-Google-Smtp-Source: AGHT+IGuvco2dvJZdGDwR9HtHvjUbmxA93PQU54yFOcHJ+99tI6hKAZGdYtXOMSbBfmWUuXwxklmqA==
X-Received: by 2002:a05:600c:548a:b0:414:7384:1ec2 with SMTP id iv10-20020a05600c548a00b0041473841ec2mr2058143wmb.9.1711493389125;
        Tue, 26 Mar 2024 15:49:49 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id k8-20020a05600c1c8800b004148c3685ffsm287072wms.3.2024.03.26.15.49.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Mar 2024 15:49:48 -0700 (PDT)
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
Subject: [PATCH bpf-next v3 0/2] bpf,riscv: Add support for BPF Arena
Date: Tue, 26 Mar 2024 22:49:41 +0000
Message-Id: <20240326224943.86912-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_154953_287203_C04DAFCE 
X-CRM114-Status: GOOD (  11.93  )
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

Changes in V3
V2: https://lore.kernel.org/bpf/20240325155434.65589-1-puranjay12@gmail.com/
- Use REG_DONT_CLEAR_MARKER in place of DONT_CLEAR as the name.
- Use RV_REG_ZERO for the above as it is guaranteed to be never used in as
  dst/src register in BPF LDX/STX/ST instructions.
- Use #define RV_REG_ARENA for RV_REG_S7

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

This feature needs the following two fixes in the bpf/bpf.git to work
properly:

f7f5d1808b1b6 ("bpf: verifier: fix addr_space_cast from as(1) to as(0)")
443574b033876 ("riscv, bpf: Fix kfunc parameters incompatibility between bpf and riscv abi")

There is a lot of code repetition for LDX, STX, and ST. I will be sending a
follow-up patch to refactor these.

Puranjay Mohan (2):
  bpf,riscv: Implement PROBE_MEM32 pseudo instructions
  bpf,riscv: Implement bpf_addr_space_cast instruction

 arch/riscv/net/bpf_jit.h        |   2 +
 arch/riscv/net/bpf_jit_comp64.c | 205 +++++++++++++++++++++++++++++++-
 arch/riscv/net/bpf_jit_core.c   |   2 +
 3 files changed, 207 insertions(+), 2 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
