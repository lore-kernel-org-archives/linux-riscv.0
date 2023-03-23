Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A95C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 15:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TB6FxQQEC+5cFnAijbyIjBOW3veR4+3OU8Yx5nzt8Ok=; b=MgUv0MLdo1pnDG
	xBSdzuXlfYPpyX8FgmzSvh7qfvWdVHe660jYfi7EvB+81GaqNKfN5QownbrtHpLZ5nU1rAiY0ExP9
	bWc+L+pqGeqxlIs1kn1sSIlvlWSh5NP76vKdOUJIqbWfTjMGCLmn/0EBtQWPgv0Mj5C6LhMj45TGc
	IRVrvwAnZmzmhs0ebzHUVocCTyqWA8cUBE3x8ewDIX6CMHtPgZHJSr4xW2KPK92cNINXlVuUvjmUC
	R12TNmyZjBkGJke0vjyTkD+88LfhvMfWAqZblE6zAMicffKfn3oMiMQAgW9hYbXOKpl5I2AWWYi2P
	EqEHINnLzUyUar4wZQIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRN-002Hdy-1D;
	Thu, 23 Mar 2023 15:01:21 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfMRI-002HZP-1H
	for linux-riscv@lists.infradead.org;
	Thu, 23 Mar 2023 15:01:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso2342065pjb.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 08:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679583674;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=WVySlEfxqDWV/IQZE+oLOQ0wO+duX+c8vFyXLiyJTO/x6njrE+NXSvUp4U7SbhlmAa
         e3vIJwBitYU7bQFELWAorOZWaW5Ygi61aiL6LAKJx3TKW7xvpiA3+or3+K+TiDyz09hm
         g+QyZzE/7LB+9xXQk7NZunq8TuIPP2iKcHm2RiHeMiAEKP7LL1QIEYhsg45Yp77co4uP
         YcRTK1ZEsYUfMs4g9mAyToSQLHgadRVMtO62rVhtzPwtgp/9qYO++Wv1sAOUBPh9RODK
         uCM5Y26DzOX7s3YDNZloU38f2UWvbFmt9NrBayRYHsiMxHTG/fCCWPbiXW2fy2H3mD3P
         SXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679583674;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/srIeqtOeL8WlVYBrDSAnb/WyWsrKaiEJtMn58iONk=;
        b=GgL8X6WHBS6ZqjRRpuYhoV2kp2OODNZdx1eVIvwFdeOG0hkJlcXZSdz1cpDWCfiM+u
         tnH0DlN7Du+9UPhB50wbQHOvgG9gFgL3W50v6Csoe9FKkb6rURgXKdkYPXuOzFRwFFh5
         IkBY4LyNYmVSnBKP9x2/3aPLyg8nQ//37Z87mFAL3uvTYY1cQRGp0GJw9OTeySjuuHqB
         DIAFreapTuxP/0Nu9ZqWbQVTJH3i3yzV7jM9JLmCTQ0wEBj0wwcBB+nSLA0+GiuQwzFH
         aH+IC1olQsqyOcnDztJCoBe6bmt5wo84eZfIN0bH+lWa+JRHNes2S5qUcGqkkyzngfUx
         tSqA==
X-Gm-Message-State: AO0yUKUofLUbdy6d3OtTJdIY/wr+RlYw78fJBx0KFS5h8GSlHj/sYyxa
	lNBswsjgyFb7Y34bRbBy1j7JDN5dtq7d3jAnK+ERdmEODHDylh+nrnP2GnUc4OZHv+f7XFQ0nQb
	72IE7RFCFc+qoI3Vl3nK8qq7s4DHaXsDsA99hZ6ofdpd1GstAfTW8sX2wHVciZ+gJtlTofhYL5Y
	HYVtun6LLY9MvY
X-Google-Smtp-Source: AK7set/L3cVGLRza2ds3tB3eAlc8YjsgRg8DqSZzrpSTVdPBTBMhw0vBkaTe8IhXbUtRRWsR0LQz6Q==
X-Received: by 2002:a17:902:ecc2:b0:1a1:e01e:7279 with SMTP id a2-20020a170902ecc200b001a1e01e7279mr9171143plh.4.1679583673757;
        Thu, 23 Mar 2023 08:01:13 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902854900b0019f53e0f136sm12503965plo.232.2023.03.23.08.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 08:01:13 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v16 16/20] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Thu, 23 Mar 2023 14:59:20 +0000
Message-Id: <20230323145924.4194-17-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230323145924.4194-1-andy.chiu@sifive.com>
References: <20230323145924.4194-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_080116_447848_D4F4CBF3 
X-CRM114-Status: UNSURE (   9.32  )
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

Early function calls, such as setup_vm(), relocate_enable_mmu(),
soc_early_init() etc, are free to operate on stack. However,
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
