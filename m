Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B76C04FFE
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLtrCfbttd+0SoJ/XWq97uXEn3Y6mqjQj0v8g8tzwek=; b=mS3XerJdiSp9ri
	FPMNXV0tgQ5s3aMABWjoFUV6XQOnNrA08xoa/9SN8eKn0Sq19hRWovu3GPRW/U1KEjUNVZVu5CgcV
	JYCL2uiv9Yh+0PvORv8AOAZwhBMqDwGqIxP7s5Nv0XgN507hA3jCk+4lTzjwrsPuoRSgBxJoLAXQJ
	aZ0fL0AHzD1zfBstQOkBlbE2ssh1yhNV0FzdZ6B618DOGxd0NX+GAZpqJ9JbGG+CDmYijLUYXOiNI
	P1Vdd8AEdd3lZNLTTOVc7vlykSu5pCtAYbuoEU0PLDHIRw3SHN0pR+gfPz5gB6LbEuzvDgUqy4nB9
	4fx5vEa8zb83YqwoIN+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQK-0000000CUFW-2I0t;
	Thu, 02 May 2024 11:16:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2UQH-0000000CUEC-3EZu
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 11:16:23 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AA2F7424AD
	for <linux-riscv@lists.infradead.org>; Thu,  2 May 2024 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714648578;
	bh=9viCGe21wce589SPhaLpq63lHm2lNcUSGMl+Cs89goo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=NO4JDrlJ5V2LYeF50ULo4EQV9cLEVNlN5VdXhHO7MsnrFLA1oiOVVzEKO1fmHacWG
	 mT0hu77H0BOKk+YI0JMlx+stCj7S0vfzXtcKg6amckZKFquEXK1e3Eb2D+zpivowjT
	 30heHPq39/+UfJR70IYhnkhe/nSXVO4AVHrV9nea6TH/t7F7+XCfIveCwGPuTmdn1T
	 e9aXjwk8zT9xfB+3kR7nWV8K3XLkGHUsCMWAWmHqT3+2W1bto/iJ9RxFDey1zQeWD/
	 p+de5hQ8bf4w5fgSmC4RjnB4wlhehE/qL6NkLHG5gGxotesCeH3rSmagCV5005N5dK
	 X+g7+tXeNBMJg==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a526a77445bso504988866b.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 04:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714648577; x=1715253377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9viCGe21wce589SPhaLpq63lHm2lNcUSGMl+Cs89goo=;
        b=MPHWwfYKK78MLrsVOL9ubXHB5vyvzOb5oFhTzFYcTJDhyKKMcNapmnsLodQu9Ij+h+
         ckxBa/Ks5M8bcbh+39si1FAV466if8wV4LuUirguON23AGCpvEdc8yUzC6HOlt+x7IET
         VniCYBWJWPGEOi0T4IpZqSsDIFwjY4aoCnuVCrifNz3z70fM0V5xoW2edZyPcpYYlM6y
         qmmWsy8aPy8Wpw+sLzMTLorpK5cH9/G3FvWf/MZqerFGmmVBtiAP/RCFk+VXIzbtmgGY
         YOsEjk+OR8jNhRMbtat5FfEVZaVVJczvYl0ggMRyRXC3Gmd4QFVFO9utuwFcqqw6yuUU
         k61A==
X-Gm-Message-State: AOJu0Yx50ZjWtq5n8py5ENNd7VSPMJmNok/EBXeZWMY1I0Y0GBevnMkJ
	ZdLPN3DneDW9oPOP3F7qJO5yht+66h8mZqXlfjdEp57RGO91Ag3QBwFHWidcFyA09GTnf2Yq/iI
	68jYeMBSJT0fgKmCZzQkgG9AjJ4m3WiFcaeA3yl1xJWLzjkOHbAS0xL1Nuh3Q0oO4SdvX0CAIXv
	b7rAwaAcQbz99LOg==
X-Received: by 2002:a17:906:2555:b0:a52:19ea:8df0 with SMTP id j21-20020a170906255500b00a5219ea8df0mr1225320ejb.66.1714648577760;
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0Myo75XOgrFJPJUQRXhMKXEEwYehp1jVRMzzcbJCBYoh68rOqDmHMkFSk+66SPyDzmCEKDA==
X-Received: by 2002:a17:906:2555:b0:a52:19ea:8df0 with SMTP id j21-20020a170906255500b00a5219ea8df0mr1225308ejb.66.1714648577553;
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id gs23-20020a170906f19700b00a4739efd7cesm437278ejb.60.2024.05.02.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 04:16:17 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>
Subject: [PATCH v1 2/3] riscv: show help string for riscv-specific targets
Date: Thu,  2 May 2024 13:16:07 +0200
Message-ID: <20240502111613.1380453-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
References: <20240502111613.1380453-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_041622_048303_DD5DFB13 
X-CRM114-Status: UNSURE (   8.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Define the archhelp variable so that 'make ACRH=riscv help' will show
the targets specific to building a RISC-V kernel like other
architectures.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/Makefile | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 29be676415d6..024482c68835 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -202,3 +202,20 @@ rv32_defconfig:
 PHONY += rv32_nommu_virt_defconfig
 rv32_nommu_virt_defconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
+
+define archhelp
+  echo  '  Image		- Uncompressed kernel image (arch/riscv/boot/Image)'
+  echo  '  Image.gz	- Compressed kernel image (arch/riscv/boot/Image.gz)'
+  echo  '  Image.bz2	- Compressed kernel image (arch/riscv/boot/Image.bz2)'
+  echo  '  Image.lz4	- Compressed kernel image (arch/riscv/boot/Image.lz4)'
+  echo  '  Image.lzma	- Compressed kernel image (arch/riscv/boot/Image.lzma)'
+  echo  '  Image.lzo	- Compressed kernel image (arch/riscv/boot/Image.lzo)'
+  echo  '  Image.zst	- Compressed kernel image (arch/riscv/boot/Image.zst)'
+  echo  '  vmlinuz.efi	- Compressed EFI kernel image (arch/riscv/boot/vmlinuz.efi)'
+  echo  '		  Default when CONFIG_EFI_ZBOOT=y'
+  echo  '  xipImage	- Execute-in-place kernel image (arch/riscv/boot/xipImage)'
+  echo  '		  Default when CONFIG_XIP_KERNEL=y'
+  echo  '  install	- Install kernel using (your) ~/bin/$(INSTALLKERNEL) or'
+  echo  '		  (distribution) /sbin/$(INSTALLKERNEL) or install to '
+  echo  '		  $$(INSTALL_PATH)'
+endef
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
