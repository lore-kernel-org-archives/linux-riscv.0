Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14471CA0FE4
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 16:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=/nNRVeoqyr+llVjsUW8jOapBGOqkUMeRePBK5FIh1nU=; b=rtU
	01WQ8LA9ReLHLYphD3fW9kfNWmlPImw29+d/c22hJi1aOMQOGSnUEmLegfvEWb5U0PU/BsdpW6g8H
	9plLDlJ8AfW82ta9NJQmDviZNE4riQ63wVknxGNTBH5yLEBCtsDHdm5ag6d/nYQCUEwzD2LrYOx1d
	6qJUQbGCYiOvoQ/8yzF4CQkldbKTUQMkKQ5XfrZxYxI9odN798P9EdMhxNONAFOFbMRhEu2tBTkXr
	a9658yu1JfR7Q5IcpmRijHbybk0q/zQeYFRike887wEWh2Fy0XTYU4N3MsuqgLVrx/7TX9EZTr+jG
	uN4BvyvVSQRfdSMoDb4Md8QUjtDx9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc7I6-000BaX-0w;
	Fri, 01 Sep 2023 16:46:38 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc7I3-000BYV-0o
	for linux-riscv@lists.infradead.org;
	Fri, 01 Sep 2023 16:46:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c091a563ecso25333345ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 01 Sep 2023 09:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693586793; x=1694191593; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCon5474F9WwphxhfgFhUzbwn0ALvK9xFv6P5Xz3AWM=;
        b=TJFSeUvGlwulJy+7BBDkB+TxMnqtZcXWDluuKcHvWW+ByhwFvqZGVKpLxYwxQiBFaW
         B7b8jm+YMnEPlmFTGmCiC0aR+lZnLfrDk6YSSKxjh0gWHDoHpeG7MrTD7y23wdk9D76y
         s5Q/7LU3t9vnUfL8BvmU+bpa2hexQ5bx6vE3fAd3gXt2cFhdfQOf77A2cfefTEpuPDia
         lAUOBecrhBuzKYZ5b2O1aQSqddMZh+g9KnM/axJeV77ME1b47l9Y/Sdnm8/50f0Q1w5k
         CT6wHdlHqFjCUTfYCup+p8GhRfaS6cw9njcw3eaOYgdIvAG7F3HCfUKu/R5R/75YVttw
         PRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693586793; x=1694191593;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCon5474F9WwphxhfgFhUzbwn0ALvK9xFv6P5Xz3AWM=;
        b=LBGhlbhE2iQ+tSoY9WwJ6O57cUDUkPzSW3hwy5IyekQ46d6OOMwYvsFytun3JVVjpz
         BrgEUjt/dziQeVSjch3TyKRXHoRPAXeBbX1h9eEVfLj+TDph1QLtnfvOMSu66ivYqu2V
         MwdPNpM5Fsl5pPZdWVmQY/9RoO62KLlcfH8CosWhR9ITBhsfOvTA5+/84JLB24skLtIb
         bmvIJH0wjB0DXvICk0Mr7C69EBLpilxJne+581UPPGRrHx8wR7gt0ufsH3hFiEXpcbdy
         pzkJHHp4JUctiGYI9HKEmn5qRfSn2E1QZSjzCBMezuysb1eA1XSESaGb6OCTvh3n2vwe
         1B2w==
X-Gm-Message-State: AOJu0YxyjXOguSQPqW+qqJXUH4Q1CX806USQQjFG2rpf93EWoDVP558i
	RIALjO/eqEHEudmFOttVwjRmP3j/44v7Sd9zCQ==
X-Google-Smtp-Source: AGHT+IE7IWuztjp33Ush39YmsLck94qkQHf2UcyeDE5trFHuf5V0W6HBwaqY0C7q2Vl17GPr3mAIvAb6tklgxvjU0g==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:e887:b0:1bc:e6a:205e with SMTP
 id w7-20020a170902e88700b001bc0e6a205emr1066486plg.5.1693586792693; Fri, 01
 Sep 2023 09:46:32 -0700 (PDT)
Date: Fri, 01 Sep 2023 16:46:31 +0000
In-Reply-To: <f7aaf097-6f83-0ee9-e16d-713d392b2299@linux.intel.com> (message
 from Binbin Wu on Fri, 1 Sep 2023 11:45:43 +0800)
Mime-Version: 1.0
Message-ID: <diqz34zxg7tk.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, 
	linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, maz@kernel.org, 
	paul@paul-moore.com, anup@brainfault.org, chenhuacai@kernel.org, 
	jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, 
	tabba@google.com, jarkko@kernel.org, serge@hallyn.com, 
	mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, 
	michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qperret@google.com, seanjc@google.com, 
	liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, 
	linux-security-module@vger.kernel.org, palmer@dabbelt.com, 
	kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, 
	linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_094635_292056_6D099456 
X-CRM114-Status: GOOD (  12.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Binbin Wu <binbin.wu@linux.intel.com> writes:

> <snip>
>
>>
>> I'm not sure whose refcount the folio_put() in kvm_gmem_allocate() is
>> dropping though:
>>
>> + The refcount for the filemap depends on whether this is a hugepage or
>>    not, but folio_put() strictly drops a refcount of 1.
>> + The refcount for the lru list is just 1, but doesn't the page still
>>    remain in the lru list?
>
> I guess the refcount drop here is the one get on the fresh allocation.
> Now the filemap has grabbed the folio, so the lifecycle of the folio now 
> is decided by the filemap/inode?
>

This makes sense! So folio_put() here is saying, I'm not using this
folio anymore, but the filemap and the lru list are stil using the
folio.

> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
