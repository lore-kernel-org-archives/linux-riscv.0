Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C0FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 11:18:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17AF861381
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 11:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17AF861381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ubuntu.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9yQgYIlu9U6iWJ0UmrShuzJcWVXW55vL6HsjfGaqueY=; b=J3ep92/88AWOsl
	GFAwc97Y1GNg5TG0J99cGMEne1RL8AO9yS+0Q3ihJIRTDcWe4gSNlm1m393zlCwaQjsDG+5Fy/ZLm
	JtIwcaxiueIXNzDF7SIB0ouEYXpLhVxrVXlt88wodjoyPQIjXYjLpmkXy6Ocw280jEnDUfo3QsM+h
	7twgB7EuosLEi85PaN24nizzpcyA0mOqaPnBBHe9jFuh4ywFHD6J4Aguq7OK9c13fAp2tPiTCDN5L
	pLb46dMQeBdbyUoOQw+ekLBPDNOLx4WpuzfY0WasVd6Q57maae9uLBmxbR2tNzxrHk5bfpxZb1Tsb
	yFDurl1h85wvYHf1eNVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXLyw-0066mu-SH; Mon, 04 Oct 2021 11:18:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXLyt-0066ll-8W
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 11:18:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B488F6124C;
 Mon,  4 Oct 2021 11:18:00 +0000 (UTC)
Date: Mon, 4 Oct 2021 13:17:58 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Christian Brauner <christian@brauner.io>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Include clone3() on rv32
Message-ID: <20211004111758.rl2zq6l575hmcv22@wittgenstein>
References: <20211003002120.198752-1-palmer@dabbelt.com>
 <CAK8P3a1rwMWQSmdW4ARkk6swT9VC2Fcx5nBWVugSOuhv8o7QHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1rwMWQSmdW4ARkk6swT9VC2Fcx5nBWVugSOuhv8o7QHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_041803_348385_6AB61B5B 
X-CRM114-Status: GOOD (  16.96  )
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

On Sun, Oct 03, 2021 at 05:30:24PM +0200, Arnd Bergmann wrote:
> On Sun, Oct 3, 2021 at 2:58 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > From: Palmer Dabbelt <palmerdabbelt@google.com>
> >
> > As far as I can tell this should be enabled on rv32 as well, I'm not
> > sure why it's rv64-only.  checksyscalls is complaining about our lack of
> > clone3() on rv32.
> >
> > Fixes: 56ac5e213933 ("riscv: enable sys_clone3 syscall for rv64")
> > Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We should probably reverse the polarity of this symbol and force
> architectures that don't implement it properly to say they don't
> have it, but for now, it definitely makes sense to treat this the same
> way on 32-bit and 64-bit risc-v.

I think we had that discussion back when I added it and I think I even
proposed that or you did but then we settled on __ARCH_WANT_SYS_CLONE3.
Most likely because it fell in line with the other
__ARCH_WANT_SYS_{CLONE,FORK}.

I think at this point its alpha, ia64, nios, sparc, and sh that don't
implement it. For some it looks trivial at first glance at least (Fwiw,
nios implements sys_clone() but doesn't select __ARCH_WANT_SYS_CLONE3):

diff --git a/arch/nios2/include/uapi/asm/unistd.h b/arch/nios2/include/uapi/asm/unistd.h
index 0b4bb1d41b28..6c4f45abd3ab 100644
--- a/arch/nios2/include/uapi/asm/unistd.h
+++ b/arch/nios2/include/uapi/asm/unistd.h
@@ -18,6 +18,7 @@

  #define sys_mmap2 sys_mmap_pgoff

+#define __ARCH_WANT_SYS_CLONE3
 #define __ARCH_WANT_RENAMEAT
 #define __ARCH_WANT_STAT64
 #define __ARCH_WANT_SET_GET_RLIMIT
diff --git a/arch/nios2/kernel/entry.S b/arch/nios2/kernel/entry.S
index 0794cd7803df..c1804bda8259 100644
--- a/arch/nios2/kernel/entry.S
+++ b/arch/nios2/kernel/entry.S
@@ -396,6 +396,15 @@ ENTRY(sys_clone)
        RESTORE_SWITCH_STACK
        ret

+/*
+ * int clone3(struct clone_args __user *, uargs, size_t, size)
+ */
+ENTRY(sys_clone3)
+       SAVE_SWITCH_STACK
+       call    sys_clone3
+       RESTORE_SWITCH_STACK
+       ret
+
 ENTRY(sys_rt_sigreturn)
        SAVE_SWITCH_STACK
        mov     r4, sp


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
