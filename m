Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1087C5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1t62eoC3zZjc93A2EX5SEHsqCGo4B5iReu0o1JPk0BM=; b=F1aa5F1TWp+bnL
	Q/FJfU0ReIhJakF2tpm3TfdWYgGsf3GOOT/hhLHJn0GSIWOXOx/yz5qLbMUdI5m0sl708rOFosDGp
	II1kh9n426Q97aq9oOPCG3r3/bfzBp8Xotf1/fnn5SneH1iCsUxmuB5E5gPVf1Hhr+BBqKltN/UxP
	3ZG++sOM2f4R/+m0iOH7jzJK8DcpAV+Pw8GIcyFL/4G6KqpC5seA/LqMt38dM/X50dEv2TIExon34
	yiETr67Oh5fnKe/J/ssn7QHKYtOTByd/xbUfD3shbg+8sqIZO4vX7VpMvNcfHOxhYJrDPnKH7FAx8
	v132gGNOyEgZ3ZcFpCTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9PP-0000000FRtl-2zmB;
	Thu, 05 Jun 2025 12:09:23 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN9PM-0000000FRsL-1Q5E
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 12:09:21 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fad8b4c927so8103956d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Jun 2025 05:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749125358; x=1749730158; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=Fglb3hjAkgYUxbhomFDkBolLbydEAbEqNk6m0QMleWMAqlNDxS7aU2VF6fqE76dDAX
         dVO+qeaNd1PIvq9voeg2HxM78vaosQHvOLLETaK/Pi23XTrzTFqnI/bXToJ4H7uOjBV4
         /gD0MtL7oN5616Yp5GCloBAQ3P7fTwECatocxtFnmY8NPheORQBSofSZDQBweOBJLuJg
         YjvHnCfTmlcFkaQ0iZ6PG06gHi53JnAEI+C98Qj9FwbUA/Qi/gWPg9PjqDf7Q07ObdzF
         C93FLtboP1ZMj7V31Bgg36fxrNmd2MxfuJPD6X+A2R5ZLi9IV5r33UciLD49Wan0aRpM
         FAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125358; x=1749730158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNA1AqJPiuiUBzCeRC8bK1nu38f0qCHlYuwt9uDWl+g=;
        b=ZbkXxeh2AgHBkd3U6xgLp3h024KwsXRMDSd7fcRCIvZ+E/5nZDoWQeiQgbKOLfw9W7
         vcU4klhNEYG9wzG4ZxoiT+Ye9VKBJgNFNOz5TZkENT4pRDFCwp7HmMlhcWYGsZkJl5ia
         ZuRmftWY/6FbYZfskOiYYq4YuMV4sTyABmKDt+zbjmWoEeZilFiuHC7Qpc4eZevez3ON
         QdE2FbazPjXJId58yGg/p3Rx5O1+5XzqzgbpQC0wIA23T7miuHYLTaWMw3RG13rn7OFu
         qZ68nfM9S/egLM0dXofsAc7f+/gUUNerrEa9wkAjabPL+MprFs+Ma35ho0Ew9QZZp1KT
         Au0w==
X-Forwarded-Encrypted: i=1; AJvYcCU1lkqS/A2e/u4dxOh3JZHx7nmSYbcKEDBgwIyVOoxNrpx7h3vwiSxVLkK3UyL6WfeGOWjdAfC9qopveg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5EYmnDZ0i5nWPsZ83EKAhb9aAvVVDwTBGMtgxooee/KwBggCN
	WiDv7h5WLmI1BMBV3IGbL7UctHuiJV1Eogs8XX+7qogb9X03acJ4RYWBOadkdr9+Iu8=
X-Gm-Gg: ASbGnctq2Rn9Y91vi5k29/8VJjcYisEpP6RuLhUz8HTbQ+jh9ssjTnTbVSVlkto5JrJ
	6Hr0pg2XYKMEgFkvUlVixF7WkcuQK6VJGou+7NAf9xrJKgZxW+RoN96ZTLP8XNTsPfc9Wa+GWcS
	8c/A5hy1cd+hll9x++r1ODR/gOAl/VXLv2rk/IcIjAl13O+7LYEE8mmzsOxq577MnGJ3wnTsDgC
	pEDjTrMQL/0mfr1YlRp25owe7/5yG2YCGn9NQd2artaJWad0dPkszRLQf40r5S2ZGmk5VffXfQb
	OanqtE97UULNwjXN79JVDSnOqWVFE9J+nUM0x3qGRvoERJhArBtCiZUGGGT4IolDB3jSqf3Y/eU
	7ADLncg7hipJbE5nbulKUhMBueqE=
X-Google-Smtp-Source: AGHT+IGoKm/5U4/UM2uM64qO2HBitYJapsKbuDFJlmk9byEyE/W8ROsmev/IR9V9jeal6LfHAI1O8g==
X-Received: by 2002:a05:6214:224d:b0:6fa:c512:c401 with SMTP id 6a1803df08f44-6faf70163f2mr115317766d6.37.1749125350351;
        Thu, 05 Jun 2025 05:09:10 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4c7d8sm120604836d6.36.2025.06.05.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:09:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uN9PB-00000000EdT-18gz;
	Thu, 05 Jun 2025 09:09:09 -0300
Date: Thu, 5 Jun 2025 09:09:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
	gerald.schaefer@linux.ibm.com, willy@infradead.org,
	david@redhat.com, linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org,
	jhubbard@nvidia.com, hch@lst.de, zhang.lyra@gmail.com,
	debug@rivosinc.com, bjorn@kernel.org, balbirs@nvidia.com,
	lorenzo.stoakes@oracle.com, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-cxl@vger.kernel.org,
	dri-devel@lists.freedesktop.org, John@groves.net
Subject: Re: [PATCH 07/12] mm: Remove redundant pXd_devmap calls
Message-ID: <20250605120909.GA44681@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <2ee5a64581d2c78445e5c4180d7eceed085825ca.1748500293.git-series.apopple@nvidia.com>
 <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6841026c50e57_249110022@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_050920_423836_12BFAA84 
X-CRM114-Status: GOOD (  10.32  )
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

On Wed, Jun 04, 2025 at 07:35:24PM -0700, Dan Williams wrote:

> If all dax pages are special, then vm_normal_page() should never find
> them and gup should fail.
> 
> ...oh, but vm_normal_page_p[mu]d() is not used in the gup path, and
> 'special' is not set in the pte path.

That seems really suboptimal?? Why would pmd and pte be different?

> I think for any p[mu]d where p[mu]d_page() is ok to use should never set
> 'special', right?

There should be dedicated functions for installing pages and PFNs,
only the PFN one would set the special bit.

And certainly your tests *should* be failing as special entries should
never ever be converted to struct page.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
