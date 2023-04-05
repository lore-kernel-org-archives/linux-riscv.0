Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA155C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2cqvrqrogq4B6qDgDTXGcUSBlocwjkKE3DCT3/+0Nk=; b=eKsV774IJIyUHi
	n+y6nDbljtlmr25xZjZy3ZuKFXbsPvgUqianzn2Qk5r38l5gdwzcCHx+oz9sCVSWBGC5jvteGNqoZ
	iiKxKsec16V7/4MoUxbTiCkduwJE2tqQ3H0DVBz0g+AH5jrRNjVzqMf5dO/SHkKCHCt71/u7cKbmV
	bqXdhsFmsYE5JVvQMfEVlVY50xE035aHlI7TefA/7xYutodzLdxkaUvYshVbBmlHimdkDQx8qau88
	WWw4wA2uC+17zVrUSlOc49g2UmFQl+EKL7kKh5unvcin1ojGe7J0ptnGdP2dVCG4zVwpujN7Pt4hA
	Ht9VBUIAxl0as5K2qCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0f9-00487F-28;
	Wed, 05 Apr 2023 10:46:47 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk0f7-00486W-06
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 10:46:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso39080357pjb.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680691602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=otykqullkWmg0A8KD35JF+HvspAaLoRDA6Fr6QFOB1A=;
        b=UQ0uumG4XH81lWfK6pVQa6G5b2bhg0H+jTMz7NTZVbIIyh41o0CBkytB6xZpFe/MDh
         Yffh5qenGWrU9TxMdihhNju6UMyitiMEbH/S8wc2qQG1KulmNjPVmxbe+5lvAhEFomTo
         UVZm4lhSh/J0/m6bMtf8ttgxYxkKl7fMCt60yIF06Ptxf/mvXyFUkNGGUYB2n0DaTbEg
         azqFX9oSbODaFFg4PbBU08adA+7I25vr0zw2LIqhUF9vuMMdUc7mKurF6cxQ3IPMwZvq
         T3aNBPO0bWfwSYeSYziw6ebXlP1MKTFYUr1w/FPVCAfBHvf9/tdCNmCXNug8DyFs3WjS
         4MCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680691602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=otykqullkWmg0A8KD35JF+HvspAaLoRDA6Fr6QFOB1A=;
        b=CXmnpqRnOAEWrhDaUejyseHXF2uz0UMSioU4Ic033O4ZucxdMN6mRdAY4vP4SoXK65
         EZpRGzHcX3p4Bu8q0rDRcNHVsx/e3BAhDFSF4xaQwA7l2cpMMSp/yHYzRBY/bflqVl15
         iRePstOYQ+V9e9w3TzlwN43KiaNm62uL9mYPN2gJ5qKCMdceKIA9AYtTeB+qwV6ZtmKH
         ENrmJ3Wy2jToV9+SzY5svy6D8tFzUE7RxetgvN8BDDwo+h5/+t9UGbVLdWCSGW5gyM4N
         EEM5XILJIIXL2Zfcy9+Qycn6DI0w9DjKLbTNDCb5ck9q90x6U2AI3+I0i8qC5V035Tlz
         8GCQ==
X-Gm-Message-State: AAQBX9dypF3NoYtk1k4gyXyjuelE2ho/vJdip3SMawEc/PGVyEgcaFfh
	1te3wGZd35ARmfOKKYsElpxKzg==
X-Google-Smtp-Source: AKy350bK44iNVZ3LLDOTnB4w4y2fswThth90M15FEkZbqe29HOhrRwzj1s6JWfRQJI6BiNBgiUWAxA==
X-Received: by 2002:a17:902:e294:b0:1a1:8edc:c5f8 with SMTP id o20-20020a170902e29400b001a18edcc5f8mr4558701plc.56.1680691601853;
        Wed, 05 Apr 2023 03:46:41 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id g20-20020a62e314000000b0062b5a55835dsm10319322pfh.213.2023.04.05.03.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:46:41 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:16:28 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Weili Qian <qianweili@huawei.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Herbert Xu <herbert@gondor.apana.org.au>, Tom Rix <trix@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mark Gross <markgross@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Len Brown <lenb@kernel.org>
Subject: Re: [PATCH V4 23/23] crypto: hisilicon/qm: Workaround to enable
 build with RISC-V clang
Message-ID: <ZC1RhA1Wi0B54sTO@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-24-sunilvl@ventanamicro.com>
 <20230404-viewpoint-shank-674a8940809a@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230404-viewpoint-shank-674a8940809a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_034645_067593_32E88D27 
X-CRM114-Status: GOOD (  23.42  )
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

Hi Conor,

On Tue, Apr 04, 2023 at 10:59:41PM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> This one made me scratch my head for a bit..
> 
> On Tue, Apr 04, 2023 at 11:50:37PM +0530, Sunil V L wrote:
> > With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
> > allmodconfig build. The gcc tool chain builds this driver removing the
> > inline arm64 assembly code. However, clang for RISC-V tries to build
> > the arm64 assembly and below error is seen.
> 
> There's actually nothing RISC-V specific about that behaviour, that's
> just how clang works. Quoting Nathan:
> "Clang performs semantic analysis (i.e., validates assembly) before
> dead code elimination, so IS_ENABLED() is not sufficient for avoiding
> that error."
> 
Huh, It never occurred to me that this issue could be known already since I
always thought we are hitting this first time since ACPI is enabled only
now for RISC-V. Thank you very much!. 

> > drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
> >                        "+Q" (*((char __iomem *)fun_base))
> >                        ^
> > It appears that RISC-V clang is not smart enough to detect
> > IS_ENABLED(CONFIG_ARM64) and remove the dead code.
> 
> So I think this statement is just not true, it can remove dead code, but
> only after it has done the semantic analysis.
>
Yes, with more details now, let me update the commit message.
 
> The reason that this has not been seen before, again quoting Nathan, is:
> "arm64 and x86_64 both support the Q constraint, we cannot build
> LoongArch yet (although it does not have support for Q either so same
> boat as RISC-V), and ia64 is dead/unsupported in LLVM. Those are the
> only architectures that support ACPI, so I guess that explains why we
> have seen no issues aside from RISC-V so far."
> 
> > As a workaround, move this check to preprocessing stage which works
> > with the RISC-V clang tool chain.
> 
> I don't think there's much else you can do!
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Perhaps it is also worth adding:
> Link: https://github.com/ClangBuiltLinux/linux/issues/999
> 
Sure, Thank you very much for digging this!

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
