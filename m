Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACF1C07E9C
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 08:54:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7F261C84
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 08:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7F261C84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KlYytK78KG0thOE5nQDivrHVUqQ42ixPPODjWv+R6HE=; b=dHkerdkWfN7A4rpCOYY05FqjrE
	BGUYkbPsHbMAnZP1JJ8k88T7GK5PoTKtKYe1wAboGy2RXzheRLlSwxQlm08paF9DuQwknOA82lA7S
	BRvNJv1ImZykDTx7sgm3MiJK29TkbzB1i8WS+IwPTGryeNib56Sp7pn3ilmAZ4TK0v1Ui6zMtM4fh
	mJOd3rNEO3//5kWPHAms1U4Ww8UJxmvQoP9FB060XeL+YvwsNIttwlcDvQ53vsjXHD9+91PuXB+UB
	27y+zoSkgOizpiNpWoKt7MGGYEoSFUKSreLMjLpXU8hJGbKMP+q7PUPeSTvDRQLKT+/7dDsdBGUCQ
	REutNqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Pmv-00GMan-HT; Thu, 08 Jul 2021 08:53:41 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Pms-00GMZO-H8; Thu, 08 Jul 2021 08:53:39 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10038"; a="196745814"
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="196745814"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 01:53:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,222,1620716400"; d="scan'208";a="487473996"
Received: from lingshan-mobl5.ccr.corp.intel.com (HELO [10.249.171.108])
 ([10.249.171.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2021 01:53:28 -0700
Subject: Re: [PATCH V7 01/18] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
To: Peter Zijlstra <peterz@infradead.org>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Cc: pbonzini@redhat.com, bp@alien8.de, seanjc@google.com,
 vkuznets@redhat.com, wanpengli@tencent.com, jmattson@google.com,
 joro@8bytes.org, weijiang.yang@intel.com, kan.liang@linux.intel.com,
 ak@linux.intel.com, wei.w.wang@intel.com, eranian@google.com,
 liuxiangdong5@huawei.com, linux-kernel@vger.kernel.org, x86@kernel.org,
 kvm@vger.kernel.org, like.xu.linux@gmail.com,
 Like Xu <like.xu@linux.intel.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org,
 xen-devel@lists.xenproject.org
References: <20210622094306.8336-1-lingshan.zhu@intel.com>
 <20210622094306.8336-2-lingshan.zhu@intel.com>
 <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
From: Zhu Lingshan <lingshan.zhu@linux.intel.com>
Message-ID: <82ae3758-6b99-dc43-9515-fabb2b036f3b@linux.intel.com>
Date: Thu, 8 Jul 2021 16:53:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YN722HIrzc6Z2+oD@hirez.programming.kicks-ass.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_015338_660349_5EC0E112 
X-CRM114-Status: GOOD (  10.33  )
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



On 7/2/2021 7:22 PM, Peter Zijlstra wrote:
> On Tue, Jun 22, 2021 at 05:42:49PM +0800, Zhu Lingshan wrote:
>> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
>> index 8f71dd72ef95..c71af4cfba9b 100644
>> --- a/arch/x86/events/core.c
>> +++ b/arch/x86/events/core.c
>> @@ -90,6 +90,27 @@ DEFINE_STATIC_CALL_NULL(x86_pmu_pebs_aliases, *x86_pmu.pebs_aliases);
>>    */
>>   DEFINE_STATIC_CALL_RET0(x86_pmu_guest_get_msrs, *x86_pmu.guest_get_msrs);
>>   
>> +DEFINE_STATIC_CALL_RET0(x86_guest_state, *(perf_guest_cbs->state));
>> +DEFINE_STATIC_CALL_RET0(x86_guest_get_ip, *(perf_guest_cbs->get_ip));
>> +DEFINE_STATIC_CALL_RET0(x86_guest_handle_intel_pt_intr, *(perf_guest_cbs->handle_intel_pt_intr));
>> +
>> +void arch_perf_update_guest_cbs(void)
>> +{
>> +	static_call_update(x86_guest_state, (void *)&__static_call_return0);
>> +	static_call_update(x86_guest_get_ip, (void *)&__static_call_return0);
>> +	static_call_update(x86_guest_handle_intel_pt_intr, (void *)&__static_call_return0);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->state)
>> +		static_call_update(x86_guest_state, perf_guest_cbs->state);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->get_ip)
>> +		static_call_update(x86_guest_get_ip, perf_guest_cbs->get_ip);
>> +
>> +	if (perf_guest_cbs && perf_guest_cbs->handle_intel_pt_intr)
>> +		static_call_update(x86_guest_handle_intel_pt_intr,
>> +				   perf_guest_cbs->handle_intel_pt_intr);
>> +}
> Coding style wants { } on that last if().
will fix these coding style issues in V8

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
