Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E970C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85ec2seM3YbktyAb0+dPSYWAjGHMXpf7GU7SjD7OBlc=; b=qJXchr6aM0ZJFS
	G/bHFr0YFIJ8JGjoOkCmYy1BwSN2FxZore9Yd8ohfiBaSUVkk6UTVsNK3LST5DKV3MoYttSxTA8GA
	8coDsmNIrqdSF+759JvkVkoO1KMRMEMp+s7Bat9rK99nrVXsEp84/53tcM1ahPacArTrsNgCOzKIv
	MmB/EujXJFYdUlMr4pKq+7o7ZFfu7ehVHyYIb763qVxGeBQ0y92VimeC1aQOY6GtOpN3guWUkPhY2
	ZTuVjGQJ9Dwk6W6mHZ9TJJ801sVgV0LByb9P7Qno1Nw4ClSbGdDe+QoTCk2hDafgepkgm62Nw+1lH
	YUadtDpjzFGtLEVJJuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxCdx-000000002wt-3cvF;
	Wed, 17 Apr 2024 21:16:37 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxCdu-000000002tJ-0t9k;
	Wed, 17 Apr 2024 21:16:35 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ecff9df447so246416b3a.1;
        Wed, 17 Apr 2024 14:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713388587; x=1713993387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bn6gtyCUSwijw+6XX0qI9C//f05i55ZPnAFUJjnUL90=;
        b=MExa/TsWQycHlM5RqdLrm1i/q8rlqkFjf28cW5RFo5Rjzkuq+dksEGo833COuPwHKl
         3t0P7Q80nNQADUmHcRaWDJpTPNEOb5YSRK2t22LEAwJ4EL1493nd3Nhtsmu9SLOfV06w
         BNpdHRAoFooHyVi3W1JgXnMFLju/wU+q4ucWyzawi/bmK5ror/Z8xzauglZ76HUnHjaw
         Uw09UV42jADPNdJ5uTL+4hH+Y79AoGlP3YYTwowD7bWhJa8uG+rOpq5Bq4KrLHun9Dqw
         bnzhtSTPwI6Dp6paXyFgkoD6k3T5xA6zeI27HAv/o6di8eD1JsqOIeaVoJJlsA79x7gh
         pNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713388587; x=1713993387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bn6gtyCUSwijw+6XX0qI9C//f05i55ZPnAFUJjnUL90=;
        b=kwK1WQOKMlgI3pdr/XX4ZJdI2+ZLdtkiofcRgzMVGg65+iOHw44POPeafRXJgnNROU
         OoTbSrkY1fYstrmbzCC5SWIJXdgKy6UpT83VQMw2Qj3u9RMOSh5dEl0GL9dim/LlKerZ
         v7uBw3H7HHNLlNAHpvI0IsXfMcd9uKLkCQvljO88bkNpUqoEHNbqNXaInQmCwOvFpEZO
         zHc+7hrqhbHkI04tVYZXyyh2ydPCMK3XzX4Jqyl2T+cglcmlCbSOFj1MHhK0Mf0Z/jA6
         dFRDhQB0wOFSiCKHL29iVQua8ZvHh3lx7XDSTW1eQ2/4aW56SuI7xOCpaK1My92ufb/V
         Duaw==
X-Forwarded-Encrypted: i=1; AJvYcCVvBsm5pLBRG1w/nzdEVMiLoxzoXBxrFJW7Kj84sY95we9MB/JJsqWSJ/PbIal1CDMqP/hqfVUg+R6qLk22QBJqnIPinkWIHMpSPzUvjDwbvTDNbda3odMuUcNo9hs34p5fdpA+vLcMIl826akyQBm+GLfcz88=
X-Gm-Message-State: AOJu0YyE4C5rrMlkaz50dTRhKXCNvMwP6z6ng4VZurKNGGWMy/wAuCH5
	1YwcJh35yRnKvqvq7JDS8r99UpwqvAFsgm3D/XQNUp5Ut0EgTsBk
X-Google-Smtp-Source: AGHT+IGaiPoLXXXpVrpLOJx1iAETWJgKsjUW+rWbh5/bn42gLXIa3/rbbH0xm62Oxp9IYd0WoUIt9A==
X-Received: by 2002:aa7:8884:0:b0:6eb:1d5:6e43 with SMTP id z4-20020aa78884000000b006eb01d56e43mr962657pfe.11.1713388587052;
        Wed, 17 Apr 2024 14:16:27 -0700 (PDT)
Received: from devnote2 (113x37x226x201.ap113.ftth.ucom.ne.jp. [113.37.226.201])
        by smtp.gmail.com with ESMTPSA id h3-20020a056a00218300b006ed4aa9d48esm110372pfi.212.2024.04.17.14.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 14:16:26 -0700 (PDT)
Date: Thu, 18 Apr 2024 06:16:15 +0900
From: Masami Hiramatsu <masami.hiramatsu@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, "David S. Miller"
 <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald Dutile
 <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko Carstens
 <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, Luis
 Chamberlain <mcgrof@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit <nadav.amit@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King
 <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 14/15] kprobes: remove dependency on CONFIG_MODULES
Message-Id: <20240418061615.5fad23b954bf317c029acc4d@gmail.com>
In-Reply-To: <20240411160051.2093261-15-rppt@kernel.org>
References: <20240411160051.2093261-1-rppt@kernel.org>
	<20240411160051.2093261-15-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_141634_332709_A94FDEE9 
X-CRM114-Status: GOOD (  30.74  )
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

Hi Mike,

On Thu, 11 Apr 2024 19:00:50 +0300
Mike Rapoport <rppt@kernel.org> wrote:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> kprobes depended on CONFIG_MODULES because it has to allocate memory for
> code.
> 
> Since code allocations are now implemented with execmem, kprobes can be
> enabled in non-modular kernels.
> 
> Add #ifdef CONFIG_MODULE guards for the code dealing with kprobes inside
> modules, make CONFIG_KPROBES select CONFIG_EXECMEM and drop the
> dependency of CONFIG_KPROBES on CONFIG_MODULES.

Thanks for this work, but this conflicts with the latest fix in v6.9-rc4.
Also, can you use IS_ENABLED(CONFIG_MODULES) instead of #ifdefs in
function body? We have enough dummy functions for that, so it should
not make a problem.

Thank you,

> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---
>  arch/Kconfig                |  2 +-
>  kernel/kprobes.c            | 43 +++++++++++++++++++++----------------
>  kernel/trace/trace_kprobe.c | 11 ++++++++++
>  3 files changed, 37 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index bc9e8e5dccd5..68177adf61a0 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -52,9 +52,9 @@ config GENERIC_ENTRY
>  
>  config KPROBES
>  	bool "Kprobes"
> -	depends on MODULES
>  	depends on HAVE_KPROBES
>  	select KALLSYMS
> +	select EXECMEM
>  	select TASKS_RCU if PREEMPTION
>  	help
>  	  Kprobes allows you to trap at almost any kernel address and
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 047ca629ce49..90c056853e6f 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1580,6 +1580,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_MODULES
>  	/* Check if 'p' is probing a module. */
>  	*probed_mod = __module_text_address((unsigned long) p->addr);
>  	if (*probed_mod) {
> @@ -1603,6 +1604,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  			ret = -ENOENT;
>  		}
>  	}
> +#endif
> +
>  out:
>  	preempt_enable();
>  	jump_label_unlock();
> @@ -2482,24 +2485,6 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
>  	return 0;
>  }
>  
> -/* Remove all symbols in given area from kprobe blacklist */
> -static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
> -{
> -	struct kprobe_blacklist_entry *ent, *n;
> -
> -	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
> -		if (ent->start_addr < start || ent->start_addr >= end)
> -			continue;
> -		list_del(&ent->list);
> -		kfree(ent);
> -	}
> -}
> -
> -static void kprobe_remove_ksym_blacklist(unsigned long entry)
> -{
> -	kprobe_remove_area_blacklist(entry, entry + 1);
> -}
> -
>  int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>  				   char *type, char *sym)
>  {
> @@ -2564,6 +2549,25 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
>  	return ret ? : arch_populate_kprobe_blacklist();
>  }
>  
> +#ifdef CONFIG_MODULES
> +/* Remove all symbols in given area from kprobe blacklist */
> +static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
> +{
> +	struct kprobe_blacklist_entry *ent, *n;
> +
> +	list_for_each_entry_safe(ent, n, &kprobe_blacklist, list) {
> +		if (ent->start_addr < start || ent->start_addr >= end)
> +			continue;
> +		list_del(&ent->list);
> +		kfree(ent);
> +	}
> +}
> +
> +static void kprobe_remove_ksym_blacklist(unsigned long entry)
> +{
> +	kprobe_remove_area_blacklist(entry, entry + 1);
> +}
> +
>  static void add_module_kprobe_blacklist(struct module *mod)
>  {
>  	unsigned long start, end;
> @@ -2665,6 +2669,7 @@ static struct notifier_block kprobe_module_nb = {
>  	.notifier_call = kprobes_module_callback,
>  	.priority = 0
>  };
> +#endif
>  
>  void kprobe_free_init_mem(void)
>  {
> @@ -2724,8 +2729,10 @@ static int __init init_kprobes(void)
>  	err = arch_init_kprobes();
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
> +#ifdef CONFIG_MODULES
>  	if (!err)
>  		err = register_module_notifier(&kprobe_module_nb);
> +#endif
>  
>  	kprobes_initialized = (err == 0);
>  	kprobe_sysctls_init();
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index 14099cc17fc9..f0610137d6a3 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -111,6 +111,7 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
>  	return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
>  }
>  
> +#ifdef CONFIG_MODULES
>  static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  {
>  	char *p;
> @@ -129,6 +130,12 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  
>  	return ret;
>  }
> +#else
> +static inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
> +{
> +	return false;
> +}
> +#endif
>  
>  static bool trace_kprobe_is_busy(struct dyn_event *ev)
>  {
> @@ -670,6 +677,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking event on the module */
>  static int trace_kprobe_module_callback(struct notifier_block *nb,
>  				       unsigned long val, void *data)
> @@ -704,6 +712,7 @@ static struct notifier_block trace_kprobe_module_nb = {
>  	.notifier_call = trace_kprobe_module_callback,
>  	.priority = 1	/* Invoked after kprobe module callback */
>  };
> +#endif
>  
>  static int count_symbols(void *data, unsigned long unused)
>  {
> @@ -1933,8 +1942,10 @@ static __init int init_kprobe_trace_early(void)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_MODULES
>  	if (register_module_notifier(&trace_kprobe_module_nb))
>  		return -EINVAL;
> +#endif
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 
> 


-- 
Masami Hiramatsu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
