Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35EBFC54EE9
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdzYCcg0LkctdsE/+Ow9giksTDj18iBMElq6lB/Yv0c=; b=xHhCAfzRgiabWh
	BLQT35qMQP+XDcQpwnhqRE3Cvj0PPxMPX8Pmr4OCy3z5VGEE7l1pYsxPj2Wi/z5fguvkAwFpe55Rm
	Qsys12vv8ratHIRZL0WNlZDD9csmauU86H2okYEX0Z07BZwJUVEctVuopt7h0USfEn3oIMpOEPWVp
	cP8ww1umBiWwqqNqqcDJ04v+FsmZVdjzRkEePLYvHetySQieEQPdRUZyP2OubnBI5tZFgG7l48yaQ
	YE4Uo7ytolSl3ydfYbodsqQu6zAB426xHmzn9z2CpMnUxYN1aekEn+V/8vjm+ckQAZuFr5u8Je7il
	HrdlKXb9IhvNZGrZnLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXfg-001M4D-BE; Tue, 20 Sep 2022 07:27:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXfe-001M2z-Uo
	for linux-riscv@bombadil.infradead.org; Tue, 20 Sep 2022 07:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nJorAZkvCcaiVv9WkrvdCMH7huMoLLPjvJEGmhGxyoQ=; b=YOykU3vpSnGu6BB0dYht8u4ORE
	qKUGkPeZalu2Ocza2rk+GDCR/hYIsCv1g72blDki9HLZRadNO63G5N401MiTPfc8GFmhSGVIx4Dvj
	x2IY0DN/9iy4PqAPlT9+8nKCeVXQZ3wC4Wi1tjcrkPNcxLiatkDzVWtgh0NKI8JbS+s6Oteab9TCX
	OJyt+zeGa0hju5IA48XLNURq3TCl72CS3tWwyHSyiAC7wxQpdPmwjNw3iZKPd07evjIi0lv7Arp7o
	g+Q1G7SJmoN532yabjo0cRtuQIsP22gLXd4gtyJC5AFnJLhCSAVEJ7Nj8aCieVZx+S2gWDveREhjj
	t8yFcCag==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaXff-005Lnl-7X; Tue, 20 Sep 2022 07:27:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E11A7300212;
	Tue, 20 Sep 2022 09:27:51 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id C92D32BB3E533; Tue, 20 Sep 2022 09:27:51 +0200 (CEST)
Date: Tue, 20 Sep 2022 09:27:51 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, luto@kernel.org,
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org,
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org,
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, mark.rutland@arm.com,
	zouyipeng@huawei.com, bigeasy@linutronix.de,
	David.Laight@aculab.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org
Subject: Re: [PATCH V5 08/11] riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
Message-ID: <Yylrd77Eh9v7OKLj@hirez.programming.kicks-ass.net>
References: <20220918155246.1203293-1-guoren@kernel.org>
 <20220918155246.1203293-9-guoren@kernel.org>
 <Yyhyap+Xi3UtV+T0@hirez.programming.kicks-ass.net>
 <CAJF2gTS9rFTndZXvDG+XNOOEwZYC_Hbu9TOO_F+4gQo1mRF2bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTS9rFTndZXvDG+XNOOEwZYC_Hbu9TOO_F+4gQo1mRF2bQ@mail.gmail.com>
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

On Tue, Sep 20, 2022 at 02:08:55PM +0800, Guo Ren wrote:
> On Mon, Sep 19, 2022 at 9:45 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Sun, Sep 18, 2022 at 11:52:43AM -0400, guoren@kernel.org wrote:
> >
> > > +ENTRY(call_on_stack)
> > > +     /* Create a frame record to save our ra and fp */
> > > +     addi    sp, sp, -RISCV_SZPTR
> > > +     REG_S   ra, (sp)
> > > +     addi    sp, sp, -RISCV_SZPTR
> > > +     REG_S   fp, (sp)
> > > +
> > > +     /* Save sp in fp */
> > > +     move    fp, sp
> > > +
> > > +     /* Move to the new stack and call the function there */
> > > +     li      a3, IRQ_STACK_SIZE
> > > +     add     sp, a1, a3
> > > +     jalr    a2
> > > +
> > > +     /*
> > > +      * Restore sp from prev fp, and fp, ra from the frame
> > > +      */
> > > +     move    sp, fp
> > > +     REG_L   fp, (sp)
> > > +     addi    sp, sp, RISCV_SZPTR
> > > +     REG_L   ra, (sp)
> > > +     addi    sp, sp, RISCV_SZPTR
> > > +     ret
> > > +ENDPROC(call_on_stack)
> >
> > IIRC x86_64 moved away from a stack-switch function like this because it
> > presents a convenient exploit gadget.
> I found:
> https://lore.kernel.org/all/20210204204903.350275743@linutronix.de/
> 
>   - The fact that the stack switching code ended up being an easy to find
>     exploit gadget.
> 
> What's the exploit gadget? Do you have a ref link? Thx.

Sadly no, I do not. Kees might. But basically it boils down to this
function taking both a stack pointer and a function pointer as
arguments (@a1 and @a2 resp. if I'm not reading this wrong).

If an attacker can call this with arguments of its choice then it gains
full control of subsequent execution.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
