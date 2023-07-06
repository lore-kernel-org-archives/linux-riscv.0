Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983D7EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EHgsFX0pCDxBcHNXfE33eK5Qp0k6Frc5IG3ZqObZn+s=; b=HreaOsO/MLLYjz4KUORGF0uKZy
	v8HVxXITDRekC5/F4ug9hdH9TKY/8IO9L/B4hBvXiQoIhSZWefrqkFEGGtZZYBFiScYLjEMWDz9sa
	9q/QyCo6aeYCsa9N3x629OqplaVZFRxGzxXaaXM9v9Oln0slVidVzpJKnt06SwwyfpKgeddtYqs0U
	IlGSXQfu66LaOk24sHIgouOmsSBz+d45I/p+231wbcLT00FIWXZoM67o2YvBNgMHFdxruxMvJq87a
	6VxXxDG06fPkp08eX6nX5giPh/yqCdLow6x8G/HZVN4zByVldfoU4nGM3GZfs5AjYoPWRCEfuUpUm
	SBvQPRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT23-002JiU-20;
	Thu, 06 Jul 2023 17:44:43 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT20-002Jgx-29
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:44:42 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55bc29a909dso576921a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688665479; x=1691257479;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfF1jRH7aHQy9FSffMrQi5NkhhBXF9P96GbSB0389a8=;
        b=U+JZ8OVOhUHhhceqKYWTVBrIHn6UtLeIEG6Q7nf4dC1UN8/pUjqmTW0y+BR+jwZbgx
         rtWGW9GC1DCMnq+KMhakuvIIZqotZE4sokbBgFKaDKJrAh4RRUAzCGtVRsVBJhNsxCId
         vfjVIGJT/VZOZSJ4dJ9V8F9r1+w87YjT41xnrbHdJwlLDbUBooHJzEP2nG8pNyLC+Fh7
         bowbcEMAGXzF5RXsm+1jFHA0q7W0y9O1fy4gqpZafyFzplTAgAe1xfqiGGkKLQM9yKcu
         X/n2C//6Zl7nOghlc7fhkHBfda++BManKZyDWhTiYIdptXLTS+Jux8nPcK3LJzLziWtD
         64Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688665479; x=1691257479;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfF1jRH7aHQy9FSffMrQi5NkhhBXF9P96GbSB0389a8=;
        b=FS6eCRtZItcBfr/XFo0DFdTvqSF3c3o1JisnrygX5dPmU7VUJbZuvJzJblshCE2fKL
         bxzqjb5zC33lCaKuh1ImCsenVOXxO/iQLB8qNioivl/pv41kUYsxkyy60ZHqRRyidxwn
         2qbIsBJsyqpkyqA/vUn3OIsYU4Mb4E6gELWnDqxv/Puo8aHfvB39FLj6/4sHr2J2mLKj
         bOs5oYcUus3sCFZ8DapL3++tZJq6BCQ1m1LRj3mPqzq3YQyGdPiIjRRUP8NvYyjorfEg
         xvwdEnDrIu+l7QeDFU9n5wneeq6Czs9sD6kF1PkIVThIfLNvBslgg9BzGtPjQe6+9MEf
         gAhQ==
X-Gm-Message-State: ABy/qLa2u79DgQVDOISt3z3r9oCQBCB7Dvduem7ww/FwNJmOoafa7I37
	RIeJhG3pK148LrjfIdi6ufAFOg==
X-Google-Smtp-Source: APBJJlGpz76Tp+WAN3pXir1S2kWCrsdFR7fMg40AiERweMiTin1jjRYi/Gqve0X/5P7NartrS2YMSg==
X-Received: by 2002:a05:6a20:497:b0:125:5bf3:f62f with SMTP id 23-20020a056a20049700b001255bf3f62fmr2257182pzc.8.1688665479149;
        Thu, 06 Jul 2023 10:44:39 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id y20-20020aa78054000000b0064d45eea573sm1545943pfm.41.2023.07.06.10.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:44:38 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:44:38 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:43:38 PDT (-0700)
Subject: Re: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
In-Reply-To: <20230626143626.106584-1-alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com, corbet@lwn.net, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <mhng-d434d878-03d5-4962-88fa-7fb0a72cb983@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_104440_700268_ED63188B 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Jun 2023 07:36:24 PDT (-0700), alexghiti@rivosinc.com wrote:
> The bootargs node is also added by the EFI stub in the function
> update_fdt(), so add it to the table.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
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

I remember having said this somewhere, but it's not on lore for this 
version.  This touches Arm stuff, so I'd prefer an Ack from someone 
before touching it.

Also: it looks like this missed e790a4ce5290 ("arm: docs: Move Arm 
documentation to Documentation/arch/").

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
