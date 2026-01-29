Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D9BD358E2
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAHrClDizl54adTklSgSPOPouhtx19VkJDi94JGl+DQ=; b=e6xGhO7AkXzbmi
	rKASv5UQQ9mr19C55nBS3DJhYuCxPV5kweBjUFDbUVgeUa5MW7ezxDDJVWg8N7UjeIZlH/x6Wabj7
	MWS4KQggkz/3SEwEyA3gjmJrEMsfTrc76iYsiQe+6Ll6e34bwvi7zUuVS0sWURcZ7gb7EhmNmL51p
	WbSZCcTzrczL6/XaYzN6HMqMT05h8+Oltj6jNEceiPu93K8JsawtshSux9bZaBbosrdI1+g/bdzdB
	xcuL5kizmwnHFPmdH2k/zyZnZfRO2baUx7zMH4nE4tdCZIzzzRb+8zRVHMlgTYjc2mTo1XhuLaLD/
	3AMURMtATjz2lDHZg+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNUE-0000000HSiz-1vWh;
	Thu, 29 Jan 2026 08:34:46 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNUB-0000000HSiV-2MV3
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 08:34:45 +0000
X-UUID: 57c13d72fced11f0b0f03b4cfa9209d1-20260129
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4fc7b80f-8f80-489f-8ab3-5295ae242c11,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:3531dc6fd8fae498bf0de9d072b5ff27,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 57c13d72fced11f0b0f03b4cfa9209d1-20260129
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 507413903; Thu, 29 Jan 2026 16:34:35 +0800
Message-ID: <04b07f3a-ef18-4662-8529-203348ad3b29@kylinos.cn>
Date: Thu, 29 Jan 2026 16:34:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
To: David Laight <david.laight.linux@gmail.com>,
 Paul Walmsley <pjw@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 samuel.holland@sifive.com, charlie@rivosinc.com, conor.dooley@microchip.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
 <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
 <20260115111947.54929ed0@pumpkin> <20260115184619.574f1b36@pumpkin>
 <20260128185904.5ec5c24e@pumpkin>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260128185904.5ec5c24e@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_003443_920362_8E66A433 
X-CRM114-Status: GOOD (  22.22  )
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

On 2026/1/29 02:59, David Laight wrote:
> On Thu, 15 Jan 2026 18:46:19 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
> ... 
>> While I suspect the per-byte cost is 'two bytes/clock' on x86-64
>> the fixed cost may move the break-even point above the length of the
>> average strlen() in the kernel.
>> Of course, x86 probably falls back to 'rep scasb' at (maybe)
>> (40 + 2n) clocks for 'n' bytes.
>> A carefully written slightly unrolled asm loop might manage one
>> byte per clock!
>> I could spend weeks benchmarking different versions.
> 
> I've spent a quick half-hour...
> 
> On my zen-5 in userspace:
> 
> glibc's strlen() is showing the same fixed cost (50 clocks including overhead)
> for sizes below (about) 100 bytes, for big buffers add 1 clock for ~50 bytes.
> It must be using some simd instructions.
> 
> A simple:
> 	len = 0; while (s[len]) len++; return len;
> loop is about 1 byte/clock, overhead ~25 clocks (probably the mostly one 'rdpmc'
> instruction).
> (Needs a barrier() to stop gcc converting it to a libc call.)
> 
> Unrolling the loop once:
> 	for (len = 0; s[len]; len += 2)
> 		if (!s[len + 1] return len + 1;
> 	return len;
> actually runs twice as fast - so 2 bytes/clock.
> 
> Unrolling 4 times doesn't help, suddenly goes somewhat slower somewhere
> between 128 and 256 bytes (to 1.5 bytes/clock).
> 
> The C 'longs' loop has an overhead of ~45 clocks and does 6 bytes/clock.
> So the is better for buffers longer than 64 bytes.
> 
> The 'elephant in the room' is 'repne scasb'.
> The fixed cost is some 150 clocks and the cost 3 clocks/byte.
> 
> I don't think any of the Intel cpu I have will do a 'one clock loop'.
> I certainly failed to get one in the past when there was a data-dependency
> between the iterations.
> 
> But I don't have anything modern (newest is an i7-7xxx) and I don't have
> any old amd ones.
> I needs to get a zen-1 (or 1a) and one of the Intel system that should be
> cheap because they won't run win-11.

Thank you very much for sharing these detailed test results and your in-depth
analysis. It is truly helpful and inspiring to see how different loop strategies
perform on the wire.

My current priority is the RISC-V patch series. Once this is done, I'd love to
follow up and explore potential improvements for the generic C implementation.

While I don't have many x86 machines at hand either, I do have access to some
ARM64 and LoongArch hardware. I think I can also perform tests and observations
on these platforms later.

Thanks again for the great discussion!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
