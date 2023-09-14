Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA11EEAA77
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kafkVJayd0Doo7HnVP6kjdkQh29ZDbToIT7cfTD3l9c=; b=I4V7ILPwZuqrOe
	YchlSCSpBSWUCjI6MRHcSNvfylexkfTY+qar2nMNrjjBsUkGj0fSQVheSt1Fm4m6Be8yehL4ZbTA/
	jAmy9H0agH0nZXF9Fiq81zvC1wj2eo9JM/CfvHB6mZBbaa4hND0FeXW5qaMHcBdyVpixVmcWbCGbE
	DLCXGiRY6bzuWOsz/UPJLXA7lj29Q5PIYZdlousYznLD7BfK//PkojZF+dtbx4+SGHizcmOjFQgTu
	oKgU4IHCd1SLrFeBopLA7GtH1MAluglxP/Qf5t2vnFZhmPyklIVX3PpPHVU8MeMV4ebTw8Bliuh9r
	rjjWAhXcq5NkK6lU2v5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtRT-009GxA-06;
	Thu, 14 Sep 2023 21:00:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgtRO-009Gvf-1V
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 21:00:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c3887039d4so12105315ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 13:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694725196; x=1695329996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PqBlNu9ahVy/7YHYFjcq9HUnHU67jAPxajNa21Ov6Gk=;
        b=Sw4jjndxdAw+i8E4mBInQ45l3vreQrW3G4PNik1NYIoKTMc30Ov6IEiiYbQszc3GR2
         cozOnlJCIn9XTONpR4+rt2y00NcU7dmCoDCqvui3qWiiaVXwoO9QQUywbxUUlS2iGm7n
         tyN+oGLm/+45JXrrGWzV/3gb4vMOXHh6CIsstn5GOqTB49n6FjwuVoV33tz9YgzpsVGh
         ThVUjQuYK7xxnwJaVG313qqNM/fl3zCbkDMB9yQ3Dqymhi4Krz8srETaRk0vp6Ufced2
         SclGm6wXIi/Eq3yiChZMc7v86OvKH5R5nU+WSdg1jelIqGIgGwW63Oj3ovkq/HtXTAcZ
         Zp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694725196; x=1695329996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqBlNu9ahVy/7YHYFjcq9HUnHU67jAPxajNa21Ov6Gk=;
        b=XQZMYNDAWcfthYNyPRtbErI/17ALlycNyMR3jmjJaK8qgcm/zzZ8srzmHoLlJhYz9r
         1BihnaklApCHQp/tJXCBV8a5qPECnxH1nTgvcC+le+1Tk1y3/XBoPTJYIdKr2tdVLPDP
         ODAP8FYWdEc5QsC36ExyITWsporLnCwkDWSWCEz4XoGNP4wPN9uNrkVBAlhTDri/fM62
         W0cTUMlSVUEavgiNVpkWVG9NGZYyBYalKJL5+fbi7zw5gEGdQPyE1r+QxLikq0n61Xal
         2dc2VxNm+ZZ3qrm5CFLRfN+VZPn0d5EkAZppJOmg3uGrrt3lI5MQocYOYQ2JzEPKu8X1
         fgZg==
X-Gm-Message-State: AOJu0YyIpiFQ2yKQ8hfG/g1GoOFBezJX6DvyV3caWzwotkufofvY54Fq
	7oiHLFWpNug9Kr+vK2TXwZvAeg==
X-Google-Smtp-Source: AGHT+IGYe5sd6tgZbPC5u/WtsWbDRqJaNh/t/Oh7nsHT60XmM92v2/qjaUebFtJkzRRAm7IlV9WY6w==
X-Received: by 2002:a17:902:8693:b0:1b5:561a:5ca9 with SMTP id g19-20020a170902869300b001b5561a5ca9mr6133440plo.50.1694725195941;
        Thu, 14 Sep 2023 13:59:55 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902748c00b001b246dcffb7sm2003945pll.300.2023.09.14.13.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 13:59:55 -0700 (PDT)
Date: Thu, 14 Sep 2023 16:59:52 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <ZQN0SBwhYwDQHGF+@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
 <20230914-pennant-obligate-db3adf056281@wendy>
 <ZQMxWPczYeDMCokP@ghost>
 <20230914-hardiness-uninjured-6818bfb40b4f@spud>
 <ZQNC7mAYKfuWLUVr@ghost>
 <20230914-scrawny-aviation-03ec222a46b2@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-scrawny-aviation-03ec222a46b2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_135958_744134_D164147C 
X-CRM114-Status: GOOD (  47.13  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 14, 2023 at 06:36:42PM +0100, Conor Dooley wrote:
> On Thu, Sep 14, 2023 at 01:29:18PM -0400, Charlie Jenkins wrote:
> > On Thu, Sep 14, 2023 at 05:29:29PM +0100, Conor Dooley wrote:
> > > On Thu, Sep 14, 2023 at 12:14:16PM -0400, Charlie Jenkins wrote:
> > > > On Thu, Sep 14, 2023 at 01:46:29PM +0100, Conor Dooley wrote:
> > > > > On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> > > > > > This patch is not ready for merge as vector support in the kernel is
> > > > > > limited. However, the code has been tested in QEMU so the algorithms
> > > > > > do work. This code requires the kernel to be compiled with C vector
> > > > > > support, but that is not yet possible. It is written in assembly
> > > > > > rather than using the GCC vector instrinsics because they did not
> > > > > > provide optimal code.
> > > > > > 
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > > ---
> > > > > >  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 92 insertions(+)
> > > > > > 
> > > > > > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > > > > > index 47d98c51bab2..eb4596fc7f5b 100644
> > > > > > --- a/arch/riscv/lib/csum.c
> > > > > > +++ b/arch/riscv/lib/csum.c
> > > > > > @@ -12,6 +12,10 @@
> > > > > >  
> > > > > >  #include <net/checksum.h>
> > > > > >  
> > > > > > +#ifdef CONFIG_RISCV_ISA_V
> > > > > > +#include <riscv_vector.h>
> > > > > 
> > > > > What actually includes this header, I don't see it in either Andy's
> > > > > in-kernel vector series or Bjorn's blake2 one.
> > > > > Can you link to the pre-requisites in your cover letter please.
> > > > > 
> > > > > Thanks,
> > > > > Conor.
> > > > 
> > > > It is defined here:
> > > > https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc.
> > > > The header is for the vector intrinsics that are supported by llvm and
> > > > gcc.
> > > 
> > > Well, whatever you're doing with it does not work, producing 3600 or so
> > > fatal errors during compilation, all saying:
> > > ../arch/riscv/include/asm/checksum.h:14:10: fatal error: riscv_vector.h: No such file or directory
> > > 
> > > Do you have some makefile hack somewhere that's not part of this
> > > patchset? Also, I'm dumb, but can you show me where are the actual
> > > intrinsics are being used in this patch anyway? I just seem some
> > > types & asm.
> > > 
> > > Thanks,
> > > Conor.
> > > 
> > 
> > Intrinsics are needed for the vector types. Vector types are needed to
> > get the inline asm to select vector registers at compile time. I could
> > manually select vector registers to use but that is not ideal. In order
> > to get this to work, vector has to be enabled in the compiler. This
> > patch will not compile right now, but since people are working on vector
> > I was hoping that it would be possible in the future. Palmer recommended
> > that I just put up this patch for now since I had the code, but only the
> > non-vector versions should be candidates for release for now.
> 
> I see. I was pretty unclear to me anyway what the craic was, you should
> probably note that the build failures from here onwards are
> known-broken. If you want that header, I guess you probably need to
> have v set in -march?
> If so, the in-kernel vector patches that have been posted do not do that.
> Oh-so-far from an expert on what is a safe way to do these kinda things
> though, sadly.

It seems like more than just enabling v in the march will need to be
done. Because linux uses -nostdinc the header file won't be included.
After doing some research it also seems like llvm and gcc do not share
inline asm constraints. llvm is missing "vd" to specify a register that
is not a mask register. I think I will drop these vector patches for
now since there seems to be more work than I expected to get this
functional.

- Charlie

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
