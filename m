Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E5AC46467
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GaJtV1uwwtBemcEIRIA8RzGRPstYrFrJ8W9Bt3rkDMQ=; b=u2dY1HXCcttr3L
	iXu4jnKGfYngj6avzi/JwV6UPnjac5dNPHiE4Us5VQ9/aFT6AE0zTRUJTxmwzBC7wZperODA9ZHXq
	QVc/O9Q2d56pi5kVHKbBakgZjtIPEl9gqfqm1/MU0d7b42KtXanNxJPyTnoXwo04RaiOzLp0rYTGn
	+gXtyqsY+AEZyOes+LhDBbhRMy2AlqIHwoS4E4SiLtygRw5fV3VBG/OQR/Zac1AglitW6GJKZBtBP
	lEalTqmlc6qH13Kbo0E28pnsXoOHU/d3cnb/ceuCC3xs/80XGu+Xg+P5UWFx2VJN+R7TAieMWXKAi
	4wKRI+LnPN5oKpAvvm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0Wq-008Gkk-6j; Wed, 04 Jan 2023 09:57:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD0PB-008Dkf-Cy
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 09:49:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8BE9B810FE;
	Wed,  4 Jan 2023 09:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EACC433EF;
	Wed,  4 Jan 2023 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672825790;
	bh=8sm8xtJf3KAd4pR7kZe5UGTuodwcSnwrEzeARWqg0UA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=kWFz+rAaeiSFVSHcu1blPH+GGTSZjyRM4pSdFMYPZiPITxaqpNdOjkAtCi2eybLIZ
	 phox/4xY8FW/Ui/Zw7ZP/x+Of3c77z3yN4NVP6fmdyxOSRsuTvarjGZEPFNmnyJbRX
	 51NjMfCB+y7eh2aVytdQuON/tpNrU0lsyQvMYUGptYrrOb90X/Vy8aLK4PH0P81La6
	 jDaxX3Ln5aL7SooMQTQ9aN9UUQn60eubLSaRjFNg0O9Bxfp/zAkXFDS8tsWu8Tagga
	 /ZJ1S3aSb7+Vupufw9PF28pcEi1oIcA/IU4pShrsEAFZN9hD9a8saED+/XWNMjV7/S
	 ak4kC65TIcYSA==
Date: Wed, 04 Jan 2023 09:49:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Sudeep Holla <sudeep.holla@arm.com>
CC: Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ley Foon Tan <lftan.linux@gmail.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH=5D_riscv=3A_Move_call_to_init=5Fcpu?= =?US-ASCII?Q?=5Ftopology=28=29_to_later_initialization_stage?=
User-Agent: K-9 Mail for Android
In-Reply-To: <672440143ab04d3dbcc6de0a16bab3e1@EXMBX161.cuchost.com>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com> <20230103065411.2l7k6r57v4phrnos@orel> <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com> <Y7Rg28suWh1RUbkU@spud> <672440143ab04d3dbcc6de0a16bab3e1@EXMBX161.cuchost.com>
Message-ID: <F86CD957-8B7C-46B9-A14B-AAE67E43CD71@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_014953_950785_13B431BD 
X-CRM114-Status: GOOD (  37.08  )
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

Sudeep, see below - I got mixed up & what arm64 does now makes sense to me!
Your opinion on the patch, motivation aside, would be nice though.

Hey Leyfoon,


On 4 January 2023 05:35:41 GMT, Leyfoon Tan <leyfoon.tan@starfivetech.com> wrote:
>
>
>> -----Original Message-----
>> From: Conor Dooley <conor@kernel.org>
>> Sent: Wednesday, 4 January, 2023 1:08 AM

---8<---
>> To: Leyfoon Tan <leyfoon.tan@starfivetech.com>; Sudeep Holla
>> <sudeep.holla@arm.com>
>> Cc: Andrew Jones <ajones@ventanamicro.com>; Palmer Dabbelt
>> <palmer@dabbelt.com>; Paul Walmsley <paul.walmsley@sifive.com>; Albert
>> Ou <aou@eecs.berkeley.edu>; linux-riscv@lists.infradead.org; linux-
>> kernel@vger.kernel.org; Ley Foon Tan <lftan.linux@gmail.com>
>> Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
>> initialization stage
---8<---

btw, this above is pretty much useless can you can drop it from replies.

>> 
>> Hello!
>> 
>> Couple comments for you.
>> 
>> +CC Sudeep: I've got a question for you below.
>> 
>> On Tue, Jan 03, 2023 at 07:53:38AM +0000, Leyfoon Tan wrote:
>> > > From: Andrew Jones <ajones@ventanamicro.com>
>> > > Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to
>> > > later initialization stage On Tue, Jan 03, 2023 at 11:53:16AM +0800,
>> > > Ley Foon Tan wrote:
>> > > > topology_parse_cpu_capacity() is failed to allocate memory with
>> > > > kcalloc() after read "capacity-dmips-mhz" DT parameter in CPU DT
>> 
>> Uhh, so where did this "capacity-dmips-mhz" property actually come from?
>> I had a quick check of qemu with grep & I don't see anything there that
>> would add this property.
>> This property should not be valid on anything other than arm AFAICT.
>
>This DT parameter is not in default Qemu. I've added it for testing (see test steps in below). 
>This is preparation to support asymmetric CPU topology for RISC-V.

The property is only valid on arm, so how does arm64 deal with such asymmetric topologies without it?
Why should we "fix" something that may never be a valid dts?

>
>> 
>> > > > nodes. This
>> > > > topology_parse_cpu_capacity() is called from init_cpu_topology(),
>> > > > move call to init_cpu_topology() to later initialization  stage
>> > > > (after memory allocation is available).
>> > > >
>> > > > Note, this refers to ARM64 implementation, call
>> > > > init_cpu_topology() in smp_prepare_cpus().
>> > > >
>> > > > Tested on Qemu platform.
>> > >
>> > > Hi Ley,
>> > >
>> > > Can you provide the topologies (command lines) tested?
>> > 2 clusters with 2 CPU cores each.
>> 
>> What's the actual commandline for this? I'm not the best with QEMU, so it'd
>> really be appreciated, given the above.
>I used the Qemu to dump the DTS for 'virt' machine from Qemu, then add the "capacity-dmips-mhz" DT parameter and modify the CPU topology for clusters.
>
>1. Dump the dtb for 'virt' machine:
>qemu-system-riscv64 -cpu rv64 -smp 4 -m 2048M -M virt,dumpdtb=qemu_virt.dtb
>
>2. Convert dtb to dts
>dtc -I dtb -O dts qemu_virt.dtb > qemu_virt.dts
>
>3. Modifying qemu_virt.dts
>
>4. Compile dts to dtb
>dtc -I dts -O dtb qemu_virt.dts > qemu_virt.dtb
>
>5. Pass in "-dtb qemu_virt.dtb" as one of Qemu's argument.
>
>> 
>> > > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>> > >
>> > > Fixes tag?
>> > Okay, will send out next revision with Fixes tag.
>> 
>> Please don't just send versions to add tags, Palmer can pick them up if/when
>> he applies the patch.
>Okay. Will let Palmer add tag below if he applies the patch.
>
>Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot. ")
>
>
>> 
>> > > >  arch/riscv/kernel/smpboot.c | 3 ++-
>> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/arch/riscv/kernel/smpboot.c
>> > > > b/arch/riscv/kernel/smpboot.c index 3373df413c88..ddb2afba6d25
>> > > > 100644
>> > > > --- a/arch/riscv/kernel/smpboot.c
>> > > > +++ b/arch/riscv/kernel/smpboot.c
>> > > > @@ -39,7 +39,6 @@ static DECLARE_COMPLETION(cpu_running);
>> > > >
>> > > >  void __init smp_prepare_boot_cpu(void)  {
>> > > > -	init_cpu_topology();
>> > > >  }
>> > > >
>> > > >  void __init smp_prepare_cpus(unsigned int max_cpus) @@ -48,6
>> > > > +47,8
>> > > @@
>> > > > void __init smp_prepare_cpus(unsigned int max_cpus)
>> > > >  	int ret;
>> > > >  	unsigned int curr_cpuid;
>> > > >
>> > > > +	init_cpu_topology();
>> 
>> I know arm64 does this, but there is any real reason for us to do so?
>> @Sudeep, do you know why arm64 calls that each time?

I got myself mixed up between places I fiddled with storing the topology, so you can ignore that question Sudeep.
Clearly it's the one in smp_callin() that gets called for each CPU.
Woops.

>> Or if it is worth "saving" that call on riscv, since arm64 is clearly happily calling
>> it for many years & calling it later would likely head off a good few allocation
>> issues (like the one we saw with the topology reworking a few months ago).

...but is it still worth moving the function call later to head off any allocation failures if core topology code changes?

>> > > > +
>> > > >  	curr_cpuid = smp_processor_id();
>> > > >  	store_cpu_topology(curr_cpuid);
>> > > >  	numa_store_cpu_info(curr_cpuid);
>> > > > --
>> > > > 2.25.1
>> > > >
>> > >
>> > > Otherwise,
>> > >
>> > > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
>Regards
>Ley Foon
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
