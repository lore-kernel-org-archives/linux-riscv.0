Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2862DD3514A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9nyd0ISB78/5Gu0ykp44Doj/tpo9z7l+34BjHsbdHM=; b=KvTqIwEidfXIzm
	3Q+6J11sE1lDSgeNEnD3bj8JprDTQdcTvlCd8dJPC9rCBQssJMYfQd35+EBlsbLIG68y0wPq4eHyE
	xUQg29LwRstuqWbo9mjPzHsPeiG1KtMIp1iJewlWRWiRMyfG2D7yxTEniHfrGJ+iE7gpmrZzH2zop
	R8EVH/HhOIlFylZPrrEgUAUrnTcLxteckZeWMKE+OcxlKbjcrxiGkrT9fss61P1odD9patY2nxV4g
	QWKkCFL4M0H3drXX5q+XBUA+D5aKxRce7NctnudLgr3HR/xXhjnqoUaa2/LLYq7FNV8o4pJe4tJlt
	CDio/9QAu0CQ0Wnp1Tow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qJB-0000000EFWO-2Nk2;
	Wed, 01 Apr 2026 07:48:13 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7qJ8-0000000EFVe-3ksw
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 07:48:12 +0000
Received: from 8bytes.org (p4ffe051a.dip0.t-ipconnect.de [79.254.5.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D17CB1A738A;
	Wed,  1 Apr 2026 09:48:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1775029687;
	bh=9wQuwZMaLezRKGrY+1Y3P15ok2J70F8ST08Fqnvz+gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nTaV4YrfzDuTHF0qFf5QhQnZBAc0/lS07zyNrhg5edu1jmTcP+sYNEH2oEPjjp8jF
	 Cwh+r8NrtcEmYN1Z5BZ1BKwRAxzqT+bx2nWQfd0S0JQKynRIa/8PvcDXCLVVakIzW2
	 7AM6z2g2slLwXppkmJpIT5isoYPx9zOL7KKgzNO2mK+K8Zs542OZHOWbNmh8+sFotR
	 mZjyN4JZqWl1IDXDRnP8iTrRfsahcaQ0HNcoD5ZHaixgVYFd036tsBQ91exqZSVwbj
	 4f5Beqo/bOfiZQXnoz31XqUIPwlEauVwLLhVpRDt4ntnkwISEftwo8uAnvlhwk5x3q
	 7XU6HStrqf2uQ==
Date: Wed, 1 Apr 2026 09:48:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>, 
	Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Robin Murphy <robin.murphy@arm.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Yaxing Guo <guoyaxing@bosc.ac.cn>, iommu@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/riscv: Fix signedness bug
Message-ID: <qxks6fv44ji3uphxitxapazddf22a3my7bu35vryo5cz4uloww@pjo74saj3krw>
References: <20260319182644.1082740-1-ethantidmore06@gmail.com>
 <gbresi4jgjmt3cydjftumy7f3afrk2ondap4mx6xfjmrtdnvsq@fpv4htqzdcvz>
 <uhhd56nw64kofhkgkipzhofwhv6vqbh3lrklzyliyysmvxs4fw@nkhiijvf65q5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uhhd56nw64kofhkgkipzhofwhv6vqbh3lrklzyliyysmvxs4fw@nkhiijvf65q5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_004811_153583_2E4B923A 
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

On Sat, Mar 28, 2026 at 11:23:32AM -0500, Andrew Jones wrote:
> On Fri, Mar 27, 2026 at 09:35:05AM +0100, Joerg Roedel wrote:
> > On Thu, Mar 19, 2026 at 01:26:44PM -0500, Ethan Tidmore wrote:
> > >  drivers/iommu/riscv/iommu-platform.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > Applied, thanks.
> 
> There's a v2 of this patch with the fixes tag fixed
> 
> https://lore.kernel.org/all/20260326175738.750060-1-ethantidmore06@gmail.com/

I updated the Fixes tag when applying. So it should be fine, but please double-check.

-Joerg

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
