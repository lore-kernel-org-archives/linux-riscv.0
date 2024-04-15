Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8188C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rRniDw3KxivX1VOY5FPkk20RCPMMzkXHPjpBXc6A9Q=; b=zUXeY6ibChGAnJ
	mKLv6aFphN9FTVXxF44P8cafRu9qmZzQnnI5YWoOzSLqaKwd++yVRtMhLcmSQwD73ILmOI1wjDts5
	z9GOUQ+Pti7e4Sh51VErFCNV4s6uFpYo81upJixGNoTRGfGMeYrfTab0m/L8q0M42wdRBOx2K6zfE
	bzP3E1pUNs03OEAC5OONWySHbcczrQINicO6ovpGHQ4tEpfx4XIufiIc0wl7qsIPzsAF69DoPaaxP
	Nc1NoXt4ciY1GYrW9kEoo+Ql0CZqoZMsNZYpm1O1wnvC9WSgn1oY+vFggzT6QtiZvr3eFNOoBiNoZ
	oMi767mQe2Fu1A0y56FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMFk-00000008R2z-13UM;
	Mon, 15 Apr 2024 13:20:08 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwMFg-00000008R1H-1AnM
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 13:20:05 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2d094bc2244so36363501fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 06:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1713187201; x=1713792001; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SXmg35GKlfduv7MXmhtmlNfK7GX2Rv8iwiDs44M8/A8=;
        b=ZdSmVIy+NKEkcnRPhnhzHTz9KpNRuVSvUMTMHbjblHk5E9gQuKBZTA7UK0T72qjoRB
         Rvqi8vycQ15hXF3Y9WERoMZ/1lGr0/jQAhB89eyBBPn2of9YQtaxHorf6tGWNy3J4hjw
         tfy6HlJE28Ip7ZpfGdJKCygetwMEEBdE5d1Mh7BKvMLEHT2v2/4BYAI/271VTirUUT5p
         USami5Lk3qCU7FmKigRaTlg0gxx0eneEUqOR8PYLJTzYHcBIPHgddsP8mdgFtEmzP2+I
         CIdVy1Pzo/FLWfZMqsFECXtbin9eOF+AATg7zdrhvuRVi5p1prlqh7Rqde6UQgdIPFLa
         HCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713187201; x=1713792001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXmg35GKlfduv7MXmhtmlNfK7GX2Rv8iwiDs44M8/A8=;
        b=EC+JpHBlWY3nNoQhUgFgW42rvjH0s17Sn77IOnLY0WRZ7uYB3GYC8JFd9sNJZ3QyHW
         W9cB28ovnuC9wppdwgDqWpOmRD2QUpnl6Cneg9ZILPf/OSXJt6F9LdkJeI+IMFUJHy7f
         +/CNfl/j6Odo57vTv1xdXtz5WWJuT78j80XPYotnG6sjIMV35Yzbx0J+ioi7v3c3svHI
         Ngdwc9aWDQyCgkbo/kQirbUerIVcDrhqG1xt33F6Xevpty8aTIt4BmZe9JiurIW/QyAa
         rEExdacuy65nwAbzRWEYk3pRgm8AM4u7gT4F/qdwcR+/DcEtqcmwlLjJL4L27kTaJXCh
         9vDA==
X-Forwarded-Encrypted: i=1; AJvYcCV2WuG1DODwQloMFH1fXjCdvDa+e+IBCQYg0YUwUX2sTikdKsEoe77sS4DMWOXPz73Q7FvbVbiwLpa+NUn6kuaa8Rxi8MKeotdox79XW7o9
X-Gm-Message-State: AOJu0Yz3m8RhnATPm0ncuElGZ7cL9LvYARMGXMIrrs7E79Q8t5rb7atQ
	QqgbRl2qHEjf2ga0ikLyRXYOGVsr0nJjlxULiZEKijG1XN8PsR1QDXSpOy/mrTA=
X-Google-Smtp-Source: AGHT+IHC4az2rFSCiUuGCh3xwdRVNxly/Qg8h6dhI2uDrhLenj+lI0/6ysFeUkGc4sRDSnzFxzxDsA==
X-Received: by 2002:a2e:9b1a:0:b0:2d8:b2e:7bf3 with SMTP id u26-20020a2e9b1a000000b002d80b2e7bf3mr5838228lji.0.1713187201312;
        Mon, 15 Apr 2024 06:20:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b0041663c75ef1sm16363175wmq.32.2024.04.15.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 06:20:00 -0700 (PDT)
Date: Mon, 15 Apr 2024 15:19:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Atish Patra <atishp@atishpatra.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Juergen Gross <jgross@suse.com>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, Will Deacon <will@kernel.org>, 
	x86@kernel.org
Subject: Re: [PATCH v6 13/24] RISC-V: KVM: Implement SBI PMU Snapshot feature
Message-ID: <20240415-74754b02ead9b89dcaef6d3a@orel>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-14-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411000752.955910-14-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_062004_349696_696D8042 
X-CRM114-Status: GOOD (  13.56  )
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

On Wed, Apr 10, 2024 at 05:07:41PM -0700, Atish Patra wrote:
> PMU Snapshot function allows to minimize the number of traps when the
> guest access configures/access the hpmcounters. If the snapshot feature
> is enabled, the hypervisor updates the shared memory with counter
> data and state of overflown counters. The guest can just read the
> shared memory instead of trap & emulate done by the hypervisor.
> 
> This patch doesn't implement the counter overflow yet.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>  3 files changed, 130 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
