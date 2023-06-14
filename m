Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586CEEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=y98SNQEUUFE3cL/GlHbTZ/H4yPTcYEDSDykNBbYDurc=; b=smEwtISGUoQ31U0PymT9c5E0lv
	CLHLSVFAFMsK5n03Fine72w5kqwPXff85QaasT2KLfhUiEt67SOBh//2wM4Xl62DGWXtWh603x8da
	XLRy3XoVmIhCJc2WJjEoUPMB4fWgmfisUB1ge5hp1uZn+2JTiCqv67PPVN21BwOkf2isvDhGgG0Xz
	oWpbB5hWt/ME1cKZcTYQDiZtWVoW5HCXA+GXk+sBnqO+fpkVvA6KYidD67k85QiYcuHZodlueLcW/
	EyMy0g1gAZrsWvLztTP4dadKEkjl3jpeFHy5wCD/P5j/OnJ8knZF1yk46RD4fNXHKo7S1L/KOO5CX
	AIlGVhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RoJ-00BxDK-0F;
	Wed, 14 Jun 2023 14:49:23 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RoF-00BxCD-3B
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 14:49:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1b3b3f67ad6so36532315ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 07:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1686754158; x=1689346158;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKRPE21e3VYfChpFhohDRbV1xWyVB/8sEvcGY/fQRtY=;
        b=StLoc1kVQd8T9vYMLq0d7MyCHvxTL+0SIFZNTaA2rIaV3Q3TxJP1T2XFTGwcKZ7Bso
         bjLkgFqON00qrD7vOcMG2nwP2tUTvOQC4Qz+ruaJSoRXbMJ8zekx905259Ej/nz/EsDh
         ppaseEAxZUyq3/AJ/WiMvkfPVXRbf8FWxpP33b0SXtob2sIropYCCwdhc+4pBSpIR7Hp
         do+JfGRUQu+3phZg888rY2sShfFKoC/S+D6mwXll2Km/ak94SKgD02sGR4eBQRi1q5eU
         0uKI5zn0olHna/hKqL7AjcqQslXL5DgkUMsAAcmPmvkqOMBYQ3pjbXd60iDL6i/lfIfm
         xbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686754158; x=1689346158;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKRPE21e3VYfChpFhohDRbV1xWyVB/8sEvcGY/fQRtY=;
        b=DSRzPU66jEaDWx6G9SqJ2G4b4kHgTImljWkz7UPti8ssjelJ9nbxD2yRaHjRweIH21
         HDmvWlf+VYH4Vm5i5ZhAl4YCxiQhdXmK2Ua0ZYGdkacD2VjbxKCIZG3NJW/fCoi6Ppol
         7kwEtAHb8Cgtn7WbEHHo6hTWAKVOGzJAoVhwfv0Dgi30a5oAElRASS+jpB++kSwT7C0H
         usylXfglShazWmHgIlXfIwGNjXzG/sySbtwsu3hjZ4AtBinhumuo681YEjHZt5WXiwBp
         Tl8vPlGiiS2dW9FGEF8AWXMNcfU+HfK28EOenZGSNK3f1XikH1sm3INY0MGMDVTAhK2a
         5g2A==
X-Gm-Message-State: AC+VfDzYIzFFwcbS/cAS2Jm6GYhzBZ4hO4cnBE+FvrVViKKSkpPddBLt
	HJDiKHApHkvcvH8Pgp9G6wzbSEKad5Dwv+Edng4=
X-Google-Smtp-Source: ACHHUZ76y61nmrxgu/6Uj1VU/Fx1+aYmcHGqSELnwIIfd1gkpGJDnTmM8AnZnj0eFQIjXvfyvmNj0Q==
X-Received: by 2002:a17:903:32d1:b0:1af:cbb1:845 with SMTP id i17-20020a17090332d100b001afcbb10845mr16027525plr.16.1686754158383;
        Wed, 14 Jun 2023 07:49:18 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id bi8-20020a170902bf0800b001b3d7205401sm5552790plb.303.2023.06.14.07.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:49:17 -0700 (PDT)
Date: Wed, 14 Jun 2023 07:49:17 -0700 (PDT)
X-Google-Original-Date: Wed, 14 Jun 2023 07:49:15 PDT (-0700)
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <20230523165502.2592-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-4483745f-f356-454c-8c2a-5f0e5b6c9739@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_074920_024633_013C4A3B 
X-CRM114-Status: GOOD (  19.46  )
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

On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
> When trying to run linux with various opensource riscv core on
> resource limited FPGA platforms, for example, those FPGAs with less
> than 16MB SDRAM, I want to save mem as much as possible. One of the
> major technologies is kernel size optimizations, I found that riscv
> does not currently support HAVE_LD_DEAD_CODE_DATA_ELIMINATION, which
> passes -fdata-sections, -ffunction-sections to CFLAGS and passes the
> --gc-sections flag to the linker.
>
> This not only benefits my case on FPGA but also benefits defconfigs.
> Here are some notable improvements from enabling this with defconfigs:
>
> nommu_k210_defconfig:
>    text    data     bss     dec     hex
> 1112009  410288   59837 1582134  182436     before
>  962838  376656   51285 1390779  1538bb     after
>
> rv32_defconfig:
>    text    data     bss     dec     hex
> 8804455 2816544  290577 11911576 b5c198     before
> 8692295 2779872  288977 11761144 b375f8     after
>
> defconfig:
>    text    data     bss     dec     hex
> 9438267 3391332  485333 13314932 cb2b74     before
> 9285914 3350052  483349 13119315 c82f53     after
>
> patch1 and patch2 are clean ups.
> patch3 fixes a typo.
> patch4 finally enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION for riscv.
>
> NOTE: Zhangjin Wu firstly sent out a patch to enable dead code
> elimination for riscv several months ago, I didn't notice it until
> yesterday. Although it missed some preparations and some sections's
> keeping, he is the first person to enable this feature for riscv. To
> ease merging, this series take his patch into my entire series and
> makes patch4 authored by him after getting his ack to reflect
> the above fact.
>
> Since v1:
>   - collect Reviewed-by, Tested-by tag
>   - Make patch4 authored by Zhangjin Wu, add my co-developed-by tag
>
> Jisheng Zhang (3):
>   riscv: move options to keep entries sorted
>   riscv: vmlinux-xip.lds.S: remove .alternative section
>   vmlinux.lds.h: use correct .init.data.* section name
>
> Zhangjin Wu (1):
>   riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>
>  arch/riscv/Kconfig                  |  13 +-
>  arch/riscv/kernel/vmlinux-xip.lds.S |   6 -
>  arch/riscv/kernel/vmlinux.lds.S     |   6 +-
>  include/asm-generic/vmlinux.lds.h   |   2 +-
>  4 files changed, 11 insertions(+), 16 deletions(-)

Do you have a base commit for this?  It's not applying to 6.4-rc1 and 
the patchwork bot couldn't find one either.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
