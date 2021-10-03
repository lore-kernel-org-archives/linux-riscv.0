Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB579C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D62061A58
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:10:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D62061A58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fuCK79GqXNlUl8STXa3KJ23Bv8A+Wlfqw+BCCgjNmEo=; b=kdbX7FAK90gnHJAIblbKRLg+pH
	oRWPOqaFe/cCsazklvqdV69vzJVvFUGdQC5M5NN0ttyOlKYUcCE+2981NQQXiRJocZLrCQbx96Rfg
	9Y9LCoqsERlmJW9pGZnlLPs8YUnNUd9tnwqRSmwcGPY0X90oTubamXJvaUwzAikGj7aeenyyq3dbI
	AzM7rFbJ/4MPnBstegPudPaCTxgxuOvIMqKt0isNr+BgDFRrHu9UXNHOza6n5/zLfvQpbtzhMVxNP
	2VQaG4wOh3FLuGHVBB45gX7mDqrHDLtVRewCEieU82JytWKg//9WWCBF7Nl+2OrXJvcymq1fKU5lg
	OYDwxEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX50H-0048g5-Nf; Sun, 03 Oct 2021 17:10:21 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX50F-0048eI-Ma
 for linux-riscv@lists.infradead.org; Sun, 03 Oct 2021 17:10:20 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so1056179pjc.3
 for <linux-riscv@lists.infradead.org>; Sun, 03 Oct 2021 10:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XqU5xxUtbfKhmbzvtVRG2mL5cvmccHFZc23S52GP8YU=;
 b=3HhqwmyONH+HAZjlWbQ4qlMsCx3Jbe8gS1rUYF86cMkuWV61LNl35jeXbpcH5NSMpF
 sW0zU0viXMSYz1ivdfEVmSB60LEcOsvFXd163p2+K98AqPgmjf1rQkGGW0FttZo2tKlI
 p1Oz6Ox1CbitgyRs5oDXPTFKOuLwKiJj4X2bvcO1YZcSMlddiCwIWC4SpuJRbAsSde0r
 qP8PWtf5hRIUcnz9m80sLs+vpB5fbvuw65OMZiAeY7ExpJs3U2ywghS/5+o+xlovnIcX
 2lljUN3HPFRR9Zv5XekuTTlqVGOZ2kKZaH4rmXAc44dRL+j6bwvskdWdrVMbPp4gsH2w
 EWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XqU5xxUtbfKhmbzvtVRG2mL5cvmccHFZc23S52GP8YU=;
 b=pICND5LrpZxPCjMBIDzxQIkLVG35KifRHa+DJmbzM4O23fEX/9/xsDWZ62Q0NxRUOa
 LyfMaQsAYKIq2Ha2Cgq4izisKUL/XFhYE6c0S2+hYQy1XM5tQdBj2e3Kq6xGrh3tuchC
 2mRz6YSe4C0z2MSerO6yeqjSs0/A24HOQbSZJ9I/6pLcb8eDo2pmhneObF3CD6Zsrkyv
 XcFO2XD9QehvlOZHxQymFYtHR6ddriYGyIYCJhmxVDbV5Gzf7GlM4c3oID/WC8tuXgom
 xgIKTajel8T5G7c/AFkvpLnyeR+UCi8bXw8iQFOYbpNnYLceLgkJMAtziwRpmShSEAs7
 A54A==
X-Gm-Message-State: AOAM532s2VSm8MzIvERc56QE7wdjSPwSDjy+KSuYarV7CDu5JK5ObAZi
 EJsWkraoxOLq+YfpXmLXR2iG2Q==
X-Google-Smtp-Source: ABdhPJz5wVVQBO5UVRyqKi7Bs/arqdH2MJINzBJBYNffFsOvVV+m0U3Xe2Gj32qC6yodgt2CeR4qlA==
X-Received: by 2002:a17:902:8682:b0:13e:5d9f:1eb3 with SMTP id
 g2-20020a170902868200b0013e5d9f1eb3mr19542381plo.42.1633281010437; 
 Sun, 03 Oct 2021 10:10:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g22sm14079578pfj.15.2021.10.03.10.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:10:09 -0700 (PDT)
Date: Sun, 03 Oct 2021 10:10:09 -0700 (PDT)
X-Google-Original-Date: Sun, 03 Oct 2021 10:09:48 PDT (-0700)
Subject: Re: [PATCH v2] riscv: mm: don't advertise 1 num_asid for 0 asid bits
In-Reply-To: <20210908173029.1104897-1-vgupta@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Anup Patel <Anup.Patel@wdc.com>, jszhang@kernel.org, guoren@linux.alibaba.com,
 wangkefeng.wang@huawei.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 vgupta@kernel.org, anup@brainfault.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vgupta@kernel.org
Message-ID: <mhng-b9942988-c667-4fb9-9047-7033a62dbb74@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_101019_765498_75A04D1F 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, 08 Sep 2021 10:30:29 PDT (-0700), vgupta@kernel.org wrote:
> Even if mmu doesn't support ASID, current code calculates @num_asids=1
> which is misleading, so avoid setting any asid related variables in such
> case.
>
> Also while here, print the number of asid bits discovered even for the
> disabled case.
>
> Verified this on Hifive Unmatched.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/riscv/mm/context.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index ee3459cb6750..ea54cc0c9106 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -233,8 +233,10 @@ static int __init asids_init(void)
>  	local_flush_tlb_all();
>
>  	/* Pre-compute ASID details */
> -	num_asids = 1 << asid_bits;
> -	asid_mask = num_asids - 1;
> +	if (asid_bits) {
> +		num_asids = 1 << asid_bits;
> +		asid_mask = num_asids - 1;
> +	}
>
>  	/*
>  	 * Use ASID allocator only if number of HW ASIDs are
> @@ -255,7 +257,7 @@ static int __init asids_init(void)
>  		pr_info("ASID allocator using %lu bits (%lu entries)\n",
>  			asid_bits, num_asids);
>  	} else {
> -		pr_info("ASID allocator disabled\n");
> +		pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);
>  	}
>
>  	return 0;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
