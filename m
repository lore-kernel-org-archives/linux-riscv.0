Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A68C001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 14:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wp5eDgeRGDXZNurMuAdXnygCVRwnwyt9LnCImtGW/4E=; b=W9jWv0SRrKb94x
	1Q0hJDQY/fq3np9Uvbs76pfHKUSVPkHJVOd+rHVidbZAP5EoVsxn7GOdB5LRh8FJrO1P7H5rtDLgi
	J74i/r9GFUGExYan/shiKtZ/nkY8fvixjid+ZHlfg+w0TU78SoUvubBBmDWEYmLwzXwFvglcW6HwB
	Pv/rSFIomIzGGvqD8q1FPAtLpsnJap7aYOj6tyMd6fxABqnI+l1212Uz69hpYwqgHeUTmEUFbpJRa
	9mLw9oPY5KawJFPInChl8tC0r6kRYAmxxzRr9GpPj4bN2xrzefZCos/VhSktwwVx4BO3Ouxvlm61y
	uBNpXyOoGaXZJ0nPMYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ7Xz-00BkWP-2h;
	Sun, 30 Jul 2023 14:37:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ7Xw-00BkVN-0l
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 14:37:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2250D60BA3;
	Sun, 30 Jul 2023 14:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F8F2C433C7;
	Sun, 30 Jul 2023 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690727839;
	bh=o8Gc/P95YN1AULlhWvUaiLcwNxlJDRgI2XG/sKEwRNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TI1dt1FfjHIB0V9hdfVRp9AMihxBSWpNay0ysWMhBiDC54h7dMWfyeQ1qfazV86WN
	 shsVtSHgyG8p1iRnpbQVJzdPZ09ufOgctfLzqZHbmfYAHhBoU601NfMFRJWR9mngTf
	 8YSSmGysWque4KUxitWc5S1cj7zlcF0ysA0SRSjjDPVY1Ew2xMPTK/V+C0TZuKQcfs
	 dlnL3zr6m3+yNAFs+vWuIVUWabEx9k1SjmmQZZXD9OAAIxNJA9wdg270VER3Q+rLqW
	 X2j46UZgALPO9Pm7MEbWEtg0HxxUdN+03/3TJi+h5Klvpi9lZJbb00gUZyZZqKBrct
	 LqmLJKBLTZXCQ==
Date: Sun, 30 Jul 2023 22:25:41 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
Message-ID: <ZMZy5ZA0POhm2tAQ@xhacker>
References: <20230727160356.3874-1-jszhang@kernel.org>
 <20230729-shucking-slang-370c6baa358e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230729-shucking-slang-370c6baa358e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_073724_380267_4FD82524 
X-CRM114-Status: GOOD (  31.05  )
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

On Sat, Jul 29, 2023 at 11:34:38AM +0100, Conor Dooley wrote:
> Hey,
> 
> On Fri, Jul 28, 2023 at 12:03:56AM +0800, Jisheng Zhang wrote:
> > Allow to force all function address 64B aligned as it is possible for
> > other architectures. This may be useful when verify if performance
> > bump is caused by function alignment changes.
> > 
> > Before commit 1bf18da62106 ("lib/Kconfig.debug: add ARCH dependency
> > for FUNCTION_ALIGN option"), riscv supports enabling the
> > DEBUG_FORCE_FUNCTION_ALIGN_64B option, but after that commit, each
> > arch needs to claim the support explicitly. I tried the config file in
> > [1] for both RV64 and RV32, I can't reproduce the build error as [1],
> > there is no reason for not allowing to enforce this function alignment.
> > 
> > Link: https://lore.kernel.org/lkml/202202271612.W32UJAj2-lkp@intel.com/ [1]
> 
> This is a CSKY randconfig, is there any particular reason that running
> that randconfig (over a year later) and on a different architecture
> would trigger whatever the condition was?

Just use the randconfig and then s/CSKY/RISCV to check whether RV32
and RV64 can reproduce the compile error ;)

> 
> The original commit here seems far too penal - why was it not just
> disabled on CSKY??? I tried looking a bit on lore, but didn't see
> anything explaining the subset of supported archs they picked.
> I did see Guo Ren wondering if rv32 would be similarly problematic - but
> since this is something likely to just trip up randconfigs, I think we
> should go for it and if rv32 becomes a problem, restrict this to 64-bit.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks,
> Conor.
> 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  lib/Kconfig.debug | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index fbc89baf7de6..39ffd218e960 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -502,7 +502,7 @@ config SECTION_MISMATCH_WARN_ONLY
> >  
> >  config DEBUG_FORCE_FUNCTION_ALIGN_64B
> >  	bool "Force all function address 64B aligned"
> > -	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || S390)
> > +	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || RISCV || S390)
> >  	select FUNCTION_ALIGNMENT_64B
> >  	help
> >  	  There are cases that a commit from one domain changes the function
> > -- 
> > 2.40.1
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
