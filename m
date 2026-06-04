Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5396CCD6E6E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=no3DUoJoJJiJhWzq4PDu1R9cu4MtaUpcuFBiZ3Eqsk8=; b=ensxOL4328e79V
	/hEhtdQiCrBkB4UpsMAgrE2COeQ/+zrRAReBAusgoGWkJXGjo0rYt8YXScqQKH3Pjh2tA1imFYdAy
	GzkzSvYjpLnXbwr8UgAEnzvObb2Lx+1sF+PdrgPTNrlwn+ayy9OnP7VRp1rUDSppoMtWMTUCO4Rrz
	NTpjpYMsDkZYkWWLMmXsqqxapwF/i0fxX3VPxWn2oV0GquEYU9q3+8JoKL4zW+KnuGBj6E4H0maW8
	zN9Af5Y+xhdspCsKFsSa62TlOZPOVssynldJNQVGWjbWnw1bi/TOsNIwygw033FPRWDEnacbmR/D4
	mlPfCjMIJ4gznbpgF1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGeK-0000000HPHX-2ccl;
	Thu, 04 Jun 2026 22:34:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVGeJ-0000000HPHQ-1UUR
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 22:34:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE50D42DD7;
	Thu,  4 Jun 2026 22:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CA61F00893;
	Thu,  4 Jun 2026 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780612490;
	bh=JCXTt6z5lOY2aU+SzovpRo0xKYfFek/tfWbXMiJfMpY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ePGtOekiJ6cUK8KCaa1gyw75Vbg+ynihsGTH/E7ay4sa+vxdr4c++WjuNuT6lwvYO
	 Z5ENf3sMNFbkSyuW5iNztvQ6aPGRdwsdFu6aI64WMGYa0AJw0JbCic+xAParmxZzbV
	 BUNTo7qyUMg1GikLM3uJVrsjLrQdt/tdyAo7J/hhSMn6QRoGcUOmYIwlQmw6DB/MIx
	 PR9t3U/DYcMYrIXdT9z61/QKcotJx1R0CxHo/1CEzUgWPkEqCLMxY+ryc/P2zdspra
	 RFJkKw80rutpwAd6CTiVNri8QiDG0k3HVQLR7LKwGpszQ8NLkBQggnr/0MT/Tz6KFM
	 e+DTRECKOc4OA==
Date: Thu, 4 Jun 2026 16:34:49 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
    stable@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 2/2] riscv: mm: Define DIRECT_MAP_PHYSMEM_END
In-Reply-To: <20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn>
Message-ID: <533b4094-e97c-1661-1ad2-4e7aea683f4f@kernel.org>
References: <20260309-riscv-sparsemem-vmemmap-limits-v1-0-f40efe18e3cd@iscas.ac.cn> <20260309-riscv-sparsemem-vmemmap-limits-v1-2-f40efe18e3cd@iscas.ac.cn>
MIME-Version: 1.0
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

On Mon, 9 Mar 2026, Vivian Wang wrote:

> On RISC-V, the actual mappable range of physical address space is
> dependent on the current MMU mode i.e. satp_mode (See
> Documentation/arch/riscv/vm-layout.rst).
> 
> Define the DIRECT_MAP_PHYSMEM_END macro based on the existing virtual
> address space layout macros to expose this information to
> get_free_mem_region(). Otherwise, it returns a region that couldn't be
> mapped, which breaks ZONE_DEVICE.
> 
> Cc: <stable@vger.kernel.org> # v6.13+
> Tested-by: Han Gao <gaohan@iscas.ac.cn> # SG2044
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

Thanks, queued for v7.2.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
