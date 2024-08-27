Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C1FC5472F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=er7mPYb/lHqFmXAyKZCvSFhGYQ4FjNfA0/Kp2UfbWGQ=; b=tkOhkdgMO638in1GBDX8flbzrq
	cLnKZhdkB63lWQFyuke6UDeriGLundONy7+Px+kgM9bFJpCDXU5n+iXR3OOx09YJZcr6nzUWBCR7z
	I7uJreuDUnOPUm0cKy0txM5P3tJ1nJj2FXtis0yz9C0+MpyM6SuED9942CIjsgchWyi4IDa1dN4hF
	E+Q0FbnnNUt7TWa0i+YUat11u3KJNR9OOaOOrmgaXhrnxN3Pc4ciGxfSAy3JnqDDdKqNYDpY6iXH4
	a9vEz6V+PGWZ5Awh846tDBw/EKRAL/Y3P6hXApt4dWYVxr2hcd7ClF10Sy54dTQ33Dcfygll8YSDt
	/3ElF1oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siz9k-0000000C5bX-3dmz;
	Tue, 27 Aug 2024 16:34:56 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siz86-0000000C5Gq-09rm
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 16:33:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2025031eb60so50190205ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 09:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724776392; x=1725381192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTh6pZVnPp/E/rLsIiYuU1aCXy8ZKRX9zys3FSKVx/s=;
        b=djilKetD6ZhZyJM+sdRM2N5hHCwf2rMW9K2rRoss2WC9/EdT3IuwzAjmz+bKb2s6g8
         d/6hAU44pxUw5ojZGSCbCa6baBNvGwAY0L5Us42+QtFYbxeyYQpdSKSoCvff/x0G0HMO
         xe04tdu+MA6UyuR4DZVeXm26tabYd7Frl0w4p5qdzNfLfnXqRBSiiFhZbvozehqMm5RN
         LZ3Wt/vI552gCbCznYHFIOYne4ApjTBhqXnvorhiMer5B5Lz+Vdq5Qmq5UjiUO5N2swu
         hPRr6XEIM+7EbsYawlVukyD49B5NHa/MSXq/ZEszrvxY8omz7XchS1Ua93QgXvLs8Fkh
         fWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724776392; x=1725381192;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mTh6pZVnPp/E/rLsIiYuU1aCXy8ZKRX9zys3FSKVx/s=;
        b=eYdjbeqPIAYTQwRrpu3YVD0rgCtZd1KjoXoljS0ZNtN+wSGSCIxY9dvIYLqwAM0Ceg
         6PGJmcO6dw3M8Ez69HzKA3/UHNr6npYAySl+2XsxbOYbL5FXEsvtyKGFHsEDtcfOevEG
         ODm4slANUlTumS1MLowOhiwANA3YG3a3f8I+tpxbyII8mPVHR97Sqeqy/rR9lnLh+fku
         HCsc3tFG9yVI5zPG3g89bab42VVmYtZai49GbNw/i1bMilH+AmbKr1Ywe5eWvqiYXlB/
         +mixiNrG4O3iq0tNDoOkT2YSFI7Zc3VfmilkURKuLycM5Rf1cEVgBCMBz/symVHskHCD
         E/tw==
X-Gm-Message-State: AOJu0YxBRXRdq5AafZ/8YDjVIfmaGy9xZoF7L1tLpbCGiQ6I0SqvIOja
	Qpk8TUARcVXC7qDZsVjSH6coV3m5oluOEajEQH4hMWBR/JWwVh2YcoHp3qhc3NFjoTAR3G7xLTm
	8
X-Google-Smtp-Source: AGHT+IEpf/1pYre4a7ge3QV2L0hds9WEI/cc1mBo3BKNODVL6iLIXzxoJBBR6QiWHKbruKqDfXDojA==
X-Received: by 2002:a17:902:f650:b0:1fb:8e25:e631 with SMTP id d9443c01a7336-2039e44af1amr187151895ad.8.1724776392039;
        Tue, 27 Aug 2024 09:33:12 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855ddb7esm85758475ad.153.2024.08.27.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:33:11 -0700 (PDT)
Date: Tue, 27 Aug 2024 09:33:11 -0700 (PDT)
X-Google-Original-Date: Tue, 27 Aug 2024 09:33:10 PDT (-0700)
Subject: Re: [PATCH v3 0/3] RISC-V: mm: do not treat hint addr on mmap as the upper bound to search
In-Reply-To: <tencent_108260B43689E30AAE5D0C7C085AA31ADF06@qq.com>
CC: linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>,
  corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  shuah@kernel.org, rsworktech@outlook.com, alexghiti@rivosinc.com, linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, cyy@cyyself.name
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cyy@cyyself.name
Message-ID: <mhng-a7dcdfb5-0232-4ffb-8a20-13e564904da1@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_093314_102691_468D91ED 
X-CRM114-Status: GOOD (  31.37  )
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

On Tue, 27 Aug 2024 01:05:15 PDT (-0700), cyy@cyyself.name wrote:
> Previous patch series[1][2] changes a mmap behavior that treats the hint
> address as the upper bound of the mmap address range. The motivation of the
> previous patch series is that some user space software may assume 48-bit
> address space and use higher bits to encode some information, which may
> collide with large virtual address space mmap may return. However, to make
> sv48 by default, we don't need to change the meaning of the hint address on
> mmap as the upper bound of the mmap address range. This behavior breaks
> some user space software like Chromium that gets ENOMEM error when the hint
> address + size is not big enough, as specified in [3].
>
> Other ISAs with larger than 48-bit virtual address space like x86, arm64,
> and powerpc do not have this special mmap behavior on hint address. They
> all just make 48-bit / 47-bit virtual address space by default, and if a
> user space software wants to large virtual address space, it only need to
> specify a hint address larger than 48-bit / 47-bit.
>
> Thus, this patch series change mmap to use sv48 by default but does not
> treat the hint address as the upper bound of the mmap address range. After
> this patch, the behavior of mmap will align with existing behavior on other
> ISAs with larger than 48-bit virtual address space like x86, arm64, and
> powerpc. The user space software will no longer need to rewrite their code
> to fit with this special mmap behavior only on RISC-V.

So it actually looks like we just screwed up the original version of 
this: the reason we went with the more complicated address splits were 
than we actually started with a defacto 39-bit page table uABI (ie 
38-bit user VAs), and moving to even 48-bit page tables (ie, 47-bit user 
VAs) broke users (here's an ASAN bug, for example: 
https://github.com/google/android-riscv64/issues/64).  

Unless I'm missing something, though, the code doesn't actually do that.  
I remember having that discussion at some point, but I must have 
forgotten to make sure it worked.  As far as I can tell we've just moved 
to the 48-bit VAs by default, which breaks the whole point of doing the 
compatibilty stuff.  Probably a good sign I need to pay more attention 
to this stuff.

So I'm not really sure what to do here: we can just copy the arm64 
behavior at tell the other users that's just how things work, but then 
we're just pushing around breakages.  At a certain point all we can 
really do with this hint stuff is push around problems, though, and at 
least if we copy arm64 then most of those problems get reported as bugs 
for us.

> Note: Charlie also created another series [4] to completely remove the
> arch_get_mmap_end and arch_get_mmap_base behavior based on the hint address
> and size. However, this will cause programs like Go and Java, which need to
> store information in the higher bits of the pointer, to fail on Sv57
> machines.
>
> Changes in v3:
> - Rebase to newest master
> - Changes some information in cover letter after patchset [2]
> - Use patch [5] to patch selftests
> - Link to v2: https://lore.kernel.org/linux-riscv/tencent_B2D0435BC011135736262764B511994F4805@qq.com/
>
> Changes in v2:
> - correct arch_get_mmap_end and arch_get_mmap_base
> - Add description in documentation about mmap behavior on kernel v6.6-6.7.
> - Improve commit message and cover letter
> - Rebase to newest riscv/for-next branch
> - Link to v1: https://lore.kernel.org/linux-riscv/tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com/
>
> [1] https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/
> [2] https://lore.kernel.org/linux-riscv/20240130-use_mmap_hint_address-v3-0-8a655cfa8bcb@rivosinc.com/
> [3] https://lore.kernel.org/linux-riscv/MEYP282MB2312A08FF95D44014AB78411C68D2@MEYP282MB2312.AUSP282.PROD.OUTLOOK.COM/
> [4] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-0-cd8962afe47f@rivosinc.com/
> [5] https://lore.kernel.org/linux-riscv/20240826-riscv_mmap-v1-2-cd8962afe47f@rivosinc.com/
>
> Charlie Jenkins (1):
>   riscv: selftests: Remove mmap hint address checks
>
> Yangyu Chen (2):
>   RISC-V: mm: not use hint addr as upper bound
>   Documentation: riscv: correct sv57 kernel behavior
>
>  Documentation/arch/riscv/vm-layout.rst        | 43 ++++++++----
>  arch/riscv/include/asm/processor.h            | 20 ++----
>  .../selftests/riscv/mm/mmap_bottomup.c        |  2 -
>  .../testing/selftests/riscv/mm/mmap_default.c |  2 -
>  tools/testing/selftests/riscv/mm/mmap_test.h  | 67 -------------------
>  5 files changed, 36 insertions(+), 98 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
