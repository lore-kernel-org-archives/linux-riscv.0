Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D89C88E42
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wo0A8U74lbBUpe9j9Kgn+OufzoKq8OadQ3DNQesUXxI=; b=Mq4ubVqktHrgmD
	rMkRsewdIh6JsdlB0R+EygUXJIiLbgYgaZxodrMGLKoxN3J+YhqLdfa2HQnFIAnStuaXXJhH1/YAF
	DdSpF+PG0qNP0jvUXLPXCa0cFGv4J1OXO7jvPkdRsWX1mrIEck5hTztOsqVPLc4w6fUTRFRF4Dr1+
	gjiwniCm7Nk5sD+8xytLhPIFFL51ma/5r0vRVNoWLRDkvMq+vQLT/QAQe80gndnithJ42ZNg77QxO
	WRwlMXsZfVDlRWCI2HqQbGlzsu7UlGqy0fI5wjO/0XzYcVsmhaPqhro+ACULyyITJyJG38YcIvL3Z
	30rmchJ5+g0VCX4TE4/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCui-0000000Bohr-3rAU;
	Mon, 26 Jan 2026 03:05:17 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCuf-0000000BohT-3tWR
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 03:05:15 +0000
X-UUID: d2a721b4fa6311f0b0f03b4cfa9209d1-20260126
X-CID-CACHE: Type:Local,Time:202601261052+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:76fa5b22-f881-489c-a107-7241c4d0a830,IP:0,UR
	L:25,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:27
X-CID-META: VersionHash:a9d874c,CLOUDID:76b9cc944f387dac074195358d40b1b8,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:11|83|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d2a721b4fa6311f0b0f03b4cfa9209d1-20260126
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1839964530; Mon, 26 Jan 2026 11:05:09 +0800
Message-ID: <9ea5656b-2520-4057-9e4c-e4a8db947598@kylinos.cn>
Date: Mon, 26 Jan 2026 11:05:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
 <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
 <581a8707-cb16-46d9-b6b5-8fa267383318@kylinos.cn>
 <4cd1d9d1-34da-7d96-46ac-a5470cfa85c3@kernel.org>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <4cd1d9d1-34da-7d96-46ac-a5470cfa85c3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_190514_305626_E36F8331 
X-CRM114-Status: GOOD (  10.16  )
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

On 2026/1/24 16:14, Paul Walmsley wrote:
> On Thu, 15 Jan 2026, Feng Jiang wrote:
> 
>> On 2026/1/15 10:03, Paul Walmsley wrote:
>>> On Thu, 18 Dec 2025, Feng Jiang wrote:
>>>
>>>> Optimize the generic strlen implementation by using a pre-decrement
>>>> pointer. This reduces the loop body from 4 instructions to 3 and
>>>> eliminates the unconditional jump ('j').
>>>>
>>>> Old loop (4 instructions, 2 branches):
>>>>   1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b
>>>>
>>>> New loop (3 instructions, 1 branch):
>>>>   1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b
>>>>
>>>> This change improves execution efficiency and reduces branch pressure
>>>> for systems without the Zbb extension.
>>>
>>> Looks reasonable; do you have any benchmarks on hardware that you can 
>>> share?  Any reason why this patch stands alone and isn't rolled up as part 
>>> of your "optimize string function" series?
>>
>> Thanks for the feedback.
>>
>> This patch predates the rest of the series, which is why it wasn't included
>> in the 'optimize string function' rollup. At the time, I focused on correctness
>> testing and observed the improvement through rdcycle instruction counts.
>>
>> Since the series still needs further refinement and may take a longer time to
>> complete, I was hoping this standalone optimization could be considered independently.
> 
> Ok.  Queued for v6.20.
> 
> Might be worth taking a look at David's suggestions for a followup patch?
> 

Thanks for queuing this!

I am definitely planning to study David's suggestions. He has also provided a lot
of valuable feedback on my other patch series, and I will explore further improvements
for a follow-up patch.

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
