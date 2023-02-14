Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53A5C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Feb 2023 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpjD63HAWxPLzA/qkVym0RC2hqMnlCmSRGG26AUu8qc=; b=TBYMS5P++zN60u
	Kj1hPbYhudZIFC3X0hnCPRHOwJ5faHs3K91SC19W8fRYssq0mgRAmESRsSy/fZQQ6PjbJYEKzXk1/
	iIAPBRQzrMUmlFbSu30CgyHSGcHSBix7YgplFl/24UZ2jLTNp9auA63/a104PYOuTjd2xnN71VXqq
	7D35RykLC1RuzDKJhoVCFWlTPMvVQujF95JQTcOBKp/ZpuPOZGyR+TtBPAN1T2vUHktvT4LF4KQEm
	tgVJtsKwQZ/mcDaRN47EnaH61Hz/VvoDXdFhvfbj2DU2dDdPOtGOt9lRHDHjelp/FlrJQSztWQbVM
	SH2a2Na4D36czZAgvVDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrAl-000cBP-2F; Tue, 14 Feb 2023 09:00:23 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRrAf-000c87-6u
	for linux-riscv@lists.infradead.org; Tue, 14 Feb 2023 09:00:20 +0000
X-QQ-Spam: true
X-QQ-mid: bizesmtp67t1676364152tmd31697
Received: from localhost.localdomain ( [116.30.131.224])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Feb 2023 16:42:31 +0800 (CST)
X-QQ-SSF: 01200000000000C0T000000A0000000
From: Wu Zhangjin <falcon@tinylab.org>
To: Conor Dooley <conor@kernel.org>
Cc: Wu Zhangjin <falcon@tinylab.org>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Willy Tarreau <w@1wt.eu>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: Re: [PATCH] RISC-V: Enable dead code elimination
Date: Tue, 14 Feb 2023 16:42:29 +0800
Message-Id: <20230214084229.42623-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <Y+qSBu3YZH0JPY4I@spud>
References: <Y+qSBu3YZH0JPY4I@spud>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_010017_570886_687AA26C 
X-CRM114-Status: GOOD (  23.91  )
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

On 2023-02-13 19:39 UTC, Conor wrote:
> On Tue, Feb 14, 2023 at 01:39:06AM +0800, Falcon wrote:
> > Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
> > the user to enable dead code elimination. In order for this to work,
> > ensure that we keep the alternative table by annotating them with KEEP.
> >
> > This boots well on qemu with both rv32_defconfig & rv64 defconfig, but
> > it only shrinks their builds by ~1%, a smaller config is thereforce
> > customized to test this feature:
> >
> >           | rv32                   | rv64
> >   --------|------------------------|---------------------
> >    No DCE | 4460684                | 4893488
> >       DCE | 3986716                | 4376400
> >    Shrink |  473968 (~10.6%)       |  517088 (~10.5%)
> >
> > The config used above only reserves necessary options to boot on qemu
> > with serial console, more like the size-critical embedded scenes:
> >
> >   - rv64 config: https://pastebin.com/crz82T0s
> >   - rv32 config: rv64 config + 32-bit.config
> >
> > Signed-off-by: Falcon <falcon@tinylab.org>
> 
> I feel like I "need" to ask - is Falcon your actual name?
>

Oh, no ;-) my actual name is 'Wu Zhangjin', will update both Signed-off-by and
Author lines in v2, and also the configuration in my `~/.gitconfig` later,
'Falcon' is the nickname used in my own open source projects.

FYI, this guy is me, but the email address is not often used now:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?h=v6.2-rc8&qt=author&q=wuzhangjin%40gmail.com

By the way, just introduce why i send such a patch. I worked on gc-sections 10+
years ago: http://elinux.org/Work_on_Tiny_Linux_Kernel, and the repo is here:
https://github.com/tinyclub/tinylinux/tree/2.6.35/dev/gc-sections 

Several days ago, the article 'Nolibc: a minimal C-library replacement shipped
with the kernel' from https://lwn.net/Articles/920158/ waked up my memory about
shrinking the dead system calls automatically, my old gc-sections work have
tried to let more system calls configurable, but that is manual and not
flexible.

With the new integrated user-space nolibc, the elimination of dead system calls
become easier. but we also need the 'gc-sections' support, which has already
been upstreamed by Nick, this patch tries to add it for risc-v.

Based on `tools/include/nolibc` from Willy, the extremely small applications
(match the idea of 'Kernel-only deployments' from Paul) used system calls can
be easily dumped out with the help of objdump. To only reserve the system calls
used, we also need to enable gc-sections for nolibc to eliminate the unused c
functions and the system calls they called, see an example here:
https://gitee.com/tinylab/linux-lab/commit/2027573595aca46fe6ab19ee381c5ef92be62f5f,
and then, the `arch/riscv/kernel/syscall_table.c` can be simply updated to
something like this:

    #include <linux/linkage.h>
    #include <linux/syscalls.h>
    #include <asm-generic/syscalls.h>
    #include <asm/syscall.h>

    #undef __SYSCALL
    #define __SYSCALL(nr, call)     [nr] = (call),

    void * const sys_call_table[__NR_syscalls] = {
    	[0 ... __NR_syscalls - 1] = sys_ni_syscall,

    #ifdef HAVE_LD_DEAD_SYSCALL_ELIMINATION
    	#include <asm/unistd_used.h>
    #else
    	#include <asm/unistd.h>
    #endif

    };

The `asm/unistd_used.h` can be generated automatically from a nolibc-objdump
script or more generically from a `CONFIG_SYSCALLS_USED` configuration (may be
required by the other libcs). A draft version of such a nolibc-objdump script:
https://gitee.com/tinylab/linux-lab/commit/057afb26fea336d20864b3889346fbac00924740

For example, such a simple hello.c:

    #ifndef NOLIBC
    #include <stdio.h>
    #include <unistd.h>
    #else
    #define __NOLIBC__
    #endif
    
    int main(int argc, char *argv[])
    {
    	printf("Hello, nolibc!\n");
    
    #ifdef __NOLIBC__
    	reboot(LINUX_REBOOT_CMD_HALT);
    #endif
    
    	return 0;
    }

It only requires `sys_write`, `sys_reboot` and `sys_exit`, so, the
`asm/unistd_used.h` looks like this:

    asm/unistd_used.h:

    	[142] = sys_reboot,
    	[93] = sys_exit,
    	[64] = sys_write,

Without the explicit using in the above system call table, the unused system
calls and their callees, if also not called internally in the kernel, they will
be eliminated by gc-sections automatically, this can be observed by simply
adding a `--print-gc-sections` after the `--gc-sections` in Makefile:

    Makefile:

    - LDFLAGS_vmlinux += --gc-sections
    + LDFLAGS_vmlinux += --gc-sections --print-gc-sections

If `CONFIG_COMPAT` enabled, the `arch/riscv/kernel/compat_syscall_table.c` file
should be updated similarly too.

To share more changes, the old `asm/unistd.h` can be changed to something like
`asm/unistd_wrapper.h` and the control of `HAVE_LD_DEAD_SYSCALL_ELIMINATION` should
be moved in.

    arch/riscv/kernel/syscall_table.c:

    - #include <asm/unistd.h>
    + #include <asm/unistd_wrapper.h>

    arch/riscv/kernel/compat_syscall_table.c:

    - #include <asm/unistd.h>
    + #include <asm/unistd_wrapper.h>

    asm/unistd_wrapper.h:

    #ifdef HAVE_LD_DEAD_SYSCALL_ELIMINATION
    	#include <asm/unistd_used.h>
    #else
    	#include <asm/unistd.h>
    #endif

With the above change, the unused system calls will be eliminated automatically
by gc-sections. tests shows, in rv64, with the above rv64 config, it saves
another (4376400-4172848)=203552 bytes, by ~4.6%.

Beside the size optimization, dead system call elimination may also help
security (shrink the path to protect) and safety (shrink the work to estimate).

>
> Sorry,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
