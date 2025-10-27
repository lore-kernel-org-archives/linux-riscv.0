Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F052CCF9E0
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XsVJ39+qtBpT0M14wNQwHclwomW4NtP6glW3lFivHP8=; b=4QQ5vVJoG1qt6Zff9iRZWPQ369
	HdvazrqV49uS05CgW8maUj6xdxIZzStKXZQEvsUBd7rPW2yiLS6G6iAmWa/QYGWKNMmeoQ5YqGJD3
	rrJKAV5VVcxncZQjSQZAEhdcntPBoKOWbCFnJJkvXKPNs8tK/eFmd3LkkK9+Qm5dlhmF+26pLS9br
	yFip678f1H7yb6XPK8XRBCITNYADay4tc1VLFXOnli/nyIU+xrU8PIvTv7dVwLq0HqfQFCUZazc5u
	vori8lZv4X0Lek7WAwj43RM+8K1NDsIwjo0rE+PlSyFOMBPfwcaxAXzYyFyq6PXRk+4CyshBU6EPx
	nKLmULEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQHN-0000000ELYc-3D22;
	Mon, 27 Oct 2025 16:41:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQHM-0000000ELXx-1F0V
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 16:41:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 73AF960539;
	Mon, 27 Oct 2025 16:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC23C4CEFD;
	Mon, 27 Oct 2025 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583267;
	bh=YvO3EjSKrMULU4MU7n6apNKpcUJ205zLnvXrEAqn5rI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jyIJ2kiAogOLX8i/NYhD7/KSkrZa/7Dl/4JnqQCG0wbkW8JkOpJ0399YbBT+e5bgh
	 sxKqSnX0EklHI/SURIyAu3FPx8xvl4T105n94+bglWtBaudmMGFyk5QEiFOtaSF8L2
	 zcO3TRHXiPQ+XoP2PKyI4Zt9hJqaDUfKNoEfpawoV/Dzd6Wx0saA5OWNPQiJIO9elU
	 VoQZGb9THsu9D/uVQ35QVhoqk1dwlOTpmsLmhrMaU5TM3Ij3K2pBEgMPVzQegh+kpf
	 x56bRGBxJozYgYTakX2KZwaK+NvFxxxbR6RlvAwhYVkD/bSneEHRXX84pxeYakQR4S
	 6v8GAudwoNIUQ==
Date: Mon, 27 Oct 2025 10:41:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
In-Reply-To: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
Message-ID: <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
References: <20251020053523.731353-1-uwu@icenowy.me> <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-798525650-1761583098=:20800"
Content-ID: <d1ca5497-3239-01f3-606c-51cfffc22eec@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>, Simona Vetter <simona@ffwll.ch>, Yao Zi <ziyao@disroot.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, dri-devel@lists.freedesktop.org, Han Gao <rabenda.cn@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Huang Rui <ray.huang@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>, Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Inochi Amaoto <inochiama@gmail.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-798525650-1761583098=:20800
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <e4c53a36-2fe4-7c79-5307-a54b036b1dd4@kernel.org>

On Mon, 27 Oct 2025, Christian König wrote:

> On 10/20/25 07:35, Icenowy Zheng wrote:
> > The RISC-V Svpbmt privileged extension provides support for overriding
> > page memory coherency attributes, and, along with vendor extensions like
> > Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
> > 
> > Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> > and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> > access attributes.

[ ... ]

> > diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
> > index b3fffe7b5062a..aa137ead5cc59 100644
> > --- a/drivers/gpu/drm/ttm/ttm_module.c
> > +++ b/drivers/gpu/drm/ttm/ttm_module.c
> > @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
> >  #endif /* CONFIG_UML */
> >  #endif /* __i386__ || __x86_64__ */
> >  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> > -	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
> > +	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
> > +	defined(__riscv)
> 
> Looks reasonable, but does that work on all RISC-V variants?

From an RISC-V architectural perspective, yes.

Of course there might be a hardware bug in some given manufacturer's 
implementation, but then again, that could happen on the other 
architectures as well.  


- Paul
--8323329-798525650-1761583098=:20800
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-798525650-1761583098=:20800--

