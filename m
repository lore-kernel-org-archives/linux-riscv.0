Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44EFC6FA99
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 01:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HeXgE4PHAikz3ZdoXefKmpfzjYGozlXl6k1NIgQH7Rw=; b=tOiFUQ0ORSxkfC
	46V+F0eKmKXSEkt6DGbfByEE8rxOS0HJkJv4Hjx4aWP2H2vBD0NG2Qd8DdxpmGuSlDNyJ6CweWOgf
	KdLnytaPk0nRxr6L0UyhM8QiRk2uwO9ZLQt/oOJwOvcWX51OZCRK2rpglJxyKdh/OT1OXcKOoif9N
	V/DfAq9EoGSCMawh+z1xK1OYOPo0ZVrH2GK/eemzkpgFq5Lxl88IrKAj9crPMaEAYAlxtrhCUTrLM
	1QbWMcCMGQ46gP1BevEqh4j7m0V/17OFXtBZqTn/cen8qTtmhY/wXQj5JWLWCXBEhFvCPdkiS2UOe
	7IolwOqugiW9gp9e8j8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZiZT-0036ou-Ha; Wed, 08 Mar 2023 01:26:23 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZiZQ-0036nq-Bb
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 01:26:21 +0000
Received: by mail-qt1-x82c.google.com with SMTP id r16so15074550qtx.9
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 17:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678238778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrGCJ5MSZDYIh72odbfCXv3OjB4aPWORM8fS9BuSe6U=;
        b=V6/rzhlNCD4Os6IPrpRaMcKvSZkNbVv8YoB7DAg2rZNFKC/gq+qYQANoB5tjiqIuLE
         aECdRlPQgor7Pln0eWGQxW47KU3XgYoWhkjeQ1QqHmzG+ZE1L79qaQh9nn7Zq92RmdSa
         0lS3qBCvE3YFBkMInugQln3+6mkx0+NyqRGp5xna1rxdDh5mC0u4PpjnMkTFDXkhLFtN
         LkgXd0+46L1ciRg4NOCNI+Owbmn9UjB0EIgqMthqbsIoRJOyo54tFotuUIFApzw1stLY
         Lwqu/LPD+WEdJ5Mq5j7p/xH7ofwhdWPmESuesK4j80nHuZKXlLd+G2uc2l1dP0vb+MHF
         FeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238778;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HrGCJ5MSZDYIh72odbfCXv3OjB4aPWORM8fS9BuSe6U=;
        b=T+QbANmINIuynHpOI/WKVyO1YVkc1g1lnj/LGEjtxnwm+K6pI3atrIg8eALbXvCX/I
         ckihSulLM1JK4eyhSREZVqhLpSyFjyZGxh6guB3oUoqSEFXYVlR19ry9ChytfKa5gxsr
         8hqa4Pf+fCXbN0kANoKEXAMHMGpvgOs6CMuV09j8lQfbFlmg6ijTmrR59A3LBBqUsFsR
         b236R9dYPmQzVIRLGADmaVJ4sfCdRATYKBL2QKzE+X0Oreii2PBwHzk6dhxyytv50rk9
         izh6w6eXsndmTAycOGFPPOtKSbKQfGeWHaHv5icW+EB94G27sEZDaGlHq+WGgBbwHBc4
         Oupg==
X-Gm-Message-State: AO0yUKXpAxfWbUiY3BrKZcDVwNAfuLkkQoNKzmN1rDSoik45J/CrlRao
	p6Lm/KEGMucx7+wYBoZODZtVKZTKBi4=
X-Google-Smtp-Source: AK7set+dLHC4u0TbTmIumEqq6CCL5QcowmU62gPkQsoL1ySasKdM1qxtjrlwpgd66H5jV9QMV/5sNQ==
X-Received: by 2002:a05:622a:d1:b0:3bf:d372:a5bf with SMTP id p17-20020a05622a00d100b003bfd372a5bfmr29304085qtw.45.1678238778121;
        Tue, 07 Mar 2023 17:26:18 -0800 (PST)
Received: from [10.4.10.38] (pool-108-26-182-112.bstnma.fios.verizon.net. [108.26.182.112])
        by smtp.gmail.com with ESMTPSA id r2-20020ac83b42000000b003c034837d8fsm3325676qtf.33.2023.03.07.17.26.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 17:26:17 -0800 (PST)
Message-ID: <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
Date: Tue, 7 Mar 2023 20:26:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_172620_436673_4DCDEA00 
X-CRM114-Status: GOOD (  20.73  )
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



On 2/28/23 23:42, Damien Le Moal wrote:
> On 3/1/23 13:07, Randy Dunlap wrote:
>> Hi--
>>
>> On 2/28/23 16:26, Jesse Taube wrote:
>>> This patch-set aims to add NOMMU support to RV32.
>>> Many people want to build simple emulators or HDL
>>> models of RISC-V this patch makes it possible to
>>> run linux on them.
>>>
>>> Yimin Gu is the original author of this set.
>>> Submitted here:
>>> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
>>>
>>> Though Jesse T rewrote the Dconf.
>>
>> Dconf?
>>
>>>
>>> The new set:
>>> https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
>>> ---
>>> V1->V2:
>>>   - Add Conor's clock patch for implicit div64
>>>   - Fix typo in commit title 3/3
>>>   - Fix typo in commit description 2/3
>>> V2->V3
>>>   - Change from defconfig file to a PHONY config
>>> ---
>>
>> Is this 'rv32_nommu_virt_defconfig' target the only build target
>> that is supported?
>>
>> I ask because I applied the 3 patches and did 25 randconfig builds.
>> 5 of them failed the same way:
>>
>> riscv32-linux-ld: drivers/soc/canaan/k210-sysctl.o: in function `k210_soc_early_init':
>> k210-sysctl.c:(.init.text+0x78): undefined reference to `k210_clk_early_init'
I can not recreate this error.
can you send me the .config you used.

Thanks,
Jesse Taube
> 
> Arg. Forgot about that. k210 is rv64 only and while the clk driver could still
> compile test with rv32 (or any arch), that driver provides the
> k210_clk_early_init() function which is called very early in the boot process
> from k210_soc_early_init(), which is an SOC_EARLY_INIT_DECLARE() call. The
> problem may be there. Probably should be disabled for rv32 if no SoC need that
> sort of early init call.
> 
>>
>> because
>> # CONFIG_COMMON_CLK_K210 is not set
>>
>>
>> Maybe SOC_CANAAN needs some more selects for required code?
>>
>>> Conor Dooley (1):
>>>    clk: k210: remove an implicit 64-bit division
>>>
>>> Jesse Taube (1):
>>>    riscv: configs: Add nommu PHONY defconfig for RV32
>>>
>>> Yimin Gu (1):
>>>    riscv: Kconfig: Allow RV32 to build with no MMU
>>>
>>>   arch/riscv/Kconfig     | 5 ++---
>>>   arch/riscv/Makefile    | 4 ++++
>>>   drivers/clk/clk-k210.c | 2 +-
>>>   3 files changed, 7 insertions(+), 4 deletions(-)
>>>
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
