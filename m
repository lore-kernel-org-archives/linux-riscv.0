Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25BB4ECAAD5
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WjiHMmAIorIWcnCfJ3vDZ706hNiblG3FIB3kX1uXRU=; b=MA2OI1CMmB9zHk
	kz242cz/3AFGW9e42gX9q0+srP9qiFvDgh+4SDMQq06bwUZKQWkeWjyRcOeFRMJFznwfZOEkdtdzQ
	KFTqrUKYC6vP0wqny3sKi5lK2YBI94ZNgZmAYGATrol6XzYHadLm9OQZSFkxChCIO4j794fAxIkAL
	08h8/v2xEPpcIm2TB/BTK+q9ohZmzCYEzb+b+Hhtcs1gmE2W4CfWIhl+Oxq3ixPDEW0aB1N2GBiMU
	uc1TfOJ+Q7EaryJ025PTP7mgfc+8lFAKS8WUg/ZrndjixI07Oso+QUPcgUtaEtDa1eHxa5T6ipUG0
	Rws9szjvoQW5XbJdszDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVcAF-00FotR-HR; Tue, 06 Sep 2022 17:15:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUVwJ-00DXfN-W1; Sat, 03 Sep 2022 16:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9DF10B80113;
	Sat,  3 Sep 2022 16:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B086FC4347C;
	Sat,  3 Sep 2022 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662222248;
	bh=4wnHKgI1sF3IcbMUbpdpG2yP3fAL6XiOQrQMZqZXaeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGUAAC8RC0eVhwtjiS0bR/Q8WIPV9THDm1YJztneAdoVtORUgHtd+hZDkVgn58VaH
	 q4NKORjqjc15C0xqPjCmYS+vMqhkuDLxIwi5vomMAGLUmP0ifSaDyyHm7wSO0C7d7q
	 LzOPq6F/PcdNYQqZw0/BTzXeKZ4NZFOqq/cVmucbs3e6X7toyYxFxf8fH7jsy/mmhL
	 hkHUtQiJo/77jD8pMIVwVJKihcgczjqh/2iyBBSCRkHF5IGvi6ZJjOWyueZVc9PvpM
	 sB+BcIKgOmGQ26NjGshy7jFk+Wqx1N6UNpkpzRz6Zxy4muPUrIzSmT+03KT8kBR58B
	 4UqfORNcVSjmg==
From: guoren@kernel.org
To: oleg@redhat.com,
	vgupta@kernel.org,
	linux@armlinux.org.uk,
	monstr@monstr.eu,
	dinguyen@kernel.org,
	palmer@dabbelt.com,
	davem@davemloft.net,
	arnd@arndb.de,
	shorne@gmail.com,
	guoren@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	heiko@sntech.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	sparclinux@vger.kernel.org,
	openrisc@lists.librecores.org,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	linux-efi@vger.kernel.org
Subject: [PATCH] RISC-V: Add STACKLEAK erasing the kernel stack at the end of syscalls
Date: Sat,  3 Sep 2022 12:23:28 -0400
Message-ID: <20220828135407.3897717-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220903162328.1952477-1-guoren@kernel.org>
References: <20220903162328.1952477-1-guoren@kernel.org>
MIME-Version: 1.0
Received: by 2002:a05:6358:d14c:b0:b5:5552:ffdf with SMTP id jz12csp1220302rwb; Sun, 28 Aug 2022 06:54:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ElN+kC+WGTtEuW6zaafSSE48HmZIOQaw9qbK16XDS+HpU3pdJbW7lwaJhjmztSOrMpk3M
X-Received: by 2002:a05:6402:34c6:b0:43d:8cea:76c0 with SMTP id w6-20020a05640234c600b0043d8cea76c0mr13855709edc.268.1661694864907; Sun, 28 Aug 2022 06:54:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661694864; cv=none; d=google.com; s=arc-20160816; b=FDLrZ9676XGEEHU7NueNqApkM8GmVIcAKSJwApcXjKOlcdV0i/5uInZBkkEyus6OOK gO8QOkPIO6gth9xySpiTHXs9ITQbE012g93sC41JVibWTdT8nvqJfaG6l/sWxJGJ+4JS q7jsIz6hHO3I0pya6w5noycujzDH1LsFsmf/qKDn+rFkFQwK6XzrVc8xylRxTfaUV++o CI89bV7JGQfzP0IzsPUOgedNwssYGHr3p9dzXlloUdpfu1cR7Wy2SLE7f0BLtZEvXG05 Z7W3DsvdxCA5MdHQZc4peGLF7rGKgO0cmCwpG/ARt3fEgrCqS831Zl46Wj6dtACNUR8+ WfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816; h=message-id:date:subject:cc:to:from:dmarc-filter:delivered-to; bh=9Z755IwHsGwAdjiB31u+/0C+sRfqogUyVad8Qp7RNHI=; b=p1kUQcHGFa/m9tLw5NAAZfkA4Q+mZ7i+L5huRdP6V+/oQdnzmPqTwxRfVDVTYFipuQ RoEnmg6nEYoXWwH40UA4JReJiRBO8G3S6DWGCPTCbd4UmMVZe/4TYueWU4PR8fNv3DU2 KxKiImjhYNiW6fNCMD8OjAYfYMfRSB1C4YFqvckY7iipcyXQkzOz4hYarA04dc/dT85z uyNiXJTT9JXH7jQw24vDalwUlz9V/236UEmm1sHV1lzPPd6e3Wq8MfBmxQY2B2QlkziS NVVUgmWSH8cI9v8goWDz2h2DiWpxnjVX7F3MkO0PjTlPo+Icoh8NrPxwa19veZfg+WBz Ji+w==
ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com: domain of srs0=s5hw=za=linux.alibaba.com=xianting.tian@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom="SRS0=S5HW=ZA=linux.alibaba.com=xianting.tian@kernel.org"; dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Received: from ams.source.kernel.org (ams.source.kernel.org. [145.40.68.75]) by mx.google.com with ESMTPS id eh13-20020a0564020f8d00b004472b35d7a5si4321456edb.309.2022.08.28.06.54.24 for <guoren1983@gmail.com> (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128); Sun, 28 Aug 2022 06:54:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=s5hw=za=linux.alibaba.com=xianting.tian@kernel.org designates 145.40.68.75 as permitted sender) client-ip=145.40.68.75;
Authentication-Results: mx.google.com; spf=pass (google.com: domain of srs0=s5hw=za=linux.alibaba.com=xianting.tian@kernel.org designates 145.40.68.75 as permitted sender) smtp.mailfrom="SRS0=S5HW=ZA=linux.alibaba.com=xianting.tian@kernel.org"; dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=alibaba.com
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) (No client certificate requested) by ams.source.kernel.org (Postfix) with ESMTPS id 82A4BB80A53 for <guoren1983@gmail.com>; Sun, 28 Aug 2022 13:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) id 4AA8AC433B5; Sun, 28 Aug 2022 13:54:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6C4AC433D6; Sun, 28 Aug 2022 13:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6C4AC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0VNSFve4_1661694851;
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VNSFve4_1661694851) by smtp.aliyun-inc.com; Sun, 28 Aug 2022 21:54:12 +0800
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_092412_361198_A8FC9297 
X-CRM114-Status: GOOD (  15.27  )
X-Mailman-Approved-At: Tue, 06 Sep 2022 09:59:10 -0700
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
Message-ID: <20220903162328.dNfP7ctbFyga2X_UNN4VBjU_-OkOouF4hkHlGTrs38A@z>

From: Xianting Tian <xianting.tian@linux.alibaba.com>

This adds support for the STACKLEAK gcc plugin to RISC-V and disables
the plugin in EFI stub code, which is out of scope for the protection.

For the benefits of STACKLEAK feature, please check the commit
afaef01c0015 ("x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscalls")

Performance impact (tested on qemu env with 1 riscv64 hart, 1GB mem)
    hackbench -s 512 -l 200 -g 15 -f 25 -P
    2.0% slowdown

Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/Kconfig                    | 1 +
 arch/riscv/include/asm/processor.h    | 4 ++++
 arch/riscv/kernel/entry.S             | 3 +++
 drivers/firmware/efi/libstub/Makefile | 2 +-
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ed66c31e4655..61fd0dad4463 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -85,6 +85,7 @@ config RISCV
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
+	select HAVE_ARCH_STACKLEAK
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CONTEXT_TRACKING_USER
 	select HAVE_DEBUG_KMEMLEAK
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index d0537573501e..5e1fc4f82883 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
 				   -fno-builtin -fpic \
 				   $(call cc-option,-mno-single-pic-base)
 cflags-$(CONFIG_RISCV)		:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
-				   -fpic
+				   -fpic $(DISABLE_STACKLEAK_PLUGIN)
 
 cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
