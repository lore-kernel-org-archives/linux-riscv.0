Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0306BC4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 06:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVJueUT6016W1sZyG1iCFa0cobpRNjmlSx2f8w7HC28=; b=LxGzyPM1ZnTnz6
	7aim2XZnJNT9FPdl+ratKK/KfpY1fCpWCZZM9Cb3mPmDb008cUsVUrd8UXc2AnTqTmYEWCwxCseoX
	87SNvcXe/9zS6CAtZWh3rBQYIndQ2vdofL1blN0HkiuWzTDZtLwBQg3kLvWM4MNxL7e/BjH/s/tO4
	JdhidI/9kT38E6bI2gF68duF2gI17E5G+rM7aWmaFerSDcWMjo/A5zgcR3x1Af7h5t/gmzPKls/PX
	iXQAFzakXLpmEcUCFCxlJICC4/nruZ9DoDyhZr4r9JL3OLICNYsc6beEI6LTPaF1v/n0+LvdNd9j8
	fr1u59UUJZjQectbfalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIi2-00Dm7h-0r;
	Wed, 13 Dec 2023 06:27:06 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rDIhx-00Dm7C-1m;
	Wed, 13 Dec 2023 06:27:01 +0000
Date: Tue, 12 Dec 2023 22:27:01 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Joel Granados <j.granados@samsung.com>
Cc: Conor Dooley <conor@kernel.org>, m.szyprowski@samsung.com,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	atishp@atishpatra.org, anup@brainfault.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	keescook@chromium.org, linux@weissschuh.net
Subject: Re: [PATCH] drivers: perf: constify the ctl_table argument of the
 riscv user access handler
Message-ID: <ZXlOtWf8ItvQwPT/@bombadil.infradead.org>
References: <20231206-flanking-frill-fffeca740221@spud>
 <mhng-8f7ddf72-8e2f-4dac-a67e-624eb5511a14@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-8f7ddf72-8e2f-4dac-a67e-624eb5511a14@palmer-ri-x1c9a>
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

On Tue, Dec 12, 2023 at 01:04:42PM -0800, Palmer Dabbelt wrote:
> On Wed, 06 Dec 2023 02:55:48 PST (-0800), Conor Dooley wrote:
> > On Wed, Dec 06, 2023 at 09:46:42AM +0100, Marek Szyprowski wrote:
> > > 
> > > Fix riscv build break after commit c8be9e66ca1e ("sysctl: treewide:
> > > constify the ctl_table argument of handlers").
> > > 
> > > Fixes: c8be9e66ca1e ("sysctl: treewide: constify the ctl_table argument of handlers")
> > > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > 
> > This breaks the build when applied to the RISC-V tree. I'm going to mark
> > it "handled elsewhere" in patchwork since it needs to go into whatever
> > tree has the broken commit.
> 
> Ya, thanks.  There's a second copy of the fix over at
> https://lore.kernel.org/all/20231212-garage-pellet-c6a2bd34854c@spud/ .
> 
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> for this one too.  Just trying to merge that fixed hash into 6.7-rc1 is
> giving me a conflict, so I don't really want to pull it in myself.  So I
> think the best bet here is to have whomever took the patch take the fix, but
> LMK if there's some shared tag thing I should grab to take this into the
> RISC-V tree.

Thomas has to fold this in to his patch. I'll drop his patches for now
from linux-next.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
