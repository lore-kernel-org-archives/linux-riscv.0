Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC838C5AE59
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 07:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zy0FBtZDmhWpMe/dME6sdCi7jBb9FsZGsDN139DQuco=; b=PJUEJ+y4z7MAZf
	hvdAszzQ7taHYNtttjbKfkVkPWBGcTpdznUv/0SL9YXdWDjTsZgLQTckBV/cGXG8I4ityuwIZ8Wfi
	AbmV8qRNLMJNMFODyuARL/ZI+ippSGxoAXaSG9MLX/Ed2GdoIf5447u1sL72GBqmfbFvJ/+xkvEI2
	Eqf3Vmiq1UvGVVCPvPkcDOdLUXMwB5YFxzDAJUcbCEruTmReurP45jY6jTkVdwAPF6+c9kFUgQVK/
	/cK+sG4cBO0DAky7ae1t/tOtSZzSzPatoQzeWm27X5MjBP+cV5AQ764rz7K3+JJsDumlTqInKFGeW
	IVGAglVTsE9Rq1N42VUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5TP-0000000F0ea-0VFB;
	Thu, 05 Jun 2025 07:57:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5TH-0000000F0cf-2X3I
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 07:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749110226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
	b=TO0dPqWjacUCJlQPcr0GVNYHWQvNAOsP3mEgYfqJhDDYGM/70Kej9Ag/4JBnqXvydpUw7r
	xKyIrG7bGMgrCsa0T60gsv22X8zQ1gCF+Z/9LTfwG5+oprqGSoVYP0E3a3smLme2ZbqpXN
	IRUjuMMf3uojvywgFjJ8WksFe3gSoBI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-216-dgF08mkGNGqeKQQ1kmBrPQ-1; Thu, 05 Jun 2025 03:57:05 -0400
X-MC-Unique: dgF08mkGNGqeKQQ1kmBrPQ-1
X-Mimecast-MFC-AGG-ID: dgF08mkGNGqeKQQ1kmBrPQ_1749110224
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb94dbd01fso50886866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 00:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749110224; x=1749715024;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wRyOEDXETxIkKIFfjZs2P8W26KRROUKYMIqAGAlgFBI=;
        b=NK6a1ARJFTj8MMhExohWSaDYAEXT2BWH6AKhY2PtmAGjE/ylKvVNLOmB4K8kyuS6t2
         fVFjLVnJ+iRY/S9bi+iud59K1FMAwzeufr2RmSxhsEPcQcdkCfN7pE8E8Rf2DeeINhQg
         U6BgdBO16q7ROqEHPzl7pQF7LU5V99U2+Kx3Tplbs6UD6YcHxU6rtgO0lrTRCMg0ryP4
         6ocIywEKz7dTBfjtITxqVGyBt1tvFr+HA/FaAhIVnHLw5zRBkXU/k869naya+0Myqqxb
         /3mucQ8wy2WoPUDVbfphVJz3+9rbW+yGC2tmKRplwRhF4R4tbvqDTwK1MwUwTfRKLM2g
         xVIg==
X-Forwarded-Encrypted: i=1; AJvYcCVQeFqtCPcg+08qSmPkNSUP6apwM8S2/4NMX50JozRTVgQk3Amz/vZ4wor0ppCZlD+kkfdAhy8m4YBi/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyI9oisKtLXUTV1kI0HDysDREI80uYfQ7mG9n+7YO/OYCRbn3dG
	KtJCFic77p4/5T0w3QGNWk21kz/THtPr0Fh7zlbUS1N2YITh3NA+KhqrbP+abDC8Z/2n4tKG/4n
	6URmoRtmwl7tPUB2QiiyjEJ2bVop9crPaXilNY+zDUsoBwBTjJdaS/K3XcsahwFPeZI7GZg==
X-Gm-Gg: ASbGncs9WJ+qc5gIpwG5KW0cebOjLh5UkEvpiO/P493bx2p5SnFckW8s2MAAOL1Ysrp
	xffDFYNHLtxAH5b/aLtyFhLA/gUPx+mmzJ7EmSQXagr+jJxzwml3qEkCVS7qIV1HewSzdY9nxql
	n37TPEDw+RButRHRDVIQw8hUprToTSsYx4y94FMgVSATFYzHmNHKaVWVBjx8weVoah8dghoO38i
	wOiOJNPMFGeRrWqJ9wOsAqVscXeopSeufLnza2rtOlTXcRasu3xtRnMSN70hiRD+yvTW+bQRBKq
	IDAdnzS83/Hdb/Qc3CLU5dACG33b4aD2rOm5ZhbyEVXqQQWSUZ58aRknB9ALBEdveMPba39N1TI
	Hbl2AFgiVpzmMnd0Qd7bc8mWF50XipsVPBKhz
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-451f0a6a94bmr54009515e9.2.1749109770019;
        Thu, 05 Jun 2025 00:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsjcg/PLPpLyQGdb23N26umjiH63blsW4LCsG+AuyVl004iXQAfjzXr57lLLdanZJ4s608g==
X-Received: by 2002:a05:600c:3106:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-451f0a6a94bmr54009085e9.2.1749109769586;
        Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb22a7f2sm9315935e9.37.2025.06.05.00.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:49:29 -0700 (PDT)
Message-ID: <b064c820-1735-47db-96e3-6f2b00300c67@redhat.com>
Date: Thu, 5 Jun 2025 09:49:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] mm/pagewalk: Skip dax pages in pagewalk
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 gerald.schaefer@linux.ibm.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, zhang.lyra@gmail.com,
 debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
 lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
 dri-devel@lists.freedesktop.org, John@groves.net
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <1799c6772825e1401e7ccad81a10646118201953.1748500293.git-series.apopple@nvidia.com>
 <6840f9ed3785a_249110084@dwillia2-xfh.jf.intel.com.notmuch>
 <20250605074637.GA7727@lst.de>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605074637.GA7727@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 95IU9f_-2J6Sxg6hbTF2DoqGX_hQp8x7N9BsswB_Ick_1749110224
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_005707_705840_C72EEC95 
X-CRM114-Status: GOOD (  10.82  )
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

On 05.06.25 09:46, Christoph Hellwig wrote:
> On Wed, Jun 04, 2025 at 06:59:09PM -0700, Dan Williams wrote:
>> +/* return normal pages backed by the page allocator */
>> +static inline struct page *vm_normal_gfp_pmd(struct vm_area_struct *vma,
>> +					     unsigned long addr, pmd_t pmd)
>> +{
>> +	struct page *page = vm_normal_page_pmd(vma, addr, pmd);
>> +
>> +	if (!is_devdax_page(page) && !is_fsdax_page(page))
>> +		return page;
>> +	return NULL;
> 
> If you go for this make it more straight forward by having the
> normal path in the main flow:
> 
> 	if (is_devdax_page(page) || is_fsdax_page(page))
> 		return NULL;
> 	return page;

+1

But I'd defer introducing that for now if avoidable. I find the naming 
rather ... suboptimal :)

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
