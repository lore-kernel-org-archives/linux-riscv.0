Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A64C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbYh1bXlEAk1kj8jRAdN0eMH4oFCw6PYRCU3EyA7V8Y=; b=LrMD+Cu/iVKVy4
	F/fT7sSR2nAUrXtJgeRv4WMl+LWdSRyy3Qv2jg8Gt5gwqxHWYJNUWKlCeEDUprKeKFq6il5uP45VL
	NRNu7fJwoytKVAe00JwbVQJk6SMP0IUHjRlS5cmbbm5VKZ3soC9IrbhEanVfimTFQ82ugqxHidSTp
	sU+LXBInlj0jpV6QBxLLkDvGfVIwEoUnzKEzTTdvRI3SQThiaHHH5qnJX6mpAr/sOEzXTyWJIm39f
	8ZiHrv4nC3vnouTEdSYE/hE8o76Q08GqHAesrKCLAjBGdJl7J/wi1UgwcB0LZ0EkPGwVG4Rqwz70T
	wjkZKkhwpUl2MEoSRs0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q56Qx-007DKV-2c;
	Fri, 02 Jun 2023 15:11:19 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q56Qu-007DFp-1x
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 15:11:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-653436fcc1bso327435b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1685718664; x=1688310664;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUpuQWKRHIidXNA4DyjcQWmeIqFB0FVeYLmWHizrF0I=;
        b=Fl9gcNXjBUsfsmxeYAoxAIXTCPlsu0s5aU5YG/OOCLk2J+DQBEKl2RUib9lkUQM3HO
         UQlwHfTA+HzNu9ScGocv6YIhaotzxP3MEGHY0l5bLjJy7nUM2BwG5Wc1qCnwWcewI0hT
         raLuf3dk+I8SW23Wt2ob7WrDOWxUtAXN8bdJp1EjZcp4AV72afbMOCXeTq06mhGJLYVD
         3IANHu964sknbWTegN+CoyD5ESKjs9mz3Hi91RDzNDoVHflFOCi451eJm7Mp3RZb8GAn
         jwK94MsdWHXp40Fp45Vq9awQ3lFASiezh8GlQyPVZT0woohVBNpESXXeUmxzQ9eCAdBl
         Bzkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685718664; x=1688310664;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUpuQWKRHIidXNA4DyjcQWmeIqFB0FVeYLmWHizrF0I=;
        b=RPfWQqtuK2IzC0ix55u3lIfStT6Eb4q7vTqEkauuIZdyiMVremna0sPS/ZcARR/C0p
         +gC7ioa7xSKoBEuICp4JhKBoTwU5S9Y9wgS+15ad/2iVfYFVOUwF6WswEYGNKNVcuDCL
         wif+s2lFs6d3KFFYsrI/KCP6X3bQaDq+Fzy5Nu2i7S0vS97SqkD5T0E/fxvIOsLj+UsF
         2Cu3zGyBeIYDFoLerhIxIVKJsLjj/ghpODUZj49FqqWolMdw/4saDGrla8efRzbdj42V
         b1s34DAol9oDEXnrcRFfaJX3Vb2Ji5B+nGpnzOU1WRXu8GW+N48eUzBp6TE4CUliXH7g
         XeAA==
X-Gm-Message-State: AC+VfDzIUzthVyy5uVKPYPBQaF7VyqfG+PDIsddyYdR4MdkdUiUSLYet
	VXKIagFSpsoWWut1Hq06OWCVtf/gOj8I12dWaw0=
X-Google-Smtp-Source: ACHHUZ6uUn04qfFdZi+AmNnMf1L2hZCcnH3HEoEsUOq4w4NIbmUpUix5tJwJtTC07AEt49bzWiWYLg==
X-Received: by 2002:a05:6a20:729c:b0:103:946d:8a4c with SMTP id o28-20020a056a20729c00b00103946d8a4cmr10362789pzk.5.1685718663734;
        Fri, 02 Jun 2023 08:11:03 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id c3-20020a656183000000b0053b92b26412sm1269351pgv.14.2023.06.02.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 08:11:03 -0700 (PDT)
Date: Fri, 02 Jun 2023 08:11:03 -0700 (PDT)
X-Google-Original-Date: Fri, 02 Jun 2023 08:10:40 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.4-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-78f8e789-4700-4d48-b64e-11ed75a3a048@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_081116_642579_CE6624A4 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3b90b09af5be42491a8a74a549318cfa265b3029:

  riscv: Fix orphan section warnings caused by kernel/pi (2023-05-09 18:20:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-rc5

for you to fetch changes up to 6966d7988c4fb6af3e395868e9800c07f9e98a30:

  riscv: Implement missing huge_ptep_get (2023-06-01 18:15:37 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.4-rc5

* A build warning fix for BUILTIN_DTB=y.
* Hibernation support is hidden behind NONPORTABLE, as it depends on
  some undocumented early boot behavior and breaks on most platforms.
* A fix for relocatable kernels on systems with early boot errata.
* A fix to properly handle perf callchains for kernel tracepoints.
* A pair of fixes for NAPOT to avoid inconsistencies between PTEs and
  handle hardware that sets arbitrary A/D bits.

----------------------------------------------------------------
Alexandre Ghiti (4):
      riscv: Fix unused variable warning when BUILTIN_DTB is set
      riscv: Fix relocatable kernels with early alternatives using -fno-pie
      riscv: Fix huge_ptep_set_wrprotect when PTE is a NAPOT
      riscv: Implement missing huge_ptep_get

Conor Dooley (1):
      RISC-V: mark hibernation as nonportable

Ism Hong (1):
      riscv: perf: Fix callchain parse error with kernel tracepoint events

 arch/riscv/Kconfig                  |  5 ++++-
 arch/riscv/errata/Makefile          |  4 ++++
 arch/riscv/include/asm/hugetlb.h    |  3 +++
 arch/riscv/include/asm/perf_event.h |  7 +++++++
 arch/riscv/kernel/Makefile          |  4 ++++
 arch/riscv/mm/hugetlbpage.c         | 30 +++++++++++++++++++++++++++++-
 arch/riscv/mm/init.c                |  2 +-
 7 files changed, 52 insertions(+), 3 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
