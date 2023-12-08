Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF22C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iCzjtrsumS0afHBjxo8d257qlyCPmNSZcX5TSBkcvh8=; b=SwsouYWOxqFAk+
	YF1JZjHVljwwI3aBwDInOL5NkL7N/eWICz+AB20ggJ9UQShyHOu07P8ohCS979gkq0jSn0MoYuXU9
	62nLWiH7M6oNQ5Owxg8oKePJ1ZliLCVT+PjCN20lt8ubR9JcyI2O+a0xCsU2HLBFLnhlPx1kyuChV
	ofDsD8mR9gkiAkSfvy0IMP+iVekaVcJTVMc6ZnHQySgqssp4tVvW/iUUiVbzK8FvedVYeUQFdF2ow
	wyvInNmWNAcdcworQ6KCgFFN9rxPQxCNrqbHLnRAbrMEXU0HN1PM17V5Uhwpx3aJECnXflbJBu504
	uADyHLFh/btzO3jLIFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhZW-00GVZE-0I;
	Fri, 08 Dec 2023 20:35:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhZU-00GVYO-1X
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 20:35:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vwp6H7hbWYuJntJS7kS+l0fw/Z+oOc8mMbOkVe4byro=; b=VXkjzuM/7GoObftnaEWoZgdFYY
	L5xDBcOtO5SXticci6clYrj1K1KscYr+MoTjFYUkZz0ZWWNRoMSMcKuxO0tsaM3zEfH6eF3zU5j8O
	cUQI6yZ66caIvr7dscGTiK/hdDneafs8+XW2NtmcUWud886gJjMgBetRpivFI+2k3nYvnsQp65YfB
	hU4YX9RUqEib/aVz06p8+wivpoxMEz+kH1paTVnnirP857fswwl5sTiNJ8EbLZQRfKs655qDWsKpA
	jp0nWHX5uHWgqj/v4iexBNwei3DfCgzFy0X4rATHIUUHZG65pJYjJNbS3wxpBgX7DtbfBf97DzDCW
	GFrHBhQQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rBhZP-006WtK-Ib; Fri, 08 Dec 2023 20:35:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3799630050D; Fri,  8 Dec 2023 21:35:35 +0100 (CET)
Date: Fri, 8 Dec 2023 21:35:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>,
	Song Liu <songliubraving@meta.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Joao Moreira <joao@overdrivepizza.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231208203535.GG36716@noisy.programming.kicks-ass.net>
References: <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net>
 <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <20231208172152.GD36716@noisy.programming.kicks-ass.net>
 <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQKsnZfFomQ4wTZz=jMZW5QCV2XiXVsi64bghHkAjJtcmA@mail.gmail.com>
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

On Fri, Dec 08, 2023 at 11:40:27AM -0800, Alexei Starovoitov wrote:

> typedef void (*btf_dtor_kfunc_t)(void *);
>         btf_dtor_kfunc_t dtor;
> but the bpf_cgroup_release takes 'struct cgroup*'.
> From kcfi pov void * == struct cgroup * ?
> Do we need to change it to 'void *cgrp' ?

Yes, doing that naively like the below, gets me lovely things like:

validate_case:FAIL:expect_msg unexpected error: -22
VERIFIER LOG:
=============
=============
EXPECTED MSG: 'Possibly NULL pointer passed to trusted arg0'
#48/7    cgrp_kfunc/cgrp_kfunc_acquire_untrusted:FAIL
run_subtest:PASS:obj_open_mem 0 nsec
libbpf: extern (func ksym) 'bpf_cgroup_release': func_proto [148] incompatible with vmlinux [125610]
libbpf: failed to load object 'cgrp_kfunc_failure'


But let me try rebuilding everything..


---
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index b3be5742d6f1..078b207af7f0 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2145,10 +2145,11 @@ __bpf_kfunc struct task_struct *bpf_task_acquire(struct task_struct *p)
  * bpf_task_release - Release the reference acquired on a task.
  * @p: The task on which a reference is being released.
  */
-__bpf_kfunc void bpf_task_release(struct task_struct *p)
+__bpf_kfunc void bpf_task_release(void *p)
 {
 	put_task_struct_rcu_user(p);
 }
+EXPORT_SYMBOL_GPL(bpf_task_release);
 
 #ifdef CONFIG_CGROUPS
 /**
@@ -2169,10 +2170,11 @@ __bpf_kfunc struct cgroup *bpf_cgroup_acquire(struct cgroup *cgrp)
  * drops to 0.
  * @cgrp: The cgroup on which a reference is being released.
  */
-__bpf_kfunc void bpf_cgroup_release(struct cgroup *cgrp)
+__bpf_kfunc void bpf_cgroup_release(void *cgrp)
 {
 	cgroup_put(cgrp);
 }
+EXPORT_SYMBOL_GPL(bpf_cgroup_release);
 
 /**
  * bpf_cgroup_ancestor - Perform a lookup on an entry in a cgroup's ancestor

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
