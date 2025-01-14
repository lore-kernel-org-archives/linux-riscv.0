Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD9DE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 22:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tpwk5UPycY/4FUvDD1sy6u1sMZoysfbgySyxlaQBHKo=; b=BF8V+nO6C6klNdWzlg5b+LiPdf
	9en43tiEvl8Xr0py0UNvpKWSv4pPUQ+gB0+z0Lu7GRebUchjn+0u+kf31nu3uA4JVjhNdxVhs253i
	Ix1nh1sm1zg7yAKfVNf7/TvXe6Mz6hR90Yxj8FHnGIbhVEohU1xbpcnlWhHhpBh29jFtk8udJrMI+
	XBjLus0IyW/R7macU7Gb1xmOZMzmsfzvU6PgPqnlrGKZIXIELdNfcT2H8AYTxRV02LMXRo/86og6h
	0EG9r8QG+CkiBs2t+xUdr/f3GTzRen/+IXqkI2o6QX8bk02bWeUnqTNts75OyQf0ixpLXZtdG25hD
	7/uhC5Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpE1-00000009upe-2VIt;
	Tue, 14 Jan 2025 22:17:29 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoEa-00000009mIl-17Eq
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 21:14:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso10697789a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 13:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736889239; x=1737494039; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9cRGGic7Te5o12Iwy1M3OB31drPOXRp+PHli2u04Fc=;
        b=UcekLZ8LIxO2KqARy5YMNORPGGZNyORrhO41lvA15/WAwI6dXnB9egjt4RbnE2FS1f
         NCUWNMtymT5JqP3EGqTLyD+SIHX1YLS4KKoGRAEtuGLzaVOVAIZ57TTpGpWizSlVuZxO
         P86gwkm+Q1kEpNQL5V0cilJ0+KuBJ+Gt0IUPMa83W1CJnfPhaWpXrO8VmmU3YX1sUz9N
         7mh2vPgwQp1/i1yIY5jg9YVope44Zok7GsutbxvAvSWMKmsT7H1p8xV8jVna36PeGcow
         0QuoerChz30k3qw3LowDTrJ49HIevPXpCWOLuhAy2LKrTlT2yx2xOjDIAzvxy8V1MXK5
         ri0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736889239; x=1737494039;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d9cRGGic7Te5o12Iwy1M3OB31drPOXRp+PHli2u04Fc=;
        b=wD1oC80JYEdBL8xd2BRaf7EHgMOjFEarblabOJk/pPNcOokEAxmkkZNlrGDNHQPymT
         g28KdKTWhPV5ue6EAL2jjP3w6e+KF8vOfd+XfXP0JRk2lU3W2aNnG6TZop+ARSGnFC92
         7g84cNYEM3vp26a8Qoazx1bFmAh5FCWIcx73/rD2CW2hdn/uA8m2EfIXNkCtzgGj2J68
         HkQGP02TU9sXDbwYNO7ilnKAbCcM89SqN+UfqwlMFwWxYjBML/rwk3I5/c3zMC3gdcKr
         Wy82pTqAx1hC6Qh7Vd9Ud+7G9Kjk7aGRVAf3GMrnNgmp9qbt/nfCP7sMB7l21THrqC8P
         99GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVhzG1YEPJCC52vHGX4F5+7PffQzjNVbrcai082YyVfjLqH9h3E4ygpNG0RwteJJx04Ng3p11FvMKEdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDl+O+jbBOF7G5swp3zcjNEACDT0NHq81IzwIj2JhbxORVIcbx
	dcirWdQFUu7CClhKLdiH19BsWXSthNNPrl2qByDf8oX6EwhOTz2hEi7eXc4WgzTK5Pw6W3EQ5N9
	6fQ==
X-Google-Smtp-Source: AGHT+IFnD8IBYtaFLZfmn+yp8faKF4j5W1D2QQ93HaiFkyR3KITtNCKyHKA+6Vtw5k/ROipPB4Gea/5UJbQ=
X-Received: from pjbsn8.prod.google.com ([2002:a17:90b:2e88:b0:2f4:465d:5c61])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8b:b0:2ee:bf84:4fe8
 with SMTP id 98e67ed59e1d1-2f548f1d44cmr36656404a91.30.1736889238866; Tue, 14
 Jan 2025 13:13:58 -0800 (PST)
Date: Tue, 14 Jan 2025 13:13:57 -0800
In-Reply-To: <20250114175143.81438-26-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
Message-ID: <Z4bTlZkqihaAyGb4@google.com>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text patching IPIs
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_131400_313539_3CDF74B5 
X-CRM114-Status: GOOD (  26.69  )
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

On Tue, Jan 14, 2025, Valentin Schneider wrote:
> text_poke_bp_batch() sends IPIs to all online CPUs to synchronize
> them vs the newly patched instruction. CPUs that are executing in userspace
> do not need this synchronization to happen immediately, and this is
> actually harmful interference for NOHZ_FULL CPUs.

...

> This leaves us with static keys and static calls.

...

> @@ -2317,11 +2334,20 @@ static void text_poke_bp_batch(struct text_poke_loc *tp, unsigned int nr_entries
>  	 * First step: add a int3 trap to the address that will be patched.
>  	 */
>  	for (i = 0; i < nr_entries; i++) {
> -		tp[i].old = *(u8 *)text_poke_addr(&tp[i]);
> -		text_poke(text_poke_addr(&tp[i]), &int3, INT3_INSN_SIZE);
> +		void *addr = text_poke_addr(&tp[i]);
> +
> +		/*
> +		 * There's no safe way to defer IPIs for patching text in
> +		 * .noinstr, record whether there is at least one such poke.
> +		 */
> +		if (is_kernel_noinstr_text((unsigned long)addr))
> +			cond = NULL;

Maybe pre-check "cond", especially if multiple ranges need to be checked?  I.e.

		if (cond && is_kernel_noinstr_text(...))
> +
> +		tp[i].old = *((u8 *)addr);
> +		text_poke(addr, &int3, INT3_INSN_SIZE);
>  	}
>  
> -	text_poke_sync();
> +	__text_poke_sync(cond);
>  
>  	/*
>  	 * Second step: update all but the first byte of the patched range.

...

> +/**
> + * is_kernel_noinstr_text - checks if the pointer address is located in the
> + *                    .noinstr section
> + *
> + * @addr: address to check
> + *
> + * Returns: true if the address is located in .noinstr, false otherwise.
> + */
> +static inline bool is_kernel_noinstr_text(unsigned long addr)
> +{
> +	return addr >= (unsigned long)__noinstr_text_start &&
> +	       addr < (unsigned long)__noinstr_text_end;
> +}

This doesn't do the right thing for modules, which matters because KVM can be
built as a module on x86, and because context tracking understands transitions
to GUEST mode, i.e. CPUs that are running in a KVM guest will be treated as not
being in the kernel, and thus will have IPIs deferred.  If KVM uses a static key
or branch between guest_state_enter_irqoff() and guest_state_exit_irqoff(), the
patching code won't wait for CPUs to exit guest mode, i.e. KVM could theoretically
use the wrong static path.

I don't expect this to ever cause problems in practice, because patching code in
KVM's VM-Enter/VM-Exit path that has *functional* implications, while CPUs are
actively running guest code, would be all kinds of crazy.  But I do think we
should plug the hole.

If this issue is unique to KVM, i.e. is not a generic problem for all modules (I
assume module code generally isn't allowed in the entry path, even via NMI?), one
idea would be to let KVM register its noinstr section for text poking.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
