Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8BFC636D6
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+w4bgboYZqmx1JdAjKsbynN93XSlhdEwVkWqmqZ0pmA=; b=Z4ijBDu56dY99f
	FWH3zGLY24w/SFGH8FiOuq4F/jRUao1OuCf8qItS1gLzUeZ4oVPgwgCrj5XXobTANiVLd65GYNkX2
	ONQ8KRpStDecs8hyFYB18HkSbrhsbBOV8JVPLTdGTzbtbu53JqUfMikidmQYQ/wB3T+fqCAOa5vKF
	NaXtW9ATgghUeVg/QFLZZ6GIHt8G0o/9Ncheg4XFZ+k5tIBiAc2bBCCWV6xgwy950HumRd+ElLiur
	85afQkPsxGLvQn+U8wx4Bpg2SPTv8Js4ZoWJVdPdUbFsiRLm8e7kuCh1/hvc1PrTiHPex4LXDinVY
	M0NfRR26b2o7zpSe+vZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6nV-001dwH-38; Thu, 09 Feb 2023 13:17:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ6nR-001dtP-7s
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 13:17:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id 16so1268992pfo.8
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 05:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kbbfEWRv7G9gX8mGj1xvGr8d6OmNuwqiebY8Ss8OvlQ=;
        b=kgvzm/yCqIFu4k3AKAawaBsHhGlgBitqUYLxdW+iv5PRni6UMqh1vbpTeoRuLPTbAO
         67gL0DD39QGvNw3+qV+p2crO9aQsmXRMdM8W5wTb5IYdj7GPmR4Ybk87uYPiyB5/L+f3
         m9wo5QtFkRrOxm2y/FBpSbboOS4hpsP4N6UGCAyOCOwpVonDF5ClAc56biMMwW+ZFnj9
         AaA7pQ4hxVTIFDuTQYCCw+Nsbm9KhdtbuP8Cw23+/jnKE18I3VKQhXXV2KM/wSekZlbJ
         uBLQPxQFgOMIUYyis0fmCGIAJGbnjNOSZmZWd6nM8eh6ojJEdLIPuPFeidesEmlmcFEx
         3ulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kbbfEWRv7G9gX8mGj1xvGr8d6OmNuwqiebY8Ss8OvlQ=;
        b=bhUQQVK0dD81Em2XAxlRMcXriq29RdqCGm/sCClCLWlIQ39duwDQO5i4obEG9Q36cL
         1AwbpC+TJ8kPutufW9DV/Hcoij0m8uMMGftfvc8irstTJ8Gx3LOnI/uBVxyvyRuBExQ/
         g1/AlY9DDUraplDrcRIA0MDlTjY346u/EanGY/g5M6Wz+zNHZg8Ns4BCRcwAEnzKwy64
         /6Zde+BEw1HoxpLRMYUArbSk1E2XlgfXJww+qA4gn24mukGpVtorE/sH1RpWBaGsjNmz
         vWFhlV0pBzoMIfRPGBK0MxXpQ7sh3c1hmOZv5tBi1H+iXcUICfH7CoSWAfmF1ldG3ot2
         F44A==
X-Gm-Message-State: AO0yUKXk3RHGOnSDNocr13kXTRtmAzw3y/Js53AEyZNpPZ9TvAcZUVxm
	KYDL7fTkWjMJLogPsmo7+mU=
X-Google-Smtp-Source: AK7set8PaM1ZfurbtbqMrZC497WaCqBOs9/WtTFYa6gEkpcFdEslG3Fef84l0Gm2jpcKww0Dp7iMeQ==
X-Received: by 2002:a62:17ca:0:b0:5a8:4eef:4dc9 with SMTP id 193-20020a6217ca000000b005a84eef4dc9mr2718135pfx.7.1675948615726;
        Thu, 09 Feb 2023 05:16:55 -0800 (PST)
Received: from localhost.localdomain ([47.75.78.161])
        by smtp.gmail.com with ESMTPSA id s4-20020aa78284000000b0057709fce782sm1401414pfm.54.2023.02.09.05.16.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Feb 2023 05:16:55 -0800 (PST)
From: Qinglin Pan <panqinglin00@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: jeff@riscv.org,
	xuyinan@ict.ac.cn,
	conor@kernel.org,
	ajones@ventanamicro.com,
	Qinglin Pan <panqinglin00@gmail.com>
Subject: [PATCH v13 0/3] riscv, mm: detect svnapot cpu support at runtime
Date: Thu,  9 Feb 2023 21:16:44 +0800
Message-Id: <20230209131647.17245-1-panqinglin00@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_051705_324946_F813B805 
X-CRM114-Status: GOOD (  12.97  )
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
