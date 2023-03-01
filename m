Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C008C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 00:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ll+9HXCDLGni1A68CYco2NLgbpT4w6XgSysaXDN1f3U=; b=WzcCsvOr4occ4H
	OnoR7hZwUIK0bFk9LLNbqtwp1jKwCr+9ST0AphwV3o4yA2TJM24AtojfpvIcGHROxMY+55SCajir7
	X41Nqe9hSH1pSvZnLTN5tQbFNIu2e4GzYfy9r0OEvyI27/QPUr3oP0eRhaurIJdxqZ+2+YeylgTMC
	QzIajB7r+567LcZqwoJyrrSpdLWWoshZ0hE+pCrO1ig4u76cXoJm7r48EjInxCc85NBGTQAYErkjs
	6mNo0bnhnK+G6QT2OtLccCI8LdhC94q1tKA+m/VClLNviyA7FlSylmC9fNcC8JCw7NOl7fgC8qPne
	/aKg0mrtAiCYxaa7Ry1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAGU-00Edus-Fe; Wed, 01 Mar 2023 00:24:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXAGR-00EduK-UA
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 00:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D9CE4B80EE6;
	Wed,  1 Mar 2023 00:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CE5C433D2;
	Wed,  1 Mar 2023 00:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677630248;
	bh=m4guPfJLUa8LmwPjtN0dbXYerTvJcpnOVu9CzY3no+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ln9WdYoxjZoAiwJySwfPO+L2v7buBxftjBXhNQAVyCeyqTCSSukyiQ9rYjTgPIkCG
	 OjHp6qmOFvjSIZ37hNCL8gPtBO8K+S+dBzN8+wtQ0j/POPUvpZAgGnKlOJcG2Zc9JW
	 JE9Aa06X0egJzufhZyMZgY/Uo7wL1wtk3l9oHQYiz/OtpP4j15u7TGOizpEq/2sZJi
	 W1RjezCmky98WvbG1SRtJuDsrs29HKCY5+hi5g5ZZ9cCuKAauhFD15hQ26GNBOjVCm
	 O6P2tpeh/n+sfGQSvQm+H0wssokb+YVtMsdPsHlLJ0c8KaPzYQGJoNbVbEc6Y7OOmP
	 MMv93wiezPWVA==
Message-ID: <b3ec8b21-8776-98e1-b7e2-f82bdee40602@kernel.org>
Date: Wed, 1 Mar 2023 10:24:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
 <3719a4f0-1a5a-4661-a6d7-5d4f67d7b7e8@opensource.wdc.com>
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <3719a4f0-1a5a-4661-a6d7-5d4f67d7b7e8@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_162412_304002_48B0F045 
X-CRM114-Status: GOOD (  26.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On 1/3/23 08:49, Damien Le Moal wrote:
> On 3/1/23 06:52, Palmer Dabbelt wrote:
>> On Tue, 28 Feb 2023 05:51:24 PST (-0800), gerg@kernel.org wrote:
>>> The following changes add the ability to run ELF format binaries when
>>> running RISC-V in nommu mode. That support is actually part of the
>>> ELF-FDPIC loader, so these changes are all about making that work on
>>> RISC-V.
>>>
>>> The first issue to deal with is making the ELF-FDPIC loader capable of
>>> handling 64-bit ELF files. As coded right now it only supports 32-bit
>>> ELF files.
>>>
>>> Secondly some changes are required to enable and compile the ELF-FDPIC
>>> loader on RISC-V and to pass the ELF-FDPIC mapping addresses through to
>>> user space when execing the new program.
>>>
>>> These changes have not been used to run actual ELF-FDPIC binaries.
>>> It is used to load and run normal ELF - compiled -pie format. Though the
>>> underlying changes are expected to work with full ELF-FDPIC binaries if
>>> or when that is supported on RISC-V in gcc.
>>>
>>> To avoid needing changes to the C-library (tested with uClibc-ng
>>> currently) there is a simple runtime dynamic loader (interpreter)
>>> available to do the final relocations, https://github.com/gregungerer/uldso.
>>> The nice thing about doing it this way is that the same program
>>> binary can also be loaded with the usual ELF loader in MMU linux.
>>>
>>> The motivation here is to provide an easy to use alternative to the
>>> flat format binaries normally used for RISC-V nommu based systems.
>>>
>>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
>>> ---
>>>
>>>   arch/riscv/include/asm/elf.h         |   11 +++++++++-
>>>   arch/riscv/include/asm/mmu.h         |    4 +++
>>>   arch/riscv/include/uapi/asm/ptrace.h |    5 ++++
>>>   fs/Kconfig.binfmt                    |    2 -
>>>   fs/binfmt_elf_fdpic.c                |   38 +++++++++++++++++------------------
>>>   include/linux/elf-fdpic.h            |   14 +++++++++++-
>>>   include/uapi/linux/elf-fdpic.h       |   15 +++++++++++++
>>>   7 files changed, 67 insertions(+), 22 deletions(-)
>>
>> Adding Damien, as IIRC he's had some hacked up userspace bits for the
>> K210.  I'm yet to get anything running, but it'd be great if we get this
>> to a point where I can actually boot test this on QEMU (I'm just doing
>> builds now).
> 
> +Niklas
> 
> Niklas, didn't you add a nommu qemu build for buildroot ? Can't find the config
> though...
> 
>>
>> Given that it's the second week of the merge window and this is a bunch
>> of new uABI it seems best to hold off until the next cycle.  I poked
>> around and don't see anything wrong, but I'll try and take a more
>> detailed look after the merge window.
> 
> Does any riscv compiler support nommu fdpic now ? When doing the work on the
> k210, there was no support at all, hence the statically linked user binaries
> used (no shared text for libraries).

I was wondering if anyone was working on it. Couldn't find anything.

The way I use this support doesn't improve the statically linked situation.
The -pie ELF files are still statically linked. But it does avoid the
use of flat format binaries. That makes the toolchain generation a little
simpler.

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
