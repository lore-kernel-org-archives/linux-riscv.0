Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D52E77173
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s+5ETusPd//OJw1Wku0wrcfGqu5ET/S+Gk9d2J17jf0=; b=b8M6EmiZlUgrgS
	7LC3YvkF0JXiAH34OU8J+KxJVGAQKe9NWngZN+BvJLFSjX0xTtRk2A8FUs4zg2Dt9xBy99IFpCf6I
	dsydXwmVwiW2JDrpgYggL6fF/TdvzM20+oe8P6v4FZ7zXgmwNRgpKpsmOdaCEHLY8aolS5HW3rtXY
	sxCQa4zf+n4hfu/T/xNZqMR/7KnHfGzbVS9jlhTxU6bLymheSpIBgjgciFwnSMqiZT9GktCHosXlc
	JgCJZ2S4DDEtprWvvoDcT7zAsf2zTBq3Vu3A4Ez8ExDHxARr075ryz3jlopMPDDaUgLys1HHkYKiZ
	VgLn6lejfla9glGERkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZO3-00000006yP5-196R;
	Mon, 09 Dec 2024 08:45:03 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYOY-00000006kzj-0Kf9
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 07:41:31 +0000
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862f32a33eso1008490f8f.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 23:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733730087; x=1734334887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z3RCak58lMoNTf2/3PYYExuMpiOUpiJrkwR5/y5GnZY=;
        b=pXFqgVVMvxLHeK1ePjVCNQIKy2tD+r4LuJYpZ7SOfkSWvbystnEbL8gx0x3D1yZICC
         VI0oLfcrzS21BqChm7LCCjWX6i3opWrPCbNEF9rIDRjXRcCYyBVZ+pLH2BrKdxlZ3QbD
         x4LYVShJwC7y11V5EkPNt/TNAUxt+bDxr1U/hPWwztgjEnBIXQyVyq40+lPkc9KYLueN
         shKC5JqQvc4FJDbuhqnkC5ifpMGAYYk7AZuIF1A8qgCBKjCWh1ntRsnP3zhAGGbEk5Sk
         3X8/tmog6U11UvSwYh92K0drfHag1HsJh9wXtzsZ3KxpsAJW9gclJ9C2DkR0h05jDsP+
         bmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730087; x=1734334887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3RCak58lMoNTf2/3PYYExuMpiOUpiJrkwR5/y5GnZY=;
        b=us9dbgtnzVM8RHAqLMUtjnnW0A8f+QP2Fxpt6WP7BSSSE84hXx/qFfLy9m8cDv40eS
         qi50+eiuVNqXcmymtxRA+TO3SnGonCZj0Xo5uV8TUvHXBDGcK7kGeumDxOp3mI7b76IL
         9w1f+8NE83pfwqxB3tZREJ0cq/xzaod7S44p9FC3HeiyYuWmVqIsqSzutoFgxAPnCcMx
         knUbWN/vWmHqmJSSkOnt37fXR1Pg0/+asAhJXMOHST+B+maWaltN+/dGRNc5aZWxC4tR
         52b/Q6z2VbDtU10OGOhZlz+TREj6Half89CSsy4APhfQset+9sEJ7hbx6x8YWZZJmqaG
         S6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYi/aGzvxOcvIguzxW1C9JZ68NURzpCcCCWyCFbDckqlv5Sq19hnEdyZGg0Idu1Aq4DBP8Ye8rf3OtQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB+4o1YRdqxBIYAuqUEnzxAkj/9V8DmlqbgG2xP3t08pHCwRFq
	c15vboYlnpU2MrjvvRIhR2JYMJ8tndsC1OPvRhrTwSMITnMqDH8RtHpOiIDnJYE=
X-Gm-Gg: ASbGncsAhxfZqLJ+FtVmfVKfLyM2ugdfTul8aSnaoKvzguMvw3X3b3DkeexDpwK1Rx6
	8udFfoNqlpLTSgzXs22PTnu4j3gVBgi00BGhWfwhpsigVG8BRGNf4FYOaT9Qg1tKXbLCfLBmGE0
	nJkJrh+GzskNLk8PQ/m/ucGtuLxeDsKijUdbQmo3DOLptoGeq6kklX3xdRypuzRZpZtOfrqVeuP
	br0n646rQN3HJdU3jtu4baivIQvxEyQ5S3O9PKKUxITLjm466C7OWIkOKOrEYOmx1nM21YyJCGE
	LsPGrMYE2F+l84OALA==
X-Google-Smtp-Source: AGHT+IFPrwSS4pvYL85Qs19LNPL5w/DqVUJXkU3DZGskze5hgMULxTEfmwT4R+hrZ53LEoaJQchUfQ==
X-Received: by 2002:a5d:47af:0:b0:385:ed16:cac with SMTP id ffacd0b85a97d-3862b3f4930mr8270534f8f.56.1733730087202;
        Sun, 08 Dec 2024 23:41:27 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-472-36.w2-7.abo.wanadoo.fr. [2.7.62.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38636c919e5sm6471730f8f.18.2024.12.08.23.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:41:26 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Liu Shixin <liushixin2@huawei.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH -fixes] riscv: Fix IPIs usage in kfence_protect_page()
Date: Mon,  9 Dec 2024 08:41:25 +0100
Message-Id: <20241209074125.52322-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_234130_379475_C2F21358 
X-CRM114-Status: GOOD (  10.88  )
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

flush_tlb_kernel_range() may use IPIs to flush the TLBs of all the
cores, which triggers the following warning when the irqs are disabled:

[    3.455330] WARNING: CPU: 1 PID: 0 at kernel/smp.c:815 smp_call_function_many_cond+0x452/0x520
[    3.456647] Modules linked in:
[    3.457218] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.12.0-rc7-00010-g91d3de7240b8 #1
[    3.457416] Hardware name: QEMU QEMU Virtual Machine, BIOS
[    3.457633] epc : smp_call_function_many_cond+0x452/0x520
[    3.457736]  ra : on_each_cpu_cond_mask+0x1e/0x30
[    3.457786] epc : ffffffff800b669a ra : ffffffff800b67c2 sp : ff2000000000bb50
[    3.457824]  gp : ffffffff815212b8 tp : ff6000008014f080 t0 : 000000000000003f
[    3.457859]  t1 : ffffffff815221e0 t2 : 000000000000000f s0 : ff2000000000bc10
[    3.457920]  s1 : 0000000000000040 a0 : ffffffff815221e0 a1 : 0000000000000001
[    3.457953]  a2 : 0000000000010000 a3 : 0000000000000003 a4 : 0000000000000000
[    3.458006]  a5 : 0000000000000000 a6 : ffffffffffffffff a7 : 0000000000000000
[    3.458042]  s2 : ffffffff815223be s3 : 00fffffffffff000 s4 : ff600001ffe38fc0
[    3.458076]  s5 : ff600001ff950d00 s6 : 0000000200000120 s7 : 0000000000000001
[    3.458109]  s8 : 0000000000000001 s9 : ff60000080841ef0 s10: 0000000000000001
[    3.458141]  s11: ffffffff81524812 t3 : 0000000000000001 t4 : ff60000080092bc0
[    3.458172]  t5 : 0000000000000000 t6 : ff200000000236d0
[    3.458203] status: 0000000200000100 badaddr: ffffffff800b669a cause: 0000000000000003
[    3.458373] [<ffffffff800b669a>] smp_call_function_many_cond+0x452/0x520
[    3.458593] [<ffffffff800b67c2>] on_each_cpu_cond_mask+0x1e/0x30
[    3.458625] [<ffffffff8000e4ca>] __flush_tlb_range+0x118/0x1ca
[    3.458656] [<ffffffff8000e6b2>] flush_tlb_kernel_range+0x1e/0x26
[    3.458683] [<ffffffff801ea56a>] kfence_protect+0xc0/0xce
[    3.458717] [<ffffffff801e9456>] kfence_guarded_free+0xc6/0x1c0
[    3.458742] [<ffffffff801e9d6c>] __kfence_free+0x62/0xc6
[    3.458764] [<ffffffff801c57d8>] kfree+0x106/0x32c
[    3.458786] [<ffffffff80588cf2>] detach_buf_split+0x188/0x1a8
[    3.458816] [<ffffffff8058708c>] virtqueue_get_buf_ctx+0xb6/0x1f6
[    3.458839] [<ffffffff805871da>] virtqueue_get_buf+0xe/0x16
[    3.458880] [<ffffffff80613d6a>] virtblk_done+0x5c/0xe2
[    3.458908] [<ffffffff8058766e>] vring_interrupt+0x6a/0x74
[    3.458930] [<ffffffff800747d8>] __handle_irq_event_percpu+0x7c/0xe2
[    3.458956] [<ffffffff800748f0>] handle_irq_event+0x3c/0x86
[    3.458978] [<ffffffff800786cc>] handle_simple_irq+0x9e/0xbe
[    3.459004] [<ffffffff80073934>] generic_handle_domain_irq+0x1c/0x2a
[    3.459027] [<ffffffff804bf87c>] imsic_handle_irq+0xba/0x120
[    3.459056] [<ffffffff80073934>] generic_handle_domain_irq+0x1c/0x2a
[    3.459080] [<ffffffff804bdb76>] riscv_intc_aia_irq+0x24/0x34
[    3.459103] [<ffffffff809d0452>] handle_riscv_irq+0x2e/0x4c
[    3.459133] [<ffffffff809d923e>] call_on_irq_stack+0x32/0x40

So only flush the local TLB and let the lazy kfence page fault handling
deal with the faults which could happen when a core has an old protected
pte version cached in its TLB. That leads to potential inaccuracies which
can be tolerated when using kfence.

Fixes: 47513f243b45 ("riscv: Enable KFENCE for riscv64")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/kfence.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
index 7388edd88986..d08bf7fb3aee 100644
--- a/arch/riscv/include/asm/kfence.h
+++ b/arch/riscv/include/asm/kfence.h
@@ -22,7 +22,9 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 	else
 		set_pte(pte, __pte(pte_val(ptep_get(pte)) | _PAGE_PRESENT));
 
-	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	preempt_disable();
+	local_flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	preempt_enable();
 
 	return true;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
