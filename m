Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB64C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB44C205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 06:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UeDcCtLG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB44C205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ILU6lKSeRy6EVpiVOEumQBObYV3yE4c4Gda0ZuN4aOw=; b=UeDcCtLGGxgNabRO4RIKcPSOU
	QhQb+UCWgcbrE1OhDq78dLLoHv8U5Rvg9PGrTYGyHBXgHGe4b2dm0cWPGnirzQoshY5A/oVH2bIRF
	C4t3f1FHB3aivbkT4e2YfIeCMRH4b82JhAA3FQQSvulES+2ZDerffA1QiQ7ywj1Dtvp7LWMc8buIq
	pAyUGrLXzfLMrKsy6iN10crThVNK6L+5Ov8ttpP17Q5oY6N6lG6h+p5m4OZEkPyoUSnugNqTnVyA9
	bg9nLz/89toGFSb+vDhN2qbSb8qpNOyjGxsxSwRA39qAFdh6Zku6FKF1dXs2HpZmknpadPm8HH35i
	3Y4LT9nlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH0Ef-0000JB-Mk; Thu, 18 Apr 2019 06:09:25 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH0EV-00008D-GF; Thu, 18 Apr 2019 06:09:17 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0791E240008;
 Thu, 18 Apr 2019 06:09:08 +0000 (UTC)
Subject: Re: [PATCH v3 11/11] riscv: Make mmap allocation top-down by default
To: Kees Cook <keescook@chromium.org>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-12-alex@ghiti.fr>
 <CAGXu5jJcQzDQGy907H0WXu-q1sPQaXgjuFbHHW60ajUuksZb3A@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <23d2a38d-363a-929c-5296-c2f8c3b7d1b4@ghiti.fr>
Date: Thu, 18 Apr 2019 02:09:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAGXu5jJcQzDQGy907H0WXu-q1sPQaXgjuFbHHW60ajUuksZb3A@mail.gmail.com>
Content-Language: sv-FI
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_230915_835369_E4EE46FB 
X-CRM114-Status: GOOD (  14.42  )
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
> On Wed, Apr 17, 2019 at 12:34 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>> In order to avoid wasting user address space by using bottom-up mmap
>> allocation scheme, prefer top-down scheme when possible.
>>
>> Before:
>> root@qemuriscv64:~# cat /proc/self/maps
>> 00010000-00016000 r-xp 00000000 fe:00 6389       /bin/cat.coreutils
>> 00016000-00017000 r--p 00005000 fe:00 6389       /bin/cat.coreutils
>> 00017000-00018000 rw-p 00006000 fe:00 6389       /bin/cat.coreutils
>> 00018000-00039000 rw-p 00000000 00:00 0          [heap]
>> 1555556000-155556d000 r-xp 00000000 fe:00 7193   /lib/ld-2.28.so
>> 155556d000-155556e000 r--p 00016000 fe:00 7193   /lib/ld-2.28.so
>> 155556e000-155556f000 rw-p 00017000 fe:00 7193   /lib/ld-2.28.so
>> 155556f000-1555570000 rw-p 00000000 00:00 0
>> 1555570000-1555572000 r-xp 00000000 00:00 0      [vdso]
>> 1555574000-1555576000 rw-p 00000000 00:00 0
>> 1555576000-1555674000 r-xp 00000000 fe:00 7187   /lib/libc-2.28.so
>> 1555674000-1555678000 r--p 000fd000 fe:00 7187   /lib/libc-2.28.so
>> 1555678000-155567a000 rw-p 00101000 fe:00 7187   /lib/libc-2.28.so
>> 155567a000-15556a0000 rw-p 00000000 00:00 0
>> 3fffb90000-3fffbb1000 rw-p 00000000 00:00 0      [stack]
>>
>> After:
>> root@qemuriscv64:~# cat /proc/self/maps
>> 00010000-00016000 r-xp 00000000 fe:00 6389       /bin/cat.coreutils
>> 00016000-00017000 r--p 00005000 fe:00 6389       /bin/cat.coreutils
>> 00017000-00018000 rw-p 00006000 fe:00 6389       /bin/cat.coreutils
>> 00018000-00039000 rw-p 00000000 00:00 0          [heap]
>> 3ff7eb6000-3ff7ed8000 rw-p 00000000 00:00 0
>> 3ff7ed8000-3ff7fd6000 r-xp 00000000 fe:00 7187   /lib/libc-2.28.so
>> 3ff7fd6000-3ff7fda000 r--p 000fd000 fe:00 7187   /lib/libc-2.28.so
>> 3ff7fda000-3ff7fdc000 rw-p 00101000 fe:00 7187   /lib/libc-2.28.so
>> 3ff7fdc000-3ff7fe2000 rw-p 00000000 00:00 0
>> 3ff7fe4000-3ff7fe6000 r-xp 00000000 00:00 0      [vdso]
>> 3ff7fe6000-3ff7ffd000 r-xp 00000000 fe:00 7193   /lib/ld-2.28.so
>> 3ff7ffd000-3ff7ffe000 r--p 00016000 fe:00 7193   /lib/ld-2.28.so
>> 3ff7ffe000-3ff7fff000 rw-p 00017000 fe:00 7193   /lib/ld-2.28.so
>> 3ff7fff000-3ff8000000 rw-p 00000000 00:00 0
>> 3fff888000-3fff8a9000 rw-p 00000000 00:00 0      [stack]
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Kees Cook <keescook@chromium.org>


Thank you very much for all your comments,

Alex


>
> -Kees
>
>> ---
>>   arch/riscv/Kconfig | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index eb56c82d8aa1..f5897e0dbc1c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -49,6 +49,17 @@ config RISCV
>>          select GENERIC_IRQ_MULTI_HANDLER
>>          select ARCH_HAS_PTE_SPECIAL
>>          select HAVE_EBPF_JIT if 64BIT
>> +       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>> +       select HAVE_ARCH_MMAP_RND_BITS
>> +
>> +config ARCH_MMAP_RND_BITS_MIN
>> +       default 18
>> +
>> +# max bits determined by the following formula:
>> +#  VA_BITS - PAGE_SHIFT - 3
>> +config ARCH_MMAP_RND_BITS_MAX
>> +       default 33 if 64BIT # SV48 based
>> +       default 18
>>
>>   config MMU
>>          def_bool y
>> --
>> 2.20.1
>>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
