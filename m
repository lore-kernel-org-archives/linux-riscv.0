Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552D3C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 12:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3aejuJP8x/V9X3VVCQsRQuYcrwaVK6Nx0yR1fTycN58=; b=ipHGCkr6dJdU85
	EwZEGIkeqr0ww3IpRqFiVaDASTnWzUTXt1hfrLl2Fw06FiUKb4HdIfTnFnSxNwCVvC7NXqUljDjzN
	VJFSaO9L8qMs0A6RWJbzjxCgL80yI0OVO+uSEAXdbKIu8A1IP2N4gRqCjq6Cetrbd+KPhgokzPKoq
	9uLlb3CHQV6S2SC133vBN38rUYQ1qhvw+wQpYe9/TTiKponneFfBEAfGbVE0rL1KjnjDKMxb9fz5t
	5+lIMTJgEo6TfR8jYDijhGHz0e57ny/iMwrWBP9DCcOBkNys9KgxTHpjsfR1xxdCFUs5Nsd+Y8PYA
	NGv7gtsoJl5hTpYMcRqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puXkl-007mNd-11;
	Thu, 04 May 2023 12:08:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puXkh-007mMo-2S
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 12:08:05 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30644c18072so250699f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 05:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683202081; x=1685794081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z/HOoqmO08h3u2Yvh7Ep4JiYOBfgZY0A+BuaNi4hKi8=;
        b=rH4Kg6CiTjM7F3xylJNwT4SBXybDUmEgdrx/v5oelKsA9dtaYw5OM0PRHGaRRdn76d
         7QF4Q7HdK7hJA9oB/cs8bi8MD8HT2QCBT6zwqo18Q0fI4fhkn+GUD4vS9fVqjRU0Nuku
         r8QHfkcsEIXrFoOJypBRximVoOzEIX2cj/5i/PDWcmYHcqadbSYrg3NOqPhk3FjIiQCt
         xpynI+Q5WAMJT0+PRB9aKDclfgUGfUWkFl+2kPG3Q+WiHxuqED2QCbdYGvY1ZpVOSNAP
         2T3hFtieuW2ZI+6mbLAh5kqeYJqHLXsSnwnDWsD9kkSkPxipLWsy5mrz0b6RxmBWqLhB
         SloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683202081; x=1685794081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/HOoqmO08h3u2Yvh7Ep4JiYOBfgZY0A+BuaNi4hKi8=;
        b=SZbn3U38mtST4TmBaSFCUJo3Ew8hLFIJRHQO6XVhn7pAth7ARaWMSqerHp/ikAN1oE
         njo3RcmckXQhn6k+47a2aqc7Tt9iOYy6Ihmj4a9ipkXLr3slM09iyDbwres5ga9S3zn3
         jUcRdP9Bb2HQ/+I0Dnrnusv+j6TLf8LR+hBg59cZGVnbQoNm8hPXpU6j1rISoaEgADSn
         9BBD7/nHlfTNTUdobGqqQQPzsLxaKO37ewSVqpv/nbswiLOqIJsxbfYKJNVqCnACKWG3
         lN4QECvk68Y50hU7qkbtI+OOLjdwZ43kwNszLhDsnib7tgMQ8uQMX7jePHPkxeJ/fgxC
         MxCQ==
X-Gm-Message-State: AC+VfDyCZpG+8isJ/MtNUG6wjMgGAX+Xh4oz8ORn6dRs8b75vt4bLakz
	5kEAtuwIw+tQC0YcB1nQ64X2ow==
X-Google-Smtp-Source: ACHHUZ5hzqq3dnn/lEi88tYMgY4qut+pP1uM8kWq0ar6fkaOkqDMCTR5l2AkNdgegQ6EMAeNddu3NQ==
X-Received: by 2002:a5d:6504:0:b0:306:4943:2e18 with SMTP id x4-20020a5d6504000000b0030649432e18mr2176434wru.58.1683202081312;
        Thu, 04 May 2023 05:08:01 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s4-20020adfeb04000000b003047f7a7ad1sm27433451wrn.71.2023.05.04.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 05:08:01 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH -fixes] riscv: Fix orphan section warnings caused by kernel/pi
Date: Thu,  4 May 2023 14:07:59 +0200
Message-Id: <20230504120759.18730-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_050804_017213_5D5794AA 
X-CRM114-Status: GOOD (  11.59  )
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

kernel/pi gives rise to a lot of new sections that end up orphans: the
first attempt to fix that tried to enumerate them all in the linker
script, but kernel test robot with a random config keeps finding more of
them.

So prefix all those sections with .init.pi instead of only .init in
order to be able to easily catch them all in the linker script.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304301606.Cgp113Ha-lkp@intel.com/
Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/pi/Makefile   | 2 +-
 arch/riscv/kernel/vmlinux.lds.S | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 741b7bd3a84c..07915dc9279e 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -22,7 +22,7 @@ KCOV_INSTRUMENT	:= n
 
 $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 			       --remove-section=.note.gnu.property \
-			       --prefix-alloc-sections=.init
+			       --prefix-alloc-sections=.init.pi
 $(obj)/%.pi.o: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
 
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 305877d85e96..e66e26640f63 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -84,11 +84,8 @@ SECTIONS
 	__init_data_begin = .;
 	INIT_DATA_SECTION(16)
 
-	/* Those sections result from the compilation of kernel/pi/string.c */
-	.init.pidata : {
-		*(.init.srodata.cst8*)
-		*(.init__bug_table*)
-		*(.init.sdata*)
+	.init.pi : {
+		*(.init.pi*)
 	}
 
 	.init.bss : {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
