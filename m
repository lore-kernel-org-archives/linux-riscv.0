Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AE7C05027
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Feb 2023 01:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vESOVcpVfQhIkcxOBmDdhrIHpmx7yRQVinJXcv1Mnyg=; b=iePbGXCCtWrR8A
	5+Mx2eTf+WMZQ6qg85Ib54d9KG6bhv5zqWhf4SVbvw4RYSgYp4Ku4bRMViMl0ynHZBAuTiGfGOw1Q
	fI6SLDfXt8roNWwhSyfzdd/H1c0lmrKPuKcThheWxxLAtkVr1GlZ8q8qZTJQCT37eZOdFYhAtpSnJ
	2LJl1juwGdS31ksHgqwQl7TErVVgMnNzP2i0N8VBbQkqmzuay5gPxgHaTZ8VrQhRngn1luFu/nZTA
	LmUU+3eZsws1jEiv4cISwv5oWTL6zDTNVscUgHJMNhLlWGZAbyfVgPSnuxFhQESL3qYkG7L6fqNca
	QOg/s6ZZDWhc+6MOqBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO7DB-004BTh-1T; Sat, 04 Feb 2023 01:19:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO7D3-004BSl-Cg
	for linux-riscv@lists.infradead.org; Sat, 04 Feb 2023 01:19:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B9795B82C52
	for <linux-riscv@lists.infradead.org>; Sat,  4 Feb 2023 01:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68858C4339B
	for <linux-riscv@lists.infradead.org>; Sat,  4 Feb 2023 01:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675473554;
	bh=aimDTfZ9jhALpWMGCB3SDe6SKvH7g0Fiij2TZD51ciw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f8Yknfd6ODJUK6wWG9nfvXBsbBRmGvB68TJuyHjq8ogGQuUSOCi6by/C+61xR0PCo
	 uP6ci2qKxcZleDdootCxSAQLURHIjcW6ioIE2is7IhK7CWx9vE09szKydSm+QdyHCM
	 epGNSx0sX6NJUFu5AL4ZNg/PRmFWi3QhhKpMw19PoO0ZlBo9Shl9sdfZQ3Q8mLOB5A
	 lmSu3FxlUgm+js5g8BRcdJckAFID1I/tFckxNWB8jrnskGXJgQ+sg+X/vjny20Bh1P
	 U/70xumQdYFxI+5z/DAJ0fG602t+pjJwc1Gk2876CGBrDb9EiyYNBYe/O96kla2R/v
	 eRTcJgj/fh0mg==
Received: by mail-ej1-f42.google.com with SMTP id m2so19987975ejb.8
        for <linux-riscv@lists.infradead.org>; Fri, 03 Feb 2023 17:19:14 -0800 (PST)
X-Gm-Message-State: AO0yUKUJPVEEvNG1BOQw8DNM/QfpXPugQNkmuZtX01PUrsOlvl8FuhmC
	Q6a10h2MgRS+7+sGXVb3t6Lnqez/eUQ7ADwuPPA=
X-Google-Smtp-Source: AK7set8qbN0cH0qYPTuS4AcKBRoZsBRE2EE76+rE4byQYKQZJsOg1ERN66I8mc3K4drcO2j2nYafjnuMhLzbmeDWyeA=
X-Received: by 2002:a17:906:8419:b0:884:c19c:7c6 with SMTP id
 n25-20020a170906841900b00884c19c07c6mr3303954ejx.120.1675473552654; Fri, 03
 Feb 2023 17:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20230112090603.1295340-1-guoren@kernel.org> <20230112090603.1295340-2-guoren@kernel.org>
 <Y7/6AtX5X0+5qF6Y@FVFF77S0Q05N> <CAJF2gTTqW5A8qS5CQEr=kakxKw5FaFRDswet6CnBGUDasNJnbQ@mail.gmail.com>
 <Y9eh8DpjrmcLIQb5@FVFF77S0Q05N>
In-Reply-To: <Y9eh8DpjrmcLIQb5@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 4 Feb 2023 09:19:01 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRLjoRjnB=CTapcQjJ3GW+XsQXx0cvJJVBwjuu=AqGzJg@mail.gmail.com>
Message-ID: <CAJF2gTRLjoRjnB=CTapcQjJ3GW+XsQXx0cvJJVBwjuu=AqGzJg@mail.gmail.com>
Subject: Re: [PATCH -next V7 1/7] riscv: ftrace: Fixup panic by disabling preemption
To: palmer@dabbelt.com, Mark Rutland <mark.rutland@arm.com>
Cc: anup@brainfault.org, paul.walmsley@sifive.com, conor.dooley@microchip.com, 
	heiko@sntech.de, rostedt@goodmis.org, mhiramat@kernel.org, jolsa@redhat.com, 
	bp@suse.de, jpoimboe@kernel.org, suagrfillet@gmail.com, andy.chiu@sifive.com, 
	e.shatokhin@yadro.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_171917_743869_5EEC304A 
X-CRM114-Status: GOOD (  38.12  )
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

On Mon, Jan 30, 2023 at 6:54 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Jan 28, 2023 at 05:37:46PM +0800, Guo Ren wrote:
> > On Thu, Jan 12, 2023 at 8:16 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > Hi Guo,
> > >
> > > On Thu, Jan 12, 2023 at 04:05:57AM -0500, guoren@kernel.org wrote:
> > > > From: Andy Chiu <andy.chiu@sifive.com>
> > > >
> > > > In RISCV, we must use an AUIPC + JALR pair to encode an immediate,
> > > > forming a jump that jumps to an address over 4K. This may cause errors
> > > > if we want to enable kernel preemption and remove dependency from
> > > > patching code with stop_machine(). For example, if a task was switched
> > > > out on auipc. And, if we changed the ftrace function before it was
> > > > switched back, then it would jump to an address that has updated 11:0
> > > > bits mixing with previous XLEN:12 part.
> > > >
> > > > p: patched area performed by dynamic ftrace
> > > > ftrace_prologue:
> > > > p|      REG_S   ra, -SZREG(sp)
> > > > p|      auipc   ra, 0x? ------------> preempted
> > > >                                       ...
> > > >                               change ftrace function
> > > >                                       ...
> > > > p|      jalr    -?(ra) <------------- switched back
> > > > p|      REG_L   ra, -SZREG(sp)
> > > > func:
> > > >       xxx
> > > >       ret
> > >
> > > As mentioned on the last posting, I don't think this is sufficient to fix the
> > > issue. I've replied with more detail there:
> > >
> > >   https://lore.kernel.org/lkml/Y7%2F3hoFjS49yy52W@FVFF77S0Q05N/
> > >
> > > Even in a non-preemptible SMP kernel, if one CPU can be in the middle of
> > > executing the ftrace_prologue while another CPU is patching the
> > > ftrace_prologue, you have the exact same issue.
> > >
> > > For example, if CPU X is in the prologue fetches the old AUIPC and the new
> > > JALR (because it races with CPU Y modifying those), CPU X will branch to the
> > > wrong address. The race window is much smaller in the absence of preemption,
> > > but it's still there (and will be exacerbated in virtual machines since the
> > > hypervisor can preempt a vCPU at any time).
> > >
> > > Note that the above is even assuming that instruction fetches are atomic, which
> > > I'm not sure is the case; for example arm64 has special CMODX / "Concurrent
> > > MODification and eXecutuion of instructions" rules which mean only certain
> > > instructions can be patched atomically.
> > >
> > > Either I'm missing something that provides mutual exclusion between the
> > > patching and execution of the ftrace_prologue, or this patch is not sufficient.
> > This patch is sufficient because riscv isn't the same as arm64. It
> > uses default arch_ftrace_update_code, which uses stop_machine.
> > See kernel/trace/ftrace.c:
> > void __weak arch_ftrace_update_code(int command)
> > {
> >         ftrace_run_stop_machine(command);
> > }
>
> Ah; sorry, I had misunderstood here, since the commit message spoke in terms of
> removing that.
>
> As long as stop_machine() is used I agree this is safe; sorry for the noise.
Okay.

Hi Palmer,

Please take Andy's fixup patch. We would continue to find a way for PREEMPTION.

>
> > ps:
> >  Yes, it's not good, and it's expensive.
>
> We can't have everything! :)
>
> Thanks,
> Mark.



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
