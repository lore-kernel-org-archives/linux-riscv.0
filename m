Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA30C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:04:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1707204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:04:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pbVFPtRc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1707204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fLkDN++SVAAot6UMaQxa1aSP0P0ZXd8ron3OAyQqJlQ=; b=pbVFPtRck8xo8XqzNj8siVT7/
	tMNI7m6Up6EjQvhjlcaQPsmChj8Px69vJZoz1XtfVzZkNlU/0kxZIfBxRulZMsuWOC3hJlynlytN1
	kXfqX6g2UWcssWHvHXryO1+vB3RXiNAdwbkfSSVFGdrNjWBywlSccf3TW33nGkBu2yCm6aPHJVAnG
	3vVMAqTAn+1Yoyw50ZDxCQ0su963W3nDNQJHjeTYoZYh6GlaUscNCf11DGBExGVV6nGl2L19JYquH
	bl2YEd2sEtUb/GdlGlI3axSHjoK5Sh1Q832eTFAXEwdZKS6TY8xy9Zi1dFt9vK/Pb7SoTEJDAO0oy
	GekjEaVBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH09p-0005mh-Ch; Thu, 18 Apr 2019 06:04:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH09g-0005f6-LI; Thu, 18 Apr 2019 06:04:18 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id DC0F4240004;
 Thu, 18 Apr 2019 06:04:08 +0000 (UTC)
Subject: Re: [PATCH v3 06/11] arm: Use STACK_TOP when computing mmap base
 address
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-7-alex@ghiti.fr>
 <CAGXu5jLFtaiRqvd_Lw2B688bzUyti2O8o_iZVmQhb7rmnEKzBQ@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <9fdc1de9-8552-da1b-7d05-0596969ddad2@ghiti.fr>
Date: Thu, 18 Apr 2019 02:04:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jLFtaiRqvd_Lw2B688bzUyti2O8o_iZVmQhb7rmnEKzBQ@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_230416_850042_57F11FFC 
X-CRM114-Status: GOOD (  15.20  )
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

On 4/18/19 1:27 AM, Kees Cook wrote:
> On Wed, Apr 17, 2019 at 12:29 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> mmap base address must be computed wrt stack top address, using TASK_SIZE
>> is wrong since STACK_TOP and TASK_SIZE are not equivalent.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> ---
>>   arch/arm/mm/mmap.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
>> index bff3d00bda5b..0b94b674aa91 100644
>> --- a/arch/arm/mm/mmap.c
>> +++ b/arch/arm/mm/mmap.c
>> @@ -19,7 +19,7 @@
>>
>>   /* gap between mmap and stack */
>>   #define MIN_GAP                (128*1024*1024UL)
>> -#define MAX_GAP                ((TASK_SIZE)/6*5)
>> +#define MAX_GAP                ((STACK_TOP)/6*5)
> Parens around STACK_TOP aren't needed, but you'll be removing it
> entirely, so I can't complain. ;)
>
>>   #define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>>
>>   static int mmap_is_legacy(struct rlimit *rlim_stack)
>> @@ -51,7 +51,7 @@ static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>>          else if (gap > MAX_GAP)
>>                  gap = MAX_GAP;
>>
>> -       return PAGE_ALIGN(TASK_SIZE - gap - rnd);
>> +       return PAGE_ALIGN(STACK_TOP - gap - rnd);
>>   }
>>
>>   /*
>> --
>> 2.20.1
>>
> Acked-by: Kees Cook <keescook@chromium.org>


Thanks !

>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
