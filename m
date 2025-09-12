Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E042CA101F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 11:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQQgTdTCNdNHcgcbC0mFa4/Su7avWbpoQHff7JAY6gU=; b=x+/cxfAJzzQHup
	MocSVr0dfDh+T4h7Ugr3ZCNKAFP35ps02cAbKhzccIQfGju91M0hD9mSLUjoQsD82sUPo98xCmgWL
	pjGdDHILh/1wbwp++gpSWf3Tqp+Z19FV3SvG73tTzh2zOA7auUFIsWrC19dAySXTNVrMXVow5KDul
	20CVz7Cgojc1huB4xDSPaDzvj4VN211xMRCGOBIqXsu+3d+gqeGUVilfM4whxPRiSXafDF4agOMJ/
	/dddgOr4TPcQjCNrRTdTunFHRguFXyU5X8Az1um//f9zCFPP3VIQSgHFG7+bEZLNx7fOK2WgPHcm1
	SS2lVYr6MmJuJBgztqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux23E-00000008uUk-03pl;
	Fri, 12 Sep 2025 11:34:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux23B-00000008uTK-32AZ
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 11:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757676884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZWd+C+6xlO7ZNnElus07Td372OLIDupg0E/fPHS2G6s=;
	b=ZvmX+MuaI7fq9su/P8Tq5g5r6EwR9P3qAhfztP9I7nr+HJ8ZUZExFcnZclGLxXwMZhRAMt
	Z3nQVDgSexEPVYBd3w57p7Cz3xmWQpKWNrJzbRO1tjZOPus46v8+p7luq6dvvCcC69SJ7l
	hw/IIV2XH+KNp623J1Rbvj05JO4yy6w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-A9e4GfJoN6qA6GBQNt71NQ-1; Fri, 12 Sep 2025 07:34:41 -0400
X-MC-Unique: A9e4GfJoN6qA6GBQNt71NQ-1
X-Mimecast-MFC-AGG-ID: A9e4GfJoN6qA6GBQNt71NQ_1757676880
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-45de13167aaso17418225e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Sep 2025 04:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757676880; x=1758281680;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZWd+C+6xlO7ZNnElus07Td372OLIDupg0E/fPHS2G6s=;
        b=fgW06ixqsELISPo6QpIXoJP4GyQuxLSABzunBd/+V1JJTKBVZVSMUxZvRwDO6dcbsd
         WO9dT9LPYyV7c/6Ol5Nb33l1T89VDgkYFOCi4WKFh6RsbHKKUh7WZRM4EKIOHNf3xAr6
         TEIx+8hL8Pt219PkW6XU5b6t6fCzJLxeNKvoNsKJUXEN7wXbYcMbnHBOKZ6er6uETzOJ
         wfbErLIPWY8XpxKGUKtOuV2HF/7W5wEJlG98ig32SwYCmw4v2tIoG2uDQTtVC83Af5Zm
         qqBdTLpDUaD/hlRrC5fXSxBIKZXrdEPWmGRR4MtTSiW8aTsAGM4+G6l5UtUjYlr5hurX
         4vEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAHs1RpxtHrRPFdcQKfvyI9ekowFcg9Vtf9e9vvnvDWEsW7RcaRmSW+yhjDolH8kulvlDQ8oKaRrdeOA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2MMdSzJmBJtVE4tOTOm3Z9Ay88w5HgiAtoWQZ61rPuUju+nZn
	9MZuq8CZWJc+FbDAJNM65BEiIbj89z8Wq4xzA2FqpRAh7rr0zbQ41ZJfA5CdzAqsAOcoey2OTOo
	c2h/obEoI2iwa2U94eUXIeTERnKXbgwAV3C9WwJVILHXdbQ9V5gFPYfxDwVdtdpbGzfjXyQ==
X-Gm-Gg: ASbGncuCOCZk0jbPoIqm4/bb2SWkSfYpK+63VNF0e3Ux9vPhKvSdOV794e8VG5m5Bly
	A5pFZmCnXGPvx3Tk0WBHX6X8St1R/2FnLPJT3mtcq3CuRsSp1C/ggtyu4mi4fKp7TKkeF8vP9M+
	HX7+/1yV2zMDwEWkviqLADyvhcvIHiZzRdyJFN+QVBF93NPFA3NPxJ5HF/D01ppnfvNyErJNjbI
	3ViBCWYL3jEmugImrPJOwkdvs5ERaxNT30pCbdSWO4kUHBE6utE3N+0GstalzOg49vNFp7pFHNQ
	j430Hb696nWhnJhqPBwwaS/xxAZ2lmkJmfFR5fSgJ0mJsOiLcktTHWTucQNHftv/zxUL73Y/6Qt
	vy30QuyakNTmYtaX+bXTQVlZjJfIgtnRZ6qXSkudqfbAnpSwfMTm8KLrhYZdYq2BuvjI=
X-Received: by 2002:a05:600c:3b85:b0:45d:e285:c4ec with SMTP id 5b1f17b1804b1-45f216696c8mr21980485e9.4.1757676880109;
        Fri, 12 Sep 2025 04:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBCLdYjQPkVnjO0W8XKaGSgjZLsccprLNd6W9/Xe0KR1we4p5qR7REUfvO0pBQsst9YNwS0w==
X-Received: by 2002:a05:600c:3b85:b0:45d:e285:c4ec with SMTP id 5b1f17b1804b1-45f216696c8mr21980295e9.4.1757676879669;
        Fri, 12 Sep 2025 04:34:39 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f20:da00:b70a:d502:3b51:1f2d? (p200300d82f20da00b70ad5023b511f2d.dip0.t-ipconnect.de. [2003:d8:2f20:da00:b70a:d502:3b51:1f2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607ccf9esm6158472f8f.40.2025.09.12.04.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:34:39 -0700 (PDT)
Message-ID: <d7a03a2b-d950-4645-80f2-63830bd84f76@redhat.com>
Date: Fri, 12 Sep 2025 13:34:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250912: riscv: s390: mm/kasan/shadow.c
 'kasan_populate_vmalloc_pte' pgtable.h:247:41: error: statement with no
 effect [-Werror=unused-value]
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 kasan-dev <kasan-dev@googlegroups.com>, linux-mm <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org,
 lkft-triage@lists.linaro.org, Linux Regressions
 <regressions@lists.linux.dev>, Andrew Morton <akpm@linuxfoundation.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Anders Roxell <anders.roxell@linaro.org>,
 Ben Copeland <benjamin.copeland@linaro.org>
References: <CA+G9fYvQekqNdZpOeibBf0DZNjqR+ZGHRw1yHq6uh0OROZ9sRw@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <CA+G9fYvQekqNdZpOeibBf0DZNjqR+ZGHRw1yHq6uh0OROZ9sRw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UrdyOk7BKxZ3ie1DULKbaYBHxf5GN2K9dqxa9jgG64c_1757676880
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_043445_841193_36E14FF5 
X-CRM114-Status: UNSURE (   9.73  )
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

On 12.09.25 13:32, Naresh Kamboju wrote:
> The following build warnings / errors noticed on the riscv and s390
> with allyesconfig build on the Linux next-20250912 tag.
> 
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
> 
> Build regression: next-20250912 mm/kasan/shadow.c
> 'kasan_populate_vmalloc_pte' pgtable.h error statement with no effect
> [-Werror=unused-value]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> $ git log --oneline next-20250911..next-20250912 --  mm/kasan/shadow.c
>    aed53ec0b797a mm: introduce local state for lazy_mmu sections
>    307f2dc9b308e kasan: introduce ARCH_DEFER_KASAN and unify static key
> across modes
> 
> ## Test log
> In file included from include/linux/kasan.h:37,
>                   from mm/kasan/shadow.c:14:
> mm/kasan/shadow.c: In function 'kasan_populate_vmalloc_pte':
> include/linux/pgtable.h:247:41: error: statement with no effect
> [-Werror=unused-value]
>    247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
>        |                                         ^
> mm/kasan/shadow.c:322:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>    322 |         arch_enter_lazy_mmu_mode();
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> mm/kasan/shadow.c: In function 'kasan_depopulate_vmalloc_pte':
> include/linux/pgtable.h:247:41: error: statement with no effect
> [-Werror=unused-value]
>    247 | #define arch_enter_lazy_mmu_mode()      (LAZY_MMU_DEFAULT)
>        |                                         ^
> mm/kasan/shadow.c:497:9: note: in expansion of macro 'arch_enter_lazy_mmu_mode'
>    497 |         arch_enter_lazy_mmu_mode();
>        |         ^~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 


I'm afraid these changes landed in -mm-unstable a bit too early.


-- 
Cheers

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
