Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4C8C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+8MZjULpB0WcoG/qNLVg4pazP+backpI46D0UJn4AfI=; b=r6dx5a2pQqOybi
	Z3Juja4JtGGWEx6fn/gNyPJzbWN5E/V+GU1p4MErz7vjOj/v5eXSuihD9Vxfv0m+T2oSKLxG3Kbtc
	4UBcwjBHXY89DnZ6BioPIY1ghCSNWb0xScYVWCrYeI+laG+NBA+JOpOzc6bCLlawkpHY+IA39vT7h
	nXKUSM+I0muR3Pclldnmp+m+yEv/kq0WdszyZeGJ3qf0lueFkyCo7kYTg1oASrLN/6FjJ4UjeLsH4
	RZD2dwd+2ZZjCUZ8lwO77OpQfXUGSZMI7yH/yEKXkPjM2BThJ5KY9w1RMz8SD3OUhBifzuGbzy2F/
	A0on6zuapNlzCmPfLIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65Ix-00000003Prr-2TFO;
	Mon, 14 Sep 2026 11:56:59 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65IX-00000003Pfa-28gT
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 11:56:56 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-853f8c34ba4so4253583b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2026 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386992; x=1789991792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6cZnP6MDZU5vZQxpJOfJKbElTvy88Q385dtzTC3MYtw=;
        b=U2453eS4CUvS3w6/9/qTaIVyv0hGXGw4AvzBDcq4AKTVK8SeY5xOkpu6NukMcIKd/C
         mBzyDgX1ywopnDbapieoAC8idM06MWVZznQdyzFKu3s2MW3KbzMfG6xWQDMMy1tfxbwr
         kATUxypO2ad1D00H7M/VuZSdf9rNofkFn5B7/a7Jydz1WV9wtteAdzuuNRFI0OWBzZec
         IyrMrrqqgnZCzqVuQmwlOUKF9Re41A8w+0++GpsskxJUyy96C1SRxtCSQ2BdeUDYpq5x
         4K45A4y0b9pscTQ2rfJQeJVIUvgiXuVd0M+y/SVuo7y8gUyMmamz7gGIKW2uCTf9uiXm
         /ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386992; x=1789991792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6cZnP6MDZU5vZQxpJOfJKbElTvy88Q385dtzTC3MYtw=;
        b=HGOakVaeolmrrhJI67o5WZn5/ogU95gRkuqGOYo3NO+okKg9C/drmhFKR6W3AewXRd
         vYreIjcU7phZtNOPfTn20djXSJKnfN5jqyJvNGkwtS62KwzoF5zkTJHg3GNPOyoVS0Il
         vL8fhcCz40dP3VfbCDOPJDPm9WUaPuwlW6KcVJNdIRIsFX8yLdljNyTvG8kbSjd1skon
         tHRNNZKxPAUJHKfUtQO6wcT9PnvayOL7sovx4Ah6EmXQf5pSeHyv7ah7uhcxTBbadzKL
         /v8+RYywAv0SGyfuhpc/18nVe75h1sI2G0gB+wmKkcJJXXXE0ShAozC+CqSY6X1xJShh
         IcCw==
X-Forwarded-Encrypted: i=1; AKwUvByH2lKu4VvVude1nwINLmTj90mlTquxvwQd0B+SJhStf9jAyYBTlIyev09YFW/7R+MnVFwGAtN/1D3KYg==@lists.infradead.org
X-Gm-Message-State: AFuF++kCglCRLG4K5oTDpYia8CyeueS3q3nwN1vLzIOXbBIt0666AEmj
	o2/jMdLeJ5BrqSsTeHIz/g6ob4dSizWMSpaxK7LkodH2l0lPn05MRnvSUc/RORLIHNk=
X-Gm-Gg: AYBFou1Egissq99Wg+fxCr0oY1YEBvCAjChVzxH2caEfgtlFFkVIsi2cZmm6R6i7IN3
	yUFwaNHzukXLAwoyepo7fXCy92WB+N/6qIvUFxttd3WmNMWaZbFsn/v75/jBy/kkhiGZF6zheGz
	3Uuu4U6wPUr5kpOw/r9q5EzRz3rFM9vJBe5/hkRB95liTP95JqHqSxz5J91RY+Z94j/OIvmYl47
	a58TPggHG7cGH0avEwzO7F22q+bkHQJCh/r6QgUT2EA862l+yqlPbqgAbice8lgpj4GLdwkueLT
	qNWqzo+zo+frwWHjHFnjlMAjtEPpqX2Vis3M8bZkDepxOTmvyokb0o2M0ZD06ZlTsI8Ibz/95ud
	n3bVwbVlzYc2QhTlIgpWStdO4MeQSs0IYCNsqhyygmrWuJUSpSfRB2aRhi1/6ycY4mKQvpJa5sG
	YXdbplJdILE66tc/hWTLXWpWkIpk3zY72bc7pxFJTnsBqTlOfllpA3d+SFjGflozh8b3gg9V3ir
	cNG1IXMZx5Of4aXCRmO1RZGLuWNi9SlioZkgD0zGMvPOZ+9u6EfJbPqDtdFPOA=
X-Received: by 2002:a05:6a00:44c8:b0:857:726d:270c with SMTP id d2e1a72fcca58-86f866b8c0fmr5070563b3a.24.1789386992211;
        Mon, 14 Sep 2026 04:56:32 -0700 (PDT)
Received: from 56e-726.realtek.com.tw (61-219-240-249.hinet-ip.hinet.net. [61.219.240.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86cc50c786bsm2729281b3a.41.2026.09.14.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:56:31 -0700 (PDT)
From: Wei-Jie Hung <imbigking12@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Mike Rapoport <rppt@kernel.org>,
	Xiaofeng Yuan <xiaofengmian@163.com>,
	Klara Modin <klara@kasm.eu>,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei-Jie Hung <imbigking12@gmail.com>
Subject: [PATCH] riscv: patch: fix handling of bpf-jit execmem addresses
Date: Mon, 14 Sep 2026 19:56:07 +0800
Message-ID: <20260914115607.350097-1-imbigking12@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_045633_634460_82995217 
X-CRM114-Status: GOOD (  20.53  )
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

Commit 8718e5a3090b ("riscv: patch: skip fixmap mapping when kernel text
is already writable") gated the core_kernel_text() branch of patch_map()
on CONFIG_STRICT_KERNEL_RWX, and explicitly left the vmalloc branch
unchanged. That branch has a separate problem.

That branch only creates a temporary writable fixmap alias when
CONFIG_STRICT_MODULE_RWX is enabled, and otherwise assumes the target is
directly writable and returns the address unchanged. That assumption no
longer holds: bpf_prog_pack_alloc calls set_memory_rox() on every pack
unconditionally in alloc_new_pack(), independently of any
CONFIG_STRICT_*_RWX option, so BPF text in the vmalloc area is read-only
regardless of what CONFIG_STRICT_MODULE_RWX says.

With CONFIG_STRICT_MODULE_RWX=n, patch_map() returns the read-only
address directly, the subsequent copy_to_kernel_nofault() takes a
page fault and returns -EFAULT. bpf_arch_text_copy() turns that into
-EINVAL, which propagates through bpf_jit_binary_pack_finalize() to the
WARN_ON() in bpf_int_jit_compile() and leaves the program un-JITed.

Note that BPF cannot be fixed the way kprobes was in
commit bdc46e507b59 ("riscv: mm: make EXECMEM_KPROBES writable without
CONFIG_STRICT_MODULE_RWX"). EXECMEM_BPF is already PAGE_KERNEL, i.e.
writable at allocation time; the read-only mapping is established
afterwards by generic code in alloc_new_pack(), which arch code cannot
influence. The only place this can be handled is patch_map().

This is the same problem that was fixed on arm64 by commit b1480ed230ac
("arm64: patching: fix handling of execmem addresses"), and the fix is
the same: CONFIG_EXECMEM is what actually tracks whether the vmalloc
area can hold executable memory that needs a temporary alias to be
written. CONFIG_BPF_JIT, CONFIG_KPROBES and CONFIG_MODULES all select
it.

Note that this is not limited to CONFIG_MODULES=n. Unlike arm64, riscv
selects CONFIG_ARCH_OPTIONAL_KERNEL_RWX, so CONFIG_STRICT_MODULE_RWX can
be disabled with CONFIG_MODULES=y as well, and the bug is reachable in
that configuration too.

The !CONFIG_MMU build is unaffected: it has its own __patch_insn_set()
and __patch_insn_write() implementations and never calls patch_map().

Fixes: 2c9e5d4a0082 ("bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of")
Signed-off-by: Wei-Jie Hung <imbigking12@gmail.com>
---
Based on riscv/fixes (b94cec5761d2).

Reproduced on qemu-system-riscv64 -M virt with CONFIG_BPF_JIT=y,
CONFIG_BPF_JIT_ALWAYS_ON=y and CONFIG_STRICT_MODULE_RWX=n. 
ptp_classifier_init() builds a cBPF filter from sock_init(), 
so the failure happens during boot without any userspace involved:

  WARNING: arch/riscv/net/bpf_jit_core.c:156 at bpf_int_jit_compile+0x3dc/0x43e
  Call Trace:
   bpf_int_jit_compile+0x3dc/0x43e
   __bpf_prog_select_runtime+0xec/0x186
   bpf_prog_select_runtime+0x12/0x1a
   bpf_prepare_filter+0x368/0x46a
   bpf_prog_create+0x66/0x90
   ptp_classifier_init+0x3e/0x60
   sock_init+0xc4/0xe6
   do_one_initcall+0x78/0x14a

  kernel BUG at net/core/ptp_classifier.c:227!
  Kernel panic - not syncing: Fatal exception in interrupt

The BUG_ON() is reached because CONFIG_BPF_JIT_ALWAYS_ON=y turns the
silent interpreter fallback into -ENOTSUPP. With
CONFIG_BPF_JIT_ALWAYS_ON=n the failure is silent: writing 1 to
/proc/sys/net/core/bpf_jit_enable and loading any program reproduces the
same warning, but the program simply falls back to the interpreter and
the kernel keeps running.

Tested with CONFIG_BPF_JIT=y:
  - CONFIG_MODULES=n, CONFIG_BPF_JIT_ALWAYS_ON=y:
    panics before this patch, boots after
  - CONFIG_MODULES=y, CONFIG_STRICT_MODULE_RWX=n,
    CONFIG_BPF_JIT_ALWAYS_ON=y: same panic before this patch, boots after
  - CONFIG_BPF_JIT_ALWAYS_ON=n: the warning above is emitted when a
    program is loaded from userspace before this patch, and gone after
  - riscv defconfig (CONFIG_STRICT_MODULE_RWX=y): unaffected, boots
    before and after
  - kprobes (kretprobe on __riscv_sys_openat via kprobe_events):
    works before and after this patch

 arch/riscv/kernel/patch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 2239c28981bc..2b5adf01c550 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -48,7 +48,7 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 		if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
 			return addr;
 		phys = __pa_symbol(addr);
-	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
+	} else if (IS_ENABLED(CONFIG_EXECMEM)) {
 		struct page *page = vmalloc_to_page(addr);
 
 		BUG_ON(!page);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
