Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A283FC77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=RQ2+h3LzPENUHUDPJOXWXD4SRBVDeb22cg7da690THc=; b=exqv+Q+f2BFvMH5q11Uv1FNX98
	B/Se6p08qG67iveuMxCP9hvlUCe3lXo8yrUSeFAm+7Ci8p02VrRT7SHeluvQOoxauHXiS5qZ9vLMn
	pHFRP7RnFg1b7QQ6c7tB8uZDyxtuba4GRirFwDyyT/ftnFXmOP/0P1fEarBugRSq4v6a4bUdy79sQ
	bY3JX9QlCnkM7s1u0bWs5bS0u3veqgG4kyOyQYLKSZ8TjaOyqzjq9U3x1O3IxAfPix1tl8M1SQO7s
	KD4seqme/PtUPWwb2fJthmbWPwCcDA4CpDrnOVfCxEZKyIHnr+tCm4aLMAbXaTIbvbQeVf1YYi81K
	i/G6AMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscd-00000004OBc-3nY9;
	Tue, 24 Jun 2025 01:38:51 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqC6-000000048gv-2xhc
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:03:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-235e1d710d8so63415175ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750719798; x=1751324598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYbY7zCqPp07CEIN2qEcBXINLkTa3pVeWNV25QfSjGw=;
        b=qJR5iq1eNlZo8xoJ0rMjGn27NfgPnmlpZtuiwCP03YQHSDRGe5fxXvNejY0D0OoTfM
         5ArQ+InGCLYjyJEsr9UVGjrIUZWKmwAhY7MDsrqyTN6sZHYYLXsYUFOFAuXRucZwNJRj
         MYc2MScLh1yfPXlnFGP83/xlkjLQk541bTvwM1ZUUEYuw3r+gRmbTtneXfW0CMDoNZEC
         OzcWpUv3yU7VARTDcQAoueGcrz5S6tf2RHwqMCdgY7wkcVwvteB1N/dBykdMoGfi+eMc
         Olir/WqsxeaWbZ9TO8Sv0rWah2iQViUNljFGpZXk+k+lvUAsgEzslkFuuU2SOSBBFRHT
         +1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750719798; x=1751324598;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYbY7zCqPp07CEIN2qEcBXINLkTa3pVeWNV25QfSjGw=;
        b=lwWgzSNTPIYECReeeawHQHqw3dyaApN+M4Uag+kd09LnTIKf6KtW0M9QmGTVQ116YQ
         RSFRrU4PysTyaJEsBO/HKZZnPm7MQN15T3r2ETjyqF0o6m0SF73rv+LFrn614PjrWwgb
         rTo/nTkzdUOtxd+i1m8TEO651mRO6X36yllYkM4cFy3smbexz2cG9cVplVKiXcp+HUi8
         8FRSz3LgyDDwkJogAHKG4ibWwho81xoyXQZTUec12WwF6ZUP2uf5LjU8bnqmKYm5Bai3
         VkMt9iN4k+gtLB1572u4anySxmtXTxBaMJxWZOC7obpydV6RAazeaWcvRuXj462QqR5Z
         RbIA==
X-Forwarded-Encrypted: i=1; AJvYcCWcCEV1pWhGDrShmArin+YJOJ7aAfkiUSaV2G0gNtcxm2zwzTCQEdTBNSOjyJSFoRZE9p/VZxml+3cW+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkgQlHwfdRkmBph8sWYWtkUv1hCx1pHwu38A4KpakmH31fYA+0
	nZV04MRv6H14QTCUf2RPN2XCmPCVP/Es0RE6CBns+7oHTFiIA4etyhl4OdRVg/lJ8p8=
X-Gm-Gg: ASbGncsl4aoxSRL9KlBdHZKX3evzBnqXfPmGyf2BzmsC4gBFA6InJyI+/pzFbNEvbOc
	NvkbC/3UpOYZlz5Is1J2fAXpwyZituRHZwqKvzRzzT1IHt/DjNcTUR76n3BvZ0x+BOskgyCmPVH
	gjBzSq64Dil1tqd0/798AHELx0pA5lqdjBtDLnCd7hwbiKb/4iLyNcOfO2yAg7v+gF/9xVIf4cw
	ZtsmDNt0z5y8yqv7bMe32tYMfAK+lo2HhTtKrTIUpgw6P1xzFh0eLGjiyi6Y5MLcr1l+QWVDzOe
	WjjzKV+6VjdsX3EcopsmnY4Z0lS+szsYSrn+IDYh358Vw8uiVqxSoVWzGmuL
X-Google-Smtp-Source: AGHT+IFXdcT+bmVShTi+PuWWIBnOBSGTJzAsIh7dVARvdUVdKMYWvf1xGRlavIA7rJMJZwYdw3qlRw==
X-Received: by 2002:a17:902:e54a:b0:234:d7b2:2aab with SMTP id d9443c01a7336-237d972fa09mr189517965ad.14.1750719797830;
        Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d83f0f40sm95374055ad.79.2025.06.23.16.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:03:17 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:03:10 PDT (-0700)
Subject: Re: [PATCH V8 0/3] riscv: mm: Add soft-dirty and uffd-wp support
In-Reply-To: <20250619065232.1786470-1-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, debug@rivosinc.com,
  Vedvyas Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-536B594B-996C-4A15-8744-C7A27B45720E@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_160318_745612_C118E6A6 
X-CRM114-Status: GOOD (  22.24  )
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

On Wed, 18 Jun 2025 23:52:29 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> This patchset adds Svrsw60t59b [1] extension support, also soft dirty and userfaultfd
> write protect tracking for RISC-V.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>
> This patchset applies on top of v6.16-rc1.
>
> V8:
> - Rebase on v6.16-rc1;
> - Add dependencies to MMU && 64BIT for RISCV_ISA_SVRSW60T59B;
> - Use 'Svrsw60t59b' instead of 'SVRSW60T59B' in Kconfig help paragraph;
> - Add Alex's Reviewed-by tag in patch 1.
>
> V7: (https://lore.kernel.org/all/20250409095320.224100-1-zhangchunyan@iscas.ac.cn/)
> - Add Svrsw60t59b [1] extension support;
> - Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
>   avoid crashes for the hardware which don't have this extension.
>
> V6:
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b
>   for soft dirty and userfaultfd write protect tracking.
>
> V5:
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
>   error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4:
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3:
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V1 -> V2:
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use
>   the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> [1] https://github.com/riscv/Svrsw60t59b.git

This 404s (with or without the ".git" suffix).  I remember seeing the 
spec at some point, but I can't find it anywhwere else.

>
> Chunyan Zhang (3):
>   riscv: Add RISC-V Svrsw60t59b extension support
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add uffd write-protect support
>
>  arch/riscv/Kconfig                    |  16 +++
>  arch/riscv/include/asm/hwcap.h        |   1 +
>  arch/riscv/include/asm/pgtable-bits.h |  37 +++++++
>  arch/riscv/include/asm/pgtable.h      | 136 +++++++++++++++++++++++++-
>  arch/riscv/kernel/cpufeature.c        |   1 +
>  5 files changed, 189 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
