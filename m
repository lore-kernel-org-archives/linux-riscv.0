Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDF4C05027
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PRSvJqtOf6B5DgdiLlw0uOuo8lcl5HwsKinACjc2wzc=; b=WoJco0JgObJ1lAxf4N9qZSt2X6
	ruYtH+eEqQ99/VkQr+JaZ1aeVl5pCitK2UY57RjEG9P1iRexxri2BVA0KJEjOmL2ndr6w75Z0f9kd
	KQkPkbD529o/E+bXYk3YqOaY5TFglKrY1qZzA1FLQehnc3S1VUYeR/0Z+RAjgbPo1QiSb7SUvrNqU
	UojG7yHEkpoAM17YuDqunRN4r4UVhL4MrqekFRhoAVxOiF9KPHv8t+QzXVYMPftTeuual5rtyc8lO
	1sSq4DhHohgBCK3QVyhmbj8qAL4NuA8kUBIa702L6/oT/VubtS2ldAZAPRuHxwelefQaR+sg5ilSQ
	2Cwz0a2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5FZ-003zNX-IP; Wed, 15 Feb 2023 00:02:17 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS5FW-003zKJ-5q
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 00:02:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id mg23so10074725pjb.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Feb 2023 16:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9a4yF92quJsyF4ubW+8QaBS409slF5s7yUmhpY9RAZY=;
        b=ka45275QGuDOUBX6HuXwnAvTzHDojN7WI3d4OrFmRc3S9EOHBhEPXcMpmgKwD9p5t6
         j4qr3EWPxUOOVjIYImH3GfIxeMJbWShprj7/vbNrg7nNdP/QxvCqEI3FohgX1naA3lr2
         gONQuB+OxKvXw5n0GHHXUySl6ACAJ2Lx3wk3EztWDumgt0/8bIyZqupENGHb4mgaAiht
         KDpLBSwV6wQy9Oc7LiCBP56NBu7xCTejGH3wbZNbvkEfvsHEXs1nEIWxGbSanGRnlcnA
         +kQLrYjg9JbbrGJWo/jqamKoCCffcapJ/Uyc9ILGJlv6tEpMcyD0gC0Qau0fctDSOcvk
         DiXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9a4yF92quJsyF4ubW+8QaBS409slF5s7yUmhpY9RAZY=;
        b=MtViGjrqD+oIOXmwAbKu84hLRzjFixK139/QfvRBSEuFqIfiw8EnisbIjETkx4SJ/G
         kfyebQApiNP1U4kJVeGFgOyK5QMp82peT+KL2efEfilrbb1eWkfedRRKgHisQnO+K3kH
         +vgoz4G+Jmvsy1V1fJoaVT5QP5xRv7ebaNsU+ymaLmbQ8T6bB8ZWIQ42/5qf5segesv8
         2cfIsJ96OPNRMDNmikETcSHrD8fJ5ohWEPlWgrJEZdar2aIV6JUWwKP3rVpRbAUJquzt
         gP5zpf+KZ2wH9q/DD8H4TizNgAwQoa+oxFXA9u7iKNJFtiMRODLpA3YlhUOi96D0Hfub
         wsEg==
X-Gm-Message-State: AO0yUKVxaPW1rEZCm+eh4FPux00tDnyu4bv2izrJvqZdaH42Ou9JFI5c
	EIPg709HYwKLnZkS0WXRlQkLELz0ObTKSpgp
X-Google-Smtp-Source: AK7set+OUugwAT+BSfkkOXYJUQZqXVkASfqUK2J/AiDPEgN3HKQhYCavkTv+vZo+IrAf6gE9Oumiww==
X-Received: by 2002:a17:902:fa8e:b0:19a:98bb:32fa with SMTP id lc14-20020a170902fa8e00b0019a98bb32famr362933plb.16.1676419324062;
        Tue, 14 Feb 2023 16:02:04 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b0019a7c890c61sm4230005pli.252.2023.02.14.16.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 16:02:03 -0800 (PST)
Date: Tue, 14 Feb 2023 16:02:03 -0800 (PST)
X-Google-Original-Date: Tue, 14 Feb 2023 16:02:01 PST (-0800)
Subject: Re: [PATCH v11 0/3] riscv, mm: detect svnapot cpu support at runtime
In-Reply-To: <20221216062109.865573-1-panqinglin2020@iscas.ac.cn>
CC: linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn,
  Conor Dooley <conor@kernel.org>, ajones@ventanamicro.com, panqinglin2020@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: panqinglin2020@iscas.ac.cn
Message-ID: <mhng-cbb4813a-0cec-47f8-905e-48fa410657a5@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_160214_470644_01C99A1A 
X-CRM114-Status: GOOD (  25.13  )
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

On Thu, 15 Dec 2022 22:21:06 PST (-0800), panqinglin2020@iscas.ac.cn wrote:
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
>
> Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> page. This patch set is for using Svnapot in hugetlb fs and huge vmap.
>
> This patchset adds a Kconfig item for using Svnapot in
> "Platform type"->"SVNAPOT extension support". Its default value is on,
> and people can set it off if they don't allow kernel to detect Svnapot
> hardware support and leverage it.
>
> Tested on:
>   - qemu rv64 with "Svnapot support" off and svnapot=true.
>   - qemu rv64 with "Svnapot support" on and svnapot=true.
>   - qemu rv64 with "Svnapot support" off and svnapot=false.
>   - qemu rv64 with "Svnapot support" on and svnapot=false.
>
>
> Changes in v2:
>   - detect Svnapot hardware support at boot time.
> Changes in v3:
>   - do linear mapping again if has_svnapot
> Changes in v4:
>   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> Changes in v5:
>   - modify code according to @Conor and @Heiko
> Changes in v6:
>   - use static key insead of alternative errata
> Changes in v7:
>   - add napot_cont_order for possible more napot order in the future
>   - remove linear mapping related code from this patchset to another patch
>   - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
>   - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
>   - support svnapot in huge vmap on newer for-next branch
> Changes in v8:
>   - fix compilation errors in rv32_defconfig
>   - insert some lines of whitespace according to @Conor's suggestion
> Changes in v9:
>   - use alternative to avoid using static branches inside heavily used
>     inline functions
>   - change napot_cont_mask definition
>   - post test_vmalloc modification about testing vmalloc_huge
> Changes in v10:
>   - fix some nits caught by @Andrew
>   - collect Reviewed-by/Acked-by
>   - add memory leak warning in KConfig text
>   - replace test_vmalloc patch link with the standard one
> Changes in v11:
>   - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig text
>   - fix missing reverse-xmas tree
>
>
> Qinglin Pan (3):
>   riscv: mm: modify pte format for Svnapot
>   riscv: mm: support Svnapot in hugetlb page
>   riscv: mm: support Svnapot in huge vmap
>
>  arch/riscv/Kconfig                   |  21 +-
>  arch/riscv/include/asm/errata_list.h |  15 +-
>  arch/riscv/include/asm/hugetlb.h     |  34 ++-
>  arch/riscv/include/asm/hwcap.h       |   2 +-
>  arch/riscv/include/asm/page.h        |   5 -
>  arch/riscv/include/asm/pgtable-64.h  |  34 +++
>  arch/riscv/include/asm/pgtable.h     |  43 +++-
>  arch/riscv/include/asm/vmalloc.h     |  61 +++++-
>  arch/riscv/kernel/cpu.c              |   1 +
>  arch/riscv/kernel/cpufeature.c       |  15 ++
>  arch/riscv/mm/hugetlbpage.c          | 301 +++++++++++++++++++++++++++
>  11 files changed, 519 insertions(+), 13 deletions(-)

This is triggering some build failures.  I sent along a fix before 
realizing they're actually coming from this patch set: 
https://lore.kernel.org/all/20230214201358.10647-1-palmer@rivosinc.com/ 
.  If it's OK I'll just squash that in here, so I can avoid a broken 
build.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
