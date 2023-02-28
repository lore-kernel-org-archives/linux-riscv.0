Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B58C64EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 22:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/aL5MHEV6B//qestCLMR68HKu+EpPtjBuivJ+Qy1tc=; b=AV7f3ejZD8Ed0x
	AI6Dh9qchy/Wnxw2RLNRhe1PfVfmj4AVfx1AOp41YtmTsaPrK59j/22acQd+2h6OTRimVoRRNv7DF
	qHglAlw4UYN4ibauQ5+HAHavBwCFn+LZ9bQxuyaqTmsraBYr2W9qw+i5dZrJhoJydvqqSlHhUif9u
	QGfCz97v4r20ehKKJx3LTx/PeVwpLCAStRTo9zcKxMDszIFwnkPYlTDB3nDCB+IKdYEnq1KQ5Oa5M
	WZw+d0maeAx7hXLwOpE7qK3qtZygXMivqMz6uYeK0EsVgXwwQAjQeJsgCZae1gyi+A98XcariUcQr
	Osivjz9afU8FrjkBuKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8mZ-00EVyT-3f; Tue, 28 Feb 2023 22:49:15 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX8mV-00EVxu-Gr
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 22:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1677624551; x=1709160551;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Vy8BS1FuQ/PhAs7eaiMqD6ABWjKT7b+2fZNPoZ13nRU=;
  b=BHT/UG9icFRaS4835GSxmhK7i/fh1gpFSt9bt455Bo7ym+Mil7tC2ged
   3WY/VGSHEA7TpnZEdoe85IRwGZsyxr4zcANXxPBJR59j1K6GcmUJORBdO
   sDocxS8CtOHjONoaz8Qotuq6elbe+8M70u/pU0oZzxHlpzyxaG7O56gDm
   Z6RF2hT7MEFbed9cL9dAVLqxtr7kDLzzTY1AI/HYpr72dOsnbPmDpbtUC
   QWEE+l/VhoOttz65ZZ0O0uv0sm5yHvIV/J7qq2/WzMGtAjUUi0iCCs/Ei
   5hG97HFSC4EFVAuWDGfGxlMcgbOGs/nj7IoWDdWRJGBquYCH8hX7XOu7/
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,223,1673884800"; 
   d="scan'208";a="224250080"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 06:49:09 +0800
IronPort-SDR: VRM5dJYM8m19Y/auQQyCmMy+BG+2u8X/KtgZ9gRCI/Mr7fYB/S+aC0/6m4axuHPIRBu76TCk1P
 JgM+MYETvbL1ITLVWfWQfQ68O0pJsbt738oytfrvYHT1cpGkEkxNkHstG3jMYwhXvlaH+GS+Xj
 0qGdCoovKusgtEScX3dEBkojNksqUmLzry+Sb9pfNL1eOCpQV2r1YmFPniDzFgNnl7nvVfqfLZ
 QF9HxOxrFg+DeD8Aj3oILeI/MIfbN3Zma8sIgvKtpX2mGJ5VdQnMCG1PzB94zaeRkBgRvoD/yo
 37A=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 14:05:59 -0800
IronPort-SDR: vIpnUztQCougZNd3L9RPwfMdhj6f/GSavyGAuZu5yOjOuFkH+GIbaVGZQJ7Slii6ur623vMwfD
 Hq28iM/VmNg5UI5Ofrz+5QdFHHKTAj9Cvq+UaaA0JVEMHobUWqkbDn7ePeJ0DzubIMlYE/f16b
 6cu6HGlaZlw3yMxNaonrV22HIJQC3/zdDLg2Xy9C++ZNW1b2Ytgwf3/dWP8BhDvW008/xspg5I
 1PejE72Ks8seS79u8bfyBxJjQo8ItEIB8LwFKptruT32jqbln/o9VZHTCp9Xr6ALwUMTAn7hfb
 55U=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2023 14:49:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PRCGY0YNqz1RwtC
	for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 14:49:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1677624548; x=1680216549; bh=Vy8BS1FuQ/PhAs7eaiMqD6ABWjKT7b+2fZN
	PoZ13nRU=; b=nNSuDRehF9NyWIUnmI4m07iYXddB/xgLe80TA1tPm62D0oXt4RJ
	us8sBSemat7k5pviO1lhW+duKe9Zedu3bh03ySY3v+0Zxu2ivUdFWahT55NcbpzT
	zKbn3NPYI6vX2h4bMk0pzlbjPFuRkyq+c6osZzHOSg8xoMvUhnDStQxsJsl5afLZ
	CcbRd+fOiTTj+onBmRcCkCcLBrLDWmbcMIIpSJ3XGWvJZA5bySbuavDPXCGDffkY
	VTTSceKu2ks0Ul0gLNSCpHaMZck1WXtVnjeZVnPqxsGpAyk3r80WjwEOZ38l+ZW7
	3ZU1GEOZDzdd3lM6SsYwWPl4ASsc/4zhF2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id awd6FL9ohsGF for <linux-riscv@lists.infradead.org>;
	Tue, 28 Feb 2023 14:49:08 -0800 (PST)
Received: from [10.225.163.47] (unknown [10.225.163.47])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PRCGW1cbgz1RvLy;
	Tue, 28 Feb 2023 14:49:07 -0800 (PST)
Message-ID: <3719a4f0-1a5a-4661-a6d7-5d4f67d7b7e8@opensource.wdc.com>
Date: Wed, 1 Mar 2023 07:49:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, gerg@kernel.org,
 Niklas Cassel <Niklas.Cassel@wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <mhng-20faeb04-8ed4-4759-8f13-aef3d2446d15@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_144911_640326_865314FA 
X-CRM114-Status: GOOD (  28.29  )
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

On 3/1/23 06:52, Palmer Dabbelt wrote:
> On Tue, 28 Feb 2023 05:51:24 PST (-0800), gerg@kernel.org wrote:
>> The following changes add the ability to run ELF format binaries when
>> running RISC-V in nommu mode. That support is actually part of the
>> ELF-FDPIC loader, so these changes are all about making that work on
>> RISC-V.
>>
>> The first issue to deal with is making the ELF-FDPIC loader capable of
>> handling 64-bit ELF files. As coded right now it only supports 32-bit
>> ELF files.
>>
>> Secondly some changes are required to enable and compile the ELF-FDPIC
>> loader on RISC-V and to pass the ELF-FDPIC mapping addresses through to
>> user space when execing the new program.
>>
>> These changes have not been used to run actual ELF-FDPIC binaries.
>> It is used to load and run normal ELF - compiled -pie format. Though the
>> underlying changes are expected to work with full ELF-FDPIC binaries if
>> or when that is supported on RISC-V in gcc.
>>
>> To avoid needing changes to the C-library (tested with uClibc-ng
>> currently) there is a simple runtime dynamic loader (interpreter)
>> available to do the final relocations, https://github.com/gregungerer/uldso.
>> The nice thing about doing it this way is that the same program
>> binary can also be loaded with the usual ELF loader in MMU linux.
>>
>> The motivation here is to provide an easy to use alternative to the
>> flat format binaries normally used for RISC-V nommu based systems.
>>
>> Signed-off-by: Greg Ungerer <gerg@kernel.org>
>> ---
>>
>>  arch/riscv/include/asm/elf.h         |   11 +++++++++-
>>  arch/riscv/include/asm/mmu.h         |    4 +++
>>  arch/riscv/include/uapi/asm/ptrace.h |    5 ++++
>>  fs/Kconfig.binfmt                    |    2 -
>>  fs/binfmt_elf_fdpic.c                |   38 +++++++++++++++++------------------
>>  include/linux/elf-fdpic.h            |   14 +++++++++++-
>>  include/uapi/linux/elf-fdpic.h       |   15 +++++++++++++
>>  7 files changed, 67 insertions(+), 22 deletions(-)
> 
> Adding Damien, as IIRC he's had some hacked up userspace bits for the 
> K210.  I'm yet to get anything running, but it'd be great if we get this 
> to a point where I can actually boot test this on QEMU (I'm just doing 
> builds now).

+Niklas

Niklas, didn't you add a nommu qemu build for buildroot ? Can't find the config
though...

> 
> Given that it's the second week of the merge window and this is a bunch 
> of new uABI it seems best to hold off until the next cycle.  I poked 
> around and don't see anything wrong, but I'll try and take a more 
> detailed look after the merge window.

Does any riscv compiler support nommu fdpic now ? When doing the work on the
k210, there was no support at all, hence the statically linked user binaries
used (no shared text for libraries).


-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
