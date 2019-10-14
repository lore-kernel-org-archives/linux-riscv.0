Return-Path: <SRS0=h9xi=YH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FAKE_REPLY_C,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC27C4CECE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2019 23:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E3F21882
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2019 23:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kX9URTRB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mv7GkiSS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5E3F21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=n7HyO1ceOIQ6Bk+CNftWc8+3oLRIVXjAl3Yj4LxBxHc=; b=kX9URTRBYB1/9O
	WTP5lJlKLcGj7A2jmMhr1gSYXmPk5MMDGLgeuKf68+x9YbZcPd7vifFgRF7bo1k5QXC8G3VCnVI2K
	phAVYymxZq70LAA2vgdMZf2fZSwDeZeRTkayreG9FzoPXfG5JS5Hl2J1sPBwVmI2JeBuKVg+X+5Ts
	C0H+g00fD42bNII+Mdoruu3Jl+zkRwExv5DAxFJnxJTX4Hx1fs187ZjKW0Ggzp4PDx/WhO25CLpes
	J0GZiidRvN1bSOHyu61JhVaxbnwxwjTKecl3SKymsz2/YO1BIuTpkzBZSZqednUB04+cjyfDxkZJ1
	/dawqLrEZbG68KLljWeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK9gt-0006pR-Nt; Mon, 14 Oct 2019 23:23:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK9gq-0006oZ-US
 for linux-riscv@lists.infradead.org; Mon, 14 Oct 2019 23:23:50 +0000
Received: from localhost (unknown [69.71.4.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 98A62217F9;
 Mon, 14 Oct 2019 23:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571095428;
 bh=AoS9bumm7eRsNMYlt9JxKKDtGznr35Rexk3AX3JJ7z4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=mv7GkiSSdYCYgHVoYCHdesx8vq8x2FUIhVSFSlbxNMeits476kgsTUQpe3TL/XXim
 kIiNjeXfnMtUH8m8AEQAT/jQYcDjPhsf9M9Gazc0aJU1/2xDtcxvhGvmne/MsC08nB
 phnBI50cCKjQQNUs8VHxCotQkRw2fo/Pe25AMaZ0=
Date: Mon, 14 Oct 2019 18:23:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] PCI/MSI: Enable PCI_MSI_IRQ_DOMAIN support for
 Microblaze
Message-ID: <20191014232345.GA246093@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191008154652.GB7903@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_162349_010401_B3628639 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: Kuldeep Dave <kuldeep.dave@xilinx.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
 linux-pci@vger.kernel.org, monstr@monstr.eu,
 Michal Simek <michal.simek@xilinx.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Firoz Khan <firoz.khan@linaro.org>, git@xilinx.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 08, 2019 at 08:46:52AM -0700, Christoph Hellwig wrote:
> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > index a304f5ea11b9..9d259372fbfd 100644
> > --- a/drivers/pci/Kconfig
> > +++ b/drivers/pci/Kconfig
> > @@ -52,7 +52,7 @@ config PCI_MSI
> >  	   If you don't know what to do here, say Y.
> >  
> >  config PCI_MSI_IRQ_DOMAIN
> > -	def_bool ARC || ARM || ARM64 || X86 || RISCV
> > +	def_bool ARC || ARM || ARM64 || X86 || RISCV || MICROBLAZE
> 
> Can you find out what the actual dependency is so that we can
> automatically enabled this instead of the weird arch list?

Hi Michal, I'll wait for your response on whether it's feasible to do
something smarter than listing every arch here.  Please ping here or
post a v3; since I marked this patch "Changed Requested" in patchwork,
it's fallen off my to-do list.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
