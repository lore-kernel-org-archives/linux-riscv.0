Return-Path: <SRS0=IH7i=JP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76996C433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 02:39:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A087610FC
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Apr 2021 02:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A087610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rk0TXqMgQUGlApucky8r4/haw4+A5W6Rnr0e0qq1yGU=; b=aTCNzuUwO7//dYgnYtpf5Apep
	h+ezoNra+8TfAR5c+SdALmg0kteKHdQuMqIPqsh/SxM1x//BJxr26qg4aNPbNbM5XmzI6Pw6PD1xW
	UZrrBG3ry2lsT5xKF60bTmKO2t6mGhnIRTdmENNbjKImwz62wACT1WywXIszdIPOKKme/PWSd1UzK
	mYzBakJpxuTcU1L6czqD8daiPo0t/XHKbJ+MotSsMzsRdjZjhqzmLoqlkDmmDRIvO2eb3fHIVZ8yQ
	LRHibfJneqRv1OrMWUdm/XDnCLoQD42oqyLJ/U8RZr3waoCcwblZCw84hfeNzvbP0B7alEROsTBUI
	Byk6H6cIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXxKT-006v08-S4; Sun, 18 Apr 2021 02:38:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXxKR-006uzq-0B
 for linux-riscv@desiato.infradead.org; Sun, 18 Apr 2021 02:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1m6QJHA5Y7tr2Ujlskn66cKPawsnpT4GcXg5laVs5J0=; b=VBsNtDYhmFpPvReFpe7a5OH/qT
 VWoi599/giZVLahZ1hNUV6j2F2SWxRGm+b5ffKf7jNYoqCUrhTf+iadtZgEA+xHQV1ty+BqQNeT5M
 gHX7YNKJv2VrX3Q6Ze0x4bOhDgilZb/TxRdOSINgOPD/ECMvJkh7GxfRQ7YqDZpkygMXe3tq4b0lB
 /63j4pGQyA3oFu8ETKy3P4mKsMmN8esSEAjBFk+OWsGCjaY3gk4W9B7rTnboSCrhbgWvo405YjXSZ
 Vbi94D6KJlfH+Q53LOoMKGmD+AMd6GSePD6jQkZME0K2b0bn/ob/trrsfAa7nOIcg6PQN5Opiv2AB
 rykjERRA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXxKK-00AHTg-Vv
 for linux-riscv@lists.infradead.org; Sun, 18 Apr 2021 02:38:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 518AA61029;
 Sun, 18 Apr 2021 02:38:22 +0000 (UTC)
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "uclinux-dev@uclinux.org" <uclinux-dev@uclinux.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, Christoph Hellwig <hch@lst.de>
References: <20210417011009.54569-1-damien.lemoal@wdc.com>
 <20210417011009.54569-2-damien.lemoal@wdc.com>
 <5227b984-f415-98b5-dae8-0cf84a71bb46@linux-m68k.org>
 <BL0PR04MB651453DC7A8BE4E050B11893E74B9@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <b83b023e-abab-35d2-22c7-5d259af2ac97@linux-m68k.org>
Date: Sun, 18 Apr 2021 12:38:19 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BL0PR04MB651453DC7A8BE4E050B11893E74B9@BL0PR04MB6514.namprd04.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210417_193825_119934_02FFF74A 
X-CRM114-Status: GOOD (  21.33  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 17/4/21 2:54 pm, Damien Le Moal wrote:
> On 2021/04/17 13:52, Greg Ungerer wrote:
>>
>> On 17/4/21 11:10 am, Damien Le Moal wrote:
>>> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
>>> the data start"") restored offsetting the start of the data section by
>>> a number of words defined by MAX_SHARED_LIBS. As a result, since
>>> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
>>> always exists. For architectures which cannot support a such gap
>>> between the text and data sections (e.g. riscv nommu), flat binary
>>> programs cannot be executed.
>>>
>>> To allow an architecture to request no data start offset to allow for
>>> contiguous text and data sections for binaries flagged with
>>> FLAT_FLAG_RAM, introduce the new config option
>>> CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
>>> macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
>>> to MAX_SHARED_LIBS for architectures tolerating or needing the data
>>> start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
>>> and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
>>> DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
>>> data section length and start position.
>>>
>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>> ---
>>>    fs/Kconfig.binfmt |  3 +++
>>>    fs/binfmt_flat.c  | 19 ++++++++++++++-----
>>>    2 files changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>>> index c6f1c8c1934e..06fb7a93a1bd 100644
>>> --- a/fs/Kconfig.binfmt
>>> +++ b/fs/Kconfig.binfmt
>>> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>>    config BINFMT_FLAT_OLD_ALWAYS_RAM
>>>    	bool
>>>    
>>> +config BINFMT_FLAT_NO_DATA_START_OFFSET
>>> +	bool
>>> +
>>>    config BINFMT_FLAT_OLD
>>>    	bool "Enable support for very old legacy flat binaries"
>>>    	depends on BINFMT_FLAT
>>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>>> index b9c658e0548e..1dc68dfba3e0 100644
>>> --- a/fs/binfmt_flat.c
>>> +++ b/fs/binfmt_flat.c
>>> @@ -74,6 +74,12 @@
>>>    #define	MAX_SHARED_LIBS			(1)
>>>    #endif
>>>    
>>> +#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>>> +#define DATA_START_OFFSET_WORDS		(0)
>>> +#else
>>> +#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
>>> +#endif
>>> +
>>>    struct lib_info {
>>>    	struct {
>>>    		unsigned long start_code;		/* Start of text segment */
>>> @@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    	 * it all together.
>>>    	 */
>>>    	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>>> +
>>
>> Random white space change...
>> Don't worry about re-spinning though, I will just edit this chunk out.
> 
> Oops. Sorry about that. I should have better checked :)
> 
>>
>>
>>>    		/*
>>>    		 * this should give us a ROM ptr,  but if it doesn't we don't
>>>    		 * really care
>>> @@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    			goto err;
>>>    		}
>>>    
>>> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
>>> +		len = data_len + extra +
>>> +			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
>>>    		len = PAGE_ALIGN(len);
>>>    		realdatastart = vm_mmap(NULL, 0, len,
>>>    			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
>>> @@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    			goto err;
>>>    		}
>>>    		datapos = ALIGN(realdatastart +
>>> -				MAX_SHARED_LIBS * sizeof(unsigned long),
>>> +				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
>>>    				FLAT_DATA_ALIGN);
>>>    
>>>    		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
>>> @@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    		memp_size = len;
>>>    	} else {
>>>    
>>> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
>>> +		len = text_len + data_len + extra +
>>> +			DATA_START_OFFSET_WORDS * sizeof(u32);
>>>    		len = PAGE_ALIGN(len);
>>>    		textpos = vm_mmap(NULL, 0, len,
>>>    			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
>>> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    
>>>    		realdatastart = textpos + ntohl(hdr->data_start);
>>>    		datapos = ALIGN(realdatastart +
>>> -				MAX_SHARED_LIBS * sizeof(u32),
>>> +				DATA_START_OFFSET_WORDS * sizeof(u32),
>>>    				FLAT_DATA_ALIGN);
>>>    
>>>    		reloc = (__be32 __user *)
>>> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>    			ret = result;
>>>    			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>>>    			vm_munmap(textpos, text_len + data_len + extra +
>>> -				MAX_SHARED_LIBS * sizeof(u32));
>>> +				  DATA_START_OFFSET_WORDS * sizeof(u32));
>>>    			goto err;
>>>    		}
>>>    	}
>>>
>>
>> Thanks, otherwise looks good.
>>
>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>
>> I will push this into my m68knommu tree, for-next branch.
>> I just carry the flat format changes in that tree now to make my life easier.
> 
> Great. Thanks !
> Are you taking both patches or should Plamer take the riscv Kconfig change
> through his tree ?

I am happy to take both.
Palmer?

Regards
Greg


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
