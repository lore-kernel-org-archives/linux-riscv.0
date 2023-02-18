Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AD4C636D6
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 00:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BslfS2VWN+UTbFALfChItmiyQQN1Pj/qE0lvzDHOtvE=; b=pVTtWHhwH3Sg9L
	x6OZpSnB3osoI0SV22gRbXvsKH21pv7ZgCE9fVC8/RY8eqIsGJeG7Fz8SikZyuKzWv86eLyudLucB
	ZffinbvzsW3ZAGl7B8kO1iCpIl7lkA/FiKWMNGEX5uTEwMPSV2CXP8FKtgwTp4jBpR6MVr9Sox+nl
	Zv6r9LFeapP4J0hnGQe56Bl0H5bRacqSc1PUXXkJbdzhEqOY7Q2wVng1MTtIQEbzhFkieGlh4igX3
	M4ko4083lRohl28WcmbdT4oy1o57mMMeTaeDNtayEKJsXRXfPDKyK1LDZkOtUu8zUuv5civj17Htu
	HWzgNOMUq9XSF2IGjrNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTAts-00G2GC-Oh; Sat, 18 Feb 2023 00:16:24 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTAtn-00G2Ew-Vt
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 00:16:21 +0000
Received: by mail-lj1-x22c.google.com with SMTP id r28so2743824ljk.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Feb 2023 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UgiLBWRR4q3c/Vqxkdr34/6qKJIWPn3ovu3vsEAFwgI=;
        b=spsnR+F8ht7zIYsSLPJopwZqzc4RBkhzXq/YvtGakMzkvwBI6CVCG6HZp8fpUa0fIV
         KSvCDoCunWQoXv4huLPwjHmjv+8j+4Za5SUpFKhlT2yOsnNYBbM7nVJKYWnW8MgWgKZV
         hjBtACgoUEkW1M8otLuijxlLKd/te8MTXFsKuWSWAb+WiXj/3AHuPD/d5kWgsZJvvkC8
         79llnEKU/4WfPoWSPMLopJDOnJXtr9Swax6OJEsQf3ftMyzYF6jhlnlAbIny358tig1d
         7XhVtw5bpsFb8Zz4Iz4yyDFz1hZCJISQjoY4jCGRaUcCIbQVDMHscKZIYIinXU78mEbK
         GmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UgiLBWRR4q3c/Vqxkdr34/6qKJIWPn3ovu3vsEAFwgI=;
        b=xEYNSZ86y4PBqvurEUZxc0Jxo/RSqppDo15j1RHKHPO5nn41kUkvhsbaion4qPBvdd
         xtimf1cphAVPqaJDzU7XWLaL1/b9+slMkOs0dD9g2V67M0NH5B+IHBmaMtmXhNbtck3O
         72qtUoWAM0M6yWcsYXv7hPQXbcfWJLzIEexotherpl9IogVfRPx7dfdQNU3pA4lU0mL4
         FD/ic0BvMcQU1CNgtzv8t0HYc08ESDB4SGYQwZ6FWbqj0w+H8VDv6Ol5xolZCio+lmTd
         s/h4tNAGqM7mh9tkfSwmciDooyqePNFPWBC89aa6EefhR3A3/7CQyxbhWOzQXZCln4F5
         mIsw==
X-Gm-Message-State: AO0yUKUirVE5D+a4Ou/KAoaaOjY6qLTAqUWNu71NjZfeJSYe/gG/Vzua
	g2hZVrK6AYOcDJJPu3vfC5Wz9gzJfbb8i91/1T5/8g==
X-Google-Smtp-Source: AK7set9u+Dnr3cyx6/5FKy/AyoYlJWNwaQt2hc013b1XXlBuGKz5LO1/SdxAtDvcKpDMxiNBRWeEV/6pwGMvkM5iijc=
X-Received: by 2002:a2e:b5dc:0:b0:293:531b:90ce with SMTP id
 g28-20020a2eb5dc000000b00293531b90cemr901827ljn.4.1676679370770; Fri, 17 Feb
 2023 16:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-6-evan@rivosinc.com>
 <Y+1VOXyKDDHEuejJ@spud>
In-Reply-To: <Y+1VOXyKDDHEuejJ@spud>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 17 Feb 2023 16:15:34 -0800
Message-ID: <CALs-HsvZaKC5R-rAvkjBDNQGTUJ_LWn-O=KzpFwGtpac32_Xxw@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] RISC-V: hwprobe: Support probing of misaligned
 access performance
To: Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_161620_054151_4FF83869 
X-CRM114-Status: GOOD (  33.65  )
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
Cc: heiko@sntech.de, Jisheng Zhang <jszhang@kernel.org>, linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, Celeste Liu <coelacanthus@outlook.com>, slewis@rivosinc.com, linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, Xianting Tian <xianting.tian@linux.alibaba.com>, Tsukasa OI <research_trasio@irq.a4lg.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, vineetg@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 15, 2023 at 1:57 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Feb 06, 2023 at 12:14:54PM -0800, Evan Green wrote:
> > This allows userspace to select various routines to use based on the
> > performance of misaligned access on the target hardware.
> >
> > Co-developed-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> >
> > ---
> >
> > Changes in v2:
> >  - Fixed logic error in if(of_property_read_string...) that caused crash
> >  - Include cpufeature.h in cpufeature.h to avoid undeclared variable
> >    warning.
> >  - Added a _MASK define
> >  - Fix random checkpatch complaints
> >
> >  Documentation/riscv/hwprobe.rst       | 13 +++++++++++
> >  arch/riscv/include/asm/cpufeature.h   |  2 ++
> >  arch/riscv/include/asm/hwprobe.h      |  2 +-
> >  arch/riscv/include/asm/smp.h          |  9 ++++++++
> >  arch/riscv/include/uapi/asm/hwprobe.h |  6 ++++++
> >  arch/riscv/kernel/cpufeature.c        | 31 +++++++++++++++++++++++++--
> >  arch/riscv/kernel/sys_riscv.c         | 23 ++++++++++++++++++++
> >  7 files changed, 83 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
> > index ce186967861f..0dc75e83e127 100644
> > --- a/Documentation/riscv/hwprobe.rst
> > +++ b/Documentation/riscv/hwprobe.rst
> > @@ -51,3 +51,16 @@ The following keys are defined:
> >        not minNum/maxNum") of the RISC-V ISA manual.
> >      * :RISCV_HWPROBE_IMA_C:: The C extension is supported, as defined by
> >        version 2.2 of the RISC-V ISA manual.
> > +* :RISCV_HWPROBE_KEY_PERF_0:: A bitmask that contains performance information
>
> This doesn't match what's defined?
>
> > +  about the selected set of processors.
> > +    * :RISCV_HWPROBE_MISALIGNED_UNKNOWN:: The performance of misaligned
> > +      accesses is unknown.
> > +    * :RISCV_HWPROBE_MISALIGNED_EMULATED:: Misaligned accesses are emulated via
> > +      software, either in or below the kernel.  These accesses are always
> > +      extremely slow.
> > +    * :RISCV_HWPROBE_MISALIGNED_SLOW:: Misaligned accesses are supported in
> > +      hardware, but are slower than the cooresponding aligned accesses
> > +      sequences.
> > +    * :RISCV_HWPROBE_MISALIGNED_FAST:: Misaligned accesses are supported in
> > +      hardware and are faster than the cooresponding aligned accesses
> > +      sequences.
>
> > diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> > index 3831b638ecab..6c1759091e44 100644
> > --- a/arch/riscv/include/asm/smp.h
> > +++ b/arch/riscv/include/asm/smp.h
> > @@ -26,6 +26,15 @@ struct riscv_ipi_ops {
> >   */
> >  extern unsigned long __cpuid_to_hartid_map[NR_CPUS];
> >  #define cpuid_to_hartid_map(cpu)    __cpuid_to_hartid_map[cpu]
> > +static inline long hartid_to_cpuid_map(unsigned long hartid)
> > +{
> > +     long i;
> > +
> > +     for (i = 0; i < NR_CPUS; ++i)
>
> I'm never (or not yet?) sure about these things.
> Should this be for_each_possible_cpu()?

Me neither. I believe it's the same, as for_each_possible_cpu()
iterates over a CPU mask of all 1s, and the size of struct cpumask is
set by NR_CPUS. Some architectures appear to have an
init_cpu_possible() function to further restrict the set, though riscv
does not. It's probably better to use for_each_possible_cpu() though
in case a call to init_cpu_possible() ever does get added.

>
> > +             if (cpuid_to_hartid_map(i) == hartid)
> > +                     return i;
> > +     return -1;
> > +}
> >
> >  /* print IPI stats */
> >  void show_ipi_stats(struct seq_file *p, int prec);
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
> > index ce39d6e74103..5d55e2da2b1f 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -25,5 +25,11 @@ struct riscv_hwprobe {
> >  #define RISCV_HWPROBE_KEY_IMA_EXT_0  4
> >  #define              RISCV_HWPROBE_IMA_FD            (1 << 0)
> >  #define              RISCV_HWPROBE_IMA_C             (1 << 1)
> > +#define RISCV_HWPROBE_KEY_CPUPERF_0  5
> > +#define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> > +#define              RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > +#define              RISCV_HWPROBE_MISALIGNED_SLOW           (2 << 0)
> > +#define              RISCV_HWPROBE_MISALIGNED_FAST           (3 << 0)
> > +#define              RISCV_HWPROBE_MISALIGNED_MASK           (3 << 0)
>
> Why is it UNKNOWN rather than UNSUPPORTED?
> I thought I saw Palmer saying that there is no requirement to support
> misaligned accesses any more.
> Plenty of old DTs are going to lack this property so would be UNKNOWN,
> and I *assume* that the user of the syscall is gonna conflate the two,
> but the rationale interests me.

Palmer had mentioned on the DT bindings patch that historically it was
required but emulated. So because old binaries assumed it was there,
the default values for DTs without this needs to imply "supported, but
no idea how fast it is".

But you bring up an interesting point: should the bindings and these
defines have a value that indicates no support at all for unaligned
accesses? We could always add the value to the bindings later, but
maybe we should leave space in this field now.

-Evan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
