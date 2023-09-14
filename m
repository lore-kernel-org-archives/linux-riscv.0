Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BB4EEAA53
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPSGooYqLkCKvx+C8tMfSmrnsIAkRbiqC3Tgz6wYkMM=; b=SZ+CGXA/CCECLy
	k4oLIHKrPNW7t2nt+yVAzP+3BpWg17h5ricKcvx4ClPYjLiW68dpLmRjkwf52APltTsYhygYlFrtl
	uz4vel1UgZUG1hVbUP93LAGBpzBQ7nWyT75D66GLr1REXab3kk/bR3fWeoKsBzJq4ZUq0cPYY0RtB
	nUUQSl23zw63legNvtQRkGtTg3VOIMjIJrqKlr7J6uh6O3+HQxFHhVmffe4df9fUOeat/h7ENO0mM
	klurCKmNXSPG7fOacnKbJchV8kNWDPxGSKpNkJYUKPCu3kHdkr+ZylQaDrzkqskc7XtaoeIf/yEtz
	W90nl4mSVxy/Dhoz4nRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoz2-008tH0-1i;
	Thu, 14 Sep 2023 16:14:24 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgoyz-008tFz-1o
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 16:14:23 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2747b49cac4so523734a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 09:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694708060; x=1695312860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nE0aoCznO4lO1M+q3CiqWDdRUIUR9dxzkIRDNw4yOmY=;
        b=v/deccuB909daqP50jU2x3n2sUCFTBpG3eLubNuJp0rGoRh1wBcH4X7BSXx2OVdd8g
         VFmk0f8yQ8GPATY97DGqCLUmfzVLjlP28Z9foMcX2DkgzwCPwoIF6hCy5XRkaJ3SCsEJ
         RNRl/BA/ABJ/L0iGfiulWQT3bA7WMahtu2b35Y9OIsDJgyTJXKX1w3WgLFFKC2UK0kIP
         kezSNF5fWvhXukfwS0jo0T6a+I2m/X89cvjuxfAnVPxTtYAm4tHTxfkFqJbmCwnWPEuR
         T71V7MfSR/g014DTd+0p8+ukKs+aOw76dvABU+LohtIkd4AS2ZPbELXb+oQADesNlksg
         iK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694708060; x=1695312860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nE0aoCznO4lO1M+q3CiqWDdRUIUR9dxzkIRDNw4yOmY=;
        b=GAIFMvcrYWNGFGuhDwisFkpkOVM+vIAc1MUk3f4DUCDrOihlvEidz6ia5XHU+4tvHQ
         1zjJADjsrBcEoVbhxATnZXKSk+Fu4/qQXcN9wUIEkb6spOzPuiWWUyW9r00KZfJVht4n
         b5uGFqUjBkZWKYjT7velZcW5wWZ6TfnnfaiG23OyU5PAI3u+DYnFMJ8kutaivHoWLMT7
         kKv93pJjVJR1WbOUcUbB97XmCFV7GJzAEBfPSYaamxOxiohcBtf8dkcE1o6zzvlJ7FTW
         SGLpvacCBXgpqYfm76RsyRXo1Y0O0aSoDvyjnPC2l2nYMj9mCUk87lzrSw+oUDdIcEtP
         NSQg==
X-Gm-Message-State: AOJu0YwTfnk8xbU5EUtoGl2hN2O4Z/fyVEd7dRy0QcV1z6Xpk9pgN2aw
	PwJ6HPSFRfKKrKylAfrwUhIzWg==
X-Google-Smtp-Source: AGHT+IGyECtUBVI/6INcM8krANysLZY5xSVet68OyZ4X0m4nqHcUmrkpbyiqT0B82hdqoIIv7vyLbg==
X-Received: by 2002:a17:90b:4b84:b0:26b:2538:d717 with SMTP id lr4-20020a17090b4b8400b0026b2538d717mr5811694pjb.25.1694708060108;
        Thu, 14 Sep 2023 09:14:20 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id j5-20020a17090aeb0500b0026b4ca7f62csm1504449pjz.39.2023.09.14.09.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 09:14:19 -0700 (PDT)
Date: Thu, 14 Sep 2023 12:14:16 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <ZQMxWPczYeDMCokP@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
 <20230914-pennant-obligate-db3adf056281@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-pennant-obligate-db3adf056281@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_091421_802347_883E8F93 
X-CRM114-Status: GOOD (  21.31  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 14, 2023 at 01:46:29PM +0100, Conor Dooley wrote:
> On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> > This patch is not ready for merge as vector support in the kernel is
> > limited. However, the code has been tested in QEMU so the algorithms
> > do work. This code requires the kernel to be compiled with C vector
> > support, but that is not yet possible. It is written in assembly
> > rather than using the GCC vector instrinsics because they did not
> > provide optimal code.
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > index 47d98c51bab2..eb4596fc7f5b 100644
> > --- a/arch/riscv/lib/csum.c
> > +++ b/arch/riscv/lib/csum.c
> > @@ -12,6 +12,10 @@
> >  
> >  #include <net/checksum.h>
> >  
> > +#ifdef CONFIG_RISCV_ISA_V
> > +#include <riscv_vector.h>
> 
> What actually includes this header, I don't see it in either Andy's
> in-kernel vector series or Bjorn's blake2 one.
> Can you link to the pre-requisites in your cover letter please.
> 
> Thanks,
> Conor.

It is defined here:
https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc.
The header is for the vector intrinsics that are supported by llvm and
gcc.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
