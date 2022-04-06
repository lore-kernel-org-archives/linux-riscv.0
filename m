Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2433C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Apr 2022 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dETcOzWhku1GPjHVoz66swuYL8nibhepwwq6jCs9pOo=; b=of8MLm7bs4ZelY
	FheBHHc8tI6Z+OvZDxmNWwGjs8XBfZTkQd4dZmfVWD4HjZociiV6aXWo9SIy4erLmSWJzRdCJg4h0
	+nLftan3p6/qW75QL9VqqSiD/h4lBGsbenMYV/CwV/CQShEvz6XG7WSRPVh27+yMs7YP3K3ownP0G
	Dw2D3wItcKD1RSq3/6kA+nwLldVu5PEjuDQp2/CSg0pBbHzaa8HIE7+s6ik4yVRMBAr8FOTd50sSm
	wLfzMFyPuNuIVqG8sQr6aPfhs+jbS20jlCPP8B7VetGbYHN0gsztkz8D74VdCnaYgFhvXC7NXPpKv
	7loDzuppvoQAv7E+FguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncD6C-00800N-3E; Wed, 06 Apr 2022 21:21:56 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncD68-007zxE-Bi
 for linux-riscv@lists.infradead.org; Wed, 06 Apr 2022 21:21:54 +0000
Received: by mail-ot1-x330.google.com with SMTP id
 b17-20020a0568301df100b005ce0456a9efso2579111otj.9
 for <linux-riscv@lists.infradead.org>; Wed, 06 Apr 2022 14:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HfFrcmd70k7cFbm2ZXnWFiX/H5FhSCRXyrLZ2pjFPSI=;
 b=JWAdKKIGlR2GXRY2EyBHJpOHb12AGoA/GSAiazO0z3sUuJl2pbLq3y8f2LLZRiK7ag
 jF0pPAE80m/StQPAn0HI9Jocd1N932K40FWD3K+6jyCPxSDW85yi+b5RM+j3udvxF4+j
 4zvhIFli6DskhDlP9Zev4QI97hRqVRtIMcyyKrm7nX3owwnxPNDHJhwIikd2t2FloXmA
 Wk/pQwPT1sVLvBHFuFUW6X+vOB/f3di+0I5KpQAE5mktFyy59esdv+bNVlWExchHjewr
 ahjX/NWsjkK4v6+AkxwjmUhoWZbdfC6ilBaig9EYYETbKicXqqZULA+yUUodPHV8EKDI
 QR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HfFrcmd70k7cFbm2ZXnWFiX/H5FhSCRXyrLZ2pjFPSI=;
 b=70p1mmlG78MxD386asgNPSg5ZQd5UCg1Bu5uV0eZYq1vVv4LbiHZZQaHcF8J6dWE+Z
 7bUKOywRDU4Ne0BnI7pXQIL0wdTjJt579H8ZdcnSZSmKMvhLZQLy3xzDzAUN5s8zRec9
 nzyO4imw9FkcdXN0ltiO5S3jD4NIuk76EGBC0v2Vyh6WZJz7dOAUtV982liW38a+yhEk
 uPryInC+wuxyehXC2ZmKrc+8j8u+ABNRcmGG1my1hBieS0h/tvUljkZpHrRFkHKSVIWE
 GgvvgvBUcmFDjKl9tuHwb7WPwysAcdFS/r3mTeuE3Ov0Dg8oFlCXnulWtfYQ4Jh7+uYX
 5QwQ==
X-Gm-Message-State: AOAM532/GE9fMIXnMn2bzGiFIags0pRDCFR/E7Zxj2L6BuKrEYQAJ2qk
 tlKHDCChpSTXA3eYOJIdrt93tw==
X-Google-Smtp-Source: ABdhPJxZn7W+k8uRxWVFozQX95YWH7+EoUvtnn2OqSRwx2HUCEvYG912nG22JE+OWDU4RAdahCRb6g==
X-Received: by 2002:a9d:4d12:0:b0:5c9:4997:452c with SMTP id
 n18-20020a9d4d12000000b005c94997452cmr3741105otf.127.1649280109270; 
 Wed, 06 Apr 2022 14:21:49 -0700 (PDT)
Received: from [192.168.86.186] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a4aa60c000000b00324bb45d7ecsm6352052oom.48.2022.04.06.14.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 14:21:48 -0700 (PDT)
Message-ID: <c3e7ee64-68fc-ed53-4a90-9f9296583d7c@landley.net>
Date: Wed, 6 Apr 2022 16:25:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [RFC PULL] remove arch/h8300
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "moderated list:H8/300 ARCHITECTURE"
 <uclinux-h8-devel@lists.sourceforge.jp>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux-sh list <linux-sh@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Rich Felker <dalias@libc.org>
References: <Yib9F5SqKda/nH9c@infradead.org>
 <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org>
 <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdWcg+171ggdVC4gwbQ=RUf+cYrX3o9uSpDxo-XXEJ5Qgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_142152_692643_1AD5E1EB 
X-CRM114-Status: GOOD (  37.06  )
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

On 4/4/22 08:22, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Mon, Apr 4, 2022 at 3:09 PM Arnd Bergmann <arnd@arndb.de> wrote:
>> On Sun, Apr 3, 2022 at 2:43 PM Christoph Hellwig <hch@infradead.org> wrote:
>> > On Tue, Mar 08, 2022 at 09:19:16AM +0100, Arnd Bergmann wrote:
>> > > If there are no other objections, I'll just queue this up for 5.18 in
>> > > the asm-generic
>> > > tree along with the nds32 removal.
>> >
>> > So it is the last day of te merge window and arch/h8300 is till there.
>> > And checking nw the removal has also not made it to linux-next.  Looks
>> > like it is so stale that even the removal gets ignored :(
>>
>> I was really hoping that someone else would at least comment.
> 
> Doh, I hadn't seen this patch before ;-)
> Nevertheless, I do not have access to H8/300 hardware.

The 8300 never got qemu support but I had lunch with the maintainer in Tokyo a
few years back and he showed me how to use gdb to simulate it, which included
booting Linux under the gdb simulation (built-in initramfs talking to serial
console). Here's somebody else using gdb simulation for h8/300:

https://www4.cs.fau.de/~felser/RCXSimulator/

I'm interested in H8300 because it's a tiny architecture (under 6k lines total,
in 93 files) and thus a good way to see what a minimal Linux port looks like. If
somebody would like to suggest a different one for that...

>> 3. arch/sh j2 support was added in 2016 and doesn't see a lot of
>> changes, but I think
>>     Rich still cares about it and wants to add J32 support (with MMU)
>> in the future
> 
> Yep, when the SH4 patents will have expired.

They've had a working J32 on FPGA for a while now, the problem is porting Linux
to it. The MMU design they went with wasn't compatible with sh3/sh4. (Userspace
is, kernel side needs some tweaking.) And they don't want to finalize the design
until they have proper test loads running on it, and then they went off to do
VPN hardware and such during the pandemic...

> I believe that's planned for 2016 (Islamic calendar? ;-)

The website's kind of archived and needs to be completely redone. (It moved
hosts and I lost access to update it for a while, and I got sucked into other
projects since. The mailing list server is also mothballed. Ask Jeff, I brought
it up every weekly call for 6 months...)

Jeff's team is working on making a J2 asic this year (through sky130), and
everything else is queued up after that. They've been grabbing various I/O
subsystems (like the GPS correlators and crypto engine and such) and doing work
on them to make go/no-go decisions for the asic inclusion. (Lots of activity
goes by on the Signal channel, but I can't even get cut and paste to work in
that thing's Android app, and I don't really have the domain expertise to help
out with that part.)

> BTW, the unresponsiveness of the SH maintainers is also annoying.
> Patches are sent to the list (sometimes multiple people are solving
> the same recurring issue), but ignored.

I mailed four or five turtle boards out to people last year, in hopes of getting
wider testing, but everybody I sent one to seems to have vanished. (The pandemic
chip shortage kinda derailed plans to productize that...)

I tested 5.17 on J2 FPGA when it came out, and it booted with two local patches:

1) Commit 790eb67374 needs to be reverted or the j2 boot just hangs before
producing any console output. Dunno why, it seems COMPLETELY unrelated, and yet.
(Wild guess: disturbs the alignment of some important piece of data? Rich knows
and it's in queue.)

2) This patch from Rich stops the j2 boot messages from being a thousand lines
of IRQ warnings, but he called it a hack when he sent it to me and I have no
clue what a "proper" fix would look like (or why that isn't)?

diff --git a/drivers/irqchip/irq-jcore-aic.c b/drivers/irqchip/irq-jcore-aic.c
index 5f47d8ee4ae3..730252cb7b08 100644
--- a/drivers/irqchip/irq-jcore-aic.c
+++ b/drivers/irqchip/irq-jcore-aic.c
@@ -68,6 +68,7 @@ static int __init aic_irq_of_init(struct device_node *node,
 	unsigned min_irq = JCORE_AIC2_MIN_HWIRQ;
 	unsigned dom_sz = JCORE_AIC_MAX_HWIRQ+1;
 	struct irq_domain *domain;
+	int rc;

 	pr_info("Initializing J-Core AIC\n");

@@ -100,6 +101,11 @@ static int __init aic_irq_of_init(struct device_node *node,
 	jcore_aic.irq_unmask = noop;
 	jcore_aic.name = "AIC";

+	rc = irq_alloc_descs(min_irq, min_irq, dom_sz - min_irq,
+			     of_node_to_nid(node));
+	if (rc < 0)
+		pr_info("Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n",
+			min_irq);
 	domain = irq_domain_add_legacy(node, dom_sz - min_irq, min_irq, min_irq,
 				       &jcore_aic_irqdomain_ops,
 				       &jcore_aic);

I'm spinning too many plates to reliably reply to stuff, but I try to check in
as often as I can, and at LEAST regression test each new release.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
