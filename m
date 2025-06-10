Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B061C677C4
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PKi0FK+tDJgBJ6m1OZvLrzxIo8l3K35yCRsw5oM1/jY=; b=web+N/8GLOOQb/MyL9ETh7L8Ye
	IPceb1qgDZozlgOltk5cN/Kjfo3CdPnue++oSbqS+21RUi06NQonhR1xQIhwIwQj5hesLGugbpo45
	K96BDrIQhWKU5aewxtMpLHQGkBMSlQMgVfLZEYV0Qz9va/YaYlbm3xJdY25hKAZjN+/wyKlYMOIbw
	VikquC56YYa8qAwtAZwNJF3LH+MM4IhjvQ6xr9h74UtL5eJBWU30HbLB57cJf1vqj9MuZczWmAL/5
	pAsJA23dKVNzmyNW4vY5zd/lbV2DVc2BaJ8VqN+bhFMf4VB6s4ktPEQZsYkrtaBxApAlyPbgdYaPm
	+83UWL/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP8n2-00000008QXU-1xn5;
	Tue, 10 Jun 2025 23:54:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7Pm-00000008Cnt-42Sc
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:25:56 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b2fa3957661so2391735a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749594354; x=1750199154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vFz6mun+uYpuugiJ+s3Ifj5c4f1eeTX2hZ/twyLOLMw=;
        b=G/cEuEAotpO9Y0zvPVxFfigO3bZ+NMEbljqX5K+NiQV7FJn9Bl6SU6Kaos7dWa/En8
         WhJ+fWiPfD+bCxNzz8qlqSH8fZ8ZnD0RaBjt3aKt2G+Gplr6zY7qSOOOFUbaBHpa7blW
         f5nA8Bs23OC0rNwNd6xqbrPN37G81oJ7KDFfkSVWFN1rjbBiix1Td5XWm52inO0pAZca
         C/Bm94z95AVY7X6HoH6bdgArGjvT34HsarEQPR+nxlW+o9XTfLEdE+Nw27CS93m3rUN5
         H2ovQUx+qwDjVSdGYlWYUi5w2mT03ozIQ8MnThPe7PLTtanlj1pOFICfxPyiPQIWwvyF
         SWRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749594354; x=1750199154;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFz6mun+uYpuugiJ+s3Ifj5c4f1eeTX2hZ/twyLOLMw=;
        b=I5C7qMrK4zvzYbvVxSxopeBVnkKrVelWbI/rdgDSu3ugoCtIuCk+d7bPkSJHZNr7jP
         /KXFJXmr+BdXPubdgu52kJnV+KmrSx+VFTQ/k+jUgVh+9rAe0P3kS3iq5JPT/uwIgp1t
         AP1Qx3HJhgMzk8zKwJ8XEBhsek8q0/85EvW+ZI70ZftTQzAjp4yX9mmdWf+AVMLYHRmQ
         0/41kINCZO9fxN9tnU19EsR29idEJX1PftMZL6lJeyLMkZhrVL/KC/v1BLxZV7nDagzI
         gjmISo0vp2gRCU2/ABKjpoj8JtRiLeTqjm6dJsMLLphoQhiowYMhTUD7JDLZpFxqUz5E
         b+ZA==
X-Forwarded-Encrypted: i=1; AJvYcCUIdPLs2c3FBj8c40Z9g+53/vYVEd+8uaRg6EiciG6awyfguvS82wKu/d5x8WpNytX5nhMwnEh0yg++Xg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/I0EblPniegXmlEgh4N0o5iI235VFL3K6xVpEK7HxW4PNEwuq
	plkw/IS7sVEPgxCgR1YMS0EmhmHvZhhfsUL2+d2FNS7ipJSNB9aj4+SnuzNBOKjQkgc=
X-Gm-Gg: ASbGncuw1U1jzcZGRtAZLvEbc8yiX895YLm52oqAU/mbXZJcF853FXLMyzGWtUVrRwo
	B2zCnNjwIrGlGbJ9h1eORpKyMxGz+16mBjYRRtbRJLkqjpXy9ez5BylFecBBqT0VQC/Mhl0xQDN
	TBETJvlOrP9V9cGnLzmxyODa6AjETKxvVxLSZFlvo1qvoHsynrurnb+1jHL5DM9o5kBj1d3gTeZ
	I0n9KSgZ/7krCLb6U9ONslsozvle9a2f9UQ2i1Z23XOXjaLILyT4A/GVSPaEMvrG6leUEGgPus7
	G49maNIDYuHsCGYCCVN8GF9ss04OHQo7u2ZFF88YWskPejC9tbfCD/KhtINi
X-Google-Smtp-Source: AGHT+IHynsKdRvBN3oI9T3paL+PT9XlTomdzjUiaZnqBTmpFwlwV5yQgC4iGq19Rvnfsn48Yz8BXZQ==
X-Received: by 2002:a17:90b:540c:b0:311:df4b:4b93 with SMTP id 98e67ed59e1d1-313b1ea41c8mr550768a91.7.1749594353931;
        Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236034059b3sm75234975ad.175.2025.06.10.15.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:25:53 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:18:32 PDT (-0700)
Subject: Re: [PATCH v1 1/1] riscv: fix runtime constant support for nommu kernels
In-Reply-To: <20250530211422.784415-2-cmirabil@redhat.com>
CC: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>,
  linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE), cmirabil@redhat.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cmirabil@redhat.com
Message-ID: <mhng-25801815-A406-4521-8A19-2F2B5E7AB30D@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_152555_234283_7580C836 
X-CRM114-Status: GOOD (  27.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 May 2025 14:14:22 PDT (-0700), cmirabil@redhat.com wrote:
> the `__runtime_fixup_32` function does not handle the case where `val` is
> zero correctly (as might occur when patching a nommu kernel and referring
> to a physical address below the 4GiB boundary whose upper 32 bits are all
> zero) because nothing in the existing logic prevents the code from taking
> the `else` branch of both nop-checks and emitting two `nop` instructions.
>
> This leaves random garbage in the register that is supposed to receive the
> upper 32 bits of the pointer instead of zero that when combined with the
> value for the lower 32 bits yields an invalid pointer and causes a kernel
> panic when that pointer is eventually accessed.
>
> The author clearly considered the fact that if the `lui` is converted into
> a `nop` that the second instruction needs to be adjusted to become an `li`
> instead of an `addi`, hence introducing the `addi_insn_mask` variable, but
> didn't follow that logic through fully to the case where the `else` branch
> executes. To fix it just adjust the logic to ensure that the second `else`
> branch is not taken if the first instruction will be patched to a `nop`.
>
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
>
> Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
> ---
>  arch/riscv/include/asm/runtime-const.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index 451fd76b8811..d766e2b9e6df 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -206,7 +206,7 @@ static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, u
>  		addi_insn_mask &= 0x07fff;
>  	}
>
> -	if (lower_immediate & 0x00000fff) {
> +	if (lower_immediate & 0x00000fff || lui_insn == RISCV_INSN_NOP4) {
>  		/* replace upper 12 bits of addi with lower 12 bits of val */
>  		addi_insn &= addi_insn_mask;
>  		addi_insn |= (lower_immediate & 0x00000fff) << 20;

Thanks.  This looks reasonable to me, so I've stuck it on fixes -- I'm 
still sorting out some post-merge-window cruft, so it might take a bit 
to show up for real.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
