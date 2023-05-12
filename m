Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF91C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hGvufR615pKr2S65GW9imAPQCajjacfgbCqRzaRP38M=; b=paeTUxxq4TFn1u
	oB5ii2u/0V6LNkBQ2vZM+aQFvAviKgaBzp9tJCZrI2r9YUoRumc6Z1A1NUHMrQBrUJZjmTauV0wjT
	+Dmxvy1DwBx+xrsRmGkTLwoHspV6t6jCP/CtNWJtOjZdOz9mA5C3hTEjl/zuffQ7X7sWXTVxzfdxu
	zSvRm0A/ejmDq3zUidJWK5w7aVxRFy4biFxvLbYlzsqF8UXNpRfkHJsdwX0L2dEQ+7cPw3PJS0KGZ
	UjS5xgxi4YdWB9MSiuth9mrNdGTOUaAo941mqCsmb2CvmZ5vT2aEt89NOYgXlxzIo2pvTKHiIW5f9
	Ba+xzYpkSx7IJ0YWepAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUzg-00CQ2T-2z;
	Fri, 12 May 2023 15:47:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxUze-00CQ1s-1t
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 15:47:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 314DB618B0;
	Fri, 12 May 2023 15:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A997EC433D2;
	Fri, 12 May 2023 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683906460;
	bh=Wy0d3uxrayVh8WVU98eTSh4D1SlUzUScL1EpN1S6WTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MF8gzeRDQ4w0pQGc7hu/dQ17aba5pqapc5AeMc0dugON74rTOWl2kDmGwbd9RBCtS
	 KwaHGS8Md1r+snXTbF8trozWhOschtu+++qm5KndWeAEo9pmNPMUT0tWtjsIRCZvQA
	 zlE5NYeCuxN8YQcASlhIBJaLMKNYHso75qDdiEEsECxdvalv3mZd+5lbSu0wwe97rq
	 uRIP8L+WZ3lD1TvDeDW4206klCdl36/u7MrHfscSGBAbu0xviEUjYJdDZPiEMBX9Qn
	 oOx6QfGyIxj499kuGIAWiwMDb3xu1krt7hg705FhQHzXuCgjHGlsbCqrJQpWOQqRq1
	 bvy3NtK5C30Mw==
Date: Fri, 12 May 2023 23:36:32 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: Re: [PATCH 1/4] riscv: vmlinux-xip.lds.S: remove .alternative section
Message-ID: <ZF5dAG1XZoWA1Om2@xhacker>
References: <20230511141211.2418-1-jszhang@kernel.org>
 <20230511141211.2418-2-jszhang@kernel.org>
 <20230512-lunar-overbook-e34b468dda65@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230512-lunar-overbook-e34b468dda65@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_084742_684598_4C9769AA 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, May 12, 2023 at 02:51:56PM +0100, Conor Dooley wrote:
> On Thu, May 11, 2023 at 10:12:08PM +0800, Jisheng Zhang wrote:
> > ALTERNATIVE mechanism can't work on XIP, and this is also reflected by
> > below Kconfig dependency:
> > 
> > RISCV_ALTERNATIVE
> > 	...
> > 	depends on !XIP_KERNEL
> > 	...
> > 
> > So there's no .alternative section at all for XIP case, remove it.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Just to note, this series doesn't apply on top of -rc1 - what is the
> base that you used?

rc1 + Palmer's fix branch

Thanks
> 
> Cheers,
> Conor.
> 
> > ---
> >  arch/riscv/kernel/vmlinux-xip.lds.S | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
> > index eab9edc3b631..50767647fbc6 100644
> > --- a/arch/riscv/kernel/vmlinux-xip.lds.S
> > +++ b/arch/riscv/kernel/vmlinux-xip.lds.S
> > @@ -98,12 +98,6 @@ SECTIONS
> >  		__soc_builtin_dtb_table_end = .;
> >  	}
> >  
> > -	. = ALIGN(8);
> > -	.alternative : {
> > -		__alt_start = .;
> > -		*(.alternative)
> > -		__alt_end = .;
> > -	}
> >  	__init_end = .;
> >  
> >  	. = ALIGN(16);
> > -- 
> > 2.40.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
