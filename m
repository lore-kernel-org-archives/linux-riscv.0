Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E30C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 08:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Geo7YMXJUEXuoP+gnmDjWzpvKXDApmDPbE6suc5MfE=; b=1Mn0ez/GzyM9nP
	7yu4Gp5GeT7hTfAz7wPuikVamYAYX4eIplmx9gBP18FzJa+EdtTDlMcRbaF4TNTEPptXRvHI+WeAS
	zrdi7z5viEl8FVqWd+dm8gdUHOvEnwAwTZrynU7hRMbXGxHUlnlgh4lzTgra/Z2sAgABiYHHZSYk8
	cGWjcgKu+Fyksb6X6QD4PGXdjJ1nbILvQgmG+YWCrijonIv72JPpX9Z8ZX2N/ffartulua41EE0o9
	PWG6LmsGzyK8u7P1FuISUkhAIa6vBrdVODV9qeBrMFojCKHu3+WXklalaoMU6rtpPgpILJijBnQOT
	Larwqf9Kv2KHj/Os4JIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2yu-004Yur-0z;
	Wed, 19 Apr 2023 08:16:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2yr-004Yt9-1R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 08:15:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id c9so40625549ejz.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681892156; x=1684484156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=70mNhZClqQkVOkUSIQimtpeTT8E5iEZJRGDaNzPvWTY=;
        b=Ufj2xFdgBFJSP2CER7R485HoXPOrJdbdFo6EFtbE2O3h6JllTOf9xJQtHgxMVMtstM
         78WoiRDV5kN8XBx2/48YpS5MiI+xh4QWESEV74tEiG2Hj720KFSRp+SICG9KdHWOmMJk
         kWzjoozQLspk4jd4INTh+XRctup73CmxkGb5E/URMm4l5G7JCfVfsgaqz4iBPb8nkKzA
         m0vdQ69O6cQWvYWSmls3DtdTzgVEO92SmMNdxVP8TSRRWq2Q93W7oXX2eZELY1osyUG6
         B6OqepHx+FJCE/cG4vAukA75XClK3boW5id4C6XgcfZAWwW5j736EjIn+KxF/WCFu1BQ
         D2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892156; x=1684484156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70mNhZClqQkVOkUSIQimtpeTT8E5iEZJRGDaNzPvWTY=;
        b=B3iD4/aifnBBM3n2QQZxWXROMrO5M1kzPBBGFgqGSUr8jrH5giB6N2BrnOvYEd42NR
         gHSBY8SfdHjBjvLFpxFzTUlYmPcktvVeFSlJTYSJ5NEX5xb8zOmLZV6Qz9d3+65FRaRq
         /DqYwGaWn9uhOcrdyDTDdMM5wVo4ISJBLihSlBR9+5vKLkuuu4Nw69g94t62WZRFut02
         b8I/io7epbxza0/kW6i0Lmk2PitBYWxDG+5lRg5D+Jf7TJal6t9mZkBa5ZeuWRypt+u7
         RlrUU1Ni89YXmHwfDJAiA1rCub8q0AUz3dsekhTpLhSFT/xFeBUxpuSV79LGxCbk16ea
         7M0Q==
X-Gm-Message-State: AAQBX9fSCK343JI2VWelh1mixk6Ljhz2LioWpJuMOda3wO1zh4Y+43IJ
	v9MyvJ3Cv+OCRyMM2InjGKBZ2Q==
X-Google-Smtp-Source: AKy350ZwrcOUEdIPwv33D2WCaYL/Wl6qva32X91pKrht3eShi8llosenStJnAt5hoApwIgQxYnU47Q==
X-Received: by 2002:a17:906:1f56:b0:94f:5847:8ac with SMTP id d22-20020a1709061f5600b0094f584708acmr11295780ejk.51.1681892155820;
        Wed, 19 Apr 2023 01:15:55 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id wt10-20020a170906ee8a00b0094f225c0cd3sm6003561ejb.86.2023.04.19.01.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 01:15:55 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:15:54 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, 'Paul Walmsley ' <paul.walmsley@sifive.com>, 
	'Albert Ou ' <aou@eecs.berkeley.edu>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 
	'Paolo Bonzini ' <pbonzini@redhat.com>, 'Juergen Gross ' <jgross@suse.com>, 
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>, 'Anup Patel ' <anup@brainfault.org>, 
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 02/14] RISC-V: Add SBI STA extension definitions
Message-ID: <bl7i54kgkzvxzhritql4vtzpymepx7hmtio7pjnbmipv3dxwgi@dtmqpnkdlwl5>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-3-ajones@ventanamicro.com>
 <20230418-elliptic-headboard-6a18fcccdf07@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230418-elliptic-headboard-6a18fcccdf07@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_011557_489751_868E5F84 
X-CRM114-Status: GOOD (  24.70  )
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

On Tue, Apr 18, 2023 at 07:43:51PM +0100, Conor Dooley wrote:
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
> 
> What is the sort order of this? Matching the spec ordering, or just
> append-at-the-end?

I don't believe there's an established order. I've been going for spec
order, I think.

> 
> Unrelated, but in checking that I saw that your SUSP stuff is in
> master - you planning on resending that series?

I think I need to wait until it's been ratified.

> 
> Anyways, this does match the docs - but I'm quite hesitant to leave an
> R-b when it's not merged yet.

I could take your R-b now, and then if the spec changes, I'd drop it
when reposting the PoC after reworking it.

Thanks,
drew

> 
> Cheers,
> Conor.
> 
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



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
