Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A676D5C0DA
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 08:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQ6Owlg6Jg0BGpD/xRbzIdWFI1LWyS85drZ4Q/5Ohsw=; b=dFuGL4tIUfXMcA
	IlXZ9cKK8FkspJR2NLUf+Q0SMRnXVxz6j5BkA8AZrw0xWmFY6aUIrTsi70fzEYhPabuynjxAI3O39
	yvdOSbtBekbVu7uk8aI0GtcoCW+vAL/n+yN3+SH7edHrcCQ/3dJSY0eUmJlSMCbxlDv9p/W/zHHcN
	WdMULWYkeXFyO7+WckySUBC7QXVS93SPd3nVTs3Cqhbp76/AZ3dfZG+KYozfWTgs2N8EdD1HVcPRT
	o9MU2clE2NKzsaD6NMYqWhO3cvIkRBRSulkmcPmCyWKtSUERkSziS2XRfXevdWZ1jlR1MBNwAt9HF
	g90nlUKRBHhccCDORI6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQSY-00000004vTM-1CXk;
	Tue, 16 Dec 2025 08:31:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQSS-00000004vS1-1LQe
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 08:31:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 69EA144477
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 08:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8EEC19425
	for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765873858;
	bh=rdAB3rTsM2kPBbfJpGSxoybGGY6bsi0WVH/CDiWPH48=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R46judFncVma2UFkYNjNbr5TdEW5KwY37YfDgTTMBud2rQmcJUAnmBnMrDf1is8DC
	 YT+TBjs7FKekCEF8JOh9ldb5XizTh/Tj/w9kwNdx5zUs1WdQZ+BExOLO79AssVyF51
	 ZPBMNIh0rsAt9wmBuHIn/81Yuk4D+z//KNCdxmOw7rd/oEoENSJCBpvEKa68Nh7FJJ
	 1ZZYbmAt/IClCuefumIVBl6tRsiIZBXzWi1PyJJwNttKROJkSk3+9BLLgDLBbJVa7O
	 hMPoh+ejhyJzBuvUcsz2E2Tt89BPr8TmCttIy5UOPOFiSPkyKk3DQX5T61SCdhvi6F
	 s2EPkv/G0k1Fg==
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c363eb612so2809056a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 00:30:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXa/oq4KfC/ZdUKpEJZJJHTYI8CST6zcJiKs1aMa/39juy4CEvYmHrtHRUfZba8qWEp09L4acY6vGLL5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBHRJtZ3/UXeeaxGfehmOKX+XbBHbzdxnDuMQ2b16J0oeP7Ioq
	Qj32e6Kgcg8FuN4SfdCdECfMralo2UGyjE4smXgmckakW9MIAurdZDbucNRBok7nilhjafHgKwz
	drJcHy+rIAw2X6AI0hV9okNNd7V49JxU=
X-Google-Smtp-Source: AGHT+IEZiIoxZ4ahkNk0/4l0GnF/w4QftZY+MiBqqc58ZUWKxJID5qTsh8sHraWFLh9as/x1Z9qBIWeJzeWk9xWW63w=
X-Received: by 2002:a17:90b:35c8:b0:340:e521:bc73 with SMTP id
 98e67ed59e1d1-34abd6cc48fmr9458424a91.5.1765873857654; Tue, 16 Dec 2025
 00:30:57 -0800 (PST)
MIME-Version: 1.0
References: <20251215163520.1144179-1-ryan.roberts@arm.com>
 <20251215163520.1144179-4-ryan.roberts@arm.com> <202512160024.B688A8D0@keescook>
In-Reply-To: <202512160024.B688A8D0@keescook>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 16 Dec 2025 09:30:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
X-Gm-Features: AQt7F2qEPqn2Fyl42wG6ot8Vul4tzgiSNEtR5kH_hcxqBXNDjzmNBXOTKIXUk1o
Message-ID: <CAMj1kXHaqfEqDpvC-iC1fUn+JpTj=oqfM2sh+sbaC8_PBVHBUQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across arches
To: Kees Cook <kees@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_003100_462925_BA68F1FC 
X-CRM114-Status: GOOD (  14.63  )
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

On Tue, 16 Dec 2025 at 09:27, Kees Cook <kees@kernel.org> wrote:
>
> On Mon, Dec 15, 2025 at 04:35:17PM +0000, Ryan Roberts wrote:
> > [...]
> > @@ -45,9 +46,22 @@ DECLARE_STATIC_KEY_MAYBE(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,
> >  #define KSTACK_OFFSET_MAX(x) ((x) & 0b1111111100)
> >  #endif
> >
> > +DECLARE_PER_CPU(struct rnd_state, kstack_rnd_state);
> > +
> > +static __always_inline u32 get_kstack_offset(void)
> > +{
> > +     struct rnd_state *state;
> > +     u32 rnd;
> > +
> > +     state = &get_cpu_var(kstack_rnd_state);
> > +     rnd = prandom_u32_state(state);
> > +     put_cpu_var(kstack_rnd_state);
> > +
> > +     return rnd;
> > +}
> > [...]
> > -static inline void random_kstack_task_init(struct task_struct *tsk)
> > +static int random_kstack_init(void)
> >  {
> > -     tsk->kstack_offset = 0;
> > +     prandom_seed_full_state(&kstack_rnd_state);
> > +     return 0;
> >  }
> > +
> > +late_initcall(random_kstack_init);
>
> Doesn't this need to be run for every CPU? (And how does hotplug work
> for such things?) And doesn't it need a get_cpu_var?
>


 prandom_seed_full_state() takes a 'struct rnd_state __percpu
*pcpu_state', and performs the initialization for all possible CPUs.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
