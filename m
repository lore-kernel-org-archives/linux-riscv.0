Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF7EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 13:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2sg6aErBnHmTeZvKXS3jniTqwa9mnDn/au8mgzxsduQ=; b=1zIP0QFIdNP2k4/D8ZGC7qTQyY
	BMoC8cEvsWauWgpSEkTB/jslF6lThwfesSftArrBgEFwjxDlWhhneLyFut09aoRTxwNKzGL1TOfms
	yKRhiATDDi36D8sruC1er7Sp0CMdGLzSuaMXJ9VmZxUfIUmwzrpJJ/NCnpEmzkrH0m9FEVFPu3w82
	ii9SdROTKhMvRVHhNV+0mK/W8U7kJfHK8JwmYAESXjdeybkMuKlYI67cnwvVWtKMERxUmdcY4N7qn
	wRxab+6w49C0FQx+sjNaIl5hoAq/yuTAJClmf2rfbjYbyuYyunvsFMEh3MMAUCsvLfpovh8klzMoQ
	ub7UbOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaM3-0007nw-0J;
	Wed, 12 Jul 2023 13:58:07 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaM0-0007kw-0D
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 13:58:05 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5577900c06bso5321079a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 06:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689170281; x=1691762281;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5oC9OkzryYNUsrIJJk91LArI6yaBglzBIZ57i2Rttt4=;
        b=0I6prQ+o9hBKlVQK65s7zJ7P1j/BlSBXRgq9K89ET4q1kyAVoaQNR057+BT5H0+Fcq
         sE9AyJJP2iqUTpTvQhPV30I84yZm8zaxaV4tFF5Dbwg6bFr2Smh0E5Ed1NmksRxcTInD
         gKswgUhD4v7fWEpGm/hxipkDqNxf85J2bdnuH0emePe9I3bOTrvB7kFM0J7dyfgmELvj
         P5aY3YG3ZtRdiU3OK6jUTjqzTK0/RlW5GR4/zP1+/ogqDLhgJ3WnzTztmsthnyDusg1s
         z3H3A2BfuKxZlqDxtNJNjpaEM3BvwKAN8aIH9YPfMlA9+srHGi8GmOeuW2U/b9EY96yQ
         A1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689170281; x=1691762281;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oC9OkzryYNUsrIJJk91LArI6yaBglzBIZ57i2Rttt4=;
        b=Dad7O9DOg21zWBg7US+HZ8LQ0d6suucBqto1oVBXc6F0mYhw8lLGuvWTtmzp2tmsV7
         iSeejer4eaS44rFpGqRFI/aBhR69jB9lHUCHgd6yn6et8AVZblZdwzasX6dDlv4xuwke
         IlHc2Bxp3Lta1jX5fXmFxO4l9Y4AtMT5TE+STrX/2P2UjrzvfufZ4VTYHSjYLtMdDnS+
         i7NducpLLwpK6S0stOwLWooDapixcHQT/q9AjL1KF7WaNsVcVMYe03xf+u8miP6dx0PR
         iveR0yhHNxVYYFih6ht9hkgFbH6IWbeu/avgmDNWaUpBrFYcG7HqSsdzcGSTHFzqeE0u
         bC8Q==
X-Gm-Message-State: ABy/qLbpgpeWoq28mHgH7Qr89HEAgFPrjw17JKh/+UOHJjWbrGVpNIIM
	hsZ1zL5bHSZjAUz2nPFiMepnkg==
X-Google-Smtp-Source: APBJJlGMmRhlspwbc2SXLIA/EgEjHhFgOkiHVK6IGfF+ogbpCjLazhHNp932RmH00pOHrbsBL79krA==
X-Received: by 2002:a17:90a:b011:b0:263:4164:dfba with SMTP id x17-20020a17090ab01100b002634164dfbamr17923406pjq.6.1689170280755;
        Wed, 12 Jul 2023 06:58:00 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id g7-20020a63b147000000b00553b9e0510esm3551363pgp.60.2023.07.12.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 06:58:00 -0700 (PDT)
Date: Wed, 12 Jul 2023 06:58:00 -0700 (PDT)
X-Google-Original-Date: Wed, 12 Jul 2023 06:57:13 PDT (-0700)
Subject: Re: [PATCH] riscv: correct pt_level name via pgtable_l5/4_enabled
In-Reply-To: <a7bb09c9-870a-d8f2-23c3-7f6fd2c68e2b@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  alexghiti@rivosinc.com, Bjorn Topel <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr, suagrfillet@gmail.com
Message-ID: <mhng-05add620-8132-496a-a514-4b78c78b3694@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_065804_291165_9CC12F81 
X-CRM114-Status: GOOD (  24.77  )
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

On Tue, 11 Jul 2023 04:14:10 PDT (-0700), alex@ghiti.fr wrote:
> Hi Song,
>
>
> On 11/07/2023 12:52, Song Shuai wrote:
>> The pt_level uses CONFIG_PGTABLE_LEVELS to display page table names.
>> But if downgrading page mode from kernel cmdline in 64BIT, it will
>> give a wrong name.
>>
>> Like, using no4lvl for sv39, ptdump named the 1G-mapping as "PUD"
>> that should be "PGD":
>>
>> 0xffffffd840000000-0xffffffd900000000    0x00000000c0000000         3G PUD     D A G . . W R V
>>
>> So select "P4D/PUD" or "PGD" via pgtable_l5/4_enabled to correct it.
>>
>> Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
>> Signed-off-by: Song Shuai <suagrfillet@gmail.com>
>> ---
>>   arch/riscv/mm/ptdump.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
>> index 20a9f991a6d7..cfdd327981ee 100644
>> --- a/arch/riscv/mm/ptdump.c
>> +++ b/arch/riscv/mm/ptdump.c
>> @@ -384,6 +384,11 @@ static int __init ptdump_init(void)
>>
>>   	kernel_ptd_info.base_addr = KERN_VIRT_START;
>>
>> +#ifdef CONFIG_64BIT
>> +	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
>> +	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
>> +#endif
>
>
> You don't need the #ifdef here as pgtable_lX_enabled are always declared.
>
>
>> +
>>   	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
>>   		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
>>   			pg_level[i].mask |= pte_bits[j].mask;
>
>
> The Fixes tag is wrong to me, if satp mode is restricted by the hardware
> itself (not from the command line), the same problem happens. Maybe that
> should be the sv48 introduction patch? Or the sv57? It will be more
> cumbersome to backport with the sv48 introduction though as this patch
> won't apply as-is.

Sometimes it's easier to base the fix on the original offending commit 
and then forward-port it via a merge, I haven't looked at this one to 
know for sure though.

> Otherwise, you can add:
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks.

Song: do you have a v2 that addresses the comments?

>
> Thanks,
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
