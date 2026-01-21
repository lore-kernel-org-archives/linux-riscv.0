Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D589D262B0
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 06:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9jZKxx5wUjkOuwEg2GunvDf/HI3Ll7UnKiARQTvRP6c=; b=boU03DAT6NRvXc
	oM9cWpG9FASuUZliEMB3ycx/jYWUVbCbm3lh4WmLpmUi33d8tW29um9XNOPN0CwauMn9WsDzlHgF0
	Yx7k6zUBLp/Xa86OMWDAEdw929kJKDJd1yP7uaDvDLj0t02+aXBcEXg7ncRXNzRaWwYbvde9I+kz1
	G7kznlpD7HorcDJ99IZQauEqhyLf3L6Jl3EhuFm0RyL8ch8zO6lWUniQSsYqiMmeq2Sygit3yrWK7
	uKWCkiXRhxl2Qvo1uA4osUezsN+RxVMHPIXuB03T4F7rZOrEOCMV7eE8qZEAuRELGUXdaTD+nct1W
	KXp1OyNjuwVEb5Eg74dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRxF-00000004xcq-1Pxk;
	Wed, 21 Jan 2026 06:44:37 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRxC-00000004xb7-1r3e
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 06:44:36 +0000
X-UUID: 9ff90566f69411f0b0f03b4cfa9209d1-20260121
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9300e27d-6a01-426e-8d3d-cc5a4d7499b9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:29d47a59cb4704af44864fcde222a784,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9ff90566f69411f0b0f03b4cfa9209d1-20260121
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 981507235; Wed, 21 Jan 2026 14:44:24 +0800
Message-ID: <691a0183-6f41-4956-82da-abb69a449919@kylinos.cn>
Date: Wed, 21 Jan 2026 14:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] riscv: optimize string functions and add kunit
 tests
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, kees@kernel.org, andy@kernel.org,
 ebiggers@kernel.org, martin.petersen@oracle.com, ardb@kernel.org,
 charlie@rivosinc.com, conor.dooley@microchip.com, ajones@ventanamicro.com,
 linus.walleij@linaro.org, nathan@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20260120065852.166857-1-jiangfeng@kylinos.cn>
 <aW8whGcAR0x6FSRJ@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aW8whGcAR0x6FSRJ@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_224434_817708_78811BBB 
X-CRM114-Status: GOOD (  19.39  )
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

On 2026/1/20 15:36, Andy Shevchenko wrote:
> On Tue, Jan 20, 2026 at 02:58:44PM +0800, Feng Jiang wrote:
>> This series provides optimized implementations of strnlen(), strchr(),
>> and strrchr() for the RISC-V architecture. The strnlen implementation
>> is derived from the existing optimized strlen. For strchr and strrchr,
> 
> strchr() and strrchr()
>>> the current versions use simple byte-by-byte assembly logic, which
>> will serve as a baseline for future Zbb-based optimizations.
>>
>> The patch series is organized into three parts:
>> 1. Correctness Testing: The first three patches add KUnit test cases
>>    for strlen, strnlen, and strrchr to ensure the baseline and optimized
> 
> strlen(), strnlen(), and strrchr()

Will fix these to include parentheses consistently in the next version.

>> Performance Summary (Improvement %):
>> ---------------------------------------------------------------
>> Function  |  16 B (Short) |  512 B (Mid) |  4096 B (Long)
>> ---------------------------------------------------------------
>> strnlen   |    +64.0%     |   +346.2%    |    +410.7%
> 
> This is still suspicious.
> 

Regarding the +410% gain, it becomes clearer when looking at the inner loop of the
Zbb implementation (https://docs.riscv.org/reference/isa/unpriv/b-st-ext.html#zbb).
For a 64-bit system, the core loop uses only 5 instructions to process 8 bytes.
Note that t3 is pre-loaded with -1 (0xFFFFFFFFFFFFFFFF):

1:
    REG_L   t1, SZREG(t0)      /* Load 8 bytes */
    addi    t0, t0, SZREG      /* Advance pointer */
    orc.b   t1, t1             /* Bitwise OR-Combine: 0x00 becomes 0x00, others 0xFF */
    bgeu    t0, t4, 4f         /* Boundary check (max_len) */
    beq     t1, t3, 1b         /* If t1 == 0xFFFFFFFFFFFFFFFF (no NUL), loop */

In contrast, the generic C implementation performs byte-by-byte comparisons, which involves
significantly more loads and branches for every single byte processed. The Zbb approach is
much leaner: the orc.b instruction collapses the NUL-check for an entire 8-byte word into a
single step. By shifting from a byte-oriented loop to this hardware-accelerated word-at-a-time
logic, we drastically reduce the instruction count and branch overhead, which explains the
massive jump in TCG throughput for long strings.

Beyond the main loop, the Zbb implementation also utilizes ctz (Count Trailing Zeros)
to handle the tail and alignment. Once orc.b identifies a NUL byte within a register,
we can precisely locate its position in just two instructions:

    not     t1, t1             /* Flip bits: NUL byte (0x00) becomes 0xFF */
    ctz     t1, t1             /* Count bits before the first NUL byte */
    srli    t1, t1, 3          /* Divide by 8 to get byte offset */

In a generic C implementation, calculating this byte offset typically requires a series
of shifts, masks, or a sub-loop, which adds significant overhead. By combining orc.b and
ctz, we eliminate all branching and lookup tables for the tail-end calculation, further
contributing to the performance gains observed in the benchmarks.

>> strchr    |    +4.0%      |   +6.4%      |    +1.5%
>> strrchr   |    +6.6%      |   +2.8%      |    +0.0%

As for strchr() and strrchr(), the relatively modest improvements are because the current
versions in this series are implemented using simple byte-by-byte assembly. These primarily
gain performance by reducing function call overhead and eliminating stack frame management
compared to the generic C version.

Unlike strnlen(), they do not yet utilize Zbb extensions. I plan to introduce Zbb-optimized
versions for these functions in a future patch set, which I expect will bring performance
gains similar to what we now see with strnlen().

>> word-at-a-time logic, showing significant gains as the string length
>> increases.
> 
> Hmm... Have you tried to optimise the generic implementation to use
> word-at-a-time logic and compare?
> 

Regarding the generic implementation, even if we were to optimize the C code
to use word-at-a-time logic (the has_zero() style bit-manipulation), it still
wouldn't match the Zbb version's efficiency.

The traditional C-based word-level detection requires a sequence of arithmetic
operations to identify NUL bytes. In contrast, the RISC-V orc.b instruction
collapses this entire check into a single hardware cycle. I've focused on this
architectural approach to fully leverage these specific Zbb features, which
provides a level of instruction density that generic C math cannot achieve.

>> For strchr and strrchr, the handwritten assembly reduces
> 
> strchr() and strrchr()
> 
>> fixed overhead by eliminating stack frame management. The gain is most
>> prominent on short strings (1-16B) where function call overhead dominates,
>> while the performance converges with the C implementation for longer
>> strings in the TCG environment.
> 

Thanks for your detailed review!

-- 
With Best Regards,
Feng Jiang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
