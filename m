Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC98C4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 02:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSU1poJILOJPL6Mj+zV2mNUYhV0Z+EaJNK5zRvd3ifw=; b=nEyr8tK0/VOKD3
	9SKcGM0n9qBIa6s/llMpPlHKMWeljEYTZsJhfWRI1v97PO/ch/hqAhIOE5bNkLhwoEEaJ3XfNfBII
	JYBFItZgWv+3B096tAy5MSU7prSLi5wm+8ZYr+OQAYrKxsx++J2Yx2IgUMVMeQ6M/ra/YUSe9GuCp
	3F9ouXI6aCJE/FcxlAiGT32Xw6aKcLhkoRmDVjz9pKXgy/YC+jKJA/B5fZEEdOGlzF2LpN29ouDMa
	9HB3IFS8YX9yOz5RjrLLCw1wtrA0nePnyvWYbV6mL6Wm08qnTa2YMot3bx8HhnHJgl1FzFl53wp5/
	dwtex/wQDDCR2WXGjdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNkNO-00FLkv-1X;
	Thu, 11 Jan 2024 02:00:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNjD8-00F0dJ-2L
	for linux-riscv@bombadil.infradead.org;
	Thu, 11 Jan 2024 00:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gueNhZrbsNiJzCN2gb4yLrjECQBWf6cwwXnoTcfXIT4=; b=RfciD43r7MyYrqmhKqDfcml1Ub
	g+zl3oR2EWR0t9RsKJS1K0vwCt9feIh6VfDbDzbfp7ehvo7PlRBxtD09Mv6o8vtZg7eowUb7BA2M3
	fJ1NS9Sjq9pjoEGyPAJ8fRFcefDAaL6tEB+dpc0McdM6En9HRbnVKWuaC0G6k4A2PnmGmHW1uhfb/
	YW6cjVwuKpZGvQz9H4QAxoyrPziM89jxj41KAaYtK4PM5rCphy11flUoV26C6nqqddLe8oHwy6kP4
	rHC0ntPoKzNwfKrbRvdbi5TjP5oTTsk4g6keGCaq/AkR4Umw37RFq0ZF3lEaZW0Pd5vwEqGV8L8xG
	073ITxVA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNjD1-009qGF-0w
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 00:46:16 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6d9cb95ddd1so2179119b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jan 2024 16:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704933967; x=1705538767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gueNhZrbsNiJzCN2gb4yLrjECQBWf6cwwXnoTcfXIT4=;
        b=Z9Y4laWw0qTMzBKy4cmuzn8xsIKNToQIUkS3i5pvWnDVJ9twTjMVr7YJd5Icoc5ZHz
         tpvC+x8e3glcP4UkDMkxcP51t1XzCQjuL8GHdrVxKP90ryrOJK6YgcsXmVZLbDL5EYud
         hsoIN+6Sg0PTrkoucK+t47auNeOnhmHSqDtQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704933967; x=1705538767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gueNhZrbsNiJzCN2gb4yLrjECQBWf6cwwXnoTcfXIT4=;
        b=e0/cyRKNTvUXgl+CFqFoWSCTmlLsT4IcLjswCFdl+RCEmJPcplb0Si14wLDITSCiQW
         VK/YZHiPlwe9yJ8vdDQYOgZ4GZAc+SRhiqExFDQ5ICkFKahBW132QsSfKJzY1q0Bjyy/
         dyHGkaHTdgLeBNe67AzEtai7wvE81fIgEVnSiDXSDI3vZTDYzsCBb5BTcqgkzgiJhwV5
         VinUukiWRuUEVNvbEqW75cs1S3umpGPxckAPHKqoH8hm4wNtEThkCdpeX5k1VbMYlAqd
         Xfr9AL206K+0GgEkv9DDGAPA+xEHPMrfcqvl2DIpWSCJu06bGzbyCzXG+YomNv0hFt+x
         HoXw==
X-Gm-Message-State: AOJu0YyiNFkAAK+EQNxE42eJC+hOWBTenbj0mgXZ5htWXq9g1uZN+qCJ
	XQzpFBN5VnBCqSSlbeE+c19G8jrEwM3C
X-Google-Smtp-Source: AGHT+IGkiZ1hknB2+0UC/gxIH8jrVZxWAA/1vUWxP929828CA6Qm4M9e8Oxn46aJ8qOxkFFVf4GTPg==
X-Received: by 2002:aa7:90d3:0:b0:6d9:a64c:c5d1 with SMTP id k19-20020aa790d3000000b006d9a64cc5d1mr504196pfk.26.1704933967538;
        Wed, 10 Jan 2024 16:46:07 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y2-20020a62b502000000b006dac91d6da5sm4071344pfe.68.2024.01.10.16.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 16:46:06 -0800 (PST)
Date: Wed, 10 Jan 2024 16:46:06 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-efi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, bridge@lists.linux.dev, netdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, mykolal@fb.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH 0/3] Update LLVM Phabricator and Bugzilla links
Message-ID: <202401101645.ED161519BA@keescook>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_004611_786633_B033AA0F 
X-CRM114-Status: GOOD (  18.16  )
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

On Tue, Jan 09, 2024 at 03:16:28PM -0700, Nathan Chancellor wrote:
> This series updates all instances of LLVM Phabricator and Bugzilla links
> to point to GitHub commits directly and LLVM's Bugzilla to GitHub issue
> shortlinks respectively.
> 
> I split up the Phabricator patch into BPF selftests and the rest of the
> kernel in case the BPF folks want to take it separately from the rest of
> the series, there are obviously no dependency issues in that case. The
> Bugzilla change was mechanical enough and should have no conflicts.
> 
> I am aiming this at Andrew and CC'ing other lists, in case maintainers
> want to chime in, but I think this is pretty uncontroversial (famous
> last words...).
> 
> ---
> Nathan Chancellor (3):
>       selftests/bpf: Update LLVM Phabricator links
>       arch and include: Update LLVM Phabricator links
>       treewide: Update LLVM Bugzilla links
> 
>  arch/arm64/Kconfig                                 |  4 +--
>  arch/powerpc/Makefile                              |  4 +--
>  arch/powerpc/kvm/book3s_hv_nested.c                |  2 +-
>  arch/riscv/Kconfig                                 |  2 +-
>  arch/riscv/include/asm/ftrace.h                    |  2 +-
>  arch/s390/include/asm/ftrace.h                     |  2 +-
>  arch/x86/power/Makefile                            |  2 +-
>  crypto/blake2b_generic.c                           |  2 +-
>  drivers/firmware/efi/libstub/Makefile              |  2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  2 +-
>  drivers/media/test-drivers/vicodec/codec-fwht.c    |  2 +-
>  drivers/regulator/Kconfig                          |  2 +-
>  include/asm-generic/vmlinux.lds.h                  |  2 +-
>  include/linux/compiler-clang.h                     |  2 +-
>  lib/Kconfig.kasan                                  |  2 +-
>  lib/raid6/Makefile                                 |  2 +-
>  lib/stackinit_kunit.c                              |  2 +-
>  mm/slab_common.c                                   |  2 +-
>  net/bridge/br_multicast.c                          |  2 +-
>  security/Kconfig                                   |  2 +-
>  tools/testing/selftests/bpf/README.rst             | 32 +++++++++++-----------
>  tools/testing/selftests/bpf/prog_tests/xdpwall.c   |  2 +-
>  .../selftests/bpf/progs/test_core_reloc_type_id.c  |  2 +-
>  23 files changed, 40 insertions(+), 40 deletions(-)
> ---
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> change-id: 20240109-update-llvm-links-d03f9d649e1e
> 
> Best regards,
> -- 
> Nathan Chancellor <nathan@kernel.org>
> 

Excellent! Thanks for doing this. I spot checked a handful I was
familiar with and everything looks good to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
