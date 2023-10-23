Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B591CDB474
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 10:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fgLP7kFDNrmtHWEYckC4lfJEZgDbuxaO1bPQysQOAdU=; b=ltLusSnA01HpJ4
	PLu7ZLdXemEC1VS2luLn2vCqTw4sby7XU5var4IH8yMo90Uy79CUN+0I1evspYimp2u3wu0Zxbfbj
	GrTyLnUrjXEho7djpzxrXAb0G3KdypnKrli58X/ghnvfoXVAbslo870hQ/Nmz2csM4S+ApEr8FtjW
	daM80Ks2jR/Z+NWsEqE/4JxWb3HOu7uZH6V3aaXsauzSVYTHBOi1ZG+7KKO37V6sL88Z/m93Wu9Je
	3d+IytP5Gd019iUlWSVOBZCJIo8Zbez6HstxZS5dr95MmupT5mf62JT7HflD7c3Q55dBs3hMLD2my
	xAgHdDw3UQK+nbt/GEjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurm9-006zI4-03;
	Mon, 23 Oct 2023 10:03:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurm5-006zHD-2F
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 10:03:06 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-53e2dc8fa02so4660715a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698055384; x=1698660184; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ip92rbHjEjBMgAx7FNr3A0maZqLC50ltIPpQtdwaJ28=;
        b=XoTXH7MeaycgjwIYfHv24pBVyp3PxWRPdi/chMfQoNFnuxgX8uwpMFm/qhA6RmgMME
         DIQoEM0U6Ey2+5nXBDQzZFmYARbmF/EhGA4y/Ju36NjMmnDPGxPx7ybZJhqiTRBWoT9N
         37swiJHFCvE8uEqFozPgC+eX+t3G7E7aSUG7TdG/nwbUZWv5G657Sdom6VjVg83D11YF
         RmTztw3hIVE803oJ1Kmroma6Q6fgCwz17UAVS28cVKPROaXFLtOr6vXp0iWUGEyucGgm
         2r8yiNDR1JUHFC5T1og6wy3SVXCzkRLKOSFiD/z89E/aAXTfkyouCEjuEoZ1QCZDwlEu
         pU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698055384; x=1698660184;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ip92rbHjEjBMgAx7FNr3A0maZqLC50ltIPpQtdwaJ28=;
        b=moYtvLspEndz4U82fOexUxMVEjL7lKusvFnwuL/ErpgNxsinyvdBS3/pIl6zaZ/3ap
         QZ1LnuUV9ShJ3GXcT2PmscT6ykOiutSpv72bXZdsgP0eRm6PoRk9URrdLQ+tAd/DITTU
         Uf/NXsb/sqLA8jz4QKe1LNAfV239HFsIl1mOk8Pz3QjSDge+VyjgoYC8QkdMD8KLrXag
         T9VtWtMPP28QFeyY/IdDblGdRQ/8AzHlzV7IeD5r3FKiwCNXNGM9sz3wisZWTOb824kU
         kIhBKd/IvpeaRyHQfSA6E5TTir0q71fMUCTPKMcBrCni1gUllHqYGlCrhvoRQuAlkm5P
         nwaA==
X-Gm-Message-State: AOJu0YyMUXe2lF6REaIcrzqkUD+br55Z2YAHWpO9bd5UGk/XeIkOTXKK
	GPnHNodqCV3A05/2ClvwEDjAoA==
X-Google-Smtp-Source: AGHT+IHbP1iRP01wtTj0lGIg97SfHpaSuq3jc10bBcdA9nz/72Ux0bRd2wnzPV3aAOMKFVCBoQdHEA==
X-Received: by 2002:a17:907:1b11:b0:9bf:d70b:9873 with SMTP id mp17-20020a1709071b1100b009bfd70b9873mr7388887ejc.39.1698055384364;
        Mon, 23 Oct 2023 03:03:04 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id p26-20020a170906229a00b009b65a698c16sm6401969eja.220.2023.10.23.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 03:03:04 -0700 (PDT)
Date: Mon, 23 Oct 2023 12:03:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 3/5] riscv: kernel: Use correct SYM_DATA_*() macro for
 data
Message-ID: <20231023-153a19dd516176d3d3b9334e@orel>
References: <20231004143054.482091-1-cleger@rivosinc.com>
 <20231004143054.482091-4-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004143054.482091-4-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_030305_735693_9B2A71A8 
X-CRM114-Status: GOOD (  12.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 04, 2023 at 04:30:52PM +0200, Cl=E9ment L=E9ger wrote:
> Some data were incorrectly annotated with SYM_FUNC_*() instead of
> SYM_DATA_*() ones. Use the correct ones.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/entry.S | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> =

> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 64ac0dd6176b..a7aa2fd599d6 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -324,7 +324,7 @@ SYM_FUNC_END(__switch_to)
>  	.section ".rodata"
>  	.align LGREG
>  	/* Exception vector table */
> -SYM_CODE_START(excp_vect_table)
> +SYM_DATA_START_LOCAL(excp_vect_table)
>  	RISCV_PTR do_trap_insn_misaligned
>  	ALT_INSN_FAULT(RISCV_PTR do_trap_insn_fault)
>  	RISCV_PTR do_trap_insn_illegal
> @@ -342,12 +342,11 @@ SYM_CODE_START(excp_vect_table)
>  	RISCV_PTR do_page_fault   /* load page fault */
>  	RISCV_PTR do_trap_unknown
>  	RISCV_PTR do_page_fault   /* store page fault */
> -excp_vect_table_end:
> -SYM_CODE_END(excp_vect_table)
> +SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
>  =

>  #ifndef CONFIG_MMU
> -SYM_CODE_START(__user_rt_sigreturn)
> +SYM_DATA_START(__user_rt_sigreturn)
>  	li a7, __NR_rt_sigreturn
>  	ecall
> -SYM_CODE_END(__user_rt_sigreturn)
> +SYM_DATA_END(__user_rt_sigreturn)
>  #endif
> -- =

> 2.42.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
