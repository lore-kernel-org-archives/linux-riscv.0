Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C465CDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ue6tMedSwf2p0Dxnb/9nL5RgCGk4j6AoIEI3rrDG/6M=; b=Ov+nnIoasg+WNG
	G0rMXNJpVFMmA4swHZKgfvUX7VU8QxrANvFKEBlwtXBSlGqPf0EDq9t9iak5vtEx052BEwCgrEmMb
	9luy354/Qag4R6J0C+Dw9bBLminBwsh0fPjzedcufIz4xnKSa19brivuDsI1fqoyRMh35nYSI0Uyl
	ErpbdCOKhITtwd292+J+WOCqUNJn5Di4icrPq8ARXJuy9Bx2KeY2ubrcIoZihIpehto5ITIvqbcaE
	DNX0o83HppBOuYO0SvBeFa8v9gafWJPB5vCTzQIChyZVRXkydi7LvFV+N4qRgrn3OewsFvf9SVioO
	jYdw6f4ZUoKOcknry99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkdg-001WfU-35;
	Fri, 20 Oct 2023 08:13:48 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkdd-001WdM-2H
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:13:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-991c786369cso82142166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697789623; x=1698394423; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=it5LId2C4H1U91VsyvnGjoaX7yK9lqJY40QPQhvwsSU=;
        b=XKjF2eIobYkGPz/5r/qZJkDD+gP73BBMP322e2obEoVDjzY7TLcSUdikaBXPs9GYcp
         A5BIkzrCZf+SCcCBVWVXtMApOm3LvotxjHA3Tp+G68bXuwoLg2GgyMCqvZeKClHyDM9h
         AO0vDeG9vh8/s390qupIRFzX+R9mvRUP6A7/Ueedx3PgGfzMZlbnavIY4oYl+aYbusW4
         MF8rMFzVLT4TP9YKdvBqlmSKT2gZCsyokhHjW0wnIHpK2N6kkWkjpZQ8EUsvCuip8iKL
         ng27oRI4U3dm2nm5X8y88wNi2hmFODFRyUTS2SD6qT+m59d3S/qxtiyndx/tFn/R73hk
         fh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697789623; x=1698394423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it5LId2C4H1U91VsyvnGjoaX7yK9lqJY40QPQhvwsSU=;
        b=jljN8PH6+nUfpjF7yXfY8wsCc2CueEGTj5M77832mhV4tt/TkAZR4FH0mlL9wKST0/
         yaDGekzEB045Yo1VZksHvCX/EjfnfylE+MOaS4dCiVfhDDWhhElmUJALP9Et7NFyXxuF
         At9fJrt//HcrrqrKQc7B8Rq/VUMs0XGKE/Dn6KSp6t5+5E2iUaUc9aT8pZvmEPmoJmPn
         Sr3Ula03+5R/QteWuaQ651eShSXKirIXS3xM97pPvrdZ8GR5VrifXMZ3TIxWX4RLEKCH
         yOvthBCGQ20aQeYAWJj1RRnDeXQbmZuRgnoF7nCl560uy6A4HB2W+uPVtmcMFRESsiAN
         2ntA==
X-Gm-Message-State: AOJu0Yx0YyjNy/OTiilnIwvq1kZqTGVAR1dcEjrSGyKyQwSedJg0lSRw
	X546EA4BM1SMS+t644q60ph/0g==
X-Google-Smtp-Source: AGHT+IEeFrCSkm3FbczMa45J0DrCEhJJ+FVSEOfJ8fULIE2AW4z8E/7QxxfmoXpEZ0bHuooCq861jg==
X-Received: by 2002:a17:906:ef03:b0:9bd:d961:ddea with SMTP id f3-20020a170906ef0300b009bdd961ddeamr818382ejs.45.1697789623226;
        Fri, 20 Oct 2023 01:13:43 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j8-20020a50ed08000000b00533dad8a9c5sm980417eds.38.2023.10.20.01.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 01:13:42 -0700 (PDT)
Date: Fri, 20 Oct 2023 10:13:41 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] RISC-V: KVM: Allow some SBI extensions to be
 disabled by default
Message-ID: <20231020-622a7f510c98e8c82135e6fc@orel>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020072140.900967-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_011345_743786_22602882 
X-CRM114-Status: GOOD (  12.42  )
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

On Fri, Oct 20, 2023 at 12:51:34PM +0530, Anup Patel wrote:
> Currently, all SBI extensions are enabled by default which is
> problematic for SBI extensions (such as DBCN) which are forwarded
> to the KVM user-space because we might have an older KVM user-space
> which is not aware/ready to handle newer SBI extensions. Ideally,
> the SBI extensions forwarded to the KVM user-space must be
> disabled by default.
> 
> To address above, we allow certain SBI extensions to be disabled
> by default so that KVM user-space must explicitly enable such
> SBI extensions to receive forwarded calls from Guest VCPU.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  4 ++
>  arch/riscv/kvm/vcpu.c                 |  6 +++
>  arch/riscv/kvm/vcpu_sbi.c             | 57 +++++++++++++--------------
>  3 files changed, 38 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
