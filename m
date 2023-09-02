Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AADC71153
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Sep 2023 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxiODXMGF1bplWdN4wgYrTU3mapuwuc1/a7z1cbkZGM=; b=NM3Ha8H9jEtLc6
	YgVkgNomwaXdKe91D4P4/C5ruwbIIVIa99z4LlvQO1osi/1aa1nU8FKV8Qtoa8PSqG3iLIkGhpLqC
	qzA2PV6D3gUENUntxzHx2/GdKnaaHxjRGvOSKPA4/+xZ72BIP8/SBkfQGro2dmQmaX/jN2nlkY3Jw
	m9MrRgZfL1W90Al3LI/9Q0qU8xTy0I+ry38jGtJMMR/y2w5glElK5F/FvihO23oN6uaryjtNvEIYp
	2ELHMLEPTyvfEgUVOef3Yjvp2Q22pzz23ojDoEdgZaSCJNR0iDx3sMdYRYA09PDohxLjcuRAxiLxm
	PpH1YKyfKQlPgYv49pLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ4W-001Qy1-1K;
	Sat, 02 Sep 2023 12:49:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcQ4T-001QxC-2F
	for linux-riscv@lists.infradead.org;
	Sat, 02 Sep 2023 12:49:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-269304c135aso2089070a91.3
        for <linux-riscv@lists.infradead.org>; Sat, 02 Sep 2023 05:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693658988; x=1694263788; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AW9SiUYVqHU6gW9QOW3GIP5QwEKPh+27Ixy8DvS3Y44=;
        b=FWclWjTUx94ZIVwHWgOT2RwDTgKz5ZKux+tTB4U6MhVKeBDiCSoOiMrRFQxb+U8Euc
         kOXxzKL9ue7KYozyuUwehRSlcAFVm1byN4+yTNpRKaSD/m2OP2gw/b47v4sB9iOnSU9o
         /iQgj1mxVgENdswK7QtgpfrPVVI33GU6MBRyLsj8aLRn/HdNH2xTnv7IyQQKYujKghZ0
         NhZJ3KnjNmQc+/uf8UPLtnET+7Hn/yiTSxjj4Nl4Oau1q29C231UrGhBdpr2t0QmgJfU
         6cfxwRAOHLDBQp8v9Fsv/XPLpQNTv1igjA7iqmdr1zT6+VC7iqZJpNDCacYbB7rhV+kJ
         qFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693658988; x=1694263788;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AW9SiUYVqHU6gW9QOW3GIP5QwEKPh+27Ixy8DvS3Y44=;
        b=BgDOWMw6TRyt17H8ug07rou3avzN47i+vyq1URhSskZOW6sRca47RilshnTxJ5sNzp
         5wB/myg/GyUK1dVhg9rh5H+3tRPGBI9Aj1t/1/bgd2SPfVBlqX+n+Cgovb3U0w8iGyjz
         qBPX55avx1c1T7udKLi7O91w1JMpUcIRD4POX+qNDmy2vWAzvKRC1WICz+39e3T/BIkP
         4OTRJPZDB48zLwGLJTCJW2E6NPzuC5hC2KX0klbk+6lEwCmwR8A4ocUnfcuD9ldlzoGA
         61fiqhZY+JfnSYUTmVNAd/r725hWXBUMhncqUzmLKd/G7M+yqvXlPArsYCdOzLOB4BCY
         EorA==
X-Gm-Message-State: AOJu0YwEIPSvIuIkB92nusH2aL3WkjPdpWo6ucUlvVVz1ZPM5LsqH3CR
	VIqAltXCoRFyF070QH6BfmG2wuddNTq8ET7dhl0M8w==
X-Google-Smtp-Source: AGHT+IFDRS9ZM1b0vV6N2s1IcuMRb6QLQJGFFuAGZLmjG60YfWA2e7cGTR6Esh/hH6bpB1lww/HhRGyd8M/o6jFSaCY=
X-Received: by 2002:a17:90a:d486:b0:26b:280b:d24c with SMTP id
 s6-20020a17090ad48600b0026b280bd24cmr4549024pju.42.1693658987992; Sat, 02 Sep
 2023 05:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230901130312.247719-1-vincent.guittot@linaro.org>
 <20230901130312.247719-4-vincent.guittot@linaro.org> <20230902-clip-shortly-c9af45460915@spud>
In-Reply-To: <20230902-clip-shortly-c9af45460915@spud>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Sat, 2 Sep 2023 14:49:36 +0200
Message-ID: <CAKfTPtCeAHtuasp2r7ZXwrapP5cE16GEJS5_DRB4amAbHYUKgA@mail.gmail.com>
Subject: Re: [PATCH 3/4] cpufreq/schedutil: use a fixed reference frequency
To: Conor Dooley <conor@kernel.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pm@vger.kernel.org, conor.dooley@microchip.com, suagrfillet@gmail.com, 
	ajones@ventanamicro.com, lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_054949_855631_602B9E02 
X-CRM114-Status: GOOD (  11.52  )
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

On Sat, 2 Sept 2023 at 12:57, Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Sep 01, 2023 at 03:03:11PM +0200, Vincent Guittot wrote:
>
> > +#ifdef arch_scale_freq_ref
> > +/**
> > + * arch_scale_freq_ref_policy - get the reference frequency of a given CPU that
> > + * has been used to correlate frequency and compute capacity.
> > + * @cpu: the CPU in question.
>
> Copy-pasting fail? That's not what your parameter is called.

Yes, I forgot to change parameter and its description

>
> > + *
> > + * Return: the reference CPU frequency.
> > + */
> > +static __always_inline
> > +unsigned long  arch_scale_freq_ref_policy(struct cpufreq_policy *policy)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
