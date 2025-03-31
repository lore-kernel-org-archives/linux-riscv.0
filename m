Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60238C3600B
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Mar 2025 18:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=1Ubo0vTfTgHn3g09DakQQBLJdSW6h5gaM2cLeVkDmks=; b=f6Xejm4VkrfFkpII3onhybE6xS
	u7ka/4cYkPPMgD6k3IBsGYKVOs3XusAZlBva3tq8C32AZQx/aHkxzVLEctHqKANyStQflgQEZdrP9
	RO7Rg6Hzmj5gbA1xsrHAn4E3CJAU6fmSa1CFbzwo5ZVcqy4jKiMf9TOvg3U20rvO3loe5Okq9itgE
	917oyd6LroADJylHu/0am7am+5zB3Y4pXthkLtwRqcNtoMpB84aQxFYe5/Mg9ko1WpGxu6gpcWC0d
	A7tvkyPXt7X8CxKpavklHvwEs60C7FESHncvq5/HPqUribmeKJmuBcKxvXLwp5TI9f9zSwst3OjEU
	6xE01AvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKHa-000000019u8-2sGP;
	Mon, 31 Mar 2025 18:54:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzKHX-000000019tT-0Bco
	for linux-riscv@lists.infradead.org;
	Mon, 31 Mar 2025 18:54:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22423adf751so87877305ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 31 Mar 2025 11:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743447286; x=1744052086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTVda1P252At+m8osJteKN1IA5m1eg7LV3r4D8xmaDc=;
        b=a1kR6YryWhc4jTwVw+My7IUo30yJNm7fUmRvt9q2OpNF8OZsUbgUdyrCNvgkL1FFQo
         ORsFdJQB699Ou6Op/H1aEGo930NPYVwZtJN0GIbmfeciU2WRh+jbE9EUdbS+aLMDOTXg
         8u51x4V3vNfg5Hcs1gQbqi6HrpzzRmAvB/iaDe6YEiRFbzZXhwUSWTurQ2zzhLNR9C8N
         qSzb+YcUYuh03pU24UxMxvmTRGeSwkvx9nm3fBj89kRGIVss6BIeD1IzUslCB06IlD4u
         ucOSommMfrBTtczhrnTxB9u/iqWesmm5e9/d1RsglmDHo7sAmf/hKiv5w6P2I87iRC8n
         4zSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743447286; x=1744052086;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTVda1P252At+m8osJteKN1IA5m1eg7LV3r4D8xmaDc=;
        b=KrvvXHP3EcblPKTP2kVOryaYQcFr9T1a+zDu8rO20fhjgQRyDH7ZOqIiNM3pXTAlyW
         iOkB0166BCKt6ev4wR6PEri1CKeyfgbz5vwf8i9UVgWbrRU2X0zGF7Nd7FjAt9C45rd0
         lCwc3KJiaCbDXRj8H7+iXSj/OOhhjHrGBSZTE+OLGp5e5w0V/vzzjNpN6h8v2JmAV9ef
         nitHFOlm5Bpt48u1Cjr0Nn2QFE5o+aSMRXosDGYGdx8VWtkNpQ5MnOFEHHlLRII9+Ak1
         te7ZSt56lJaGb8hfhcFIuQZ0iE5FnRp0M005+J6hIWVz0EwGKWlVspZl1lYKzeC2S4xc
         Fvyw==
X-Forwarded-Encrypted: i=1; AJvYcCVpMqjfqX4HDUDxNJw0Gi/DkP4qwLt6axMY6qNE4lNSlVCf8gp+1BGhWLoACYUFKGR3Qi+5xQz+A2DeiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXx4fyFSf8L44pvnyolAU78GAyGCiECiOEtkCb7knOLFNpdDWW
	xzSlKA9oFz7OxgL7JqD1vr8wj6wckpkIKYvIArnXRpvXhQ6kwCTIHZHVeBQ9A2Y=
X-Gm-Gg: ASbGncsE/yWUMJ+CskPBsB30gJE5/VF49Z5WDAUuLWvRwyLMEsfbsf81bozdoNMa1da
	76zLs1sqwtUNpSMAoEnfIfL9gsYrry0IB95qSt7bR08Uc3Ur1qI9wAkoH6BgK25cnS88PnGn7Uu
	qomRTHmVhQx20x1oaFu0SshTL8ICg7+4Au+YAXoOcxG/oFrcIZTv3fzVfGRMpp9ViM4TL6Vnyfy
	ep/r3Y61nqF8Ano4fkl+8uR6HwUODKgEkF+JHYt2lg+FlwZWlrcYPr6aLVMg9IxtKG/PWeCpuBR
	vp/Fml08hHel5IlcKBK88BSAwyqbFqEe9nUmrp8dNw==
X-Google-Smtp-Source: AGHT+IF1hRmDTAmef95Trsj63EDsH+36mRerL5rWu6aYssdZOJ08HOdEXIdFEQhqyXQ7iDu9IBfwrg==
X-Received: by 2002:a05:6a20:9f46:b0:1f3:293b:7aa with SMTP id adf61e73a8af0-200d12ff415mr420725637.4.1743447286022;
        Mon, 31 Mar 2025 11:54:46 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93ba0e532sm6701397a12.64.2025.03.31.11.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 11:54:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 11:54:45 -0700 (PDT)
X-Google-Original-Date: Mon, 31 Mar 2025 11:54:36 PDT (-0700)
Subject: Re: [PATCH FOR-NEXT] riscv: Add norvc after .option arch in runtime const
In-Reply-To: <20250331-fix_runtime_const_norvc-v1-1-89bc62687ab8@rivosinc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, klarasmodin@gmail.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Message-ID: <mhng-af57c321-9a96-4098-9eff-5feeccdeb199@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_115447_281650_F2AC2149 
X-CRM114-Status: GOOD (  15.34  )
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

On Mon, 31 Mar 2025 11:45:24 PDT (-0700), Charlie Jenkins wrote:
> .option arch clobbers .option norvc. Prevent gas from emitting
> compressed instructions in the runtime const alternative blocks by
> setting .option norvc after .option arch. This issue starts appearing on
> gcc 15, which adds zca to the march.

There's some clunkiness around ".option arch" and ".option rvc".  So 
this might be an assembler bug, but IMO it's sane to just work around it 
in Linux -- at a bare minimum it'll manifest for users, as binutils 
already released (and GCC 15 is just enabling the Kconfig that triggers 
the bug).

> Reported by: Klara Modin <klarasmodin@gmail.com>

There shouldn't be a newline here, I'll just drop it.

> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a44fb5722199 ("riscv: Add runtime constant support")
> Closes: https://lore.kernel.org/all/cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com/
> ---
>  arch/riscv/include/asm/runtime-const.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> index c07d049fdd5d2999c57d8a90e7363829c5462368..451fd76b881152919f22de8f5c56b51171acbf3c 100644
> --- a/arch/riscv/include/asm/runtime-const.h
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -56,6 +56,7 @@
>  #define RISCV_RUNTIME_CONST_64_ZBA				\
>  	".option push\n\t"					\
>  	".option arch,+zba\n\t"					\
> +	".option norvc\n\t"					\
>  	"slli	%[__tmp],%[__tmp],32\n\t"			\
>  	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
>  	"nop\n\t"						\
> @@ -65,6 +66,7 @@
>  #define RISCV_RUNTIME_CONST_64_ZBKB				\
>  	".option push\n\t"					\
>  	".option arch,+zbkb\n\t"				\
> +	".option norvc\n\t"					\
>  	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
>  	"nop\n\t"						\
>  	"nop\n\t"						\
>
> ---
> base-commit: b2117b630c48be69d2782ed79fefe35dcd192ce6
> change-id: 20250331-fix_runtime_const_norvc-407af1f24541

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
