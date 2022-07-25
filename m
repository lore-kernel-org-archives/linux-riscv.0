Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A72C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 02:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYH2HyaF2bL1QdeKEJz8QJ7q9OhREOMrgHL3g2sHfCA=; b=1x7VS32OfkU/Y4
	SDFIlGVMwU9rnGgKXROgJqqxYL18pfZwQa1OVWzEqpmoM1PKk8z7vDEyLd5Imn+Qn8G8ICujydL7f
	6bK2LAEWgp9GpDuGQ70ByaK057jyMddMlfJbPd9iVH3DjRsL+9ytSz1u15B4MAk7z5ECqqknRgIQo
	wY8LdaZv7EqJo0E2IaUhw8EnkRCBpYFRoJdVLtH5z8Xyb5lZAB3wjlKckDgePAXS5xYu9ji4KuRWr
	YjmXbIJLjvDTGt6zaQyqsUvSxZiQbwEt6KqvcV74/WeQx4MkD3hI68bSx4SOUYFwhL99N7KpdQP2r
	8zUCoDq10RlXZLM8RPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnhw-000o6P-80; Mon, 25 Jul 2022 02:20:32 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFnhq-000nfy-P6
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 02:20:29 +0000
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-08.nifty.com with ESMTP id 26P2JX9d029536;
	Mon, 25 Jul 2022 11:19:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 26P2JX9d029536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1658715575;
	bh=+6537oUPB6uiy8KoPSUGDtwn8M1UnRpuDy1P24m7/P0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rZ3jOo5ZRxrN6vMecrwhsB88dZeMPk3V2YBF6xeqCEx5iEDUYdEfNf4EtLH7ZJcMD
	 KzSlOtMkr/Btyaw8m2ZomC9h/WFiZvke/6NLUJQa59HHtTFhxB39QvosM0uTdOjOUl
	 2kLTR/vlbrTWGMMr7ypHRLrT2Kpo+N6vnUIMZSKsv96LcE8UPOytaDh0dWuZvJSlnE
	 w/JsPEEpOXAyE/8CrgnhgkHknRe/uYepxV3aht4h/IeYgmG30wMULnprzH14TPgifa
	 wScXe/sAtWMOJHt/hN6uvcv82OMwu1fGWaGduyWcucgbFstGgNStYO5rIBJ/8LwH4y
	 q3TLFaMRT2q/g==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Borislav Petkov <bp@suse.de>,
        Helge Deller <deller@gmx.de>, Li Zhengyu <lizhengyu3@huawei.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv/purgatory: Omit use of bin2c
Date: Mon, 25 Jul 2022 11:19:02 +0900
Message-Id: <20220725021902.625630-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725021902.625630-1-masahiroy@kernel.org>
References: <20220725021902.625630-1-masahiroy@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_192027_125713_645359DA 
X-CRM114-Status: GOOD (  14.63  )
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

The .incbin assembler directive is much faster than bin2c + $(CC).

Do similar refactoring as in commit 4c0f032d4963 ("s390/purgatory:
Omit use of bin2c").

Please note the .quad directive matches to size_t in C (both 8 byte)
because the purgatory is compiled only for the 64-bit kernel.
(KEXEC_FILE depends on 64BIT).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Fix a typo (kexec_purgatroy_end -> kexec_purgatory_end)

 arch/riscv/Kconfig                     |  1 -
 arch/riscv/purgatory/.gitignore        |  1 -
 arch/riscv/purgatory/Makefile          |  8 +-------
 arch/riscv/purgatory/kexec-purgatory.S | 14 ++++++++++++++
 scripts/remove-stale-files             |  2 ++
 5 files changed, 17 insertions(+), 9 deletions(-)
 create mode 100644 arch/riscv/purgatory/kexec-purgatory.S

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 32ffef9f6e5b..218c2f12b3ef 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -447,7 +447,6 @@ config KEXEC_FILE
 
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
-	select BUILD_BIN2C
 	depends on CRYPTO=y
 	depends on CRYPTO_SHA256=y
 
diff --git a/arch/riscv/purgatory/.gitignore b/arch/riscv/purgatory/.gitignore
index 38d7d1bda4d7..6e4dfb024ad2 100644
--- a/arch/riscv/purgatory/.gitignore
+++ b/arch/riscv/purgatory/.gitignore
@@ -1,4 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 purgatory.chk
 purgatory.ro
-kexec-purgatory.c
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index c2d14e2f345d..dd58e1d99397 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -84,12 +84,6 @@ $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
 $(obj)/purgatory.chk: $(obj)/purgatory.ro FORCE
 		$(call if_changed,ld)
 
-targets += kexec-purgatory.c
-
-quiet_cmd_bin2c = BIN2C   $@
-      cmd_bin2c = $(objtree)/scripts/bin2c kexec_purgatory < $< > $@
-
-$(obj)/kexec-purgatory.c: $(obj)/purgatory.ro $(obj)/purgatory.chk FORCE
-	$(call if_changed,bin2c)
+$(obj)/kexec-purgatory.o: $(obj)/purgatory.ro $(obj)/purgatory.chk
 
 obj-y += kexec-purgatory.o
diff --git a/arch/riscv/purgatory/kexec-purgatory.S b/arch/riscv/purgatory/kexec-purgatory.S
new file mode 100644
index 000000000000..32c53581b8f2
--- /dev/null
+++ b/arch/riscv/purgatory/kexec-purgatory.S
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+	.section .rodata, "a"
+
+	.align	8
+kexec_purgatory:
+	.globl	kexec_purgatory
+	.incbin	"arch/riscv/purgatory/purgatory.ro"
+.Lkexec_purgatory_end:
+
+	.align	8
+kexec_purgatory_size:
+	.globl	kexec_purgatory_size
+	.quad	.Lkexec_purgatory_end - kexec_purgatory
diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index 7adab4618035..d75a52199a38 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -40,4 +40,6 @@ if [ -n "${building_out_of_srctree}" ]; then
 	done
 fi
 
+rm -f arch/riscv/purgatory/kexec-purgatory.c
+
 rm -f scripts/extract-cert
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
