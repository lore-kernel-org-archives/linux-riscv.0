Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD56CFF885D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXBdni9wANDSzIbfYpXhEAcw3vcWgd10F6kwSNhljUg=; b=FiQULc5Y74xJgI
	+9v6Q12lp70xcuCEqpGT2N3jB+BBnWh5OhxkmkpkgJG5LF2LOX+pw6TGvyFSgDjWYLld3smmFi0Au
	OrwKZXE+pZBeUYIR24MsTBGijgOIEgXQAbhbih4ga+3/BDSuJFNgKx0HGgHwjLMwcngxvdwpPl1vC
	jbNq5ZvoSCmz+aVD8AYKbK4VjFg+6qWi1QY+nLe3dMiyaN5trP2Z8jisX/YA4XolCm3LBeqi/eLi6
	/LAHyXbfA1wjzTk9HBnnVjrTeAt6Iw65dbdUeKx4A6HOtElldtD9jkNsFiznQ4PTx0aGmhnkVD8XA
	tayvKwdfMQhy7TmjZWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHieg-00000001ZE6-3jAx;
	Tue, 28 Apr 2026 13:39:14 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHiee-00000001ZCu-1JTR
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:39:13 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-8f0a87e23daso669231585a.1
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383551; x=1777988351; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXKtcLwqLjfsawGA5AC8W37mySu8/8Ho5thgPASoghk=;
        b=A9RydTXIDc6noSH8LQz5CE5iun1D1m4m/W9oJyHuoV5X9Y/KsMIRYQWDaOo/tTwOLr
         ZkPD8Ufe9Cj0rQk+UocXRSICKUQUt7TOFUYrso4qMpQPn4HQHQb9HxDGK03jv+qxOj7X
         UUOK7ClDkottfJIzFUPE9/P+C9p8/qt14aZkm/dTTHv6lr7taBDpMTzob+MrBt0p1bFZ
         7pg9ongrzeL3gg53uo7kOOkzqk/RwyAoQQsoKTyRC1HxeRYIlr1lz/fnnf5cFha6DLTJ
         sz/WJ5O/NLk76ndhmHbJdY8QEV5bd9Sta5jeQJSqsxPuewQhvhs6u/Jn+dHyGzkvLLro
         zj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383551; x=1777988351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXKtcLwqLjfsawGA5AC8W37mySu8/8Ho5thgPASoghk=;
        b=HwyYJxaW3QdK1rRw+mj/0AssofBcsvzpzY0vhqbtAGIW1M8KjRKsz5T8RSxhU3CvYb
         OWd4Hy5SO0I+8eT7epAr219QC+MXKznPxVgom/nArlYh2PU6r+nuECekxL8OXcDJVBLA
         s3vcJQkYBSrHBLCm2o2GqcjXP2MEgjGe1uxBWZHqlXuo9yDC+bzsqIB+XVmTAdnY7TXM
         SGJfJiXJwDoQ/+6ox+jgQ0Au6uMjNnaa+wXMwgWHnr/HhxPka67GdTRxi6sVQg8+6wqD
         h5PDM000E6DVhqesE4LQ/YUxty9mvYDmAS3AEunYzXpctIOPFfHO7c5jBP+kCAtW9STI
         2i9w==
X-Forwarded-Encrypted: i=1; AFNElJ9RUkSKReq9SDEtCWCfLQFss1422HVGdO5Pqrg/ozr+GoYHP/HWioSx332Zt/M9Eeg6twQalhcwUHNN+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw152NmpXfLzwRFRupXRl98C0aohv2BC4dQznDAa7P+O02v5pAs
	Tz+RFD2EeEawV2LPLT5bXORlSXj61te2j/AssOBcpfsipvXrxXq5UYPLBcOAtKN8U0va4Gdv7Yu
	0u2iCZHk=
X-Gm-Gg: AeBDiesBxGatINNw5VOuPz5CQ1BSLRI+nfVod82tuWsNJZT8mx8dn7xsZ1rq1lKWMlK
	y5VspL7jEEwawV82HXFOKS82FqtoK+F7KD7Xxr1pGLeTTbl4kxl4i2RaKqZezH6oc/QGbUFoTgA
	B91lY6ZOXACJzpK1TsyZy64Zc1ubbNHRA0nx+uYbU4uj4HduW8w/NBdffNggUx/vsPL98HiQdqr
	NPwbkH4jfpNCUrU9ijSlulgpcZfRBXcpyOmfjuguYLwMzHLRE4jpBQGN5nOGTOopzVAhfFt6EsO
	Dco6a5tIqcNcu7tFoS9V8Q9urTGl+jMm1cEuTBvgNHYv0CQODL247ZLHBvkskH1ARbeRDKlvLAQ
	oD9DXBp9cZ9UCv5CZnNeC+nBr2RsAp3yABpm48ZtTW/nnB+aCn1ZgbiPDpXwG7uz3Jse0IjbyMf
	qXcV0drFfIoJeszx9Rz1mfBO8cVGSdw+yGtRhZJmNrqUvzSgEfJmc4yR6SQ8xdlJIbbaoav/veF
	QUy6g1HCErsc+Zd
X-Received: by 2002:a05:620a:28c9:b0:8ef:12de:1337 with SMTP id af79cd13be357-8f7d9200e1bmr385079485a.38.1777383550897;
        Tue, 28 Apr 2026 06:39:10 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c48c71fesm230888585a.5.2026.04.28.06.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHieb-0000000AjKg-3JBz;
	Tue, 28 Apr 2026 10:39:09 -0300
Date: Tue, 28 Apr 2026 10:39:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/11] iommupt: Add RISC-V dirty tracking PTE ops
Message-ID: <20260428133909.GH849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-11-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-11-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_063912_352093_A8C28E56 
X-CRM114-Status: GOOD (  10.04  )
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

On Tue, Apr 28, 2026 at 09:13:58PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Implement the three dirty-tracking hooks required by the generic page
> table framework for the RISC-V format:
> 
>   pt_entry_is_write_dirty():
>     Check the D bit (bit 7) in the PTE.
> 
>   pt_entry_make_write_clean():
>     Clear the D bit across the full contiguous range.
> 
>   pt_entry_make_write_dirty():
>     Atomically set D via try_cmpxchg64() on a single PTE.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/generic_pt/fmt/riscv.h | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)

This patch should probably go earlier in your series, before adding
the alloc_paging flags at least.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
