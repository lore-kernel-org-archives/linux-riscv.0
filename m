Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A366CDB466
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jun 2026 23:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6EvnMpjS5fr7ViJlQTQzk3KtSTNM0GZOs/Ki4NojrE=; b=OFO3Oa9bwRwBOW
	g1TcnQyucHGO1MN4pATOCmvdPZbVQM0bvUgvmwX7itV3/Z/anMj6R0yNshE+lOd1N8SeMj9T1fs/Z
	nTyvJyqs3m0WevxZp1mjYwiU429y4HP/RJb7UxyGgS8oZVSvSE/lYSsrsVvFMM8Qcc4dXTxXCwBGj
	dKN2r2aLF2NtohtLweIMJebcLLbuAD4IMdmDah12VxrXTMI6b/1vvc5dwgFqW+gfQnf1jFrhLvAq9
	QhC0hJCkZHij/hhh+zll65j7buZfM3pVOEPfqK+i+RguJaLuBcVWbWrXCVKT4dSawi8wY45/jwbkk
	2ilYuJ+FLNWLObQ0xsMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb4uc-00000003cYP-1ATP;
	Sat, 20 Jun 2026 23:15:42 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb4uY-00000003cXl-1xIN
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jun 2026 23:15:40 +0000
Message-ID: <bebea55d-6f39-41af-b838-22e030b2a66c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781997334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEuPlCv52nwo/gWF/w3ejVnuRDQuHOF1oyVFidnviJY=;
	b=v3wkx8vGIeU4QuFQVyrdSpesGGjauu1sXFQYpIKoVlQyF7JA3RGBhPMJkhMukyf3J/j8+n
	GFX27PN3z9+lpigeIBNUVtH/j0ymUOWJva6tpJM60MDdYEZRgC7akAjxLY71Tn5Tt1t8Wb
	iNRahysUw3rVAMjkSB/+4AJPiO7SM34=
Date: Sat, 20 Jun 2026 16:15:30 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 14/21] RISC-V: perf: Skip PMU SBI extension when not
 implemented
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-perf-users@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, linux-riscv@lists.infradead.org
References: <20260608-counter_delegation-v6-14-285b72ed65a9@meta.com>
 <20260609063329.66D801F00893@smtp.kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260609063329.66D801F00893@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_161538_739251_35C657B2 
X-CRM114-Status: GOOD (  24.79  )
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


On 6/8/26 11:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [Critical] Missing perf_pmu_unregister() on error paths leads to Use-After-Free of the pmu struct.
> - [High] Unconditional cpuhp_state_remove_instance() on an uninitialized hlist_node causes a kernel panic.
> --
>
> commit bd51c5655be0902a2fc1fd90b8d692c299e7265b
> Author: Charlie Jenkins <charlie@rivosinc.com>
>
> RISC-V: perf: Skip PMU SBI extension when not implemented
>
> When the PMU SBI extension is not implemented, sbi_v2_available should
> not be set to true. The SBI implementation for counter config matching
> and firmware counter read  should also be skipped when the SBI extension
> is not implemented.
+linux-riscv
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 1f16df9d0dd00..5bfcd3821f572 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
> [ ... ]
>> @@ -2045,12 +2052,13 @@ static int __init rvpmu_devinit(void)
>>   	int ret;
>>   	struct platform_device *pdev;
>>   
>> -	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
>> -	    sbi_probe_extension(SBI_EXT_PMU))
>> -		static_branch_enable(&riscv_pmu_sbi_available);
>> +	if (sbi_probe_extension(SBI_EXT_PMU)) {
>> +		if (sbi_spec_version >= sbi_mk_version(0, 3))
>> +			static_branch_enable(&riscv_pmu_sbi_available);
>> +		if (sbi_spec_version >= sbi_mk_version(2, 0))
>> +			sbi_v2_available = true;
>> +	}
>>   
>> -	if (sbi_spec_version >= sbi_mk_version(2, 0))
>> -		sbi_v2_available = true;
>>   	/*
>>   	 * We need all three extensions to be present to access the counters
>>   	 * in S-mode via Supervisor Counter delegation.
> [Severity: Critical]
> This is a pre-existing issue, but I noticed a potential use-after-free in the
> error handling path of rvpmu_device_probe() when allocating or registering
> fails after perf_pmu_register() succeeds.
>
> If an error occurs, such as pmu_sbi_snapshot_alloc() failing, the code jumps
> to out_unregister:
>
> out_unregister:
> 	riscv_pmu_destroy(pmu);
>
> out_free:
> 	kfree(pmu);
> 	return ret;
>
> However, neither the error path nor riscv_pmu_destroy() calls
> perf_pmu_unregister(&pmu->pmu).
>
> This leaves the PMU registered in the perf core subsystem while its backing
> memory is freed via kfree(). Any subsequent access to the PMU could result
> in a use-after-free.
>
> Should perf_pmu_unregister() be called during teardown to avoid memory
> corruption?

Yes. Same comment as other patches. Fixed.


> [Severity: High]
> This is a pre-existing issue, but the error teardown path in
> rvpmu_device_probe() seems to have a bug that could trigger a kernel panic.
>
> If rvpmu_device_probe() fails before successfully calling
> cpuhp_state_add_instance(), it jumps to out_unregister and calls
> riscv_pmu_destroy(pmu).
>
> Inside riscv_pmu_destroy(), it unconditionally removes the hotplug instance:
>
> static void riscv_pmu_destroy(struct riscv_pmu *pmu)
> {
> 	...
> 	cpuhp_state_remove_instance(CPUHP_AP_PERF_RISCV_STARTING, &pmu->node);
> }
>
> Because the pmu struct is allocated with kzalloc() and the node hasn't been
> added to the hotplug list yet, its hlist_node is zero-initialized.
>
> When hlist_del() is called internally by cpuhp_state_remove_instance(), it
> attempts to dereference node->pprev (which is NULL), causing a NULL pointer
> dereference.
>
> Would it be better to check if the node is actually hashed before attempting
> to remove the hotplug instance?
Fixed in v7.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
