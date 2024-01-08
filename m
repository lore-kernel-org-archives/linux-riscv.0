Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8588AC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HopihlqgEoPrjuOPHedikYmy0v2kCY67d9VZZbxvjco=; b=qX3Y08z4imEo1p
	72n2oDH0tLUBQcEhpPRGU/Wk4FR4rLypOnEu9pyGvcWqnjp7mHtJSmYqenueoqzV5AN4Txt4jbuBm
	X1BxsvE/oQDQv9yGK+juEmcXa8rgkDSksMFf66GRnjAO0MYLF3Ey30zzWbJewbZB6YCj57SAF0hEl
	ik2UYzi110rbX+vcMQPxZCDwZgGJSpDSA42bpmEMTHOkWbPVbzeuVnpBslUi4R5zA5Olu5a6nTV8Z
	++SJwwhG6LZRaD3C2f4X+xGt1nzB8PJTeZfGUQzLhVUnNKciRT8EMlcJtaIdX3pRl3Y4oma79l3SC
	WNK+q494W4qNqIm833WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMk2v-004B5N-05;
	Mon, 08 Jan 2024 07:27:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMk2r-004B3q-11
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 07:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704698856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=++HIVa+fUHc7mVxMPbgRezSHjTqa6qZR6U7zKUbz7Hc=;
	b=Gc0TMble/0NWHq5T6//n05hnJQ27EyD34l0vqCls4lMQyeCb8zQ5Y8g8s2CvahneRuuJfL
	Jc/6YAqUvgUopJTCwlCIFEorWqZfwubruSL3Dry+hl9qW0rT9pHMwrAUFR4qZsnS5DMo7Z
	tivIAJT3VLcy/dhEN27ETu2xMCU2hrE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-0EvKdQJNPU6GEfR7VbVzJw-1; Mon, 08 Jan 2024 02:27:30 -0500
X-MC-Unique: 0EvKdQJNPU6GEfR7VbVzJw-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-28bd331cb57so744076a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 23:27:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704698849; x=1705303649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++HIVa+fUHc7mVxMPbgRezSHjTqa6qZR6U7zKUbz7Hc=;
        b=jeRY6jfyGLNC9rTIf2iuumZuoW0m8aluKwiYdZxnJLiS3nVe6XLRbyTTQdh08a9pkT
         EBR6aH6NUR5e1aHXt6yGH62ClmJw+rHF+eAm3FnAmaP3DjhgqcQTn8oikhW4X4GQwqXX
         DVFjGGC4DJe3xCH28kXO+HJQtSz7kfiUReq7Dfn2sZK2ohvcT76dh6tqkhxLrdyYXbI1
         ticgkPWBkL8gdASlVoeX9BjfTQ8iYMD/eGkz4yD4fs7t416lBjnnVIzS/l390ixd4XhZ
         k2lV6SQ5jWrDEitwpIcagF9imJcyvruT+x0zHP5ShLQ7n352j7+ygfESGMv5Ol5RoDhk
         Sm4Q==
X-Gm-Message-State: AOJu0YxpKYOY+3zMP4VcoKaGUqsoNa3HPS1PjO+aMleDZVHuiG9aU7m5
	ib4S+44RnJU0iaMeOgntySCF9C/aM0VxJMJH7zY9bxv1Bw7lYLMY0PTdbUnxHunpUmo5CN5/Sw2
	QLOuW5tKnssNpMMaEW/Bn2bvvhnvRjTGKmvJR
X-Received: by 2002:a05:6a20:3cab:b0:199:c866:1d46 with SMTP id b43-20020a056a203cab00b00199c8661d46mr931056pzj.6.1704698848993;
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCAavyxZcZwU5CLY8vR5nixlH4bDIz/ZGJUz9tbspcbUqeK+w5R+Hs85r/f/cHobBdBUdCsQ==
X-Received: by 2002:a05:6a20:3cab:b0:199:c866:1d46 with SMTP id b43-20020a056a203cab00b00199c8661d46mr931031pzj.6.1704698848614;
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d5-20020a17090a8d8500b0028c2de909e4sm5617976pjo.50.2024.01.07.23.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 23:27:28 -0800 (PST)
Date: Mon, 8 Jan 2024 15:27:17 +0800
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 00/13] mm/gup: Unify hugetlb, part 2
Message-ID: <ZZuj1Q3k9hX0IlK3@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <591c59d6-dedb-4399-8a6f-c574fd2ad9cc@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <591c59d6-dedb-4399-8a6f-c574fd2ad9cc@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_232737_426326_8D4D8CFE 
X-CRM114-Status: GOOD (  19.80  )
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

Hi, Christophe,

On Wed, Jan 03, 2024 at 11:14:54AM +0000, Christophe Leroy wrote:
> > Test Done
> > =========
> > 
> > This v1 went through the normal GUP smoke tests over different memory
> > types on archs (using VM instances): x86_64, aarch64, ppc64le.  For
> > aarch64, tested over 64KB cont_pte huge pages.  For ppc64le, tested over
> > 16MB hugepd entries (Power8 hash MMU on 4K base page size).
> > 
> 
> Can you tell how you test ?
> 
> I'm willing to test this series on powerpc 8xx (PPC32).

My apologies, for some reason I totally overlooked this email..

I only tested using run_vmtests.sh, with:

  $ bash ./run_vmtests.sh -t gup_test -a

It should cover pretty much lots of tests of GUP using gup_test program.  I
think the ones that matters here is "-H" over either "-U/-b".

For ppc8xx, even though kernel mapping uses hugepd, I don't expect anything
should change before/after this series, because the code that I touched
(slow gup only) only affects user pages, so it shouldn't change anything
over kernel mappings.  Said so, please feel free to smoke over whatever
type of kernel hugepd mappings, and I'd trust you're the expert on how to
trigger those paths.

Since I got your attention, when working on this series I talked to David
Gibson and just got to know that hugepd is actually a pure software idea.
IIUC it means there's no PPC hardware that really understands the hugepd
format at all, but only a "this is a huge page" hint for Linux.

Considering that it _seems_ to play a similar role of cont_pXX here: do you
think hugepd can have any chance to be implemented similarly like cont_pXX,
or somehow share the code?

For example, if hugepd is recognized only by Linux kernel itself, maybe
there can be some special pgtable hint that can be attached to the cont_*
entries, showing whether it's a "real cont_*" entry or a "hugepd" entry?
IIUC it can be quite flexible because if hugepd only works for hash MMU so
no hardware will even walk that radix table.  But I can overlook important
things here.

It'll be definitely great if hugepd can be merged into some existing forms
like a generic pgtable (IMHO cont_* is such case: it's the same as no
cont_* entries for softwares, while hardware can accelerate with TLB hits
on larger ranges).  But I can be asking a very silly question here too, as
I can overlook very important things.

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
