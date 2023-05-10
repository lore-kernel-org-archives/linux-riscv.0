Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57884C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiZXNOzY3VwHM/31avcKlLr1OaFJm02DNFDVWmgd/lE=; b=1pDnuOfom28d2U
	ZlkhZmOeWSBKVfoztw2rj683qTruUVu0uVJMTJ3+67UbzoJJwOg8hsuTaUiPHXe60qlOUYWFSCGhk
	eFAiC4qdLbxjrEor9b9B5HAPRDOsqzmnhxKLnI0SRqpT4Yn00RjEkKaNPiCglZd+e2N3LooPiivI0
	8lgwICfscdAXeVJOckaYCFW+rQlkifG4wgfs5yRndzroEmUz+Y+JRE49owKgk0nedcK61rWbRGNT1
	4vR5uMoXPfsXCSWVUKyJe2BbErfh0pEdl8qpFuzhPBmRgIqPEgjWACWqbiJbQRV10nEqRA/zB/HzK
	FKoBxpJR6IQNKcX6ejjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcgJ-005AyA-02;
	Wed, 10 May 2023 05:48:07 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwcgG-005Ax3-0p
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:48:05 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6a5f602a8f7so4643917a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683697682; x=1686289682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aLoXxmvmI+TNDBhJrgne+NmasMw88TAHwNMgEXRV8rI=;
        b=cdGX27W3aTaVuF1lXqNU3dXFL5s/Mxv+Moz1oLv1bQd1dEC9mDTi2x1P2N71gBko7J
         2+zczCTSBLiri2fJqfSyyz5RHx46ktfWmUOXnHuyj5Cn4nTnemxRsBPtCWjjZawCjJGN
         78Z4MCWQKxZMpusPRAJQCksQy1Dfq+cU/sE+LDbzedpxxiDwbqNmgut9N0xguAbrwjC6
         i26od8SWAexY2jtV7kg0NYHScaH2lXuJWt2XqxC61phsOtpGEOKp0RycWSufEb7ci05D
         XrgVIiuCTq2cXFJRCtMevAMjlG69+8PadWF6hGIxq7j2gai3jXAqXDEXXYFo0g1p+Z4b
         ehIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683697682; x=1686289682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLoXxmvmI+TNDBhJrgne+NmasMw88TAHwNMgEXRV8rI=;
        b=Bq2/ceRm5fylMiRAboUmSCcvaMXqBq/CI56jjrGwlRI/18Fbp542gnU1SHABZmfoZo
         P9uMph+WZNPOGlfdaMFZgC+3Nzg3Aq36j2ZkkpelbP/qZgxHhfsKy9V946SrBiStI6+Z
         pp90CWVUp5Oi4y+nRHnbpm7oI8lkVpgpxavbCJ6s0n4GVOv+2iwCdsBTW3JuWP07VgMh
         tlUHcQISwDSv5qKAACA3MCKGp118cc9aPTUSEg/UZf2L8WAnpTybQQmHaJ52eqFCY5H7
         VKczhihUmFjhJvL/08eJ3+dwTA4p2w9U7du9I0g/pQB/5qzsn1szNzbWq3AB0nuc0kCY
         TOIQ==
X-Gm-Message-State: AC+VfDxPOs7Rau7hUL+yAsZFoVGPX6rdjXmlWiWxePSgvzdtwe0UV5uu
	3DpN9PqxrymfrnOFfi/qIa+aCA==
X-Google-Smtp-Source: ACHHUZ4YI0Ows+2qLCE5z9Sy2RLUd1OHJeod9NGdxiAb7Ex5AAbigEasnBSuYpWAru1W0u5cnRfMdw==
X-Received: by 2002:a9d:730d:0:b0:6ab:b20:18a5 with SMTP id e13-20020a9d730d000000b006ab0b2018a5mr2569954otk.26.1683697682642;
        Tue, 09 May 2023 22:48:02 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.76])
        by smtp.gmail.com with ESMTPSA id p25-20020a9d76d9000000b0068bd922a244sm603978otl.20.2023.05.09.22.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:48:02 -0700 (PDT)
Date: Wed, 10 May 2023 11:17:49 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH V5 03/21] crypto: hisilicon/qm: Fix to enable build with
 RISC-V clang
Message-ID: <ZFswBePAtF/ror5G@sunil-laptop>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
 <20230508115237.216337-4-sunilvl@ventanamicro.com>
 <ZFmtSReX9/WR5CkK@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZFmtSReX9/WR5CkK@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_224804_296234_B8C7B17B 
X-CRM114-Status: GOOD (  20.69  )
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

On Tue, May 09, 2023 at 10:17:45AM +0800, Herbert Xu wrote:
> On Mon, May 08, 2023 at 05:22:19PM +0530, Sunil V L wrote:
> > With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
> > allmodconfig build. However, build fails with clang and below
> > error is seen.
> > 
> > drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
> >                        "+Q" (*((char __iomem *)fun_base))
> >                        ^
> > This is expected error with clang due to the way it is designed.
> > 
> > To fix this issue, move arm64 assembly code under #if.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/999
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > [sunilvl@ventanamicro.com: Moved tmp0 and tmp1 into the #if]
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > ---
> >  drivers/crypto/hisilicon/qm.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
> > index ad0c042b5e66..2eaeaac2e246 100644
> > --- a/drivers/crypto/hisilicon/qm.c
> > +++ b/drivers/crypto/hisilicon/qm.c
> > @@ -610,13 +610,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
> >  static void qm_mb_write(struct hisi_qm *qm, const void *src)
> >  {
> >  	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
> > -	unsigned long tmp0 = 0, tmp1 = 0;
> >  
> > -	if (!IS_ENABLED(CONFIG_ARM64)) {
> > -		memcpy_toio(fun_base, src, 16);
> > -		dma_wmb();
> > -		return;
> > -	}
> 
> Please leave this bit as it stands.
> 
> > +#if IS_ENABLED(CONFIG_ARM64)
> > +	unsigned long tmp0 = 0, tmp1 = 0;
> >  
> >  	asm volatile("ldp %0, %1, %3\n"
> >  		     "stp %0, %1, %2\n"
> > @@ -626,6 +622,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
> >  		       "+Q" (*((char __iomem *)fun_base))
> >  		     : "Q" (*((char *)src))
> >  		     : "memory");
> 
> And simply add the ifdef around the assembly.
> 
Sure, Herbert.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
