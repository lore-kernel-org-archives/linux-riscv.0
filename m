Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0525C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 07:21:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DEA21736
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 07:21:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F15Vlq4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83DEA21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GzPZExCpgvsoGffgE9aRYoe+Ozd+CI5ys9ngtkxilv4=; b=F15Vlq4kyToQq5B9cctZjlR8Q
	/rlv2hdqvwY2hJYSsjI6PUpXcwvVya2nA8QfuQ3oUNNeGUOzqBVa+Wo4gCwdsGM9OA5fwig8q6RD3
	nMf7kz5RlEy/aEjejSrGq/OGk5igydmQt57cPyJiIyfmOq8fxFBKTS3auvYHUyty9z9A/3gvLG1cj
	NYOyb6A26/wTri+k1KhiPSa5XXB9QJuPyYawIjaYcPKuyFNHia4voS+XmbH9CEwxZrtEJ0N8AhPD2
	pyUyV3hrD5F9179Ohb4QM9Uvon32Wvuob6NKf9CTnyV0gg+rY6jEgUgCtmVhlu0ZTHXYDQrUeV0lF
	jBGM5TZvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHNqA-0006Yk-AG; Fri, 19 Apr 2019 07:21:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHNq2-0006Sq-6v; Fri, 19 Apr 2019 07:21:36 +0000
X-Originating-IP: 81.250.144.103
Received: from [10.30.1.20] (lneuilly-657-1-5-103.w81-250.abo.wanadoo.fr
 [81.250.144.103]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 78D2F6000E;
 Fri, 19 Apr 2019 07:21:16 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH v3 08/11] mips: Properly account for stack randomization
 and stack guard gap
To: Paul Burton <paul.burton@mips.com>
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-9-alex@ghiti.fr>
 <20190418212701.dpymnwuki3g7rox2@pburton-laptop>
Message-ID: <b971499a-ae49-bea5-d3ac-dc779d4817ef@ghiti.fr>
Date: Fri, 19 Apr 2019 09:20:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20190418212701.dpymnwuki3g7rox2@pburton-laptop>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_002134_404394_2282432D 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/18/19 5:27 PM, Paul Burton wrote:
> Hi Alexandre,
>
> On Wed, Apr 17, 2019 at 01:22:44AM -0400, Alexandre Ghiti wrote:
>> This commit takes care of stack randomization and stack guard gap when
>> computing mmap base address and checks if the task asked for randomization.
>> This fixes the problem uncovered and not fixed for mips here:
>> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> For patches 8-10:
>
>      Acked-by: Paul Burton <paul.burton@mips.com>
>
> Thanks for improving this,


Thank you for your time,


Alex


>      Paul
>
>> ---
>>   arch/mips/mm/mmap.c | 14 ++++++++++++--
>>   1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
>> index 2f616ebeb7e0..3ff82c6f7e24 100644
>> --- a/arch/mips/mm/mmap.c
>> +++ b/arch/mips/mm/mmap.c
>> @@ -21,8 +21,9 @@ unsigned long shm_align_mask = PAGE_SIZE - 1;	/* Sane caches */
>>   EXPORT_SYMBOL(shm_align_mask);
>>   
>>   /* gap between mmap and stack */
>> -#define MIN_GAP (128*1024*1024UL)
>> -#define MAX_GAP ((TASK_SIZE)/6*5)
>> +#define MIN_GAP		(128*1024*1024UL)
>> +#define MAX_GAP		((TASK_SIZE)/6*5)
>> +#define STACK_RND_MASK	(0x7ff >> (PAGE_SHIFT - 12))
>>   
>>   static int mmap_is_legacy(struct rlimit *rlim_stack)
>>   {
>> @@ -38,6 +39,15 @@ static int mmap_is_legacy(struct rlimit *rlim_stack)
>>   static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>>   {
>>   	unsigned long gap = rlim_stack->rlim_cur;
>> +	unsigned long pad = stack_guard_gap;
>> +
>> +	/* Account for stack randomization if necessary */
>> +	if (current->flags & PF_RANDOMIZE)
>> +		pad += (STACK_RND_MASK << PAGE_SHIFT);
>> +
>> +	/* Values close to RLIM_INFINITY can overflow. */
>> +	if (gap + pad > gap)
>> +		gap += pad;
>>   
>>   	if (gap < MIN_GAP)
>>   		gap = MIN_GAP;
>> -- 
>> 2.20.1
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
