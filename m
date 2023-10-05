Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783E8E936FF
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Oct 2023 05:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L97q89qUe9O3AMCRKZ8wPnwd8zlfgCKKZoRq0kYeSr4=; b=nZufqCEVk/h+M9
	DwgmzoSDjjaUMAhLOxnDugCKGucQC/VQk/eqQH6IPu39Dc8+DrHI82SOGv5TXcOgHXIy9DhfCbPqG
	HCISrjvyAqLWp8hmg3tQz9cRmurP7E/y3QMaUPgeKeYa2tYig6ff10SFqHH/3q2bY6Z2662KM3TDr
	ND2JCoFwNlm1hTXXSPgIAsFIjCRi9cFVxLBIhXm8iva3M6/wIXQiWD6+90vsYgob7AIm89q5uo6q9
	6V5fI64RgVyYGAYRNSg2o/1blxsjdG70JASh8y4DIyz+5gfsygBUApxkM4jQ8ZQMl9gISoyJu0jKg
	9EcgVNtGYLvnxPVFm6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGth-001Rv7-2k;
	Thu, 05 Oct 2023 05:27:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoGtd-001Rsj-1y;
	Thu, 05 Oct 2023 05:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF087617EE;
	Thu,  5 Oct 2023 05:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2146C43391;
	Thu,  5 Oct 2023 05:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696483656;
	bh=hXymtCmkQgS1mz4WN4LARQgIXsgfg8oCoZqTgfgSt/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbpCpY2Q0zEwY41GucwBsBZTdMge6AGCY7bXU/clMyyCXKJTV0EDLKXZQhP6Gmvyb
	 i7tzzZViGYUX1/BLXHrp9MgUNcssHkKZ+E07sMIo2XQd9Xhgj8wBFQLGyOjD2kEs17
	 PxOhx0u+oKdQ8lrzOhlumXDQrrVIpZHitXF+j0a79GixClpVIz2eZl61qc1UDcG73I
	 FDMmfOiG2H8IzEuKKw/M7PogaSgM8X2WZc5kjl+Dp1+hjjwCugO78vBqHSBJRgrtI8
	 iiiR0aNTydrnms7VNPMV5M6X+tEx0k+2XJsejW9H5dww52kR9ESsW7JTvRKWQR81qv
	 y9fkPnEwbon1w==
Date: Thu, 5 Oct 2023 08:26:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"deller@gmx.de" <deller@gmx.de>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"bjorn@kernel.org" <bjorn@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"hca@linux.ibm.com" <hca@linux.ibm.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"kent.overstreet@linux.dev" <kent.overstreet@linux.dev>,
	"puranjay12@gmail.com" <puranjay12@gmail.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"will@kernel.org" <will@kernel.org>,
	"dinguyen@kernel.org" <dinguyen@kernel.org>,
	"naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"song@kernel.org" <song@kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 03/13] mm/execmem, arch: convert simple overrides of
 module_alloc to execmem
Message-ID: <20231005052622.GD3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-4-rppt@kernel.org>
 <607927885bb8ca12d4cd5787f01207c256cc8798.camel@intel.com>
 <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00277a3acb36d2309156264c7e8484071bc91614.camel@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_222737_784691_0D537A69 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, Oct 04, 2023 at 03:39:26PM +0000, Edgecombe, Rick P wrote:
> On Tue, 2023-10-03 at 17:29 -0700, Rick Edgecombe wrote:
> > It seems a bit weird to copy all of this. Is it trying to be faster
> > or
> > something?
> > 
> > Couldn't it just check r->start in execmem_text/data_alloc() path and
> > switch to EXECMEM_DEFAULT if needed then? The execmem_range_is_data()
> > part that comes later could be added to the logic there too. So this
> > seems like unnecessary complexity to me or I don't see the reason.
> 
> I guess this is a bad idea because if you have the full size array
> sitting around anyway you might as well use it and reduce the
> exec_mem_alloc() logic.

That's was the idea, indeed. :)

> Just looking at it from the x86 side (and
> similar) though, where there is actually only one execmem_range and it
> building this whole array with identical data and it seems weird.

Right, most architectures have only one range, but to support all variants
that we have, execmem has to maintain the whole array.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
