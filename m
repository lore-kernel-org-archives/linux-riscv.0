Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5771CA0FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 07:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUQKWUSnPRTD9lrjnmMCDsIa9bDRdiJqz0nUGGdZBrU=; b=B7Chml/U0jzqH6
	dfyCCI2tTXF0D5LeRtO5CTAyhPe1Pdr65wHa0N5ixWA4AqhrVNTHZTPg764ic0fVnIzp0ZuGYqBJH
	DTmDkTiqavg3Jwm/2GYSJYPCzXb50D2Fcx+dmsbB393swqmCcfMTndw11pYnKZraFItwKUZF8TjGd
	fS5GwFJ+RSkbvtD30HScP0/mmrd3Jpr1FuVTueyfYmIoQmGnHsucLyAfFh9MWdBg9UJ/ZqUvAogcv
	3MH8L0HLKGtc+Ryd7lCLVEayfdBMHM3hFc1fQeBAxoTxbXEeI4IRubXRUWMdIeGSw1arMBwVY28JG
	qoMZ7DYPGYBwX90+SMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urX2D-00000000aUO-28mK;
	Thu, 28 Aug 2025 07:27:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWuL-00000000Yv6-2mB9;
	Thu, 28 Aug 2025 07:18:55 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-afcb7322da8so107953666b.0;
        Thu, 28 Aug 2025 00:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756365532; x=1756970332; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACPidqQG6DQZNVxh12NaJPKP3Jkf06hyqyPjQ1p5F2E=;
        b=XqYfYlUwSXpgsDlMxgylTbnhisM9KRUoXe9xPr7etfJsQo8w+b7f5jor90U2wOutuA
         fihDvkZVxpV02s587wcdr2JLgTfDIPVXQYEQ+GHspMW7iILIvBva9LAfPlkMsYCQiRkj
         Vr06Rx7VXkwHjU5H1/5KdIqldTJF4jRfVYIYCeuQVHCNUtz0naj6Ex8DrIHCV/WphtHG
         NkfKmUTq3HnWqWvPgsLAp5ZqS8Fqn04Df7EPkoZYVvykeWfX5mOW27YPj4g/SjSfd8rS
         gQrbFIhaV9QOeHdl1QXq8qAVG92kEe4QKjmQcZ5n2Uh6y60Z5hrpTGzO6PckALzEx9M3
         B0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756365532; x=1756970332;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ACPidqQG6DQZNVxh12NaJPKP3Jkf06hyqyPjQ1p5F2E=;
        b=toQroIZCf48MQtykFoEXRJ7FIs5rxUmLTdGypKoMkh83WIfJGOSczsBUrXfsxd54PG
         E/KNAINbCUDLFjs1xvc84pPX3DSFYsuPUbdAz0N9XclnUUqYmSC2JqilMZhqDiwFu93+
         lh3ypluZxXfggHw5mRkFU1tM/JRPMBXEUk2DpRLId9rLXzCN7R0mB3vai4OFUDw3Lksf
         3EthH9NZw73Y1ri8qu0ZsBGpj5zt5fdZs9SqsYJ/s+hXBJGyWuJn8wZ+YHodwR+saFjW
         OKO6plqFUSIkXBSxlMzaAz6MYSrdvOAcqFbzzHF5JC1MfhcqDIYmSZD0vIJlsStUve1G
         VFRA==
X-Forwarded-Encrypted: i=1; AJvYcCUpfxEtoqAsjnHncBnbQpO/bVyOWX+hG+ctpBNsS3/1WX7oGfqXK6ZEPzrWl7MP+C08ztPlXH3UKXqNX6g=@lists.infradead.org, AJvYcCXwZMebuIY/tLs6Wcbd2ZmU0J314kQ4WN+GehtW6zAruskCKXy2tN1OImuWDAfiyuNQKGaKWR9wNeAIUwsF4OaZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwCWst7FNGU91k+yGrCKOfrUynfDq3jLgzndl3kyPiDx+5sPH2D
	lon+v2f6veJpoXFI3Pw33AYwp2L4sNc2/8LnE+e8KB01HlSOu1GmbYip
X-Gm-Gg: ASbGncvmHXYKKkeOL6GS+4OnoLkhPEV9eFta2PWXq2z3zIyjK4QVl/1uBlA1I2eSrML
	0G20mPgjD5Acy2lpiZTS071vnw8SKGi2VVZzi4u2k24dyfNXgDu7ImDC80Tfs72RTSvJa+1Wfgs
	fintbst0cRKyTnmSILPiYftkP/UQda5D0GDUdsJVYtjyhTFYTJE+L8Gi4RR5JTM8V/GR1yDMIeY
	zjr6sumEqXJmySHK5ub3s4a51re+vcF6YTcxqQLfuT9ozYITul/HeL97k2B20U8cDBb/tvaSUbr
	6O+vRWmvE74MuzQbbt/M+x7fH3YeZHvlrJTlMJ4LoWqo/kLz5inHQEXyGvR19EH3V/StDRwxlJ2
	Pkffb7GEPgsbbqEdC7WKU0CgQdaCr5h2TD/m0
X-Google-Smtp-Source: AGHT+IEf18QCG44U8jBJ4evHstdtd0oL4Hr6BpN08BPT0cHmsLXVki3gbBRZpXohq9eRx3IUTA8+0Q==
X-Received: by 2002:a17:907:d2a:b0:afe:dbfb:b10e with SMTP id a640c23a62f3a-afedbfbb935mr140730666b.47.1756365531421;
        Thu, 28 Aug 2025 00:18:51 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe98ade972sm616427066b.50.2025.08.28.00.18.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:18:50 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:18:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	SeongJae Park <sj@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 01/36] mm: stop making SPARSEMEM_VMEMMAP
 user-selectable
Message-ID: <20250828071850.kl7clyh6e75horlk@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-2-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-2-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_001853_726746_BDE2813F 
X-CRM114-Status: GOOD (  16.79  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:05AM +0200, David Hildenbrand wrote:
>In an ideal world, we wouldn't have to deal with SPARSEMEM without
>SPARSEMEM_VMEMMAP, but in particular for 32bit SPARSEMEM_VMEMMAP is
>considered too costly and consequently not supported.
>
>However, if an architecture does support SPARSEMEM with
>SPARSEMEM_VMEMMAP, let's forbid the user to disable VMEMMAP: just
>like we already do for arm64, s390 and x86.
>
>So if SPARSEMEM_VMEMMAP is supported, don't allow to use SPARSEMEM without
>SPARSEMEM_VMEMMAP.
>
>This implies that the option to not use SPARSEMEM_VMEMMAP will now be
>gone for loongarch, powerpc, riscv and sparc. All architectures only
>enable SPARSEMEM_VMEMMAP with 64bit support, so there should not really
>be a big downside to using the VMEMMAP (quite the contrary).
>
>This is a preparation for not supporting
>
>(1) folio sizes that exceed a single memory section
>(2) CMA allocations of non-contiguous page ranges
>
>in SPARSEMEM without SPARSEMEM_VMEMMAP configs, whereby we
>want to limit possible impact as much as possible (e.g., gigantic hugetlb
>page allocations suddenly fails).
>
>Acked-by: Zi Yan <ziy@nvidia.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Acked-by: SeongJae Park <sj@kernel.org>
>Cc: Huacai Chen <chenhuacai@kernel.org>
>Cc: WANG Xuerui <kernel@xen0n.name>
>Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>Cc: Michael Ellerman <mpe@ellerman.id.au>
>Cc: Nicholas Piggin <npiggin@gmail.com>
>Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>Cc: Paul Walmsley <paul.walmsley@sifive.com>
>Cc: Palmer Dabbelt <palmer@dabbelt.com>
>Cc: Albert Ou <aou@eecs.berkeley.edu>
>Cc: Alexandre Ghiti <alex@ghiti.fr>
>Cc: "David S. Miller" <davem@davemloft.net>
>Cc: Andreas Larsson <andreas@gaisler.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> mm/Kconfig | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/mm/Kconfig b/mm/Kconfig
>index 4108bcd967848..330d0e698ef96 100644
>--- a/mm/Kconfig
>+++ b/mm/Kconfig
>@@ -439,9 +439,8 @@ config SPARSEMEM_VMEMMAP_ENABLE
> 	bool
> 
> config SPARSEMEM_VMEMMAP
>-	bool "Sparse Memory virtual memmap"
>+	def_bool y
> 	depends on SPARSEMEM && SPARSEMEM_VMEMMAP_ENABLE
>-	default y
> 	help
> 	  SPARSEMEM_VMEMMAP uses a virtually mapped memmap to optimise
> 	  pfn_to_page and page_to_pfn operations.  This is the most
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
