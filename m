Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167FFC636CC
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VTNssWJV9swt8IuZztS/0JpS4Vo5+8F4YP+NxLVCGAY=; b=aOn+La2rCOM/N1
	j5q4aLT7gDgj88fVk2MEtaTozY+8wYIcthhv2o1vlF/MJOFgxP+aRgAIC50Y4soxuHjcm7+Qi70Tv
	y0vWnKFl+dj8M1pJn7Xyd8wphGDJSxABcnRN+K/2NKTTpAanRxCYxnutIEWquFwuujDTVPCZaol7f
	eYSKzRuPNqy9CT2hLPYoVU+eZhOdJQy41IJ0t8fF7WGprr3fdopsSwTfiTiX39/DfbVeoiyA7hsfb
	zvbs7lE5VrhCc7iuxH3sCwsLsJ2XVjYWZX6nAJRSV8kxGXTFeqSlsHDb1MOHE42trQKd8HmsJbcfm
	FqTQuXMUuNNffdJSBd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ82-006H0h-AS; Wed, 15 Feb 2023 14:51:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ81-006H0L-QH
	for linux-riscv@bombadil.infradead.org; Wed, 15 Feb 2023 14:51:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ctWJSElYx/FpQ+Il/jr6fw9xbpiBuK2KMIX0fff726o=; b=eON7lkMTI3pTQ4kIww2mp2p1BF
	g3H/J0dCJWfF26Tg96Z5ZTDMwOqoo/xKqekeeOMVwkOmKQSG84pkaZVZP7EA1iNNI4G50cUSXrix8
	XMVC02jM4pVitWvHze+LERniLyT34exRKJ0GgDzUnxWrg6usQntD5oMxTY5NoZEJxyuFqejamanV/
	pUk8OIaAl5T5MLoMEO8bRHCiEZmQy/avmMA5hiuu/XROjuzbfizug4nJ3DJA2zStgFEAPI3r49WQg
	W4Esw0UWgyrTeXRHKiY/mc7kllfa2tKd6CMosmCZCMZ5bdLrzRbi/iPdRc7l2ZilW2ICB8pnyC9j9
	fTc2ggIg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pSJ7G-009xsi-2x
	for linux-riscv@lists.infradead.org;
	Wed, 15 Feb 2023 14:51:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id by3so18103823wrb.10
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctWJSElYx/FpQ+Il/jr6fw9xbpiBuK2KMIX0fff726o=;
        b=GLyffEPMYlT/cmqtzo2hfct/e9+r4hBtyDtRC0QOsgxl5uG2zZYS2aCeBLUuFLsLqo
         8+EWhE3A1okDf4bDVnsCqQh0zxTcTgI3IgDy3ipTGvN5RnxzX5bgBRFJ0Vj5GFgyKzQ+
         wt8YZ2u0Imx2utyxu9hadRnNSm0/IAzax1OHpC5qcF7/RoD3qznLt+K6ps/tHRTi2Jnb
         piFePO8J/H/acKIh43ArzCYPygQ9tUbRj7rz3nDujjJEhM2YvC5y3L4VDSAtKs6HERy6
         X2lnmKW9ak0eHD5b5b+67yNd4M4yCK7/yIO6dLFdEuI00JPlYwg/UgxhH7hOpj+2NrM6
         aYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctWJSElYx/FpQ+Il/jr6fw9xbpiBuK2KMIX0fff726o=;
        b=aV0OMtDPuNWHGUJEeBrgLwlU+D++LrIH+m0P8/g0bE7hlC/crLKtwacwt4mhJtHWKj
         5tZQRkd9YVM4FoG/u5YjdNtXbJKbvdhM3N/hE3CoDJbCkYh7bsWaSEDkC//TxoE6aKam
         nrFhOhCpaKZxG8C3rb2w/PjFhL2PQh6YcznBT7uqqp/F2FyVJqTz0JYvlK2xF8iAQS4X
         naCaRIARJNTlNgR8HM4Ali5ZYTMBRSIOGa3ZVnx3uy8biPSMFkGDUCsJiiduih/V/vvq
         6IupkI36UUHdBAwmekshD6R25BqW6lG44SspBXUckXpTDGzqGPrmMaIZiqJXD/aR342c
         q6Hg==
X-Gm-Message-State: AO0yUKVqSWXGchIJwppr/2qGQNBV+25H95gAAKPdkvtvvkhsnTEyIZLn
	6S8D6mAbdq+chf20mfIU8h1SCg==
X-Google-Smtp-Source: AK7set+Nq5t/4Q7aVf6eQyb5vxlI9IEku3M0RuLvSxT47U9GMbWRMLO9/X1s/whi16YDzCCafZULdA==
X-Received: by 2002:adf:ecca:0:b0:2c5:5943:27e5 with SMTP id s10-20020adfecca000000b002c5594327e5mr1877958wro.15.1676472676157;
        Wed, 15 Feb 2023 06:51:16 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr. [2.7.42.160])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b002c54e89fcadsm11022524wrh.55.2023.02.15.06.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:51:15 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 0/4] riscv: Introduce KASLR
Date: Wed, 15 Feb 2023 15:51:09 +0100
Message-Id: <20230215145113.465558-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_145121_479280_BEB8AF7E 
X-CRM114-Status: GOOD (  13.64  )
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

The following KASLR implementation allows to randomize the kernel mapping:

- virtually: we expect the bootloader to provide a seed in the device-tree
- physically: only implemented in the EFI stub, it relies on the firmware to
  provide a seed using EFI_RNG_PROTOCOL. arm64 has a similar implementation
  hence the patch 3 factorizes KASLR related functions for riscv to take
  advantage.

The new virtual kernel location is limited by the early page table that only
has one PUD and with the PMD alignment constraint, the kernel can only take
< 512 positions.

Note that the patch "riscv: Use PUD/P4D/PGD pages for the linear
mapping" is necessary to retrieve the memory below the physical kernel
address, so that the EFI stub does not have to try to relocate the kernel
as close as possible to the start of dram.

This patchset is rebased on top of:

Introduce 64b relocatable kernel (https://lore.kernel.org/lkml/20230215143626.453491-1-alexghiti@rivosinc.com/)
RISC-V kasan rework (https://lore.kernel.org/lkml/Y6TTvku%2FyuSjm42j@spud/T/)
riscv: Use PUD/P4D/PGD pages for the linear mapping (https://lore.kernel.org/lkml/20230125114229.hrhsyw4aegrnmoau@orel/T/)
riscv: Allow to downgrade paging mode from the command line (https://lore.kernel.org/lkml/CAHVXubjeSMvfTPnvrnYRupOGx6+vUvUGfRS3piTeo=TH2cHKNg@mail.gmail.com/)
base-commit-tag: v6.2-rc7

This patchset was tested with u-boot boottime service for the seed on:
- ubuntu defconfig + kasan outline (sv39, sv48, sv57): OK
- ubuntu defconfig + kasan inline (sv39, sv48, sv57): OK
- ubuntu defconfg (sv39, sv48, sv57): OK

Alexandre Ghiti (4):
  riscv: Introduce virtual kernel mapping KASLR
  riscv: Dump out kernel offset information on panic
  arm64: libstub: Move KASLR handling functions to efi-stub-helper.c
  riscv: libstub: Implement KASLR by using generic functions

 arch/riscv/Kconfig                            |  18 +++
 arch/riscv/include/asm/page.h                 |   1 +
 arch/riscv/kernel/pi/Makefile                 |   2 +-
 arch/riscv/kernel/pi/cmdline_early.c          |  12 ++
 arch/riscv/kernel/pi/fdt_early.c              |  23 +++
 arch/riscv/kernel/setup.c                     |  25 +++
 arch/riscv/mm/init.c                          |  31 +++-
 drivers/firmware/efi/libstub/arm64-stub.c     | 110 +------------
 .../firmware/efi/libstub/efi-stub-helper.c    | 147 ++++++++++++++++++
 drivers/firmware/efi/libstub/efistub.h        |   8 +
 drivers/firmware/efi/libstub/riscv-stub.c     |  27 ++--
 11 files changed, 281 insertions(+), 123 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c

--
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
