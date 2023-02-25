Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC31C64EC7
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Feb 2023 13:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NoQVlCpGt/bLjtbehDnJ4RGIai0yZJCEhqNJkvjQg4E=; b=K7vBVABPiVWsar
	KWwxmky1imJVTKuiI4eZgftnVN113kxh+Vn9QpXRMQ/u6XLcFVhgfbTxanoLWX+HBQVTjVECG2K/s
	Isbs8krvdug4/yoz5CxtaFISoACoySuLxW+wNlJZy8PYH7LAT3KxLpx9XFSOj6YUL43cIa4hed/Hc
	Qf9pdfAbBVfvNh7aBkFY59UVamL213vhsPEjVCXFXDMrqj6gpexaQ1KyLBjLyb4s7JJG+MYsMZBNt
	wpMYygyuS3b2xEXyySeqPTfmnauqrkyxkkpfW9HBzowKa+vKmdDSCvpzBXCVEEzwy4zbbhIMFW8JD
	RgvqQEONuJRrJHWarYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVurc-005neH-Om; Sat, 25 Feb 2023 13:45:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVurX-005ndP-Da
	for linux-riscv@lists.infradead.org; Sat, 25 Feb 2023 13:45:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D56D56091A;
	Sat, 25 Feb 2023 13:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F57AC433D2;
	Sat, 25 Feb 2023 13:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677332718;
	bh=F2cgXChhAT6a3/ucDBm6jFPRNC5cOBD0l4h87gAGcY0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=U/PPPoiO/edmC9QyAmS2aHCPWcBwWivmhkY6HLOM3ithOr5rTP5rnjkISXZFp73F0
	 8TQh0pj2tJAL3xRmLne1Nns30zXMD8JX6hAfJiZL1JgsObIjSMkEEL5KhFhKEJDhFE
	 7Y2TCYJoXmeKKlTxKVexITqIj16cwu9ns2iSfvNQ7Au+hjXPEw8/OQwZoYHgDCESxY
	 4myIRlibbc7S+KvmOCOKBcprKMy4wySydYQ2Vr4p6VluW0AgAiVMg+XuKiX1zJuLme
	 npYtWjz0NY3o3RXj/sTi9ZH739GPzGtECsKLWpa7ZMZGczl6qfRQe0EPVpHEkNLije
	 RnG2gtQa3atgA==
Date: Sat, 25 Feb 2023 13:45:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Changbin Du <changbin.du@huawei.com>,
 Conor Dooley <conor.dooley@microchip.com>
CC: palmer@dabbelt.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-riscv@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Hui Wang <hw.huiwang@huawei.com>
Subject: Re: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
User-Agent: K-9 Mail for Android
In-Reply-To: <20230225015014.2tejwipjqjnagsmb@M910t>
References: <20230215164317.727657-1-conor@kernel.org> <20230216113126.kio4uqovoo4p6ubm@M910t> <Y/iafgRdYtWCmQZ2@wendy> <20230224125857.dbsaj7mv2by66wm3@M910t> <Y/i/vkcX5AEQ6qAm@wendy> <20230225015014.2tejwipjqjnagsmb@M910t>
Message-ID: <D36BB0A5-C257-4F85-A9C7-783BA4EA41BF@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_054519_763799_3D61F417 
X-CRM114-Status: GOOD (  22.56  )
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



On 25 February 2023 01:50:14 GMT, Changbin Du <changbin.du@huawei.com> wrote:
>On Fri, Feb 24, 2023 at 01:46:38PM +0000, Conor Dooley wrote:
>> On Fri, Feb 24, 2023 at 08:58:57PM +0800, Changbin Du wrote:
>> > On Fri, Feb 24, 2023 at 11:07:42AM +0000, Conor Dooley wrote:
>> > > > > -	lockdep_assert_held(&text_mutex);
>> > > > > +	if (!riscv_ftrace_in_stop_machine)
>> > > > > +		lockdep_assert_held(&text_mutex);
>> > > > >  
>> > > > >  	if (across_pages)
>> > > > >  		patch_map(addr + len, FIX_TEXT_POKE1);
>> > > > This misses this function.
>> > > > 
>> > > > int patch_text(void *addr, u32 insn)
>> > > 
>> > > So, with a corresponding rename to the symbol, does the following look
>> > > okay to you?
>> > > 
>> > > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
>> > > index f21592d20306..433b454e693f 100644
>> > > --- a/arch/riscv/kernel/probes/kprobes.c
>> > > +++ b/arch/riscv/kernel/probes/kprobes.c
>> > > @@ -27,9 +27,15 @@ static void __kprobes arch_prepare_ss_slot(struct kprobe *p)
>> > >  
>> > >  	p->ainsn.api.restore = (unsigned long)p->addr + offset;
>> > >  
>> > > +	/*
>> > > +	 * kprobes takes text_mutex, but patch_text() calls stop_machine and
>> > > +	 * lockdep gets confused by the context in which the lock is taken.
>> > > +	 */
>> > > +	riscv_patch_in_stop_machine = true;
>> > >  	patch_text(p->ainsn.api.insn, p->opcode);
>> > >  	patch_text((void *)((unsigned long)(p->ainsn.api.insn) + offset),
>> > >  		   __BUG_INSN_32);
>> > > +	riscv_patch_in_stop_machine = false;
>> > >  }
>> > hmm, why not just put 'riscv_patch_in_stop_machine' into patch_text()? Then you
>> > just need to modify that function.
>> 
>> Right, I intentionally didn't do that as `riscv_patch_in_stop_machine`
>> skips the lockdep check, which we only want to do for codepaths we know
>> the lock will be held for.
>> I didn't want to put it in patch_text() so if users of patch_text() that
>> do not take the lock are added, they will be caught.
>> 
>Understood your concern. Then how abount below instead of discrete changes?

Seems fair enough to me, I'll respin Monday - had some hardware fail so out of action right now.

Thanks,
Conor.

>
>int patch_text(void *addr, u32 insn)
> {
>+       int ret;
>        struct patch_insn patch = {
>                .addr = addr,
>                .insn = insn,
>                .cpu_count = ATOMIC_INIT(0),
>        };
>
>-       return stop_machine_cpuslocked(patch_text_cb,
>+       lockdep_assert_held(&text_mutex);
>+       riscv_patch_in_stop_machine = true
>+       ret = stop_machine_cpuslocked(patch_text_cb,
>                                       &patch, cpu_online_mask);
>+       riscv_patch_in_stop_machine = false;
>+       return ret;
> }
>
>> I'm probably just erring on the paranoid/conservative side of things!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
