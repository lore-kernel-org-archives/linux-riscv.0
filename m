Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447CC4708D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrK9316fM4JExVsPzuZZkJFyXULBR0sWcZwdLdLapuQ=; b=xcUMYgBO3ONbam
	iQrTnNWsb0w94OR4jUM2wOruhSl1poNUHlAf9Gl/gNAymYYtpTjW2wbGC4ENT/9N47B+WsfqE+coi
	WPzfJ8OW4mvZPKq8WWtxqgH/APxQ/1tn9IcUMOhkH5qizuVneoWiGLU3xhhZWxu1+jKWRKzeow7tx
	jM6/trMR+GbrAZ2BWsXPh3U0lL+AFfi6M9TXO0nrECrrzT8nuiIuk3kpO30b5PBH700Axxhob4KND
	x9g8ONWHymkVTK07Eky+9ddPWDRKucueOoVxlH21Zl2qfLqfSi0cQsVYVXaheRlZcDxKoDfbe7m7S
	l48Thi98kXuuDpSDoaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27Xg-00GtoD-Qh; Mon, 05 Dec 2022 09:13:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p27Xd-00GtmA-SK
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 09:13:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8AE43B80D8A;
	Mon,  5 Dec 2022 09:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA70AC433C1;
	Mon,  5 Dec 2022 09:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670231615;
	bh=ggVmgdZ2s5j3TLZVKMkeQhvmxbiWFWAWsgD6rDz4n+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ph7ywJxoRhu/Dl+2LXiBI2gfN9ERiT4GpoHROYh3cBmY/Au4Jcr/7jmmrNPfRgBh2
	 m7bqOGHrvLxqPGzENsDIm9yLa5TC5A1d2vdDKcvhY4zbc1xhkJ8HAA4p2TD1K9GgFN
	 5IVLwmlKBDU9XBdpha/8ggXIyKNNCZiiAyySNirq6+AOn4Ye5pjF+oUfuUFOjfmFb5
	 NO+HFIFbpWUnlMj2sTGbB3NQOSHcNSJplGqFD6QHfpcDxi+3y+TPPZfljc672vZa/s
	 ynH0pEJ4Zv2GSzfLCOP+xarY+tt64hylG6gdn1hPbED71SwugZTN6I5ds6p7WgewPw
	 1WTt+6a2ov0Eg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -next V8 03/14] riscv: compat_syscall_table: Fixup
 compile warning
In-Reply-To: <20221103075047.1634923-4-guoren@kernel.org>
References: <20221103075047.1634923-1-guoren@kernel.org>
 <20221103075047.1634923-4-guoren@kernel.org>
Date: Mon, 05 Dec 2022 10:13:32 +0100
Message-ID: <87h6ya9ps3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_011338_083621_DA3D9AF4 
X-CRM114-Status: GOOD (  11.17  )
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

guoren@kernel.org writes:

> From: Guo Ren <guoren@linux.alibaba.com>
>
> ../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
> field overwritten [-Woverride-init]
>    12 | #define __SYSCALL(nr, call)      [nr] = (call),
>       |                                         ^
> ../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
> '__SYSCALL'
>   567 | __SYSCALL(__NR_semget, sys_semget)
>
> Fixes: 59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/riscv/kernel/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index db6e4b1294ba..ab333cb792fd 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -9,6 +9,7 @@ CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
>  CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
>  endif
>  CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
> +CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
>  
>  ifdef CONFIG_KEXEC
>  AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)

Like patch 2, this is just a generic fix! Please have this as a separate
patch, and not part of the series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
