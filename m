Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84562CCD185
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kw660cLe8Ua6zGazyhSCAdqVsy4PGiVPCQaANGecy2c=; b=gVlHdVGDkgL9LV
	K1qVFmWhC1XnOxMK2ymGM2HJtTKKjLp/aI1YwPqkQP5b24E12aen6MOk+3mZkQe16pehF+QnVxXiu
	GxQ1hXrZZA1Bgf+9U6CLNjty1ZuMXuQjzJn9UfVEPsLpC2mpc+WgyxVmHDCiCB/7HL3DGd+OcYPGB
	n15bAChqpbyYF+RDoKMfvVytwp3Do0C1YzZTY7Uj6LT4O1NUJAlCEaCDG4dN+OC0S/cn1g/hHGEw+
	erahUCVkypxEHSSMGUqmWMQur0HVzW89b5cardCPnnwRW5JwGSMsyvu4HV0Bm3ttHwkbJ4un5QvNb
	/C/2SLK6VduNOY2uBlFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qjr-00000006ERO-1bHy;
	Thu, 09 Oct 2025 13:31:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6qjp-00000006EQW-1dHj
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 13:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8545B40451;
	Thu,  9 Oct 2025 13:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2BFC4CEF8;
	Thu,  9 Oct 2025 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760016680;
	bh=0IFvkQnMAy8Uc538u+cckdX0F9rDkpNjw/fh01Zt8cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dk5IbfxvMT7GhrRDbmHiSxM69xDcMSZxr5UkSf42vP3DoEHjiBN/eKM9RXAY1+ecg
	 FaV8VlAeUUiWUkhAcG7zMcIN3Vf/PGNALp/UapmU/jZgkcYMKod4dWaqoO9OneAVnL
	 X+NZdIvMFf/RjrN5k/+f4SikQ11rbcAx9ySt6Aio=
Date: Thu, 9 Oct 2025 15:31:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Meng Zhuo <mengzhuo@iscas.ac.cn>, Yangyu Chen <cyy@cyyself.name>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 6.6.y 0/2] riscv: mm: Backport of mmap hint address fixes
Message-ID: <2025100931-carefully-exerciser-5d26@gregkh>
References: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
 <2025100812-raven-goes-4fd8@gregkh>
 <187fe5a3-99b9-49b6-be49-3d4f6f1fb16b@iscas.ac.cn>
 <2025100920-riverbank-congress-c7ee@gregkh>
 <87d603ce-578d-46a7-87b1-54befccc6fad@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87d603ce-578d-46a7-87b1-54befccc6fad@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_063121_491973_58D982CF 
X-CRM114-Status: GOOD (  23.56  )
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

On Thu, Oct 09, 2025 at 01:50:11PM +0800, Vivian Wang wrote:
> 
> On 10/9/25 13:00, Greg KH wrote:
> > On Thu, Oct 09, 2025 at 12:19:46PM +0800, Vivian Wang wrote:
> >> [...]
> > Ok, that makes a bit more sense, but again, why is this just showing up
> > now?  What changed to cause this to be noticed at and needed to be fixed
> > at this moment in time and not before?
> 
> As of why this came quite late in the lifetime of the 6.6.y branch, I
> believe it's a combination of two factors.
> 
> Firstly, actual Sv48-capable RISC-V hardware came fairly late. Milk-V
> Megrez (with Eswin EIC7700X), on which the Go TSAN thing ran, was
> shipped only early this year. The DC ROMA II laptop (EIC7702X) and
> Framework mainboard with the same SoC has not even shipped yet, or maybe
> only shipped to developers - I'm not so certain. Most other RISC-V
> machines only have Sv39.
> 
> Secondly, there is interest among some Chinese software vendors to ship
> Linux distros based on a 6.6.y LTS kernel. The "RISC-V Common Kernel"
> (RVCK) project [1], with support from openEuler and various HW vendors,
> maintains backports on top of a 6.6.y kernel. "RockOS" [2] is a distro
> maintained by PLCT Lab, ISCAS, for EIC770{0,2}X-based boards, and it has
> a 6.6.y kernel branch. Both have cherry-picked the mmap patches for now.
> 
> We operate with the understanding that the official stable kernel will
> not be accepting new major features and drivers, but fixes do belong in
> stable, and at least from the perspective of PLCT Lab we generally try
> to send patches instead of hoarding them. Hence, the earlier backport
> request and this backport series.
> 
> I hope this explanation is acceptable.

Thanks for the detailed explaination.  I've queued these up now.

But wow, shipping new products on a 2 year old kernel feels very risky
to me, but hey, what do I know?  :)

> PS: This 6.6 kernel thing isn't just a RISC-V thing, by the way. KylinOS
> V11 has shipped in August with a 6.6 kernel. Deepin and UOS will be
> shipping with 6.6, with UOS "25" shipping maybe late this year or early
> 2026.

That too is crazy.  They should know better.

Just to give a bit of context for this, for the latest 6.6.y release,
6.6.110, there are currently over 300 documented unfixed CVE items in
that branch.  Feels rough to be doing a new release based on that...

good luck!

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
