Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E45C2D0E4
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:22:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CD0F221FC
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 19:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLIuWPGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iC49Y/Wp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CD0F221FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R/PRNYDYqisCUmVJ+txOpc7Tr6wY4RwGpx/5qCYuYyU=; b=HLIuWPGDcuw4avHAjS1+N9a3B
	JpyTg90fVGmKFKksXHK6tk73xwGdRi9lyngOWBnP61IwLAzHyrWYwFTVar/drKDupEloeYspxAcGd
	CFyx/09VYWqQq6/yN9gRFxt/1QZHcszrp/ogYQQRyqWKl3iyBsNC1v9XgM4XBTdPJrV/JQivTmH2C
	mK0Zrtxc4JNEjeWp42fNqtnNBSXbqHPQXfW8MqkRTTGneGamdXQJYfP0GeW6FBq2nnmCrsK53hKwO
	/X7KMLw7Cg2s1gnAeGpQKuren/vdbrAwPL29s+upDD02h5/CA7B93WNbtkBkFw4egUinH9nNcPb/Y
	8bFpHMRQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf6Yy-0007vV-5d; Tue, 17 Nov 2020 19:22:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6Yx-0007v0-1L
 for linux-riscv@merlin.infradead.org; Tue, 17 Nov 2020 19:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=t0Ko6hqbyKkoaE2Zp9g1QeIuYu7rk/KOlj3Y3oin9Ng=; b=iC49Y/Wp4zg3nKkl05NMMRZEvi
 6gzzOVa5WqsNW4zLHwFvmzgnmoCfT5eHf/5lSf6lk5pubJcTlNyqrmRJg9RpiBkIQORATm4jGAzTj
 fucR6rBiyeVFh8OgH9MbfxbobcXd0VEXJZaKVjh4tk7pJ/VQac40WBkZ9Jmhm/JGxeqrAn+erwCAc
 /fJwaJQn1pUhhBejXUeMaQ0RfPzlUoR+Rkw38IrUp7K3JgVJNrdAqBnYC9ezxDqkx6H5dVHxXWa68
 pU/MBGvqPcFumvEsIn8TxNi5L21Ul/O7ZKGRZwnp1+3n/txC+WDhLMaYClilVlgNwdG+7WA9SvBuz
 DP7eEcaw==;
Received: from [2601:1c0:6280:3f0::bcc4]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf6Yt-0005HV-Qs; Tue, 17 Nov 2020 19:22:44 +0000
Subject: Re: [PATCH] RISC-V: fix barrier() use in <vdso/processor.h>
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20201117013951.7827-1-rdunlap@infradead.org>
 <CAKwvOdmESwnF14TLjRfzJg8Dau8XW0LgoDvXtdPjPOqdf211SQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9ab43756-6c48-c5e8-3a5d-e44bba070a97@infradead.org>
Date: Tue, 17 Nov 2020 11:22:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmESwnF14TLjRfzJg8Dau8XW0LgoDvXtdPjPOqdf211SQ@mail.gmail.com>
Content-Language: en-US
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Albert Ou <aou@eecs.berkeley.edu>,
 LKML <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 11/17/20 11:00 AM, Nick Desaulniers wrote:
> On Mon, Nov 16, 2020 at 5:40 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> riscv's <vdso/processor.h> uses barrier() so it should
>> #include <asm/barrier.h> to prevent build errors.
>>
>> Fixes this build error:
>>   CC [M]  drivers/net/ethernet/emulex/benet/be_main.o
>> In file included from ./include/vdso/processor.h:10,
>>                  from ./arch/riscv/include/asm/processor.h:11,
>>                  from ./include/linux/prefetch.h:15,
>>                  from drivers/net/ethernet/emulex/benet/be_main.c:14:
>> ./arch/riscv/include/asm/vdso/processor.h: In function 'cpu_relax':
>> ./arch/riscv/include/asm/vdso/processor.h:14:2: error: implicit declaration of function 'barrier' [-Werror=implicit-function-declaration]
>>    14 |  barrier();
>>
>> This happens with a total of 5 networking drivers -- they all use
>> <linux/prefetch.h>.
>>
>> rv64 allmodconfig now builds cleanly after this patch.
>>
>> Fixes fallout from:
>> 815f0ddb346c ("include/linux/compiler*.h: make compiler-*.h mutually exclusive")
>>
>> Fixes: ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
> 
> Hi Randy,
> Thanks for the patch, it looks good to me.  I only had a question on
> the commit message.
> 
> Is this also related to:
> commit 3347acc6fcd4 ("compiler.h: fix barrier_data() on clang")

Hi Nick,
Yes, it looks like I tagged the wrong commit in Fixes:
Thanks for noticing that.


> I plan to backport 3347acc6fcd4, so it would be good if all of the
> follow ups are all tagged accordingly with fixes tags, so that I don't
> break anything backporting 3347acc6fcd4 because I forgot or missed any
> follow ups that also needed to be backported.
> 
>> Reported-by: Andreas Schwab <schwab@linux-m68k.org>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Arvind Sankar <nivedita@alum.mit.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: clang-built-linux@googlegroups.com
>> Cc: Nick Desaulniers <ndesaulniers@google.com>
>> Cc: Nathan Chancellor <natechancellor@gmail.com>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> ---
>>  arch/riscv/include/asm/vdso/processor.h |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> --- lnx-510-rc4.orig/arch/riscv/include/asm/vdso/processor.h
>> +++ lnx-510-rc4/arch/riscv/include/asm/vdso/processor.h
>> @@ -4,6 +4,8 @@
>>
>>  #ifndef __ASSEMBLY__
>>
>> +#include <asm/barrier.h>
>> +
>>  static inline void cpu_relax(void)
>>  {
>>  #ifdef __riscv_muldiv
> 
> 
> 


-- 
~Randy


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
