Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9F7C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DR0a7gUAGkA6YFBtgBnEVOXRSnZFLK6reL4IkRdDIRM=; b=JsXhALNvBoFG+2
	XIyKySE+j4R1zoz+05TqShuYaid87TknuIaEz9U4JyyeL7rj+YolKSqtGiZ6xWO6IrKlo+8MLoxGI
	4b3oIWRKHauigKFR2Uk//YhCpHO1N8iIClHhXlurooyBEZia7UnP2m1nVtasv3dieAh1gWLlIQ7Gl
	6nXRTPA4L2iGvTjNwNMg/NZRPMlUz1S+DeBosPq7lE8DAw0P4ahyTD5l1nCON1QaXyJn297wRF/eQ
	rtlg2b+AxZPClqIQzCRLIC9OTn4+WVS8bIgLWJ6lddzv0aKfvDnjXGO1tzZpPFPJ6A3vveULq9Wiu
	+Iu28Sg9NTGPRSTr4jVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRox-0000000B3S2-39Ro;
	Tue, 03 Jun 2025 13:36:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRnL-0000000B3Br-2C9T
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:35:12 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so36690596d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957710; x=1749562510; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=EaR91pv5tQfehrwZp58Y5pvW9h+o0tw+yqFmXEJrMTOrypoATw2Bn8Eq7Boet6TTM4
         YTksCzVB57P/8VCzVEejx3YTR32jxTK31MgXuN9kb4XMJppOvuzn5+D9tgfoiifc4f8E
         fk1WMPuI+bGnJtbmEDmLFudD7egLId2kRvuA1/7wde0ESk9TY07hiXVOBCJ2JraIlz2W
         SleTggMiI4SDI5HNMh0dq8zpgBEBnmX0eVKerGeXS1nQCZiObYVv5vZvqZw1eL/ugrXZ
         2ry0TV8rPYPlVcH7KLHUKiiiwPC5rs9AFfkg9T+rndODCgKw6TdsBflCOQcTqtHbMFaC
         ZjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957710; x=1749562510;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csMjX6EgdDvsoUroDDkC2t6M2H8xOJU7irccfVA/OHY=;
        b=ekfO6cCPmusx2sN4UriwbxuZuzGtPkJ0eNUb4T3FKkvWvVMC5Bg7WTYVNJ4M8R2URN
         GfL9qLFzvT55YgKD1cFc/Pm6q3Zu5xdiyYkJg78GPgTDL1t0d1tj8ur9DHcvALsPN4uO
         Fd53U9xr5j/2BZoOVTBiooAa3wmEZ0zcxxGLFuZuk3cU6JvSSrcPR/wuFcIOHwko8IYN
         LfcJTSFHP0TYf/TVYOSFs8Ray+WWi0tfhLGyrqcgUzIkvF8ki0uxu/8LyDuj4zmU5JK4
         3odpPbmsvgYjtWahGtsiSPiQafbGQz3FwBIurbixpvqY0cgUxLxTock4/dSBhRIfDzHe
         CsbA==
X-Forwarded-Encrypted: i=1; AJvYcCWku+qlcflXvFj0CBvYji5gRSzvBBCFqjfoNXBNrnC5nvNvWH5cNrjN1c1a26c6hEh7kxwmmHVMUqEXfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJOHle3fBCd2NWVFoPTfT32CsAvHu+9p4ddBbKfBznpHjyI71F
	wxbGHjSLI+meUuI8cTX3a/7XkiRmJ4SUPMff02klzbd0rUeYc7oao7xv5hvYMWIaQAA=
X-Gm-Gg: ASbGncvTJ3I/bxc2zmigYVIEJ9zqA/GbZ5ljMqhet9B3RV7qUKA8906yNuO531GaIQ2
	Efd7je9rTJwXDKBv3JcLTMrqc0Gwuxkf81Wkho9bGTCimVUC5zm6XSSC6l8cTOhqVKAL53SIE1/
	1NjDc4ok4fT1y4qPNwwI/z7Jn952QV6O0i6rfvyZ4/9dc6ntun+MAkHPTeiN9neiW0rm4mPLlvZ
	LIWHWNDbhVYXrdlMAwRtj/SACqtI3aq1MHt2XouHDfEQEV5DECgEBBcaz0mQ4WExlmLEnrEsbzf
	tmpEgJ1nIPs7Bio+39haQKI84A3mJimT//i9LdSluQ099ib4bGdq+KPA8av21THO11z7iMgDf8F
	SnVxrZbbC96Vvdhf+8OdoWntA+fQLKuDnd+KsXA==
X-Google-Smtp-Source: AGHT+IGTO1Uq6qWKkHjHjzXPtbeutCQLStskBTpgABiXf8IiWIF7+BRGzTPM/WsKdaJBbv1DscVTNw==
X-Received: by 2002:a05:6214:d87:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6fad9090760mr153489766d6.1.1748957710547;
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e2fc45sm80639296d6.122.2025.06.03.06.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRnJ-00000001h4R-2OPU;
	Tue, 03 Jun 2025 10:35:09 -0300
Date: Tue, 3 Jun 2025 10:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 02/12] mm: Convert pXd_devmap checks to vma_is_dax
Message-ID: <20250603133509.GC386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <224f0265027a9578534586fa1f6ed80270aa24d5.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063511_562208_8D1E4457 
X-CRM114-Status: GOOD (  10.78  )
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

On Thu, May 29, 2025 at 04:32:03PM +1000, Alistair Popple wrote:
> Currently dax is the only user of pmd and pud mapped ZONE_DEVICE
> pages. Therefore page walkers that want to exclude DAX pages can check
> pmd_devmap or pud_devmap. However soon dax will no longer set PFN_DEV,
> meaning dax pages are mapped as normal pages.
> 
> Ensure page walkers that currently use pXd_devmap to skip DAX pages
> continue to do so by adding explicit checks of the VMA instead.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  fs/userfaultfd.c | 2 +-
>  mm/hmm.c         | 2 +-
>  mm/userfaultfd.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
