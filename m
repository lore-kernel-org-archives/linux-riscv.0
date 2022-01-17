Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD14C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 16:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNNyYXpf+C61i3R0cj+YiZx/KwMZsfePfNQGaEMyW9U=; b=R6U+9zFhthYdiC
	x4gA1D4k/Tg6/vUcgESC0UUPaHmnys2K0lHb2f916vNT/jVRZZZJUt0X8dEQsP0FQifIcBGyNer9C
	X5fhyrSimZsVNGlWn57l7kMYoRLtNWrEDaZhvikMecJ85MsgXEdUX2oRo2DVcEz4fx0ydR/J0YZ7y
	3wmoWccV6Go6DsZt0tTRmwly1lIrG9UHUR/hSui411fd3YCZPzeusqiTMp3ExA/MOPDTVZpa+EjjV
	6xCtTI19ghmGZBLIbom+7cKt6L8Dna8n9naxcgeysv1uiexnYxFcqUTUqDFk8JElk55SNObpipHV8
	IZ5Qz9YxwU6wFxsfqQpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9US9-00FWSv-BT; Mon, 17 Jan 2022 16:01:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9US6-00FWRR-7t
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 16:01:51 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 c126-20020a1c9a84000000b00346f9ebee43so577506wme.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 08:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PDB6ZPHKwe/hrqwhjvJ+lqedINeLilxIqWASb1lAKsI=;
 b=aM4VrHnZjsUNZ86EZ70fZigXQD9zdi2m4OqvA1hZllwluURgPkWQ8/P43mpv32ifER
 TI62GnFfyvXNR0M40oTGJlmA9Se7kbEdjTfIXzR03OQRq7edFsUq9JdaCuzmW9at+jJU
 7sNSrnpTFW7T8TSihE/9MxWj93vPZTGCZqik2UDfveFm+KfZqiNk+jBd9JLYSeIpnPzP
 1m4GCkrjRhESFUJSELNUpt68nnno6W+wgiSOQCFZTEMEQRHmMMe0IWOVnLLGnKd/goxO
 Xavmc2HENOCGBBoD+6okmM8THXG/7YsUnPxsNiRfHBYhpmKyR8oJX/DUB8YYvpMPrQI/
 22/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PDB6ZPHKwe/hrqwhjvJ+lqedINeLilxIqWASb1lAKsI=;
 b=DH3mefeTjcMGkq8Y/LAZrC/TBswHkJHxX5TDuju9wOq95edHTFupQKuG9Ln7jf5A94
 83Qj+5yr3oKhiYM9pLFHLkyHqFL3PeYm4BWWoe3lkfev/0C+dLPr6SIN4tMtOOm8NK5X
 TKK6eoYYv+Q5fmBAL4XtxOXF9lxWJf7UUv92hUL97bfqECtWCDHpJfhG3B3IQW9Hsjsz
 D5RqmpYkkwDMfpo0kEY/GHQ6tkRHQjF35S2irHgo86Nd2qc0/s6NfNY4t24XQdnuxg9r
 DgVyT9Zco9ROZxnXPlkApXUiFQCSx0fUjWeuei6mOl1Tgl0HIHPpP0m8ppjX94ZtBDZf
 lwaw==
X-Gm-Message-State: AOAM533lWx/hLdXlCAHZizmBQwq1pk02lhRxCY3XlrQGN8EbXeE6BdKt
 pAG2WLcCeA1WlPZq9miuRd/oYFeJiXCT9Sd/D9TVTw==
X-Google-Smtp-Source: ABdhPJxByHzLGB6dnZw9C3tyzWLClUbQFe7uPPVU11CNLm61xcUez9IRDmLOmL7g5c+giSDBct6MIrOtZ7FswfM6Zm0=
X-Received: by 2002:a5d:584e:: with SMTP id i14mr5513557wrf.690.1642435308432; 
 Mon, 17 Jan 2022 08:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20211225054647.1750577-1-atishp@rivosinc.com>
 <20211225054647.1750577-3-atishp@rivosinc.com>
In-Reply-To: <20211225054647.1750577-3-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Jan 2022 21:31:37 +0530
Message-ID: <CAAhSdy0Ja4HaHNvRL-bwJZTiiiFaP6M9d5m4ffgtZRgTmq9jvg@mail.gmail.com>
Subject: Re: [v5 2/9] RISC-V: Add CSR encodings for all HPMCOUNTERS
To: Atish Patra <atishp@atishpatra.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_080150_310841_B84CAAA0 
X-CRM114-Status: GOOD (  11.51  )
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

On Sat, Dec 25, 2021 at 11:17 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> From: Atish Patra <atish.patra@wdc.com>
>
> Linux kernel can directly read these counters as the HPMCOUNTERS CSRs are
> accessible in S-mode.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/csr.h | 58 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 87ac65696871..e4d369830af4 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -89,9 +89,67 @@
>  #define CSR_CYCLE              0xc00
>  #define CSR_TIME               0xc01
>  #define CSR_INSTRET            0xc02
> +#define CSR_HPMCOUNTER3                0xc03
> +#define CSR_HPMCOUNTER4                0xc04
> +#define CSR_HPMCOUNTER5                0xc05
> +#define CSR_HPMCOUNTER6                0xc06
> +#define CSR_HPMCOUNTER7                0xc07
> +#define CSR_HPMCOUNTER8                0xc08
> +#define CSR_HPMCOUNTER9                0xc09
> +#define CSR_HPMCOUNTER10       0xc0a
> +#define CSR_HPMCOUNTER11       0xc0b
> +#define CSR_HPMCOUNTER12       0xc0c
> +#define CSR_HPMCOUNTER13       0xc0d
> +#define CSR_HPMCOUNTER14       0xc0e
> +#define CSR_HPMCOUNTER15       0xc0f
> +#define CSR_HPMCOUNTER16       0xc10
> +#define CSR_HPMCOUNTER17       0xc11
> +#define CSR_HPMCOUNTER18       0xc12
> +#define CSR_HPMCOUNTER19       0xc13
> +#define CSR_HPMCOUNTER20       0xc14
> +#define CSR_HPMCOUNTER21       0xc15
> +#define CSR_HPMCOUNTER22       0xc16
> +#define CSR_HPMCOUNTER23       0xc17
> +#define CSR_HPMCOUNTER24       0xc18
> +#define CSR_HPMCOUNTER25       0xc19
> +#define CSR_HPMCOUNTER26       0xc1a
> +#define CSR_HPMCOUNTER27       0xc1b
> +#define CSR_HPMCOUNTER28       0xc1c
> +#define CSR_HPMCOUNTER29       0xc1d
> +#define CSR_HPMCOUNTER30       0xc1e
> +#define CSR_HPMCOUNTER31       0xc1f
>  #define CSR_CYCLEH             0xc80
>  #define CSR_TIMEH              0xc81
>  #define CSR_INSTRETH           0xc82
> +#define CSR_HPMCOUNTER3H       0xc83
> +#define CSR_HPMCOUNTER4H       0xc84
> +#define CSR_HPMCOUNTER5H       0xc85
> +#define CSR_HPMCOUNTER6H       0xc86
> +#define CSR_HPMCOUNTER7H       0xc87
> +#define CSR_HPMCOUNTER8H       0xc88
> +#define CSR_HPMCOUNTER9H       0xc89
> +#define CSR_HPMCOUNTER10H      0xc8a
> +#define CSR_HPMCOUNTER11H      0xc8b
> +#define CSR_HPMCOUNTER12H      0xc8c
> +#define CSR_HPMCOUNTER13H      0xc8d
> +#define CSR_HPMCOUNTER14H      0xc8e
> +#define CSR_HPMCOUNTER15H      0xc8f
> +#define CSR_HPMCOUNTER16H      0xc90
> +#define CSR_HPMCOUNTER17H      0xc91
> +#define CSR_HPMCOUNTER18H      0xc92
> +#define CSR_HPMCOUNTER19H      0xc93
> +#define CSR_HPMCOUNTER20H      0xc94
> +#define CSR_HPMCOUNTER21H      0xc95
> +#define CSR_HPMCOUNTER22H      0xc96
> +#define CSR_HPMCOUNTER23H      0xc97
> +#define CSR_HPMCOUNTER24H      0xc98
> +#define CSR_HPMCOUNTER25H      0xc99
> +#define CSR_HPMCOUNTER26H      0xc9a
> +#define CSR_HPMCOUNTER27H      0xc9b
> +#define CSR_HPMCOUNTER28H      0xc9c
> +#define CSR_HPMCOUNTER29H      0xc9d
> +#define CSR_HPMCOUNTER30H      0xc9e
> +#define CSR_HPMCOUNTER31H      0xc9f
>
>  #define CSR_SSTATUS            0x100
>  #define CSR_SIE                        0x104
> --
> 2.33.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
