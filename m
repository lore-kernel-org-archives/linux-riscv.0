Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC3BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 21:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efpqgsNElyLTQ7fbXYH1WcN3fS56yA6C6Yogtrw28+k=; b=sWt6yh2v4I7Srd
	zZ6QQ6X3c6A7RRL4tcm1yEukj10We/p8E+6HfsJ+Goik4BvmzYTmRPwSyo8vnyUycgbFQbMRDnH+r
	A6v+m+Mk/IiMin2igPy668HjjPkOc9uiMTlrbnB5pv9I4R44H/x9xV6xZdQ2A85/QaudwU1uQUwQl
	BszqSmp5WVkEw2IvWmQ905aRC79XkmU5BcMVDJ3TOJNSeWIEzAOQ+/oudu2+5Zuf7Qm2+2w/gBY5E
	6Hniexu21b9ynKymRPn02mrU+5HyabVNiX/XHHVbZ0+TH9WS35+Aqh0wMPeo4181EJeXF2DQPcWRe
	dDWQhuMGtyUQe2XIqBwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Nn-005EWN-BR; Fri, 04 Nov 2022 21:37:47 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or4Nj-005EUr-QJ
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 21:37:45 +0000
Received: by mail-lf1-x130.google.com with SMTP id o12so9046823lfq.9
        for <linux-riscv@lists.infradead.org>; Fri, 04 Nov 2022 14:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvSWpxJgGl2A+yuTtFFpWgClmp36FYJZSW8HWdXrt58=;
        b=aQCjWQq9itbtlAHPWgZJ2akFWRpo1nfp/o0HYGdZRWAWjrKKYjkZwNf3TJCjGr3+iw
         lztqvPmWUnww+WpH5I2pgE0BPb/wfvX6IH/JB8uDHnxssHR6FaHs3tOLFH1vvSaJrw5p
         BoMxVLfhg97/92Q5ChBY1JuLkjl/CiCAyRCk1JGQe3EVaU/8s9qLkT/rUchQ4smvoVU5
         HxGF/7qT9whWKKeuTFs2OoSdWoz4WRuH0h09Sc7oTQjzH6aGy3ZKmtMmP8RGGWJMTopb
         SQg9fvVhBkClGARk14E73QP7efmSwL/9ipoDD4++q30bZ8yXB0mN4DU1u4bibRKik8fW
         G1cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvSWpxJgGl2A+yuTtFFpWgClmp36FYJZSW8HWdXrt58=;
        b=ewcz4xBgcp7EkUUZeqyT4P0dVH8TxVHYHy5hpHS/Lqp/XGI0l/shO+tdrG97CnraO7
         CM9wmORmTTCf9QXokbOy8YvVVDCWFedqUM0gAIYJiVw7tPGjqpsKxzy8tntPfi/xX5cz
         MQSQUvb2pw2SliUs0qXx+c8l6EQvS9p1NBh0WXdaAJerHuOG/4l9CmtUTkX5nQAxvjC5
         whhOYfk1QpTcrEM48jPasWfILnDpwXoTB5bgTAAKTxfvHYQdEh0KmHi//rE8YQ8YAXyC
         IlhrpH1E8BzilDsHDl4eegKD02BlGaWlfibTbcwzJMYdfDIFPIbH5GHE8EqrEAaBun9I
         TvtQ==
X-Gm-Message-State: ACrzQf25QtMDkktWo7ARHmtFcnhtAELALBsgUFlFEHa/T4QvkESxNjT9
	isBtuFVqq10dQTGtF2Bfmys=
X-Google-Smtp-Source: AMsMyM6pxHxMT0FlYTCZm1EKL1Elt3l5nMSi/KgrXNQr3YqAI2f3xC0M9rJRxWsv16xDhMMP16z9Eg==
X-Received: by 2002:a05:6512:e83:b0:4a2:cdaa:5e3e with SMTP id bi3-20020a0565120e8300b004a2cdaa5e3emr13578764lfb.308.1667597859685;
        Fri, 04 Nov 2022 14:37:39 -0700 (PDT)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id k19-20020a192d13000000b00492b0d23d24sm34468lfj.247.2022.11.04.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 14:37:38 -0700 (PDT)
Date: Sat, 5 Nov 2022 00:37:37 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [RFC PATCH v1] riscv: support for hardware
 breakpoints/watchpoints
Message-ID: <Y2WGIQ+m7jk5RPZv@curiosity>
References: <20221031213225.912258-1-geomatsi@gmail.com>
 <CALE4mHo2yFPpF68RvvDbKji6_peAX60_cXqnFMxydJTLjnLnUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALE4mHo2yFPpF68RvvDbKji6_peAX60_cXqnFMxydJTLjnLnUQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_143743_880727_64E98FEB 
X-CRM114-Status: GOOD (  36.21  )
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

Hi Andrew,

> > RISC-V Debug specification includes Sdtrig ISA extension. This extension
> > describes Trigger Module. Triggers can cause a breakpoint exception,
> > entry into Debug Mode, or a trace action without having to execute a
> > special instruction. For native debugging triggers can be used to
> > implement hardware breakpoints and watchpoints.

... [snip]

> > Despite missing userspace debug, initial implementation can be tested
> > on QEMU using kernel breakpoints, e.g. see samples/hw_breakpoint and
> > register_wide_hw_breakpoint. Hardware breakpoints work on upstream QEMU.
> 
> We should also be able to enable the use of HW breakpoints (and
> watchpoints, modulo the issue mentioned below) in kdb, right?

Interesting. So far I didn't think about using hw breakpoints in kgdb.
I took a quick look at riscv and arm64 kgdb code. It looks like there
is nothing wrong in adding arch-specific implementation of the function
'kgdb_arch_set_breakpoint' that will use hw breakpoints if possible.
Besides it looks like in this case it makes sense to handle KGDB earlier
than hw breakpoints in do_trap_break. 

> > However this is not the case for watchpoints since there is no way to
> > figure out which watchpoint is triggered. IIUC there are two possible
> > options for doing this: using 'hit' bit in tdata1 or reading faulting
> > virtual address from STVAL. QEMU implements neither of them. Current
> > implementation opts for STVAL. So the following experimental QEMU patch
> > is required to make watchpoints work:
> >
> > :  diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > :  index 278d163803..8858be7411 100644
> > :  --- a/target/riscv/cpu_helper.c
> > :  +++ b/target/riscv/cpu_helper.c
> > :  @@ -1639,6 +1639,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > :           case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> > :               tval = env->bins;
> > :               break;
> > :  +        case RISCV_EXCP_BREAKPOINT:
> > :  +            tval = env->badaddr;
> > :  +            env->badaddr = 0x0;
> > :  +            break;
> > :           default:
> > :               break;
> > :           }
> > :  diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> > :  index 26ea764407..b4d1d566ab 100644
> > :  --- a/target/riscv/debug.c
> > :  +++ b/target/riscv/debug.c
> > :  @@ -560,6 +560,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
> > :
> > :       if (cs->watchpoint_hit) {
> > :           if (cs->watchpoint_hit->flags & BP_CPU) {
> > :  +            env->badaddr = cs->watchpoint_hit->hitaddr;
> > :               cs->watchpoint_hit = NULL;
> > :               do_trigger_action(env, DBG_ACTION_BP);
> > :           }

... [snip]

> > +int arch_install_hw_breakpoint(struct perf_event *bp)
> > +{
> > +       struct arch_hw_breakpoint *info = counter_arch_bp(bp);
> > +       struct sbi_dbtr_data_msg *xmit;
> > +       struct sbi_dbtr_id_msg *recv;
> > +       struct perf_event **slot;
> > +       struct sbiret ret;
> > +       int err = 0;
> > +
> > +       xmit = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*xmit)), GFP_ATOMIC);
> > +       if (!xmit) {
> > +               err = -ENOMEM;
> > +               goto out;
> > +       }
> > +
> > +       recv = kzalloc(SBI_MSG_SZ_ALIGN(sizeof(*recv)), GFP_ATOMIC);
> > +       if (!recv) {
> > +               err = -ENOMEM;
> > +               goto out;
> > +       }
> 
> Do these really need to be dynamically allocated?

According to SBI extension proposal, base address of this memory chunk
must be 16-bytes aligned. To simplify things, buffer with 'power of two
bytes' size (and >= 16 bytes) is allocated. In this case alignment of
the kmalloc buffer is guaranteed to be at least this size. IIUC more
efforts are needed to guarantee such alignment for a buffer on stack.
 
> > +
> > +       xmit->tdata1 = info->trig_data1.value;
> > +       xmit->tdata2 = info->trig_data2;
> > +       xmit->tdata3 = info->trig_data3;
> > +
> > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_TRIGGER_INSTALL,
> > +                       1, __pa(xmit) >> 4, __pa(recv) >> 4,
> > +                       0, 0, 0);
> > +       if (ret.error) {
> > +               pr_warn("%s: failed to install trigger\n", __func__);
> > +               err = -EIO;
> > +               goto out;
> > +       }
> > +
> > +       if (recv->idx >= dbtr_total_num) {
> > +               pr_warn("%s: invalid trigger index %lu\n", __func__, recv->idx);
> > +               err = -EINVAL;
> > +               goto out;
> > +       }
> > +
> > +       slot = this_cpu_ptr(&bp_per_reg[recv->idx]);
> > +       if (*slot) {
> > +               pr_warn("%s: slot %lu is in use\n", __func__, recv->idx);
> > +               err = -EBUSY;
> > +               goto out;
> > +       }
> > +
> > +       *slot = bp;
> > +
> > +out:
> > +       kfree(xmit);
> > +       kfree(recv);
> > +
> > +       return err;
> > +}

... [snip]

> > +static int __init arch_hw_breakpoint_init(void)
> > +{
> > +       union riscv_dbtr_tdata1 tdata1;
> > +       struct sbiret ret;
> > +
> > +       if (sbi_probe_extension(SBI_EXT_DBTR) <= 0) {
> > +               pr_info("%s: SBI_EXT_DBTR is not supported\n", __func__);
> > +               return 0;
> > +       }
> > +
> > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > +                       0, 0, 0, 0, 0, 0);
> > +       if (ret.error) {
> > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > +               return 0;
> > +       }
> > +
> > +       pr_info("%s: total number of triggers: %lu\n", __func__, ret.value);
> > +
> > +       tdata1.value = 0;
> > +       tdata1.type = RISCV_DBTR_TRIG_MCONTROL6;
> > +
> > +       ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_NUM_TRIGGERS,
> > +                       tdata1.value, 0, 0, 0, 0, 0);
> > +       if (ret.error) {
> > +               pr_warn("%s: failed to detect triggers\n", __func__);
> > +               dbtr_total_num = 0;
> > +               return 0;
> > +       }
> 
> nit: This is basically identical to hw_breakpoint_slots() -- just call
> it here, or perhaps pull the DBTR_NUM_TRIGGERS ECALL into its own
> function to reduce the duplication, e.g. 'dbtr_num_triggers(unsigned
> long type)'?

Good point. More similar requests will be added, e.g. for MCONTROL and
possibly other trigger types. So I will add a separate
'dbtr_num_triggers' function.

> > +
> > +       pr_info("%s: total number of type %d triggers: %lu\n",
> > +               __func__, tdata1.type, ret.value);
> > +
> > +       dbtr_total_num = ret.value;
> > +
> > +       return 0;
> > +}

Thanks!
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
