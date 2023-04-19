Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1BDC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=am3d9bQLqy/F1o+adeV9lZ5s5FDPlfr28xOjYcw+oPQ=; b=flOPP7FNi5oxvz
	ZVsB0X5u+2xTfPoEJf2SvyoQBTJxCIpx1a21FVaO/3xYPmqd9/gpOAKKHkj+h3DE6baISS/hw1yl+
	bFCyMax4bF+zHnMb44+AkKatbVEW96Q9kOS7NGZ/SVi8uW4dQIz70/TWus0uXmbPIUBzQFp9iaGSn
	bLRN+3zzFueBbPoMZhjLj3Lp+OuCUJwteI/0lHqqhZP5yYd+LDB1mtOmoUXUCZ/KTejK3F3v3WrKi
	r0VD0WoyW9xpTfkiRNoDJYOIpSIvTikHCVFcbAJZAbyQ0s/eWO0NsAxK6OXRyBVhnX9Wq/pqNd3aA
	id6juFkUW2Oas9Y5BUsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp74t-005PZc-0R;
	Wed, 19 Apr 2023 12:38:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp74p-005PYJ-19;
	Wed, 19 Apr 2023 12:38:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681907899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzrbFJX0mLRnVyg6gK50wjW8gAdRTyt3eKsS6bO2Ho8=;
	b=UQOJzBaZIKBAqIIp2iqE9MqaQt4o5jf4X54iENF8PIgb3XVSKHeAToYhSAetn/VDc3XDSc
	vbXK6VM/E7725N29s2FSKaatj7nI1wyCTjA86cgr2JkrX8DxeEun3hjlUqogLtb5s5zfSa
	SywUUUueeIYsZNv4w36kFnEjVOxY/DSPPwkyq+kebzFI7z2gYg0r9CnlmtgFv9TqDyfAlD
	YKid0ziPPcge9cOBT8GWWTc95C+prcMhIbymQfHwn03mi0EsBFOddKVOKY2XMi3tesk7+V
	TiCAx54bzs6ELiLXkmKcxWv4fFnjWSoKaHB0PW1kBv0yCnbUWTFXcy/RdtQ2bA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681907899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TzrbFJX0mLRnVyg6gK50wjW8gAdRTyt3eKsS6bO2Ho8=;
	b=G/PDlG02+awXAj/Znv2ir94TrCNuE4soVJYG72z/i6F9KUyMxTR0qJUk/z9cfxNZH98BUp
	FAdnV9eglXscn1DA==
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Piotr Gorski
 <lucjan.lucjanov@gmail.com>, David Woodhouse <dwmw@amazon.co.uk>, Usama
 Arif <usama.arif@bytedance.com>, =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E. J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 00/37] cpu/hotplug, x86: Reworked parallel CPU bringup
In-Reply-To: <87a5z443g2.ffs@tglx>
References: <20230414225551.858160935@linutronix.de>
 <8247ce4d-15b7-03b2-0c9b-74f8cd6cad50@molgen.mpg.de> <87wn2a4la5.ffs@tglx>
 <bd5a6a93-def1-9248-2258-c3d3b40071ef@molgen.mpg.de> <87ttxd4qxz.ffs@tglx>
 <87r0sh4m7a.ffs@tglx> <8592a301-9933-1cad-bd61-8d97e7c7493b@molgen.mpg.de>
 <87a5z443g2.ffs@tglx>
Date: Wed, 19 Apr 2023 14:38:18 +0200
Message-ID: <877cu83v45.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_053823_542982_837E547E 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, Apr 19 2023 at 11:38, Thomas Gleixner wrote:
> On Tue, Apr 18 2023 at 22:10, Paul Menzel wrote:
>> Am 18.04.23 um 10:40 schrieb Thomas Gleixner:
>>> Can you please provide the output of cpuid?
>>
>> Of course. Here the top, and the whole output is attached.
>
> Thanks for the data. Can you please apply the debug patch below and
> provide the dmesg output? Just the line which is added by the patch is
> enough. You can boot with cpuhp.parallel=off so you don't have wait for
> 10 seconds.

Borislav found some a machine which also refuses to boot. It turns of
the debug patch was spot on:

[    0.462724] .... node  #0, CPUs:      #1
[    0.462731] smpboot: Kicking AP alive: 17
[    0.465723]  #2
[    0.465732] smpboot: Kicking AP alive: 18
[    0.467641]  #3
[    0.467641] smpboot: Kicking AP alive: 19

So the kernel gets APICID 17, 18, 19 from ACPI but CPUID leaf 0x1
ebx[31:24], which is the initial APICID has:

CPU1		0x01
CPU2		0x02
CPU3		0x03

Which means the APICID to Linux CPU number lookup based on CPUID 0x01
fails for all of them and stops them dead in the low level startup code.

IOW, the BIOS assignes random numbers to the AP APICs for whatever
raisins, which leaves the parallel startup low level code up a creek
without a paddle, except for actually reading the APICID back from the
APIC. *SHUDDER*

I'm leaning towards disabling the CPUID lead 0x01 based discovery and be
done with it.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
