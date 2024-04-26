Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81186C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jwVcrHQ7py+dnu+D7dHS/3efI/tfr3WPFyekahcrst4=; b=VcrS3s9+j3/DCT
	wYQZB8j3kVML3gd8HttjAcDuozwyNkQlLNH/B2SJ3cpENvnzwmz2BYgEnOYCTCLzcJSZ4TpNXw/Xu
	5DTLDvcAMYvHen+1UniVM5l7rYtTtqLQBkIYXzwZeHA7tYLSxSHLWyCZ/Wceo/qWN2YdlUu8oVFJ/
	1bdEEIy0ZHSoA6p2p9lX7xvABTd4gYyCOO33oEu/fuzH+l25RF2EUMhFh2Ezk2oinDtHJ64su2xH8
	1XAmkduYsGlgovjNu2LNcHc70SkcPHnuu5ULhze6PbrWf31Ne20f60p6b3oet926bpzn7w31PmfS1
	Tx6e7uZ7Z9kwanhfWW6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0FzC-0000000BSgR-305w;
	Fri, 26 Apr 2024 07:27:10 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Fz9-0000000BSfl-3DIc
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 07:27:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so20128371fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 00:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714116423; x=1714721223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cGx34WKhbFkiQEZoReiFOKNsGdcSp+spve/eohSuRIc=;
        b=VljmZTXGcz7F+OWiFcnhkeGT0CwNzJN1AXK3hiJtDpA3cMyiyGM7zPCHcOLLTWXbzl
         DlSfwDuwNvI/iDgOQw3Li2T/ExY/1i9CqnJTIlJs3X+8EzBONtisBzbF4Cg+da5HgBdb
         vwUVP8EXfF2LmN7J/UUHPru6xxhtqjzYFVWU7ruTgD7KSvtjBAajA30Qgma0uvDevEwt
         B9YV2C4sIK6mINUqyRf9gIJblsqkSovoBVNgT8nxgJLxmE3e7OmjWQcsW4LFWHVrmAaH
         4Xl16GOJAgtbIGmBH7bL5wHPOfZ7814J71u6PyYwmilrXLN721K+ZhlRBuBpapTnsYgW
         A08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714116423; x=1714721223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGx34WKhbFkiQEZoReiFOKNsGdcSp+spve/eohSuRIc=;
        b=GXixrypSKyOv0MW+hgiHS/7oOUGYMz59aHQPoNVJjwXE3Zjc4HC4EyYRLEhCr8yN4E
         XETh3w+dpmp4YQ2OwrdyqCwGGL6UBgxhycDc470cuGnTM7apAf39Kjzs7AQ+f8KP+FnQ
         lfpYIl8sRhXj2M4jXhZEj8HdxqBAcYWk+16DotR6S2xAkhNRsr8WpiaqU3cGqM7Ko0v7
         liTm9elzevHIfeCUmVLc69nINId+qhNh1dV4O7BjV+B4Qf4A7muWlI0JNNZ/BVFzPeEa
         L4auP0qoUareAnurpCaSZBNnG/bWmzRxQmKQUPg5uJfNiwi/NATNZszc3Sgy3onu1/a5
         aZkQ==
X-Gm-Message-State: AOJu0YxQOwDNSjPgCdPkKkprCRWWUbK9LQxCi87EgCgFOnD2ilQT026I
	HuOj7hk0Uf7RHoIk0UqEZ4iAnOXHsRzlqaGoWhZaI9JUyPvDD+uZUGTgKg==
X-Google-Smtp-Source: AGHT+IFgH2qCuUIqU4nB5ZQlW8cpPK6DTnGZCabyVMWx5Q2QKiOT+FCRKzssRE59ew4gNZfFFyc77w==
X-Received: by 2002:a2e:7811:0:b0:2dd:c9fc:c472 with SMTP id t17-20020a2e7811000000b002ddc9fcc472mr897815ljc.26.1714116423246;
        Fri, 26 Apr 2024 00:27:03 -0700 (PDT)
Received: from localhost.localdomain ([178.252.71.110])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e824a000000b002d8e9a37bfdsm2583977ljh.113.2024.04.26.00.27.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 00:27:02 -0700 (PDT)
From: Matthew Bystrin <dev.mbstr@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: stacktrace: fixed walk_stackframe()
Date: Fri, 26 Apr 2024 10:24:11 +0300
Message-ID: <20240426072701.6463-1-dev.mbstr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_002707_831881_209B67E8 
X-CRM114-Status: GOOD (  14.19  )
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

If the load access fault occures in a function without callee
(CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:

[<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
---[ end trace 0000000000000000 ]---

Registers dump:
    ra     0xffffffff80485758 <regmap_mmio_read+36>
    sp     0xffffffc80200b9a0
    fp     0xffffffc80200b9b0
    pc     0xffffffff804853ba <regmap_mmio_read32le+6>

Stack dump:
    0xffffffc80200b9a0:  0xffffffc80200b9e0  0xffffffc80200b9e0
    0xffffffc80200b9b0:  0xffffffff8116d7e8  0x0000000000000100
    0xffffffc80200b9c0:  0xffffffd8055b9400  0xffffffd8055b9400
    0xffffffc80200b9d0:  0xffffffc80200b9f0  0xffffffff8047c526
    0xffffffc80200b9e0:  0xffffffc80200ba30  0xffffffff8047fe9a

The assembler dump of the function preambula:
    add     sp,sp,-16
    sd      s0,8(sp)
    add     s0,sp,16

In the fist stack frame, where ra is not stored on the stack we can
observe:

        0(sp)                  8(sp)
        .---------------------------------------------.
    sp->|       frame->fp      | frame->ra (saved fp) |
        |---------------------------------------------|
    fp->|         ....         |         ....         |
        |---------------------------------------------|
        |                      |                      |

and in the code check is performed:
	if (regs && (regs->epc == pc) && (frame->fp & 0x7))

I see no reason to check frame->fp value at all, because it is can be
uninitialized value on the stack, so removed it. After the stacktrace
shows as expect:

[<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
[<ffffffff80485758>] regmap_mmio_read+0x24/0x52
[<ffffffff8047c526>] _regmap_bus_reg_read+0x1a/0x22
[<ffffffff8047fe9a>] _regmap_read+0x5c/0xea
[<ffffffff80480376>] _regmap_update_bits+0x76/0xc0
...
---[ end trace 0000000000000000 ]---

Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
---
I've catched this bug on v6.1 with gcc 12.2.0 (Debian 12.2.0-13). Different
compiler versions generate the same assembler code. So I think this is not a
compiler issue.

 arch/riscv/kernel/stacktrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..8138c68270c9 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -55,7 +55,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
 		sp = fp;
-		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
+		if (regs && regs->epc == pc) {
 			fp = frame->ra;
 			pc = regs->ra;
 		} else {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
