Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF65CD98F6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 23:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H10Nef/CZ4H5aAczLxQJM7Qk4CpEyXuFgiILQ090gH0=; b=vXZWqBMPAwg5CS
	1o3nf3X4VYB2eWugM44OUXB8RfZlCYdeqrHDoZlwp3t62RYvNBlfbJk3WxBvpRkM/enseEuRW2b0P
	eYx5BDYR3/nF+BnkHEITg0UFNCz7DOmZVT82gastnVmbPV0RWn10Br2rwBSjv8Uo5ACItx4xIZLCs
	kJU7Z9YNjNHeJ6oTpkDhJT5MWQaGPddFXJPr6RLGKX0qucbvQqiML4hD4XnYnKdMc9N0FfEO43BQ9
	bhthuki2AyycYWzHZF/xhdqEknrFzrsh3vBMu0DSugH1YUvf6E+83KRTZ4rkyjoFYfMS+5FfKIMLh
	HgbfUFwtPP4BC+FYt1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waitD-000000035ar-1OY7;
	Fri, 19 Jun 2026 23:44:47 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waitA-000000035aQ-2P3p
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 23:44:46 +0000
Message-ID: <9eb2dc2a-c70b-4edd-b372-d4ec8753e275@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781912678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDjN+tRuIyMxcjQBYzfqmoHMzOg92k59uplUcNU5q8U=;
	b=uf6DexppIoKgZK+YOC8rvA+af2LXZ+X/Qx8imTz0AgeaaUJFqiW0t4I8D1O8lAm7DuXjw3
	4JN2TDG8U+Dw6tiBdc1L5hUWmfgogwRYD/+sLL5E5gq7u/g4300PLgeYpu7UmuVOiIBf0L
	rh0qaYMO6pLhRnS2wcpQc/7ij6A/bqE=
Date: Fri, 19 Jun 2026 16:44:34 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 08/21] RISC-V: Add Ssccfg/Smcdeleg ISA extension
 definition and parsing
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-perf-users@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260608-counter_delegation-v6-8-285b72ed65a9@meta.com>
 <20260609061405.1943F1F00893@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260609061405.1943F1F00893@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_164444_960686_397D83A5 
X-CRM114-Status: GOOD (  15.55  )
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


On 6/8/26 11:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Supervisor extension Ssccfg incorrectly depends on Machine extension Smcdeleg, breaking virtualization.
> - [Medium] The Smcdeleg extension validation incorrectly checks for the Supervisor-level CSR indirection extension (SSCSRIND) instead of the Machine-level one (SMCSRIND).
> --
>
> commit 53e139b078ec8b41f58b09bfd3d37e7132a15d45
> Author: Atish Patra <atishp@rivosinc.com>
>
>      RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
>
> This commit adds definitions and parsing logic for the RISC-V Ssccfg
> and Smcdeleg ISA extensions. It introduces validation functions for
> both extensions and adds them to the riscv_isa_ext array.

+linux-riscv

Sashiko probably has a bug where it did not determine correctly which 
mailing lists to cc and left linux-riscv.

>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 1452521d740a6..1fe647e035157 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -330,6 +330,27 @@ static const unsigned int riscv_a_exts[] = {
>>   	RISCV_ISA_EXT_ZKNE,	\
>>   	RISCV_ISA_EXT_ZKNH
>>   
>> +static int riscv_ext_smcdeleg_validate(const struct riscv_isa_ext_data *data,
>> +				       const unsigned long *isa_bitmap)
>> +{
>> +	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SSCSRIND) &&
>                                                          ^^^^^^^^^^^^^^^^^^^^^^
> [Severity: Medium]
> Since Smcdeleg is a Machine-mode extension, shouldn't its validation depend on
> the Machine-level CSR indirect access extension (SMCSRIND) rather than the
> Supervisor-level extension (SSCSRIND)?

The reason for this dependency is that both Smcdeleg and SSCSRIND are 
required for using counter
delegation usage in S-mode.


> If the kernel runs in M-mode, or on hardware that implements SMCSRIND but not
> SSCSRIND, this validation might incorrectly fail.
Not a valid use.
>> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZIHPM) &&
>> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZICNTR))
>> +		return 0;
>> +
>> +	return -EPROBE_DEFER;
>> +}
>> +
>> +static int riscv_ext_ssccfg_validate(const struct riscv_isa_ext_data *data,
>> +				     const unsigned long *isa_bitmap)
>> +{
>> +	if (!riscv_ext_smcdeleg_validate(data, isa_bitmap) &&
>> +	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SMCDELEG))
> [Severity: High]
> Does this break supervisor counter delegation in virtualized environments?
>
> Smcdeleg is a Machine-mode extension, and hypervisors typically do not expose
> M-mode extensions to guest VMs. A guest kernel running in VS-mode won't see
> Smcdeleg in its ISA string, causing this validation to unconditionally fail
> and return -EPROBE_DEFER.
>
> Should Ssccfg validation only depend on S-mode visible extensions?

No. The spec is not designed that way. Counter delegation is not 
available in VS-mode.

Both comments are N/A

>> +		return 0;
>> +
>> +	return -EPROBE_DEFER;
>> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
