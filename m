Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49743CEBF92
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xxoip4wGoyhF6uQ+nJJcfNRXXHRtzRX1iJ/umlXTsto=; b=iJhT07aWlyNpze
	i0CS9c2LlKo7oXMXklhkYWhM5nFaaJs+ZIqR0k6+LmN3YYhxX7ZR6l2HFboiyZZo+fFzWoB6yFUWM
	bGlCme8Fr0etgMTorRoNZ/4KcbjHSFlmreiH8Zb0nmP7MlJgS8Fl+2u4u72EtInIZUGxpxflMrj3s
	+dmBxYSjp6hzfkcoXTEoli5tx+3oqsJFAShHyQYDiXUEOpcyS//011vNemUgPokqL6O/M7ovmPjXH
	I1D2YNnUHARt2DkO1jYVghgY6i9Kaw9V0mre/cy1gr3lCYz9J7AW4OIaOP56Az+dRsCIDHwKrtmPn
	Vq9GVCHv8j+wfYnnoJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGtj-000000002hY-2Y87;
	Tue, 18 Nov 2025 08:17:11 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGth-000000002h0-2TF6
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 08:17:11 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-656b52c0f88so1828537eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Nov 2025 00:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763453828; x=1764058628; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VoMiIW3QGWFlhk8MIsWxVubR6fxSt8dbm0U8xNqOKso=;
        b=DwJ2z9jB0gX6AmTM0Rql6k479gFnXkthmJfdkMZdUB5zKsojB/xpIYq3AGW0CXShbY
         kmN5IkqATgEvtChAbWsyI1ZXnlgxtyuLT6b8kqzTgQcM8SS08pXSr7MGeFeLnPVrPFOu
         8SJJKeMg8zZqjY8IvEqpIXhu1THQOMvhoZQf0tUqEaHdPP3KGo8xxvqNaki6/9ybxvSj
         jWMfBMIuCO7Op2DUGnZp29OJOZ4wfFci+2xt4Tbz/UhVsQ5WSy5FZXSy5fGdusdth8a9
         GRIkOWkOTgDQiggqRzEPXsWTXoeStaoPFTJ1WUPHCHyM6eDKZdhs8nKGRBW0FpSllppi
         aD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763453828; x=1764058628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoMiIW3QGWFlhk8MIsWxVubR6fxSt8dbm0U8xNqOKso=;
        b=vh+X/N1w/etsSoG+zlOnj7ZgXBUOugvt5lLGtuwQFyp2oOvfzvK3JUKH3tAQ5YSrZs
         3KNBQ6RWotLg1zRVcRJ0aIjg7VKoVLfZMqtgmc7/PWwmwRatLYiBZ7rWJYJ90Yr/Ta4u
         PNJs7RGk7bFywgFg3VGDLDNHAiCAfNqytX8QzK1gp4pKF6NtABcLAzt8SPs1s8Aj3+Is
         kpFE3yLvGdIl3pbdpVCfavt9BlIdwHKQSNN7XDU3W3QeDiHD/9XusjLRmwE0EN52wO8a
         8lsORbClv/4S8wYarN61n2CXQYYtOpZfiRaDImO1AiR4kAhziOg5knzL5g4wwEd4KIWW
         IWjg==
X-Forwarded-Encrypted: i=1; AJvYcCXVLb5FK+91R6tUkvoISgyoIBsyWpFQslpFYqwxKzs4Wve8giDVCgYavRDI1e8wvwX0Tf0H3VL/LDLxkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqB+HCQWUcBscoTOvycSoc16bgb0llPngT6y03qLp4a4sb3cyK
	3xqaimhNJx8v5Hoh2u/6OUntVnIzgRWmeUHK3U47eDM00G2G3HD3DCwxho94Zv4uZQgXp6ic5/k
	HHRhf3AVWQZsqYPjoL2VeyiuATfQhT8A=
X-Gm-Gg: ASbGnctey+1ZgkC7GRuCo4Cs6fnihdcQ6Ub5Mv2YsNBbZ7yBh+1B76S7GvjRWm7yos5
	AXmdwEGe6G9rvDzPCAAT+4UvWuSIDsz3AF1Dd3WtVs1CW7gvLfLsZ+GtTFJLXE3MM4icajJgYtv
	93sNLSg5rUNda4x6ho1mJF9kWoRKxJs7S44VlYQ8GrJcacWNiNiOSkusV1+/GyaNF1fgJ7D9LH2
	w/dpgSIFhJXpwC4e+DbKYg8k38oMASF2/rNxZ79g8UTadBzcHCWMVNgMCoDejHy3wOcDXZ+FX/z
	OwpEMnhrbQ+ag5W0ETbUjN3d
X-Google-Smtp-Source: AGHT+IGJVcqmC4kf999U78KR7Z+Carm82VZu3TBqJ/efc58ObEBqzZW6zVk9sdknUB16hhvBH9dnfceG+BbpGDOEGZw=
X-Received: by 2002:a05:6870:8193:b0:3ec:3949:8a20 with SMTP id
 586e51a60fabf-3ec39498c48mr3471777fac.29.1763453828009; Tue, 18 Nov 2025
 00:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20251113072806.795029-1-zhangchunyan@iscas.ac.cn>
In-Reply-To: <20251113072806.795029-1-zhangchunyan@iscas.ac.cn>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 18 Nov 2025 16:16:30 +0800
X-Gm-Features: AWmQ_bmir1nIDPRCoXTSJbPR1qsg3o-M-aBGdrWbEh4IhEqrSXiExjOsSzb9Kb8
Message-ID: <CAAfSe-v6+Gc8ujv3m3LdBPk+rGSqmz44RheoNqGJcXjOq3vU9A@mail.gmail.com>
Subject: Re: [PATCH V15 0/6] mm: Add soft-dirty and uffd-wp support for RISC-V
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Deepak Gupta <debug@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-kernel@vger.kernel.org, Chunyan Zhang <zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_001709_682598_193A6AE8 
X-CRM114-Status: GOOD (  32.72  )
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

Hi Andrew,

On Thu, 13 Nov 2025 at 15:28, Chunyan Zhang <zhangchunyan@iscas.ac.cn> wrote:
>
> This patchset adds support for Svrsw60t59b [1] extension which is ratified now,
> also add soft dirty and userfaultfd write protect tracking for RISC-V.
>
> The patches 1 and 2 add macros to allow architectures to define their own checks
> if the soft-dirty / uffd_wp PTE bits are available, in other words for RISC-V,
> the Svrsw60t59b extension is supported on which device the kernel is running.
> Also patch1-2 are removing "ifdef CONFIG_MEM_SOFT_DIRTY"
> "ifdef CONFIG_HAVE_ARCH_USERFAULTFD_WP" and
> "ifdef CONFIG_PTE_MARKER_UFFD_WP" in favor of checks which if not overridden by
> the architecture, no change in behavior is expected.
>
> This patchset has been tested with kselftest mm suite in which soft-dirty,
> madv_populate, test_unmerge_uffd_wp, and uffd-unit-tests run and pass,
> and no regressions are observed in any of the other tests.
>
> This patchset applies on the mm/mm-new branch commit ea53cb52f919
> ("mm/vmalloc: cleanup gfp flag use in new_vmap_block()")
>
> [1] https://github.com/riscv-non-isa/riscv-iommu/pull/543
>

Can this patchset go through the mm tree if there's no more comments?

Thanks,
Chunyan

> V15:
> - Rebased on to the latest mm-new branch;
> - Removed a redundant space;
> - Added Conor's Acked-by.
>
> V14: https://lore.kernel.org/all/20250918083731.1820327-1-zhangchunyan@iscas.ac.cn/
> - Fix indent inssues in userfaultfd_k.h;
> - Some descriptions and comments minor changes.
>
> V13: https://lore.kernel.org/all/20250917033703.1695933-1-zhangchunyan@iscas.ac.cn/
> - Rebase on mm-new branch;
> - Fixed build errors;
> - Add more exactly descriptions in commit message in patch 1-2;
> - Replace '__always_inline' with 'inline' for uffd_supports_wp_marker();
> - Add Svrsw60t59b description to the extensions dt-binding in patch 6.
>
> V12: https://lore.kernel.org/all/20250915101343.1449546-1-zhangchunyan@iscas.ac.cn/
> - Rename the macro API to pgtable_supports_soft_dirty/uffd_wp();
> - Add changes for setting VM_SOFTDIRTY flags conditionally;
> - Drop changes to show_smap_vma_flags();
> - Drop CONFIG_MEM_SOFT_DIRTY compile condition of clear_soft_dirty() and clear_soft_dirty_pmd();
> - Fix typos;
> - Add uffd_supports_wp_marker() and drop some ifdef CONFIG_PTE_MARKER_UFFD_WP.
>
> V11: https://lore.kernel.org/all/20250911095602.1130290-1-zhangchunyan@iscas.ac.cn/
> - Rename the macro API to pgtable_*_supported() since we also have PMD support;
> - Change the default implementations of two macros, make CONFIG_MEM_SOFT_DIRTY or
>   CONFIG_HAVE_ARCH_USERFAULTFD_WP part of the macros;
> - Correct the order of insertion of RISCV_ISA_EXT_SVRSW60T59B;
> - Rephrase some comments.
>
> V10: https://lore.kernel.org/all/20250909095611.803898-1-zhangchunyan@iscas.ac.cn/
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V9: https://lore.kernel.org/all/20250905103651.489197-1-zhangchunyan@iscas.ac.cn/
> - Add pte_soft_dirty/uffd_wp_available() API to allow dynamically checking
>   if the PTE bit is available for the platform on which the kernel is running.
>
> V8: https://lore.kernel.org/all/20250619065232.1786470-1-zhangchunyan@iscas.ac.cn/)
> - Rebase on v6.16-rc1;
> - Add dependencies to MMU && 64BIT for RISCV_ISA_SVRSW60T59B;
> - Use 'Svrsw60t59b' instead of 'SVRSW60T59B' in Kconfig help paragraph;
> - Add Alex's Reviewed-by tag in patch 1.
>
> V7: https://lore.kernel.org/all/20250409095320.224100-1-zhangchunyan@iscas.ac.cn/
> - Add Svrsw60t59b [1] extension support;
> - Have soft-dirty and uffd-wp depending on the Svrsw60t59b extension to
>   avoid crashes for the hardware which don't have this extension.
>
> V6: https://lore.kernel.org/all/20250408084301.68186-1-zhangchunyan@iscas.ac.cn/
> - Changes to use bits 59-60 which are supported by extension Svrsw60t59b
>   for soft dirty and userfaultfd write protect tracking.
>
> V5: https://lore.kernel.org/all/20241113095833.1805746-1-zhangchunyan@iscas.ac.cn/
> - Fixed typos and corrected some words in Kconfig and commit message;
> - Removed pte_wrprotect() from pte_swp_mkuffd_wp(), this is a copy-paste
>   error;
> - Added Alex's Reviewed-by tag in patch 2.
>
> V4: https://lore.kernel.org/all/20240830011101.3189522-1-zhangchunyan@iscas.ac.cn/
> - Added bit(4) descriptions into "Format of swap PTE".
>
> V3: https://lore.kernel.org/all/20240805095243.44809-1-zhangchunyan@iscas.ac.cn/
> - Fixed the issue reported by kernel test irobot <lkp@intel.com>.
>
> V2: https://lore.kernel.org/all/20240731040444.3384790-1-zhangchunyan@iscas.ac.cn/
> - Add uffd-wp supported;
> - Make soft-dirty uffd-wp and devmap mutually exclusive which all use
>   the same PTE bit;
> - Add test results of CRIU in the cover-letter.
>
> Chunyan Zhang (6):
>   mm: softdirty: Add pgtable_supports_soft_dirty()
>   mm: userfaultfd: Add pgtable_supports_uffd_wp()
>   riscv: Add RISC-V Svrsw60t59b extension support
>   riscv: mm: Add soft-dirty page tracking support
>   riscv: mm: Add userfaultfd write-protect support
>   dt-bindings: riscv: Add Svrsw60t59b extension description
>
>  .../devicetree/bindings/riscv/extensions.yaml |   6 +
>  arch/riscv/Kconfig                            |  16 ++
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/pgtable-bits.h         |  37 +++++
>  arch/riscv/include/asm/pgtable.h              | 143 +++++++++++++++++-
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  fs/proc/task_mmu.c                            |  15 +-
>  fs/userfaultfd.c                              |  22 +--
>  include/asm-generic/pgtable_uffd.h            |  17 +++
>  include/linux/mm.h                            |   3 +
>  include/linux/mm_inline.h                     |   8 +-
>  include/linux/pgtable.h                       |  12 ++
>  include/linux/userfaultfd_k.h                 |  69 +++++----
>  mm/debug_vm_pgtable.c                         |  10 +-
>  mm/huge_memory.c                              |  13 +-
>  mm/internal.h                                 |   2 +-
>  mm/memory.c                                   |   6 +-
>  mm/mmap.c                                     |   6 +-
>  mm/mremap.c                                   |  13 +-
>  mm/userfaultfd.c                              |  10 +-
>  mm/vma.c                                      |   6 +-
>  mm/vma_exec.c                                 |   5 +-
>  22 files changed, 337 insertions(+), 84 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
