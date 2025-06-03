Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9F0C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNsLkIg3N9fMN1pjNVwm/iBAlAxltyYOD9Gr2sPjet4=; b=FIenPEQcvrushB
	TJn55tBzF9Asls6nzgfQiI/6PzjEC8CWVFcW+ALfD2RuJScQ+NP0Pc4sYexW7zKkBCGuH97xdrOBC
	tQIJ4HksaTC4MU8vlM56wWcwTdjTmFHgqCQBJTYZfUMT6a+jfI4qEcfIKt+dSRAFbVDn8OW517V9R
	9fKcKMoWPJKKvEkDg2WBXA99x8/DC3E/jsSj9X5fDfN4fZhrQWDdp3EvEeDjYywiO48EGn9FzxLQp
	d167lXMawDecGJJT2cngBg21BOHMiAz4oh+r8ognL3dsSlL8h2efL+UI1WLL/lim/kZLbLRUHy2Jg
	bS//9Gxx3X+vj+B243wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMY3b-0000000Blm3-1aSB;
	Tue, 03 Jun 2025 20:16:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMY3Y-0000000BllO-1amd
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 20:16:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22d95f0dda4so76019345ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748981779; x=1749586579; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+4T36HG1Ay2U7A28vnx0GjvwJ2y731asKEBmtS3CuKQ=;
        b=cc3AlbRN+A2Z/4Dls2js8hlQM/hOUaD4w70LNgwxBrCM7AY8732dyPIOflf6pan8sA
         PkxP941MatFOqBGKjFCY57iq74TkhHlwW7SD1esUCmjkh5QhxdHcn0UXOgR+PeDw6p+K
         E/pArV9i2P6FFCPAJTAOdolif2WcGRXUulZ1SlB3HCjE/0qKCnH13aO7PFXWi/s8qGXL
         U0Eyk+dB2bzlCSEewqI5X7dAWeDOZlKbm3DoD5uQANec8A2/3gx+ma5IY2mbiKcJ2t/x
         Uo/c0s2VPqrNkh6sfuCwECU6VGUTtWEEx3cSc8506XIO9xYeFBv7t640HlqYeoRPjVoS
         MADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748981779; x=1749586579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4T36HG1Ay2U7A28vnx0GjvwJ2y731asKEBmtS3CuKQ=;
        b=IAMNfH/MTnDJ0YVrQ/ai2d+f8HT5FqmB6obIf7ZYN5qJsP7gVnax5Ug1aqc/k7Dx8u
         ChQegRkifPzjIptr7ZTwSN9C6StDtzHZgbv6J9N1QPiBXIYVTem0b94FDm4t+qCJ2KsW
         oeQsEuPnfhN0Gdh+z65q+cqiZBdm7tzdPMMpdXunhjxCnC0sxs521k9nkRYBfxa6eZx4
         09CcwpSpiPNFRrXUClm2IEqxgmcO+VLrSKw7Nb5pHb4OlNr1vOZu3MDJMsELjjfbOHjS
         0To76QGHMgGkHKg3I3IuU2xntiWpDQZ+PwRPPA73s6UXJY6BqAc7WFgPsSczJOGnslH7
         Mgpg==
X-Gm-Message-State: AOJu0YzS9v6w2txDTsQqfcUygmB5Qc06yR/ZoSgAx7bEBvyBRwGTeZ4H
	yY03tur87yyB9P+NnQ+JZR+ER+k7IVE9QzPQ+gpWbKGi10ib5PewVtSVb50UUXKUn1rCPSjl3+n
	DddDjU4o=
X-Gm-Gg: ASbGncsOlgS3ou9g/zteVI+D+1YPdiZddWgcMIHj01OUZbcN+7r8BV/iG8wuZCZn0nH
	NpdgLCVG12Pc+rhG4UgIZ7pxGGXRcd/HslS4+WtjKHUcinqEvDStiOg8sOqb6BAeq902TzXVXJ2
	nKNkDlQAh/yTI/XtWEahhDzxDzLzYFH2Z7aiwTeP8UuJHZ30vDUT31QbdvLt4ekAUNy3RNHYeKS
	tI3gp4CIa5Js5TQG3jaiUaOnorsDNbrktkSFEVwpOd0L4EP7dAEpd5/QJxF/MF9X0/tybzale7T
	7oQgI4tjmMGbSskDV5PJkQU+oJbmQqDsvSjx04Ic0w==
X-Google-Smtp-Source: AGHT+IEUAAYpUp9FEj00Ak7+CbQc1Tk1NY4YiONzkTo3Dkz7cVwBansciZXS0ARqy/m2F07I822rhw==
X-Received: by 2002:a17:902:e951:b0:235:779:edfe with SMTP id d9443c01a7336-235e1255989mr1364805ad.43.1748981779335;
        Tue, 03 Jun 2025 13:16:19 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5249sm91153585ad.192.2025.06.03.13.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 13:16:18 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:16:16 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Documentation: Add enough title underlines to
 CMODX
Message-ID: <aD9YEOzbkcCdDrnX@ghost>
References: <20250603172856.49925-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250603172856.49925-1-palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_131620_420485_A01B1E77 
X-CRM114-Status: GOOD (  19.00  )
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

On Tue, Jun 03, 2025 at 10:28:57AM -0700, Palmer Dabbelt wrote:
> This reports as a warning in linux-next along the lines of
> 
>     Documentation/arch/riscv/cmodx.rst:14: WARNING: Title underline too short.
> 
>     CMODX in the Kernel Space
>     --------------------- [docutils]
>     Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.
> 
>     CMODX in the User Space
>     --------------------- [docutils]
>     Documentation/arch/riscv/cmodx.rst:43: WARNING: Title underline too short.
> 
>     CMODX in the User Space
>     --------------------- [docutils]
> 
> Link: https://lore.kernel.org/all/20250603154544.1602a8b5@canb.auug.org.au/
> Fixes: 0e07200b2af6 ("riscv: Documentation: add a description about dynamic ftrace")
> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

> ---
>  Documentation/arch/riscv/cmodx.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/riscv/cmodx.rst b/Documentation/arch/riscv/cmodx.rst
> index e009873b2d17..40ba53bed5df 100644
> --- a/Documentation/arch/riscv/cmodx.rst
> +++ b/Documentation/arch/riscv/cmodx.rst
> @@ -11,7 +11,7 @@ program must enforce its own synchronization with the unprivileged fence.i
>  instruction.
>  
>  CMODX in the Kernel Space
> ----------------------
> +-------------------------
>  
>  Dynamic ftrace
>  ---------------------
> @@ -40,7 +40,7 @@ pacthable function. The metadata is resolved at the first trampoline, then the
>  execution can be derect to another custom trampoline.
>  
>  CMODX in the User Space
> ----------------------
> +-----------------------
>  
>  Though fence.i is an unprivileged instruction, the default Linux ABI prohibits
>  the use of fence.i in userspace applications. At any point the scheduler may
> -- 
> 2.39.5 (Apple Git-154)
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
