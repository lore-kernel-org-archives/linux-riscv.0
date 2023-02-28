Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B4CC64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 15:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCGwvpiKxCWgpwYAsI1H2zryLWp7cFNXQvrTdc4pIz4=; b=QiLPIY48+1T9za
	e3GBzRg3V+kXVfnaRqg/mZeyNtaMZCupGqRjb2Mg2RXKm9iIL2lZiS7AiwT/8A0FFospoqIkb2qM3
	cvPrgiO0Rcigch/kxtV4yKeUFCsJ8qhAaZtVA7ABFk3uE2CsSFnag/FF1ShqrqmVNY8+5CRK062kR
	fwLHVHPlEIHssU0HbBTVCEyDbs5eb+/a1TBx8Atlfol98H3xkp9CPZPVEGCWNHPDIxF41rAn1g8XP
	Xcgn9P90pLEB6TbTYUPMF64pBvnwrKRlRn/3M+6UWtofrHxyBxngJGxiXnU6SSj4x01fQklsD9/AI
	UWsKgdgdapdUIwRQg5Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2LI-00DhPb-Mg; Tue, 28 Feb 2023 15:56:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX2LF-00DhMl-2p
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 15:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677599795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
	b=L7YliKV/d3202CCEuU9Fu2ac86tPOoUC+750FU1UZiFNnKKVsSvv9T7SgjZOSG/zn0wRsS
	KY458A7FWA74fitA5SLEBpgpLgM7VD7z6cx4ectDFvde8wsW2gXG2GVzJ6wVslmhqI/Rb1
	YK4AHB1E0McrSW3VjATaBEavJpoDBjY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-550-mktzKw1hO6aapMvM9F4Frg-1; Tue, 28 Feb 2023 10:56:34 -0500
X-MC-Unique: mktzKw1hO6aapMvM9F4Frg-1
Received: by mail-wm1-f69.google.com with SMTP id u19-20020a05600c00d300b003eb24ce58ceso3764632wmm.9
        for <linux-riscv@lists.infradead.org>; Tue, 28 Feb 2023 07:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7pSWC5euLmUDx9YG5RWzWaGkcDB950fdhQfUYWKICc=;
        b=i3ldGcDCqCCxTac+a4FgN7TY8uBJyzirD9FOJhkZW8kBbyZEarPJlqBtOEK8kkjgeW
         wOsFuTNmh9Fl0r7FY7CTqitSATK+E3+ds+YwnGw3INaCt9ERithmhmfrJqBMn5y2o8SN
         /+JvcImqYcbCYrtOiqJEZo+y7PpParBJ6aP9zZAqtAh7Ev1Hf1ZnCS53qNRQXzJPsV1p
         0NS1Itvqt6QeS6GMy9n066ByKUJeGvt48r5Iea91iHGq/B+XYagz3rkDuWv7ACDxhZJc
         y/KVYmvB5RYG7y3gZSFc7eKoSxUZ1b3C/0AC/WkgodcGziTyimE+vvOXJYdWl98VAiza
         fT5w==
X-Gm-Message-State: AO0yUKWDkAdQi1FFHo7p3fmsHUIuJ2RRtCTu/ERE89uk77xZEhwHDcR7
	lD44uyxhwBW7XtHeSAsMrNDfU3qSDZEea+L5XRd0CzPZLPoszfpokGI6RX99XyEnMwVV4HIpbr7
	9cy5P5whT14jOvLRcCynbIhCETKpK
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985251wmb.12.1677599793386;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/U2v9f8GltbBAhuiD5VLcyopD+EwumVs1dLk0qMzdF/fI8DkaFn74NX3LW8zhnIM6FtbCCQg==
X-Received: by 2002:a05:600c:1e20:b0:3df:9858:c037 with SMTP id ay32-20020a05600c1e2000b003df9858c037mr9985221wmb.12.1677599793078;
        Tue, 28 Feb 2023 07:56:33 -0800 (PST)
Received: from ?IPV6:2003:cb:c706:b800:3757:baed:f95e:20ac? (p200300cbc706b8003757baedf95e20ac.dip0.t-ipconnect.de. [2003:cb:c706:b800:3757:baed:f95e:20ac])
        by smtp.gmail.com with ESMTPSA id hn6-20020a05600ca38600b003e21f01c426sm13465165wmb.9.2023.02.28.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 07:56:32 -0800 (PST)
Message-ID: <bd656b2c-9a20-dea9-dcef-9cc965bccc9e@redhat.com>
Date: Tue, 28 Feb 2023 16:56:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH mm-unstable v1 19/26] riscv/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 hughd@google.com, jhubbard@nvidia.com, jgg@nvidia.com, rppt@linux.ibm.com,
 shy828301@gmail.com, vbabka@suse.cz, namit@vmware.com, aarcange@redhat.com,
 peterx@redhat.com, linux-mm@kvack.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
References: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <mhng-b8dc8a57-dde0-4995-bbb7-3948a95ba0b1@palmer-ri-x1c9a>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_075637_264070_3113870A 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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

On 28.02.23 16:50, Palmer Dabbelt wrote:
> On Fri, 13 Jan 2023 09:10:19 PST (-0800), david@redhat.com wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the offset. This reduces the maximum swap space per file: on 32bit
>> to 16 GiB (was 32 GiB).
> 
> Seems fine to me, I doubt anyone wants a huge pile of swap on rv32.

Patch is already upstream, so we can't add tags unfortunately. Thanks 
for the review!

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
