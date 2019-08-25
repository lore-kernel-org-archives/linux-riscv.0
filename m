Return-Path: <SRS0=DVE0=WV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4DBC3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 071C720850
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2019 13:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6HHz9vK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0nxmzW0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 071C720850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Kr3eocvJlovV9eQ1LCxxhivz08yC/ET/LsP8n8m++8=; b=p6HHz9vK6se/Ey
	nmQizjcMc524aC6oolvGN6n28GhQEgqUQRMgxkBfgqeE5pb9hHcx7mhn4kSJJBqRFJXh1/7FrJetx
	lJwOx4ziHQE6pXhljjCn6OmhD2T/tFKylsCBKoGFSyMGP8qC3jTpNdVkS6dvchbfY+OJyWu5bpsBo
	IprPKuT/rUrMR1xJ/e0W+o65E4rz+QL98WWd3mrzdFoYJ+YyMo+fBwsto+HhkDpz68iNdEQojkhFS
	0fhHeTl3r6s4HGlG/oL74GytvJrYh6E2lOJX0gKiWMXJVQVN+D4R4Eujdyb5LVMhbeDtVtftxCtLp
	oSA4qXyWgqbKwupBPDqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1sVT-0003KZ-OS; Sun, 25 Aug 2019 13:24:31 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1sUt-0002qh-Ly; Sun, 25 Aug 2019 13:23:57 +0000
Received: by mail-pf1-x441.google.com with SMTP id c81so9812059pfc.11;
 Sun, 25 Aug 2019 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATcCbM6biHkdS6pzkwBCxjjCLgoJOMzk+hMVWKlY49s=;
 b=g0nxmzW0zZ8NOi10EuoUp6vH1QqnVKl2IMIkaHt7cnF9O3K6n0oILEW7cwjrYanydu
 gtoL3DlYM2M5MgCbMEnM06N2evopvAboFj4vypZN5kjGpI15b8rhq5rh/KAkudzPdJpR
 sLDbzKbUi7x6t+5MFWoJogmWGPO2NmboeiEiGdRisvYQ9toPvwp5sS0u6lAQ6B1HzHtA
 NeqnHB9yIGItC6Df2iIXR2yzDjYytV106x33kfO6K4887MnkmD7Xx47qsOPdysl9o3r6
 VHxKFYS5Dpwv/D05aGqO18ep0Y7hxYUSiawMaYs0cINAZIcwP14La+QLXLaoHQpwqAit
 rYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATcCbM6biHkdS6pzkwBCxjjCLgoJOMzk+hMVWKlY49s=;
 b=nsEebrmbdEe/YIPvy2vp16NX2w73GOZ7g/Ct3pYM4yzcanhTzpzpUIARgiPbeZKds/
 pYRP0UM1roE8NFX/Jke1+mdP4o0dRtXZaLO8hjmvW8+FMedtw55yQVwD6qrplpq8mVU9
 Qg/ziw+18AuP6fCf/+hofoa9nJiNDnVG+XxSu5SpZs6RsJ2PPb02So8EcFmaJEVHSRdm
 PgUoFxBaVIh557MHpiv+CB5Vt5irAnu8/aKJgRXJEdE73WmBAHMY9Nqzo8S5s6HXIJMZ
 rwDK9NaL6FqWhI4+KdVQPFiyW35JYlZUeZYv0O1D/HQ+BhHOjRJZSROrWQxoyeEXMm7y
 qsMw==
X-Gm-Message-State: APjAAAUz1cVAm2fTeJBo8w+UM14l1Qqnp1b9irFKuyI4qnuDpvpe23Vl
 Wdv967W72MQtpuwbKrpHgfg=
X-Google-Smtp-Source: APXvYqzaJqepN4zSy7ymgD+GkZvtuT8tWiHagREHmYhkwZsvhh4laEBbm32dRe/EdCR5Hh5hXENyXQ==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr14686883pjb.54.1566739434878; 
 Sun, 25 Aug 2019 06:23:54 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:23:54 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 01/11] ftrace: move recordmcount tools to scripts/ftrace
Date: Sun, 25 Aug 2019 21:23:20 +0800
Message-Id: <20190825132330.5015-2-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190825_062355_815954_0EB841EE 
X-CRM114-Status: GOOD (  11.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
 "John F . Reiser" <jreiser@BitWagon.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Move ftrace tools to its own directory. We will add another tool later.

Cc: John F. Reiser <jreiser@BitWagon.com>
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 scripts/.gitignore                   |  1 -
 scripts/Makefile                     |  2 +-
 scripts/Makefile.build               | 10 +++++-----
 scripts/ftrace/.gitignore            |  4 ++++
 scripts/ftrace/Makefile              |  4 ++++
 scripts/{ => ftrace}/recordmcount.c  |  0
 scripts/{ => ftrace}/recordmcount.h  |  0
 scripts/{ => ftrace}/recordmcount.pl |  0
 8 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 scripts/ftrace/.gitignore
 create mode 100644 scripts/ftrace/Makefile
 rename scripts/{ => ftrace}/recordmcount.c (100%)
 rename scripts/{ => ftrace}/recordmcount.h (100%)
 rename scripts/{ => ftrace}/recordmcount.pl (100%)
 mode change 100755 => 100644

diff --git a/scripts/.gitignore b/scripts/.gitignore
index 17f8cef88fa8..1b5b5d595d80 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,7 +6,6 @@ conmakehash
 kallsyms
 pnmtologo
 unifdef
-recordmcount
 sortextable
 asn1_compiler
 extract-cert
diff --git a/scripts/Makefile b/scripts/Makefile
index 16bcb8087899..d5992def49a8 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -14,7 +14,6 @@ hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
 hostprogs-$(CONFIG_LOGO)         += pnmtologo
 hostprogs-$(CONFIG_VT)           += conmakehash
-hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
 hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
 hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
 hostprogs-$(CONFIG_MODULE_SIG)	 += sign-file
@@ -34,6 +33,7 @@ hostprogs-y += unifdef
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_FTRACE) += ftrace
 
 # Let clean descend into subdirs
 subdir-	+= basic dtc gdb kconfig mod package
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2f66ed388d1c..67558983c518 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -188,18 +188,18 @@ endif
 # files, including recordmcount.
 sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
-		$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
+		$(objtree)/scripts/ftrace/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)"; \
 	fi;
-recordmcount_source := $(srctree)/scripts/recordmcount.c \
-		    $(srctree)/scripts/recordmcount.h
+recordmcount_source := $(srctree)/scripts/ftrace/recordmcount.c \
+		       $(srctree)/scripts/ftrace/recordmcount.h
 else
-sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
+sub_cmd_record_mcount = perl $(srctree)/scripts/ftrace/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
 	"$(LD) $(KBUILD_LDFLAGS)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
-recordmcount_source := $(srctree)/scripts/recordmcount.pl
+recordmcount_source := $(srctree)/scripts/ftrace/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
 cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),	\
 	$(sub_cmd_record_mcount))
diff --git a/scripts/ftrace/.gitignore b/scripts/ftrace/.gitignore
new file mode 100644
index 000000000000..54d582c8faad
--- /dev/null
+++ b/scripts/ftrace/.gitignore
@@ -0,0 +1,4 @@
+#
+# Generated files
+#
+recordmcount
diff --git a/scripts/ftrace/Makefile b/scripts/ftrace/Makefile
new file mode 100644
index 000000000000..6797e51473e5
--- /dev/null
+++ b/scripts/ftrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
+always         := $(hostprogs-y)
diff --git a/scripts/recordmcount.c b/scripts/ftrace/recordmcount.c
similarity index 100%
rename from scripts/recordmcount.c
rename to scripts/ftrace/recordmcount.c
diff --git a/scripts/recordmcount.h b/scripts/ftrace/recordmcount.h
similarity index 100%
rename from scripts/recordmcount.h
rename to scripts/ftrace/recordmcount.h
diff --git a/scripts/recordmcount.pl b/scripts/ftrace/recordmcount.pl
old mode 100755
new mode 100644
similarity index 100%
rename from scripts/recordmcount.pl
rename to scripts/ftrace/recordmcount.pl
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
