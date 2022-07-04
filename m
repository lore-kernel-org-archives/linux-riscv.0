Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BAAC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 02:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mK0ouuLKQ13WJoBbCEOxxmH8FLag7l9GLPPxkT0GGmw=; b=AM5Vj5FXtZA4f8
	Vkc4FqpzGAj2/FQX9QnfKPf/RqOazmGTvs2LXvrX7TDS/iREttTt51jTKP3eKcFabxv3ms4j+I8us
	Lh1A/ky0mhemjgrjiurA9LIOM1QAiO6jiAuzSRMf3yw+NB43fCOtTQdBUA7BhKzzOofh47VmRtlxw
	cXQ4YyW432mQ0L8zcq/ADGgFJ0xN2BV58bQXhsGyd4ymxWZg+eYKCUFiW62gjvRSHSur3zlTYXnWe
	Y5cMHq9lU2rhDDfpndY0TNdgp4LtCBKaNeUwF64Om8ov8wupAbiBYHwPTOzjnvImN/tsUlyHbpo0v
	VhijAhs6g6Gj5cyegerg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BhH-003TsD-QU; Mon, 04 Jul 2022 02:20:23 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BhE-003TmI-FJ
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 02:20:22 +0000
Date: Mon, 4 Jul 2022 10:20:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH] RISC-V/bpf: Enable bpf_probe_read{, str}()
Message-ID: <YsJOVZU1gPo3KzdB@ofant>
References: <20220703130924.57240-1-dlan@gentoo.org>
 <c373eec7-2cc4-a41d-916c-f073aba5494b@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c373eec7-2cc4-a41d-916c-f073aba5494b@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_192020_571182_715AE197 
X-CRM114-Status: GOOD (  16.44  )
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

Hi Conor Dooley:

On 14:12 Sun 03 Jul     , Conor Dooley wrote:
> On 03/07/2022 14:09, Yixun Lan wrote:
> > Enable this option to fix a bcc error in RISC-V platform
> > 
> > And, the error shows as follows:
> > 
> > ~ # runqlen
> > WARNING: This target JIT is not designed for the host you are running. \
> > If bad things happen, please choose a different -march switch.
> > bpf: Failed to load program: Invalid argument
> > 0: R1=ctx(off=0,imm=0) R10=fp0
> > 0: (85) call bpf_get_current_task#35          ; R0_w=scalar()
> > 1: (b7) r6 = 0                        ; R6_w=0
> > 2: (7b) *(u64 *)(r10 -8) = r6         ; R6_w=P0 R10=fp0 fp-8_w=00000000
> > 3: (07) r0 += 312                     ; R0_w=scalar()
> > 4: (bf) r1 = r10                      ; R1_w=fp0 R10=fp0
> > 5: (07) r1 += -8                      ; R1_w=fp-8
> > 6: (b7) r2 = 8                        ; R2_w=8
> > 7: (bf) r3 = r0                       ; R0_w=scalar(id=1) R3_w=scalar(id=1)
> > 8: (85) call bpf_probe_read#4
> > unknown func bpf_probe_read#4
> > processed 9 insns (limit 1000000) max_states_per_insn 0 total_states 0 peak_states 0 mark_read 0
> > 
> > Traceback (most recent call last):
> >   File "/usr/lib/python-exec/python3.9/runqlen", line 187, in <module>
> >     b.attach_perf_event(ev_type=PerfType.SOFTWARE,
> >   File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 1228, in attach_perf_event
> >     fn = self.load_func(fn_name, BPF.PERF_EVENT)
> >   File "/usr/lib/python3.9/site-packages/bcc/__init__.py", line 522, in load_func
> >     raise Exception("Failed to load BPF program %s: %s" %
> > Exception: Failed to load BPF program b'do_perf_event': Invalid argument
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> Do you know what commit this fixes?
> Thanks,
> Conor.
> 

I think this is effectively broken for RISC-V 64 at the commit:
 0ebeea8ca8a4: bpf: Restrict bpf_probe_read{, str}() only to archs where they work

However, the bcc tools haven't got BPF support for RISC-V at that time,
so no one noticed it

I can add a Fixes tag if you think it's a proper way

> > ---
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 32ffef9f6e5b4..da0016f1be6ce 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -25,6 +25,7 @@ config RISCV
> >  	select ARCH_HAS_GIGANTIC_PAGE
> >  	select ARCH_HAS_KCOV
> >  	select ARCH_HAS_MMIOWB
> > +	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
> >  	select ARCH_HAS_PTE_SPECIAL
> >  	select ARCH_HAS_SET_DIRECT_MAP if MMU
> >  	select ARCH_HAS_SET_MEMORY if MMU

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
