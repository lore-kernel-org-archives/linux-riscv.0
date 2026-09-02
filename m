Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D884C624D3
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3IQfwhnivHFvRHJmB40GkASHgvk1+4rRZsvdzcxo/s=; b=AWhrLDqUul+2eR
	7xtZS8aoO+nCpLuzfHrioUAa5f0XhWMeee0yY7qL6czCTgxsYvtd1apHN/SMZznacWSQpSlWz+WSR
	jgcL40gF08npgyYQtUbdoUCOy5QVYWLPPKk9yvE1tomk9suSz8nSkmXUJAK/H1ld1x4am5KdOiyev
	xqUM+UCfYHmvbOY+sJ3qBp5z5tZvBjZSCn10AsqJNk7hgwj5aqV0LyYoiaqsAygQrwf6VBbvZDIz6
	QUnxXWg8b+W/MnvFf808SMrMZ5i/OmybKEoHcJflrD0b2yn8UoLc3sJClq9qrjdmO6KXLRfb7YSu4
	L5xbSkl2LMD/OPP+DI4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lRn-0000000Erhn-2GZM;
	Wed, 02 Sep 2026 13:56:15 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1lRl-0000000Erh1-2NPF
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 13:56:14 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c2569aa5116so333204266b.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Sep 2026 06:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788357371; x=1788962171; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzTSP1VerAgUKbe8KO4iSf2T699TUXzKoWe3KwKSiDU=;
        b=OcUkDNh8f1fIrEPRz7uH74sxkS2jdnnBRuHdQNrDn02XzNoldBXhbku0KP+ewNNNqs
         4a6hhLDWpjByFgmLKwM/joXbGd0cVyZasHyq2bzc7SRVKElC3hVGPmd/q24x2WfEBNAq
         qFpM7aIZya3Vfm+nUTLde+OT9MCyDFjEgoOYr5e2Whfguq3RbI5d72IDv41UVcWZiYr6
         UgiE5nGli1MwhiVrmm+08V0R5RNwsSrLdsUWSmQVjROdGuAN4zz3mGxog3JNiKBFb7Mt
         Iyk7eD7qTcCGXInV3eQCu94OZP/eyVeQaKyH1RwXhgFE/vksyHKvPMpXIVrQNxhAiV8Q
         3VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357371; x=1788962171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HzTSP1VerAgUKbe8KO4iSf2T699TUXzKoWe3KwKSiDU=;
        b=svehuTUBK5cKjPCX8ijNwLLS5hv8TF7NVv/lvSEPLGskedubZGYLGFCHZ/UrhM1NZ9
         6+uq18KZjTdh25dDr6d1aTU0bqJZuJPmL3wBIYpd4QHgsAgz1dayWXiA+fY24NFy/s0Z
         YVxwPc/c40q7BLBlj0+b0RCQ0lIOvQYKxlhJ6V5qq7VJtztqe0jekgx8iR0PLiUq+d/6
         1YX45z+Dv0VD2xFZh7vzSJkfKvUQMBvW0LeI9+efsVMoStTH9Hxkg0PpszQLXbd92JRE
         1I3D9ggJcV+kpSIGeo7LEAfA0qBxQJ+UhE/V34/2Q26FzmXVQsSPjPBbW+5hxq2I0Z5x
         WhuA==
X-Forwarded-Encrypted: i=1; AKwUvBzS+OJ+Fq+SZYFxDglGmdBlIUBdEtiqHmpxwAQnjJ8O7OkP/NnUAhOyR2kTsWGCRqczjeEySJ+qKmmiDw==@lists.infradead.org
X-Gm-Message-State: AFuF++kzbCYxxEhYl41QYQeuH5yUdmlHMtL9QnI8Ciy85xuUwNIuCcGp
	pcT88DDVLB/QGyipijozjs0rZ7Ka1LEZFJnlVQ+GLgf1T48fTSLwlL9KLiWTyc0N5QM=
X-Gm-Gg: AYBFou1vSDychklMiUorZMIUvumBH5S40EH5vwUZAzO5jz+WDT0okWnuMA2QZygM8KC
	EBGrdtXjdBlHnfMCTXJbWbKI8lehUxR9XU85qH6L7M5vlwrFmkItFLeS+jtgTtG3eEl1fv99xEg
	5C3f1c5Dvrs1bn9Z4bDg+QP52JnhTDav4rid8c6SXX++Ge3/4lIRUm6UCXaG3qDAs37yHql3uDY
	srzmu6IOhaXcFvYheOhMnPCF8fwCvDVybLtXVxPRiToeTnTsIPDcPnyNEon8X0RNaXkiwokNefq
	M1gpJTLLB0wJLeB+KlOQlabCnlcRsudENO3URMBHxcvUh//uP0v6KSASo9ivutFX+JKZ5g+Lslv
	ZUBRXH/Avn+0jh2ZEkiBsWd+uug7S6ff0D8Kx5wst9SXl2/llHG173244d8p+n3wpi9CzT1uBQE
	o/LiUfxzW8CJsXHSnsfXKtOmSqgui+LsEq0oEYwD4+yzeF5wYHrva59mOq6tZY7TIzWhmeY3k=
X-Received: by 2002:a17:907:3fa6:b0:c1c:2218:f317 with SMTP id a640c23a62f3a-c25dc9bedbcmr195324866b.2.1788357370921;
        Wed, 02 Sep 2026 06:56:10 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25cffc7116sm136119566b.9.2026.09.02.06.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:56:09 -0700 (PDT)
Message-ID: <7a29717b-dc62-4421-b783-7b78e4375268@riscstar.com>
Date: Wed, 2 Sep 2026 08:56:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] PCI: spacemit-k1: port C probe hard-hangs a CPU with one
 endpoint on Milk-V Jupiter
To: Manivannan Sadhasivam <mani@kernel.org>, spacemit@lists.linux.dev,
 Bruno Banelli <bbanelli@gmail.com>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kwilczynski@kernel.org>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20260825052249.66921-1-bbanelli@gmail.com>
 <c24pt2ls62rxxg77xjbng7dmiflgdjlqd3mkoxehc2rvjgh7ai@dcxvmau3ykmt>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c24pt2ls62rxxg77xjbng7dmiflgdjlqd3mkoxehc2rvjgh7ai@dcxvmau3ykmt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_065613_640148_3C3006AC 
X-CRM114-Status: GOOD (  17.96  )
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

On 9/2/26 8:42 AM, Manivannan Sadhasivam wrote:
> On Tue, Aug 25, 2026 at 07:22:49AM +0200, Bruno Banelli wrote:
>> Hi,
>>
>> On a Milk-V Jupiter, probing the PCIe controller at ca800000 (port C, the
>> card slot) permanently wedges the CPU that runs the probe when one
>> particular add-in card is installed.  The CPU stops responding to NMI, and
>> because the probe is asynchronous, kernel_init() then blocks forever in
>> async_synchronize_full() and the machine never finishes booting.
>>
>> The same card, in the same slot, on the same board, does *not* hang the
>> vendor 6.6 kernel -- it reports "Phy link never came up" and boots normally.
>> Six other cards do not hang mainline either.  So whatever the electrical
>> cause, this looks like a robustness problem in pcie-spacemit-k1: an endpoint
>> should not be able to hang a host-side DBI register access.
>>
>>
>> HARDWARE
>> --------
>>    Milk-V Jupiter v1.1, SpacemiT M1 (socinfo: CPU[M1-8571] REV[C] DRO[130]),
>>    16 GiB LPDDR4X.
>>    Firmware: stock vendor U-Boot 2022.10 (k1-bl-v2.2.9), unmodified.
>>    Port B (ca400000, M.2) has a Samsung PM9B1 NVMe and works throughout.
>>    Port C (ca800000) is the card slot -- an x8-length connector, silkscreened
>>    PCIE_X2, wired x2.
>>
>>
>> REPRODUCED ON
>> -------------
>>    v7.1 and v7.2, riscv defconfig (plus PHY_SPACEMIT_K1_USB2, USB_DWC3,
>>    SPACEMIT_K1_TSENSOR, IGB, IGC, NVMe/ext4 built in).
>>    gcc 13.3.0 (cross) and gcc 16.2.0 (native, Debian sid).
>>    Identical failure in all combinations.  Not a regression -- port C has
>>    never worked with this card on mainline.
>>
>> Command line:
>>    console=ttyS0,115200 earlycon root=/dev/nvme0n1p2 rootwait rw
>>    swiotlb=65536 clk_ignore_unused pd_ignore_unused
>>
>>
>> SYMPTOM
>> -------
>> Port C prints its address ranges and then never speaks again.  (Log below is
>> from a run with port B disabled in DT, so nothing is interleaved.)
>>
>>    [ 1.290074] spacemit-k1-pcie ca800000.pcie: host bridge /soc/pcie-bus/pcie@ca800000 ranges:
>>    [ 1.297283] spacemit-k1-pcie ca800000.pcie:       IO 0x00b7002000..0x00b7101fff -> 0x0000000000
>>    [ 1.312783] spacemit-k1-pcie ca800000.pcie:      MEM 0x00a0000000..0x00afffffff -> 0x00a0000000
>>    [ 1.326753] spacemit-k1-pcie ca800000.pcie:      MEM 0x00b0000000..0x00b6ffffff -> 0x00b0000000
>>    [22.348490] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
>>    [22.351764] rcu:     4-...0: (12 GPs behind) idle=051c/1/0x4000000000000000 softirq=43/43 fqs=1908
>>    [22.367040] Sending NMI from CPU 2 to CPUs 4:
>>    [32.367049] After 10 seconds, these CPUS still haven't responded to the NMI: 4
>>
>> The CPU ignoring an NMI for ten seconds is why I read this as an MMIO access
>> that never receives a completion rather than a spin or a deadlock.
>>
>>
>> LOCALISATION
>> ------------
>> I added a dev_info() before each step of k1_pcie_init() (patch at the end of
>> this mail).  The last marker port C prints is the one immediately before the
>> first DBI access:
>>
>>    [1.347050] spacemit-k1-pcie ca800000.pcie: K1DBG 1 toggle_soft_reset
>>    [1.362635] spacemit-k1-pcie ca800000.pcie: K1DBG 2 enable_resources
>>    [1.370918] spacemit-k1-pcie ca800000.pcie: K1DBG 3 first DBI write (vendor/device ID)
>>    <nothing further>
> 
> Sounds weird that an endpoint is causing DBI write hang.
> 
> Can Alex or someone from Spacemit look into this issue?

I think Yixun Lan or maybe Troy Mitchell should investigate.

I have not done anything on the Milk-V Jupiter and have no
access to any board of that type.

					-Alex

> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
