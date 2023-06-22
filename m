Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F60C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jun 2023 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CpfK2Sz3OYScOzhOhrscugTiOgALCXBs/HqJmDyBEkM=; b=QhDXwr8ZdRXmUiCyM7Cqo6H5EW
	sYzYvhKXz9PF9dZv01JjpNY3myRZoi4of5dNgn3ZsQQ+TmKEjMYzyy9L7GRNGAlR/E4s5LlaiQ5KY
	OR9R4yUHvNq6SKC8ov6IqDVEmxHfFhbNTZ+tguszRBMWOSiIk+t1819Cwvp5UXivIToVU0GMyjvwq
	VxTmbNLvI/e6Z/LdjXgmhpHxz/M8sw1V5mgsJjuly00RWTBDYZ0Eo47liXB7RjgvHHWFTjYUwAIvk
	8hlZ740B5IV87Dg3HOXaplr88GMGGUFXBczaFsuEg4Jfhp/c+svE9ATVGtnWQ3VPahuTBUfc/XE/J
	QaxmVSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLTR-00107U-1a;
	Thu, 22 Jun 2023 14:39:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCLTM-00105E-3B
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jun 2023 14:39:46 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b539d2f969so5475495ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jun 2023 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687444782; x=1690036782;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fywfQQcEL0GxG1eX4F63s7nb2iZREKwcfrQ6rwdwNPE=;
        b=xf8CKA36/oLmYxy+fdt9/SIgAHOADxcKQwWHt2OPJ010QjBV7ny/Bz897WkbXfO/jj
         QUScKRVUhiEWoppl07WUKtz3q7jq2csqmYuD/uYCD1B1NuoKeRmf81rIZCOSDRwWLIG7
         IJUEZx8gFt+hCMCBTeXOMrgNlKv1xazDcEFPKhF5dcTbrIhOntzLkobunYJBlWKO0ePE
         rJbH981zxRuJlMxoRBi2+Y7hiNHeOWJOh4CCscYGlJVQnh2RMt8tfaiv0Rru036pVB02
         QXvN6zwgzfKuqJVGjBSpjXnX+zEtOR6UqWXRPIwyxyza21xi0bKV2wYlbLe5cl3opbHj
         g3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687444782; x=1690036782;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fywfQQcEL0GxG1eX4F63s7nb2iZREKwcfrQ6rwdwNPE=;
        b=cimlxHSpgmfTfcBV/fjm2R+DG8hglwYH4FaY1E5phqbFvayR5xUvPruBd6rDfjbdC6
         5oYwZHA8di9+PlWdjJi5/OyKCMIIFZb5vqRppD9ju8AK+FW/UE5J6+7VLkoNa963Zr3N
         2JL/w1w6QJJwvbax5uP4FH/fVCYG7zFWzUKS9ktm3vuEYcHauL7F4lFp3fIJssZp4btJ
         pCZNDZX8dyqKY5VS6rrEiJRfRMHVR9jMNJB4KnKV1KEz65oBLFnu2BAnxhbdtU/uwSV+
         ej3V+GvxbJss1krhj2WHr1rXy/HhhcqpOI60AaVLR5B860DA2pehiyLbVrz0iLtSvWpU
         qKWg==
X-Gm-Message-State: AC+VfDxn8pAnObh3ygjtaKY+7AHsvsfK88KEsTGe+WhMhVujAstIxf15
	kjNrdctI7/pn6NxseSObLiZW8w==
X-Google-Smtp-Source: ACHHUZ5cQ42qHvVOqN8SowGOFbhQIKbt++HSzmLWu/muSBA0/EWR8inOOqpqrL0YmzJHQxzE5J00uQ==
X-Received: by 2002:a17:902:a38b:b0:1b6:92f0:b6f5 with SMTP id x11-20020a170902a38b00b001b692f0b6f5mr7242972pla.14.1687444781930;
        Thu, 22 Jun 2023 07:39:41 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id ja4-20020a170902efc400b001b55fe1b471sm5473292plb.302.2023.06.22.07.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 07:39:41 -0700 (PDT)
Date: Thu, 22 Jun 2023 07:39:41 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 07:37:29 PDT (-0700)
Subject: Re: [PATCH v2 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
In-Reply-To: <20230621072234.9900-1-alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-8d50653b-2461-4020-be8c-be0b9afc6cfc@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_073945_028118_E3DBD654 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, corbet@lwn.net, linux-doc@vger.kernel.org, songshuaishuai@tinylab.org, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Jun 2023 00:22:32 PDT (-0700), alexghiti@rivosinc.com wrote:
> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  Documentation/arm/uefi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/arm/uefi.rst b/Documentation/arm/uefi.rst
> index baebe688a006..2b7ad9bd7cd2 100644
> --- a/Documentation/arm/uefi.rst
> +++ b/Documentation/arm/uefi.rst
> @@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
>  following parameters:
>
>  ==========================  ======   ===========================================
> -Name                        Size     Description
> +Name                        Type     Description
>  ==========================  ======   ===========================================
>  linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
>
> @@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
>
>  kaslr-seed                  64-bit   Entropy used to randomize the kernel image
>                                       base address location.
> +
> +bootargs                    String   Kernel command line
>  ==========================  ======   ===========================================

+Ard, who looks like he's the last one who touched this.

I'm OK picking this up along with the RISC-V doc patches, but I don't 
know the Arm bits.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
