Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EBCE7D0D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=o+oYl9VCjbhSw/v4JtMTQDls36aCZURv6lHNHzBW4AY=; b=xJBrLLX7NsMTauezAQjQ0gV68c
	XNQft4ctikVjoS286fWd2giMFEMMs1R5NExdRij/0kI2t9O0i5YpD/cPmJ+CnK1yOldcFQfLkOjZI
	NUeDYEfEixUH6bBJB5869hFveef58wpsidPAGNoQGb22vsCQGByfqxcpcB9ZnGh+jFrY9aIt7N9EO
	7hRBrDfxIVtyErTEdc/D5SLub35t//wJ7cYtL05erl4HKt0PK1nus4A47Y4Asu0dBXNeHjVtnq1Qe
	1xSZLy9iemvjbPqVAHL5X504dV07RmvkHiO7tKhsiuk3stpLcgjh7tfumtnVoZAXkP3NXqg8iSrNB
	BDbPaKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svaY9-00000002Q7j-15bI;
	Tue, 01 Oct 2024 10:56:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svaY6-00000002Q6j-0YoS
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 10:56:12 +0000
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0BDFC3F690
	for <linux-riscv@lists.infradead.org>; Tue,  1 Oct 2024 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727780168;
	bh=cffy+Z3VyDZ30QrCrVDSHqUYHPJ52fzEBS/6c6EOh0c=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=r03PK/OLI2Us2AI55YZYoJU0gUrdB7EoA5AYTzXmXqdx+xZuZRHqhiFAoessagcgt
	 Hu2i8Ltv/k2K4gPjaLWq1aTIAH2Ca7d00elMw3zvapMA1/pAGPnQ3EdoTMcLw2YAvs
	 +1yZ2TpBsIL+AfY7Z/OETcWlt0QNVIGg7Wfjl1pgouHWaJSqP1m2Fl0MZcaCsuYPtq
	 e464h+J/DYRMVBgzS9ObSbV3vfaCTNyHRiSO1Ddy8G5y7x9Kc/G0L4ZZM4NcCJDbx0
	 UeBTwuV8in3C6/3SQUySltkha6EZlA/lMw/If/7Hr/AGZFQUlsfjWs3wr4K7z1PZcb
	 SXuH6ZyvV5E1g==
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-286efde9783so5251183fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 03:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727780166; x=1728384966;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cffy+Z3VyDZ30QrCrVDSHqUYHPJ52fzEBS/6c6EOh0c=;
        b=MBa4vtuiCIyOeR2IaqAebwuemAuelJ07qmam9j85wcfUOpY5odZ0MTZ0D/wa/MzZA0
         7fSdqndk9njqq7igxdIuAbFEkoozArC16m85qlR91yeUn4fGsevz7Z7M0XCGMo+PEVmQ
         1dioOzFKwNI9wp1QgNzDe+myfdJzHs+cHGAXnhCbTnutlQS4vzOwBsCS5m6EBeOl4yCe
         mpBKgz/iyeOATaS9vY7ONW5X+efs+9wY+KQAvUcCTTCxAl4ByTAfzf/9/ej7HYbHiFk1
         GKCs2Rl2wOf+PR0qP9vtotu6zqAmPz86kbog4fF3mUjhUUVyyGtPNi48QmwTdL062J5I
         BTHA==
X-Forwarded-Encrypted: i=1; AJvYcCUaB6Y5xBOallFYulLQfyL6NxNORt8/LLvf6ZnWO6bkLegnwSfi1ZBl672zDxGboSzazj7J3n0nsgnFVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLmg+ohGROk6NGUIsC7kH9Izoqka1PXzIhB2rbWjpPyvkxtmpi
	BvpNJ5yS85OCNiyFYKD+g4yz3TWn7SdMaBWVMnoFcofs9CFTNAGfYM8PFn4iy4gfdvtEfgAafAr
	/H2CnPYHCW6TNznW188SgGSUKkSGSbiUMXW6zR3icI0Os00bhSB2jcx9zEaBTsHf/9goqosOAjB
	ikJ2PSjxGQAhbMhLNl0NIDR4FgFYiBmtrMba6YTYZjaphZ+yOqI+UtJnmC
X-Received: by 2002:a05:6871:546:b0:277:cb9f:8246 with SMTP id 586e51a60fabf-28710bb0f11mr9907411fac.38.1727780166559;
        Tue, 01 Oct 2024 03:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmdyej5fn4nmNuFbnZtzhPVlcamHO9/HtMZQ8zYXDL3DuuDTSynQ1mCkP4fB+TXeRzA2qPuc7jYD2cnz+Pels=
X-Received: by 2002:a05:6871:546:b0:277:cb9f:8246 with SMTP id
 586e51a60fabf-28710bb0f11mr9907391fac.38.1727780166205; Tue, 01 Oct 2024
 03:56:06 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Oct 2024 03:56:05 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
Mime-Version: 1.0
Date: Tue, 1 Oct 2024 03:56:05 -0700
Message-ID: <CAJM55Z-3fPh-qyb_dpaBH12ocV3yheR8Rentg2oz9jCVLAuJBA@mail.gmail.com>
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Ard Biesheuvel <ardb@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_035610_579060_D8996384 
X-CRM114-Status: GOOD (  17.48  )
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

Heinrich Schuchardt wrote:
> The IMAGE_DLLCHARACTERISTICS_NX_COMPAT informs the firmware that the
> EFI binary does not rely on pages that are both executable and
> writable.
>
> The flag is used by some distro versions of GRUB to decide if the EFI
> binary may be executed.
>
> As the Linux kernel neither has RWX sections nor needs RWX pages for
> relocation we should set the flag.
>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

Makes sense to me. This was applied a year ago on arm64:

  3c66bb1918c2 ("arm64: efi: Set NX compat flag in PE/COFF header")

..and before that on x86

  24b72bb12e84 ("efi: x86: Set the NX-compatibility flag in the PE header")

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/kernel/efi-header.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/efi-header.S b/arch/riscv/kernel/efi-header.S
> index 515b2dfbca75..c5f17c2710b5 100644
> --- a/arch/riscv/kernel/efi-header.S
> +++ b/arch/riscv/kernel/efi-header.S
> @@ -64,7 +64,7 @@ extra_header_fields:
>  	.long	efi_header_end - _start			// SizeOfHeaders
>  	.long	0					// CheckSum
>  	.short	IMAGE_SUBSYSTEM_EFI_APPLICATION		// Subsystem
> -	.short	0					// DllCharacteristics
> +	.short	IMAGE_DLL_CHARACTERISTICS_NX_COMPAT	// DllCharacteristics
>  	.quad	0					// SizeOfStackReserve
>  	.quad	0					// SizeOfStackCommit
>  	.quad	0					// SizeOfHeapReserve
> --
> 2.45.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
