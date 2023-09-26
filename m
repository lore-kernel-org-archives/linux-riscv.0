Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD2FE7E628
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y95qN4q8pt4RjfS3WCq/GIKbdQqXq64mWPUpNFayE+A=; b=DhKCf3mQJNr4Cl
	H3YStXiZGkAkLSvLNeadQ52QUy3vAHSUKgDNEmjhomtDHMJaxdVrXR60UzL4xmXEzNAKevY5F5k0y
	6IOU+iE+lgBVdWOtoKjxRPnQEXqs9vxzAp4hmpyfTE5nrA4AqybMzQAC4TcxnetTo9UwsO0/HvQJn
	3bGef0oty/zMqNRRQE+I9eWC00FsqT/d+FuOcgIWxsKq8vz7U4XcnHkDCioViQhSvg5Q7buMuZs9c
	wMWg3AZO1oSjA5qWH85U8oInhou+pj+ZCi9tmgCBs5bXnssu0LUuS9ZsL+aBbaqVUPFp946rNymPO
	0LcTwi0Tifr44JhHOXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6Tr-00GHsW-2S;
	Tue, 26 Sep 2023 11:43:55 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql6To-00GHrd-2X
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 11:43:54 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-584bfb14c59so565712a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Sep 2023 04:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695728630; x=1696333430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkwcmvcDx9Ry059cwK4qWkjs1uRcxEVpsz5bX/95ZV4=;
        b=FhFw5JcEIyfBMZw5HdpIn1ys8YuWJ29Wy8fwM5Q8H5p2r1IfmCv27JqMVrIr3gQN65
         xtjO4qigeki8WHZAxTDccv/OQ3EC42wWZzzHs+M3BiqUrZlA4xbLMGX4rJYa0Vjiourb
         eUTmUvGhIEO9L+sQJ/n8GDohoRDqMB7996uTXJpXN8I+rOlGD6DWI8UygnmSWCcbldAJ
         5iMA6v+xJvE0bZBPTdIGcmG+DuO3L/MbgyJJnuY+A40aB6FEizZCBZI6M/rOaPgA+9Se
         AVqGtfJHlkZyLAufW4ZBcpGVY31nTNAz/0zRyEL+6jkz3nZOmGyWuSm3a8pn98JCLKt5
         wzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695728630; x=1696333430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkwcmvcDx9Ry059cwK4qWkjs1uRcxEVpsz5bX/95ZV4=;
        b=YoVF1/7m7yzr784mv1/bRBI1ekopID17ae6ElujLF9h1x6W1PcWgRQ7+svxl9cIo/A
         WezMQaNV6Mzbx6+oqIShTRUndYeY4GTH4Pi1FgQAlgRFuOOS2I6BYj32IlTenW2y5uVi
         2JDuaDOVALtdgo/80msAhy2muYhDJQ792rtfo6N+GTwel7lWoBByH7H9b3Cmg4Ua8Xlt
         Morv+JQg4TM7HejFDyH/Biagrg5pNAdzcl4OFye7xqwueEbmsoYQ9PCG8HWigmjzmCLk
         pCu/78K2kqwmp/Q5X0HVxA1eXYugQCZMK67+PjyhBLDQuZUlx6XldZkiLq5486+zO0ZM
         EZUg==
X-Gm-Message-State: AOJu0Yy/luaY0KVo76uptqVg9Rd4/32NX3BxW/xWfMjdMz6jg14VJEm1
	ubbKvM4xf7a/oTbF6FoLIJA=
X-Google-Smtp-Source: AGHT+IGBetiia33KIgJTB+2g0zG108wbsJDTIr+rmVK8b2s3SIkW1+K9Jp1b0rKSdhJnYDjRtvVp3w==
X-Received: by 2002:a17:90a:ec08:b0:274:8e3b:27cd with SMTP id l8-20020a17090aec0800b002748e3b27cdmr6874049pjy.14.1695728630616;
        Tue, 26 Sep 2023 04:43:50 -0700 (PDT)
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a414600b00274a9f8e82asm93692pjg.51.2023.09.26.04.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 04:43:50 -0700 (PDT)
From: Edward AD <twuufnxlz@gmail.com>
To: conor@kernel.org
Cc: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	alexghiti@rivosinc.com,
	liushixin2@huawei.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: fix out of bounds in walk_stackframe
Date: Tue, 26 Sep 2023 19:43:44 +0800
Message-ID: <20230926114343.1061739-2-twuufnxlz@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <0000000000000170df0605ccf91a@google.com>
References: <0000000000000170df0605ccf91a@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_044352_825897_90ECA571 
X-CRM114-Status: UNSURE (   9.60  )
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

Increase the check on the frame after assigning its value. This is to prevent 
frame access from crossing boundaries.

Closes: https://lore.kernel.org/all/20230926105949.1025995-2-twuufnxlz@gmail.com/
Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Reported-and-tested-by: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/T/
Signed-off-by: Edward AD <twuufnxlz@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..53bd18672329 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -54,6 +54,8 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			break;
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
+		if (!virt_addr_valid(frame))
+			break;
 		sp = fp;
 		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
 			fp = frame->ra;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
