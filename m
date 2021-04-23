Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C2AC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:05:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF1061437
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 04:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF1061437
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=UpfMlEMwp0NX2m+EynSpsbQboqfKSieaYWyugEaHqN4=; b=N5OLGcmb3pD/Lnu1K8Sy1bBXI
	JhHxoKO/kGUu2I3vY7nTu3+uYNGZLE1iPCZS5i7OgTzchylj0Ta6XjZOrrDm7ZtIB5oUq3tryuw1P
	yd3pmTtU3kcKTFWVh7qkshxXO3YAA0I299eErYK+hv2PR4XcmVwZ/CdDe632QnSzpsgLVxjFQHSqK
	PULgiUeWgjCQrxSOZxXFpQqadklAkY3d0Iy9VssGr9KkTdAVxrJIaCsDsJ8oNbpZiIX2LByg5PvKC
	H061dKgAyGTmf9qiIWL3wOwK9ZfAyOSojGv0ETzzbG0NfXNsTPKxGYxyzUPDPP2L+ScoA2qPcDKXV
	1XPkJ4O+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZn4A-000YI6-LI; Fri, 23 Apr 2021 04:05:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZn3y-000YGZ-Hd
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 04:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=7Rh+WfQ9nmhLJIbX/qHrwtB7uwRLAG3DJAvNQ+dZ+7g=; b=MjKXVJNINKVQg2mSIOFa6/l9u4
 Q91EhqA3hQik/Pd6cb2z4AsOmDAafcvOtVNdDJDVTTK5QN9WPm7bVcyOwr2Scv+Elk9aFJKkUHBfV
 foih+9yBmYYGd23F5kZpykAjZ2EpspRqGxYHal0GfFSQVpQ6XLsC3VMIoP11mNzsZX+VxUl177dZg
 6RbV2zW9vdoN37ouBK5wJ7XRkXPD3apleMlxcRY0Wt0u/A7wUXt0BcduVcGmkMR9h+paw8elItli0
 otQfrelkHFibQVJInrs5TmRRoJx+3cshPGf9EOL7u7/3aWgxsxCK/NpEFtPdI2S4itytjEtIzFZwf
 Qp2NXIhQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZn3t-00E88J-Nd
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 04:05:04 +0000
Received: by mail-pg1-x52b.google.com with SMTP id p2so18878322pgh.4
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 21:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7Rh+WfQ9nmhLJIbX/qHrwtB7uwRLAG3DJAvNQ+dZ+7g=;
 b=Ub15tQB101oEHSFzEmqO7wllIPI2WrpNCQmK6PJCvxrojxfRtzsDhvK8dlq+Hd0gWS
 ZB+7xQd91WbaIm7Rxwvs0ddDa76hD/WnkTH+OasC2b1/TQ4r4q/xS8h7qruLxUwEdoQ9
 H8WwXKlwNO5Y1qXB/CDOEAnYv43LRlSEqpCnOKh2D98+VpFeSTBXYBfz+HTOQNLNYUKo
 bRf1CHQ5dQpj4Xp4LMz/XKXuqN7OYvbce5wou/P6axtQzWroRv5iMLniuq8K70OYcwXq
 n3I03vddAgSbSOxVZl8kXKyivdmBvPAp3rH5bqdKCSeWSIf25XnwN68ZERbnDV01Uz/V
 yEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7Rh+WfQ9nmhLJIbX/qHrwtB7uwRLAG3DJAvNQ+dZ+7g=;
 b=lSj+5su3AGycOPdP7uoUNP+8EqQYi71QEOfIzDzbt6QLK/yGfPIevVRLJ4Qc5Ua7Ma
 tFBH2cLBXUAQjERi7JKV6KOlSiXOP4ygicQ+3cg/1hPky2sQZGyHCKrnRPgMKIvdB9FE
 y+vJi9uuVgo9Rq8frFgWRXr2h0Vfcf/3fG6z1p7+XLbjPENCWP1ZOjeyVYX0vExefxVN
 OfLP9I3n8YG2bRu0Gd+avNuADtxght+ZpOSPuvFWc65FRj1tkn9pUoscEKG9m8UmNz9r
 jiPV0kKrqm9xgCGr/jqS0mKaXEIGpdyNcVUsNnoPRip+e2k9BNoJuF4n4VKMlmqSjLhB
 HTRQ==
X-Gm-Message-State: AOAM530hWJ/Bp0A3rydZ8A75mtV9KfNgKAE0vGEdkjEdhUa/9YMCWpOg
 Yek5Qh9qFalfIMJSOmRroh9LFulEW755ExXY
X-Google-Smtp-Source: ABdhPJwDLp+YvfT3vTkhJex/w3eRTBqZI1Ia9lVMKJXAdp2qBrW9O9ciqokATghsElA1I98nn/iaPw==
X-Received: by 2002:a63:231c:: with SMTP id j28mr1884713pgj.165.1619150700460; 
 Thu, 22 Apr 2021 21:05:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t15sm3413859pgh.33.2021.04.22.21.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 21:04:59 -0700 (PDT)
Date: Thu, 22 Apr 2021 21:04:59 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 21:04:58 PDT (-0700)
Subject: Re: [PATCH v4 1/2] binfmt_flat: allow not offsetting data start
In-Reply-To: <BL0PR04MB651434FAFF5566A575FDBE76E7469@BL0PR04MB6514.namprd04.prod.outlook.com>
CC: gerg@linux-m68k.org, uclinux-dev@uclinux.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-5208d0c7-acc3-48ac-823d-ffef9f1123e0@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_210501_799771_58D7A2B2 
X-CRM114-Status: GOOD (  22.03  )
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

On Thu, 22 Apr 2021 05:00:32 PDT (-0700), Damien Le Moal wrote:
>> On 2021/04/18 11:38, Greg Ungerer wrote:
>> 
>> 
>> On 17/4/21 2:54 pm, Damien Le Moal wrote:
>>> On 2021/04/17 13:52, Greg Ungerer wrote:
>>>>
>>>> On 17/4/21 11:10 am, Damien Le Moal wrote:
>>>>> Commit 2217b9826246 ("binfmt_flat: revert "binfmt_flat: don't offset
>>>>> the data start"") restored offsetting the start of the data section by
>>>>> a number of words defined by MAX_SHARED_LIBS. As a result, since
>>>>> MAX_SHARED_LIBS is never 0, a gap between the text and data sections
>>>>> always exists. For architectures which cannot support a such gap
>>>>> between the text and data sections (e.g. riscv nommu), flat binary
>>>>> programs cannot be executed.
>>>>>
>>>>> To allow an architecture to request no data start offset to allow for
>>>>> contiguous text and data sections for binaries flagged with
>>>>> FLAT_FLAG_RAM, introduce the new config option
>>>>> CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET. Using this new option, the
>>>>> macro DATA_START_OFFSET_WORDS is conditionally defined in binfmt_flat.c
>>>>> to MAX_SHARED_LIBS for architectures tolerating or needing the data
>>>>> start offset (CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET disabled case)
>>>>> and to 0 when CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET is enabled.
>>>>> DATA_START_OFFSET_WORDS is used in load_flat_file() to calculate the
>>>>> data section length and start position.
>>>>>
>>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>>> ---
>>>>>    fs/Kconfig.binfmt |  3 +++
>>>>>    fs/binfmt_flat.c  | 19 ++++++++++++++-----
>>>>>    2 files changed, 17 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/fs/Kconfig.binfmt b/fs/Kconfig.binfmt
>>>>> index c6f1c8c1934e..06fb7a93a1bd 100644
>>>>> --- a/fs/Kconfig.binfmt
>>>>> +++ b/fs/Kconfig.binfmt
>>>>> @@ -112,6 +112,9 @@ config BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>>>>    config BINFMT_FLAT_OLD_ALWAYS_RAM
>>>>>    	bool
>>>>>    
>>>>> +config BINFMT_FLAT_NO_DATA_START_OFFSET
>>>>> +	bool
>>>>> +
>>>>>    config BINFMT_FLAT_OLD
>>>>>    	bool "Enable support for very old legacy flat binaries"
>>>>>    	depends on BINFMT_FLAT
>>>>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>>>>> index b9c658e0548e..1dc68dfba3e0 100644
>>>>> --- a/fs/binfmt_flat.c
>>>>> +++ b/fs/binfmt_flat.c
>>>>> @@ -74,6 +74,12 @@
>>>>>    #define	MAX_SHARED_LIBS			(1)
>>>>>    #endif
>>>>>    
>>>>> +#ifdef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>>>>> +#define DATA_START_OFFSET_WORDS		(0)
>>>>> +#else
>>>>> +#define DATA_START_OFFSET_WORDS		(MAX_SHARED_LIBS)
>>>>> +#endif
>>>>> +
>>>>>    struct lib_info {
>>>>>    	struct {
>>>>>    		unsigned long start_code;		/* Start of text segment */
>>>>> @@ -560,6 +566,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    	 * it all together.
>>>>>    	 */
>>>>>    	if (!IS_ENABLED(CONFIG_MMU) && !(flags & (FLAT_FLAG_RAM|FLAT_FLAG_GZIP))) {
>>>>> +
>>>>
>>>> Random white space change...
>>>> Don't worry about re-spinning though, I will just edit this chunk out.
>>>
>>> Oops. Sorry about that. I should have better checked :)
>>>
>>>>
>>>>
>>>>>    		/*
>>>>>    		 * this should give us a ROM ptr,  but if it doesn't we don't
>>>>>    		 * really care
>>>>> @@ -576,7 +583,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    			goto err;
>>>>>    		}
>>>>>    
>>>>> -		len = data_len + extra + MAX_SHARED_LIBS * sizeof(unsigned long);
>>>>> +		len = data_len + extra +
>>>>> +			DATA_START_OFFSET_WORDS * sizeof(unsigned long);
>>>>>    		len = PAGE_ALIGN(len);
>>>>>    		realdatastart = vm_mmap(NULL, 0, len,
>>>>>    			PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE, 0);
>>>>> @@ -591,7 +599,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    			goto err;
>>>>>    		}
>>>>>    		datapos = ALIGN(realdatastart +
>>>>> -				MAX_SHARED_LIBS * sizeof(unsigned long),
>>>>> +				DATA_START_OFFSET_WORDS * sizeof(unsigned long),
>>>>>    				FLAT_DATA_ALIGN);
>>>>>    
>>>>>    		pr_debug("Allocated data+bss+stack (%u bytes): %lx\n",
>>>>> @@ -622,7 +630,8 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    		memp_size = len;
>>>>>    	} else {
>>>>>    
>>>>> -		len = text_len + data_len + extra + MAX_SHARED_LIBS * sizeof(u32);
>>>>> +		len = text_len + data_len + extra +
>>>>> +			DATA_START_OFFSET_WORDS * sizeof(u32);
>>>>>    		len = PAGE_ALIGN(len);
>>>>>    		textpos = vm_mmap(NULL, 0, len,
>>>>>    			PROT_READ | PROT_EXEC | PROT_WRITE, MAP_PRIVATE, 0);
>>>>> @@ -638,7 +647,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    
>>>>>    		realdatastart = textpos + ntohl(hdr->data_start);
>>>>>    		datapos = ALIGN(realdatastart +
>>>>> -				MAX_SHARED_LIBS * sizeof(u32),
>>>>> +				DATA_START_OFFSET_WORDS * sizeof(u32),
>>>>>    				FLAT_DATA_ALIGN);
>>>>>    
>>>>>    		reloc = (__be32 __user *)
>>>>> @@ -714,7 +723,7 @@ static int load_flat_file(struct linux_binprm *bprm,
>>>>>    			ret = result;
>>>>>    			pr_err("Unable to read code+data+bss, errno %d\n", ret);
>>>>>    			vm_munmap(textpos, text_len + data_len + extra +
>>>>> -				MAX_SHARED_LIBS * sizeof(u32));
>>>>> +				  DATA_START_OFFSET_WORDS * sizeof(u32));
>>>>>    			goto err;
>>>>>    		}
>>>>>    	}
>>>>>
>>>>
>>>> Thanks, otherwise looks good.
>>>>
>>>> Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>>>
>>>> I will push this into my m68knommu tree, for-next branch.
>>>> I just carry the flat format changes in that tree now to make my life easier.
>>>
>>> Great. Thanks !
>>> Are you taking both patches or should Plamer take the riscv Kconfig change
>>> through his tree ?
>> 
>> I am happy to take both.
>> Palmer?
>
>Palmer,
>
>Ping !

I already Ack'd it, in the thread where we couldn't find the maintainer.  
Keeping these togther is fine with me, and it seems easiest.

>
>
>-- 
>Damien Le Moal
>Western Digital Research
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
