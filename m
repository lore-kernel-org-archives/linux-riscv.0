Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B91CC678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yFAE85vIteRvd09cDE4r61kD5rYOZOVntRT2bVbNRd8=; b=s6BpK7EkZHDos4
	sb/tLHyI7w+u9N72+tbYczDB6hjaao1rzst018Re7Sq8eceS7HmexlHWxM4fedVLAaZmAighL6sZg
	7L/Mkn+A2cKjseo8AP+cbOcwKblCcPl4LMjOKDH1WuNPZTFOMGRWTfAuHsPX5eL3v91qPdJNfYHTh
	iFRI3H7Z3yVSlW2oWuEEbHOvtGkU7Gsk+saqtALBYqkVlZ1pOMtYdhwTWhFWeyekDkBAOiITqsiX3
	14p375VKDES11/jQBujfitgC+UL5POeQ4x+fk6+2POq1FGRiE1sWtG3EtFO9gMCp2FHTD7N5RMnBn
	qd1OmfWOKksaBDvsyQZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoXt-003qpu-IS; Wed, 08 Mar 2023 07:49:09 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZoXq-003qoT-Sr
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 07:49:08 +0000
Received: by mail-pf1-x42e.google.com with SMTP id ay18so9678557pfb.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 23:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678261743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hUSXP8OPeE+Py/tN+GtoDlukZn/IgN2ig58WnMx/+RA=;
        b=nb3in7NEA5qhA5G8RrgaUoTYwwXjWdLVHtpSaRXkCTmVKHIzflSZ8n1lDNd9rmNiit
         ZBpd34ePq9Q1piGKaPpcbRF59QcxObZxblyuJjrX75Wb/6sFSmEyWvJFNwcCZKPBf985
         HGSDNoASX96PyoVo2MpK2ySx57zhskymZ4yJToxjldIXf6iFtvqLo8WnEuzVndWdnKPx
         NLIA2aA8AMTIt3I8hWL9bA3iWk+WB+2TvaQsJK/riRY3YYhSDEK8irNsph2d4u3z6udk
         XGCLxVe097Bib7j423xQ8wSCI3OXMz+7/Z9Z9kjLW5wYpQgOk4CcNow+wNElFe++rUFs
         3G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678261743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hUSXP8OPeE+Py/tN+GtoDlukZn/IgN2ig58WnMx/+RA=;
        b=1bwZGWvF251mx+a+X9vrXPMTVx6x7fK/qolo7mEtnGb0aLLobwm6tvBrFPKoaG3V+y
         RjixlywxPfvlSUybLn6l+/nI+zDQ5pO0PFtUDq0BZg8U2EWC9MTisVk6byZ1NLq7HM83
         UpHpMW9slDUx6RCfU+Aqv5ov+cSLrx2htgtlSe4E8sxStLIlaiW9LZH5Firzwnh7DpS1
         Q9qndFuBVEsx45Z9anTOv6qf0qhf6QkYeNcs/X7hnfiAyQl7lnQn1jTa6oyP9K0X/RvO
         9Tf1Y04svIHDaREJelc+DrJaNK5w/svsWO3qEDudasYCIAMFbbO7m2w45NK3iCXu7S1A
         0sPQ==
X-Gm-Message-State: AO0yUKU1OmcMhK83OTeHpIiKRbM3/pEJVtUCQlbtIa45Dx4XaUNZf2AY
	7OMx1lQWjnV1yJfbX1/sOl4=
X-Google-Smtp-Source: AK7set8uhW3+JOZeDvxJ0DIYyuROTyt/9jRCEIaLzbRwlCglsntZglA/zPApA7OtNCGVysrTb/5ilQ==
X-Received: by 2002:a62:1b89:0:b0:5db:ba81:dd9f with SMTP id b131-20020a621b89000000b005dbba81dd9fmr14633245pfb.30.1678261743449;
        Tue, 07 Mar 2023 23:49:03 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id b9-20020aa78109000000b005a8e97fc71bsm8873038pfi.84.2023.03.07.23.49.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 07 Mar 2023 23:49:03 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v14 0/3] riscv, mm: detect svnapot cpu support at runtime
Date: Wed,  8 Mar 2023 15:48:50 +0800
Message-Id: <20230308074853.4393-1-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_234906_972273_5F1023E4 
X-CRM114-Status: GOOD (  13.43  )
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
Changes in v13:
  - fix warnings reported by patchwork
Changes in v14:
  - rebase on for-next

[1]https://lore.kernel.org/all/20230128172856.3814-5-jszhang@kernel.org/

Qinglin Pan (3):
  riscv: mm: modify pte format for Svnapot
  riscv: mm: support Svnapot in hugetlb page
  riscv: mm: support Svnapot in huge vmap

 arch/riscv/Kconfig                  |  21 +-
 arch/riscv/include/asm/hugetlb.h    |  34 +++-
 arch/riscv/include/asm/hwcap.h      |   3 +-
 arch/riscv/include/asm/page.h       |   5 -
 arch/riscv/include/asm/pgtable-64.h |  34 ++++
 arch/riscv/include/asm/pgtable.h    |  39 +++-
 arch/riscv/include/asm/vmalloc.h    |  61 +++++-
 arch/riscv/kernel/cpu.c             |   1 +
 arch/riscv/kernel/cpufeature.c      |   1 +
 arch/riscv/mm/hugetlbpage.c         | 301 ++++++++++++++++++++++++++++
 10 files changed, 490 insertions(+), 10 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
