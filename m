Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E05BC10DCE
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 22:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XO9OHXBhFUAL4jZdDqOMYs8K1tMSXX7epp87KrTKGI=; b=1omjQLRxpML7yp
	ti5JHYJ5+GbNO6GrpVLX1/P9Y1w6Q0AC2tdwW8P5ninFtEIEFGu6p8HiK6rz9qOtsrDr40AHNjr3l
	LMnLtSQpMUBDpD3G20YQHld+fWcu0Ts9gTMcDCAmZ9elxn2w+dDw2pBM44QvHSXK18PDgJ4FRI0Jt
	EFF4R3PpoUsG1KL0W1rOGQcNwy9MCsWamPlOjyERVbe6TToQqXjEGSsXbZgmmYoGmSFf1tIjJzgyX
	Kal9tITvJJPLaVf4bCDORAFR1u/jYmsENlrqi6rYhjSZnOUaMfr3apJd3sq+PF9sP+WIoj+kWG+W+
	e9lltxA8EL6nlUT/yaww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBMux-00E8cg-2r;
	Thu, 07 Dec 2023 22:32:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBMuu-00E8av-2K
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 22:32:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ceb93fb381so742685b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 14:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701988340; x=1702593140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FMK5oBL7ZRsz2fIyOpAup+LzkwMHF1v8UfcRl/00pW4=;
        b=MyA8vwOotbKiz6/aaByrLbShLoTt/yQfeB0Ri4FuKBdfYIAZd0WyWo7amQdam7qgKe
         W9/yAPwXdsW5u8YPvrG8zorB7D2MvuI20V3ItYdzlSdFeHBGwsTEFqw6cfgj2BZs//I4
         hJo2a4QabAu8s53e8TiikNuaVesfP+791PweFl03BO7zct3ZsqOFmWwJklCG1ddyuUQy
         g2wOElWY2wu2Ht302t+k2fP4lJWsCEN/F5kIZQfyBW/3xmgjNKOkrvmwHxa1/EP93aNL
         NL+HPgtJNB6iZ0KCXE9+BMEOqa0wc2fEoL5sa9m8XATNTint5GW36t2doKnm9FawYYZs
         9DcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701988340; x=1702593140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMK5oBL7ZRsz2fIyOpAup+LzkwMHF1v8UfcRl/00pW4=;
        b=v4npgWrXre/VqPAaQn3QS+xOI9/TDuRY+jnF6pV41qpLxbGMFW5ealoxBeMKeyHwdH
         3Z9UlUeigba610UokMj+6NgMIUeBfUI3IkMOBj+e92Jd6+QbX6fihIzBVmYaVv2doKtz
         9UXl0gLlVQxy1UobgyfSAMK4elLXXvg/Tq5ya6CZvuzO2qF5d6SYpoYxwP4j4KxuVnyP
         +1dkQ8Ts2QJVOWg/POzMGx9O9vVGqy/9XbCbhWFRGU69qLUjWEM0HVrjc5xXv1D4EdlI
         pTh3TeTwJhxWMoVPxc2jXcFKKQQRGM2x9ixN/fVbKMYYlhS5VsqekDq/lmYO5z9u8Ldl
         PtwQ==
X-Gm-Message-State: AOJu0YwM/0/N6tpgjRhldb3OIf02u4Nxs7Jko8Fnf9jY6uEebfwMOSF5
	p5WTOoUz/SI1XiKMVtSnOsU=
X-Google-Smtp-Source: AGHT+IGjndnK2BCYLCyacoFwmyubc38b0BJwGWZc02r4foqXNC19yYWn9LMik7KGPp42sJmibTCaIg==
X-Received: by 2002:a05:6a00:238c:b0:6ce:939e:bed6 with SMTP id f12-20020a056a00238c00b006ce939ebed6mr3760900pfc.34.1701988340144;
        Thu, 07 Dec 2023 14:32:20 -0800 (PST)
Received: from MacBook-Pro-49.local ([2620:10d:c090:500::7:6fe4])
        by smtp.gmail.com with ESMTPSA id gx4-20020a056a001e0400b006cbb71186f7sm286775pfb.29.2023.12.07.14.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 14:32:19 -0800 (PST)
Date: Thu, 7 Dec 2023 14:32:12 -0800
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>, 
	Song Liu <songliubraving@meta.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, 
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Joao Moreira <joao@overdrivepizza.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
References: <20231204111128.GV8262@noisy.programming.kicks-ass.net>
 <20231204125239.GA1319@noisy.programming.kicks-ass.net>
 <ZW4LjmUKj1q6RWdL@krava>
 <20231204181614.GA7299@noisy.programming.kicks-ass.net>
 <20231204183354.GC7299@noisy.programming.kicks-ass.net>
 <CAADnVQJwU5fCLcjBWM9zBY6jUcnME3+p=vvdgKK9FiLPWvXozg@mail.gmail.com>
 <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231207093105.GA28727@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_143224_759594_ED2F80B8 
X-CRM114-Status: GOOD (  34.18  )
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

On Thu, Dec 07, 2023 at 10:31:05AM +0100, Peter Zijlstra wrote:
> On Wed, Dec 06, 2023 at 01:39:43PM -0800, Alexei Starovoitov wrote:
> 
> 
> > All is ok until kCFI comes into picture.
> > Here we probably need to teach arch_prepare_bpf_trampoline() to emit
> > different __kcfi_typeid depending on kernel function proto,
> > so that caller hash checking logic won't be tripped.
> > I suspect that requires to reverse engineer an algorithm of computing kcfi from clang.
> > other ideas?
> 
> I was going to try and extend bpf_struct_ops with a pointer, this
> pointer will point to a struct of the right type with all ops filled out
> as stubs.

Right. Something like this, but it's more nuanced.

The bpf_struct_ops concept is a generic mechanism to provide bpf-based callback
to any set of kernel callbacks.

bpf tcp CC plugs into:
struct tcp_congestion_ops {
        /* do new cwnd calculation (required) */
        void (*cong_avoid)(struct sock *sk, u32 ack, u32 acked);

        /* call before changing ca_state (optional) */
        void (*set_state)(struct sock *sk, u8 new_state);

        /* call when cwnd event occurs (optional) */
        void (*cwnd_event)(struct sock *sk, enum tcp_ca_event ev);
  ...
};

and from bpf side we don't touch tcp kernel bits at all.
tcp stack doesn't know whether it's calling bpf based CC or builtin CC or CC provided by kernel module.

bpf struct_ops mechanim is a zero cost extension to potentially any kernel mechanism
that is already setup with callbacks. tcp_congestion_ops is one of them.

The allowlisting of tcp_congestion_ops for bpf use is done in net/ipv4/bpf_tcp_ca.c via:

struct bpf_struct_ops bpf_tcp_congestion_ops = {
        ...
        .reg = bpf_tcp_ca_reg,
        .unreg = bpf_tcp_ca_unreg,
        ...
        .name = "tcp_congestion_ops",
};
static int bpf_tcp_ca_reg(void *kdata)
{
        return tcp_register_congestion_control(kdata);
}
and
 int tcp_register_congestion_control(struct tcp_congestion_ops *type);
is a normal TCP CC registration routine that is used by all CCs.

The bpf struct_ops infra prepares everything inside
'struct tcp_congestion_ops' that makes it indistinguishable from normal kernel CC,
except kCFI part. sadly.

The kCFI challenge is that clang may not generate any __cfi + __kcfi_typeid at all.
Like if vmlinux doesn't have any TCP CCs built-in there will be no kCFI hashes
in the kernel that represent a required hash to call cong_avoid, set_state, cwnd_event.

At the callsite like in net/ipv4/tcp_input.c
  icsk->icsk_ca_ops->cong_avoid(sk, ack, acked);
the clang will compute the kcfi hash, but there will be no __cfi symbol in vmlinux.

If there was one we could teach the verifier to look for __kcfi...cong_avoid
in kallsyms, then read cfi hash from there and populate it into generated asm
in arch_prepare_bpf_trampoline.

So I'm thinking to do this:

diff --git a/net/ipv4/bpf_tcp_ca.c b/net/ipv4/bpf_tcp_ca.c
index c7bbd8f3c708..afaadc2c0827 100644
--- a/net/ipv4/bpf_tcp_ca.c
+++ b/net/ipv4/bpf_tcp_ca.c
@@ -283,6 +283,12 @@ struct bpf_struct_ops bpf_tcp_congestion_ops = {
        .name = "tcp_congestion_ops",
 };

+/* never accessed, here for clang kCFI only */
+extern void __kcfi_cong_avoid(struct sock *sk, u32 ack, u32 acked);
+__ADDRESSABLE(__kcfi_cong_avoid);
+extern void __kcfi_set_state(struct sock *sk, u8 new_state);
+__ADDRESSABLE(__kcfi_set_state);

To force kcfi generation and then teach struct_ops infra to look
for __kcfi_typeid___kcfi_##callbackname in kallsyms,
read kcfi from there and populate into bpf trampoline.

Since kcfi and bpf are not working well, I believe it's bpf folks job to fix it.
Especially since it's starting to look bpf infra heavy.

If you're interested I can, of course, point to relevant bits in kernel/bpf/bpf_struct_ops.c
that would need to be extended to support such kcfi_typeid search,
but I think it's my job to fix it.

If I get stuck, I'll ask for help.

I also researched a different approach.
llvm does the following to compute the kcfi hash:

llvm::ConstantInt *CodeGenModule::CreateKCFITypeId(QualType T) {
  if (auto *FnType = T->getAs<FunctionProtoType>())
    T = getContext().getFunctionType(
        FnType->getReturnType(), FnType->getParamTypes(),
        FnType->getExtProtoInfo().withExceptionSpec(EST_None));

  std::string OutName;
  llvm::raw_string_ostream Out(OutName);
  getCXXABI().getMangleContext().mangleCanonicalTypeName(
      T, Out, getCodeGenOpts().SanitizeCfiICallNormalizeIntegers);

  if (getCodeGenOpts().SanitizeCfiICallNormalizeIntegers)
    Out << ".normalized";

  return llvm::ConstantInt::get(Int32Ty,
                                static_cast<uint32_t>(llvm::xxHash64(OutName)));
}

xxhash is already available in the kernel.
We can add type mangling logic and convert prototype of cong_avoid, set_state, etc
(that are already available in vmlinux BTF) into a mangled string and
apply xxhash on that string.
This way we wouldn't need to add __kcfi stubs to net/ipv4/bpf_tcp_ca.c.
kcfi will be computed on demand.

> > 
> > This case is easier to make work with kCFI.
> > The JIT will use:
> > cfi_bpf_hash:
> >       .long   __kcfi_typeid___bpf_prog_runX  
> > like your patch already does.
> > And will use
> > extern u64 __bpf_callback_fn(u64, u64, u64, u64, u64);
> > cfi_bpf_subprog_hash:
> >       .long   __kcfi_typeid___bpf_callback_fn
> > to JIT all subprogs. See bpf_is_subprog().
> 
> Aaah!, yes it should be trivial to use another hash value when
> is_subprog in emit_prologue().

Great. I'll wait for your respin and then will start building "kcfi for struct-ops"
via one of the two approaches above.

> Yes, we can do that. Plans have changed on my side too -- I'm taking a 6
> week break soon, so I'll do whatever I can before I'm out, and then
> continue from whatever state I find when I get back.

6 weeks! Nice. Enjoy the long break.
Last time I took 3 week PTO in a row I got bored after week 2 and went back to hacking :)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
