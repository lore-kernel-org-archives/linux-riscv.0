From: mick@ics.forth.gr (Nick Kossifidis)
Date: Sat, 10 Nov 2018 19:54:56 +0200
Subject: [sw-dev] SBI extension proposal v2
In-Reply-To: <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
Message-ID: <357bd90554bff728520be2ee69d802c1@mailhost.ics.forth.gr>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

???? 2018-11-10 19:41, Olof Johansson ??????:
> On Sat, Nov 10, 2018 at 8:46 AM ron minnich <rminnich@gmail.com> wrote:
>> 
>> At Google and other places, we've been struggling now for years with
>> overly complex firmware that is implemented incorrectly, enabling
>> exploits and other bad things. The list of things vendors get wrong in
>> firmware, both enabling exploits and enabling others to enable
>> exploits, is long and it continues to this day. There is an
>> unbelievable amount of money out there all involving firmware
>> exploits, very little of it involving nice people.
>> 
>> I'm currently working on deleting all use of the x86 version of M
>> mode, i.e. SMM. There are many proposals out there for deleting SMM
>> from the architecture. I've also shown at a talk in 2017 how we could
>> redirect SMM interrupts back into the kernel. We're also removing all
>> use of callbacks into UEFI on x86. We're almost there.
>> 
>> Which is why I'm a bit unhappy to see this (to me) cancerous growth in
>> proposals for M- mode code. PPP in firmware? Really? multiple serial
>> devices? really? We've been here before, in the 1970s, with something
>> called the BIOS. If you're not familiar with it, go take a look, or
>> you can take my word for it that these proposals implement that idea.
>> We spent over 20 years freeing ourselves from it on x86. Why go back
>> to a 50 year old model on a CPU designed to be in use for 50 years?
>> 
>> My early understanding of M mode was that it was an Alpha PALCode like
>> thing, enabling access to resources that were behind a privilege wall.
>> I did not like it that much, but I was OK: it was very limited in
>> function, and the kernel could replace it, or at least measure it. I
>> also accept that every cpu vendor uses m mode like things (e.g. ARM
>> TF) for reasonable purposes and also (let's be honest here)  for
>> dealing with chipset mistakes. But that does not mean you need to
>> recreate BIOS.
>> 
>> The SBI should be hard to add to, deliberately. It should be used only
>> when there are no possible alternatives. It needs to be open source
>> and held in common. It should be possible for a kernel to replace or
>> at least measure it. And, further, there needs to be some work done on
>> why you add to it, and why you don't, with bias against adding to it.
>> This proposal works against those ideals, as it explicitly enables
>> vendor-specific forks of the SBI. Sure, this can happen, but why make
>> it so easy?
> 
> There's a tension between letting people do the messy things that real
> hardware sometimes needs without polluting higher layers in the
> software stack, and letting them do too much of things that _should_
> be handled in the upper layers. I have yet to find a solution that
> doesn't need tweaking over time, the pendulum tends to swing back and
> forth into "too far" in both directions sometimes.
> 
> The case of console is in this case pretty simple: It's intended for
> early boot for very simplistic environments (before the rest of the
> kernel is up, etc). Keeping the SBI console around beyond early boot,
> and somehow trying to optimize for it for those use cases is a
> misdirected effort; that's what native drivers are for.
> 
> Having to do fine-grained arbitration of device ownership between
> firmware and kernel at runtime is usually error prone and awkward and
> best to avoid.
> 
> 

+1

>> p.s. For interleaving debug and console output firmware, use the
>> oldest trick in the book: ASCII is 7 bits. Since console out is 8
>> bits, reserve 128 values for console out, and 128 for debug stream,
>> and if the debug stream needs 8 bit for some words, you know what to
>> do. It's very easy and doesn't require that we add multiple UART
>> support to SBI.
> 
> Sure, it helps for 2 channels. And then beyond that you need a more
> complex protocol. Either way, it's not a problem we need to solve here
> and now.
> 

+1, most people will just use minicom/picocom to do their job, not 
implement
a protocol over serial for splitting main console from debug console.
