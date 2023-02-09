Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB35C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 01:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzK3ItBztI7boqtIneYLMJMk6AIiCYNa72I76mHB5uk=; b=DSr48iZkYb5GIG
	uj8P2YWA01mp7cBd/I4lUHzYjsCrJ37zLB7dP3YFQInHxAHIO80sBiCFfxfbne2IgzdQqA68nycNp
	ir0mfd/lq22DOHCcCKbI5J7nSHozeEdHRP5aJcZFPNae8ZYi+zY589XJqr/dNIwFsz9FkVw+u4JBi
	KpaFIqiemMcBsBDCEOqv9RBIVX5vLYdpkRJj9Ez9iJNZIVve5sOuZOqDXayCjew24F6D3SolSn62X
	daIO2TOAzfE5IrJU6IvIgchD93aDcjFYFtkO2LufhAFng4DzS9ZBZcZIIu5tkvBPt+2YhXvB7A9eM
	EEA8MWWveRQivbud8AfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPw5p-00HRft-Uf; Thu, 09 Feb 2023 01:51:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPw5m-00HRfB-Ff
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 01:51:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B3B856185D
	for <linux-riscv@lists.infradead.org>; Thu,  9 Feb 2023 01:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F52C4339C
	for <linux-riscv@lists.infradead.org>; Thu,  9 Feb 2023 01:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675907477;
	bh=zWh3jbcFZ6YYeJH/Xx22BdWiPTRYqPVeIRl/gbd2oxo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uJFrrT+PKf3aZycTPL4DzTb64iwfIfbZULvr9zf0pUBAUTEJopWxpNb5AX5yHuMno
	 r4CqiBksjvQ+/sH39TqmYKDrVm+rY8dQyX0/HCMptAgnP7mbzj+3Fy7abEk8EqT/lv
	 3rkvC12MK0WbUCSH103EV+H4SyST2XhNC1p4KCFG8Jnh7O/p8o1eMUr0vctxQXx4gQ
	 4pHrt3hP+MGnJESaAJJ67g6Sl+ll+eptALGoDjs4JHwf3K39PM1XcLr66imDcDB+Bs
	 OvIza6HNkjUSKm7h/fouKNeN0sAXhSpmsdAyIMPX5j9Jk4ra2j+4HFA3/BgDV+Kn33
	 5JTsV3gcAA9xw==
Received: by mail-ej1-f43.google.com with SMTP id jg8so2249029ejc.6
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 17:51:17 -0800 (PST)
X-Gm-Message-State: AO0yUKU5vqFKur8vXtKttjrHUHMYT012JUxZpEBoY90p1ZY7HWhsheBT
	fNHPflbIsVM0YbEgsURgI8bgiUq440eiP6ecJd0=
X-Google-Smtp-Source: AK7set8+NNuAhcVjSKN/FMgyphJA7UJzlbejmmh51UXI9zcAySGvoq/f8oXYg/yvO3p3fCROMTUw+uTEqUKZZMEqVAQ=
X-Received: by 2002:a17:906:3e04:b0:884:c19c:7c6 with SMTP id
 k4-20020a1709063e0400b00884c19c07c6mr1997566eji.120.1675907475394; Wed, 08
 Feb 2023 17:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20230112090603.1295340-1-guoren@kernel.org> <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N> <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N> <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com>
In-Reply-To: <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 9 Feb 2023 09:51:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
Message-ID: <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
To: David Laight <David.Laight@aculab.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Evgenii Shatokhin <e.shatokhin@yadro.com>, 
	"suagrfillet@gmail.com" <suagrfillet@gmail.com>, "andy.chiu@sifive.com" <andy.chiu@sifive.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
	"anup@brainfault.org" <anup@brainfault.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"jolsa@redhat.com" <jolsa@redhat.com>, "bp@suse.de" <bp@suse.de>, 
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "linux@yadro.com" <linux@yadro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_175118_634320_0CFC0827 
X-CRM114-Status: GOOD (  22.14  )
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

On Thu, Feb 9, 2023 at 6:29 AM David Laight <David.Laight@aculab.com> wrote:
>
> > >   # Note: aligned to 8 bytes
> > >   addr-08               // Literal (first 32-bits)      // patched to ops ptr
> > >   addr-04               // Literal (last 32-bits)       // patched to ops ptr
> > >   addr+00       func:   mv      t0, ra
> > We needn't "mv t0, ra" here because our "jalr" could work with t0 and
> > won't affect ra. Let's do it in the trampoline code, and then we can
> > save another word here.
> > >   addr+04               auipc   t1, ftrace_caller
> > >   addr+08               jalr    ftrace_caller(t1)
>
> Is that some kind of 'load high' and 'add offset' pair?
Yes.

> I guess 64bit kernels guarantee to put all module code
> within +-2G of the main kernel?
Yes, 32-bit is enough. So we only need one 32-bit literal size for the
current rv64, just like CONFIG_32BIT.

>
> > Here is the call-site:
> >    # Note: aligned to 8 bytes
> >    addr-08               // Literal (first 32-bits)      // patched to ops ptr
> >    addr-04               // Literal (last 32-bits)       // patched to ops ptr
> >    addr+00               auipc   t0, ftrace_caller
> >    addr+04               jalr    ftrace_caller(t0)
>
> Could you even do something like:
>         addr-n  call ftrace-function
>         addr-n+x        literals
>         addr+0  nop or jmp addr-n
>         addr+4  function_code
Yours cost one more instruction, right?
         addr-12  auipc
         addr-8    jalr
         addr-4    // Literal (32-bits)
         addr+0   nop or jmp addr-n // one more?
         addr+4   function_code

> So that all the code executed when tracing is enabled
> is before the label and only one 'nop' is in the body.
> The called code can use the return address to find the
> literals and then modify it to return to addr+4.
> The code cost when trace is enabled is probably irrelevant
> here - dominated by what happens later.
> It probably isn't even worth aligning a 64bit constant.
> Doing two reads probably won't be noticable.
>
> What you do want to ensure is that the initial patch is
> overwriting nop - just in case the gap isn't there.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
