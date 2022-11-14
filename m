Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9652EC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vpP16Yn0fvUWlaQEZykwSvstXFjbrtWmpCxazZ55Grc=; b=JnjPornIL+siYu
	nDun5OFgMJ/oRwPkRdTdoPnTsDZB8TcYKM6lC69Rnd7in203LRN9h8TFgAiJTNKQKPH5viN3r2h7o
	8wTTyq6NuWyQiGaFz6OMU6UB/Se4wPlNABoPZsqxIiPFvoZFU6fTtwbK5n3OvhxxrZl6gV5j6AQgA
	/rfIeaKro452qq9fqowAj7vKYm6e/onP7+Z3XqGWanlVoa9lUwz4zCQo0oc66a7rEwZGRks5Fl4fa
	iPkM1Lzm20D2sYyvk6HoiElWEJ0r2ZmMRBVXR4PdnsJ0pFwfvCD+Me6Tbd0gwvf4g5WBbjxYnPQMB
	HbnSnn1t9EEMkbgfsTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougXC-0051EM-9N; Mon, 14 Nov 2022 20:58:26 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ougX8-0051BT-Hf
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 20:58:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1668459502; x=1699995502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tREM8R5JHhzGL4uKS1Xb0AsT9xlLLFSPcvY5DrjY8OI=;
  b=gJarclnIR0dvCanBsoAYjsz3ZTS8v7nhjWMc/ujOELoH6QIw2XCeNNrq
   hGSdF6UFmJ7VtHr3NEwpR4UxGdNkAYdPLZlO+CufOf2EBV3QYNkLQyWR8
   9HQk4lvE2cQephCMnBdHNP746wKnDJQ3hE0PLMKiT6XFxTpq3pYqUyRj8
   1awmhPNsCqketSftfsovrbOEQqlUZoNptbpmGrL0CQhSWgiPwgzk7GN1J
   bKBvESnfTlyQhthTCvjdHj5/Xtm1JuFMm32/6BGKEht+r3h1P6jUKUrmg
   WPOuLI0n8D8Jkcau10CU0j/vEKJeID2HFnzoNKpSZHm5OsQejaOluvBhQ
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,164,1665417600"; 
   d="scan'208";a="214521188"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 15 Nov 2022 04:58:15 +0800
IronPort-SDR: utuu/O7Uj5IBXIvZDv6ELXkeiIxD77QJsKYkB0EqADlvWN0/XrLztyUpm8/mD+KjsqsZ7wWmd9
 32CJlusuvc2cyfgjjd+XMe0EMIt9COQCs/xU0XOImrOs9uWOEZsSODThoAbt9swLPHhCieHwYG
 5J7dXa5xE4Zc85L/Dza7aMM3v5JLCkX/BEaxiTDD/eTkGidYD7H+KSx44uQkQL099hSSm96xuI
 EcS0Me1ZnPEVP7VuOB1uYG2QXbRQIiq6f2cwhSyedGuRLEI6FiLLhY1gniUP4ko5kqkqZYw/gx
 Z0Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Nov 2022 12:17:13 -0800
IronPort-SDR: KBzgFpL50wqYSUX5YENia81fg6CQeANypZ5Hq+CNPe9LLfXdMnRwMvX0dwlO3ByusvciboCBWC
 to3nNgliToRVOBs9t1U3jx/HPAjOJ7JO6fMKypv2u3W9vpEeP4jcPTtWKoTmDXmhd4mcUpUtjs
 Aafg4JNl+h1I7lxhR86t+xgwPXnDqqS10RhQr0FWzMwKcor/P0h5eS8oGu1DfMo9UIe6PFYmBm
 1eIP5z2ZyPceKVqbzuPQTPfNeh/41USC8FzKKGwG05go+iJRnnhmDecWz8oPznvxHWcTT0kScq
 1rI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Nov 2022 12:58:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NB1qV6qF6z1RvTp
	for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 12:58:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1668459494; x=1671051495; bh=tREM8R5JHhzGL4uKS1Xb0AsT9xlLLFSPcvY
	5DrjY8OI=; b=Lc8PP540Jrds8bFRillUU4atKXyHaliwZvgtIkBuKBFpEKgR5l+
	dthfOd3tHyo3kwIfe/Nh8vl64NF6SI/f0UJfwXH8IO1rqKQnHW1MwarxF+IIwq3Z
	6SNKrZ+NonT6dgT47w5D2v1z52TOh5vTk7Z3eGJ6021WLz/H7I8URWJjqK8V9AaP
	992VimJaKwTAiJeRsA8gL/lBW3snaogRXdh45/gfxTQbW0rY4NSY8RQQXveB7PWr
	fGFpuzMA7lJxVX8FjT9HkM9Uh8cm0E029LyAP96FihZqKViyOQ6irreaHUGMcIsC
	JABPu6HKj6lEXATetYr/SFLm2aiJDr5F9Dw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id nj9iHKPZV3GF for <linux-riscv@lists.infradead.org>;
	Mon, 14 Nov 2022 12:58:14 -0800 (PST)
Received: from [10.225.163.46] (unknown [10.225.163.46])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NB1qT2n2yz1RvLy;
	Mon, 14 Nov 2022 12:58:13 -0800 (PST)
Message-ID: <ce2a2873-c031-228d-e21f-e9918660e4b3@opensource.wdc.com>
Date: Tue, 15 Nov 2022 05:58:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] riscv: Update k210 defconfigs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Vlastimil Babka <vbabka@suse.cz>, Conor Dooley <Conor.Dooley@microchip.com>
References: <20221114013151.714578-1-damien.lemoal@opensource.wdc.com>
 <Y3Kffxz33QV1Vvii@spud>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y3Kffxz33QV1Vvii@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_125822_708778_9E84CE77 
X-CRM114-Status: GOOD (  22.96  )
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

On 11/15/22 05:05, Conor Dooley wrote:
> On Mon, Nov 14, 2022 at 10:31:51AM +0900, Damien Le Moal wrote:
>> In preparation for SLOB deprecation, update the nommu_k210_* defconfigs
>> to switch to using SLUB. To save memory, CONFIG_SLUB_CPU_PARTIAL is not
>> selected.
>>
>> Suggested-by: Vlastimil Babka <vbabka@suse.cz>
>> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> 
> Hey,
> Gave it a go w/ your v21 branch. To me, seems about as usable as it was
> before...

Please use upstream buildroot. Everything is in master for this board and
that v21 branch is dead now.

> Tested-by: Conor Dooley <conor.dooley@microchip.com>

I used buildroot defconfigs sipeed_maix_bit_defconfig and
sipeed_maix_bit_sd_card_defconfig. Both had the same issue with SLUB: lots
of errors with the shell, including failures for the init shell commands.
And sometimes I end up with a prompt but no way to run any shell command
at all. I guess that depends on fragmentation of the memory after boot
completes.

> 
> btw, what's the craic with that? Looks like you actually landed in
> upstream buildroot fairly soon after you pointed me at your series.
> Anything missing from buildroot, or did it all land?

Everything landed, plus some (some build fixes).

Palmer,

Please hold on before applying this patch. Discussion still going on about
SLUB.

> 
> Thanks,
> Conor.
> 
>> ---
>>  arch/riscv/configs/nommu_k210_defconfig        | 6 +++---
>>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 6 +++---
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
>> index 96fe8def644c..18de91e84d1c 100644
>> --- a/arch/riscv/configs/nommu_k210_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_defconfig
>> @@ -23,9 +23,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>  # CONFIG_ADVISE_SYSCALLS is not set
>>  # CONFIG_KALLSYMS is not set
>>  CONFIG_EMBEDDED=y
>> -# CONFIG_VM_EVENT_COUNTERS is not set
>> -# CONFIG_COMPAT_BRK is not set
>> -CONFIG_SLOB=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_CANAAN=y
>>  CONFIG_NONPORTABLE=y
>> @@ -39,6 +36,9 @@ CONFIG_CMDLINE_FORCE=y
>>  # CONFIG_BLOCK is not set
>>  CONFIG_BINFMT_FLAT=y
>>  # CONFIG_COREDUMP is not set
>> +# CONFIG_SLUB_CPU_PARTIAL is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>>  CONFIG_DEVTMPFS=y
>>  CONFIG_DEVTMPFS_MOUNT=y
>>  # CONFIG_FW_LOADER is not set
>> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> index 379740654373..718d2729a03e 100644
>> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> @@ -15,9 +15,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>  # CONFIG_ADVISE_SYSCALLS is not set
>>  # CONFIG_KALLSYMS is not set
>>  CONFIG_EMBEDDED=y
>> -# CONFIG_VM_EVENT_COUNTERS is not set
>> -# CONFIG_COMPAT_BRK is not set
>> -CONFIG_SLOB=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_CANAAN=y
>>  CONFIG_NONPORTABLE=y
>> @@ -32,6 +29,9 @@ CONFIG_CMDLINE_FORCE=y
>>  # CONFIG_MQ_IOSCHED_KYBER is not set
>>  CONFIG_BINFMT_FLAT=y
>>  # CONFIG_COREDUMP is not set
>> +# CONFIG_SLUB_CPU_PARTIAL is not set
>> +# CONFIG_COMPAT_BRK is not set
>> +# CONFIG_VM_EVENT_COUNTERS is not set
>>  CONFIG_DEVTMPFS=y
>>  CONFIG_DEVTMPFS_MOUNT=y
>>  # CONFIG_FW_LOADER is not set
>> -- 
>> 2.38.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
