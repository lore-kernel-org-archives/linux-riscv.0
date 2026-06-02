Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B3CCD5BD1
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 20:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dItWhopgUPPODEjE6TsXn1Pk2qHw3wyhqymXxb/aGs4=; b=VorXafffIEbbME
	M2TFVtvpr3qM1IlNfu5YRcAVZP7W97W/L+E6v3jGjRrKeZbSyjBcVpkPtJCUNyM9IjU0w4E2E4pTQ
	9+q320HeXJd5z/eJZuClclP74QB6nTlzEd0o6qdWjY5cU1tQrp0eCJzwuAllzm+XeQ51LtemO6G6f
	NzPVFsCp0CBtGjXVWHOyJXdIF/2UdvcMx8QE0m80+lzbb1V4l9APD+4vfRsTpNJ/xxyMCqPpdXbI1
	jGjcInRea3nPwWYWEEtj53gp6BmPy0yv5ou3dU0Wsx61IH2a+w2y+gfsOrmAnvE+LFG8EnF3Zru77
	LQxPPhW3X7bvfAGP+hHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWCf-0000000Dmpc-2R45;
	Tue, 02 Jun 2026 20:59:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWCd-0000000Dmp7-0MS2
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 20:59:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c85893bce34so1376769a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433950; x=1781038750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LsFwosRJQ7xuFenuTgaUzNnNnhs7WZU/8+qcwovvf0=;
        b=JIyejkSY++Q+/29umgERRHvI/wc3wSWnzQ5YpHb+nzE/FT0skjy6mcMCTTv7l1oZVx
         qh0lM9JqlkoG3MzmfwBFYVaLQah18lgfH3FPUdv+YmNIa/scSV/d2pV474t5Up05G7y/
         SQiG26VUf4cJWrZ6BK3qnKoIx1VtD1F5bW5ebhMmvdqsjoggjV/LsHF8zkXhysMUrbTZ
         Sobna+gTfwDDIIc4nEXuFrRtrR/hHwu2gGhNuWMNmt4NQhkzovuMOjmcNG27JcZstr+a
         HKMQx/MU0mcAXEb/GzK8ejI9F4Gw3hWDNWCy9NIZL8/Bt2K6d461iRNFTxPNzqw819ms
         dxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433950; x=1781038750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0LsFwosRJQ7xuFenuTgaUzNnNnhs7WZU/8+qcwovvf0=;
        b=XKlUQdYpVr4E7FkeQeQv+fxhmlv1I7E3BpSqHhvg5uwVkODZUlnub/VutZ6Cp+jf+0
         RGVNOPKwrS5a6JqzLVyw+ALDKdXfiK7uVDX+bCPGznDQ9vbvD5LjkdDtYNO9yG2PptNH
         Hd+EobZaVnJo7J9lhhHR20apmsnsSlZ9436moUUqdGlNzp697d/ACxjmnu2rA4PbwGfx
         TtgBs/NgZH2rQCdjcz/mxFm0H7tzo3E8SGkx+pIHMunzHvt8rZqiq+ZXodLpREQZxauW
         oqIkH+gBSjcZY6T482zQVJ7Y1UVdC7/ppsq/BEWUGWDxRO1DXN2OPEVw9ojlUy61BHGC
         54Yg==
X-Forwarded-Encrypted: i=1; AFNElJ/TdIxiep6ubXgCMj0hEyHp7mx5trB9VA668n6W2gwLeXIh/G2fdGvz/bCpRlcr9O4dWuOlTIx3+E5vYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwZUjADvRXA2vKUHMu+hE9uqv8uPZPB8mGzuUe8mxfMlDuAGnh
	PX9WTVka8jzG/Qh9M76dUVly1W9b6AUX1iltnRw7DcI+4cyhz1slX4vg
X-Gm-Gg: Acq92OF1N5tL1vBdejtTbANlmgEHZLWYw8IHjT8DJUP6/zWrZlxhKq4zRxJx3WUTeK3
	hp2OOa7C7pjD4j7raCMZ6rmIz9dDOPiw+6xLatVHZw7yCbDXT5Mfn/PSYRWpNGXdLL/r58m4vSG
	/295rribA72lQqxeozlhB872WtPq82whgn+nuvpsZNRBJmVsDlxthDR6xqi1G56Ma6XKo9VNpSV
	mWMR1dUxp9ysVIQqTFVeS9p3lIjeXhG/3v7yhafKQH/Cd2FJoaWzcC1EqZECl/c/2YNxF0SunI/
	R7iiQvSZtuhDhFBLnGtGtiwniZQWnubltJFoK5S7Duq6u43b48tcjU6t1XP/2WtLzlIVup3V5ww
	IzDHG1xGYv3F1MAFd7dreiNiAi/scH15TzZVbfigI3dQn/26jYlm8JMpIwTluNBlyr2msxCxR2C
	zwszwpCMUW1pqdRcQLZ3bEalGdQJIRBiVA6NJxxtnfTq8WB0M1gVdpLvDeSiLy6YsA1wkD8AbA9
	zzasw==
X-Received: by 2002:a05:6a21:6c11:b0:3b0:7771:ca57 with SMTP id adf61e73a8af0-3b497669eacmr475117637.38.1780433949708;
        Tue, 02 Jun 2026 13:59:09 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:3b4a:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm157354a12.8.2026.06.02.13.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:59:09 -0700 (PDT)
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
Subject: [PATCH bpf-next 0/2] RISC-V JIT support for bpf_get_current_task/_btf
Date: Wed,  3 Jun 2026 02:28:45 +0530
Message-ID: <20260602205847.102825-1-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_135911_134330_1A82696F 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

These two patches add support for the bpf_get_current_task and
bpf_get_current_task_btf kfuncs in RISC-V JIT and add a selftest.

The first patch adds support for cpu and feature detection on
the JIT disassembly helper function as RISC-V JITed code was not
being disassembled using `LLVMCreateDisasm` as it was missing the
"+c" CPU feature and JITed code contained RISC-V Compressed (C)
Extension. This patch generalizes that to detect CPU features and
enables testing on more RISC-V JIT work ahead.

The second patch, which actually adds this support has been benchmarked
on QEMU RISC-V and shows significant improvements.
It was benchmarked using a simple loop inside a bpf program that ran
bpf_get_current_task() and execution time was measured. It used
bpf_prog_test_run_opts() to repeatedly trigger the BPF program. The loop
ran in 1 second intervals and it kept firing bpf_prog_test_run_opts() as
fast as possible until a second had elapsed and then reported statistics.

Varun R Mallya (2):
  selftests/bpf: use host CPU features in JIT disassembler
  bpf, riscv: inline bpf_get_current_task() and
    bpf_get_current_task_btf()

 arch/riscv/net/bpf_jit_comp64.c                     |  9 +++++++++
 tools/testing/selftests/bpf/jit_disasm_helpers.c    | 13 +++++++++++--
 .../selftests/bpf/progs/verifier_jit_inline.c       |  2 ++
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
