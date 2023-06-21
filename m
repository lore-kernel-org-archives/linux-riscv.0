Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784B6EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 23:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rfmGQdkzZhJwpz6Nv3ljDOAW1tQhDW53daHmgOJ7zJI=; b=CzbVRu/bAjsxI/iy83Iia2OdEU
	mxnBTGaRydeAHWQYxgqPBT+SS+or8lXJ4AmrhIiNy3sXT80B/Pfw3xuEyQ6CLpNWCVO9NMJdyoi2S
	gxUMPa2tisBvkU55mq7F0uFErx47Yn29mmZtsWC6ITsMe4UoEPRnArRIUxMlxIoIm8jbUN+GfBGui
	iPXEvYxxVx+P5srvWeuWb1ZnIer9p6q4jCO4Kg7zq68Jia84UCNN3x1ibKSAtHYwJlfrxbWuX0jLb
	qTRGXku1yoqLPQ5bt7vz2m+kXKamyIUx8hWXSt5NyaF+ax638Ef4IYskvppTknGnWEHAMbUjoxQW3
	KY0RvEHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7O2-00G31q-0Q;
	Wed, 21 Jun 2023 23:37:18 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC7Ny-00G30D-0R
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 23:37:16 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-666e5f0d60bso3225404b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 16:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687390631; x=1689982631;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LviLme9+lgOUUr9nBLWzIIut7py+TszGrdRA5x2MLw4=;
        b=SRyBK+yXuStGTaQoKiMa6SdpdRAjVO1vzCexqILiXgxFArocs7JGb6OIEP2oHHgwGp
         Wtj+XBft+r/OgiawqDMfDaFciwhGd6hWCLd5mBR7xdjVuuY0bs/dDZ/zP0YiSsEv2qyg
         JDJerwkTSFfeolNwA50bpeajGz/5aYYcBuMvNEdLeV1SiiCn1lvzLV8Qbhqcr9jfQvbU
         yclePpz6cSpAfInKAjGUUQLzAc5qigx0DoMHjhZ8eN/ykgTxGoj4fc+C4um9NeWgMlHf
         SBa8PnaExaa0KtKJB/Mn3uJA6kCjw9WZJqSgmC383N9phI5yqplFC56ZMJE20a5OkYNV
         vRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687390631; x=1689982631;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LviLme9+lgOUUr9nBLWzIIut7py+TszGrdRA5x2MLw4=;
        b=UYQ7/F1ivcbFcTmro5lULv9NeCskl5egrRP9OHdgODxK3AFqZn24X1/mpcaokNRG98
         y2NBncn0O99BWzBO8aEyweGfuQ2NuETw6TMz7UV1xec8UAUyOmGGQxF3ISCeieLYqLKb
         8ekMXSoMhDSDYYY21k9WO5tM190YVlOT9jWfzgM+74XUbGegx5MG+QlA1/NGU9OmdV9B
         1ZdfDhBRxG6DY9n4la7FU1ekIRW8nqRTGDVFtek3pQIhhoXJoKjlxMLHrdlYn0h1rJvv
         bNV7oOCC0KtQ5hp2EYwzWmFZovgWi1KHt6Wzv5FXTbpANdFYuRqjAvGHKHe1rNvejiEB
         QdMg==
X-Gm-Message-State: AC+VfDwqLXY64boVUsL5SCw66o/G/NhL/USdPdgHav/JnqIVepjfbpHx
	IWRtSNLVIDRd1mZY0aIt41YNLA==
X-Google-Smtp-Source: ACHHUZ7CM2aeTFo7hwLz+bGNEMYFQlMCEfUHBJMJQWjk2y2P70n0MdfO1gwLnC0WcHlGXINZ9OQvgQ==
X-Received: by 2002:a05:6a20:1596:b0:10b:e54f:1c00 with SMTP id h22-20020a056a20159600b0010be54f1c00mr13663409pzj.57.1687390630512;
        Wed, 21 Jun 2023 16:37:10 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id n10-20020a170902e54a00b001b061dcdb6bsm4020245plf.28.2023.06.21.16.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 16:37:09 -0700 (PDT)
Date: Wed, 21 Jun 2023 16:37:09 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 16:36:18 PDT (-0700)
Subject: Re: [PATCH v2 00/10] riscv: Allow userspace to directly access perf counters
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
CC: corbet@lwn.net, peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
  Mark Rutland <mark.rutland@arm.com>, alexander.shishkin@linux.intel.com, jolsa@kernel.org, namhyung@kernel.org,
  irogers@google.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  atishp@atishpatra.org, anup@brainfault.org, Will Deacon <will@kernel.org>, robh@kernel.org,
  ajones@ventanamicro.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-5074ab93-a879-4b1c-8f39-0f59b7e0f4f4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_163714_174449_8C3B554A 
X-CRM114-Status: GOOD (  19.01  )
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

On Fri, 12 May 2023 01:53:11 PDT (-0700), alexghiti@rivosinc.com wrote:
> riscv used to allow direct access to cycle/time/instret counters,
> bypassing the perf framework, this patchset intends to allow the user to
> mmap any counter when accessed through perf. But we can't break the
> existing behaviour so we introduce a sysctl perf_user_access like arm64
> does, which defaults to the legacy mode described above.
>
> *Note* that there are still ongoing discussions around which mode should
> be the default mode with distro people.
>
> base-commit-tag: v6.3
>
> Changes in v2:
> - Split into smaller patches, way better!
> - Add RB from Conor
> - Simplify the way we checked riscv architecture
> - Fix race mmap and other thread running on other cpus
> - Use hwc when available
> - Set all userspace access flags in event_init, too cumbersome to handle sysctl changes
> - Fix arch_perf_update_userpage for pmu other than riscv-pmu by renaming pmu driver
> - Fixed kernel test robot build error
> - Fixed documentation (Andrew and Bagas)
> - perf testsuite passes mmap tests in all 3 modes
>
> Alexandre Ghiti (10):
>   perf: Fix wrong comment about default event_idx
>   include: riscv: Fix wrong include guard in riscv_pmu.h
>   riscv: Make legacy counter enum match the HW numbering
>   drivers: perf: Rename riscv pmu driver
>   riscv: Prepare for user-space perf event mmap support
>   drivers: perf: Implement perf event mmap support in the legacy backend
>   drivers: perf: Implement perf event mmap support in the SBI backend
>   Documentation: admin-guide: Add riscv sysctl_perf_user_access
>   tools: lib: perf: Implement riscv mmap support
>   perf: tests: Adapt mmap-basic.c for riscv
>
>  Documentation/admin-guide/sysctl/kernel.rst |  24 ++-
>  arch/riscv/kernel/Makefile                  |   2 +-
>  arch/riscv/kernel/perf_event.c              |  74 ++++++++
>  drivers/perf/riscv_pmu.c                    |  41 ++++
>  drivers/perf/riscv_pmu_legacy.c             |  37 +++-
>  drivers/perf/riscv_pmu_sbi.c                | 196 +++++++++++++++++++-
>  include/linux/perf/riscv_pmu.h              |  10 +-
>  include/linux/perf_event.h                  |   3 +-
>  tools/lib/perf/mmap.c                       |  65 +++++++
>  tools/perf/tests/mmap-basic.c               |   4 +-
>  10 files changed, 435 insertions(+), 21 deletions(-)
>  create mode 100644 arch/riscv/kernel/perf_event.c

It looks like there's a handful of outstanding review comments, so I'm 
going to mark this as changes requested in patchwork -- sorry if I 
missed a v3.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
