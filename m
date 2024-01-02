Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF9AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 05:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWEnuj4ifPvQo+AAc1GG7T5T5ACoyl/XH73dS0SWsXg=; b=A3shuOD+h1Fi1+
	BRacUOti5ue9W8xn3kNrvjcY9AoRhuW40VbUKxAuHuuVJ+3U19Pc+2CwGgkEfHqD73UfDij2uNnvH
	wPCE28FbfgQfu+Wdu2fbH1rodYIYQ25YjqdVrtPJBxaNyJKU3fTaOBSA0eWcDF6tTbPO03kdUHmko
	fG991FJLj8uOM/59bhHLkQBMWbpZZeI4zWW+UQrwsIOENLZjtOrDXpgQlnRSboe6kkz6rG+EMwCk9
	uBeULDDCVUQ6P5xYWiTkum+5HL8oKZjY7yEAev1W5rEfU0leYL9mriiyUNrkLIVi+iOn86RGEb+Pa
	dC332Qm+Rnyi0uwFVQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXVK-00786k-28;
	Tue, 02 Jan 2024 05:39:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXVI-007863-2U
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 05:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704173992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bbq0KObq2f8j+82pUN4AGj7eg3qIjhtUEVS9ATEV+Oo=;
	b=BtznwitwWOhyeGmbQ/vQoH4LoJbLjbafjLQwaNP9X9Js6mESJJLo4mYGm1nvdXyRtItaOc
	D4dSJpWKRxWFscz4vxae+YIt6fQO7+/m5I+lAo9AphlU3lT+K2e3Mh/rRSH0qYWKoxjXMe
	g4tUBHcq5qmHqSl1uZYmfEYfooWXvvU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-zzmYobQ-N1ymVB3tMGMzMw-1; Tue, 02 Jan 2024 00:39:48 -0500
X-MC-Unique: zzmYobQ-N1ymVB3tMGMzMw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-28bd331cb57so2730265a91.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jan 2024 21:39:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704173987; x=1704778787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbq0KObq2f8j+82pUN4AGj7eg3qIjhtUEVS9ATEV+Oo=;
        b=AfER3ISUDX6THpoPD1B3SE3XqRMpNaeCEbA7QlV/tFXh0U1Ilf0eqpIuAnZeG6ZAgE
         sSVRIa3z4dqgvYlsfL4QwT6HnHqsN7MfxzWodess61ol5w83vODIo7B4hm1hQKhAlgpg
         YK06qRr10gJyei00Esz2cwAODQ1eEtpkX0j61TqsktvjrhMfWfSDYHnoMDCcKy+sdQfE
         r3JijmbODyH+Hc5VMKInyNQBcyauDB3Xh5rvbZoxYtrrF14hfnUswLyMXMOXhg5xxWrk
         90BSR/eVjXCnAGKAtLdVcOcFWNZyqc/0eFxf7w6oPcid8fd0+wrD0rTuonOUVmP4vmqS
         GdCA==
X-Gm-Message-State: AOJu0Yz9aCmrNBuuVTrBbA8Xd5YpOEtmnXOfE/OU0CcD+jTi04+y58me
	Ucgh4jUS5rOEhXEIjFCaM7KYB/fATvnJfqHvYxG8VFaWV7hOw8ZBdZkYDgyP2MKVkBEnyryzvLn
	aIC7BTYFZ+6i3G4qTRo7N3peZqMZNqe5k9IkC
X-Received: by 2002:a17:90a:a589:b0:28b:bd2d:f924 with SMTP id b9-20020a17090aa58900b0028bbd2df924mr24809549pjq.2.1704173987590;
        Mon, 01 Jan 2024 21:39:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuR1t3QCDF99soHy376+nbiN/c3MDqPEKDqcI+XWwTDxY2xbRtvWRrTvKfEHzNP7Fpwq1DzQ==
X-Received: by 2002:a17:90a:a589:b0:28b:bd2d:f924 with SMTP id b9-20020a17090aa58900b0028bbd2df924mr24809540pjq.2.1704173987309;
        Mon, 01 Jan 2024 21:39:47 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id lt24-20020a17090b355800b0028cb445ade2sm6857199pjb.16.2024.01.01.21.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 21:39:46 -0800 (PST)
Date: Tue, 2 Jan 2024 13:39:32 +0800
From: Peter Xu <peterx@redhat.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
	Matthew Wilcox <willy@infradead.org>,
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
Subject: Re: [PATCH 05/13] mm: Introduce vma_pgtable_walk_{begin|end}()
Message-ID: <ZZOhlB-KK4hF3PgY@x1n>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-6-peterx@redhat.com>
 <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
MIME-Version: 1.0
In-Reply-To: <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_213952_879993_2D011EAD 
X-CRM114-Status: UNSURE (   8.56  )
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

On Mon, Dec 25, 2023 at 02:34:48PM +0800, Muchun Song wrote:
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

You're using the old email address here.  Do you want me to also use the
linux.dev one that you suggested me to use?

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
