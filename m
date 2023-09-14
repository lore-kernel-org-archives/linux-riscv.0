Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD623EEAA59
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYcLPp72Q33VP8HOWql0sV/VRDTlfhrwnXbKrd2/spw=; b=ezgS74plO3IKxu
	tUst0gLPifc8iuBD5TPv/EyNM7edEEkQgBsxZaBuzb8UXz41PPAcVhP7EFakbKrWQJ320THs4s796
	K7j52M8LCYvMUXg3DSiIrOBA64CoKo4QHFKa3jv/flDtZIny6Tc0RasgQFpCRqfZXhtgm4AP0lMmn
	SQMtDrssFHscKU1R2GPCk0/PxTlNR9xHnhb/Yj2jhrBkvA7EBL91iEho35S8NvuFonvuvZAG7wRHj
	D7e4iODUAI8QVrb6Cr4WLUIV9WUm8BnLrtA0RJu0e6+L6YWh+D8EOVrVUEYoDnCFN/uITPCA6y/Mc
	vzS3RebL08fTb7SjR0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgq9f-008zgp-3B;
	Thu, 14 Sep 2023 17:29:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgq9c-008zg5-1V
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 17:29:26 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68fac346f6aso1083748b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 10:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694712561; x=1695317361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq2pj3vNh3ov1lqVemerrvtZo/V9/5ZCRIvFVvmuS5o=;
        b=S+6gKOQqcqS1YKUv155IGF4yOqRVr1DmFwQRrQl3bzgzsKhHqBvKYXAEWF++fqSshB
         NUFIKKKYxzZnzTr7ldOtyP8dS1LArCqT1eaPI4iPLBm9ozsS2LmXZFSKxpxNBy1+YX1u
         gT1Pnlo9cTSwnsLOMraqFCrbMcrc7hetYy/GBzbaxq6gTwnkelk7KpxW+he/F+k1ormn
         k6DP6hTEysI4/LG9aN/uW6woEwE2bALW6oKHBoAtgVt3gVsc2pP7rx4loNP5COhaffHM
         7xNzGBRdcV/cktZn7mc6Kyik0nFHLpHpDv5Ks7btsbpnJ8OY5t1P+2xq97EHp4L2tyZZ
         8G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694712561; x=1695317361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq2pj3vNh3ov1lqVemerrvtZo/V9/5ZCRIvFVvmuS5o=;
        b=ZOEk1l/i41DnXrn1jtdjwKD7Wu+r+lIWMQYeAejGOgmg/Vd5iajJSrtmDZ8FiZgvon
         DT9ZTAD9zidyHFN35gZHOAm+AdY/PKvDdq0TJo2ADa41Ux1Y6kfpVmBiCrwjGpjlxJpp
         PEDE0OHLGxO10eqcbVFbGM2Rb7VfAFq5f6S+CnLyC1j39/1eS2VBAajJu4KSd6G9iiX2
         fCfhj7fCc3yKEa6kdTswwN0usIWUcjPfiLqMWzQmvitPRDn1UuRhk+IoafRw3fkXXucQ
         W7dJiKUX9Rw5Irs0y3RUNHYuJtZwEzKfxuvU86IiyOEASTj8JuWAzXKrDD/KthSSoKOo
         Z8SQ==
X-Gm-Message-State: AOJu0Yyj4y2ZbQEiZc7lIV1EkDoALUOQVV8DQOUkiOq7+LRmGu4Ta7mh
	SgS6sI5xXxMltWWZdKfAuKcDHw==
X-Google-Smtp-Source: AGHT+IH9labNFQs2EdZody5WEKzNQjUN5CFr8g2eOwpNkImj03tG14zapLjJWh6adLEeSkJxfd2kUQ==
X-Received: by 2002:a05:6a00:248a:b0:68c:dcc:3578 with SMTP id c10-20020a056a00248a00b0068c0dcc3578mr6755649pfv.25.1694712561275;
        Thu, 14 Sep 2023 10:29:21 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id d21-20020aa78695000000b006889511ab14sm1582547pfo.37.2023.09.14.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 10:29:20 -0700 (PDT)
Date: Thu, 14 Sep 2023 13:29:18 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 4/5] riscv: Vector checksum library
Message-ID: <ZQNC7mAYKfuWLUVr@ghost>
References: <20230911-optimize_checksum-v4-0-77cc2ad9e9d7@rivosinc.com>
 <20230911-optimize_checksum-v4-4-77cc2ad9e9d7@rivosinc.com>
 <20230914-pennant-obligate-db3adf056281@wendy>
 <ZQMxWPczYeDMCokP@ghost>
 <20230914-hardiness-uninjured-6818bfb40b4f@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914-hardiness-uninjured-6818bfb40b4f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_102924_754428_417F5606 
X-CRM114-Status: GOOD (  35.15  )
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

On Thu, Sep 14, 2023 at 05:29:29PM +0100, Conor Dooley wrote:
> On Thu, Sep 14, 2023 at 12:14:16PM -0400, Charlie Jenkins wrote:
> > On Thu, Sep 14, 2023 at 01:46:29PM +0100, Conor Dooley wrote:
> > > On Mon, Sep 11, 2023 at 03:57:14PM -0700, Charlie Jenkins wrote:
> > > > This patch is not ready for merge as vector support in the kernel is
> > > > limited. However, the code has been tested in QEMU so the algorithms
> > > > do work. This code requires the kernel to be compiled with C vector
> > > > support, but that is not yet possible. It is written in assembly
> > > > rather than using the GCC vector instrinsics because they did not
> > > > provide optimal code.
> > > > 
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > >  arch/riscv/lib/csum.c | 92 +++++++++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 92 insertions(+)
> > > > 
> > > > diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
> > > > index 47d98c51bab2..eb4596fc7f5b 100644
> > > > --- a/arch/riscv/lib/csum.c
> > > > +++ b/arch/riscv/lib/csum.c
> > > > @@ -12,6 +12,10 @@
> > > >  
> > > >  #include <net/checksum.h>
> > > >  
> > > > +#ifdef CONFIG_RISCV_ISA_V
> > > > +#include <riscv_vector.h>
> > > 
> > > What actually includes this header, I don't see it in either Andy's
> > > in-kernel vector series or Bjorn's blake2 one.
> > > Can you link to the pre-requisites in your cover letter please.
> > > 
> > > Thanks,
> > > Conor.
> > 
> > It is defined here:
> > https://github.com/riscv-non-isa/rvv-intrinsic-doc/blob/main/doc/rvv-intrinsic-spec.adoc.
> > The header is for the vector intrinsics that are supported by llvm and
> > gcc.
> 
> Well, whatever you're doing with it does not work, producing 3600 or so
> fatal errors during compilation, all saying:
> ../arch/riscv/include/asm/checksum.h:14:10: fatal error: riscv_vector.h: No such file or directory
> 
> Do you have some makefile hack somewhere that's not part of this
> patchset? Also, I'm dumb, but can you show me where are the actual
> intrinsics are being used in this patch anyway? I just seem some
> types & asm.
> 
> Thanks,
> Conor.
> 

Intrinsics are needed for the vector types. Vector types are needed to
get the inline asm to select vector registers at compile time. I could
manually select vector registers to use but that is not ideal. In order
to get this to work, vector has to be enabled in the compiler. This
patch will not compile right now, but since people are working on vector
I was hoping that it would be possible in the future. Palmer recommended
that I just put up this patch for now since I had the code, but only the
non-vector versions should be candidates for release for now.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
