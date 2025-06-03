Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87D1C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 13:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ny8fVFCYxy3Dz+dZ6Kvkc25iCPr7t3kEBXZfT7W7pI=; b=4s/K3HlaUMJ94I
	QoR8rVAy9kx6Pp9wo8Wd5le1XB7oVsTO5kpT8GE/uEXBb3GWuliBLGhqqCjojy9TKMXVBKtyZ1azX
	KUSo6afceH8MlVOV22TpFZtrOMIci78KE4TgaqVBtiEZOK93cCaRr4VplY6Xt7OAMRFXWqIXQOgYH
	G7jd04+D+eQKPIfMk+uR9UunzO/y8g5johxJpPxneWe2B1z4hfqIpP2aWapZj2WVBhDPwvY970hFJ
	5QymxU3UUMS7r851WekAOqctMBRq2sQjlpLCMWSihZwC8v7Y5xquTyz30ZHAc2h+9isYpcetQZ6sB
	prt9uu133li3e42o/o0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRml-0000000B30L-1DBh;
	Tue, 03 Jun 2025 13:34:35 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRmj-0000000B2zL-0omF
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:34:34 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22723276d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957672; x=1749562472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=IX4D1GUymZrO2GJIkXhSyMEbKiNM6kDs5ySMdh6K046TN/1e0Lf/jiXviEqJodrEI3
         1j+tv28e41WMd2zMaHMr1mf45S9e27MVfh3ldp+rz30MVMMnvS699qrlv89kuIvGtPKi
         kwFcsbB+vRbPENYnEzTPQo2lUatPgHsdZWjI06YOUmTC1Sgl+jrl3+GBjD6oxV5XnvWS
         pUxSuaHXzXPFcmangfc2btyrNt7zTcLZOwYRxFYKlIQs5D59e2K/6x6BA3AV39G82sP/
         sM1v19+JMZdi96QyMJuujK1Bc+Pz3ChgZ7MxaWajFrY7Uoa1RM6kwciZDp7d4/U4HiZp
         K3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957672; x=1749562472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=gbQbfBip513uv4F3jutz3uCJSxKmnZjujz2T7AePnKNVxJ092c8nxh6yemhv47P32p
         PuPRpBvd26+6OimINb8C2U7xleOw/hp1SCiC/4JEGByW+sUu6dB0H7DDUOU6PGVyMATW
         NF4OaeO9zKEThRnbJbX4Jz6JwlGRdXy11Oyz2XZ3/K2VOPuEDbW33uJV8HuFQ+HtX4eD
         qnLzs4KD4Kt4LxQPRE+CBHhsZl5Z2Q1ro3WkO3d7p5wYyWmzpG/P0eIY79y+dncPPIkt
         iUL5Lp18t4W59Dr5kwe2yRkVQCrTh6cAynLdRUM6HM2agLBdBd1WA+aj+mpFiRQ+Si3C
         Dqfw==
X-Forwarded-Encrypted: i=1; AJvYcCUhKilKMZExabfT8TIAND4tIQTWxS+DSBCjNpNTp+eJbfsk+MLrivmuQG2MuEm+pkXuO1NslGDe9V9Y8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuSm3mzmH3c0Ac+YTv/C8vlv3jixh+Pj46wqSxxSIY4q2/xbLs
	Zin13VkY74uq5mSKyTgmQ5Xiutbh0xFAIWDcIrn7Mu09TkqRVxvWbS+gmCaHDnXBu14=
X-Gm-Gg: ASbGncsab5kfuu/gBh4bBm4VoCZx6SnMQYyeHAzLXqO7t3USACmMr2inR8clb7stSA6
	+0LLYXzrpg3zDDOl4O2XaROZCcbBo0Dxt0Bya6khymcOx/EVx4DW/J1uoHbB7JFW0cnmtKj6ydg
	HO1SQ4ruMkHHZaO6Qc1g8urqbZCx6z3DxTsLs+YE4aI3IkVdXSwMrSdX0jtf9FAzphetTn3DkJt
	e8BhzUl45XS76FlIEp+p3+3FFBV37Dv2XHtz/UpxClEWKftIaE+fxU9AKoDFIF3jc4BsHwyctM1
	HaYg9foh4P6TeubCN7Dcf9lrzwy16j+bqT7m0PHGmeoXQ2evac+wp9twdtgg7MsJo/LnEHIgD1Q
	taj9BMGwaa75OxW3yHutWONYURXg=
X-Google-Smtp-Source: AGHT+IH3/hKllTZ0eEK/dcuWTgO5QsHZ5LZ3JNRLIXTEioRhdRSPfL4GWfnU3eDieGqXq6aFnuzp+A==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6fad90aa622mr189063246d6.13.1748957671754;
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm80064216d6.75.2025.06.03.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRmg-00000001h3q-2scY;
	Tue, 03 Jun 2025 10:34:30 -0300
Date: Tue, 3 Jun 2025 10:34:30 -0300
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
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250603133430.GB386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063433_235275_3D1FC3E8 
X-CRM114-Status: GOOD (  11.60  )
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

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
