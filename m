Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97891C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2TEhq6aqTW1Z1RHmrgARXAGXKc/usvxayMsMeNp7UE=; b=YQyaf9XdHO99J/
	fsb3BA57nwC0Z5k20YilbQaVIGSI1pqQyGAAN1VXtWUJ5kuPTbejkyJM7jsWNcxaVFo4yHuYpcA2A
	DNs6IHjiGE7dyCVb6kFBEmtQjFEuMNVWK3qHkn4lyBoyNZ8r+1H7zllnNubwWC04bvE5cw5ld/JC3
	7zLWpv82eMcfspejAr8De0EWHNilScyHq/kTmInHWxS1Otq4iq71j8fk5Ow9Y3kgEMsFI6qkOk+0b
	OlqminPflRbpMzQcyOQ2Vn/p7gmRts0hir/ujfRRa6IavTUAVvOTitc7gm2POXErlq4XdjOJtIIzv
	hdpHfxx+vKbUf5YWhbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZFg-004LzA-My; Tue, 21 Jun 2022 08:28:48 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZFd-004Lyr-E4
	for linux-riscv@lists.infradead.org; Tue, 21 Jun 2022 08:28:47 +0000
Received: by mail-pg1-x536.google.com with SMTP id z14so12492649pgh.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jun 2022 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lF4UMqVgmez/Cvz/MwfgpmVufoFq93DpK8zD1no54lg=;
        b=gxfnQODIxaI2P56t9c25ICX4fIUo7BBFL9nrdy6GW83t8T2g/EaEtD5J11eO2ptg2X
         VmypwBeMbTSSqZGhcHmCbDHFgSBCx6GNvQfkQD5nbSlte2V8rM7o7KZkBffMcmBiFshz
         BywNFUkfg7llImk1EPB0GoLfDNlL2X1fYiM4+Hzt1zGrISQqewopwgPAE23GLKn37bGq
         41TUi6nS/Dn/3FLV5KWsr/vMuaVllstb1ihFfvscbQxR0WhGz/Hfpmvt8JJ8zg53rdpo
         I5JY7rjrHCcM2DVrG4hZ6xCg5oboxECVGxgf71ptwwUbbZlDyyu4rqdXte7wMUaQLqmo
         eKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lF4UMqVgmez/Cvz/MwfgpmVufoFq93DpK8zD1no54lg=;
        b=8Mg+4rd4w0rJyubQ+QEOgqmQiiq6IAXt0bxER8XIEj5RIc75IyHZP4RjneudB0dw4U
         U2C0fEu5K9h0XnS2MRTTDnlozWTeMsMwEAqdL/XiOUMqQm8nEbjWTRzXjRtjRwUTscpx
         EKF82OoQPoO8/RHuLIkHL7OYSIFARZ7qXcCbSwA2W4DgCg44a0cq600urjFx9khuFSQ8
         G5MfwkzsxvLIXiBFm8Bo/CR/9IxDsaup+GuzXIepbRpuEbwSY+iA/X/zeiLiC6q8TQR3
         etTsnzncF4yiX1sIxXTRebf9up0AcS7zFfnhApVQaFv3jcnGQznhPYP0FfFPphnlSUAe
         Zt9A==
X-Gm-Message-State: AJIora9P4ccM1z78tUDFsiU09VgCA7YqeOei5c3UoEpDrUOMJWcAvwcp
	RLqaWdxr+tD1VyNwJT8Mk2T08JW/T4EEEWjQA5w84sFJMew=
X-Google-Smtp-Source: AGRyM1vnN6fyBNcugiRcjRYdmEJH4JLiLob6cJIXou7Xau1bnleg3Ucp1bjkL1HMKEQmFNvzXdAs4WUqpCGLZlAyF6U=
X-Received: by 2002:a05:6a00:1a8f:b0:51c:2f82:cdba with SMTP id
 e15-20020a056a001a8f00b0051c2f82cdbamr29297095pfv.85.1655800121911; Tue, 21
 Jun 2022 01:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220620115549.1529597-1-apatel@ventanamicro.com> <20220621104030.349c570b@redslave.neermore.group>
In-Reply-To: <20220621104030.349c570b@redslave.neermore.group>
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
Date: Tue, 21 Jun 2022 11:28:05 +0300
Message-ID: <CAEn-LTqaK3pvjkTeNztDF8keJmr=GtMnCOFwZ=v4mHZd7fdMpw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, 
	Atish Patra <atishp@atishpatra.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_012845_537447_E69E0EEC 
X-CRM114-Status: GOOD (  27.45  )
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

On Tue, Jun 21, 2022 at 10:53 AM Nikita Shubin
<nikita.shubin@maquefel.me> wrote:
>
> Hello Anup!
>
> On Mon, 20 Jun 2022 17:25:49 +0530
> Anup Patel <apatel@ventanamicro.com> wrote:
>
> > Identifying the underlying RISC-V implementation can be important
> > for some of the user space applications. For example, the perf tool
> > uses arch specific CPU implementation id (i.e. CPUID) to select a
> > JSON file describing custom perf events on a CPU.
> >
> > Currently, there is no way to identify RISC-V implementation so we
> > add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
>
> Tested on Sifive Unmatched:
>
> localhost / # cat /proc/cpuinfo
> processor       : 0
> hart            : 4
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,bullet0
> mvendorid       : 0x489
> marchid         : 0x8000000000000007
> mimpid          : 0x20181004
>
> processor       : 1
> hart            : 1
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,bullet0
> mvendorid       : 0x489
> marchid         : 0x8000000000000007
> mimpid          : 0x20181004
>
> processor       : 2
> hart            : 2
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,bullet0
> mvendorid       : 0x489
> marchid         : 0x8000000000000007
> mimpid          : 0x20181004
>
> processor       : 3
> hart            : 3
> isa             : rv64imafdc
> mmu             : sv39
> uarch           : sifive,bullet0
> mvendorid       : 0x489
> marchid         : 0x8000000000000007
> mimpid          : 0x20181004
>
> mvendorid, marchid values match the register description in u74 manual.
>
> mimpid seems to be ok, through i can't find exact in U74/Unmatched docs.

SiFive main website -> Products -> Documentation -> U74-MC Core
Complex Manual -> Page 274: B.2 Machine Implementation ID Register
(mimpid).

This mimpid value is not in the table thus it's most likely not part
of a particular U74 generator release. Looking at this value we could
assume that U74 cores within FU740 predates the general availability.

Cheers,
david

>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>
>
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/kernel/cpu.c | 51
> > +++++++++++++++++++++++++++++++++++++++++ 1 file changed, 51
> > insertions(+)
> >
> > diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> > index fba9e9f46a8c..c037b8691bbb 100644
> > --- a/arch/riscv/kernel/cpu.c
> > +++ b/arch/riscv/kernel/cpu.c
> > @@ -3,10 +3,13 @@
> >   * Copyright (C) 2012 Regents of the University of California
> >   */
> >
> > +#include <linux/cpu.h>
> >  #include <linux/init.h>
> >  #include <linux/seq_file.h>
> >  #include <linux/of.h>
> > +#include <asm/csr.h>
> >  #include <asm/hwcap.h>
> > +#include <asm/sbi.h>
> >  #include <asm/smp.h>
> >  #include <asm/pgtable.h>
> >
> > @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node
> > *node) }
> >
> >  #ifdef CONFIG_PROC_FS
> > +
> > +struct riscv_cpuinfo {
> > +     unsigned long mvendorid;
> > +     unsigned long marchid;
> > +     unsigned long mimpid;
> > +};
> > +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> > +
> > +static int riscv_cpuinfo_starting(unsigned int cpu)
> > +{
> > +     struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> > +
> > +#if defined(CONFIG_RISCV_SBI)
> > +     ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> > +     ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> > +     ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> > +#elif defined(CONFIG_RISCV_M_MODE)
> > +     ci->mvendorid = csr_read(CSR_MVENDORID);
> > +     ci->marchid = csr_read(CSR_MARCHID);
> > +     ci->mimpid = csr_read(CSR_MIMPID);
> > +#else
> > +     ci->mvendorid = 0;
> > +     ci->marchid = 0;
> > +     ci->mimpid = 0;
> > +#endif
> > +
> > +     return 0;
> > +}
> > +
> > +static int __init riscv_cpuinfo_init(void)
> > +{
> > +     int ret;
> > +
> > +     ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> > "riscv/cpuinfo:starting",
> > +                             riscv_cpuinfo_starting, NULL);
> > +     if (ret < 0) {
> > +             pr_err("cpuinfo: failed to register hotplug
> > callbacks.\n");
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +device_initcall(riscv_cpuinfo_init);
> > +
> >  #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
> >       {                                                       \
> >               .uprop = #UPROP,                                \
> > @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
> >  {
> >       unsigned long cpu_id = (unsigned long)v - 1;
> >       struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> > +     struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo,
> > cpu_id); const char *compat, *isa;
> >
> >       seq_printf(m, "processor\t: %lu\n", cpu_id);
> > @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
> >       if (!of_property_read_string(node, "compatible", &compat)
> >           && strcmp(compat, "riscv"))
> >               seq_printf(m, "uarch\t\t: %s\n", compat);
> > +     seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> > +     seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> > +     seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
> >       seq_puts(m, "\n");
> >       of_node_put(node);
> >
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
