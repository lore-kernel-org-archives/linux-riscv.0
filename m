Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677EBC64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 01:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tYD3q2+y/4vboUQ52Dh0ZEdwvikW4Tt3w77D78NgR8o=; b=2SbXs6/TCTKlms
	t+aHQcpov1F/A+7aRZa9+YO8cz8/dbosNLTCoGflIkHypX/oRB4VirNCVPAdlVbsRN/R0vc253HfR
	0QblgHVu6N8t0SSomGzGoC2DPXoFF9ZwqeJlel4RajS3Tap4SJJIHX7k56HqxdRIrtlTmoV2k1yZf
	HYGR+xxsprKG1HFArsFb+SuDNDoQ3ktOpZkMYQb+E5zyfK0ax3N2Dj71zz1xmLCOLWH0Xz/bvON3C
	Ter7t8eJnEgoxyvRrX6pk/TWdZAJwGnqxR2Te/XY2KNF5jMu0eJW17WYViaT8NHKNxxPpoMmyOLf1
	yiThfEnYhQrSWJBbwDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXB3R-00EiDf-Na; Wed, 01 Mar 2023 01:14:49 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXB3P-00EiBc-0f
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 01:14:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677633286; x=1709169286;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N+aZAPK10DnzUaT0ayx2/pjO5bVYRfWI3HigiBUgzRM=;
  b=rHgc+bl1bZO55yep0TnBLqx1N2I5AWGhAUVDSqP9LU959Xce3hSJGYdr
   pONVekthIPKshpWFKNhHQQxgA7/iYJeq9REDE4nRAJIVreA33WqV9Yxa6
   ToMdxESOiMtzBXFMEO1EYMgR1/MObeHYbJlZ29uCGrd2DZkzrrOqgK6/v
   8cP9VJxwJdBQJXiFY91hSKaCVx4arhrbfJRLaVi8sPULu3O2TD7JkeoK9
   P6Cx0DAjVkjvWn/SQt7KO/hnFJzECYBdaujK7pz7Th+Avs/DrWPKZoJr6
   TDZSUozpdyRzZlZwjHw5Ufn5dY185S1F2+YIQv7vVTw7qTyKZC3CbtDMh
   A==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="224479292"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 09:14:37 +0800
IronPort-SDR: FTH1t7XXpxhIWrSlTGofrxDHQLuouNgVyyalSp9UlAFRugGPy0YBnRHhpDVFNDLEDYPOVX2qcw
 3FdH0h1I8WsyqPoIxukv7AJY6JbwGFk4VzGDcYQwOFJzLH7wNzsgR3kacAShYi0Z9/QIM86rtJ
 zgf8vsQxEjHd8voTZbm3wQnYLNzOHsU7oE1e3jTp6+kHesTnwAFhYAiQ0jsV7fFLpkX3vwUWPS
 BHz0zghSwe2KqzyBj+XwX3hAecAVkW+w5Kv1lCXUjRl2GHV6/fzsE41e2eZTiSNIdI+cd9AhbY
 2zM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 16:25:43 -0800
IronPort-SDR: JtPR/wiffI6GMMfEfXdooCH6pfXIcaaQiP4uZGL4/9LJ2dzrBWmsi/8HtQh7FNqINRnpjO3MY3
 4msrwX9KT+IBYoEDrA6AGZCZOTOxqG5R8g5MXeDYxgvZAR2xGQeU+zo7Ma8wHrmWzOqnR68waj
 mTtZ7AB12PygtQx1kP16OhcDPPfcl2XURpcSQ9RK5v/SKTHk8cPyU6qWF2W2YeYp6jpuWr3TrX
 K+QntvgHEB6isaGE0rJuWM40VyuCRhsRmwQjhQ/dt0DyTrnd/AEY6POi+o6Vxe4ZcFVbBVm9tO
 FO0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 17:14:38 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRGVP4Yj0z1Rwrq
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 17:14:37 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677633276; x=1680225277; bh=N+aZAPK10DnzUaT0ayx2/pjO5bVYRfWI3Hi
	giBUgzRM=; b=BzA5de2BzcC2J0nyyXm1kFXIXN8O6e2COQlzWHxaM8ShOb56hqb
	hrtiuCFA8yToZlxLWS8w0CGKZyDPd8xoq0HN59FKDhZNob1yBpqt1eaXoKP+r3dr
	E6GMbERI4aYrhxVFOIqhmn18MAXjued0XjqPQV2k7597ADPU6n/sL+bLbO2P8fRS
	Ju5tkDHamRqULWBZ3RdmCdpiSlE7ZyMxv5rDpekUSuT1t6EBeJrqm3++EUs5r+BJ
	Zp+wYSlBrh/CGIBamR6rxo47G+EGALbSIJgDubLhTX3m168kaC0ndM6kvvoerrQv
	lGgIMmqLL/KQqBxU2Fn8kTvjIjvMnsfgUbg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2JlosG1iAdVG for <linux-riscv@lists.infradead.org>;
	Tue, 28 Feb 2023 17:14:36 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRGVM43hSz1RvLy;
	Tue, 28 Feb 2023 17:14:35 -0800 (PST)
Message-ID: <9b48f4be-4060-2505-8028-95cfa6806f33@opensource.wdc.com>
Date: Wed, 1 Mar 2023 10:14:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Content-Language: en-US
To: Greg Ungerer <gerg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
 <3719a4f0-1a5a-4661-a6d7-5d4f67d7b7e8@opensource.wdc.com>
 <b3ec8b21-8776-98e1-b7e2-f82bdee40602@kernel.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <b3ec8b21-8776-98e1-b7e2-f82bdee40602@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_171447_132269_CF6A741F 
X-CRM114-Status: GOOD (  31.43  )
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

On 3/1/23 09:24, Greg Ungerer wrote:
> Hi Damien,
> 
> On 1/3/23 08:49, Damien Le Moal wrote:
>> On 3/1/23 06:52, Palmer Dabbelt wrote:
>>> On Tue, 28 Feb 2023 05:51:24 PST (-0800), gerg@kernel.org wrote:
>>>> The following changes add the ability to run ELF format binaries when
>>>> running RISC-V in nommu mode. That support is actually part of the
>>>> ELF-FDPIC loader, so these changes are all about making that work on
>>>> RISC-V.
>>>>
>>>> The first issue to deal with is making the ELF-FDPIC loader capable of
>>>> handling 64-bit ELF files. As coded right now it only supports 32-bit
>>>> ELF files.
>>>>
>>>> Secondly some changes are required to enable and compile the ELF-FDPIC
>>>> loader on RISC-V and to pass the ELF-FDPIC mapping addresses through to
>>>> user space when execing the new program.
>>>>
>>>> These changes have not been used to run actual ELF-FDPIC binaries.
>>>> It is used to load and run normal ELF - compiled -pie format. Though the
>>>> underlying changes are expected to work with full ELF-FDPIC binaries if
>>>> or when that is supported on RISC-V in gcc.
>>>>
>>>> To avoid needing changes to the C-library (tested with uClibc-ng
>>>> currently) there is a simple runtime dynamic loader (interpreter)
>>>> available to do the final relocations, https://github.com/gregungerer/uldso.
>>>> The nice thing about doing it this way is that the same program
>>>> binary can also be loaded with the usual ELF loader in MMU linux.
>>>>
>>>> The motivation here is to provide an easy to use alternative to the
>>>> flat format binaries normally used for RISC-V nommu based systems.
>>>>
>>>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
>>>> ---
>>>>
>>>>   arch/riscv/include/asm/elf.h         |   11 +++++++++-
>>>>   arch/riscv/include/asm/mmu.h         |    4 +++
>>>>   arch/riscv/include/uapi/asm/ptrace.h |    5 ++++
>>>>   fs/Kconfig.binfmt                    |    2 -
>>>>   fs/binfmt_elf_fdpic.c                |   38 +++++++++++++++++------------------
>>>>   include/linux/elf-fdpic.h            |   14 +++++++++++-
>>>>   include/uapi/linux/elf-fdpic.h       |   15 +++++++++++++
>>>>   7 files changed, 67 insertions(+), 22 deletions(-)
>>>
>>> Adding Damien, as IIRC he's had some hacked up userspace bits for the
>>> K210.  I'm yet to get anything running, but it'd be great if we get this
>>> to a point where I can actually boot test this on QEMU (I'm just doing
>>> builds now).
>>
>> +Niklas
>>
>> Niklas, didn't you add a nommu qemu build for buildroot ? Can't find the config
>> though...
>>
>>>
>>> Given that it's the second week of the merge window and this is a bunch
>>> of new uABI it seems best to hold off until the next cycle.  I poked
>>> around and don't see anything wrong, but I'll try and take a more
>>> detailed look after the merge window.
>>
>> Does any riscv compiler support nommu fdpic now ? When doing the work on the
>> k210, there was no support at all, hence the statically linked user binaries
>> used (no shared text for libraries).
> 
> I was wondering if anyone was working on it. Couldn't find anything.

Maciej (added to this thread) has done some work on gcc, but nothing that is
upstream yet.

> The way I use this support doesn't improve the statically linked situation.
> The -pie ELF files are still statically linked. But it does avoid the
> use of flat format binaries. That makes the toolchain generation a little
> simpler.

Right. I was still thinking in terms of flat bin. The keyword here is "elf"...
Need more coffe :)

We could try this using either qemu or the k210 with buildroot, with the
addition of your uldso loader. Will try to put that in the pipeline (pretty full
as usual, so may take a while).

> 
> Regards
> Greg
> 

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
