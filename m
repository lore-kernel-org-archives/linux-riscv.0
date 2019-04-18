Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EEDC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43589204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:01:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqAzbFDQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43589204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QiEFTSkcPPgdJPZ4C12XOgMFDVPZGBZ4ilcGjtwfOoU=; b=kqAzbFDQOHSA1j7NZFbJ2aJAw
	0DclpnY/TJgxvibSijaWw3dRKgsPASqm/SQFhaG2wwC25EL2RGGyT3/3VMh8blhkQxCbcsZ3slAuA
	I3FTeOpBz0SpBB23pctVezxHvMBRcPCY3Yxpf+SgOsJ82yXJTeLTCg0RwgvB9IVYpNEVHmzLa9TQH
	ZcuPjUb/eP9WgDrKKYC9fX+FA/NVNY7hHOYIvIxrSgotW34Yxcu6r75Xr4x1HWDggLUTlys5T+weV
	eatO9hzKOG7eqEBynDP1LM8lwengbXj+XbtO+ZomrFB7JnlcJ0/glIilNAr4MYYN269Yj0OFjPQI0
	sTqAA/AWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH07H-0005Nt-0G; Thu, 18 Apr 2019 06:01:47 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH077-0004vX-Uj; Thu, 18 Apr 2019 06:01:39 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D2FD11C0008;
 Thu, 18 Apr 2019 06:01:20 +0000 (UTC)
Subject: Re: [PATCH v3 05/11] arm: Properly account for stack randomization
 and stack guard gap
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-6-alex@ghiti.fr>
 <CAGXu5j+V_kJk-Lu=u82CrA291EPpgJtX951EKigprozXt7=ORA@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <dabdc658-62b0-4854-f84f-9c4672fce842@ghiti.fr>
Date: Thu, 18 Apr 2019 02:01:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5j+V_kJk-Lu=u82CrA291EPpgJtX951EKigprozXt7=ORA@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_230138_294536_812BDF7B 
X-CRM114-Status: GOOD (  19.66  )
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
 Alexander Viro <viro@zeniv.linux.org.uk>, James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 1:26 AM, Kees Cook wrote:
> On Wed, Apr 17, 2019 at 12:28 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> This commit takes care of stack randomization and stack guard gap when
>> computing mmap base address and checks if the task asked for randomization.
>> This fixes the problem uncovered and not fixed for arm here:
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html
> Please use the official archive instead. This includes headers, linked
> patches, etc:
> https://lkml.kernel.org/r/20170622200033.25714-1-riel@redhat.com


Ok, sorry about that, and thanks for the info.


>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/arm/mm/mmap.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
>> index f866870db749..bff3d00bda5b 100644
>> --- a/arch/arm/mm/mmap.c
>> +++ b/arch/arm/mm/mmap.c
>> @@ -18,8 +18,9 @@
>>           (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
>>
>>   /* gap between mmap and stack */
>> -#define MIN_GAP (128*1024*1024UL)
>> -#define MAX_GAP ((TASK_SIZE)/6*5)
>> +#define MIN_GAP                (128*1024*1024UL)
> Might as well fix this up as SIZE_128M


I left the code as is because it gets removed in the next commit, I did not
even correct the checkpatch warnings. But I can fix that in v4, since there
will be a v4 :)


>
>> +#define MAX_GAP                ((TASK_SIZE)/6*5)
>> +#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
> STACK_RND_MASK is already defined so you don't need to add it here, yes?


At this point, I don't think arm has STACK_RND_MASK defined anywhere since
the generic version is in mm/util.c.


>
>>   static int mmap_is_legacy(struct rlimit *rlim_stack)
>>   {
>> @@ -35,6 +36,15 @@ static int mmap_is_legacy(struct rlimit *rlim_stack)
>>   static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>>   {
>>          unsigned long gap = rlim_stack->rlim_cur;
>> +       unsigned long pad = stack_guard_gap;
>> +
>> +       /* Account for stack randomization if necessary */
>> +       if (current->flags & PF_RANDOMIZE)
>> +               pad += (STACK_RND_MASK << PAGE_SHIFT);
>> +
>> +       /* Values close to RLIM_INFINITY can overflow. */
>> +       if (gap + pad > gap)
>> +               gap += pad;
>>
>>          if (gap < MIN_GAP)
>>                  gap = MIN_GAP;
>> --
>> 2.20.1
>>
> But otherwise, yes:
>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks !


>
> --
> Kees Cook
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
