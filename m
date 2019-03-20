Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C0C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A19420835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:29:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKibLzCZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="IlP/k4xp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A19420835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TQ/QUurgaQSVWOtxbDswfCjwiK3kXpXlaFvOIHSDoco=; b=UKibLzCZHL/Iimk5EzDBHo+uk
	jmgxI6m0PcHwwNGZg24bboMXU2HEIvZ4+jzgJ71UfqGr2rjTgsAZj11FgHF9F+cnKxHLAozu+ZhDh
	z0hc50xKmlx8vp/ue06Kanb9zA6e0GZhYVFKJQROSj7pCElDh2r/s+RJzrGHNAS/1yIYXkSyLnIEo
	V9pzU2dOE3bj+cyI+hh673SkUH4SObwHHbFF6+wOiZNZRbCth/2rrU3Eyv9Z30OBYOOLfHwS9VoUp
	VcSrbyILo8Ji3trD+Abw8RUJXjRsld9rGiUqL65g4ExURDR4qBxCnPSitkUiWL7/OHetvlpwV/dHB
	TQd1/YPpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Q2q-0005fA-4m; Wed, 20 Mar 2019 01:29:28 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Q2n-0005em-KG
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045366; x=1584581366;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=E38eZeQ9viQA5lcPyg6T8ZDnldIgV4Gx/PClWhyMd1Y=;
 b=IlP/k4xp2tB+qtzrQwKgSmVhIWZfUe18orTmDPtiq0TBlAnTkiya7ZX2
 foZ+JV+DnYePoWhAd1uYzRywUxWUYxfKako4YdLX88WCcbU18I05s/1cE
 wxsqN0o2a+Suc63ze9vrMz/PyWBpfpK8o8ZSIi3d5/8OBgT0UX3gHAgXh
 fIOvKZJPqL50ktZzAfkgkc0TYM1QNQO+y7MOvoYWEGaQ7Mmu8k97iLc3p
 oR6IwGtGZuXB/JOHX7FO7nrUTGf5Vgbd5pmxKAGmYKM1Bg9KcDv8eS7OW
 SOl2w6HTBoSR42tj/kV9OOiQcFHPtGCarsnWcGlOIUS3L6OeU4XWw5GX0 g==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533606"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:29:24 +0800
IronPort-SDR: giWuljHoED+K/MN45MlU1RnLiQlFDsTlEln+BO6CzR6ph7nFhKSdSfaiDBfOY61LFniRLo7ARN
 qT8Mi94pi1S8l12LSmouHOZbMpWANsTGH+O/6s9Ph1OD5PeBHkQIUZkOb1oUYJyme19klayDHy
 Ax3fP0/TyxwejqZNRi67Svhdk5inxp6DL5ekpwtAnXecateACYvYI6SlJ3e/Po2N4srktXvdyC
 QWnUGOsiasqr4I1GBvt0pCLmTof8xjBlRkHRsFtF322aa6m5Ml1hfQe2xNKhKM+7VCR8rwTNaE
 9FzEPo3WhPfAxOFVrHqvsXVr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:07:01 -0700
IronPort-SDR: ehNFdQnfwd/m+YDcdOgF4/akeWcqQ3xEoATR/qDhm0CgvHERM2qSgNbKPtT1SgneCBv3gXpAlK
 0dg9EyZye1LX9w283yHtxHJQ4jePb/p2fcX/U5aJGmgAmUDpuiTeyjXv0suiDQYO8IeTYYr56M
 KTJv6mKsqJUIMlBOMPaDg+KKcVlep0E97KU2vS99NXtgN4O2G9j8BHEHK1GBNAEgXaYRNiSxk6
 yZZIuOVDGZP8s0bcranNx5mZYr3AaSvD8vRuDZRUtlOycyQirn5qKYruxh8wlVUYOqH+Un7vhx
 tYk=
Received: from c02v91rdhtd5.sdcorp.global.sandisk.com (HELO [10.111.70.138])
 ([10.111.70.138])
 by uls-op-cesaip01.wdc.com with ESMTP; 19 Mar 2019 18:29:24 -0700
Subject: Re: [v1 PATCH 4/4] RISC-V: Support nr_cpus command line option.
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20190319222028.4293-1-atish.patra@wdc.com>
 <20190319222028.4293-4-atish.patra@wdc.com>
 <BYAPR04MB5816217E1BD06F0EB68E15A7E7400@BYAPR04MB5816.namprd04.prod.outlook.com>
 <BYAPR04MB58168FE99AA058FB79A0650EE7400@BYAPR04MB5816.namprd04.prod.outlook.com>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <17dc2df7-a730-1461-2577-1a05ec27d32d@wdc.com>
Date: Tue, 19 Mar 2019 18:29:23 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB58168FE99AA058FB79A0650EE7400@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_182925_727837_BA6D822B 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Palmer Dabbelt <palmer@sifive.com>,
 Johan Hovold <johan@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Anup Patel <anup@brainfault.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 3/19/19 4:58 PM, Damien Le Moal wrote:
> On 2019/03/20 8:56, Damien Le Moal wrote:
>> On 2019/03/20 7:20, Atish Patra wrote:
>>> If nr_cpus command line option is set, maximum possible cpu should be
>>> set to that value.
>>>
>>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>>> ---
>>>   arch/riscv/kernel/smpboot.c | 10 +++++++++-
>>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>>> index 609475c5..a8fe590c 100644
>>> --- a/arch/riscv/kernel/smpboot.c
>>> +++ b/arch/riscv/kernel/smpboot.c
>>> @@ -86,11 +86,19 @@ void __init setup_smp(void)
>>>   		}
>>>   
>>>   		cpuid_to_hartid_map(cpuid) = hart;
>>> -		set_cpu_possible(cpuid, true);
>>
>> This looks weird: the code being changed does not match what patch 3/4 did.
> 
> Arg... Ignore this one. My bad. Morning here, I need more coffee :)
> 
:).

>>
>>>   		cpuid++;
>>>   	}
>>>   
>>>   	BUG_ON(!found_boot_cpu);
>>> +
>>> +	if (cpuid > nr_cpu_ids)
>>> +		pr_warn("Total number of cpus [%d] are greater than configured via nr_cpus [%d]\n",
>>
>> "The total number of cpus [%d] is greater than nr_cpus option value [%d]\n"
>>

ok. I will fix it in v2.

Regards,
Atish
>>> +			cpuid, nr_cpu_ids);
>>> +
>>> +	for (cpuid = 1; cpuid < nr_cpu_ids; cpuid++) {
>>> +		if (cpuid_to_hartid_map(cpuid) != INVALID_HARTID)
>>> +			set_cpu_possible(cpuid, true);
>>> +	}
>>>   }
>>>   
>>>   int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>>>
>>
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
