Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76E6C05052
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lp63/ORl1eb0IM/Gc8XGz5jhooPAzJ2e+FvAUTSGlqk=; b=cKIsVUwoW3NztL
	Wb5Ncn1awJNG77xI7BV0cAy/zSG8ESZmLb8nMky5AARyPXH4K7hrhsX+VVZ5xQLR9HuBu5FCJrsVn
	EzHrah84bM+NLe3nCT2u/+ybSVCvfJRa9Gx6HfFHpxUp6+4Q8iQYCYeD8z7gEDUzqe0pdIAqLrmZR
	iiRHB6dF7CEMLEXb5YyzjKYQldd6koNr+8Xi47kmYx6UrNNY0nRFPTQWLJPSqWUJfT7wkhTrxw17z
	A5np/nq2+Za7WB9besUKL8KZw+hptn3K6SIJ8f2XVJwy40kMaYWtOWHtwz/TgiOmOsvTnJgroa4Cc
	AcydOBc/zX6MtWlIpWEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWv7D-0081jZ-24;
	Fri, 18 Aug 2023 08:45:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWu1p-007tFE-13
	for linux-riscv@bombadil.infradead.org;
	Fri, 18 Aug 2023 07:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JP1Np/yFy1nrHPIeuFCXQU9sMYli5vZhZe6SDGYaT/o=; b=GhS6Ueg/mtyTMdKoOTMSoyxrAN
	+oaObuVdz61VFhyMShEk5E7R7+wDJZVRB+VWJGmdZ2EaJZs9XKTKi0djjxKOWYuuXg2Fvi5WdxZUP
	/FkfUyWmw7CVxThw92fBFksRX18QYPjBbUJFaYQUwfj6gpPHGaB/bL7fgTNwkMPNz0Vba/0KF8K13
	RpZphAaouvW8XEMTGfnZVOV5QekdxOlqebpsDcTgS6SIx/3LO1O06RTtcTQuCCYrV/xzUfpHc74TG
	eCjbrooAxQJer3l99yOs6nfa5AsdLApbyo4DFX/7bquOXky3x6qle1vZuAuOaZrQmE5O8un9NUbId
	EVSpU5OA==;
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWu1k-00FJrQ-0c
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 07:36:15 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-99bcf2de59cso71598866b.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 00:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692344168; x=1692948968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JP1Np/yFy1nrHPIeuFCXQU9sMYli5vZhZe6SDGYaT/o=;
        b=Stax/pFHA8SD7BalJgHltTtR/zcIdB4o7Yy1iIifK5N6RnsnW5zzGKhLT/jbnVWDiJ
         83ou0tdmsaL05n11UkereMaUZjHf8DjqHLIDR3wpQEedsYtyVcgS++A2dMx0MPfpy4FM
         zaNfqht01yvSdgajUmD5oN9j5RERlwT+p5ZReuEXA55ofRQ1JDcSgvdLRWlbkTOBuxbk
         bTOpFp65Xyk4U2enrEoJiNs0C8Bv6i6aLz50znPQipXBq09/tMoJR9+jiL0Blv0FPG2C
         c3OIpJaqu+agPV9LKT7oA0yNoAoDK0jqZShmkCRV5U++NoEw2bXYGOia3iht2lngrwq7
         cvnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692344168; x=1692948968;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP1Np/yFy1nrHPIeuFCXQU9sMYli5vZhZe6SDGYaT/o=;
        b=I85bmUuTr5kbLiZZ0uZyYLwXYYOYI9HbankT7dCcyLB65wQQ28BUobtsSQ/HlCz21N
         O3iCOj2vINvK/q9tDO12kiQSi03Nu3lbbVrArgXlkZwCnCosZ14QcAnRftDT03l9ry5H
         8FRHGtuLnewfdBX/RPAiUcH/oKvejKYzju7tqEbF975VAxCTUsuBZ5GUcHllptPCjtYe
         U3IsPWajtiX3aHOwwOj40Tfb+Ncor6qJKWsVKEjul3SHzyuQgYJANgbwangvEshN7mo+
         7k2SajGD32aOq/9WO5C8NlXo36oO6oFe0pAViNw8RG9FadH9ZJgK2A5hB5azAA7BexjI
         6sDw==
X-Gm-Message-State: AOJu0YxC7JR+cL6qRGvSsxVkfO8jRgcOL57U1+yTGrbdM6TBOs4Ap7TI
	qC4w0N0J4RySsgnuCwNReKaPNw==
X-Google-Smtp-Source: AGHT+IEy3bMvHrj+O9xWMGxfIZ/JqKbjUS51FhV5LJhI1f70H2XnDWv79sMoNA9OKWp4CqIjCSCtog==
X-Received: by 2002:a17:906:3d22:b0:99e:5d8:a6f2 with SMTP id l2-20020a1709063d2200b0099e05d8a6f2mr956414ejf.32.1692344168436;
        Fri, 18 Aug 2023 00:36:08 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y6-20020a170906070600b0099cadcf13cesm846259ejb.66.2023.08.18.00.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 00:36:07 -0700 (PDT)
Date: Fri, 18 Aug 2023 09:36:07 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: "Xu, Haibo1" <haibo1.xu@intel.com>
Cc: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "anup@brainfault.org" <anup@brainfault.org>, 
	"atishp@atishpatra.org" <atishp@atishpatra.org>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, 
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
Message-ID: <20230818-adff57b7c6360126eb16e888@orel>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
 <20230817162344.17076-5-ajones@ventanamicro.com>
 <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_083612_411630_AA454434 
X-CRM114-Status: GOOD (  15.86  )
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

On Fri, Aug 18, 2023 at 01:29:25AM +0000, Xu, Haibo1 wrote:
> > -----Original Message-----
> > From: Andrew Jones <ajones@ventanamicro.com>
> > Sent: Friday, August 18, 2023 12:24 AM
> > To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> > Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> > <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> > aou@eecs.berkeley.edu
> > Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
> > 
> > With the introduction of the get-reg-list test for riscv, another directory has
> > been added that should be tracked by riscv kvm maintainers.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0f966f05fb0d..8fc9e6e7f207 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
> >  F:	arch/riscv/include/uapi/asm/kvm*
> >  F:	arch/riscv/kvm/
> >  F:	tools/testing/selftests/kvm/*/riscv/
> > +F:	tools/testing/selftests/kvm/riscv/
> > 
> LGTM!

Hi Haibo,

Please reply with a Reviewed-by tag, assuming your LGTM held the same
meaning as an r-b. See [1] to ensure it does.

[1] https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
