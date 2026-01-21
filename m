Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF510D262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 05:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLhHlrofP+dnHWxtbIstriC9PySXl6s/6xRZDMEvzJo=; b=GRYEApMPT2oefj
	9YW2dRmt2UeC1LOAFbr3eOl2hEjpz7X2MARNJ9zcehFGTf0CvEszgcrspHwQ4jF0FChCSFFoP6gUz
	qM8egEAWlVEH7XeZis21EezM4QivCrguT2Hrv0j1ZSSLjubNcpkE2ND0C4EdFxNdXv58KKRbprTx0
	PltWom1nUag3w4j95Ezim5f+6PPdmjSjc3g+0Ud0tG1p4cX1cuxk+TZJx3/+3ubo22mWv0YSxncY2
	IPUq/sMQKcx40zxEgQgSGst0evWLYcmV43R9pOxW7nGZfUJgeCrzBcmIEL9H6xbX3IsUA8X6lOcRI
	MDIf90CVKwLfzyTIdkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR90-00000004vJv-42Rk;
	Wed, 21 Jan 2026 05:52:42 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viR8y-00000004vJO-1Vnt
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 05:52:41 +0000
X-UUID: 61b115fcf68d11f0b0f03b4cfa9209d1-20260121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:bc083bb8-9c77-412a-b909-18ca58310964,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:63a34cbd99b4ddb04cc076fcc54cf188,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 61b115fcf68d11f0b0f03b4cfa9209d1-20260121
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1532687992; Wed, 21 Jan 2026 13:52:33 +0800
Message-ID: <9fc6472c-b9c1-4535-b351-575604cf7ab1@kylinos.cn>
Date: Wed, 21 Jan 2026 13:52:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] riscv: lib: add strnlen implementation
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, Joel Stanley <joel@jms.id.au>
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <20260120065852.166857-7-jiangfeng@kylinos.cn>
 <aW8vTc4mieqmJKhE@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aW8vTc4mieqmJKhE@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_215240_764436_D4679F9A 
X-CRM114-Status: UNSURE (   8.53  )
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

On 2026/1/20 15:31, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 02:58:50PM +0800, Feng Jiang wrote:
>> Add an optimized strnlen() implementation for RISC-V. This version
>> includes a generic word-at-a-time optimization and a Zbb-powered
>> optimization using the 'orc.b' instruction, derived from the strlen
>> implementation.
>>
>> Benchmark results (QEMU TCG, rv64):
>>   Length | Original (MB/s) | Optimized (MB/s) | Improvement
>>   -------|-----------------|------------------|------------
>>   16 B   | 189             | 310              | +64.0%
>>   512 B  | 344             | 1535             | +346.2%
>>   4096 B | 363             | 1854             | +410.7%
> 
>> Suggested-by: Andy Shevchenko <andy@kernel.org>
> 
> Wrong tag, I have zero knowledge about RISC V.
> 

Sorry for the confusion. I misunderstood the scope of the 'Suggested-by' tag.
I will remove it from the RISC-V specific implementation patches and only keep
relevant credits in the benchmarking/testing patches where your feedback was
applied. 

Thanks for clarifying!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
