Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FEE606A888
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 03:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cc8ze8Pu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JuDRJHi6+ihpkIHpiPuyJtGBuZrWr9ZfUAwSxmAtetg=; b=cc8ze8PuCdzcOmWCAdQ8JIHKcL
	3Q6tAjLfgHdSZzRr9GaFq6e8YMFjrpgVQXuusgReEJ6VYfgWAag7SZ34njopECk6OYiM6y10ObV1k
	yJQVa+OBbvHe7uUolSKBYwWI1yGkFqfmJABJ43lffGWqWpBdK7mzBauBb4i5ZQ2l57BcFgHRmesZL
	HU28b/jnspPnWNbEjt8FDswwD7gRp6g6y3J7P3vZHPdUv3YoQJt9dRtNq2yqSrb4YMo4ThYpCIZWK
	v8JsEGxzJ/rQgVsbc+C8vv1lOfvSa4NqjMP62kVxI6xMoUQwboHJc2uGztkpKs5eczvWBTAtactSZ
	PRM5ODsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9sG-00000004TQ6-24vX;
	Tue, 17 Nov 2026 03:28:48 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT9sC-00000004TPG-27Hq
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 03:28:47 +0000
Received: from mail.andestech.com (atcpcs53.andestech.com [10.0.1.153])
	by Atcsqr.andestech.com with ESMTPS id 6AH3SFac027414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Nov 2026 11:28:15 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs53.andestech.com
 (10.0.1.153) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 17 Nov
 2026 11:28:15 +0800
Received: from atcsi01.andestech.com (10.0.15.32) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Nov
 2026 11:28:15 +0800
Date: Tue, 17 Nov 2026 11:28:15 +0800
From: Mina Chou <minachou@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jic23@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <geert+renesas@glider.be>,
        <magnus.damm@gmail.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <az70021@gmail.com>
Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO on
 all Andes SoCs
Message-ID: <avvJz262LYxrlaXU@atcsi01.andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
 <20261113071143.1446167-17-minachou@andestech.com>
 <20261113-upon-unmarked-8f4a186bb656@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113-upon-unmarked-8f4a186bb656@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs53.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6AH3SFac027414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_192844_902870_958C422B 
X-CRM114-Status: GOOD (  23.76  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 02:00:46PM +0000, Conor Dooley wrote:
> [EXTERNAL MAIL]

> Date: Fri, 13 Nov 2026 14:00:46 +0000
> From: Conor Dooley <conor@kernel.org>
> To: Mina Hui-Min Chou <minachou@andestech.com>
> Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
>  alex@ghiti.fr, jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
>  conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
>  prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org,
>  devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
>  linux-kernel@vger.kernel.org, randolph@andestech.com,
>  cyyang772@andestech.com, tim609@andestech.com, az70021@gmail.com
> Subject: Re: [PATCH v2 16/19] riscv: errata: andes: allow ERRATA_ANDES_CMO
>  on all Andes SoCs
> 
> On Fri, Nov 13, 2026 at 03:11:40PM +0800, Mina Hui-Min Chou wrote:
> > ERRATA_ANDES_CMO depends on ARCH_R9A07G043, so it can only be enabled
> > for the Renesas RZ/Five, although other Andes SoCs such as those built
> > on the A27L2 need it too. Drop the dependency, and select
> > ANDES_LLCACHE and CACHEMAINT_FOR_DMA so that the errata always comes
> > with its cache driver, which ARCH_R9A07G043 used to guarantee.
> > 
> > As ERRATA_ANDES_CMO is default y, it is now also enabled in the generic
> > riscv defconfig. The errata only acts on Andes cores at boot, so other
> > platforms are not affected.
> > 
> > RZ/Five still gets uncached memory for coherent DMA allocations from the
> > DMA_GLOBAL_POOL that ARCH_R9A07G043 selects. This patch only covers
> > cache maintenance for streaming DMA; how other platforms provide uncached
> > memory stays platform specific.
> > 
> > Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
> > ---
> >  arch/riscv/Kconfig.errata | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> > index 4f77b3c6d7fd..3c43e065aa01 100644
> > --- a/arch/riscv/Kconfig.errata
> > +++ b/arch/riscv/Kconfig.errata
> > @@ -12,7 +12,9 @@ config ERRATA_ANDES
> >  
> >  config ERRATA_ANDES_CMO
> >  	bool "Apply Andes cache management errata"
> > -	depends on ERRATA_ANDES && ARCH_R9A07G043
> > +	depends on ERRATA_ANDES
> > +	select ANDES_LLCACHE
> > +	select CACHEMAINT_FOR_DMA
> 
> If you're selecting it here, can you not drop it from the renesas soc
> Kconfig file?
> 

Thanks for catching that! ARCH_R9A07G043 selects ERRATA_ANDES_CMO,
so the selects there are redundant now. I will drop them in v3, something like:

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
@@ -465,8 +465,6 @@ config ARCH_R9A07G043
...
        select ARCH_RZG2L
-       select ANDES_LLCACHE
-       select CACHEMAINT_FOR_DMA

Thanks,
Mina

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
