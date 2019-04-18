Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EFADC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3F0204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRisubca"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3F0204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tMXvDmGQmbizhUzUy1SeuuzcUiYI2NKi1T6QDUAQRZI=; b=oRisubcaYseIIpWVewodUP1CD
	zJ90aOv76QSB1M53jn0lwtVCM8xIQgdJiBGZdKnov4lMpWbeQ95XP1JYNyTCnZsI2SmvI6lityLzi
	XI21EcUweuykzLaKQyJXcNTjTcIa/fapdZaE5wab8KQjjaoCTuVHH4OwgLKXp5y4VjMwxQIbyGN0d
	xfVrwS/O8GoMRvvV7i2Q7r71pWW0nZb3KZNZbTqUznH3xTW3p3umP/eao9LsemhelffaegSZMXAQR
	6oIYzaGvz1dke/afemKADHNDmZ2J7ZVqXIYTFiAaRA/sClUHtoCBaZc3G+GYIqv6+STgkVP/72x4i
	QLoOVowHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH0Df-00086c-Bq; Thu, 18 Apr 2019 06:08:23 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH0DW-0007yA-Az; Thu, 18 Apr 2019 06:08:15 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id D89BD20008;
 Thu, 18 Apr 2019 06:08:02 +0000 (UTC)
Subject: Re: [PATCH v3 09/11] mips: Use STACK_TOP when computing mmap base
 address
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-10-alex@ghiti.fr>
 <CAGXu5jKx_A8GsFWWABKwEXmL5dTMKjk3Ub9GoE7Do9NcZ_ai=A@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <16ed1829-a7ad-76b9-2929-9eb14406da00@ghiti.fr>
Date: Thu, 18 Apr 2019 02:08:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jKx_A8GsFWWABKwEXmL5dTMKjk3Ub9GoE7Do9NcZ_ai=A@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_230814_529518_EA0B90EC 
X-CRM114-Status: GOOD (  14.55  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On 4/18/19 1:31 AM, Kees Cook wrote:
> On Wed, Apr 17, 2019 at 12:32 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> mmap base address must be computed wrt stack top address, using TASK_SIZE
>> is wrong since STACK_TOP and TASK_SIZE are not equivalent.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks !


>
> -Kees
>
>> ---
>>   arch/mips/mm/mmap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
>> index 3ff82c6f7e24..ffbe69f3a7d9 100644
>> --- a/arch/mips/mm/mmap.c
>> +++ b/arch/mips/mm/mmap.c
>> @@ -22,7 +22,7 @@ EXPORT_SYMBOL(shm_align_mask);
>>
>>   /* gap between mmap and stack */
>>   #define MIN_GAP                (128*1024*1024UL)
>> -#define MAX_GAP                ((TASK_SIZE)/6*5)
>> +#define MAX_GAP                ((STACK_TOP)/6*5)
>>   #define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>>
>>   static int mmap_is_legacy(struct rlimit *rlim_stack)
>> @@ -54,7 +54,7 @@ static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>>          else if (gap > MAX_GAP)
>>                  gap = MAX_GAP;
>>
>> -       return PAGE_ALIGN(TASK_SIZE - gap - rnd);
>> +       return PAGE_ALIGN(STACK_TOP - gap - rnd);
>>   }
>>
>>   #define COLOUR_ALIGN(addr, pgoff)                              \
>> --
>> 2.20.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
