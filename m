Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2070AC3DA7F
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 14:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tPfMg6ZDQARXXx74ZnY/H7TA1eBHKgiuDdIR9J9fXgE=; b=PxpHGAeK3cM8bcKF4rDSNfIBJd
	UHQS7PmhA8YT+BWXLNhPaTIFKlLc7Wqe4RX6u7BhTpNU3UrK2RY8IrbXBQZFEMs+uD0XEv7rlcVV1
	1fX5fTUpOFzktjna4MXei9i7itPtGTY2in0y/gYnpYsFcTJGJ9KmcN/v5ELZLWy5j85bLbDXEgynU
	nNUut77w5/GRjE9kCRq0Ro+kv/Cv8lOrlHaZnaNhq/xr+r+NOpU1LPIKenBiRs+E/NPXInmyaoRPL
	BywKnsVzFhRwpHqGP413wml4HmIcb85zW6uL+lAXBdCbVkz7A8ueQ5dSvcwXsUeApSIyP/+XC56yH
	bAzUnhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhHz-00000005GFU-3RNR;
	Wed, 07 Aug 2024 14:05:19 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbhHv-00000005GB5-2Iw0
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 14:05:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fd65aaac27so6800825ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 07 Aug 2024 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1723039513; x=1723644313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7NuKEuNAEDDonJbflFqF6cc1mi7/GyByOe3Qb835s0=;
        b=cmFoQX3LkSFMoQgzbk6h6yBIPa9lRu3wSh2wbRGXWPJFPepKt2TaWLQ3K/HaQIOWHN
         paVKv0cAwi4H3l/CcWZTyB+MNmbn2IjwnISHalnLSagSRaQoEStcOwKkTGPSoyY+1zFM
         TnGhvC+Q9YCwjPPm/TTbSiar4CnFmz8UqWkyOOKznbonjXlwQbNW0Mn6QmXHTNGTj1r3
         +uQgvMXyrnjUTT0PjdRY3XW8rrnEsTzJc8HZoKyB/Ju5xFZa0sx6OARLkSvSCKSR21lL
         +uMqjEoqjDwjsFVZtRtaTaHaFTl8awfB9c3S52K/M9dKDM/Zmh+fCas8Z2Jvgd730ypr
         o5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723039513; x=1723644313;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7NuKEuNAEDDonJbflFqF6cc1mi7/GyByOe3Qb835s0=;
        b=U0/mRQW8ld+9zwOgmnyrFQbtyxE0DjJGSgbV5Fy3d2C9SZZhslM0qvfoZts8HYRMnh
         9N7RVIhH+3poHwoWHINeASxPWk2QJKXZyf0yXjdXezsmw+0GiewVzSwmtkELaKC3P2O0
         ICfyhZ1ea7MPQ1rnkO/u4RIAVJg+cnJJ0+fNgy7JLeiVnnQ4z2Dl4tSHTd9cUHP5/u+0
         CHHVAy1cxoPf+5VkjTArreJmKaOUWXEwtKSgPqpk1cqSxZh3QRQpkF3DlY9jggpDyOu0
         GOkcxlPtyf+m1xiddGcw25TRRuYgKysoXTVopDGNh8MzUrz3Q+trgXJ32x2r6OgJkF+b
         +yDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy8iMQIFHVU2EnBhpcoNXv5mM/OygHgzGijoYpXfiRJmNPvTY7o/qQJtgGknd0CdL7a5lferLx+Zbo8wLF3K1xfPomuPpBb7VzzJmWvz8z
X-Gm-Message-State: AOJu0YxJUvW5pHSHOaMsQpvo/I0Mix/hFUPD3JB+26/FlhCMgozWiw01
	4vFFq1aKnQ9LTRm+GCaYRi342Lj/vaweyMW0VoqeO0lM5ut5s23TEIkmkp7Q6LU=
X-Google-Smtp-Source: AGHT+IHbNE3uAo6skGAZ8w9sQZyK2nZZ+HSVtYrhD6SCOP8zNLQFL7ilUF06DocA4W64lu55C3ISnQ==
X-Received: by 2002:a17:90a:e2d6:b0:2cb:58e1:abc8 with SMTP id 98e67ed59e1d1-2d1b2dc628bmr3321084a91.21.1723039513050;
        Wed, 07 Aug 2024 07:05:13 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b374b3cesm1617103a91.48.2024.08.07.07.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 07:05:11 -0700 (PDT)
Date: Wed, 07 Aug 2024 07:05:11 -0700 (PDT)
X-Google-Original-Date: Wed, 07 Aug 2024 07:05:01 PDT (-0700)
Subject: Re: [PATCH] binfmt_flat: Fix corruption when not offsetting data start
In-Reply-To: <3659aee7-8baf-442f-aa81-22bb6fd1a11d@ghiti.fr>
CC: sorear@fastmail.com, linux-mm@kvack.org, linux-riscv@lists.infradead.org,
  ebiederm@xmission.com, keescook@chromium.org, damien.lemoal@wdc.com, gerg@linux-m68k.org,
  wbx@openadk.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-60ec65b8-04ef-4535-94b9-843386bd8922@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_070516_046872_B4212571 
X-CRM114-Status: GOOD (  22.56  )
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

On Wed, 24 Apr 2024 13:44:31 PDT (-0700), alex@ghiti.fr wrote:
> Hi Stefan,
>
> On 26/03/2024 04:20, Stefan O'Rear wrote:
>> Commit 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
>> introduced a RISC-V specific variant of the FLAT format which does not
>> allocate any space for the (obsolescent) array of shared library
>> pointers. However, it did not disable the code which initializes the
>> array, resulting in the corruption of sizeof(long) bytes before the DATA
>> segment, generally the end of the TEXT segment.
>>
>> Use CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET to guard initialization the
>> shared library pointer region so that it will only be initialized if
>> space is reserved for it.
>>
>> Fixes: 04d82a6d0881 ("binfmt_flat: allow not offsetting data start")
>> Signed-off-by: Stefan O'Rear <sorear@fastmail.com>
>> Tested-by: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>>   fs/binfmt_flat.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/binfmt_flat.c b/fs/binfmt_flat.c
>> index c26545d71d39..70c2b68988f4 100644
>> --- a/fs/binfmt_flat.c
>> +++ b/fs/binfmt_flat.c
>> @@ -879,6 +879,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>>   	if (res < 0)
>>   		return res;
>>
>> +#ifndef CONFIG_BINFMT_FLAT_NO_DATA_START_OFFSET
>>   	/* Update data segment pointers for all libraries */
>>   	for (i = 0; i < MAX_SHARED_LIBS; i++) {
>>   		if (!libinfo.lib_list[i].loaded)
>> @@ -893,6 +894,7 @@ static int load_flat_binary(struct linux_binprm *bprm)
>>   				return -EFAULT;
>>   		}
>>   	}
>> +#endif
>>
>>   	set_binfmt(&flat_format);
>>
>
> I have this fix on my list for quite some time, will you respin a new
> version for 6.9?

IIRC we asked on IRC and Sorear wasn't going to respin the patch, so 
unless someone else wants to pick it up I think it's just going to get 
lost.

>
> Thanks,
>
> Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
