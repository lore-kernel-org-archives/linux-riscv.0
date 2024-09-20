Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F8AC7883B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 12:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dvIlcI+Ck/ySYxCNzp7iHebUp8p6xvbXNkbf/anF29U=; b=uhX/kR0qZFLeCxK+Y3bfUQi4SX
	f9N08YQsTz0URni1gktopakvBw3XHVYwvMyL60w9mbprqgDvFdAv7Qb/MOE/95XYN+tjSdA+9FP/e
	LtWjiD5NX82Z0yyJD+uiOOwDgatRTbhAUOSkrPgdifX2tRBdjeAR/m5b5dwhWqt5DK/YuOX8J1xFj
	nzpOBDMjANPYVHabZeRyxqCqqGadmSZGZ67PebzRM8pwbMjx00S3NLlc9bbm+tZeC37vB6j6x2VPY
	1gDHtws6A3tcnqReaXudANsFCYC3aNFYH0UbZ5MqWI1x6DrqFtMsiLD3vz2+mJio3rk5pX5l2J+nT
	el07SOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srdCQ-0000000CDPt-1vSk;
	Fri, 20 Sep 2024 12:57:26 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srdCO-0000000CDPY-02eq
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 12:57:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7191fb54147so1495570b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 05:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726837043; x=1727441843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0c3cLyg1YvGor2bDqxSzz6JVUFgRwHa9Wa4Or/oI7nI=;
        b=GdXkCL5ohnHTGkpExKj2iMRCrykksK9A7FARb11FyCNvQYN+WIOYaEs1IMqveLhms1
         S0rdqowEfW1X+xNuhHAskb3iauekBCai+5cNAtKQsKETbzQF7HNLQGiFlJSLvGw8jm0z
         7MdMLsxMABYtci8nvxEEiaLIp8m+pLdK6uFBNtItnUUrkHyaDfjjnVYezy6bjE8DF+fy
         xsvyNYaIos4cHgQHx2DHtmVFPZhT6JTVYeZ+ccPwzw088sADm5DkWmQT5oBwluNmyJXZ
         PfeNfzA81sSErtRCIKAC80LoAECYQvMvO7ixQnWNFN8FxObKkfeEneW7RJhfppUKSswz
         jQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726837043; x=1727441843;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0c3cLyg1YvGor2bDqxSzz6JVUFgRwHa9Wa4Or/oI7nI=;
        b=mSFwLH7FWD+XUPF4Mu2FMS2hy8swEztY72wMXfiWf9uyoVQNb2nKnfbuxWwPHMX1/U
         cMyLqHqFOOPpBC29SocmUShTMsFyISjHMyKKjRfUL+QgxLz5IV+32acSMqKhFNnvCfSM
         rujxtnv2sbt0Gg/iy2YifQydH3Xc0B+cydy1Wo3FEKah//DRiIyp/aTBlHWVxyEMegpm
         RDTLFCvkucPMaYBPWHpFjakWDiuKA4MAHM1kx8109/+2+niu4H2PXHMyUM62H48Rq7o2
         D8s9fb6W1dMvMsOA1A7QwEC5wB93ObSwtCRoSLTUJPr9B1sESDmRxt1J7Gbvg0PuwDEV
         ZTSg==
X-Gm-Message-State: AOJu0YwHo2tipf0gMarX/WabEIyFAuOcpNlwA3bOJTS2WH6WwFHXpWEL
	6+k0C2cdv4Hea0jifhYviBP/rv6uUzhJylPP1MYoKjqck59pBycMwArAEGei7Hz+EJLPgOM1XW3
	oLxmOaJnq
X-Google-Smtp-Source: AGHT+IFEcEmieepmhhCBAp9vyPOGM/uDpWpO0h0hkALABgjhyRBXGu+BM1BtirEkdZcOfqw0yZOT6A==
X-Received: by 2002:a05:6a21:398e:b0:1d2:e888:fcd1 with SMTP id adf61e73a8af0-1d30cb1c91cmr4192601637.33.1726837042650;
        Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
Received: from localhost ([213.164.21.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944a973bbsm9757320b3a.27.2024.09.20.05.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
Date: Fri, 20 Sep 2024 05:57:22 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2024 05:57:09 PDT (-0700)
Subject: Re: [PATCH v9 0/6] RISC-V: Detect and report speed of unaligned vector accesses
In-Reply-To: <20240820152424.1973078-1-jesse@rivosinc.com>
CC: linux-riscv@lists.infradead.org, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor Dooley <conor@kernel.org>, robh@kernel.org,
  krzk+dt@kernel.org, cleger@rivosinc.com, Evan Green <evan@rivosinc.com>, ajones@ventanamicro.com,
  jesse@rivosinc.com, Charlie Jenkins <charlie@rivosinc.com>, xiao.w.wang@intel.com,
  andy.chiu@sifive.com, ebiggers@google.com, greentime.hu@sifive.com, Bjorn Topel <bjorn@rivosinc.com>,
  Heiko Stuebner <heiko@sntech.de>, costa.shul@redhat.com, akpm@linux-foundation.org, bhe@redhat.com,
  apatel@ventanamicro.com, zong.li@sifive.com, samitolvanen@google.com, ben.dooks@codethink.co.uk,
  alexghiti@rivosinc.com, gustavoars@kernel.org, erick.archer@gmx.com, j.granados@samsung.com,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jesse@rivosinc.com
Message-ID: <mhng-07137536-28ef-4262-a165-6388fffd2599@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_055724_271946_E38B1509 
X-CRM114-Status: GOOD (  19.14  )
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

On Tue, 20 Aug 2024 08:24:18 PDT (-0700), jesse@rivosinc.com wrote:
> Adds support for detecting and reporting the speed of unaligned vector
> accesses on RISC-V CPUs. Adds vec_misaligned_speed key to the hwprobe
> adds Zicclsm to cpufeature and fixes the check for scalar unaligned
> emulated all CPUs. The vec_misaligned_speed key keeps the same format
> as the scalar unaligned access speed key.
>
> This set does not emulate unaligned vector accesses on CPUs that do not
> support them. Only reports if userspace can run them and speed of
> unaligned vector accesses if supported.
>
> The Zicclsm is patches are no longer related to this set.
>
> Changes in v6:
>  Added ("RISC-V: Scalar unaligned access emulated on hotplug CPUs")
>
> Changes in V8:
>  Dropped Zicclsm
>  s/RISCV_HWPROBE_VECTOR_MISALIGNED/RISCV_HWPROBE_MISALIGNED_VECTOR/g
>   to match RISCV_HWPROBE_MISALIGNED_SCALAR_*
>  Rebased onto palmer/fixes (32d5f7add080a936e28ab4142bfeea6b06999789)
>
> Changes in V9:
>  Missed a RISCV_HWPROBE_VECTOR_MISALIGNED...
>
> Jesse Taube (6):
>   RISC-V: Check scalar unaligned access on all CPUs
>   RISC-V: Scalar unaligned access emulated on hotplug CPUs
>   RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
>   RISC-V: Detect unaligned vector accesses supported
>   RISC-V: Report vector unaligned access speed hwprobe
>   RISC-V: hwprobe: Document unaligned vector perf key
>
>  Documentation/arch/riscv/hwprobe.rst       |  16 +++
>  arch/riscv/Kconfig                         |  57 +++++++-
>  arch/riscv/include/asm/cpufeature.h        |  10 +-
>  arch/riscv/include/asm/entry-common.h      |  11 --
>  arch/riscv/include/asm/hwprobe.h           |   2 +-
>  arch/riscv/include/asm/vector.h            |   2 +
>  arch/riscv/include/uapi/asm/hwprobe.h      |   5 +
>  arch/riscv/kernel/Makefile                 |   3 +-
>  arch/riscv/kernel/copy-unaligned.h         |   5 +
>  arch/riscv/kernel/fpu.S                    |   4 +-
>  arch/riscv/kernel/sys_hwprobe.c            |  41 ++++++
>  arch/riscv/kernel/traps_misaligned.c       | 131 +++++++++++++++--
>  arch/riscv/kernel/unaligned_access_speed.c | 156 +++++++++++++++++++--
>  arch/riscv/kernel/vec-copy-unaligned.S     |  58 ++++++++
>  arch/riscv/kernel/vector.c                 |   2 +-
>  15 files changed, 465 insertions(+), 38 deletions(-)
>  create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
>
> base-commit: 32d5f7add080a936e28ab4142bfeea6b06999789

I get a 

arch/riscv/kernel/traps_smisaligned.c: In function 'check_vector_unaligned_access_emulated':
arch/riscv/kernel/traps_misaligned.c:591:9: error: unknown register name 'v0' in 'asm'
  591 |         __asm__ __volatile__ (
      |         ^~~~~~~

on rv32/defconfig.  Looks like just a missing Kconfg guard as this 
depends on V support in the toolchain.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
