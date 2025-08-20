Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559ACA0EEB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maGsCqm0vqShVZ5rcCWMZiDKdxdEbtpt0vJAIPKDpwU=; b=GVtToFh3wiqnPx
	halO9NH+jgdts93JLEJT3G0ARW/cLdQRrqXA8ILDXPVxdy6yLywvmfcgWMzYJnNHFl6C3VeTwu5fF
	SG2r9AdS/vr++fXMlPknbIDy1a03H/pa5eThCK6GjLrKnwUfsGaCCIcMYhW4ADr42cJtkbn09R8SP
	KZuK4prTCVwSjnxnGurYbpQZyPJK/fsKEuvxWHozxRxJB713F/xHZ0gdplC9VU+bpwUV5bBsrKBzk
	q8DSyBtdjvO9d5Kjp83SX7jrdaPfwGba/DM2PPZk6msePrsmDNxpMDLYOCuKkw/IO6x9L2DoXw26B
	diNZyhqd+0m1PMENzgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXo6-0000000C6xA-3K07;
	Wed, 20 Aug 2025 01:40:06 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoXkw-0000000C6VI-42fZ
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 01:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1755653751;
	bh=PHH0p/H5lFqtTHzUuz0kk2sdxbWVGk0kXQ5fYSA4qcE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fxo6il86Ed2Xm47yOEIvCppdKVcLLk5wF4qSEaZUpIZ37KIF1bjtKajP8coImyDTt
	 +EaCWrrdGDINJKjRodlht2NK71TFbG6zbNMel9KF2OQFSQzBADLMj8q2JK0bhasSeQ
	 i1aHMa90tufULR1clhzRZp06JDS2dc7gfAGh4bF0=
X-QQ-mid: esmtpsz18t1755653741t5092c507
X-QQ-Originating-IP: ipC4SzT/JkcI+Osg2Ysr385xqXVuXGF6QRu7OFb5bYI=
Received: from = ( [120.239.196.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Aug 2025 09:35:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10776672245163589342
EX-QQ-RecipientCnt: 15
Date: Wed, 20 Aug 2025 09:35:39 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Drew Fustini <fustini@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Darius Rad <darius@bluespec.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Florian Weimer <fweimer@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Drew Fustini <dfustini@tenstorrent.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3] riscv: Add sysctl to control discard of vstate on
 syscall entry
Message-ID: <694A9E5FCE0EEEFD+aKUmaxvbpuKN3_oz@LT-Guozexi>
References: <20250819-riscv_v_vstate_discard-v3-1-0af577dafdc2@kernel.org>
 <9D2DE979F179BFC6+aKUlbEZa2vvgmGdQ@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9D2DE979F179BFC6+aKUlbEZa2vvgmGdQ@LT-Guozexi>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MybtlqrhkY2zTT2+q4v7YD3Czg62E12Mzu5ubI53GbqNZqSgh+PLVGCJ
	ydf26QQJydoSgY7iWTiu2tJNhdrSPUHgQpsBORDGP2CnXC5iEopiT6D5a3vuGmNbOIk7ohl
	Pa3lv8ZF7kDshJjb4LvxH6MpWuqfs68ncqVcKBdPgORhAmIMVEUjerXpQjIB9r6zcO7WLAW
	uDNE/2dQxaOqvPEaS/rW9bIJIquVK44TIZYNrdQPWRbQ8eUWuW4y0GszG+SjsTtafGi2+3T
	4xuPucrE8QAJPbe9vqaN1enIAY9vb4FnLvgH5dAVf+FDdlGU3Q+aEHHQ1UhewAGDN9uthxQ
	r00ko95d5nA84BZCffK0V386CWg9U/M/0l4eGbFLcRrroHoRgyUawSOBpmDsumK7lEocJHP
	AhUv4vnxs0P7uxR21ZI4HoGkglijgEpzETUpy5WXv3yrQDf/WYhWb9Z5SqDITZj6fdFeueR
	G806yS982Ss3IEDwnA64bwD4QJ/1JfMKx63DR2QLcn0UdeTZDK6GhuxM8O2HKDYVjwkphXg
	0tT3mfMS0Yoxdy5RUTgBakVvxnN+xfbDe9T6Wd5vXubHKRhP6zI3koISaNZX1yzmSFdlDpq
	C2LvKHwrXg8qeD2wfzLZwibYAvDz1oeqJ8SdGJKVoc8xmqfQPo5hIVFPd6UTdnezYDfW22g
	+8hNWE90Hilp2BpmDb9TYEpE8uRNohDr5D12jUJTj3yzAISv7iNWjo4ZuSCarCAl7AeWR1m
	oF56iOYrIUvfIqWquUa6u0fsaWpTXoug3KAZwfgvlx0mCgQiD+EysXtcvahx/4p5RK5vjau
	aLIpOsPqg2msTZmsM6NqQT68E7/xw4QqYCLWbz95GwdLua2nuV90de6zJDu+/Cbv0239fqe
	ZzJ5RjRiC/ElN00HMRLlEEniGQJidXOVUUPpUhJtzx2zhHqlRWTp+UpN2Nhag1Yts6iBVW2
	p7b78c3EtKwEsa2MYIgpPT4rH08yiR7KI4DupiV9UeutIDVz8xa/SjCSWKQqAf2QKmfqiaf
	pK+mRN37gBLN73RaqAVdjdtF5fVIBapicftDzHZikq62FIAi/LikK1zQFfb+MMOtOUqE4iE
	zzQ9O7exV9Wk7gGmBXXqJ3AQoONTJHFhOMBrzkXMzMBzR58lUlCInyHTR4HNMH2eZr9w6/+
	YCRj
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_183651_357716_703756DA 
X-CRM114-Status: GOOD (  37.60  )
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

On Wed, Aug 20, 2025 at 09:31:24AM +0800, Troy Mitchell wrote:
> On Tue, Aug 19, 2025 at 02:40:21AM -0700, Drew Fustini wrote:
> > From: Drew Fustini <dfustini@tenstorrent.com>
> > 
> > Vector registers are always clobbered in the syscall entry path to
> > enforce the documented ABI that vector state is not preserved across
> > syscalls. However, this operation can be slow on some RISC-V cores.
> > To mitigate this performance impact, add a sysctl knob to control
> > whether vector state is discarded in the syscall entry path:
> > 
> > /proc/sys/abi/riscv_v_vstate_discard
> > 
> > Valid values are:
> > 
> > 0: Vector state is not intentionally clobbered when entering a syscall
> > 1: Vector state is always clobbered when entering a syscall
> > 
> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
> > 
> > Fixes: 9657e9b7d253 ("riscv: Discard vector state on syscalls")
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> > Changes in v3:
> >  - Reword the Kconfig description to clarify that the sysctl can still
> >    be changed during runtime regardless of the initial value chosen
> >  - Improve the description of vstate clobbering and the sysctl in
> >    section 3 of vector.rst
> >  - v2: https://lore.kernel.org/linux-riscv/20250806-riscv_v_vstate_discard-v2-1-6bfd61b2c23b@kernel.org/
> > 
> > Changes in v2:
> >  - Reword the description of the abi.riscv_v_vstate_discard sysctl to
> >    clarify that option '0' does not preserve the vector state - it just
> >    means that vector state will not always be clobbered in the syscall
> >    path.
> >  - Add clarification suggested by Palmer in v1 to the "Vector Register
> >    State Across System Calls" documentation section.
> >  - v1: https://lore.kernel.org/linux-riscv/20250719033912.1313955-1-fustini@kernel.org/
> > 
> > Test results:
> > I've tested the impact of riscv_v_vstate_discard() on the SiFive X280
> > cores [1] in the Tenstorrent Blackhole SoC [2]. The results from the
> > Blackhole P100 [3] card show that discarding the vector registers
> > increases null syscall latency by 25%.
> > 
> > The null syscall program [4] executes vsetvli and then calls getppid()
> > in a loop. The average duration of getppid() is 198 ns when registers
> > are clobbered in riscv_v_vstate_discard(). The average duration drops
> > to 149 ns when riscv_v_vstate_discard() skips clobbering the registers
> > because riscv_v_vstate_discard is set to 0.
> > 
> > $ sudo sysctl abi.riscv_v_vstate_discard=1
> > abi.riscv_v_vstate_discard = 1
> > 
> > $ ./null_syscall --vsetvli
> > vsetvli complete
> >  iterations: 1000000000
> >    duration: 198 seconds
> > avg latency: 198.73 ns
> > 
> > $ sudo sysctl abi.riscv_v_vstate_discard=0
> > abi.riscv_v_vstate_discard = 0
> > 
> > $ ./null_syscall --vsetvli
> > vsetvli complete
> >  iterations: 1000000000
> >    duration: 149 seconds
> > avg latency: 149.89 ns
> > 
> > I'm testing on the tt-blackhole-v6.16-rc1_vstate_discard [5] branch that
> > has 13 patches, including this one, on top of v6.16-rc1. Most are simple
> > yaml patches for dt bindings along with dts files and a bespoke network
> > driver. I don't think the other patches are relevant to this discussion.
> > 
> > This patch applies clean on its own mainline and riscv/for-next.
> > 
> > [1] https://www.sifive.com/cores/intelligence-x200-series
> > [2] https://tenstorrent.com/en/hardware/blackhole
> > [3] https://github.com/tenstorrent/tt-bh-linux
> > [4] https://gist.github.com/tt-fustini/ab9b217756912ce75522b3cce11d0d58
> > [5] https://github.com/tenstorrent/linux/tree/tt-blackhole-v6.16-rc1_vstate_discard
> > 
> > Signed-off-by: Drew Fustini <fustini@kernel.org>
> > ---
> [...]
> 
> > diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> > index 184f780c932d443d81eecac7a6fb8070ee7a5824..7a4c209ad337efd7a3995cfc7cf1700c03e55b40 100644
> > --- a/arch/riscv/kernel/vector.c
> > +++ b/arch/riscv/kernel/vector.c
> > @@ -26,6 +26,7 @@ static struct kmem_cache *riscv_v_user_cachep;
> >  static struct kmem_cache *riscv_v_kernel_cachep;
> >  #endif
> >  
> > +bool riscv_v_vstate_discard_ctl = IS_ENABLED(CONFIG_RISCV_ISA_V_VSTATE_DISCARD);
> >  unsigned long riscv_v_vsize __read_mostly;
> >  EXPORT_SYMBOL_GPL(riscv_v_vsize);
> >  
> > @@ -307,11 +308,24 @@ static const struct ctl_table riscv_v_default_vstate_table[] = {
> >  	},
> >  };
> >  
> > +static const struct ctl_table riscv_v_vstate_discard_table[] = {
> > +	{
> > +		.procname       = "riscv_v_vstate_discard",
> > +		.data           = &riscv_v_vstate_discard_ctl,
> > +		.maxlen         = sizeof(riscv_v_vstate_discard_ctl),
> > +		.mode           = 0644,
> > +		.proc_handler   = proc_dobool,
> > +	},
> > +};
> > +
> >  static int __init riscv_v_sysctl_init(void)
> >  {
> > -	if (has_vector() || has_xtheadvector())
> > +	if (has_vector() || has_xtheadvector()) {
> Is this pair of curly braces strictly necessary?
> for potential extensibility?
> 
> Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Best regards,
> Troy
> >  		if (!register_sysctl("abi", riscv_v_default_vstate_table))
> >  			return -EINVAL;
> > +		if (!register_sysctl("abi", riscv_v_vstate_discard_table))
> > +			return -EINVAL;
Ah, my earlier comment was based on the assumption that this was a modified line.
Since it's actually newly added, that was my mistake. :(

> > +	}
> >  	return 0;
> >  }
> >  
> > 
> > ---
> > base-commit: 3ac864c2d9bb8608ee236e89bf561811613abfce
> > change-id: 20250818-riscv_v_vstate_discard-e89b3181e0ac
> > 
> > Best regards,
> > -- 
> > Drew Fustini <fustini@kernel.org>
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
