Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB20EFF885A
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2026 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xutqHTAaRHg5PlIJ5htzRRzQzhm2MJuCjGLi4QAUkHw=; b=VS6q3mpqGj0d+y
	5KDy+NS3V2Jypckx++BOEcditx0dwfs3sJS7hhnS7yyaI3IDCe10Z0N9RT4kGEdU38pZZVGG5qR01
	GfbIzHlWziRGHof7/2MKUnQcbh5gAnIDOlS3dOmSSuncka0/tTsBbKxK0Q7NLA3HhTXU916Q60G3y
	pqYTuNzZTLZfHqsyKiBArsYgsnj+eU6t3+zctNiQnL/lO+DtWyytPF5NYPIjFRiAexZv+ifJHhyyT
	AAGc29f1Heg1qUI72xmRj8ALVrY0ZKL5Id80mMeAlo00P3NoiyZ4rDt5mIl6KepoVNLa2W/ZU+Ojt
	lt7kKv76yg9ZBantOhdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifF-00000001ZK8-2uEB;
	Tue, 28 Apr 2026 13:39:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifF-00000001ZJR-1axo
	for linux-riscv@bombadil.infradead.org;
	Tue, 28 Apr 2026 13:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=; b=JTVs13kKraWie4i0Mb2LLGmPDd
	EvjEtSwvQGgPQ0AM6x7mTpx/IQtgf5xAse5z1GaE5YIuCiKFl/KGIPTRa01BWZy5mz26BeE4tdAXV
	7gpVYy4FCvtz4mPa+LFMVep1MX7a1TYRH4C9Kw59T9yTYbWFk7OzD+3jNiMCMDPjE6mZPRZFU5iOo
	h02m5Js4fEQL8Gqx2zL+ntbufayxZKQtWAkaqaRFepoeU08wTfPTh36POk/V9Urvr8Gd2X0f9XqiQ
	6QfZcM/BPygVMcqx4SP/cMITNDSpsV9qP7K7lBgw/zLCG0PgBGubDNfQHIeWmyhMNZMczT+8jOMp8
	1IVE3qbQ==;
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHifB-00000003CUO-1Lbq
	for linux-riscv@lists.infradead.org;
	Tue, 28 Apr 2026 13:39:48 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8a4b8c3a30bso129768606d6.3
        for <linux-riscv@lists.infradead.org>; Tue, 28 Apr 2026 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1777383583; x=1777988383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=;
        b=jUYmHBTX2Zi1DDWGR+8xa4HxqXwSoSRe6/niZWMIvn73Rs6/A1+W3gX2v9cgMu4vih
         JdP5AMR0pxMVLg58DNRTWmcWo3Ok8xLx6XLUAskr+PKWiJqR+oSwTx4CBpHUKw9qCe/1
         ctN4gPj44NZvO4gJc0k5YTHM2S5PiCESRIMd0E33k+o/MP18hS4G5ZwKRqfsfLBIvBCh
         1x9FFbCHQGjlk+w8yBZd4EuGvalMj2u+ikbPYaSv++ZlJe9bgsyGHk7dMw4Smrb7Cbmj
         jhSHO8/IwTR6boyBWTyPlu34caghE4HT3Ks+UGYZiwEodyrjmo7f4nSA4DjNjTZWi53k
         qkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777383583; x=1777988383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP40XfCNqjUZHKaFHTD5m2R9L06qogZbeISGyPC9spA=;
        b=C93qCRpcNiIuhCNKN0dGkRl69a1iVD4nIeS4wKjGzMnXkR11QkEA1cvmEBSq+Cc39J
         AeFo+0cHyNIxUHipWdutmUrbdHCcY+CaNBx4nKblMXZUb4/4D6QPv6OmkY85XhaKy7R0
         hXGJRZscydRsVpf/aWPol+Irr6m2P26Y4HqBoeMPuTvO2XgpNBMUaaZaztRv9rFOYcbp
         xzsyHG1jwjuEyBAuAUkirMcmfPSGLTPuMCpLPA8GBAVpWpTOijTvKCSYaqQBDjCNyh1Q
         4QmaRykNZl6CtSL7sTpSbfu7S2ilx/O2wzFQzqGkDBHfxO9c7m9+mbrs6fVA9qhsjffG
         wrow==
X-Forwarded-Encrypted: i=1; AFNElJ8W6pWw0Dw6TKvaiHIF0AJgdll35bovh3UdNyksy/RYprsXiKLPnqDSn/IByNAcBb77/JySmwPinpcehg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJCPt2UXjOuru3JLkj3PTydDTuOxQ8y9Qb4DaN5oQsM22KR3V2
	ApdNzr+AbUKLeVLNgKl+FHDt69MECt1ffiieUL3Sarbd3cSFc7k2Oy1TqIjYxYaZ+qU=
X-Gm-Gg: AeBDietTgkUfIAMoWzd/9UnqjflIL/niwALXcQwkEe1iqC4gKKP/CeEJEdCifT/QxcA
	vZGwF+hBQxdhxj/iWNCoKyQLYHH+mmleqYPsN2n3hwv9vJ2z5i05Hil94YGETnUFZRiZ6fXr04Y
	Jqo9x7bO7eUlzGKlJIBKDMmT5XBDya+LigQjNZ7kZZrzsTniYKbu7SaoEw2YjR0dzI7etz1B3NY
	H0NXhuFCv600hdNV9mES0w47Te/rnmiUKXhCCeeAIuUNhZyHovzan5a+qSwbbNXF+LNrzNUIKvn
	rSFXwqODVHQvQCSVRLZm/RC7ZOnSel+bbgkQf2NRE/mgtkYB/K1nhlh5SHbk7/sonNvOhCpkTZH
	+QTtqNe4hI10ZYbJTxwv5xnFDVXcKwLZtzYSMYN40s7S4f93Kc70dKagGW+g2T9+m+IlclUQbFu
	CgwLb6+HGv4DMrcyftTu+o5oNCEuXcXvuPovpqQR8tjvZBfkpIUyRJ4tJVYkur0AuEAe5boaRqc
	R58FzIY4TUFNwVT
X-Received: by 2002:ad4:594d:0:b0:8ae:7146:603d with SMTP id 6a1803df08f44-8b3e2ffa2b5mr47731266d6.13.1777383583207;
        Tue, 28 Apr 2026 06:39:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3e281bd11sm20759256d6.8.2026.04.28.06.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 06:39:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wHif8-0000000AjUG-0wGD;
	Tue, 28 Apr 2026 10:39:42 -0300
Date: Tue, 28 Apr 2026 10:39:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tjeznach@rivosinc.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
	atish.patra@linux.dev, skhawaja@google.com, guoren@kernel.org,
	kvm@vger.kernel.org, iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH 11/11] iommu/riscv: support nested iommu for getting
 iommu hardware information
Message-ID: <20260428133942.GI849557@ziepe.ca>
References: <20260428131359.34872-1-fangyu.yu@linux.alibaba.com>
 <20260428131359.34872-12-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260428131359.34872-12-fangyu.yu@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_143945_505614_73D4ADAF 
X-CRM114-Status: GOOD (  10.96  )
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

On Tue, Apr 28, 2026 at 09:13:59PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Zong Li <zong.li@sifive.com>
> 
> This patch implements .hw_info operation and the related data
> structures for passing the IOMMU hardware capabilities for iommufd.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  drivers/iommu/riscv/iommu.c  | 19 +++++++++++++++++++
>  include/uapi/linux/iommufd.h | 18 ++++++++++++++++++
>  2 files changed, 37 insertions(+)

This has nothing to do with dirty tracking. It should go with a series
introducing viommu.

Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
