Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9CC5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8GK+B3T/mIO6NuFiXElqkCLzCPAe321LgVgHRuTPXc=; b=2I6hTZF+2hgiFX
	Qy/UTA9a5Ss3Xy9E1TNmEWEBuPl3sA5+D3a9mS4s7YphPWlo2LILhjWeUxLrjxshAA/t8GiFDga/9
	unto6UbN4iMBtsFj+xJ9lKoEKDSPtdWcsBsp8tyZ8kPjyRmV8eeKoNLxRWEEKX1xYUqAkXsBnO2Cr
	Y87TVlZTbF84aymdKMxPcHiD9YHt+ZTjbmq7QzWicItRZMjS5BtizRL0VLkS/37gnmelr3M/mlyip
	drP/dCCjYsHjZ2M/Wse/VsWLJWj59zXgJf9Oaz13A3Kn0rncsIFZMpPoiBuyD3wrSEwokW6hpEWHb
	upZhR/pBfNid4baUcAeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSJJ-0000000B8EF-2GUN;
	Tue, 03 Jun 2025 14:08:13 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS2g-0000000B5vW-2MI2
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:51:03 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4a52d82adcaso48858881cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958661; x=1749563461; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=maKSJTgAb45dTnuTUo3DH3X0uuFMonoRcna612QMCN0Gb42B40SaBPz8J6ipVINXZR
         cHHJhaUQqUWSXdShptKxYBtRgHpJxbbJm8tFN7ip6D2skcGGHrVcvn2j3EymXPkKjknY
         FXWfXp1vMU24AV3Ga3gaH0j0WztKfGUuQAxEZyR06/SMH64a150bOvX4P7JCsplQzccT
         ug7J5ZFS7D/oystMLJ0pgUdSzbkr0OQ1FFRVdB5iG+MqvlYkEgy6ISwi8/ow6Mjx4QJE
         gODTEeckOAU3gsq1PObR1S27T3Pmf+CqSoYpWyk09eKbhgviYsJoin2LmLx8G7U2idYG
         2baQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958661; x=1749563461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=wxcmGhvlf6QultoJgx7VTi49d+hkmSS59FZ85GyKAxxqUFqhOPUD3Z6nLyZOB6sOky
         ABL22ArzBfmX9pgRFcZ9byDoRVFbMn1mKKZvViz591ijqK7iHEIzKlbuZ8P9LKh2Vxfb
         EGHIyCtq4HFmwlGtoJLW7mJ40HC44/uyKvfvAJSMLXeer8z4o6wxCQqEXSi/g+NFxcOw
         igQAIbKdohkDbjlFUs3fe8Unt0FVXD2fkygUrx68/KRSjl5a+N5YEJBC1m6I8jmFD4EV
         jPdVse0RpfLRiQ9nDWdptHHp28Lh3LIJVRs4rxpGTguOZ+1w9/L+qGYtIGRhgUNjM5VH
         U2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvU3EF5aJHPuFgYu+z7EgKH1+0ndroX7XxgQ8cuc9KdZwmUZV5wxA+YtMAuDC6b8lP3iIfFkPZFgEBLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcOySROe0jVaHgnyfhweyCZK4vbcjUpGWHijxZuihSKGkgndOv
	qHf0GKwL6PbFA13dE57EhxdbO+G9atHonizpL6PR++JwHyTvtpJGNc53hXGeVVVQQyHxdb94C2/
	Rt5DV
X-Gm-Gg: ASbGnctyC+SH0l1eTvQT9Gwyjjo6qm2RfL4Jegm02zVYm2PuBKi5n5hXRK3m+iUs26B
	V3DXjivXEMX8exx7yPqokc61uO4/q9rKmOTOnQgWEQj5E+rFO7VdyTLAaH3wjRXSvj8kwez9+nw
	PZlI8cC1pkmTKgwlWxr+ywHYW2Rm10yupDDxpHN6qz3yIpoagP6CdEcnVMunpoVhAKWJjf64qZ3
	9JEq6/c6/f903tbg6p+1STSGkKvGslMbcwlFyllwD+/NjWNhc2R9Q2jOFMDztovgqvHaDiIxCxT
	7G+v9ML2xpOzpD5iPHjV5RyYkA3foGdrOqLCFDv01alDi93bIPAwPy3BKKbCM/jcdPYZVkyQCBv
	mKKTS7evEV3yW7FaAWhqRQ6t8Srg=
X-Google-Smtp-Source: AGHT+IEFP32FP1kWWCcJZHDROTyLVsjrCtV3bR6kiIwGVnTYe5RPt72l9Jyf9JX2LfFifGppycDP9g==
X-Received: by 2002:a05:620a:4629:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7d0eac62c8fmr1708400485a.14.1748958650816;
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f9925sm841658185a.41.2025.06.03.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2T-00000001hDC-3YG8;
	Tue, 03 Jun 2025 10:50:49 -0300
Date: Tue, 3 Jun 2025 10:50:49 -0300
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
Subject: Re: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <20250603135049.GL386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065102_600199_2EBBC6A6 
X-CRM114-Status: UNSURE (   8.16  )
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

On Thu, May 29, 2025 at 04:32:12PM +1000, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Yay!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
