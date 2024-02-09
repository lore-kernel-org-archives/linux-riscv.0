Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9759C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Feb 2024 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9kFgKJWg5MpNqH+/zpHv2tgnU+XHK5QCC0uP36CnKFE=; b=HSKXha7ncB2Iib
	HjWMV8LUIUcLulmY441zDwRVnOEnbVsAfuBq1ff0LzzGULz4h+UdSgjc5Bo00MsCKZp1wuWXnBQuC
	Eb2SqdYd+N3de+vQ68DqFOu9RNcIyJ1oy49llGmk9BcfIbAT7XtPh6mNeEGI2Hq2BHzBQTewFhCgM
	WUaGjvFswlZ1oPlxOLNLBQSPEvsQy8yXhIE1q30AZDNEwFgdrXuFV3haf5H1BZgj9IsZYZBwN+Krw
	xQXS3ydS6NbPYFBG4EwDDbmFkyXlgZqEP1Xvs7OyYqdUKTPqF5f1wnHdZyDTG+SDmEeEnqx7dve5H
	/jGf05RGWFnjcPaI9SsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYZTw-00000000noE-36io;
	Fri, 09 Feb 2024 22:36:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYZTt-00000000nmb-29xk
	for linux-riscv@lists.infradead.org;
	Fri, 09 Feb 2024 22:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707518184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZsuwvNcy7srG22SEiNvqp25+3IIw8oPhoxlAvIGHUo0=;
	b=ZC7DZSOrCNGjvHiYJmqdQiI6s0ENvLYlG/oi1GA4IXG8ir7812kcz7391TVWGyUDrPmXOR
	h4LwmR3KZO5EV6FFCBU/gxKm7xSr7jDUn2eQ84RHxhTGWduTKQT94Vf+ICKlEUWuvOUozc
	5nWCtI3GkKWN9QulaKW3jyAvY64fNo8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-j-U8aRypN3G1nnaqguCrMg-1; Fri, 09 Feb 2024 17:36:21 -0500
X-MC-Unique: j-U8aRypN3G1nnaqguCrMg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33b2238ce45so578060f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Feb 2024 14:36:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518180; x=1708122980;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsuwvNcy7srG22SEiNvqp25+3IIw8oPhoxlAvIGHUo0=;
        b=quUCp4Djt9E5XHOCOJxaK9wwT+khoTJFqE58/dvRFwaSPMVerlfPGcOJwiDf1abnYF
         pvdZuJ7U8yLYUyzBbL++Feb4GYzHCz+6tcha/CqfUVNiycjuyw88U7HoHgrwwjNAH7UB
         Tk/iWJI9ffle0skEOLoWPd3V2n92+ntNyw5QwnLBpVG//R5+a0UqRUANIYGA8XCf+OZr
         Vme/bDeOcKXlyazeAVpj1AfX+Mbxexeddzfiq/Qo2wyW60tlx0TVnJxbf1bzp3Jgj4Vc
         XYZQtizoc8CFLu+/o4e8pneGaXyqaJZAdwd9pBSvd4JoXgalcbxYBkcv3spALhcLVMon
         5U4w==
X-Forwarded-Encrypted: i=1; AJvYcCVMWPEFPrMWr9ItpNfM7T29r8NC4zPmyMOqUmrZTVGQSFZDsTlBAptRRncWhMPiNqrDyxEj+2af+6n/fc0HSnUT5RNHtfY8QauzfqxtI6wc
X-Gm-Message-State: AOJu0Yz+iXPN3r4kYhrRAIDlW/i9P2SCl+T399UzVMTkbea6/J9esVDe
	B3RVHlLj57dgYnCpzoTgZEy/OrEdTsm79OTx7JvRmzJ/sYhj95k+tCazgqS0bPxWWqq2IUXqk/I
	J8Ta6Y/8RAR21wTVqVSXu7ZrQsJnr8XB36/pKJ0RApssKdaZuf0QSdtyhvZJrl2BU+w==
X-Received: by 2002:a5d:6292:0:b0:33b:63a5:feaf with SMTP id k18-20020a5d6292000000b0033b63a5feafmr257846wru.20.1707518180233;
        Fri, 09 Feb 2024 14:36:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy4CLCviUyK1OodnIQ1mSMGsomV26G3hTfhyNyhH+GDYkVLAS41fsfIsBxx2rncVdrBGU2iQ==
X-Received: by 2002:a5d:6292:0:b0:33b:63a5:feaf with SMTP id k18-20020a5d6292000000b0033b63a5feafmr257824wru.20.1707518179877;
        Fri, 09 Feb 2024 14:36:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+S/n/bVOO58PUK1OwN7/Y+dBJ5Acz/W4v5CpS3WjHnlBwf5/kpFz/wL+kjiKDWoYAbMbmz+gfFu3wnLXtBbxCWkITbHaCVUcGP7u+50RgLdzNW8tvTduDZYlK7MB1HQYRoJZinm8OkVnP8sJoPvVGz4wv+D0Eg2VgbZ7AXAwCuG3nMyDoSZuYSEQadSv9xdO/Fa6KTh1AkNjK94KUMkSDjzjPeBstwXOO6fe1+4//EXnxjeSQdYFt9cf1MrZj0tTGeQsXrFc8zY29xujzIzXIkv/sz7qQmw3J/oEyQULKRgSRj9dGr2hSQb6mMBn29bG9uZTzst7HlmvlOUeQMP3oO5aO9Qre9eufCQmP/scsKKHrMNn5C7brXfc/bnaV30nPWgCtCJj8DyNi6RVhcsICK0xzM3FLq+WtyxQXzxq3Q1mVv3ekPFV6vZDI9sRV0ZsOkcSnQr8Io1TS5UjvK5HhDSbVQSmc4Wh+hLJHHpfKcTOQ2+MxMY6N0Xxk9tPmR33BDXQythmIKROkQxoSG5pWrYSc6vt+la3dIZdPZKiOiKA8o1Qrw5HbI/KNeeMbhK0M6MWb8dov8n6VBAOblsB0fAZkWbv0dZBwcyGKAGdXYVftcthpd9cl8+TK+ztAgquDjBBYUdw9VWZ0hJbKnBMen/iCJVBWYDK18Kgh4t0wtTIgAL+hHoNIIwXxio66kkRQIbxB08XzsuYcI3oqq99Swsc1pwPtECz1LF3UJHq0YNgR131OhFS537vvvFq6oc08Ih4zOua0Y1XMcyyQAQPYLWoJSRDH6zWQYAyTkP5q6Is5nmPJhGU+1TZavOAw4aKVmIgceFdaNR9anFUa5bThPfvB3vEqMH60Pbru0a+AMRtmtj4XIDGO6hFgsPnuxl/y/ofxT5dIt4a28pdauobL4VRBGYmtKLzxoD6qzBcccu4oIX/98ViWmXZ9d0y+Cr0u5B
 2vz249Brar3w0=
Received: from ?IPV6:2003:cb:c718:6800:9d15:2b60:4f57:7998? (p200300cbc71868009d152b604f577998.dip0.t-ipconnect.de. [2003:cb:c718:6800:9d15:2b60:4f57:7998])
        by smtp.gmail.com with ESMTPSA id bv4-20020a0560001f0400b0033b670b0a6asm302786wrb.74.2024.02.09.14.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:36:19 -0800 (PST)
Message-ID: <6b0d2c43-90cd-4429-baa9-078dd37fe207@redhat.com>
Date: Fri, 9 Feb 2024 23:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] arm64/mm: Make set_ptes() robust when OAs cross
 48-bit boundary
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <20240129124649.189745-2-david@redhat.com> <ZcRwc2mEDHIXxgGa@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <ZcRwc2mEDHIXxgGa@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_143625_647005_0B8FBCC2 
X-CRM114-Status: GOOD (  13.20  )
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

On 08.02.24 07:10, Mike Rapoport wrote:
> On Mon, Jan 29, 2024 at 01:46:35PM +0100, David Hildenbrand wrote:
>> From: Ryan Roberts <ryan.roberts@arm.com>
>>
>> Since the high bits [51:48] of an OA are not stored contiguously in the
>> PTE, there is a theoretical bug in set_ptes(), which just adds PAGE_SIZE
>> to the pte to get the pte with the next pfn. This works until the pfn
>> crosses the 48-bit boundary, at which point we overflow into the upper
>> attributes.
>>
>> Of course one could argue (and Matthew Wilcox has :) that we will never
>> see a folio cross this boundary because we only allow naturally aligned
>> power-of-2 allocation, so this would require a half-petabyte folio. So
>> its only a theoretical bug. But its better that the code is robust
>> regardless.
>>
>> I've implemented pte_next_pfn() as part of the fix, which is an opt-in
>> core-mm interface. So that is now available to the core-mm, which will
>> be needed shortly to support forthcoming fork()-batching optimizations.
>>
>> Link: https://lkml.kernel.org/r/20240125173534.1659317-1-ryan.roberts@arm.com
>> Fixes: 4a169d61c2ed ("arm64: implement the new page table range API")
>> Closes: https://lore.kernel.org/linux-mm/fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com/
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

Thanks for the review Mike, appreciated!

-- 
Cheers,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
