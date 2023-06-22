Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B02EB64D8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZrP0uKmuxWnxY0l7XYCXeCg2iOKkd4cRR8o+zBU5qrg=; b=FcNPlkz3GRqsCXDKWstqmhPHlq
	/LDDfFmUKRcZhWUBM2gQV0FtUlz73J765qA9Id7S3/TQINl1PliorpxBMA0nINfrE0417341AtM3e
	kpH+u+TqUE5+9p6UQ7oj7E+kaOoVuVLoT/MLTZNg5h3hPfOzl7eHKdFzZBGEmTnBpQL+qulkhn2vJ
	xKt7vl109g1Ym83fWDcAfubDU4i3S1qvOnKyA4ulN1rimFF3rpzELSVXdIwTh+Gb00RgqCBzpIh3i
	bmqPbsodhK1gRASI0DZwRnthKre9YrVDQFPzqrEzGHEbvSVeHrAFjHVAN4zJsf9EHJ66i/xww+cWX
	k77Hl52Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLTN-00106T-0p;
	Thu, 22 Jun 2023 14:39:45 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLTJ-00104g-34
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 14:39:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6687446eaccso4088507b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687444781; x=1690036781;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOcn681HzuehLEAAjtV7KZ0Sslre2UN3bE33auZZhYU=;
        b=2E6PG3Gybkyvaasw3DfHQMDc2CMEIPgkgnxI53wkqyQdg8t+9ab1uIwfDIn3nax9Gv
         2wKj7W50nZ39jmH/aSaUY8kggtyM225iIbRi6VIdk75mPnhwUzG51cfdk+SdEiTOufaQ
         lPJ419BbwB8/SA1xpyqTU/f44r79ypzXC3cvV526ZXCMSwRgfvMbsbllorOSMNxVnj9J
         OpyKhUAZiO2zimczatkAJgbhYlXHxnxpdck9Xzr12NaiV1R4MlrlxGnvzKiTrH8bG1Cm
         9Fxot5rBTO2dEiaJZkxGGx0K/FRJ3NTL2zZ8UlyGeQW16cV6J3OjHjXhGDCGl06H/lts
         7zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444781; x=1690036781;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOcn681HzuehLEAAjtV7KZ0Sslre2UN3bE33auZZhYU=;
        b=k2BVq3A52P6TU43Bn5LPmJr3g7V0S/VrjzGl0FRiruqsJefE3hBIXlSsCFqCJUi07p
         2Ui535f78320GYo2cpNem7/b3xX8xhOCvFuqYVN3R2KK1InSj0xlccgPwKGVUlLzjpxm
         cn/bB0eL0EB6uVOm8KJU3Iah+m6H3faiOB/0TqJIVz+sEQznNAZ9guGx5/IjfHwsu9Ro
         U0aHgFrBA1jl/pMefsQgjfRadip/90MCleDZYAcwvuW9bQCxAuBeXba3FmH4TzQju4zD
         JcLFue2yYdmMPRWHra8BKvLYZFK32m3PRburgwjpDgCS7DwGRfqzFpOAHw0xTE8vJT3I
         oe3g==
X-Gm-Message-State: AC+VfDxA/Pfs/sY9AiEQNmHv/W7UlaJB1zBvtzER6h3miBZHEqcp3yUu
	99DYcPsI6r4h3KT0U1Vol3K7hw==
X-Google-Smtp-Source: ACHHUZ7VYYurKNaFAN6NfGrwHNG4lDAaqFqfbrmteE85L/f6RjTCOMutLcLibCKThE2wD/2Mo074QA==
X-Received: by 2002:a05:6a21:6da7:b0:11f:2909:fe9c with SMTP id wl39-20020a056a216da700b0011f2909fe9cmr22073948pzb.20.1687444780767;
        Thu, 22 Jun 2023 07:39:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id s26-20020aa7829a000000b0064fe06fe712sm1891802pfm.129.2023.06.22.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:39:40 -0700 (PDT)
Date: Thu, 22 Jun 2023 07:39:40 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 07:36:50 PDT (-0700)
Subject: Re: [PATCH v2 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
In-Reply-To: <20230621072234.9900-3-alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-8f0968bf-c6ed-42e4-8e4b-d353b6331d1d@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_073942_209159_67DBC749 
X-CRM114-Status: GOOD (  22.36  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, corbet@lwn.net, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, songshuaishuai@tinylab.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Jun 2023 00:22:34 PDT (-0700), alexghiti@rivosinc.com wrote:
> The EFI stub is supported on RISC-V so update the documentation that
> explains how the boot image header was reused to support it.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/riscv/boot-image-header.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/riscv/boot-image-header.rst b/Documentation/riscv/boot-image-header.rst
> index a4a45310c4c4..df2ffc173e80 100644
> --- a/Documentation/riscv/boot-image-header.rst
> +++ b/Documentation/riscv/boot-image-header.rst
> @@ -28,11 +28,11 @@ header in future.
>  Notes
>  =====
>
> -- This header can also be reused to support EFI stub for RISC-V in future. EFI
> -  specification needs PE/COFF image header in the beginning of the kernel image
> -  in order to load it as an EFI application. In order to support EFI stub,
> -  code0 should be replaced with "MZ" magic string and res3(at offset 0x3c) should
> -  point to the rest of the PE/COFF header.
> +- This header is also reused to support EFI stub for RISC-V. EFI specification
> +  needs PE/COFF image header in the beginning of the kernel image in order to
> +  load it as an EFI application. In order to support EFI stub, code0 is replaced
> +  with "MZ" magic string and res3(at offset 0x3c) points to the rest of the
> +  PE/COFF header.
>
>  - version field indicate header version number

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

In case someone wants to pick this up along with the others.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
