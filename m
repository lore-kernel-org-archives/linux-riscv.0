Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C50C4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BlE+GW3nut5aBClL510tjaPZEx71coj5q79u+WQo/eU=; b=eu2NR+2hiq9GXq
	yK/FsQSY7qktrjmjm3pYUdDSATt4lAQsro2Sp4UaWG1doRO77Y0TvQADa8KEdTb5oiPkoiV8wSajf
	M3WBSAESKe/UgxDOhEoMK7ZSP5NbNJ5kGH43bi8yIQXeVZv9mrIBWLb3M/QKKj3JiZdWlrYHiqutm
	KZW2rNbQ1SaYrOedMqv96v14uKF9EDr1VGfL/PnlDX2tvIq8gPA0YjM50Murtvz6x+yHDfKUcei2F
	fzRhP6GCzGBtlEb4pCjgOLyl4zpn5BTlv9OZhgMTWD88pIFMiVqf3gtOnXpnCpv7dq/kJhQgPIFf0
	pMy3PgDFJ8v9U8ftHGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpcc-00B2ZA-2A;
	Mon, 22 Jan 2024 08:25:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpcZ-00B2Vz-1o
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705911928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bDmft0G/LbU/vGcrH0ViFbqfb55/2jbpdSGlzfSsB1Q=;
	b=Tq0Kr1MWX0KSxsm9olcGK5lIQDryQLr36bHs7p4buw8wePJUKh6BrP222hP+Pp0JKkefsJ
	F1e+Pb1nhWcqUGXV+pmk+Xu1hEzJlKXrfeB/uIdJ8mgTn9nbV6D+q3zlQjkIVyRE8Ips3S
	vz07mo4uUttYPWFUgtVxf9+qcHSELfU=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-m_a4dr_GN_-CTr3MDMkOAQ-1; Mon, 22 Jan 2024 03:25:26 -0500
X-MC-Unique: m_a4dr_GN_-CTr3MDMkOAQ-1
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6ddeec294fdso742566a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:25:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705911925; x=1706516725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDmft0G/LbU/vGcrH0ViFbqfb55/2jbpdSGlzfSsB1Q=;
        b=CJs/8il0UUHEGe5VgBdiHsTKqU7f55MF3qMPYqgOpMaAlDlEFuZe7fgvM5tGQL1+eu
         uoKomRwO5rxjXJs0p1wsZfPtbSXfutCkvU/LHBABDEhMRU8ul7RZxWz97SFd2C6mFgCn
         aNUy5baCfPNFY3/dkRFKtboSKSmD50T8R5rNRIR1ZyglbGqN4+XfyPbq6UcfJ3loJdMv
         ZPBiyjhL3+OnnMPlpfCzekIDiaIILgGbGl8jZ2ae9myHjZ0bOSannBmNVucmdTUz0X0K
         52IYsRdvxr2vSWupO/rFgH3zB/ZR2RN0N14jr81ou57Wyz6ycrHhG2tat2WMutX7XYAP
         WMrw==
X-Gm-Message-State: AOJu0YyH5MM94PcjkEQTftSyonlcCp03fMEs7YZh82cymhCUWyTc9262
	QbZdVZkHVsc+sEKjH92YKGjWBTDawYp9nLW/xsnPbPXlZtFTXpvtvbcIxv1x5ufM4iWgH7kUig6
	G8Rwc8aHR27VA1lMYvshRcivlaWXvPIMc+GeQ62hUw3smFaQiGtn5mY/qbax8Rc0cLQ==
X-Received: by 2002:a05:6358:591d:b0:176:5ca9:7213 with SMTP id g29-20020a056358591d00b001765ca97213mr953016rwf.0.1705911925337;
        Mon, 22 Jan 2024 00:25:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHSePoGNoX92PzQmVfT4AXX54k/+l1fGFhIaFtWONOwMEeDpGYerPythOMH74Vw9shCsROV9A==
X-Received: by 2002:a05:6358:591d:b0:176:5ca9:7213 with SMTP id g29-20020a056358591d00b001765ca97213mr952991rwf.0.1705911925009;
        Mon, 22 Jan 2024 00:25:25 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id h8-20020a654808000000b005ca0ae17983sm6839110pgs.8.2024.01.22.00.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:25:24 -0800 (PST)
Date: Mon, 22 Jan 2024 16:25:12 +0800
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
Subject: Re: [PATCH v2 01/13] mm/Kconfig: CONFIG_PGTABLE_HAS_HUGE_LEAVES
Message-ID: <Za4maErLKnRnM0sB@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-2-peterx@redhat.com>
 <20240115173737.GO734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115173737.GO734935@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_002531_667862_007CB93A 
X-CRM114-Status: GOOD (  18.57  )
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

On Mon, Jan 15, 2024 at 01:37:37PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:11PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Introduce a config option that will be selected as long as huge leaves are
> > involved in pgtable (thp or hugetlbfs).  It would be useful to mark any
> > code with this new config that can process either hugetlb or thp pages in
> > any level that is higher than pte level.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  mm/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> So you mean anything that supports page table entires > PAGE_SIZE ?

Yes.

> 
> Makes sense to me, though maybe add a comment in the kconfig?

Sure I'll add some.

> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for your reviews and also positive comments in previous versions,
Jason.  I appreciate that.

I'm just pretty occupied with other tasks recently so I don't yet have time
to revisit this series, along with other comments yet.  I'll do so and
reply to the comments / discussions together afterwards.

-- 
Peter Xu


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
