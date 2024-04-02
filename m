Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D102ECD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TLwnAftF/L+PYJku1Irzf/x6nrSzag0YPvML+Z5Adw=; b=cWPoe0SWxpJm5l
	+sJKlkxswrvkbdRnYvLHAQr/nHJaOIkZVe0Jy/e7VlwRzuwHIHq+/QUVCmwAdDgiI2PocugvqphhI
	nduycNIk8gtAg4gBysyP/mIU5pDTtbcpoek2ZW2LpI1X2ZcNzX8r0mDksCEXBy2heLaypLkZbzhT+
	I6/iEvGsfB6wxxUlJo/2dUiV9gHGNfHBgVNS3IXd71tR/zlUwBk7SQALJGF6FukN5+eOv8ukapRMh
	QWXocaAAU02NY6lx5ZXtBFoWZCj9RIYjsJM81RwjNH+j/HfeHccY7etgpSP6WVqunc7vEJe+4D/r/
	Rsx4jUC4xZWiAIKrwC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rriP1-0000000CHLC-2U93;
	Tue, 02 Apr 2024 17:58:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rriOv-0000000CHIT-0fmz
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 17:58:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712080702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QbOtfO/Dg9m2AlUnDgJHatWmb8CbT3I2rXBSbFfhdJY=;
	b=UhTNg/XPtc7hgQsz8u4FV1NdMiuxMAnM/F9vzyvMFTahGOWlBYPy2RK1YiDt3E5/r5wvnx
	uU4FBhVU+oM39GSFc9thnjr/lEqz+8k4yBd1NE3QsNCPsH8/vBJJZG0dctaC/Vo6VdOKE9
	8Okvzgp112eqIkOqRtmGjrOA+QgL/eA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-7JmcFivYP9mFGsZlVfiU8g-1; Tue, 02 Apr 2024 13:58:18 -0400
X-MC-Unique: 7JmcFivYP9mFGsZlVfiU8g-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7e33b4df4ddso367777241.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 10:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712080698; x=1712685498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbOtfO/Dg9m2AlUnDgJHatWmb8CbT3I2rXBSbFfhdJY=;
        b=JMrkOvfDuDRia2M/8irqczi8xQXf5ajdHPu3jfAe+dY4mDkjrLoOo5ptc8wpK4X8xR
         9Ba+4xch0DYg+pDMR7ZQknwoI3hn7Cbcly234U72kp/XsA4ZzeDlyMqiIWX8aFrjdXbw
         Sz4btg/Nv11+HytOB58GnZKOpXC/apH7BllRtd0s3foyUTRIzmCEq92Khv7UrvY+Me2e
         Qg78K1QMVqm909YAwZfh7gupYa5bP/SmXsCvPY/euY6EFVyoX4/goGpVSTzjHZW8rkcR
         rR9hZdyW89C5Jq7oAGVBitQxRtVvaKeSq41P+mTmJjtJdAMGv37UE0yCxhUC7iMbfytw
         J3yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVwLRQucpn9txCbBc/ytxT1F487kPFbUAvJsCeEbIDfAjro3jauxX8M1xNdl9v6pKasTSHyFT34r9uUxq5GWntx13XmAyRABKr1GRCrZJI
X-Gm-Message-State: AOJu0Yz3PmNAdX8gjQmlVRkCcLrA2yXorUgFyWjEK3ZUhq17X4DZqVUm
	pTnSajpRH/bGjK8jxcC7/As8aO57TJQlN1KQXL0spajJkKXUvSyQi+O3azUxqfeWM05JshT61B9
	4Fry+v4hj12nm7PnpNzzJU9lRKOJWXC5Rupl6ls9MvvxPk0SoQLr9rknxSNI1fXH8/A==
X-Received: by 2002:a05:6102:93:b0:476:e72e:94ef with SMTP id t19-20020a056102009300b00476e72e94efmr9650810vsp.3.1712080697552;
        Tue, 02 Apr 2024 10:58:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8b3uQ69B5cqo+ud6RtEbqNi2TEDMHUU32VESs2Pw1E24CP/zf32LkrpOQk6Mcp1ToEoA3Uw==
X-Received: by 2002:a05:6102:93:b0:476:e72e:94ef with SMTP id t19-20020a056102009300b00476e72e94efmr9650757vsp.3.1712080696946;
        Tue, 02 Apr 2024 10:58:16 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kk15-20020a056214508f00b00696a78b9cc6sm5720428qvb.53.2024.04.02.10.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 10:58:16 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:58:12 -0400
From: Peter Xu <peterx@redhat.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Yang Shi <shy828301@gmail.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Andrew Jones <andrew.jones@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Rik van Riel <riel@surriel.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	James Houghton <jthoughton@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <ZgxHNKbDnIIs7n2r@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-14-peterx@redhat.com>
 <adfdd89b-ee56-4758-836e-c66a0be7de25@arm.com>
 <5d9dd9a7-e544-4741-944c-469b79c2c649@redhat.com>
 <ZgwwOq3XXKlS_7LQ@x1n>
 <f4aff3e9-1d78-4bb8-a6f3-2887b9928b54@arm.com>
MIME-Version: 1.0
In-Reply-To: <f4aff3e9-1d78-4bb8-a6f3-2887b9928b54@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_105828_868726_D39DBBD8 
X-CRM114-Status: GOOD (  10.12  )
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

On Tue, Apr 02, 2024 at 05:46:57PM +0100, Ryan Roberts wrote:
> I'll leave you to do the testing on this, if that's ok.

Definitely.  I'll test and send formal patches.

> 
> Just to make my config explicit, I have this kernel command line, which reserves
> hugetlbs of all sizes for the tests:
> 
> "transparent_hugepage=madvise earlycon root=/dev/vda2 secretmem.enable
> hugepagesz=1G hugepages=0:2,1:2 hugepagesz=32M hugepages=0:2,1:2
> default_hugepagesz=2M hugepages=0:64,1:64 hugepagesz=64K hugepages=0:2,1:2"

This helps, thanks.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
