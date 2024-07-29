Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E1EC3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 18:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIRzWcI+HeJVA/Y6/s/Yol1XM4KMKd/4UX5weXLko7A=; b=Qbexau3iDV23pb
	cFlcAM2b7NNG+l9i2+xDpt4PqJ2UX6cb+GjoCt6epOSVDi0/NTGG8o92EnqhmNGEhI5WsObE46ubi
	rHqsLkmF8gUqueb0d6Dgb8GAFB08RcwegpPnEAK28979lY3zK7S3Hw4aD4JqoigO/DAIu3MkTNtch
	HRA14VnX/jASp6aa7j3y/bOv2IBbe4AN249CYzU4lWAEIN+jKizZimfQ4KwZBFEN5oWBXhjwxBiwk
	wKQGaxuZIEVl63bCnKMEGiH4dOoRR/MFdstRRnKQ4h9EsnXHqRYe247oB6rorAOY05Uv1CCkV4cwr
	yPc67oJInXmePM3URxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUw9-0000000CK7Z-079n;
	Mon, 29 Jul 2024 18:17:33 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYUw5-0000000CK6k-1WjS
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 18:17:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 299FFC0004;
	Mon, 29 Jul 2024 18:17:23 +0000 (UTC)
Message-ID: <1bc5172b-6f86-4a13-a664-755c82cfa37b@ghiti.fr>
Date: Mon, 29 Jul 2024 20:17:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: perf: riscv: Fix selecting counters in legacy mode
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, dmitry.shifrin@syntacore.com
Cc: linux-riscv@lists.infradead.org
References: <20240729180554.1711718-1-atishp@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240729180554.1711718-1-atishp@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_111729_579275_5A37BB0A 
X-CRM114-Status: GOOD (  15.93  )
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

Hi Dmitry,

On 29/07/2024 20:05, Atish Patra wrote:
>> It is required to check event type before checking event config.
>> Events with the different types can have the same config.
>> This check is missed for legacy mode code
>>
>> For such perf usage:
>>      sysctl -w kernel.perf_user_access=2
>>      perf stat -e cycles,L1-dcache-loads --
>> driver will try to force both events to CYCLE counter.
>>
>> This commit implements event type check before forcing
>> events on the special counters.
>>
>> Signed-off-by: Shifrin Dmitry <dmitry.shifrin@syntacore.com>
>> ---
>>   drivers/perf/riscv_pmu_sbi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>> index 36d128ff166f..bf14ab282e11 100644
>> --- a/drivers/perf/riscv_pmu_sbi.c
>> +++ b/drivers/perf/riscv_pmu_sbi.c
>> @@ -416,7 +416,7 @@ static int pmu_sbi_ctr_get_idx(struct perf_event *event)
>>   	 * but not in the user access mode as we want to use the other counters
>>   	 * that support sampling/filtering.
>>   	 */
>> -	if (hwc->flags & PERF_EVENT_FLAG_LEGACY) {
>> +	if ((hwc->flags & PERF_EVENT_FLAG_LEGACY) && (event->attr.type == PERF_TYPE_HARDWARE)) {
>>   		if (event->attr.config == PERF_COUNT_HW_CPU_CYCLES) {
>>   			cflags |= SBI_PMU_CFG_FLAG_SKIP_MATCH;
>>   			cmask = 1;
>>
> Nice catch.
> Reviewed-by: Atish Patra <atishp@rivosinc.com>


Can you add a Fixes tag? No need to send another version, just reply 
with the corresponding tag and b4 will grab it.

Thanks!

Alex


>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
