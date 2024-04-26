Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EB2C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 21:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP799OO52g74O/3dmF3bFGnbx605aIcjZOWktAp+DO8=; b=r5CIKV5Nua3P+g
	rJq0OwB8I/1bhIEGkxQxCm+LCkxMB8R7Lu6XtgEXriXl2y+qQGyllxFcAWJxO1o97ZUYYpd0ZaaER
	70ysCC8isxFb1PHNJTvhkUkawbae4hcbSOoxYEjPQPdea5GPaA2OX+IAosiiZIEWcprwkeAvsn0IS
	ZufqJuG5kKbMecVSDX3eJe3ifNRULriwoAKzDuRB2Oqndk85g8KrpKUoohgGIGdcRp8rdhpMN1pdv
	ANvYmhdE1utphhJh0tDkv3f2QjhQv4J4HLOZTUdZomzqFKT7Syz//4Xh/kZFcd685idme1rwdadH0
	BKf4k/OZDaaYBytw5Ztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Tae-0000000EA78-3Cne;
	Fri, 26 Apr 2024 21:58:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Tab-0000000EA4a-3EHq
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 21:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714168719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+QCnlzmJ6bjL+5B5nZfc9uwhSIwhhaQo56prOJlaB+0=;
	b=FohtIxpyAOCF8DOc6meag5F2/BvAH+GUR3gpQbqaYnH20Co+KtM2xF8P7YQeRZ5YABXQ3W
	Ry+PuueFB5DiBBUBcfewlN8C+Be1jv9vINPbsUldO1g9RJg7yb4TirhadernO4xYnH8Wk4
	u1hL1yDm84XZ1Hf5GQMTj2GpkXMqMQM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-r9CiY0YsNx2eIJ7jvBQtkQ-1; Fri, 26 Apr 2024 17:58:36 -0400
X-MC-Unique: r9CiY0YsNx2eIJ7jvBQtkQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6a094939dedso9049416d6.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 14:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714168714; x=1714773514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QCnlzmJ6bjL+5B5nZfc9uwhSIwhhaQo56prOJlaB+0=;
        b=pwaKHmQAQKVDUr+BUastVsTUoDs2hH+wkWM0xqQTTs9AScEFUSxrcm+64cNV/D4MSn
         EJ//VtizCqcEqtrzNIoVtDT8Og+jkC298PjfIZrBBRwJuLJf0C25gQ2ucVL2/4JAP7+6
         T2F2K0YQnYSI2DKqowyKHq1zTfVVi++qYBGwA/vuA19ZQII3hTqJpRepkzK5HbiIHp0v
         sp9KOowFEZ4VXksPINdl0qh6cCn9+0k2josKR+DsFW+8Auo2TVh5LzUJ2G/jH3kimXCP
         J9LkXTVlaFeBs3Rgo6I6e6412ypKhEifxwjmk85XKRrvL6YU5VwEYGU8Us0NsELqUjaC
         ANDA==
X-Forwarded-Encrypted: i=1; AJvYcCUigfD0QX/NmQkLO83N66M6gjA/kgU6eTcVCkYLXVo/iuXNDZShaz0o+UTeC3BYlZ2XDjlBRtvBys1efxBdlBhlDpVmAR2LqbuodnQyjfKQ
X-Gm-Message-State: AOJu0YxBubffMRwedAN9c0wb4lH29b0ybZql8tZCEoWmbCe7lHvqbBBj
	OekOAZWWN+zFISQmdwcQDmuLKP1YxB2u/rchow1LpUAz5dI4y6ZDmjZT3RMpxao4tikZVDJv+CM
	LttyqpNzDHU0I4CGKWSyLT86ONEUVN0qCQUoOp7cC2/DqEZbGZRKioesKmSWkO2LNmg==
X-Received: by 2002:a05:620a:17a7:b0:790:95ad:9260 with SMTP id ay39-20020a05620a17a700b0079095ad9260mr4428397qkb.0.1714168713777;
        Fri, 26 Apr 2024 14:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9TXpTvynaKbMe+uWh4XQxgfNR94gVb6jB/4BIiWgOtfhaqFyr6WLW6qYoOzAm6Sij+K5ZPQ==
X-Received: by 2002:a05:620a:17a7:b0:790:95ad:9260 with SMTP id ay39-20020a05620a17a700b0079095ad9260mr4428368qkb.0.1714168713163;
        Fri, 26 Apr 2024 14:58:33 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id g13-20020a05620a218d00b00790789db3cbsm4659252qka.29.2024.04.26.14.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:58:32 -0700 (PDT)
Date: Fri, 26 Apr 2024 17:58:30 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <ZiwjhkTTRG1ZjyLf@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n>
 <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
 <Ziwal-SucIye3hPM@x1n>
 <fb3bd167-748a-4548-a94f-9194443c0bc3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fb3bd167-748a-4548-a94f-9194443c0bc3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_145841_909288_35B8E045 
X-CRM114-Status: GOOD (  14.56  )
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

On Fri, Apr 26, 2024 at 11:33:08PM +0200, David Hildenbrand wrote:
> I raised this topic in the past, and IMHO we either (a) never should have
> added COW support; or (b) added COW support by using ordinary anonymous
> memory (hey, partial mappings of hugetlb pages! ;) ).
> 
> After all, COW is an optimization to speed up fork and defer copying. It
> relies on memory overcommit, but that doesn't really apply to hugetlb, so we
> fake it ...

Good summary.

> 
> One easy ABI break I had in mind was to simply *not* allow COW-sharing of
> anon hugetlb folios; for example, simply don't copy the page into the child.
> Chances are there are not really a lot of child processes that would fail
> ... but likely we would break *something*. So there is no easy way out :(

Right, not easy.  The thing is this is one spot out of many of the
specialties, it also may or may not be worthwhile to have dedicated time
while nobody yet has a problem with it.  It might be easier to start with
v2, even though that's also hard to nail everything properly - the
challenge can come from different angles.

Thanks for the sharings, helpful.  I'll go ahead with the Power fix on
hugepd putting this aside.

I hope that before the end of this year, whatever I'll fix can go away, by
removing hugepd completely from Linux.  For now that may or may not be as
smooth, so we'd better still fix it.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
