Return-Path: <SRS0=OGj8=Q7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF9CC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Feb 2019 00:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D7520855
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Feb 2019 00:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngfBrudz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="SrXdo9bC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D7520855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p6S95XOTTT36cm/Vqqu0PGCl8/keIIICye79qz+9hNU=; b=ngfBrudzhA/JvQKah1ezBb6Q8
	rnSADq7aTaOTvqU2/igJz7dZ2xq60R5wmhWU2GJGecYshDDJ56H83whWSFmZne1IyHIUwo+A4BNTl
	fSSfY38L0W4OBBybX4T9785tHD6BP+QPzcM6psomfjudeLu9ycScMF9Dqa9mCDqw9a8S5pPrRkCZn
	NtASs3D1TzGTV/Ifj43cL+cQJ7hSqFG84Nt9I4NQyzq+11krrq0OkAmHet2maEjN4fucXzQ+UaCsm
	qv1byOHft6swB+RaTps7oFsmdcrqwJn2tgszrtPs5dN85ACuiafYlXxG0T8VES0S/0RVW0qMDh7R8
	boWi99Ofg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxhMJ-00035f-Vk; Sun, 24 Feb 2019 00:09:31 +0000
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxhMG-00035L-Nz
 for linux-riscv@lists.infradead.org; Sun, 24 Feb 2019 00:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1550966963; bh=cI7bK0FtxSZb5Soe4SuTP5p51muUaiinXdMdrAjrZs4=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=SrXdo9bC6U4zRS7UxcGDpu5Uwva9v/6wBsdwIoAsWD3yeSxaIxbcThVL+3WzdVLt5
 Mqe29W0oLcJNPAZMKU0ueECObJ09lVgWV4GZFup/PpnsPdpHlDPUo4NuQrJOxjhe7O
 9tFJXXSjQBJB8h1pY1FpKOkbD2S3EmzPL+E1LwAsTqrAb9wh5VW7Jx7VKEDT1It2aN
 5A2J4NrEaATI+YS6r1hcuQK++Fc9EuHCDacLI6etyZBLMGWz71t3S/1kvZjDGVLdqL
 EnsgmIDsXTlTNKfrobgYibfIzUaOdXQVYH5HvtmE7apdhq40807bKNOqYbsFn39Z/d
 y+v7GJdIn3yWw==
Received: from [192.168.0.18] (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 3C8B44A00C8;
 Sun, 24 Feb 2019 00:09:22 +0000 (UTC)
Subject: Re: [PATCH 3/3] MIPS: fix truncation in __cmpxchg_small for short
 values
To: Paul Burton <paul.burton@mips.com>, Jonas Gorski <jonas.gorski@gmail.com>
References: <20190211043829.30096-1-michaeljclark@mac.com>
 <20190211043829.30096-4-michaeljclark@mac.com>
 <CAOiHx==dx10No8AO-5OP8BcuNbfnQdgVG2TiMkjz=Svqd0uKDg@mail.gmail.com>
 <20190211202023.rch4duvcctyspvxe@pburton-laptop>
From: Michael Clark <michaeljclark@mac.com>
Message-ID: <f44161a1-a8cf-0d95-2da5-af062833491d@mac.com>
Date: Sun, 24 Feb 2019 13:09:19 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190211202023.rch4duvcctyspvxe@pburton-laptop>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-23_17:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902240000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_160928_806239_10CE4A7E 
X-CRM114-Status: GOOD (  28.17  )
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
Cc: RISC-V Patches <patches@groups.riscv.org>,
 Linux RISC-V <linux-riscv@lists.infradead.org>,
 Andrew Waterman <andrew@sifive.com>, Linux MIPS <linux-mips@linux-mips.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Paul,

On 12/02/19 9:20 AM, Paul Burton wrote:
> Hello,
> 
> On Mon, Feb 11, 2019 at 01:37:08PM +0100, Jonas Gorski wrote:
>> On Mon, 11 Feb 2019 at 05:39, Michael Clark <michaeljclark@mac.com> wrote:
>>> diff --git a/arch/mips/kernel/cmpxchg.c b/arch/mips/kernel/cmpxchg.c
>>> index 0b9535bc2c53..1169958fd748 100644
>>> --- a/arch/mips/kernel/cmpxchg.c
>>> +++ b/arch/mips/kernel/cmpxchg.c
>>> @@ -57,7 +57,7 @@ unsigned long __cmpxchg_small(volatile void *ptr, unsigned long old,
>>>          u32 mask, old32, new32, load32;
>>>          volatile u32 *ptr32;
>>>          unsigned int shift;
>>> -       u8 load;
>>> +       u32 load;
>>
>> There already is a u32 line above, so maybe move it there.
>>
>> Also reading the code to understand this, isn't the old code broken
>> for cmpxchg_small calls for 16-bit variables, where old is > 0xff?
>>
>> because it does later
>>
>>          /*
>>           * Ensure the byte we want to exchange matches the expected
>>           * old value, and if not then bail.
>>           */
>>          load = (load32 & mask) >> shift;
>>          if (load != old)
>>              return load;
>>
>> and if load is a u8, it can never be old if old contains a larger
>> value than what can fit in a u8.
>>
>> After re-reading your commit log, it seems you say something similar,
>> but it wasn't quite obvious for me that this means the function is
>> basically broken for short values where the old value does not fit in
>> u8.
>>
>> So this should have an appropriate "Fixes:" tag. And Cc: stable. Seems
>> like quite a serious issue to me.

Okay. I was pretty sure it was a bug but I am not sure about the 
conventions for Linux fixes.

> It could be serious if used, though in practice this support was added
> to support qrwlock which only really needed 8-bit support at the time.
> Since then commit d13316614633 ("locking/qrwlock: Prevent slowpath
> writers getting held up by fastpath") removed even that.

Yes. I suspected it was a latent bug. Truncating shorts in compare and 
swap would could show up with unusual values.

> But still, yes it's clearly a nasty little bug if anyone does try to use
> a 16-bit cmpxchg() & I've marked it for stable backport whilst applying.
> 
> Thanks for fixing this Michael :)

Appreciated. Yes. Thanks for taking the time to verify it, although it 
is quite an obvious fix it could be a big time suck if one encountered 
it in the wild as one wouldn't expect a broken intrinsic.

Sorry for the lag in replying. At the time it appeared somewhat like 
throwing text plus code over the fence, as part of discovery for a 
submission regarding RISC-V atomics. I had full intention of circling 
back, just that I am not good with many small emails.

This has prompted me to revise a fair spinlock implementation (that fits 
into 32-bits)


.. RISC-V tangent...

Related by parent thread. I was looking into ticket spin locks for 
threads on bare metal, which prompted this patch in the first place.

While the Linux asm-generic ticket spinlock is fair; LR/SC for small 
word atomics requires significantly more instructions, thus has a cycle 
penalty for fairness vs amo.add. The problem, however, on RISC-V is that 
a fair spinlock using amo.add for head and tail would need to be 64-bits 
in size due to the 32-bit minimum atomic width for atomic ops. For one 
per CPU structure on a large system, this is significant memory.

A compromise on code size and compactness of structure, would be 
amoadd.w of 0x0001_0000 for head acquire and LR/SC for tail release. I 
chose 2^16 because 255 cores seems a bit small present day given folk 
are fitting more than a thousand RISC-V cores on an FPGA, and one 
assumes 4096 is quite plausible. Anyhow, here is a 32-bit ticket 
spinlock with support for 65,535 cores (needs verification):

spin_lock:
     lui     a2,0x10
     amoadd.w a5,a5,(a0)
     srliw   a4,a5,0x10
2:  slliw   a5,a5,0x10
     srliw   a5,a5,0x10
     bne     a5,a4,3f
     ret
3:  lw      a5,0(a0)
     fence   r,rw
     j       2b

spin_trylock:
     lui     a5,0x10
     lr.w.aq a4,(a0)
     addw    a5,a5,a4
     slliw   a3,a5,0x10
     srliw   a3,a3,0x10
     srliw   a4,a5,0x10
     beq     a3,a4,2f
1:  li      a0,0
     ret
2:  sc.w.rl a4,a5,(a0)
     bnez    a4,1b
     fence   r,rw
     li      a0,1
     ret

spin_unlock:
     fence   rw,w
1:  lr.w.aq a4,(a0)
     srliw   a5,a4,0x10
     addiw   a4,a4,1
     slliw   a4,a4,0x10
     srliw   a4,a4,0x10
     slliw   a5,a5,0x10
     or      a5,a5,a4
     sc.w.rl a4,a5,(a0)
     bnez    a5,1b
     ret

We could keep the current simple (but unfair) spinlock. I do suspect 
unfairness will not scale so whatever is done, it may end up needing to 
be a config option. I actually am fond of the idea of a RISC-V Atomic 
Extension V2 in RISC-V V3.0 or V4.0 with 48-bit instructions. A 6-byte 
instruction would be quite a nice compromise.

It seems that the hybrid approach (above) using amoadd.w for the head, 
i.e. fast ticket number acquisition followed by spin is logical. This 
balances the code size penalty for lock/unlock when trying to fit a 
scalable ticket spinlock into 32-bits If one swaps head and tail, then 
lock acquisition has a high cost and lock release becomes trivial, which 
seems wrong. spin_trylock necessarily must use LR/SC as it needs to 
conditionally acquire a ticket.

This is actually RISC-V generic so I probably should post it somewhere 
where folk are interested in RISC-V software. I think if we come up with 
simple lock, it should be usable in BSD or Linux GPL, so consider any of 
these fragments as public domain. Verification is assumed to be applied. 
The previous patches where tested in QEMU, but this asm is part compiler 
emitted and part hand-coded (compiler is not yet smart enough to avoid 
illegal branches as it doesn't parse LR/SC - that's possibly an arm 
issue also i.e. other RISC; so just sharing thoughts...).

Michael.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
