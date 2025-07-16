Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A39DC83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xVBkxtJ8c9pMvAmg4hNHwZtU70F/3Su0ppnqggCImMM=; b=vOFGjJ7o1/FYJUwjY2x/pf0jZy
	zGKdrIBEb6tUzqRT/P4kKT7QouIQZQKz3uJsr9gQtJ8u0h3VI7XqzsbQ6V20hG93p5eL4Pn9QmZUN
	xnCqwkgO8HBcKt4xoVd2s3WY+FJanZR3ftvGiYr64YCIsHRMS2g7JhuyEHbAP4gpQgvnPmTm7UA4r
	ElpbbkQ5lTD1AL1CyJ7VxVSQzMCc22TyQvNGhGzltSllBw+XowlNfQ0PY9hj88kYiaMZTD/NgX5i3
	L0N28OOwA/c0MtKI5ej1Mqj9KBmG4+HINA8Vah2qRui2d37fAJ/7SA2hdG3HEeFrdZrxhyJzFIznV
	YORILFZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc446-000000083zK-3Be6;
	Wed, 16 Jul 2025 15:29:02 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc42L-000000083eU-0iIu
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:27:14 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7490acf57b9so42851b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 08:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1752679632; x=1753284432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLHXWx3e4qVyWFktNcTinbMTNqw3Gsd0ZZ2hzOlFYG4=;
        b=TC52ErGV+xk818BflFZQA0RaxzCODTfxqsUNoh9rKomiyGFlh+wJLlg34Qret2NPlJ
         w2cE+FrceYGSRVGRD2kC5prlfkDdyxlWmGwUwn4UGzRiBbhcGuzQ6iuogWIAs/CCZVyW
         OLqtraciZxHVF0SEMrMpkjfe47QXsDCG09fTRegrxLKNpOpaTtAGgBrwK45HEtiOTN7Y
         o/cAXsfWQtbOlB+s8UQRFRwUZzR1rg+QCyixKepvjwxl8JlzkNqpjk6U70eIV1lfRG/A
         +DMBajySsLPBrkGXcsxskugRWax9DNAc+QPStiIjrqo/Kpn10nLRTr+sR2scvovcoEGT
         qVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679632; x=1753284432;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DLHXWx3e4qVyWFktNcTinbMTNqw3Gsd0ZZ2hzOlFYG4=;
        b=O0Q+YTyqJzsInYPatzsaRIT/aiWJ1COb1zBZpkRMmmAssOt8xNxmvZaLVq+DB1y8P/
         1J9m7aGkbk4GkDDuLA+P0VB+Q5y9oHHh1PpiNCVh9VrAQWlcBSt1fn/DTzkyKQDZ2dPB
         B5RSerM3bAoH3EleW5qqw7MNqkNjyKhQwmw9koghNJiy9Vf58UGIvAg1tIxg+A2RIH3A
         8ms6RmRybKw9aboIBFGfu/A/uavZIr93EP5re/7eKgLWkLvJyDDOeRmjTKViObMYOqwa
         Gowxp6bUFsZKc2KBfIkbk4qkb1UmJMN1NfaWuZnQApCj/n30RNTb+55epJugstrFlJ2e
         iwig==
X-Forwarded-Encrypted: i=1; AJvYcCV0y9zZl5zXIBK5XWseaqa4CqPsX3heFW2A8JQVTp8Od0IFWS+UoY+YPu58B+GC+WA/rP6QPn/DLClzsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNxmQ4YoCx4Jk1LiMRUAZoB7x2vW9NC3uErinlmdPOMDTORfp
	Y9y2IIlI4VtVMyZgDcz9nhstY+Vmyf1JX1nV6cu7T5x7rzM/zTnHcnmcXfPjZs5lBFcTTnl+kBJ
	wJ5isGmI=
X-Gm-Gg: ASbGnctLVieCA5JKhZUA7JYihw60ejv4u5TRF2pTKtRWZXYVoa4YkBTgTDFiCnklJrM
	6uLDQWWlHhve6jl5Mu+tIrZ5P1xvWwR+tBAXHqfzIrzKltbcmau2+9Gl+pw99Z4qGZMIqr/sBPK
	TRovdZ57XB2aDXL1UciLvt5B98RQF4R6DBH0OfXHtWLdjz/Wz5+X79pf7fp7H1OdVgWPjsUUrew
	IMyNuPB7x5GMTGEURdJbGQj+lwJJLBUI6hyNNdVK/A7LrDfa+MZuTRpjtm1ZMCWYBwK3uHjaDh6
	Bz+rupQPcEHDi6gNm41Ysw3kgWl7jBacMnECqW0Vrz+rtgAIoCQqaw54IeaA9XJ7bcRfbmmmKCx
	lo+FIMaErwDE+u9nCdrTc
X-Google-Smtp-Source: AGHT+IH7iBG8I47ZPk3kjc8DlfJqKS+H6u2KneCpl6yYfAutQXIcMVrF/w+WWdKN0EwIATcq6Y7GTg==
X-Received: by 2002:a05:6a00:22d0:b0:748:e0ee:dcff with SMTP id d2e1a72fcca58-75723d7d2c8mr4843826b3a.11.1752679632185;
        Wed, 16 Jul 2025 08:27:12 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:b02a])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9f22c01sm14929679b3a.101.2025.07.16.08.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:27:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 08:27:11 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Jul 2025 08:27:09 PDT (-0700)
Subject: Re: [PATCH v5 0/3] RISC-V: Add ACPI support for IOMMU
In-Reply-To: <20250716104059.3539482-1-sunilvl@ventanamicro.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Message-ID: <mhng-E714E5B9-0828-46CE-B890-9AE61C2E341D@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082713_212946_42B7D551 
X-CRM114-Status: GOOD (  19.58  )
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
Cc: apatel@ventanamicro.com, tjeznach@rivosinc.com, Alexandre Ghiti <alex@ghiti.fr>, rafael@kernel.org, robin.murphy@arm.com, joro@8bytes.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, ajones@ventanamicro.com, Will Deacon <will@kernel.org>, lenb@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 16 Jul 2025 03:40:56 PDT (-0700), Sunil V L wrote:
> This series adds support for RISC-V IOMMU on ACPI based platforms.
> RISC-V IO Mapping Table (RIMT) is a new static ACPI table [1] introduced
> to communicate IOMMU information to the OS.
>
> [1] - https://github.com/riscv-non-isa/riscv-acpi-rimt/releases/download/v1.0/rimt-spec.pdf
>
> Changes since v4:
> 	1) Rebased to 6.16-rc6
> 	2) Addressed Anup's feedback on formatting.
> 	3) Added RB tag from Will and Anup.
>
> Changes since v3:
> 	1) Rebased to 6.16-rc5
> 	2) Addressed Drew's feedback on v3.
> 		a) Reordered calling rimt_iommu_configure_id().
> 		b) Removed unnecessary inline.
> 		c) Added pr_fmt.
> 		d) Removed redundant rimt_iommu_configure_id() stub.
> 	3) Added Drew's RB tag in PATCH 3.
>
> Changes since v2:
> 	1) Rebased to 6.16-rc4
> 	2) Removed Anup's SOB and link tags added by mistake in v2.
>
> Changes since v1:
> 	1) Rebased to v6.16-rc1.
> 	2) Dropped ACPICA patch since it is already available in 6.16-rc1.
> 	3) Added Rafael's ACK.
> 	4) Fixed few issues found by bots.
>
> Sunil V L (3):
>   ACPI: RISC-V: Add support for RIMT
>   ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id()
>   iommu/riscv: Add ACPI support
>
>  MAINTAINERS                          |   1 +
>  arch/riscv/Kconfig                   |   1 +
>  drivers/acpi/Kconfig                 |   4 +
>  drivers/acpi/riscv/Kconfig           |   7 +
>  drivers/acpi/riscv/Makefile          |   1 +
>  drivers/acpi/riscv/init.c            |   2 +
>  drivers/acpi/riscv/init.h            |   1 +
>  drivers/acpi/riscv/rimt.c            | 520 +++++++++++++++++++++++++++
>  drivers/acpi/scan.c                  |   4 +
>  drivers/iommu/riscv/iommu-platform.c |  17 +-
>  drivers/iommu/riscv/iommu.c          |  10 +
>  include/linux/acpi_rimt.h            |  28 ++

Thanks.  Anup came to the patchwork meeting this morning and asked me to 
pick it up.  It only barely touches arch/riscv stuff so I'd figured it 
was going somewhere else, but happy to do so.  I've picked it up into my 
staging tree as

    *   e5efe466d9bd - (HEAD -> for-next, palmer/for-next) Merge patch series "RISC-V: Add ACPI support for IOMMU" (2 minutes ago) <Palmer Dabbelt>
    |\
    | * 368ed89f7ac9 - iommu/riscv: Add ACPI support (2 minutes ago) <Sunil V L>
    | * 0d7c16d0df92 - ACPI: scan: Add support for RISC-V in acpi_iommu_configure_id() (2 minutes ago) <Sunil V L>
    | * ea35561bc965 - ACPI: RISC-V: Add support for RIMT (2 minutes ago) <Sunil V L>

it should show up on for-next assuming it builds and such (it's behind 
some fixes, so might take a bit).  Happy to do a tag if someone wants, 
just let me know...

>  12 files changed, 595 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/acpi/riscv/Kconfig
>  create mode 100644 drivers/acpi/riscv/rimt.c
>  create mode 100644 include/linux/acpi_rimt.h


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
