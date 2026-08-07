Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2C1C5AC7C
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBFx1PlREd4TykfXWdj0tZYyKKChEaRx5uii40nnmvU=; b=Cspk+N/X5fwRN3
	xlxS330gu+R8EGIFxUEuxk01rys+uxlONbW8bDzzcr/MyGF9sm5H+0uq9yy5Wwkj436C7myrozuFC
	0uHAsooDQ/Wg0wO5R5L5CcO+eff6saeScocezntWft4R8kWMXFpEiA7eMeb5AyJRy3kX5ApouCvin
	LL0WTvu2xrviYgRlNlt3ZCzYQPLdd5ZLuk6M3mQ4hvGXVZbrdwBWAZO+n9OYHtuij9RCl/AeWyGAz
	6RNXujTPbRavZwFVRWnXO6YmFCOZFKNrulPabE4euq2P4vitVPCDa8iFJRFAmGAFOrPX73gwFfxOp
	kuKLloMii/pRSCilqFyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFdJ-00000007KlA-1Vpf;
	Fri, 07 Aug 2026 08:08:49 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFdF-00000007KkV-2esh
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 08:08:48 +0000
Message-ID: <ba053fa1-9df5-406b-9f92-df0dcc76ff68@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786090121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=44gHspEmvf0KR3CCD0fyMRuJn7BHiloWc8UW7doqt4s=;
	b=Jwr+UX7kAQwiiXG1TAcIvVCf82bkavGLIbLqALxbiRmxwWKMnKvF0SZV8HxvKM3snsPVML
	NHIQ6RsVThbWqxQ56m94lU7vVuogY+4fUsqFWQQKtG2Lg3e6PkXNMRISzDCaZXZ7hzDPS3
	5pIcWN0rHxcwuMktbNiZjIbbMlElA4I=
Date: Fri, 7 Aug 2026 01:08:31 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery
 mechanism
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
 <178453211938.543975.7016109597042850635.b4-review@b4>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <178453211938.543975.7016109597042850635.b4-review@b4>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_010846_575434_F47ECD89 
X-CRM114-Status: GOOD (  15.82  )
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


On 7/20/26 12:21 AM, Charlie Jenkins wrote:
> On Wed, 01 Jul 2026 01:47:00 -0700, Atish Patra <atish.patra@linux.dev> wrote:
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 74d934238821..c20f1e33c65d 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
>> [ ... skip 15 lines ... ]
>> +	 * in S-mode via Supervisor Counter delegation.
>> +	 */
>> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
>> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
>> +	    riscv_isa_extension_available(NULL, SSCSRIND))
>> +		static_branch_enable(&riscv_pmu_cdeleg_available);
> This needs to not only check that smcdeleg is supported in linux, but
> also that it is supported in the SBI implementation correct? Trying to
> boot this on OpenSBI before 6bb6b61c27eb ("lib: sbi: Add support for smcsrind and
> smcdeleg") will fail on an illegal instruction in
> rvpmu_deleg_find_ctrs() while trying to access the scountinhibit csr in
> the patch "RISC-V: perf: Implement supervisor counter delegation
> support". The proper mstateen bits need to be set for this to work
> without crashing.

Yeah. We can do trap/detect to identify if smcdeleg is actually 
available but that is bit ugly.
The firmware should make sure that it doesn't advertises an ISA 
extension if that is not avaialble
to S-mode but that model only works for newer firmware.

if you are running very old firmware with new Qemu/platform, the default 
ISA extension may have
smcdeleg while older firmware may not even know about it.

In reality, I am hoping chances of that happening are rare as OpenSBI 
patches have been available
from a long time and Linux kernel patches are yet to merge. I have not 
addressed this in v9 as I am
not sure which is the best worst approach yet :)

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
