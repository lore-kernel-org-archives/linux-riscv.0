Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564E3CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atzL94Ow63iZOZgKRXuC+HWghoyJUxvtWgObceVtV14=; b=38cqulYQvnotP1
	XyCAgA48pcwNzRtcS8WIF1eRMXYKtzADcUl1oORqc1Xi4/jGHE2QanXColsdIwvuTYbEdOxZeDbL4
	9QbsiUMbR9/DqgdNNiKe0OA9yyGcw/iPTOUumqoQL/mRmKAuAphZs6gPqGKVS6pFeYZQPljMbSHuu
	i5ic9HOJ4AijpgdK68jnBuf3iZ94KL3FB4TBw/0UDiUrfxLoQEniZ1eQyC1AKzPjbeEYK8sjuFLen
	97mUXmN5GMUeDtY77/kwsxbJDxXBotFsDFyqbgxT3S65Xuw5qzCXLImV1262dAK0ryB/BxpMwIzyE
	SAIgA7xWrzDTdoNi0bfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pAY-00000008gVJ-3Hd0;
	Fri, 17 Oct 2025 18:27:14 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pAW-00000008gUs-2hVV
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 18:27:13 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-93e7ece3025so35256939f.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 11:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760725632; x=1761330432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNxjbIp2uda5WQ4pTQ8EgPO5FziDgnqGNc1U0Yv3L2U=;
        b=arQE3YsKbDhAhuSqDi9EH3Y5H5r2BN63qAMGcFvaa1pkow/8DXJdQZL3FJdyXBU1il
         LuvleMIs5fJurZvbfJNjjYwZZfyCS4ikaHAW2m0dNOlEqxXERxqIHkcJ/LatAWu/QgDd
         cJ7NS7J0UQS0yuKarQLPps5qysj8tVmfiVEMkhzVtSpnO8Dcj2zkX4iIq37l5WrkrxmW
         RCDRBZc/ME3yB1idYrgy1zS3+qbRn5f9aRUA0wMv+71OTSLj67Z/Jx0rLxa8+Ck4I6ZY
         +UxbQUuCyzAInkIEcXM85xTAlix8I5+dnCwkUatejAaI9GFJX7Ex2uwX7PFV8rg9PNwH
         Zpow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725632; x=1761330432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNxjbIp2uda5WQ4pTQ8EgPO5FziDgnqGNc1U0Yv3L2U=;
        b=BPgyV3R+BVhLskmS4rR9zASlXMm9Yg2uTq0QISXqXviDWin1KzaA+rs2OiRQgylSlg
         7xp3d7mMKezgLcBQPho55t9/iIVwwfGls36rt9KV+12tpsADDle9KR8IhRiHqYFcmD14
         cli7rPcDMqVO+egTSHD7fcK12TJmJzyORNWM3fOap7bSchj8hxtcEKNNR7w0eVqei7wz
         Mtfs/5VT9M8MDBpJW5TC7ZRU2LTdoVZ0mR4opCH+Y6xQQZC3V+5RVQCQHvzgOh7yFjVU
         CUzMwKXcLk1koFG2nBnpX25EchG1NXrLTxh2mi5+YH7h4/0rYN1Aw1IG6HzDHL4qOjzQ
         MKmw==
X-Gm-Message-State: AOJu0YzEmkMK9W7tm1D6kGGEb+tuYh19sFwaPN37Hr2NbOJ2qGWJTgej
	yUXBQomvdVXfdeFoDefAzJfs7U6BWKe26L05TBccFUjvTad61n3wvETcYETBarFGQho=
X-Gm-Gg: ASbGncubDef+4RjvzPlnTZsCYhl3UiCOL5MIaK8d+4KZU2eWfKwPkFqnf4PAhF/O4y7
	fVEwCaHbwkIEp1gGgI9q0a7ek4PpPP5E9ltyrA8fuLfCU5QYjqj4A5o/hqyrQkFyCdGMJDwEPk/
	92Q4Aph8PKWrnQUFhRCOGOpoRw6jn3vhgOk+jAXDGYEBhAT5SvkyWk6kk/TFWWPmgM5pHVe9cgt
	87abGfTJUH0yGz2QeO2rzhUZFiHC74z2YLcid2jbw5x3L07RAYZTN9QaCJFAwp6DJLw+v5V85YX
	dwYARc6y7ReeJhu/7tVv5reA5DBvsaQStXdOt2GUFTmVWcMa10KEBSR4X626YJ4PDIlDYNilO8a
	/KPJE7O5EB+7e82GHycT1i0kTd+SQoqP/QNUkDqvcpP6sT8nNUZIf+DxCg9wF4w6hVtNipQmUI+
	FLeqZ+ssyJ7uSu
X-Google-Smtp-Source: AGHT+IG/l5DfNJjWVnOVGnQMrkwv1D/4nxp5BRhHYfzVn7XZlm5jmughQqdYk4b72q/3SoSKXekE7w==
X-Received: by 2002:a05:6602:60c3:b0:887:690b:2594 with SMTP id ca18e2360f4ac-93e7543d9e2mr881639139f.5.1760725631532;
        Fri, 17 Oct 2025 11:27:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e866f5e59sm13795939f.23.2025.10.17.11.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 11:27:11 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:27:10 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [PATCH] riscv: asm: use .insn for making custom instructioons
Message-ID: <20251017-cc34e15526ff6f64e4dbdfcb@orel>
References: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017165527.701934-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_112712_686944_6C56D10C 
X-CRM114-Status: GOOD (  17.39  )
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

On Fri, Oct 17, 2025 at 05:55:27PM +0100, Ben Dooks wrote:
> Using .word breaks with big endian builds, making something which
> is not a valid or worse an instruction or pair that does something
> which is not intended.

The motivation is no longer for big endian and, since big endian
doesn't require AS_HAS_INSN, is never really could be without adding
that dependency. The commit message should be changed to point out
that we want to use .insn when possible because it provides validation
and allows mapping symbols to identify the words as instructions.

> 
> It would seem sensible to add an ASM_INSN() wrapper for anyone to
> use for hand assembly of instructions.

This sentence isn't necessary.

> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/include/asm/asm.h      | 6 ++++++
>  arch/riscv/include/asm/insn-def.h | 8 ++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 8bd2a11382a3..c92f0ff51ffa 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -12,6 +12,12 @@
>  #define __ASM_STR(x)	#x
>  #endif
>  
> +#ifndef CONFIG_AS_HAS_INSN
> +#define ASM_INSN(__x) ".4byte " __x
> +#else
> +#define ASM_INSN(__x) ".insn " __x
> +#endif
> +
>  #if __riscv_xlen == 64
>  #define __REG_SEL(a, b)	__ASM_STR(a)
>  #elif __riscv_xlen == 32
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index c9cfcea52cbb..35b5024db0fc 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -256,10 +256,10 @@
>  	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
>  	       SIMM12((offset) & 0xfe0), RS1(base))
>  
> -#define RISCV_PAUSE	".4byte 0x100000f"
> -#define ZAWRS_WRS_NTO	".4byte 0x00d00073"
> -#define ZAWRS_WRS_STO	".4byte 0x01d00073"
> -#define RISCV_NOP4	".4byte 0x00000013"
> +#define RISCV_PAUSE	ASM_INSN("0x100000f")
> +#define ZAWRS_WRS_NTO	ASM_INSN("0x00d00073")
> +#define ZAWRS_WRS_STO	ASM_INSN("0x01d00073")
> +#define RISCV_NOP4	ASM_INSN("0x00000013")
>  
>  #define RISCV_INSN_NOP4	_AC(0x00000013, U)

Other than the commit message changes, the patch looks good.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
