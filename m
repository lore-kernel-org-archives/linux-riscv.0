Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F0C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Wj3HhXa846ZZoocaYWBGoJAeecerX4XoB/xpUPDDyI=; b=tVU3xSN0XoDNTq
	MO3AxlIn6lLsUR3Axabyu4BK5WTeu3mamUCQgHAv+OUe4k9K0zYX4qF85d0CRTGzr05dWjGmiC6TT
	dFnLfPwcnrT8gmvrcv9sbMuEyarTuKus6NRTMN9hu+w2WkN21OVUmXdfgnEnQk6fkzFcOeEDFFjmW
	qTPEK/Tn9y/lhAVWe03zKC4Kq4UPhfcGWBABo3DLDfgoFacbrjTSYvWFTRVK8YEANeqYRMxMOp6RP
	b0sFRy5O29y2tRuTzWdo+peHFQG2MeDfeyFxLyoEHqZLuJDo4nncmXd961G1+vwL0cguhZJ5dFqI1
	NiSasRCAHY9kb7tSjRIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0qW-004BWu-00;
	Wed, 05 Apr 2023 10:58:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0qT-004BVg-0A
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 10:58:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id u10so34041271plz.7
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 03:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680692306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gzqvLefolrwy3WdKYUZXiVUA/OQTcVAscLkW8tJWOwA=;
        b=jO0Y2EOFEKMw2F8LH2z0jbWyH6iiWiC/WyITb2ZxshiuO7irSikeEstwWIMuLeE5yA
         BPh+X2qBVfn2w7PNRyONoDHq4qyuphVGfxsKV3e/0QU3AOf+JDEg5UjfGkf7x9y//lfd
         95o8tRXJFCbhxM6DMHsP9/3yvlAGjZaoH2DIzAlWnd11KLPiFpyJ9BLtFvkpmEe1t9lL
         IRvUmgSle+koJjWBDlPqB4K5Vf1nadckacYET91rTHhrtwJd8l73IWetohGmCobodQ4Q
         MyttWJtt1sliGHRvEc0zh9Ef2SlGnYje0yYqq69dzGW8capGmFjaQtDzTEhvIFF8mCV8
         PCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680692306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzqvLefolrwy3WdKYUZXiVUA/OQTcVAscLkW8tJWOwA=;
        b=MrC2sYO7quP1ThChwaJv9eEsvzcLgoKXMoyfFPz7edyo0tfouz1uS4ubctjm8gj80S
         BBdVQ9Fa91029gm/sXH61AzdyC8ILdAUR2WTJJ0kU6rVUAoQUXUezrSIYdp9gNP9hnVe
         0AXx3oHqpnDG3mJbVvJZIG4mL1O7VqxSrtB1VZtKFL/pWSaKGqP6gSXp6+gzOyqRRbbw
         UHsSJrWKj1RkuJkHYt0PcOk/Qy5FADkGLcwRZN53nK033YXEwDnR7eWI7JkYL/PnyAFh
         +v2hDKfsWPIxf6rEVDRWiauA8F6sN3vOO30gwmAcr16NvuRNhvTXtG9L7ek7rowTlw8b
         S6fg==
X-Gm-Message-State: AAQBX9ccFf3aap9g6UfRZ92wk8o1WefajMeGNJnP/oeF2Lbg9cWqhnlG
	ocyPUGsChYNt/N3ZrKIHVwTzcA==
X-Google-Smtp-Source: AKy350Z45D9tpgWEug4uJiwUcpQ/wzKxDo0vLJTHod9wnTI8mK/+badfYEZMzMbpbs5SYRl87Y9j8w==
X-Received: by 2002:a17:90b:388b:b0:241:13bb:8303 with SMTP id mu11-20020a17090b388b00b0024113bb8303mr6409630pjb.42.1680692306536;
        Wed, 05 Apr 2023 03:58:26 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id on13-20020a17090b1d0d00b0023493354f37sm1123694pjb.26.2023.04.05.03.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:58:26 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:28:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>,
	Weili Qian <qianweili@huawei.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 20/23] RISC-V: Enable ACPI in defconfig
Message-ID: <ZC1URXKq7rrUlrXl@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-21-sunilvl@ventanamicro.com>
 <20230404-dimmed-verbally-3597dcaaf106@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404-dimmed-verbally-3597dcaaf106@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_035829_087373_74CA3809 
X-CRM114-Status: GOOD (  15.23  )
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

On Tue, Apr 04, 2023 at 10:43:02PM +0100, Conor Dooley wrote:
> On Tue, Apr 04, 2023 at 11:50:34PM +0530, Sunil V L wrote:
> > Add support to build ACPI subsystem in defconfig.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> 
> Dropped another R-b?
> https://lore.kernel.org/linux-riscv/91cf4ebd-f22c-4cf9-9fb4-fa6349ea00ab@spud/
> 
Yeah, missed updating....

> That said...
> 
> > ---
> >  arch/riscv/configs/defconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index d98d6e90b2b8..8822b49ddb59 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -238,3 +238,4 @@ CONFIG_RCU_EQS_DEBUG=y
> >  # CONFIG_FTRACE is not set
> >  # CONFIG_RUNTIME_TESTING_MENU is not set
> >  CONFIG_MEMTEST=y
> > +CONFIG_ACPI=y
> 
> ...this is not where savedefconfig puts this for me.
> Please move it there & then:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
Okay. Will update.

Thanks!
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
