Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56324C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 01:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=asc0K1js6wCWRPzhYOiIfVt/4Ct04chjqdap0/IOzak=; b=tu65nWChiXGNA7
	1OpdA8E82zPHNW2Pcnh6mZxMmTx7WbZRs7JU36rHD9BFDWdG4yhIzHThEkoVceaLI1NTO1WQkq6/+
	K9tBNbeAfGp8DC1RtxkN23o0ZCDcN7YND/GmfxLFh7SlKgnklt2R+ykscL4sSehaU+bPxJ0Q+LmYt
	WPKZA2Ggc0eA7IIOnFHboqOT0g/YFWP/dYpLYTePXju/jLlO0F5V2iEDvz7R+irhFJjhkfQpRMLMc
	tjh+Kmowe7Vq3UkQlqGF8AtjtzkvePdlgkmO3vM+oQF286s7odYH4pCwhQnvA80EFZtFQvYuoSyrD
	K1udxR2IrjVb61V4NaDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUSM-004cG0-2N;
	Fri, 22 Dec 2023 01:36:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGUSI-004cF5-2e
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 01:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703208961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2akJnTxfKkE9MplltMUxeeJDEmgi/IaQGIuEfCeumQQ=;
	b=Q2zZKSyWgd9i1gfURsIa4lQt0hNVtOMC6brQMZv/xL//HEvvMB+2pG/hXN7A9Icy8WeLeb
	jtymVnHDH+WXKen8yUzJoJQtJK30BFgO2QFImsuN7/Am0RglPoRVOQnuVKgTOFLd3SBbDz
	X6NvTeJLNe8G/NMJc1kfSY7c/0I7Fts=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-flJ22gY5NgiX0LGJD7aRwQ-1; Thu, 21 Dec 2023 20:35:57 -0500
X-MC-Unique: flJ22gY5NgiX0LGJD7aRwQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28b49899812so415480a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 17:35:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703208956; x=1703813756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2akJnTxfKkE9MplltMUxeeJDEmgi/IaQGIuEfCeumQQ=;
        b=Lb/pEnqa8ECPHzBc/1ww95kCVzJPpV2IRmOh/5qDnzPiVUF2ufogQ+jpbC247ufR5d
         YOmStl6K8OU8JSmTLZuFCLt3GfAaWxo2BawNn0AeDhBdM5S/4/nGR5dLbGW2RvHlJuLb
         ZspDrGp50OJNTCVQ9oDG5YWpwKBCKL9FuiN04A5i/7KgYfUKjffBkhKyZsjpZDrax34Z
         EzcVm0K41p7iNrF9AAnoDcwB9usZBTSTU8AdvTCx+VqltMOQ5eKdAhphZfpmdNuujeW1
         CQD5jT6M7Q57f6muiHKlpytuND5P5ir0vvp19AnwRdBcAIMCJs+uJ22yqC0AtdlXj7vw
         9LiA==
X-Gm-Message-State: AOJu0Yx5imTjkyBx4/+eSfb40XL6X/VTPwOk4hzfPJSg94wZIVD3v0wa
	DiMKxagtiV75PzudLpY5vNtFZC1dtoH4xwm7uji9XutAINxd6cGXJco3T/mePLX3YqPkQTsZ1/J
	9f/ff8X7/yK4qtkIFj29z0LVoowa9md4Wc2XL
X-Received: by 2002:a17:90a:4b8f:b0:28b:c1ad:9cef with SMTP id i15-20020a17090a4b8f00b0028bc1ad9cefmr1137543pjh.3.1703208956241;
        Thu, 21 Dec 2023 17:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1CdzSSxO6gL0EU6CjYH72GBwDyRwTpiPtorA3Dx6OQ9XzFAqCTOZ2ez8iSmfN4CA4vPwFxQ==
X-Received: by 2002:a17:90a:4b8f:b0:28b:c1ad:9cef with SMTP id i15-20020a17090a4b8f00b0028bc1ad9cefmr1137522pjh.3.1703208955962;
        Thu, 21 Dec 2023 17:35:55 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id qc12-20020a17090b288c00b0028b6f522fedsm6308509pjb.43.2023.12.21.17.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 17:35:55 -0800 (PST)
Date: Fri, 22 Dec 2023 09:35:43 +0800
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>
Cc: Matthew Wilcox <willy@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	linuxppc-dev@lists.ozlabs.org, Rik van Riel <riel@surriel.com>,
	linux-riscv@lists.infradead.org, Yang Shi <shy828301@gmail.com>,
	James Houghton <jthoughton@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 00/13] mm/gup: Unify hugetlb, part 2
Message-ID: <ZYTn70CDVeNMed0f@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_173602_946660_AE58314C 
X-CRM114-Status: UNSURE (   5.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Copy Muchun, which I forgot since the start, sorry.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
