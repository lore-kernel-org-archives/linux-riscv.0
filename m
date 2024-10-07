Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA5CFB440
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 09:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8asBBe4VnFkzy3e0c3x+5YQ1q6umBVACM6PhTiRR5M=; b=r2KEpqmxhU6nIg
	B9kK4zZURp8oGhmWG1TDEZtEVwy+a5NptLSsYjiQ0nefO2jYuQHebH+8ukRKvS/EUMCFMbtPR7zbG
	zTKA0Z3TUjBmisYc4heVOfeQIr+h3e5PS0TuLqe6U3ddyvHcUWbeCL6TwfhXJmwVZzWzVwlF51bz1
	Vy5U+XMpktnq/xzlVXv2+hW/2mP/+d5GgFfKqivdSX1HWPrEws1lyBJibd1RY1xjAR8PkfpQfKqm4
	AlvA5nMy7gtNoyky1YeJJmoNihvyqQYApW9ABXfnu5cage1C08Hzku92zkkyzFnuEdyahqVfzyj0s
	+131IBTIcDkUTHabGxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxk4T-00000001uan-1jEP;
	Mon, 07 Oct 2024 09:30:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxioG-00000001hib-1jgy;
	Mon, 07 Oct 2024 08:09:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 724E2A41752;
	Mon,  7 Oct 2024 08:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E616C4CEC7;
	Mon,  7 Oct 2024 08:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728288578;
	bh=8A4LNrSPbtLsdiUlwiAFIP/WRiJe0bPp+tezN0/84Fs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eTqG09+1vQrt6TC4tc3DKzCnxiRkugw0Py7gdfFYbu2No0a8LSgbxTkTGiFFjrj+F
	 0FXMQ87ww+bnK/AOZyU4kXp9m6eGAuHUS0Oc5cqDAreWQr3ALXOga9+E35wYNWMj8b
	 8aOLIGM96nTVJTldZ7c+o0cvodyEYCajg2ssSH+mOqvJ92uvM/Fd9VYo+DrV2cEANl
	 lJ7tPa/k263as/JRhNAQgJzOoHr+4bI7Y0Oxfftk2tu402RdVVhLx+LWgI6q9GFejZ
	 W3MeHq2/fy9hv0ov2cuMvDd3DHyVFXEjN1aevA2bgjNjSA+BPP+jdvSrGH1jX+LkUQ
	 SUrdGSuCVJc4g==
Date: Mon, 7 Oct 2024 17:09:27 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kan Liang
 <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, Will
 Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, Mike Leach
 <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren
 <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nick
 Terrell <terrelln@fb.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>,
 Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner
 <dwagner@suse.de>, Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev
 <atrajeev@linux.vnet.ibm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Kajol Jain <kjain@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Bibo
 Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>,
 Oliver Upton <oliver.upton@linux.dev>, "Steinar H. Gunderson"
 <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, Chen Pei
 <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, Yury Norov
 <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 17/31] perf dwarf-regs: Pass ELF flags to
 get_dwarf_regstr
Message-Id: <20241007170927.f30fced63c5e777628bea311@kernel.org>
In-Reply-To: <20241005195541.380070-18-irogers@google.com>
References: <20241005195541.380070-1-irogers@google.com>
	<20241005195541.380070-18-irogers@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_010940_624308_5C0016AA 
X-CRM114-Status: GOOD (  25.04  )
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

On Sat,  5 Oct 2024 12:55:27 -0700
Ian Rogers <irogers@google.com> wrote:

> Pass a flags value as architectures like csky need the flags to
> determine the ABI variant.
> 

Same here. I need some examples of this chaneg.

Thank you,

> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/perf/util/dwarf-regs.c         |  3 ++-
>  tools/perf/util/include/dwarf-regs.h | 11 ++++++-----
>  tools/perf/util/probe-finder.c       | 13 +++++++------
>  tools/perf/util/probe-finder.h       |  3 ++-
>  4 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
> index 1321387f6948..86b3ef638fbb 100644
> --- a/tools/perf/util/dwarf-regs.c
> +++ b/tools/perf/util/dwarf-regs.c
> @@ -29,7 +29,8 @@
>  #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
>  
>  /* Return architecture dependent register string (for kprobe-tracer) */
> -const char *get_dwarf_regstr(unsigned int n, unsigned int machine)
> +const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
> +			     unsigned int flags __maybe_unused)
>  {
>  	switch (machine) {
>  	case EM_NONE:	/* Generic arch - use host arch */
> diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
> index ee0a734564c7..925525405e2d 100644
> --- a/tools/perf/util/include/dwarf-regs.h
> +++ b/tools/perf/util/include/dwarf-regs.h
> @@ -80,12 +80,13 @@
>  
>  #ifdef HAVE_LIBDW_SUPPORT
>  const char *get_arch_regstr(unsigned int n);
> -/*
> - * get_dwarf_regstr - Returns ftrace register string from DWARF regnum
> - * n: DWARF register number
> - * machine: ELF machine signature (EM_*)
> +/**
> + * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
> + * @n: DWARF register number.
> + * @machine: ELF machine signature (EM_*).
> + * @flags: ELF flags for things like ABI differences.
>   */
> -const char *get_dwarf_regstr(unsigned int n, unsigned int machine);
> +const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
>  
>  int get_arch_regnum(const char *name);
>  /*
> diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
> index 8019d232f515..29eaa9beca86 100644
> --- a/tools/perf/util/probe-finder.c
> +++ b/tools/perf/util/probe-finder.c
> @@ -56,7 +56,7 @@ static struct probe_trace_arg_ref *alloc_trace_arg_ref(long offs)
>   */
>  static int convert_variable_location(Dwarf_Die *vr_die, Dwarf_Addr addr,
>  				     Dwarf_Op *fb_ops, Dwarf_Die *sp_die,
> -				     unsigned int machine,
> +				     const struct probe_finder *pf,
>  				     struct probe_trace_arg *tvar)
>  {
>  	Dwarf_Attribute attr;
> @@ -166,7 +166,7 @@ static int convert_variable_location(Dwarf_Die *vr_die, Dwarf_Addr addr,
>  	if (!tvar)
>  		return ret2;
>  
> -	regs = get_dwarf_regstr(regn, machine);
> +	regs = get_dwarf_regstr(regn, pf->e_machine, pf->e_flags);
>  	if (!regs) {
>  		/* This should be a bug in DWARF or this tool */
>  		pr_warning("Mapping for the register number %u "
> @@ -451,7 +451,7 @@ static int convert_variable(Dwarf_Die *vr_die, struct probe_finder *pf)
>  		 dwarf_diename(vr_die));
>  
>  	ret = convert_variable_location(vr_die, pf->addr, pf->fb_ops,
> -					&pf->sp_die, pf->machine, pf->tvar);
> +					&pf->sp_die, pf, pf->tvar);
>  	if (ret == -ENOENT && pf->skip_empty_arg)
>  		/* This can be found in other place. skip it */
>  		return 0;
> @@ -1134,7 +1134,8 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
>  	if (gelf_getehdr(elf, &ehdr) == NULL)
>  		return -EINVAL;
>  
> -	pf->machine = ehdr.e_machine;
> +	pf->e_machine = ehdr.e_machine;
> +	pf->e_flags = ehdr.e_flags;
>  
>  	do {
>  		GElf_Shdr shdr;
> @@ -1171,7 +1172,7 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
>  	    (tag == DW_TAG_variable && vf->vars)) {
>  		if (convert_variable_location(die_mem, vf->pf->addr,
>  					      vf->pf->fb_ops, &pf->sp_die,
> -					      pf->machine, NULL) == 0) {
> +					      pf, /*tvar=*/NULL) == 0) {
>  			vf->args[vf->nargs].var = (char *)dwarf_diename(die_mem);
>  			if (vf->args[vf->nargs].var == NULL) {
>  				vf->ret = -ENOMEM;
> @@ -1403,7 +1404,7 @@ static int collect_variables_cb(Dwarf_Die *die_mem, void *data)
>  	    tag == DW_TAG_variable) {
>  		ret = convert_variable_location(die_mem, af->pf.addr,
>  						af->pf.fb_ops, &af->pf.sp_die,
> -						af->pf.machine, NULL);
> +						&af->pf, /*tvar=*/NULL);
>  		if (ret == 0 || ret == -ERANGE) {
>  			int ret2;
>  			bool externs = !af->child;
> diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
> index b9a5afca4cc1..71e21cb4492a 100644
> --- a/tools/perf/util/probe-finder.h
> +++ b/tools/perf/util/probe-finder.h
> @@ -68,7 +68,8 @@ struct probe_finder {
>  	/* Call Frame Information from .debug_frame */
>  	Dwarf_CFI		*cfi_dbg;
>  	Dwarf_Op		*fb_ops;	/* Frame base attribute */
> -	unsigned int		machine;	/* Target machine arch */
> +	unsigned int		e_machine;	/* ELF target machine arch */
> +	unsigned int		e_flags;	/* ELF target machine flags */
>  	struct perf_probe_arg	*pvar;		/* Current target variable */
>  	struct probe_trace_arg	*tvar;		/* Current result variable */
>  	bool			skip_empty_arg;	/* Skip non-exist args */
> -- 
> 2.47.0.rc0.187.ge670bccf7e-goog
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
