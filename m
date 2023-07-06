Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584ACEB64DC
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=wtHtKlWmG1HPkF3WZY+I5fQGy0wKh/nhcdkLk1NHebo=; b=Xli9BwXb0Wv41JJvr0b3RTx15Y
	uN6yJZsbWxUP7nB8f1ga1KU1F9+NKdSz7l0YnqktwdtXINgj3IpMzlcPoCMSYo/S5vn9eg5bzE835
	SXQw92+SO4kyTTMSBT1uAcnCgHlOgk0Z7MdgANTHuLj11daMR1dtqjLXO6BVXUlFK82ZBQPDSD7zO
	tK+b/xTDdWOXe07nTYYbedAl0OKKI2+nNeklfCCQr/drX5amu/OTAINhR3yecW6KhdWNcCpHl3ivt
	m1grPAuBbLL1h/O6zrD8K+jUggCaaghRCZajQqpB+uSxBHgxx+PKB3Gae5tnQ56E28QVXOq2Gug6N
	UC1yU2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT2A-002Jl7-04;
	Thu, 06 Jul 2023 17:44:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHT27-002Jjb-0e
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 17:44:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-55ba895d457so590263a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jul 2023 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1688665486; x=1691257486;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfYRKCkv+gbg/zmvX1wLdSt8ijBVRQ6VquwWC9KA3kQ=;
        b=C4mwKsaMcsbSZodT7VZnm8QwFrJs06bzy388YbWZdogdsmfGt5LNIkaHBuTsGvIzIn
         A/GSyopYeSjDGTSgvQRL11tq239hkjmi1X1howOZZarXqZRoKZ4hM4qWIZcbPqaJdGSj
         7T40Z3nIvQobo8Ue2LW7YTfkLH+/YYbHgjHaGz3q6flKtnhcACoIDXKsgs15K71KP+Rv
         VbgjeQSk1F8SsiHUwET04wziTeKhZqGkj3O+SXuZHSH9hk3V5ZPf1e0hTqM9Js5Gt90x
         zrUXFsGhWjhm+0rGcLWpYTik0wLaW4W5JK763C7ajXyAJzviYKiljbnZIAkDLc83Duif
         RnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688665486; x=1691257486;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfYRKCkv+gbg/zmvX1wLdSt8ijBVRQ6VquwWC9KA3kQ=;
        b=aAfoiLtcl3IMLAa9PiS3EoSkJ6vsw0z1jOTTQ5dIAihfBZQkFWetVV9QQrwjvEfX6t
         Jxjx3E0E+6EMPEmbcMwvgsIebICT7ksX0ul8yDrgYhnuGo4SP8nl3zJRpmQcpXqcShix
         IT0ykDKjwo7ar9rvVoRWihTtFyu922c7apT800r0FpyjcOBa34jwivss9wK4d0TXWBae
         Ps6g6YHSak5N5gP47Pgkqi5hQrvyeeIQ2rUX/u894xfGYzi9SSC9PMGvxcQaZ6SVQw1E
         LICSEGfiWAH5JX1x7tQdnPG5sprYJqf+2embDKHJcW6mqTwgc11ihirBshfhgt3f0SUt
         YOTQ==
X-Gm-Message-State: ABy/qLYVbsqKX3AYwigE+4spIe6PZG37eoNuwCnv4AOWxl5b8MuhVn3I
	QO5Ybz+VZAXblz4Zy9ZprNhp6g==
X-Google-Smtp-Source: APBJJlFnomCmLEilYSJ1Ue2aIpvmBLQ2tQs0xQTD0WmZD/JaC91EmCyAZpiw2E/gPXgLu0l3eDpbiw==
X-Received: by 2002:a05:6a20:4284:b0:11e:e940:441e with SMTP id o4-20020a056a20428400b0011ee940441emr2424000pzj.25.1688665485725;
        Thu, 06 Jul 2023 10:44:45 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001b86deba2f9sm1678817plj.284.2023.07.06.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 10:44:44 -0700 (PDT)
Date: Thu, 06 Jul 2023 10:44:44 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Jul 2023 10:43:52 PDT (-0700)
Subject: Re: [PATCH v4 3/3] Documentation: riscv: Update boot image header since EFI stub is supported
In-Reply-To: <20230626143626.106584-3-alexghiti@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-b66ccc17-f397-47ba-8aba-2c71ab901f72@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_104447_238642_2AAEA83B 
X-CRM114-Status: GOOD (  22.22  )
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
Cc: aou@eecs.berkeley.edu, alexghiti@rivosinc.com, corbet@lwn.net, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, Bjorn Topel <bjorn@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, songshuaishuai@tinylab.org, ajones@ventanamicro.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 26 Jun 2023 07:36:26 PDT (-0700), alexghiti@rivosinc.com wrote:
> The EFI stub is supported on RISC-V so update the documentation that
> explains how the boot image header was reused to support it.
>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
