Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7290BCD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pN+SlcsECL7PtL5YsiZuOYGwmNd3mdzdvOAu8ATrShc=; b=jzEx5mlS2FhT/8
	oT4egN/SHBx+HCAGeNRtq48xfsPDxGtp7DfK4zO0Mg4Bs+vFuyCOs6g4psinxMSwBU6Nno2b9eaB0
	kVPMA5Bd7FLoJDPRRMJoOAy2Lx2aJJNFGHkCBIAoKeLSyFikDqYrsSLIDS2k61MkcTAcos6rmOzLa
	vxk9S8Hpwh+TcnRE4XCmNDi+GxqfT3qEXuWp9LL18CkWW4h2UyQJ2n+ojg7T6mUVOnk/wu6tF/HQd
	bcAYsGK5v9zZDT0jJ8Yu+HE0iMOagp6Vc8ebW4i5oLXkmn3+QnEjeQk34CZt2HNNqCDQ6h5I52+Jl
	Cq46tmnIJvKQB0z8Erow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWCr-0000000Dmqq-2p0v;
	Tue, 02 Jun 2026 20:59:25 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWCp-0000000DmqS-3n5V
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 20:59:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso3035371a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433963; x=1781038763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ea3yw5dmVH/Wal3jfG05beYzbzDpKpyYIVD2MX/4oR4=;
        b=Y47Zto6Z6aqK7iKa7SnvMlpp1fgAa9MOXHhRgFlBd6cS3YKur/LYgiwSkf8KQWaAFE
         ZzqTxmId996gXIg5NUPJ8My4r411i9UQrwsxUXk81YQtE1nzerQWsxvPCObmguIGX2zU
         eLPXQGpccdzo8aOTQZ1RIhOVQH/jKEqnva58JLQtJjDQ/sk7Skq9rM8qcb8Rme2Fy9mP
         Jd9f4ZSmnfMxYnG7M4M/LqbwxAFsHRVyzTz/zX4bhQKfJc+Jtw/lBE2+bWLM/Q3AEN0z
         xXnPFeWCKzqHQlVVpxGVe/DyvMjJkn5UdIf7oX7QPgLimIlBQcpYRCtoN8R0x9AW+yQj
         T5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433963; x=1781038763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ea3yw5dmVH/Wal3jfG05beYzbzDpKpyYIVD2MX/4oR4=;
        b=Wtwn5CiL5Myx6NAnzhqX5mP9uTxuo3MZUUAOM+W2yL4IOpdlosJfQr0GO0JJ5OVbja
         zNSfq6c1xFraEykDzL36pCnN+jnVixeEjtBlsrajsRNr3i37PZPV37/Nsk/5p8xzW3wY
         CIfQrkYxsshDasQxoVSFg2GY/lbWlYvhFege3qlQ6OrHKDs5TO/IBJ16baneO3tIrEJv
         swn52sKB26EUMQAYDzPoqwtqQ5EGh5hJyTkMFj2UI0GJ4Yh5By7eZOJoDMlSPcZVokz9
         bEq9eN/p3FHb/360RbKQWAnra5cc/m4SQtObVTH1GKjFmGqaTUZnheNAh582jZyKHG1j
         4V9A==
X-Forwarded-Encrypted: i=1; AFNElJ8v31bd2cD7cUoJ+xF08+2qsXIJ3pr5+0HCh+pV8t2xhj0HuEfVvFyLvmXMXK3HfeNsGwCzp6wfNfdrgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn653F3kRzEGYdZOcj1PmU+v8i0WiGjZ88ll20ocOHct2S/3zC
	8rMGc6X+JhwL9NVenKJbdxsPJnnMIf+4yT7tmt0gpPdRpf2qh6hL97Gn
X-Gm-Gg: Acq92OGPRA8KprOToeYQWNZy1quuKZ+hxyiiRQmJYgJE/jKc2VhgnyTa2LtKj+9aP0F
	9WcxaN4XIcCSsMkwMcUwPNdms0caoAOxHyXC7EVxzeEOHhmvEKCjYGuXrDHddkip2Rdkzmabg8r
	7kFpzP0ZF6lDdVJg1jlAEeMM5hz9EucZnpovGArpkRqxvkNNR45LGiZxLnpHcv937iLe4mmHgLW
	eQWitSgMlDoe9r6k5Rp3eW19oQKdhFzLA0xn6gpZrbgKrz/pIH+EE1YnkZdhsEeMlJcVxqSbUij
	4QhELIWZNo8YF3C9o9bZrZmAjDTooANgjLULspw5ggB4v6xaMoeqqD5hVhmbX5Lb7kF09zQO39J
	pVNfDBGe8lVnA76F5UgSG97rAOPKFsnkSAYujm0a1lqYreo/BjCqeAc7M/arEb+K+gzlwaHiCDL
	e5SlVm7arCKsaB1rU1CalaJrxWEb28h5lb9Y7TxTNoj7+NsshGZD4ZqETeZPcFlFhii7hVXD4Zz
	Rt1pO5MXKO9eCxB
X-Received: by 2002:a17:90a:b401:b0:36b:5b82:4834 with SMTP id 98e67ed59e1d1-36e30c213bfmr311928a91.7.1780433963026;
        Tue, 02 Jun 2026 13:59:23 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm157354a12.8.2026.06.02.13.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:59:22 -0700 (PDT)
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
Subject: [PATCH bpf-next 1/2] selftests/bpf: use host CPU features in JIT disassembler
Date: Wed,  3 Jun 2026 02:28:46 +0530
Message-ID: <20260602205847.102825-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602205847.102825-1-varunrmallya@gmail.com>
References: <20260602205847.102825-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_135923_945866_F0D75BDB 
X-CRM114-Status: GOOD (  10.95  )
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

Pass the host CPU name and feature string to
LLVMCreateDisasmCPUFeatures() instead of using LLVMCreateDisasm(), so
the disassembler correctly decodes CPU-specific instructions and
extensions such as RISC-V compressed and vector instructions.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 tools/testing/selftests/bpf/jit_disasm_helpers.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/jit_disasm_helpers.c b/tools/testing/selftests/bpf/jit_disasm_helpers.c
index 364c557c5115..3558fe10e28c 100644
--- a/tools/testing/selftests/bpf/jit_disasm_helpers.c
+++ b/tools/testing/selftests/bpf/jit_disasm_helpers.c
@@ -96,10 +96,19 @@ static int disasm_one_func(FILE *text_out, uint8_t *image, __u32 len)
 	__u32 *label_pc, pc;
 	int i, cnt, err = 0;
 	char buf[64];
+	char *cpu, *features;
 
 	triple = LLVMGetDefaultTargetTriple();
-	ctx = LLVMCreateDisasm(triple, &labels, 0, NULL, lookup_symbol);
-	if (!ASSERT_OK_PTR(ctx, "LLVMCreateDisasm")) {
+
+	cpu = LLVMGetHostCPUName();
+	features = LLVMGetHostCPUFeatures();
+
+	ctx = LLVMCreateDisasmCPUFeatures(triple, cpu, features, &labels, 0, NULL, lookup_symbol);
+
+	LLVMDisposeMessage(cpu);
+	LLVMDisposeMessage(features);
+
+	if (!ASSERT_OK_PTR(ctx, "LLVMCreateDisasmCPUFeatures")) {
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
