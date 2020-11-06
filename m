Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718F4C55179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:44:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B994320782
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 02:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iS/E0mTl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei7E9EzW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B994320782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CMYA8UGQDE14TP1Q+yWWr+S1efOrhBL/YFKl2FNmE10=; b=iS/E0mTlLgIHJ62uS0tFxIkK2
	2Tc0qvPmY/mbybyed/sb3s40rzHD0q7x2ceHhUM0OpagPlqO6aOaxrdmCeNUbk/rv0HDA/Y3rMp8n
	+bfnk4ajSBUthJaQQjXAwSdQ4PdoMer7MTeDGnMUvZ2nX2fG5i2qo7J5L+fJw+CV52g0xODF77I2U
	1MAZc+3Enbd7NNIcCMNEK7iGbZeLt4GP1/+Yx3Ipaw+XMxftoM/KcZ4xfj8Bju8RVM98/ymvn19x2
	0PNgN3NsmGqb3nM6WEu6BKbRRLOGnpOkGdKz7qUVXJg6gw/VuAjQH5ob0VdRxtWS4biWZPYOTzE6a
	4RJVD7irg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1karju-0003cV-C1; Fri, 06 Nov 2020 02:44:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1karjr-0003be-0e
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 02:44:32 +0000
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16F3222201
 for <linux-riscv@lists.infradead.org>; Fri,  6 Nov 2020 02:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604630668;
 bh=u+MZqpvWInkjbiTiRhNhcfi5HyG0jDJfzIXf8mkzRTg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ei7E9EzWODWPV5ah0DiLrbW98dz4Cu/ApdiQXCoX3LOtv1wbjOROSXudjGF1vCpAs
 uaeVkcFwBVPYT7bkgoH41JFxsOpSF1ksEI4PRLHEyisritj0RpfeZRN2ubENGk5RHh
 ERomM+zEfTpynT4hYmTGzjaW6f7BmQoRI5mx6nJQ=
Received: by mail-lj1-f176.google.com with SMTP id k25so3741043lji.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 18:44:27 -0800 (PST)
X-Gm-Message-State: AOAM533WInap9Vja6xZL0LtphO7am8hMnmMkrQ2deHdW7TGCANlopp+E
 wIijw7FQo1Vj/rwMMAJ+4Tir0zUdmlT5HLNh/Xw=
X-Google-Smtp-Source: ABdhPJygcmtXpwwUOt5cFszLO+Swf0jXQj/bnAh7umzjDgoyTuTZq8xPiq75eXRw8JqKV+Z6dB6H8inuGQP2qfdDmng=
X-Received: by 2002:a2e:b00d:: with SMTP id y13mr1855504ljk.346.1604630666154; 
 Thu, 05 Nov 2020 18:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20201021073839.43935-1-zong.li@sifive.com>
 <CAJF2gTTnGSYAc3AZKCPvhNJsPm_TchPjPrtqc_WzaK7K5eNt+w@mail.gmail.com>
 <CAOnJCULN8h0Jk3H-vskgbaXhgBTgTTAT5Dji0qHi6yHoXGePvg@mail.gmail.com>
 <CANXhq0q_fOg7vsniVMtNd8VezW1yymf55FYRc61WMkXMOtZpgA@mail.gmail.com>
 <CAJF2gTR-_=_vDLsST9BVxRFC0OTR4_TYV-2=nH_Gux_zWDOk3Q@mail.gmail.com>
 <CAOnJCU+d5YQzKW2qs0NURJt1_5zrM6YXrkP4FzB_=zgbb-5DuA@mail.gmail.com>
 <CAJF2gTT9gZZftoUD4eMT0Th=oYOpsdYbrFdr=5kO2-N+ki51NA@mail.gmail.com>
 <CAOnJCULO7TuRhBcx6KUVr6t_jqouN-0rao9QXC1RgrU5ehutkw@mail.gmail.com>
 <20201030202818.72070cbd@oasis.local.home>
 <CAJF2gTSaSzvo2G7prqqtEOueGhERcrcM7VDjK=WeqtePhhZ+dg@mail.gmail.com>
 <CAOnJCU+kMJCrwJ5MD2pYRoub1TpVGgpfX=6nNG2uFB6PNJLEiA@mail.gmail.com>
In-Reply-To: <CAOnJCU+kMJCrwJ5MD2pYRoub1TpVGgpfX=6nNG2uFB6PNJLEiA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 6 Nov 2020 10:44:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSM866cg07Rhpj5fOrx7GsX1W5xT=LLXTZ_RuA+T9u_BQ@mail.gmail.com>
Message-ID: <CAJF2gTSM866cg07Rhpj5fOrx7GsX1W5xT=LLXTZ_RuA+T9u_BQ@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_214431_222806_0424E51E 
X-CRM114-Status: GOOD (  24.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul McKenney <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 vincent.whitchurch@axis.com, jiangshanlai@gmail.com, josh@joshtriplett.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Colin Ian King <colin.king@canonical.com>, rcu@vger.kernel.org,
 mathieu.desnoyers@efficios.com, Masami Hiramatsu <mhiramat@kernel.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 joel@joelfernandes.org, Greentime Hu <greentime.hu@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 3, 2020 at 11:33 PM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Oct 31, 2020 at 12:42 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sat, Oct 31, 2020 at 8:28 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > On Fri, 30 Oct 2020 14:47:56 -0700
> > > Atish Patra <atishp@atishpatra.org> wrote:
> > >
> > > > > Look at arm64, they __kprobes flag and I guess it would also prevent
> > > > > ftrace call site.
> > > > >
> > > >
> > > > Are you sure about that ? __kprobes puts the code in .kprobes.text section
> > > > which is under whitelist sections in recordmcount.pl & recordmcount.c.
> > >
> > > Correct, ftrace can trace functions marked with __kprobes. That said,
> > I guess wrong, thx for correct me.
> >
> > > the instruction you are looking at here, is in a file that is
> > > blacklisted from recordmcount.
> > >
> > >   CFLAGS_REMOVE_insn.o = $(CC_FLAGS_FTRACE)
> > >
> > > All ftrace flags are removed from the compiling of insn.c, and every
> > > function in that file will not be traced.
> > Yes, arm64 prevents the whole file from ftrace. My patch just use
> > notrace flag setting on some functions.
> >
> > @Atish How do think:
> > CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
> > CFLAGS_REMOVE_sbi.o = $(CC_FLAGS_FTRACE)
> >
>
> Looks good to me. What should be done for copy_to_kernel_nofault ?
> That is also in the calling path.

There is no nops' entry in the prologue of copy_to_kernel_nofault.
>>>>
000000000000007c <.LVL6>:
}
  7c:   6105                    addi    sp,sp,32
  7e:   8082                    ret

0000000000000080 <copy_to_user_nofault>:
 *
 * Safely write to address @dst from the buffer at @src.  If a kernel fault
 * happens, handle that and return -EFAULT.
 */
long copy_to_user_nofault(void __user *dst, const void *src, size_t size)
{
  80:   1101                    addi    sp,sp,-32
  82:   e822                    sd      s0,16(sp)
  84:   ec06                    sd      ra,24(sp)
  86:   e426                    sd      s1,8(sp)
  88:   e04a                    sd      s2,0(sp)
  8a:   1000                    addi    s0,sp,32
<<<<
>>>>
cmd_mm/maccess.o :=
/root/source/riscv-tools/install_64gc/bin/riscv64-unknown-linux-gnu-gcc
-Wp,-MMD,mm/.maccess.o.d  -nostdinc -isystem
/root/source/riscv-tools/install_64gc/bin/../lib/gcc/riscv64-unknown-linux-gnu/8.4.0/include
-I./arch/riscv/include -I./arch/riscv/include/generated  -I./include
-I./arch/riscv/include/uapi -I./arch/riscv/include/generated/uapi
-I./include/uapi -I./include/generated/uapi -include
./include/linux/kconfig.h -include ./include/linux/compiler_types.h
-D__KERNEL__ ***-DCC_USING_PATCHABLE_FUNCTION_ENTRY*** -Wall -Wundef
-Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing
-fno-common -fshort-wchar -fno-PIE
-Werror=implicit-function-declaration -Werror=implicit-int
-Wno-format-security -std=gnu89 -mabi=lp64 -march=rv64imac
-mno-save-restore -DCONFIG_PAGE_OFFSET=0xffffffe000000000
-mcmodel=medany -fno-omit-frame-pointer -mstrict-align
-fno-delete-null-pointer-checks -Wno-frame-address
-Wno-format-truncation -Wno-format-overflow -O2
--param=allow-store-data-races=0 -Wframe-larger-than=2048
-fstack-protector-strong -Wno-unused-but-set-variable
-Wimplicit-fallthrough -Wno-unused-const-variable
-fno-omit-frame-pointer -fno-optimize-sibling-calls
-fno-var-tracking-assignments -g ***-fpatchable-function-entry=8***
-Wdeclaration-after-statement -Wvla -Wno-pointer-sign
-Wno-stringop-truncation -Wno-array-bounds -Wno-stringop-overflow
-Wno-restrict -Wno-maybe-uninitialized -fno-strict-overflow
-fno-merge-all-constants -fmerge-constants -fno-stack-check
-fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types
-Werror=designated-init -fmacro-prefix-map=./= -Wno-packed-not-aligned
   -DKBUILD_MODFILE='"mm/maccess"' -DKBUILD_BASENAME='"maccess"'
-DKBUILD_MODNAME='"maccess"' -c -o mm/maccess.o mm/maccess.c
<<<<

But copy_from_user_nofault has:
000000000000007c <.LVL6>:
}
  7c:   6105                    addi    sp,sp,32
  7e:   8082                    ret

0000000000000080 <copy_to_user_nofault>:
 *
 * Safely write to address @dst from the buffer at @src.  If a kernel fault
 * happens, handle that and return -EFAULT.
 */
long copy_to_user_nofault(void __user *dst, const void *src, size_t size)
{
  80:   1101                    addi    sp,sp,-32
  82:   e822                    sd      s0,16(sp)
  84:   ec06                    sd      ra,24(sp)
  86:   e426                    sd      s1,8(sp)
  88:   e04a                    sd      s2,0(sp)
  8a:   1000                    addi    s0,sp,32


I think it's a gcc problem, but satisfy our ftrace requirement.





--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
