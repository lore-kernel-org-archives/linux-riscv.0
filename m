Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F268606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 01:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lZ1ZEivm;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O94iJB+Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wJAoXCTQPXlA/Nwzgr1aEkIyX5TYsf0nNc4V3cYRXkk=; b=lZ1ZEivmIAzP67rvZ6AmvxB/Nf
	xrYsYlHDG/i1cxImhIDH1TGpxlhLOq+Hr60MyFIqbE3N/onXi9tETl74XmJXkbq5eG9VKGPBAz5+M
	RwlF5luZ6033fuiqPASZB3cusGvUysAXa8mmJC92123bojs3VRSIUAlbK+MPSPGAFaWkViGZA1wwX
	MU7chYM82gPROCjLhaTzBRDRzGLH6FzAyno5jieV09kM2FRF+bwXSt4ngDOpEnlKRbZMn76AryjbL
	uUuUEIxPkRTqmiv3ymNVlIv7L9HgRgTf3X8AhpNAaF5CAutlXdSF0yjJoggCGeNLYayfMNuo6xxvh
	XqhW3dXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbS4-0000000Abyf-3IUq;
	Fri, 30 Oct 2026 01:30:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMbS3-0000000AbyK-2moL
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 01:30:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF9E8600E4;
	Fri, 30 Oct 2026 01:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5516A1F000C1;
	Fri, 30 Oct 2026 01:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793323838;
	bh=dBCEqqxI4kXRq7hq6laYX28N16KjQNrZtbSgz18BAGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O94iJB+YoKbhhtxm9KCBIxBL+thJDfsp+gbl7oJb6RrkzErsTfa31R7Xbfx4WwzFM
	 a0wa0CEW6BHBxYWazHGiuK0jvIx3ilWC4D5Biq/pSa7+SeSsGvfadFJvD4FLY+djin
	 2lJ7BpHjz2J/bojxlGjTt4CnfsqRBUHm5KZkWPQiUL2Te5UOO6H/lSFZc+n3crcyix
	 TP+sLcBA82bMdmZ+qOt0/Xxn3WXKhvLB7MOjZkO1d6CGviOCCobjqwlamYyvMObfCe
	 VSP+xp/aZACgO6LxdtWMxooLP/L53FgC5kAjgyTvJFQxMyXBB0pK3uDdXaetjBl3SK
	 xdgpDMlybyakA==
Date: Thu, 29 Oct 2026 18:30:37 -0700
From: Drew Fustini <fustini@kernel.org>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] riscv: dts: thead: th1520-lichee-pi-4a: Cleanup with
 dt-check-style
Message-ID: <auPzPf6s4KDZlBYC@thelio>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
 <20261002-fix-dts-th1520-v1-4-9a8810091d47@axis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002-fix-dts-th1520-v1-4-9a8810091d47@axis.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 03:43:36PM +0200, Kanak Shilledar wrote:
> Fix warnings thrown by krzk's recent updates to the dt-check-style
> tool when run with strict mode. Fix the following warnings:
> 
> 	thead/th1520-lichee-pi-4a.dts:161: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
> 	thead/th1520-lichee-pi-4a.dts:163: [required-blank-lines] "status" must be preceded by a blank line
> 	thead/th1520-lichee-pi-4a.dts:217: [child-name-order] child node 'rx-pins' out of name order
> 
> After this patch, there are no more warnings thrown. Fix these
> warnings to make the file more readable and maintainable along with
> that to make it more compliant with the devicetree specifications.
> 
> Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 90 ++++++++++++-----------
>  1 file changed, 47 insertions(+), 43 deletions(-)

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
