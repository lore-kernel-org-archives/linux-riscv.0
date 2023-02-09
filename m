Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331E5C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJZjPv3Uc7dby1/apXuq6F0pJX7keEh5kGhwDHQ8hrI=; b=wx9+x8oBSWnIwD
	0Uf2Udb3258uZjWshT/Q6pn0/1KyuFxsZEOAhWtJ5ZAWdhVXClf94p0wyeR+Yv9/B37uISlNUI6lm
	GiEmaS7wtb6bwU2D5rxVyZssO9ieFX1OMLXeIa7k8UX+I1Ou+KcT5jXnzAz1jmB9Z9P3FlUv+PqZs
	qowuAhjOOLlqyIZ6SdcDbmV84K4HVZDSsQkffREds0QYTJMXHzTZBw6/2tEBGhYvoqfc1AQR+w/vF
	fx1/R6ov2+1q/8EKR3f3xwO+qNwaUjOW2zstyoKNfDFnMf9fOXqus5ozr8pCsZ8txeZW6q85tAb7Q
	JWFYbNXcnA1goe2VU4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3de-000wLE-Gm; Thu, 09 Feb 2023 09:54:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ3da-000wJx-PB
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 09:54:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DB56150C;
	Thu,  9 Feb 2023 01:55:18 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 016E23F71E;
	Thu,  9 Feb 2023 01:54:32 -0800 (PST)
Date: Thu, 9 Feb 2023 09:54:27 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Guo Ren <guoren@kernel.org>
Cc: David Laight <david.laight@aculab.com>,
	Evgenii Shatokhin <e.shatokhin@yadro.com>,
	"suagrfillet@gmail.com" <suagrfillet@gmail.com>,
	"andy.chiu@sifive.com" <andy.chiu@sifive.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Guo Ren <guoren@linux.alibaba.com>,
	"anup@brainfault.org" <anup@brainfault.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"heiko@sntech.de" <heiko@sntech.de>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"jolsa@redhat.com" <jolsa@redhat.com>, "bp@suse.de" <bp@suse.de>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>,
	"linux@yadro.com" <linux@yadro.com>
Subject: Re: [PATCH -next V7 0/7] riscv: Optimize function trace
Message-ID: <Y+TC037Erd+bsrB7@FVFF77S0Q05N>
References: <20230112090603.1295340-1-guoren@kernel.org>
 <c68bac83-5c88-80b1-bac9-e1fd4ea8f07e@yadro.com>
 <CAJF2gTQm11px3mqyrNk1SRiJZud1yeY2avK99UX9KetWAGe5BA@mail.gmail.com>
 <Y+DOyqehZvBJlb8N@FVFF77S0Q05N>
 <CAJF2gTQ6U1vH79Mu53eQ-GVaFx36C-hEt9Qf6=_vAkHfmgFh1Q@mail.gmail.com>
 <Y+IXB4xQ7ACQWC9U@FVFF77S0Q05N>
 <CAJF2gTTrX+8wCm-g=L9+3BkCRrZ8SCUM2w1e5duq-+Bsa213mA@mail.gmail.com>
 <8154e7e618d84e298bad1dc95f26c000@AcuMS.aculab.com>
 <CAJF2gTQGxxgusRgPdNaw4-d+o0a4vefUj7PNpZuym6VKQC4dhw@mail.gmail.com>
 <CAJF2gTQ61BHUgtPaaH49Srp6Y5NGD4Bvdvw1GF57owuw-h-+nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQ61BHUgtPaaH49Srp6Y5NGD4Bvdvw1GF57owuw-h-+nQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_015443_024154_AE4DF647 
X-CRM114-Status: GOOD (  24.64  )
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

On Thu, Feb 09, 2023 at 09:59:33AM +0800, Guo Ren wrote:
> On Thu, Feb 9, 2023 at 9:51 AM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Thu, Feb 9, 2023 at 6:29 AM David Laight <David.Laight@aculab.com> wrote:
> > >
> > > > >   # Note: aligned to 8 bytes
> > > > >   addr-08               // Literal (first 32-bits)      // patched to ops ptr
> > > > >   addr-04               // Literal (last 32-bits)       // patched to ops ptr
> > > > >   addr+00       func:   mv      t0, ra
> > > > We needn't "mv t0, ra" here because our "jalr" could work with t0 and
> > > > won't affect ra. Let's do it in the trampoline code, and then we can
> > > > save another word here.
> > > > >   addr+04               auipc   t1, ftrace_caller
> > > > >   addr+08               jalr    ftrace_caller(t1)
> > >
> > > Is that some kind of 'load high' and 'add offset' pair?
> > Yes.
> >
> > > I guess 64bit kernels guarantee to put all module code
> > > within +-2G of the main kernel?
> > Yes, 32-bit is enough. So we only need one 32-bit literal size for the
> > current rv64, just like CONFIG_32BIT.
> We need kernel_addr_base + this 32-bit Literal.
> 
> @Mark Rutland
> What do you think the idea about reducing one more 32-bit in
> call-site? (It also sould work for arm64.)

The literal pointer is for a struct ftrace_ops, which is data, not code.

An ftrace_ops can be allocated from anywhere (e.g. core kernel data, module
data, linear map, vmalloc space), and so is not guaranteed to be within 2GiB of
all code. The literal needs to be able to address the entire kernel addresss
range, and since it can be modified concurrently (with PREEMPT and not using
stop_machine()) it needs to be possible to read/write atomically. So
practically speaking it needs to be the native pointer size (i.e. 64-bit on a
64-bit kernel).

Other schemes for compressing that (e.g. using an integer into an array of
pointers) is possible, but uses more memory and gets more complicated for
concurrent manipulation, so I would strongly recommend keeping this simple and
using a native pointer size here.

> > > > Here is the call-site:
> > > >    # Note: aligned to 8 bytes
> > > >    addr-08               // Literal (first 32-bits)      // patched to ops ptr
> > > >    addr-04               // Literal (last 32-bits)       // patched to ops ptr
> > > >    addr+00               auipc   t0, ftrace_caller
> > > >    addr+04               jalr    ftrace_caller(t0)
> > >
> > > Could you even do something like:
> > >         addr-n  call ftrace-function
> > >         addr-n+x        literals
> > >         addr+0  nop or jmp addr-n
> > >         addr+4  function_code
> > Yours cost one more instruction, right?
> >          addr-12  auipc
> >          addr-8    jalr
> >          addr-4    // Literal (32-bits)
> >          addr+0   nop or jmp addr-n // one more?
> >          addr+4   function_code

Placing instructions before the entry point is going to confuse symbol
resolution and unwind code, so I would not recommend that. It also means the
trampoline will need to re-adjust the return address back into the function,
but that is relatively simple.

I also think that this is micro-optimizing. The AUPIC *should* be cheap, so
executing that unconditionally should be fine. I think the form that Guo
suggested with AUIPC + {JALR || NOP} in the function (and 64-bits reserved
immediately bfore the function) is the way to go, so long as that does the
right thing with ra.

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
