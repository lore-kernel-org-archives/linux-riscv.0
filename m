Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDC5C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=as4qfthJMHXUUnHyhxOXPxrR2FX2701JMC/NRc6qQzs=; b=MAVq9rAroWhfZb
	dIekM7GumFvfmodnW6vbkEPj/DmYZNqflX184YUw+1LAVYLoDCawN7VfJEWzafIB6EsTI1r8kggyp
	NtdBZqfN8Tw7q61JUvpAokMwdzs8tTmAPJn2J/8nlx9kXvmtm9g+eJQETbs7fMI8RcI/AqC1QCeF7
	Sg+xFNku4CiEbfbHtiE81L9mNzes3t36thl6kIPaZD/qlnAnpule10ilKRlK96K167CKmRJerTO32
	i76ed/1azRlHXtG5QKDXUfPsPvX24UyNgVxu2YGlpXzLaqgR6oci0Wjf4vEQpSACWhAyauk5Lyw97
	86CwweR9LCGPLqNCYOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0T-0004Et-LH; Thu, 09 Feb 2023 03:53:57 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPy0Q-0004EM-CD
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 03:53:55 +0000
Received: by mail-pl1-x62a.google.com with SMTP id m2so1535544plg.4
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 19:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=12dTRWaMWZUAG31L2kEM0o5/KiMO3deRVWjq9P0fDIc=;
        b=e5TLdepd+V8n6CZEueibyDm4A37unRbqxewxb4Ove1khAXMYMYoJyuUIshTjZ4cTuY
         XL7mplJBO4SuMXK00+g+bWxfddJE752rrR2nrmPNzcg95GjMAnJu9rGubzy9I4FAC9wt
         0fwPsKgeCvKlc95gS7ImU/ESg76C19mCFL1gUA4dzF9aJD90nmWf9Q+YEADnrTp8sRAx
         LSHdOMk78UmKZe3c3ql3p5qQtgnKJBu/gC5O4r42U+aoPYAPM1RmwghCnNbCgFpvVlN6
         QbWJmT6IV1YN13X5a7zBfo2k17rTt9052mA23cr19p+o6Ea4Bs4MMggeXowlkJ440adz
         PEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12dTRWaMWZUAG31L2kEM0o5/KiMO3deRVWjq9P0fDIc=;
        b=rwPr20R+lSfCbiYBWysX7rVIlR+KFpKWtRCt4WBeR7kvgFVfEQi9B6QYF7dFZQSrbV
         S0UrY1aIwFuRBfnx7RP4XTwAybrC+9tSDjXIpCOFrUsPRTvf4PWedsMQfvUJ8ON+8OEi
         Ib0B43yOf+pjJ14frdbfyGzJA39LtAhoo3uOIC3rCXAjkEf2f4Y99S6eEcMQSeNTQVOf
         HH2+0O/fK1/3f2XclEIzg/A2VPo2+RHD0O7H1Gl4FeLCh0IlaQMnluVDpvrCM8q5PC2r
         Ym0nNgR5ZhjvIu4NdhgQRzXh0OxrgRlyCQ4vqKSp5BEQeUWBRKys6zKtaq2PM7MdkSiW
         G9dA==
X-Gm-Message-State: AO0yUKVYZnA0rc11SIycecvguDR284G89/ehdTSMAjSEgoDEO0L4dxKE
	vqMXiFC4YnXephk42//kSnI=
X-Google-Smtp-Source: AK7set/vQAv21gb8LjGESbUJsYeQTutgFtDuRboP1A/GkDi8tm4cnkUaVPLNAC15FMS3eBBBWFC4qA==
X-Received: by 2002:a17:903:1207:b0:196:5f75:66f9 with SMTP id l7-20020a170903120700b001965f7566f9mr12192678plh.63.1675914830936;
        Wed, 08 Feb 2023 19:53:50 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm252602pld.120.2023.02.08.19.53.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:53:50 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
Date: Thu,  9 Feb 2023 11:53:40 +0800
Message-Id: <20230209035343.15282-1-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_195354_474913_7477997B 
X-CRM114-Status: GOOD (  12.92  )
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

Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
page. This patch set is for using Svnapot in hugetlb fs and huge vmap.

This patchset adds a Kconfig item for using Svnapot in
"Platform type"->"SVNAPOT extension support". Its default value is on,
and people can set it off if they don't allow kernel to detect Svnapot
hardware support and leverage it.

Tested on:
  - qemu rv64 with "Svnapot support" off and svnapot=true.
  - qemu rv64 with "Svnapot support" on and svnapot=true.
  - qemu rv64 with "Svnapot support" off and svnapot=false.
  - qemu rv64 with "Svnapot support" on and svnapot=false.


Changes in v2:
  - detect Svnapot hardware support at boot time.
Changes in v3:
  - do linear mapping again if has_svnapot
Changes in v4:
  - fix some errors/warns reported by checkpatch.pl, thanks @Conor
Changes in v5:
  - modify code according to @Conor and @Heiko
Changes in v6:
  - use static key insead of alternative errata
Changes in v7:
  - add napot_cont_order for possible more napot order in the future
  - remove linear mapping related code from this patchset to another patch
  - refactor hugetlb code for svnapot according to thanks @Andrew @Conor
  - use tools/testing/selftests/vm/map_hugetlb as hugetlb testing program
  - support svnapot in huge vmap on newer for-next branch
Changes in v8:
  - fix compilation errors in rv32_defconfig
  - insert some lines of whitespace according to @Conor's suggestion
Changes in v9:
  - use alternative to avoid using static branches inside heavily used
    inline functions
  - change napot_cont_mask definition
  - post test_vmalloc modification about testing vmalloc_huge
Changes in v10:
  - fix some nits caught by @Andrew
  - collect Reviewed-by/Acked-by
  - add memory leak warning in KConfig text
  - replace test_vmalloc patch link with the standard one
Changes in v11:
  - add more detailed warning about HUGETLBFS and SVNAPOT in KConfig text
  - fix missing reverse-xmas tree
Changes in v12:
  - rebase on the new ISA extension API [1]

[1]https://lore.kernel.org/all/20230128172856.3814-5-jszhang@kernel.org/

Qinglin Pan (3):
  riscv: mm: modify pte format for Svnapot
  riscv: mm: support Svnapot in hugetlb page
  riscv: mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                  |  21 +-
 arch/riscv/include/asm/hugetlb.h    |  34 +++-
 arch/riscv/include/asm/hwcap.h      |   9 +-
 arch/riscv/include/asm/page.h       |   5 -
 arch/riscv/include/asm/pgtable-64.h |  34 ++++
 arch/riscv/include/asm/pgtable.h    |  39 +++-
 arch/riscv/include/asm/vmalloc.h    |  61 +++++-
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |   1 +
 arch/riscv/mm/hugetlbpage.c         | 301 ++++++++++++++++++++++++++++
 10 files changed, 493 insertions(+), 13 deletions(-)

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
