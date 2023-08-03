Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B1C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9bJ0Y3T+bfuGUpmVcPFtEGQctlAOsBETVV1fNpb5Z0=; b=xGOL6j4AIaVAUz
	RTu414O3Qz/LtJOACvzeuIxo/5ZnFwmOG8VlaiL6ifwUB3ReoUL577GrC54HlHQErq+zENOuMB6lg
	jlD+EGJGggeO6ZEM/rPUnnN4E2D8Y7nl06MTdWdMm8h2zGbDGobzZ3FqaTGGJjaO/GgiHU1r7oeSz
	kYfjC6jz0ty7D6fN5qwa12j36kq/1HxC5DngENhWh8meHFkVX0BsJz85WKup8VKSIyT5QJue+JVb6
	iKpiY2P6aY0uu0xd4MIoz/ZVLedWiU+i+wrsMlewwil2be81CSmeaCkg0kA4ZGeOkML3jv65XNLMk
	tYbXH9NFVafoNGEMKWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSdZ-006rDL-08;
	Thu, 03 Aug 2023 07:20:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSdV-006rC2-2n
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:20:43 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so1132132e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 00:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691047234; x=1691652034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PSNEeP/otBZQezes5/i4DRgnVi/FMuTt0Ee0f8kunCQ=;
        b=H8vnbtukJOQxArmCA1LBzxDXn8WHCOig0ywQ7qrWF0SUm9CyL0Lyc6NHVIguv+i5G+
         eH0aJdbkFnM1uLXnMmF6EmyX+ghFWjFnI3+V4Vk6TLpUtfBb+rv3DeRvt1eK7q2zLnct
         lzm1W/R52dR41S0MDXsLfxE2Z9h0/v8TwSyqJArnbg8puQk7HSBl72PyZevz5fK0MdBK
         jixzb8G4XkpcqQWHpWS0LosqzwHSZ9lOfxNtAcPwCqd7ddfafqimO3c6VQViypT1bv6f
         JtEC0OZrtU2uam7biRe33WreM5LjULiJo839hYQDEmXZa0+jGjYLqmCrfW5OgqiOUIUb
         0VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691047234; x=1691652034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSNEeP/otBZQezes5/i4DRgnVi/FMuTt0Ee0f8kunCQ=;
        b=dEbA//rQVSDvpY4XxBtMi6R8UMiKqXQln3KcdNN/WD1n+aCI+iqWQoT5UiSth7Bsz9
         bsubwUhHRV8tod7NWDqqtdlcEKK7ZH3r0KzI/L73K8xX7GvHSNU03Jae1e21XrqzQf6Y
         hVYH6/uabFcTsjj1tlwDK7nMML6hNPT2VEaLTwuhUuRTb0Wcd2lM0WNaLX8WMUUFFFxY
         dIS42oqLu5KLLiWNYjFAkwEC+arsrMilLbWgSz8RmGiGIuartOK7IWfQlld2C+WyUnSA
         R2zmORmiN/Tuux5FNgp+3S3xMFa9Z186o9VyoLuLBpvLub8JcNHvFwfF3Luh6Csx0Yxw
         uJEA==
X-Gm-Message-State: ABy/qLZQBJg43MEAMDBpqv/PT25+DfZge+oxmoqoOBvXkowpN+swTQ/n
	dME9qqrLtS7Atg6GnvMWJQzWBw==
X-Google-Smtp-Source: APBJJlFDARzPqh5y9Mh6KXJFmJb55rR5LKo/8M5qooInATWDlbgOJRhKP4cn7FyBFuM1Z8rmq4zItg==
X-Received: by 2002:a19:501a:0:b0:4fe:2f8a:457e with SMTP id e26-20020a19501a000000b004fe2f8a457emr5541935lfb.43.1691047233796;
        Thu, 03 Aug 2023 00:20:33 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id n10-20020aa7c44a000000b0052238bc70ccsm9745891edr.89.2023.08.03.00.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:20:33 -0700 (PDT)
Date: Thu, 3 Aug 2023 10:20:32 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Guo Ren <guoren@kernel.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <20230803-73f12efe1a16517072404251@orel>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <ZMrnoBAHO0Iaj6b/@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZMrnoBAHO0Iaj6b/@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_002041_929346_8034D709 
X-CRM114-Status: GOOD (  25.04  )
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

On Wed, Aug 02, 2023 at 07:32:48PM -0400, Guo Ren wrote:
> On Mon, Apr 17, 2023 at 12:33:50PM +0200, Andrew Jones wrote:
> > The SBI STA extension enables steal-time accounting. Add the
> > definitions it specifies.
> > 
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/sbi.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> > index 945b7be249c1..485b9ec20399 100644
> > --- a/arch/riscv/include/asm/sbi.h
> > +++ b/arch/riscv/include/asm/sbi.h
> > @@ -30,6 +30,7 @@ enum sbi_ext_id {
> >  	SBI_EXT_HSM = 0x48534D,
> >  	SBI_EXT_SRST = 0x53525354,
> >  	SBI_EXT_PMU = 0x504D55,
> > +	SBI_EXT_STA = 0x535441,
> >  
> >  	/* Experimentals extensions must lie within this range */
> >  	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> > @@ -236,6 +237,20 @@ enum sbi_pmu_ctr_type {
> >  /* Flags defined for counter stop function */
> >  #define SBI_PMU_STOP_FLAG_RESET (1 << 0)
> >  
> > +/* SBI STA (steal-time accounting) extension */
> > +enum sbi_ext_sta_fid {
> > +	SBI_EXT_STA_SET_STEAL_TIME_SHMEM = 0,
> > +};
> > +
> > +struct sbi_sta_struct {
> > +	__le32 sequence;
> > +	__le32 flags;
> > +	__le64 steal;
> Could we wrap the "sequence & steal" into one 64-bit variable? Then only
> rv32 needs double READs, and only one ld instruction for rv64 ISA.

That's possible, but we'd have to reduce the size of steal by whatever
size we decide is sufficient for sequence. In order to do that we'll
need to discuss the size reduction proposals and their justifications
at the spec level. If you'd like to make that proposal, then please
create an issue at [1]. But, I don't think it should be necessary.
There's non-normative text in the spec that says "This sequence field
enables the value of the steal field to be read by supervisor-mode
software executing in a 32-bit environment.", which implies to me
that we could optimize the read in a 64-bit environment by neglecting
to read sequence at all.

[1] https://github.com/riscv-non-isa/riscv-sbi-doc

Thanks,
drew

> 
> > +	u8 preempted;
> > +	u8 pad[47];
> > +} __packed;
> > +
> > +/* SBI spec version fields */
> >  #define SBI_SPEC_VERSION_DEFAULT	0x1
> >  #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> >  #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
> > -- 
> > 2.39.2
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
