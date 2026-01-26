Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B2C88E40
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 02:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MjvS9wbGPdzWV6aM3apvWG15Bv+P98cDrvfcKEQNNYs=; b=URvGZ3pRoe02rh
	vIR53/8wuZ1Or+GSFEYkEGxB2phyyOrteTIfLB8WETicX62JZUtfQ2gvBLMobl3WYA1WRBQYS9FL0
	cryO9ZlZsD6/qNAs+mX2ItTDeRvE9bc0YEOywBEB3+xkXuNQRmJ4C3C6giMlC0bKUmDeJonZ0owPL
	dxa4HQhZV1YxpLz+9soJq563YTo3b1QH2Sxrbh6Oumekiq1u11iqREz+EnYIyew/8AacgXzn4R7RS
	tffolR3cux1eRVD3HMMpVEhr6YxxYKVogiK/ehc6mCMYVG7puvWbh0Qcfh0DoYUatygUnTXaQdWRr
	opnd2ZQc5kWJWspSeqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCj0-0000000BoK1-36X3;
	Mon, 26 Jan 2026 02:53:10 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkCix-0000000BoIx-1apT
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 02:53:09 +0000
X-UUID: 1e735ca4fa6211f0b0f03b4cfa9209d1-20260126
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:39e3a1e6-b7ba-4cd7-9118-228dc24b1945,IP:0,UR
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
X-UUID: 1e735ca4fa6211f0b0f03b4cfa9209d1-20260126
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2022401848; Mon, 26 Jan 2026 10:52:57 +0800
Message-ID: <b70068c3-3b92-4c90-a439-d3f8582953e8@kylinos.cn>
Date: Mon, 26 Jan 2026 10:52:54 +0800
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
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <20260115184619.574f1b36@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_185307_730663_E10354BB 
X-CRM114-Status: GOOD (  24.24  )
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

On 2026/1/16 02:46, David Laight wrote:
> On Thu, 15 Jan 2026 11:19:47 +0000
> David Laight <david.laight.linux@gmail.com> wrote:
> 
>> For 64bit you can do a lot better (in C) by loading 64bit words and doing
>> the correct 'shift and mask' sequence to detect a zero byte.
>> It usually isn't worth in for 32bit.
>>
>> Does need to handle a mis-aligned base - eg by masking the bits off
>> the base pointer and or'ing in non-zero values to the value read from
>> the base pointer.
>>
>> 	David
> 
> The version below seems to work https://www.godbolt.org/z/sME3Ts6vW
> It actually looks ok for x86-32, the loop is 8 instructions plus the branch
> but the 'register dependency chain' is only 4 instructions.
> So maybe better than byte compares for moderate to long strings.
> (Especially if the cpu starts speculatively executing the next loop
> iteration.)
> 
> The OPTIMIZER_HIDE_VAR() helps a lot on (eg) MIPS-64 and a bit elsewhere
> since most 64bit cpu can't load 64bit immediates.
> 
> I can't get gcc and clang to reliably have a loop with a conditional
> jump at the bottom, especially with an unconditional jump into the
> loop (to remove the '| mask' from the loop body).
> 
> Also KASAN (or one of its friends) wont like the code reading entire
> words that hold the string.
> 
> And it does need ffs/clz instructions - or a different loop bottom.
> (For BE one with clzl() returning 0 will work.) 
> 
> While I suspect the per-byte cost is 'two bytes/clock' on x86-64
> the fixed cost may move the break-even point above the length of the
> average strlen() in the kernel.
> Of course, x86 probably falls back to 'rep scasb' at (maybe)
> (40 + 2n) clocks for 'n' bytes.
> A carefully written slightly unrolled asm loop might manage one
> byte per clock!
> I could spend weeks benchmarking different versions.
> 
> 	David
> 
> #define OPTIMIZER_HIDE_VAR(var)                                         \
>         __asm__ ("" : "=r" (var) : "0" (var))
> 
> /* Set BE to test big-endian on little-endian.
>  * For real BE either do a byteswapping read or use the BE code. */
> #ifdef BE
> #define SWP(x) __builtin_bswap64(x)
> #define SHIFT <<
> #else
> #define SWP(x) (x)
> #define SHIFT >>
> #endif
> 
> unsigned long my_strlen(const char *s)
> {
>         unsigned int off = (unsigned long)s % sizeof (long);
>         const unsigned long *p = (void *)(s - off);
>         unsigned long val;
>         unsigned long mask;
>         unsigned long ones = 0x01010101;
>         /* Force the compiler to generate the related constants sanely. */
>         OPTIMIZER_HIDE_VAR(ones);
>         ones |= ones << 16 << 16;
> 
>         mask = ((~0ul SHIFT 8) SHIFT 8 * (sizeof (long) - 1 - off));
>         do {
>                 val = SWP(*p++) | mask;
>                 mask = (val - ones) & ~val & ones << 7;
>         } while (!mask);
> 
> #ifdef BE
>         off = __builtin_clzl(mask);
>         /* Correct for "...\x01" */
>         val <<= off;
>         for (off /= 8; val > (~0ul >> 8); off++)
>                 val <<= 8;
> #else
>         off = (__builtin_ffsl(mask) - 1)/8;
> #endif
> 
>         return (const char *)(p - 1) + off - s;
> }

Thank you very much for your detailed explanation and the insightful examples!

Your explanation of instruction cycles and performance trade-offs has been very
enlightening. As I mentioned in my other patch series, I really appreciate the
technical depth you've shared. I will definitely spend some time studying this
area further to better understand these performance trade-offs and see if I can
contribute more meaningful improvements in the future.

Thanks again for your time and for sharing your expertise!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
