Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC24606A330
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 03:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6XO7fOr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ayXUbKYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=htJID6CEMm0LQJt/eTPjRMOL710VauCupikVfVkQ0ZY=; b=X6XO7fOrV80ekuFKdtncEAEAcQ
	3wPEfFHCDrpaTJKxfVHHyTssb/k6i9+9m0hQbrTvOGNkvi0BnnPDZH9W1eVM2MhCIA72t4JJdgCiG
	0Rx3f2kCvP90COtdFk6aERRxR9jY+4u85rFzL/zAifjOamreqdijE6txI4vge+HdzeoFGXF3kw4vg
	LiUjKi0Qm5xaFhfSl2dcHGNuhbYozoS97dVmRhzuDNdeFub+r0fAoDjD9YxrJTvfLGHjW+wLLMIah
	dDWePITZQK2mCP2bMLddc7pmO+xFUJIVr+BZdo3hjY+hcB6XfX9cuDMX8SrI4ghCughnvBO2yFFr5
	/5/wbhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWSa-00000007eUf-2Swc;
	Wed, 18 Nov 2026 03:35:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWSY-00000007eUY-3z7G
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 03:35:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 210F760D29;
	Wed, 18 Nov 2026 03:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CB31F000C4;
	Wed, 18 Nov 2026 03:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972945;
	bh=+7/n42KyXg5q/rOBLOd1rb9kpcERHhPizyXCV+vNOew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ayXUbKYvov/6b7QYSb9hRgYh8PtUWaFSc+844sQcDselrEd5exQDL87/sBG2IwRNO
	 FpqtxofSxtxMKbhWyEAeUL7v66hjSQQa1RG0+GezXIwZveyf54SRHe3ZSidkOL8iZw
	 F0lXTbzwP2vkXGHzc7zQUyfG72BrgH6eakIvKKD8+f0nYZJ2KXL508tTuqaCNG7TRp
	 vmFS8c5gayk9+NHihWEa0Kfdv3GKJR1HrEFmd3EiZm7mYWxNNx3PezcTRsnTRrIgBf
	 bVH6iXBxNj10AW+McH0nttridsiCH54mbhkdQrh5a56Dzstx6eVXjgH/SJ0vLuDkzz
	 FI0WWFxH20quw==
Date: Tue, 17 Nov 2026 20:35:42 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
    linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
    Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] riscv: mm: reserve the DTB before scanning reserved
 memory
In-Reply-To: <20261104104604.3370384-1-m.szyprowski@samsung.com>
Message-ID: <3e5a01c1-1d91-8bc0-0589-0621930c2d18@kernel.org>
References: <CGME20261104104615eucas1p2583cd5bc9ae36bd9ff2d28f87d6e7583@eucas1p2.samsung.com> <20261104104604.3370384-1-m.szyprowski@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 4 Nov 2026, Marek Szyprowski wrote:

> early_init_fdt_scan_reserved_mem() allocates memory from memblock while
> it scans /reserved-memory: the reserved_mem array, and the regions that
> are placed dynamically by size. On RISC-V the DTB was only reserved
> after that scan, so memblock could hand out the memory the DTB occupies
> while the DTB was still being parsed.
> 
> Reserve the DTB before the scan, so that memblock never allocates from
> it.
> 
> Fixes: ef69d2559fe9 ("riscv: Move early dtb mapping into the fixmap region")
> Closes: https://lore.kernel.org/all/b71ac175-fba5-4f61-bbdb-0b98dec9ccee@samsung.com/
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks, queued for v7.4-rc with a stable@ cc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
