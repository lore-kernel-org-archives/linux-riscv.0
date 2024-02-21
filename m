Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F226C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 11:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GlrmlyAJrJ12K3iKJU0P8cKbVqRnxJlBS/USBHFM+E=; b=QD5gWn1dyscw0R
	a0eE9rGyYrJS+1nYw0gaMwLVl9e3YOLdxzoJTGlrIvs2+X93xb3LQ2WWdljHqtouMoOQ08AX1+1+R
	/r/jqiAXfWU0GMA6BdCDzkj/Jf9WSY6vj3Vlc4Ribb7LfMt3I6/2jbDwPMu+/yWGgJVsDKXXT3xKu
	JaM8aPdGq68ZLNu+zxN1VxpDO4deBlVgiNgZABrHABmKtjH8IJZu6Zfo2jZvoJmP88IzIUFYXiMhu
	3GXbpQkFA0ZBQfRfHR/mGFO1CnWM7j3oEtem2EyxT/5w+O1+tDEWxo2qRm3aahO/rIE3ttY1jplxd
	pnjHOB62zRUhngUSE5dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclCM-00000000lv6-0o0F;
	Wed, 21 Feb 2024 11:55:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rclCI-00000000ltC-0Tbs
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 11:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PLsLM/ECtgqgj6YScdKuDzdQeO2PVy2fvKFbE23nuA4=;
	b=gNnIhRuwWXTUPY94+SLGU4tBD9l1D8CovC5/vKWMsRxSlPhO0cBiF7pFB87rnB2tPz8nlg
	CfGMNE02QxUeMZoUBo4mmcfUsIsK6cXArci/zzuUbYND48wcArZo8zcGHK2oMZrjIseIlr
	Sz0tdoqwe0K0Dyl0iMU/DpEAjjqFupA=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-vVMa6fDGM5iEEZK7zf3FNA-1; Wed, 21 Feb 2024 06:55:31 -0500
X-MC-Unique: vVMa6fDGM5iEEZK7zf3FNA-1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-6e36ee0fd27so251291b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 21 Feb 2024 03:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708516530; x=1709121330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLsLM/ECtgqgj6YScdKuDzdQeO2PVy2fvKFbE23nuA4=;
        b=ZJSm5WK/2VuFElu4/nu75tJ7pUbo6G76e6EhuHU5m0j0FzB0Hq/ZleKGyf11wQvx21
         8Z1RauTWKZQ3k0dgAnMEHK0396SJy4RSzZ19UmpYTNeVbcic/tiFkDcpFAZXVTh+VcXu
         jV8k/cYiS2LCqg4uEKHlcYnO398ZOEgA9wY/72lNBzuebu6xO9l5P5eyg3Hh9K1FDAW9
         dLXat0+kjTO9qu4T5Pj7ZNeeKXHDpCMaOErb0gmjGTfl93eGkCS/kxyqXbSyLftekv9b
         sH+czCOOD88Rjz0zg1lbaC083f9z1Wt6vJOWTkqXZH/oIitEPxXtPq0vJfygqcXitzzO
         jXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXasPQkwI3cxR5qVkoYVwIldt4qz/MTYYOkQL/JoDxBUydU1QNq+NkAjJ3nVNmajdGNkfM4N8Zt5W2JvqQyzEIQQw+qxS+ld5QfB9O/E3j
X-Gm-Message-State: AOJu0YzohuUhyNHv9GuDkjRoZsybEp1bQbNO0ZLR1HzdOHvKdtNzv/Aj
	afZ7nb4c7NJKi8yb17BFyyIrH+3XwKXRBL+Ip5dsW/Cx+IrmIVdMC+tXp0h4bd7YcTzE8kSfa75
	kj9WB9adpeNeNotZbqfKrjrrOAADG3ZykqXjuzCrVEY5yy2VFDTrX+k+Mezfr6Pw09Q==
X-Received: by 2002:a05:6a21:3397:b0:1a0:cd02:b2f1 with SMTP id yy23-20020a056a21339700b001a0cd02b2f1mr196499pzb.3.1708516530441;
        Wed, 21 Feb 2024 03:55:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRO+9lM9EY5N92dCc9bYoUlt/pUN8sgkXoKwNhU9AZ+BNLKu2lSvew+Aw+SPUl5ZIlIuODvw==
X-Received: by 2002:a05:6a21:3397:b0:1a0:cd02:b2f1 with SMTP id yy23-20020a056a21339700b001a0cd02b2f1mr196492pzb.3.1708516530136;
        Wed, 21 Feb 2024 03:55:30 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id b3-20020a170902a9c300b001dc0955c635sm4149309plr.244.2024.02.21.03.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:55:29 -0800 (PST)
Date: Wed, 21 Feb 2024 19:55:17 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	James Houghton <jthoughton@google.com>,
	David Hildenbrand <david@redhat.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Yang Shi <shy828301@gmail.com>, linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Rik van Riel <riel@surriel.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Mike Rapoport <rppt@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Jones <andrew.jones@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <ZdXkpYEuRAxoLtHI@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
 <20240115183748.GR734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115183748.GR734935@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_035535_083489_4FEF8F20 
X-CRM114-Status: GOOD (  10.20  )
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

On Mon, Jan 15, 2024 at 02:37:48PM -0400, Jason Gunthorpe wrote:
> > Drop that check, not only because it'll never be true for hugepd per any
> > known plan, but also it paves way for reusing the function outside
> > fast-gup.
> 
> I didn't see any other caller of this function in this series? When
> does this re-use happen??

It's reused in patch 12 ("mm/gup: Handle hugepd for follow_page()").

Thanks,

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
