Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388BED6AB0B
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 20:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jiFFbrycaULRJt32wj4x7U8GG3X4JMnBPLxjsWFim0=; b=wspe0iXhGrWbwD
	iYhq/gJPmb0+zitA/fRTb3uPXNM7GC2dbYLp5aV0eKz59M6thR9vWYHux+Q9+ZyvJ6P2xRqTUfv3/
	Aj/NBdv32HkW9CddYYvZrz/yDhVDEaWkgAvEsYvIeW19lv/e86xdPCS/roaSnklzc4NgD9p9iH/jn
	WjIyvtlojoKmv+NGqgqEsVIOvJJ7GlbMGr6/L3myGZjfrFVyChTTl4Zzme17dtvVVDOCrxrtJ8+Z1
	c4fKa5GSDuY4CIiaPUFaWQKWTPx0e8DW6wnjttKXi0eJfPNRIP/AzzFU0qg+jEofh53Za/jS1nTvI
	S4AO27bTaoKYYZOeqVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8OlB-00000000l9O-1CFo;
	Thu, 02 Apr 2026 20:35:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Ol8-00000000l91-2tva
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 20:35:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EA0E04097E;
	Thu,  2 Apr 2026 20:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DF2C116C6;
	Thu,  2 Apr 2026 20:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775162120;
	bh=aF0Bco08LkkAEkpaK3jOuUuwB7Ty2o9ujhcoSQQ91Ro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnfV+iXx6qFBtQN0XRZcT7XMYrXpz/LPW0F2B1t6IX6OhgI6LYhafQRQC9/8rDOgM
	 thtKhMZcMgIXti9dL/KIhvM2sRYGdtfIV8hLTa64uu9hK/PyxRmuj0/CouANmQwgEm
	 zQ4E2Tm11Yf+AhPmdbzI8Gv+9NZygdI9pUoBKEnuZ6ZVBJVcs3cTClKgO+fr6AC0AZ
	 paN4voqm9AN6FioiMP+CyeDQ64dycPxkL3hVnLbyQYkEJTTGMGG5uLqZ6yd6o+8vOh
	 SyZ8mUzMjVjqj8DRds/qySML2Wk6y4fCpag8l8hO5CizJr9U6CpmLcldsLzWZCdMyZ
	 Hr/1v3nOr3sCA==
Date: Thu, 2 Apr 2026 13:35:19 -0700
From: Drew Fustini <fustini@kernel.org>
To: Joel Stanley <joel@jms.id.au>, Joerg Roedel <joro@8bytes.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, devicetree@vger.kernel.org,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@oss.tenstorrent.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
Message-ID: <ac7TByN3oQGSUpyq@x1>
References: <20260310003850.3837030-1-npiggin@gmail.com>
 <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_133522_775887_E1D62A1E 
X-CRM114-Status: GOOD (  15.43  )
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

On Wed, Apr 01, 2026 at 11:57:57AM +1030, Joel Stanley wrote:
> On Tue, 10 Mar 2026 at 11:09, Nicholas Piggin <npiggin@gmail.com> wrote:
> >
> > Extend the binding to cover details specific to the Tenstorrent RISC-V
> > IOMMU. In particular, a second register range is added which contains
> > M-privileged registers, e.g., PMAs and PMPs.
> >
> > The RISC-V spec S-privileged registers remain in the first register
> > range and are compatible with "riscv,iommu" so the Linux driver does not
> > notice any difference, but the binding will be used by OpenSBI and
> > potentially other M-mode software.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Drew, will you take this through the the tt soc tree?

I think it would go through Joerg's iommu tree, but I could if Joerg can
an Ack.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
