Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA1CCA5FAC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 12:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsANxZdV0bElPNKBQPXfB+Z9jgh/BJgk1XPHWfEVVKI=; b=rrHOWOC/SZKrd7
	zI/aFkJvZlRyY8yyIYLacG3hoPM0IgUxf0vx1L9VUi9HIyzUL9fmhz8+yrEpodvU4yodtPUXUcuz7
	BKy3aqlflk9vP6lOqvChRDvZSqfdu+2TIhFmOQO4L5CuHoe11OD0AZOo9At2wd4ML8iAReFMs04zP
	Ewn8PKcC31DW8imRN4/C3T5z/ETLrGteNGopL+Zb+7zgLCNhRizSJc0FDGHTh2g5smPf78pCdPrb+
	4RC8fsf7EQFSHVrFljiqOo8muWPeXjoNRmuMCghU9HORiBnC1tN0mBg8cwlYysxmo4Q6yiOZwEoxI
	ouOIb4onsgha37uTW37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtgI-0000000626B-1Wl1;
	Wed, 30 Sep 2026 12:45:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtg4-000000061oQ-0gzq
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 12:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=RhlVICFdXecndS+aWKhmHPUIYabUI6XUNNG8PYn8pmw=; b=XLhg4/ly7tkq20S33oRTd5L+gI
	bioZmzJTM0HuQAgO7IPDrsxNMPjFUdEioADdsSI+2RQnrUQS1iGZMdMDE7LkrmGsb7mM3dbt28qWn
	V5Gu/Oz3tYq+VFDQW70ekLQaL0kO0NFGw8GWBMToyd3RcwCgAFolpmWOvJ2pN1nxz+xcUZ+OFkkjc
	MRuuUHV+uHAK+gxbtbB/51q/jy9pXdmjoQxc/lXcWS9+f2swlDfCfIOC0aPzRXbLEjRX1+fPtv4tu
	R39ILzNiJaLdCLVbxIYbxhILsvwABnBzd7YfHvJzHSuu63QLz+xoP3ndVhvkFg6jnaeDIVqow9DDd
	5g/rDjrA==;
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBtg0-00000003nhC-33y3
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 12:44:50 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hvvrS4WQ0z8XrrX;
	Wed, 30 Sep 2026 20:44:40 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 68UCiWqe008576;
	Wed, 30 Sep 2026 20:44:32 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 30 Sep 2026 20:44:35 +0800 (CST)
X-Zmail-TransId: 2b056abd04331fe-2db6d
X-Mailer: Zmail v1.0
Message-ID: <20260930204435252HHqIHw0fBhdP4X3CWnK02@zte.com.cn>
Date: Wed, 30 Sep 2026 20:44:35 +0800 (CST)
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <david.laight.linux@gmail.com>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <jmontleo@redhat.com>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2M10gcmlzY3Y6IGZpeCBzdHJubGVuKCkgb3ZlcmZsb3cgaW4gWmJiIGltcGxlbWVudGF0aW9u?=
X-MAIL: mse-fl2.zte.com.cn 68UCiWqe008576
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 30 Sep 2026 20:44:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6ABD0438.000/4hvvrS4WQ0z8XrrX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_134449_223444_27EF5A13 
X-CRM114-Status: GOOD (  35.87  )
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

Hi David,

Thanks for the detailed review.

>On Wed, 30 Sep 2026 09:48:57 +0800 (CST)
><gao.rui@zte.com.cn> wrote:
>
>> riscv: fix strnlen() overflow in Zbb implementation
>> 
>> The RISC-V Zbb optimized strnlen() implementation can return incorrect
>> results when very large count values are supplied.
>> 
>> The previous implementation calculates an end address based on the
>> input pointer and count. When count is close to SIZE_MAX, the address
>> calculation may overflow, resulting in incorrect termination checks and
>> wrong return values.
>> 
>> This issue was observed while running device-mapper tests:
>> 
>> dmsetup create testname9 --table "0 8 zero"
>> cat /sys/block/dm-*/dm/name
>> dmsetup remove testname9
>> 
>> Rework the Zbb implementation to use a word counter instead of an end
>> address. This removes the dependency on end-address calculations,
>> avoids overflow entirely, and simplifies the termination condition of
>> the word scanning loop. The final length is calculated using the saved
>> original pointer.
>> 
>> Performance was evaluated with string_bench_strnlen:
>> 
>> New Implementation Previous Implementation
>> 
>> len=0 : 71 ns/call 70 ns/call
>> len=1 : 82 ns/call 81 ns/call
>> len=7 : 83 ns/call 81 ns/call
>> len=8 : 83 ns/call 81 ns/call
>> len=16 : 94 ns/call 90 ns/call
>> len=31 : 117 ns/call 113 ns/call
>> len=64 : 175 ns/call 167 ns/call
>> len=127 : 259 ns/call 258 ns/call
>> len=512 : 802 ns/call 833 ns/call
>> len=1024 : 1512 ns/call 1536 ns/call
>> len=3173 : 4581 ns/call 4640 ns/call
>> len=4096 : 6256 ns/call 6068 ns/call
>> 
>> Results show comparable performance to the previous implementation
>> while fixing the overflow issue.
>> 
>> Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
>> Suggested-by: DavidLaight <david.laight.linux@gmail.com>
>> Signed-off-by: Gao Rui <gao.rui@zte.com.cn>
>> 
>> ---
>> v3:
>> - Keep the original register allocation (t0-t4) and numeric labels.
>> - Keep the original comments.
>> - Calculate word count as (remaining - 1) / SZREG + 1, removing the
>>   branch from the calculation.
>> v2:
>> - Rework the Zbb implementation to eliminate end-address overflow
>>   instead of falling back to the generic path.
>> - Use a decrementing word counter for word scanning.
>> - Run KUnit string tests successfully.
>> - Add string_bench_strnlen benchmark results.
>> ---
>>  arch/riscv/lib/strnlen.S | 54 +++++++++++++++++--------------
>>  1 file changed, 29 insertions(+), 25 deletions(-)
>> 
>> diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
>> index a8911605c248..000000000000 100644
>> --- a/arch/riscv/lib/strnlen.S
>> +++ b/arch/riscv/lib/strnlen.S
>> @@ -73,6 +73,9 @@
>>      /* If maxlen is 0, return 0. */
>>      beqz    a1, 3f
>> 
>> +    /* Save original pointer for final length calculation. */
>> +    mv    t4, a0
>> +
>>      /* Number of irrelevant bytes in the first word. */
>>      andi    t2, a0, SZREG-1
>> 
>> @@ -82,15 +85,6 @@
>>      li    t3, SZREG
>>      sub    t3, t3, t2
>>      slli    t2, t2, 3
>> -
>> -    /*
>> -     * Aligned boundary.  Use the address of the last valid byte
>> -     * (s + count - 1) to avoid loading a word past the count
>> -     * boundary in the loop below.  count == 0 is handled above.
>> -     */
>> -    add    t4, a0, a1
>> -    addi    t4, t4, -1
>> -    andi    t4, t4, -SZREG
>> 
>>      /* Get the first word.  */
>>      REG_L    t1, 0(t0)
>> @@ -125,15 +119,26 @@
>> 
>>      bgtu    t3, a0, 2f
>> 
>> -    /* All remaining bytes are in the first word, no loop needed. */
>> -    bgeu    t0, t4, 2f
>> +    /*
>> +     * Use a word counter to avoid calculating an end address,
>> +     * which might overflow when count is close to SIZE_MAX.
>> +     */
>> +    sub    t2, a1, t3
>> +    beqz    t2, 3f
>
>Is that right?
>The equality check seems wrong.
>Does it work when there are more characters in the first word than
>the caller specified length.
>
It does. The new code is only reached when the preceding

bgtu t3, a0, 2f

does not branch. a0 is min(offset of the first NUL in the shifted
word, a1), and the shifted first word has exactly t3 significant
bytes, so the offset is within [0, t3].

>> 
>> -    /* Prepare for the word comparison loop. */
>> -    addi    t2, t0, SZREG
>> +    /* Calculate the word count: count = (remaining - 1) / SZREG + 1 */
>> +    addi    t2, t2, -1
>> +#if defined(CONFIG_64BIT)
>> +    srli    t1, t2, 3
>> +#else
>> +    srli    t1, t2, 2
>> +#endif
>> +    addi    t2, t1, 1
>> +
>>      li    t3, -1
>> 
>>      /*
>> -     * Our critical loop is 4 instructions and processes data in
>> +     * Our critical loop is 6 instructions and processes data in
>
>The diff below adds one instruction - I make that 5.
>But the instruction count isn't what really matters, what matters
>is the number of clocks it takes the loop to execute.
>

Correct, I'll fix the comment to say 5.

>>       * 4 byte or 8 byte chunks.
>>       */
>>      .p2align 3
>> @@ -141,23 +146,22 @@
>>      REG_L    t1, SZREG(t0)
>>      addi    t0, t0, SZREG
>>      orc.b    t1, t1
>> -    bgeu    t0, t4, 4f
>
>Hasn't that (the old code) just read beyond the end of the buffer
>
Yes. The final iteration loads the aligned word containing
s + count - 1, which may extend up to SZREG - 1 bytes beyond the
logical end. That is safe because the load is SZREG-aligned and
cannot cross a page boundary, which is the same approach used in
strlen.S. The new word-count loop preserves that property.

>> -    beq    t1, t3, 1b
>> +    bne    t1, t3, 4f
>> +    addi    t2, t2, -1
>> +    bnez    t2, 1b
>
>You want to put the 'addi t2, t2, -1' higher up next to the other addi.
>Then simple cpu will execute it while waiting for the read to complete.
>The old code did that - but got it wrong.
>You can do the length check while the cpu is (otherwise) stalled waiting
>for the read. So something like:
>1:    REG_L    t1, SZREG(t0)
>    addi    t0, t0, SZREG
>    addi    t2, t2, -1
>    bnez    t2, 3f
>    orc.b    t1, t1
>    beq    t1, t3, 1b
>2:    // Found a zero
>    ...
>    ret
>
>3:    orc.b    t1, t1
>    bne    t1, t3, 2b
>    // No zero
>
>The count (t1) would need to be one lower.
>
Done. I've moved the decrement closer to the load while keeping the
NUL check before the counter check 

>Did you try just subtracting SZREG from the length-left
>and doing an unsigned compare against the original size?
>I think it should work and saves the setup code.
>
>David
>
I think that approach needs some additional care around the same
overflow corner case that this patch is addressing.

For example, when a1 = SIZE_MAX and t3 = 1, the remaining-byte
counter starts at SIZE_MAX - 1. On the final iteration, subtracting
SZREG causes it to wrap into the range
[2^XLEN - SZREG + 1, 2^XLEN - 1]. Depending on the exact unsigned
termination test, that wrapped value may still compare as in-range,
making it easy to miss the termination condition.

The current implementation computes

words = (remaining - 1) / SZREG + 1

once during setup and then uses an exact decrementing word counter.
This avoids any dependence on wrapped byte counts, works for all
values of a1, and only costs a few setup instructions, so I'd
prefer to keep this approach.

 Thanks,
Rui

>> +
>> +    /* Scanned all words without finding NUL, return maxlen. */
>> +    mv    a0, a1
>> +    ret
>> +
>>  4:
>>      not    t1, t1
>>      CZ    t1, t1
>>      srli    t1, t1, 3
>> 
>> -    /* Get number of processed bytes. */
>> -    sub    t2, t0, t2
>> -
>> -    /* Add number of characters in the first word.  */
>> -    add    a0, a0, t2
>> -
>> -    /* Add number of characters in the last word.  */
>> +    /* Length = (current - original) + offset in final word. */
>> +    sub    a0, t0, t4
>>      add    a0, a0, t1
>> -
>> -    /* Ensure the final result does not exceed maxlen. */
>>      minu    a0, a0, a1
>>  2:
>>      ret
>> --
>> 2.27.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
