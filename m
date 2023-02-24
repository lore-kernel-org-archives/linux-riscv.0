Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F1AC7EE2E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4Ju3Zh8FJw3Re0H9m4z6sijf8TAz5XcAFadyKig21Y=; b=Wgp40VvIzr+ZLm
	vguW1olIjiJfxUNtxHf+4jQKbpbn5u7Y4rMO2CDIMQDaUhd0Sf2LDYGRJtwMO6rkuUKHy1fERjBaJ
	I6EIinbqxPrnP0C9FE4o/tKi1cTi7QtvTDkaYxwGJ6ncig8xIqzv95Y6Mc5QOaD/Bv1jWV2Bx/scH
	I8WIoC3kBWTJQ09Omf7I/BaX4s1zNGwj0t1NXyBQKsH4+LINFUnx2dXQ5KvHxrxZvcGAaAi0Cw8F8
	oQ9bofiadg0BggqqVl1d3N8Uw8+ulRqBPe0DJJtG/C5O6dvqTRZK6OIdLjPWvy+zRCTPwXW9mqJIc
	UXoecj5c/Ab8ZPcfwB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTe-003EMu-Ud; Fri, 24 Feb 2023 17:03:23 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbTc-003EI2-0I
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 17:03:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id z2so101575plf.12
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 09:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W4ANpghfk7OqklmmNR8esM/3NMZ7VY2gRTQHqD92eU4=;
        b=dMohg4moPmm6cCczEKC8E/zvUDd4dGMuiAb9JR5LsDjbQ6sjcvvNPACcDJS+vQZreH
         s1+d5ZzZVMsBHsXtMphSfqrS6HHGLzYJYVZ6x4DSGXsf8s6LrvXzG3WEo5vzjXnkelql
         Qo1DKU7Xcws0HahmUhV3tZbIqK/0sWTJ2mLv802azlhr34ksVsnDm608sLmrN+P5XmQI
         Hkcva7btRprCmaHI42qzeH/Ixq9t+pwcJH9D9tViYyfO+jsOivEIDYzDNVGs+csjc+AG
         5pBUCCRL6x7J9QzPvgASmSj31o6IFS/IEifv9+pcvHsuyvoaaJd9JfQqPzNTc5Qk/G/o
         IUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4ANpghfk7OqklmmNR8esM/3NMZ7VY2gRTQHqD92eU4=;
        b=INlJ9R4shybEPES1WL3ZiCTsMgrq3qR+ciiBofUSFr3dPKxOyO0S7pkRGUwucS4Ss2
         7DuOsGXHol8eJkJY58eNyrE532fWj6bStxrF+8UE4DcCtFJaOPutV63PhZA7/EWREihv
         RJkgM+39JHwRzBEPs5+S7LE0vyf1PjFS6eJtmLYCE9Rc2WyCYYDgkffjxCoOqsOUfJS6
         VAeG3LMqrzau+UafgfL5f6OA1eA/fjWL29fbchzzfSNnk9x+IiRMg0cSZZFx+wUlUq5G
         dwANDCtTxMPk870oqw+vBxRKk0rDp58SylitRRImgdbhD2gdQYZe0RdNDn4b9OitN6na
         8rPg==
X-Gm-Message-State: AO0yUKXZyuGYtO6EdtjA7/bBofdS+kPOALOD5SB3bFyRUZW32DEhSvae
	p736p/2Z0yLPqwRLwyIWoB0JmgzJzFM7yDIdPD8yXX3qFB/SxzD8OzIZqJVV1+Da/ZGJrZp0Qm8
	hi6SXFw3rrsi2Wzd5VPw1AMRTCL7CD6IDJoM5PAUx0ySupyFutzv7KfVVxcrsZMJJJp+THLF1Qj
	26Q0L2vsk5Aw==
X-Google-Smtp-Source: AK7set84M3dR0yl25NPofcni6EwMg6Eo19N35Lc/dXah3YwoY7M9ZpumK8/yDiYHactEzCMuxhMa0Q==
X-Received: by 2002:a17:90b:1b10:b0:237:9896:3989 with SMTP id nu16-20020a17090b1b1000b0023798963989mr2425819pjb.34.1677258197522;
        Fri, 24 Feb 2023 09:03:17 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902b60c00b0019472226769sm9234731pls.251.2023.02.24.09.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 09:03:16 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH -next v14 16/19] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Fri, 24 Feb 2023 17:01:15 +0000
Message-Id: <20230224170118.16766-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230224170118.16766-1-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_090320_060942_93F1428B 
X-CRM114-Status: UNSURE (   9.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Early function calls, such as setup_vm, relocate_enable_mmu,
soc_early_init etc, are free to operate on stack. However,
PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
reserved for the placement of per-task register context pointed by
task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
tests, treating the kernel to save V context before V was actually
allocated, resulting in a kernel panic.

Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
calls from the top-level assembly.

Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index e16bb2185d55..11c3b94c4534 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
+	addi sp, sp, -PT_SIZE_ON_STACK
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
@@ -318,6 +319,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
+	addi sp, sp, -PT_SIZE_ON_STACK
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
