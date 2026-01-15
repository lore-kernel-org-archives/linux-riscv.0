Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE0D3CCA7
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 03:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ghzuKuwrl3DCH0rrTSvvDHBwAwzdkMj4NNfpB1E8Ac=; b=lQvS9qForqGIbq
	GS0bUQqF69X05nhBqOMxGNVODPLxY6h+phqZgldXRD+UPIAyfk5tiFdh0+vOtktqWY4ZQK4DnNlA6
	Gup50wmTIMKCQQ2NhFT/dUaoRZsVS3lr+7BUGM1oMSbU8m3MtQqHKlWLHMKFbIlMV/rxZd7leW0g9
	3E65nehYBTgZfjiDt+Llfli2QHp/hBOHnx0J+wHGCHnILQES5TfsgLqBhFkUosDOumaFRNJ+xQ/kz
	qohxxiAOxm0c8JnqDoeH3S//MJG+etwxz28OCeG6wWhX5y04KGTNdRqz7SugO4lN21Bj47CzcOVjZ
	GZdvbvuq14GHrDOFDe6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDxi-0000000BfaK-0qaX;
	Thu, 15 Jan 2026 03:23:54 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDxW-0000000BfWp-25IF
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 03:23:53 +0000
X-UUID: 8851a17af1c111f0a38c85956e01ac42-20260115
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c0293880-8b00-4261-a334-65a3d9114a0d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:009b8ae79b83875bbcad982954435b30,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8851a17af1c111f0a38c85956e01ac42-20260115
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2035956542; Thu, 15 Jan 2026 11:23:16 +0800
Message-ID: <581a8707-cb16-46d9-b6b5-8fa267383318@kylinos.cn>
Date: Thu, 15 Jan 2026 11:23:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
To: Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
 <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_192342_848734_3AB8AFB8 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On 2026/1/15 10:03, Paul Walmsley wrote:
> On Thu, 18 Dec 2025, Feng Jiang wrote:
> 
>> Optimize the generic strlen implementation by using a pre-decrement
>> pointer. This reduces the loop body from 4 instructions to 3 and
>> eliminates the unconditional jump ('j').
>>
>> Old loop (4 instructions, 2 branches):
>>   1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b
>>
>> New loop (3 instructions, 1 branch):
>>   1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b
>>
>> This change improves execution efficiency and reduces branch pressure
>> for systems without the Zbb extension.
> 
> Looks reasonable; do you have any benchmarks on hardware that you can 
> share?  Any reason why this patch stands alone and isn't rolled up as part 
> of your "optimize string function" series?

Thanks for the feedback.

This patch predates the rest of the series, which is why it wasn't included
in the 'optimize string function' rollup. At the time, I focused on correctness
testing and observed the improvement through rdcycle instruction counts.

Since the series still needs further refinement and may take a longer time to
complete, I was hoping this standalone optimization could be considered independently.
However, I am also happy to roll it into the series if you prefer.

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
