Return-Path: <SRS0=akOg=YS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FBCCA9EA0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 20:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 268022084C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2019 20:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYmaDciH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hAO/+ldM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 268022084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FbyBpPVhQ0t62p+fv68fmgOc5tnpTnSCJ5h83ao56wM=; b=DYmaDciH3ASxRs
	q2o6xhHFPIORZhXu0YbYzpG+AVSpA7NjwtJSAPrEeLCA4aclXXXLb9/T/CgDcxBASFvCWz05Nnow6
	4gagwhkuaPxn96+ThUq5z10/753YhXJqOP4X9Io5xgb7plT+3qOuCzPwySZvGpiS/TzEpcp2i+2v8
	ehEzB0VYoLbOcQPyVbnU++S28o2smh1cuwD8XmERFdmGPc+s3juhoT5tu73mP8j+kQobM+G/BlKYI
	sX4SADAU0pl9XUqTCxsa6iBb9Gp/r26svlxNQg/lM/PwzWuhCRQ2uDOgGmRm1XpWQGie2vHMOFDg5
	IJ5dv+6/TGR+vw8NGybA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO6SV-0007lF-RQ; Fri, 25 Oct 2019 20:45:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO6SH-0006oG-9v; Fri, 25 Oct 2019 20:45:06 +0000
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDF862084C;
 Fri, 25 Oct 2019 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572036304;
 bh=NJ+WKmfKRhR8+SGv+N61qy5UYgwj40QkXtak7NdAe0E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=hAO/+ldMyc2wFvU1rB2jr0qbCqMxryeZV9hwR22nNQXYS8Yoc7HbfACHC2As3i6Vc
 mkFJYj1DrtmY9EnT1zuXju84hh/PR6Qga5KZ/9gScxEENzgefDYJE/RDM8zXrzUvMC
 M/ey0st6s4jumET4Gmw9cUl3goRr2Rat24VbPRnk=
Date: Fri, 25 Oct 2019 15:45:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH v2 0/2] Enabling MSI for Microblaze
Message-ID: <20191025204502.GA170580@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1571983829.git.michal.simek@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_134505_369218_A8C2E638 
X-CRM114-Status: GOOD (  12.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Wesley Terpstra <wesley@sifive.com>, palmer@sifive.com,
 linux-mips@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>,
 hch@infradead.org, Firoz Khan <firoz.khan@linaro.org>,
 linux-pci@vger.kernel.org, James Hogan <jhogan@kernel.org>, longman@redhat.com,
 linux-snps-arc@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, git@xilinx.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 monstr@monstr.eu, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Oct 25, 2019 at 08:10:36AM +0200, Michal Simek wrote:
> Hi,
> 
> these two patches come from discussion with Christoph, Bjorn, Palmer and
> Waiman. The first patch was suggestion by Christoph here
> https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/
> The second part was discussed
> https://lore.kernel.org/linux-pci/mhng-5d9bcb53-225e-441f-86cc-b335624b3e7c@palmer-si-x1e/
> and
> https://lore.kernel.org/linux-pci/20191017181937.7004-1-palmer@sifive.com/
> 
> Thanks,
> Michal
> 
> Changes in v2:
> - Fix typo in commit message s/expect/except/ - Reported-by: Masahiro
> 
> Michal Simek (1):
>   asm-generic: Make msi.h a mandatory include/asm header
> 
> Palmer Dabbelt (1):
>   pci: Default to PCI_MSI_IRQ_DOMAIN
> 
>  arch/arc/include/asm/Kbuild     | 1 -
>  arch/arm/include/asm/Kbuild     | 1 -
>  arch/arm64/include/asm/Kbuild   | 1 -
>  arch/mips/include/asm/Kbuild    | 1 -
>  arch/powerpc/include/asm/Kbuild | 1 -
>  arch/riscv/include/asm/Kbuild   | 1 -
>  arch/sparc/include/asm/Kbuild   | 1 -
>  drivers/pci/Kconfig             | 2 +-
>  include/asm-generic/Kbuild      | 1 +
>  9 files changed, 2 insertions(+), 8 deletions(-)

I applied these to pci/msi for v5.5, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
