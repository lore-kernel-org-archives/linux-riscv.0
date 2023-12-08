Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07385C10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yIcqlxKo8/G9rc+pLD8Xw+UhZsEs1LQ8yo+suaNMiiY=; b=3Uk
	RcZ2yBhdtw2k1ozvI+IZcZfhd5wwTkH9+MGGysqz3G7lUp4Yuv9pZZm0nAo/n/5H/SeccM18ce5gc
	mLQlwDngSH9Ld4jbh4bMewuBsNBa3PzviVxSFVxsZ7X/BQJgxeoE52EjsaTFFWUOUSTuwoCuN9oYN
	R5FX55JZ3H0KUI44nbJA0CWIPbcbkiqv7uk7F32/a62cYVERCKCEfDJEr360uDZ1FqsyEEF5vxL/b
	gOpVwkkKJgCxBr+5iZ62GnAq9Zgy3Ga76fZBxUY/Kac7wG470IVGqL8Gz0BuyboMPChOR4x89iuKI
	d42rgOmSu65ianM/bb9TMLrqtlxfBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdPr-00Fz51-2i;
	Fri, 08 Dec 2023 16:09:27 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdPo-00Fz3U-0j
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:09:26 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d7b1a8ec90so18846427b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702051760; x=1702656560; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6imjyzF7qx6UKd6s1Syi6NhYQbuoJMem1zS1tbU350=;
        b=A1eAiFuYDJeHvFFOPH8W7fHsDxzdzxnkzDoox1SnempUDEbUIftH8Urat7VQm79vwq
         f7UU2DMF5dkbp+UBVErguwIcyRb+i7cwfkTJ9ctymhgyhcodKQ5U1eOeqKovju+ilIa0
         4eYiyx+AG0WVLBDXWylAhQxOcuagfEJXRXd2V38LDPf/hUqqf8nmDo7NyVMU+7r+Ag5K
         Pas2s6POlafmOVX8mP04/o+3gBif8PHAf3y2iWdM+MH+9EUQ/f+NQiGNE8uIJFGAciqr
         zPth+/weRQJD64TSfPTnMmZ+yfYFpyMeK6ksQmVtk5ixCM309p6YYQcAcIUJrLXELGq5
         yqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051760; x=1702656560;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u6imjyzF7qx6UKd6s1Syi6NhYQbuoJMem1zS1tbU350=;
        b=neJKjMLsIgifNKZxyyh5E1m3QHjyywMdFnCqdzJDYbP/+5+6XoAoY/jrdzJmS+zpfZ
         phESwhTULWshkpWQGbrVhghnHJ57xWsUevDbbQf+dDaEZDTOIt2ZL8K2EolnNDzQ5tOz
         W+jDCPFloAQxNVtoCu2rvuS8TEchjFu8Ap28AdWR1FN4WofGrtfRn+9AAu9GPEwoGWdI
         ds9C9B4XsIdRI8cac1i1kwBYMfS8fdY++YmK6jTad99VGKQg1rdjbto7j4Amd845i5Br
         ld9bipz1zup5xwVch3kuCe2O0K2I4klPuo79TaELaBp6ffGgf6elkc9EpYwfIZMm18jd
         meoQ==
X-Gm-Message-State: AOJu0YxHpDC4VRy0NebnuriyOj1rv/kr3O3cdSrp0U67JmdXeQxn8aHz
	mSQ0wKupiGWwronBOV9qtpFMnpwu3+9c7Cix9d0=
X-Google-Smtp-Source: AGHT+IG1sNFI0tjwkJLDXwhSee+BTMFi+F9FpTRtUaY+XoDDUgPjyW3cBDmhTK2DPzvRyGlXcq6PGw==
X-Received: by 2002:a0d:dac4:0:b0:5d9:ace2:e496 with SMTP id c187-20020a0ddac4000000b005d9ace2e496mr133461ywe.90.1702051760428;
        Fri, 08 Dec 2023 08:09:20 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id o65-20020a817344000000b00583f8f41cb8sm745193ywc.63.2023.12.08.08.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:09:19 -0800 (PST)
Date: Fri, 08 Dec 2023 08:09:19 -0800 (PST)
X-Google-Original-Date: Fri, 08 Dec 2023 08:07:52 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.7-rc5
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-1c062b80-96c4-4146-a689-9338ce7c524c@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_080924_484977_4F37C743 
X-CRM114-Status: UNSURE (   8.30  )
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
Content-Type: multipart/mixed; boundary="===============5746823572069049402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5746823572069049402==
Content-Type: text/plain

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.7-rc5

for you to fetch changes up to ed5b7cfd7839f9280a63365c1133482b42d0981f:

  riscv: errata: andes: Probe for IOCP only once in boot stage (2023-12-06 07:18:58 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.7-rc5

* A pair of fixes to the new module load-time relocation code.
* A fix for hwprobe overflowing on rv32.
* A fix for to correctly decode C.SWSP and C.SDSP, which manifests in
  misaligned access handling.
* A fix for a boot-time shadow call stack initialization ordering issue.
* A fix for Andes' errata probing, which was calling
  riscv_noncoherent_supported() too late in the boot process and
  triggering an oops.

----------------------------------------------------------------
This is all a bit big for rc5, but I think it's really just up to me being out
for a bit around Plumbers and Thanksgiving.

----------------------------------------------------------------
Andrew Jones (1):
      RISC-V: hwprobe: Always use u64 for extension bits

Charlie Jenkins (3):
      riscv: Safely remove entries from relocation list
      riscv: Correct type casting in module loading
      Support rv32 ULEB128 test

Clément Léger (1):
      riscv: fix misaligned access handling of C.SWSP and C.SDSP

Lad Prabhakar (1):
      riscv: errata: andes: Probe for IOCP only once in boot stage

Palmer Dabbelt (1):
      Merge patch series "riscv: Fix issues with module loading"

Rob Herring (1):
      dt-bindings: perf: riscv,pmu: drop unneeded quotes

Samuel Holland (1):
      riscv: Fix SMP when shadow call stacks are enabled

 .../devicetree/bindings/perf/riscv,pmu.yaml        |   2 +-
 arch/riscv/errata/andes/errata.c                   |  20 ++--
 arch/riscv/kernel/head.S                           |   2 +-
 arch/riscv/kernel/module.c                         | 114 +++++++++++++++------
 arch/riscv/kernel/sys_riscv.c                      |   2 +-
 arch/riscv/kernel/tests/module_test/test_uleb128.S |   8 +-
 arch/riscv/kernel/traps_misaligned.c               |   6 +-
 7 files changed, 106 insertions(+), 48 deletions(-)


--===============5746823572069049402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5746823572069049402==--
