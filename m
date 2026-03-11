Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F839103E2F1
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 23:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVtGXUDEOUXXIx0tngGwIbfwzfLAryucGLJA3/TEl/c=; b=XwR31wQ91adCQh
	nijjzLaT1JQBykUURJAbvAfzaLkYR7uM1tvZJALUouDrA/qHWjLsADrIb1zFtmVNOM6wSBLEGsBus
	n1ZtcjCC6JZDDE6g2am5NQUZsd59VVYtZNQs5tbEl5orH7lE4SzZVT0RV14NM97jQlEiTKGbzHd8g
	0seK0p0l2CvOQVRtL1NR/RjG50YtwxCH+xh74ODRmh9PIwA6P6mD9lUJ8e53viqsK3l/X1RablvT9
	wX/EgrAMR0+wa2nRxL3IVQfSmDCXlnyuWktnm5vepmWYnEKCYm4TveurSigd11utxnFcaEXXpUs+C
	mZeOiJGBU0cJp6UmYC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SoC-0000000CnE5-0g6b;
	Wed, 11 Mar 2026 23:17:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0So7-0000000CnBa-22jM
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 23:17:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439baf33150so361579f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271057; x=1773875857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YAX8de4YmYeIq/8WNtylATFHnJksgOAf2WopH1Q00E=;
        b=UM4ruXQtBRut7H9WNrY8W1WSzwDCRfePqepy7PMgU99t3GQhtKlTvwpWSJvmA4gNn2
         lzn/LfoAN62w/mbaBu3jfj2iNmlt2IcNnKaYDSCDzy6UoMz5N6kZk6iAgBIDJFiUwfe5
         Xi8W0yedS3d9UvdI7jUy/4hlsAuRchHg4PT47Itn9l6Zj4GfIXLngafzkxPV/OtUjnmN
         3KtitWqusSECdWNLlMCZb+hag2UOQjVnTtVGZ/ZwsVuCd01fG+FhvR3BBI5TxOAFN86f
         yUrmwXZRWI9xcgzK7ZonW1QtsIYRgQUy+7ex1NOJwE0z6Me5yMmPtG1EdsC25y7ydNQV
         BUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271057; x=1773875857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YAX8de4YmYeIq/8WNtylATFHnJksgOAf2WopH1Q00E=;
        b=azTm5ZDzSqW0rNKLbZO386rf1ilW3Vm/wuLEfb8smqVjut8NfFUn/+2HyYadkVYMYG
         T3cRI3+VCFHvYEJhWC6Hq/6BIfrQYE/6bHqzEZ7qTtkK9/J64VqQ6/gqx1RTzSjPZjmm
         UWhx4Y+2DhYy7PvYKt+1wLUOmKH8KFyZDRSX1C+CD4cPW5kns3KLyn6f1WwsEDiz3Y18
         ElLjFGMaI+qTDORpdvNc+BEjRHeqUWXPq9Wvj+6890rYB4DpELNz6tK7+1p5ND9VOIoC
         F2N7oSoD9tn0fBXJTqRWjkASTlVzdn24JbGizyF02cujRIV4USLKMSJI0NPt+zZJKTAD
         PGMA==
X-Forwarded-Encrypted: i=1; AJvYcCUBMwfe9VZT4cBdc8CQpm6CI0l/QfrpPlaopRgO7nh3I/3YzNnpMNSKbdf7jFwRH95W7etI1zZVq/gaMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtQz4EBbH0cpH0b6exIGUJAznQK3vUakHavOEmryUIysNUBzlm
	auhJ4lMKzStnEIn0iULs29Ha7wU4peNjOWYOFGltxJKonzwD006JQbtG
X-Gm-Gg: ATEYQzwuCscbTrrYVyMzyYYrJuO2u8RvLtrFFGM4Zkf8C2PzgQSf5P1YuxeNq/YCbCv
	yJKOuvcEpP9oNuSOIEgIITAjkdXAWWD0D9a+Babm1kJSs9zhdRz/Xq9WpNd+ZwRi6Qa1gP455XU
	HvJUNV6Et/lP8wf8mFR1pMeOpJEpsua9n0ZQBKTfEXrgVGeJhMOBO1VetbCo72bDLOgCtgx4eaA
	VvQZ4IhwanFXVN1bzKyMjZblrPEQ6XGszPyAZ4PPnSUqfAHoPVGhXmrY5RgvvzvUnQVDwpun6Wy
	V/dZHP/9gu8p85gvzDt7MyDHSxb6Kt1ilcDAPSEHJ8viSQifp6+v7POIYf19fSCEcbN1UyW7tnw
	HX4c399v+g/74z+lPytSib8SiaX4xXQY2+GfiW3SGzgeblrWfsQOnyCbURbgxxp5114lB/64ZuM
	/lcd3nEr8cPylGd270sZbzXOU/xda/8beRcCiRJ4l6/ON1hwdy7u8wPNfExA==
X-Received: by 2002:a05:6000:1a8e:b0:439:bde0:62ea with SMTP id ffacd0b85a97d-439fe1ae91fmr2554188f8f.29.1773271056823;
        Wed, 11 Mar 2026 16:17:36 -0700 (PDT)
Received: from osama ([156.223.222.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm2773963f8f.29.2026.03.11.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:17:36 -0700 (PDT)
Date: Thu, 12 Mar 2026 00:17:31 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Message-ID: <abH4C8RaycAqxySF@osama>
References: <20260307234355.69831-1-osama.abdelkader@gmail.com>
 <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161739_543423_51704E6F 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Mar 09, 2026 at 04:12:43PM -0500, Andrew Jones wrote:
> On Sun, Mar 08, 2026 at 12:43:54AM +0100, Osama Abdelkader wrote:
> > When saddr_high != 0 on RV32, the goto out was unconditional, causing
> > valid 64-bit addresses to be rejected. Only goto out when the address
> > is invalid (64-bit host with saddr_high != 0).
> > 
> > Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  arch/riscv/kvm/vcpu_pmu.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index 4d8d5e9aa53d..045099ca904b 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
> >  	if (saddr_high != 0) {
> >  		if (IS_ENABLED(CONFIG_32BIT))
> >  			saddr |= ((gpa_t)saddr_high << 32);
> > -		else
> > +		else {
> >  			sbiret = SBI_ERR_INVALID_ADDRESS;
> > -		goto out;
> > +			goto out;
> > +		}
> 
> nit: Could add the {} to the if-arm too in order to keep things balanced.
> Otherwise,
> 
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> Thanks,
> drew
>

Hi Andrew,
I'm going to do that in v2, thanks.
Thanks,
Osama 

> >  	}
> >  
> >  	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> > -- 
> > 2.43.0
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
