Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B55C54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D7MO6uVdzTsVLhJvyDUAzPBGUmykWkSBEsHDIfTdBQg=; b=OYTyAkL6eTlWmv
	BjGjNoyvYciVdITZKbZO9p2o9FBlYrwVcQH8H99796Q+22tDsRMcalb9W9fPyhHJy+H7BDB1olv4l
	jkvd34mfmaFRR6atm2qN68Ih5QYi2K7uOwr7aZxrMn1QC2G3MDwc2HGKqBx8UrHpGMjDLIZaTZW/A
	4sPyk3H9cS9DJvwRIWZuVKGkm+AtWvbzDopgCHf9l5psNp9xMfPKPi6z8p4/Y7vniyjwY76uyPvsO
	ncFQAnT8/wgO0g/Yz2XbRZ1FuaLRGRwrrWpH+z8b0fVUYWjWdKLyVewZhzscPy/89KzzpSmbjHOqY
	aErOVhFH8wgoplqx6LXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLSgn-00FvNG-In; Fri, 27 Jan 2023 17:39:01 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLSgk-00FvMG-4M
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 17:38:59 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b10so5258803pjo.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jan 2023 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKlQkDrU+FhDbUHr7ll6e+3docJw0mBRlDmwBYrsumA=;
        b=xkfdi7YffwB8EjLS+KtM0e9bLfU15C64FOlzTDdw6MuEIij4bQzHcNu3ai04eWWnYo
         H5ZSdMYBefho9TroiIhksOw9SKWTlwu8XpZ9xN0NNDBBo5fZzYFIgGv8WqxJsFslKZRR
         D/ZPgsYWPSLx8EItWAzivik+QMWS/r5cVxqDMBKhZmQQEgb4b4BVZhuDntKOI4l9pPvT
         fWp3JeQJRTzW30iiypOF2sz3Kj+Sf1p3n3ncLVGNF0BFxMnZitUna1qqGjWG6tJfrdb1
         7F2mt+iYySNyypv2Og1nFXPLiqVSEUkovwv/4g+SLwi7xB1Zw1cb+I4zm7cJKBbzQN9t
         0Usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKlQkDrU+FhDbUHr7ll6e+3docJw0mBRlDmwBYrsumA=;
        b=YiuMecMKSUrkR8Y7yy59p5WRM9BBoTr1T+R4gss5TT1dA/joBPzOOkeDj4EXomEFzd
         gq+Jq2YDhxc9kcE/FZdfXkBDxLk0qlXgmHgBhMJfa0SNKvwk2Yw17uAdB9eUeYKJn260
         ZJiNo+c0hk1YHczKYg2dZ+q6DYasg3C3A5laJqEUNAh6ceYuYfAc0K4i2P6pgmFAhK6c
         XnaIwVnCp+7FrZ5IWb2mc66/h/P937bvJj9Oi/jBSTzqwxKiiuqt2A3PaWRNudiMp41f
         M23O7MmmLrMlGVHQ3/JTM38go1X7Y5/njqtybQZ58Ty/QvU37Wnfdvo1zdnEzYE+4joh
         f59w==
X-Gm-Message-State: AO0yUKWlsB3LMgdSyf8auwpMN9Jrodg2SKl2WQfvxSLCOKZFLa7yvzhZ
	dXmXDxoOrsK8SXc4//Vsx1VOPIqC0PxFc9VR
X-Google-Smtp-Source: AK7set9Z0LxYy822GwxaEBoObkgqDRCDK0h9v5fq4KLiffFD1N57M/xUiETVvje5Q5g3Vf+eMN8SAQ==
X-Received: by 2002:a17:902:d48e:b0:194:d4d1:2928 with SMTP id c14-20020a170902d48e00b00194d4d12928mr6716274plg.50.1674841134811;
        Fri, 27 Jan 2023 09:38:54 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902d34c00b00194b37940edsm3108039plk.268.2023.01.27.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:38:54 -0800 (PST)
Date: Fri, 27 Jan 2023 09:38:54 -0800 (PST)
X-Google-Original-Date: Fri, 27 Jan 2023 09:38:12 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 6.2-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e9212465-c032-4266-b8ea-a40f2bdcc767@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_093858_435905_0C9B57F4 
X-CRM114-Status: UNSURE (   9.90  )
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

The following changes since commit b9b916aee6715cd7f3318af6dc360c4729417b94:

  riscv: uaccess: fix type of 0 variable on error in get_user() (2023-01-05 12:30:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.2-rc6

for you to fetch changes up to c1d6105869464635d8a2bcf87a43c05f4c0cfca4:

  riscv: Move call to init_cpu_topology() to later initialization stage (2023-01-25 07:20:00 -0800)

----------------------------------------------------------------
RISC-V Fixes for 6.2-rc6

* A few DT bindings fixes to more closely align the ISA string
  requirements between the bindings and the ISA manual.
* A handful of build error/warning fixes.
* A fix to move init_cpu_topology() later in the boot flow, so it can
  allocate memory.
* The IRC channel is now in the MAINTAINERS file, so it's easier to
  find.

----------------------------------------------------------------
Conor Dooley (3):
      dt-bindings: riscv: fix underscore requirement for multi-letter extensions
      dt-bindings: riscv: fix single letter canonical order
      MAINTAINERS: add an IRC entry for RISC-V

Heiko Stuebner (1):
      RISC-V: fix compile error from deduplicated __ALTERNATIVE_CFG_2

Ley Foon Tan (1):
      riscv: Move call to init_cpu_topology() to later initialization stage

Liao Chang (1):
      riscv/kprobe: Fix instruction simulation of JALR

Masahiro Yamada (1):
      riscv: fix -Wundef warning for CONFIG_RISCV_BOOT_SPINWAIT

Palmer Dabbelt (1):
      Merge patch series "riscv,isa fixups"

 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 MAINTAINERS                                       | 1 +
 arch/riscv/include/asm/alternative-macros.h       | 2 +-
 arch/riscv/kernel/head.S                          | 2 +-
 arch/riscv/kernel/probes/simulate-insn.c          | 4 ++--
 arch/riscv/kernel/smpboot.c                       | 3 ++-
 6 files changed, 8 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
