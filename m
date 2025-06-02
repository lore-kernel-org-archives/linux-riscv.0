Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7253C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=62XzbJscZTgBwgtF6zSPLjzQK/O4Sv6yPxPVLNcffro=; b=CQ8NwGefl5C9y1
	zY1uV9LOeI2rxlptSDThrwRNcSGrsvuKii3IJ7IJn9Jsu4tz/MqDi1YgrzAyVVVZDFhkUHYLOcnOZ
	k33ZvjDQQj/T7rVUMvM3N+P5vML7lrtvDi8J2COPkC4sDJojaTimFPcZQVBWtWVR62WjTmC3iEUWq
	GPEVZfOi3hKwXcn9i4Id9tDBe+VyXyzD+jP5ezdAXwN0C5qNIK1dlhDXuzzXTOAMZLT8xGQoXeuvM
	UMTJDhzDMYzGbYZb0fhGodiBzeBhAWXDOBoZKdXt8BOBENTGKpM0zVApC+OFo+daj/j1Va8TTrTQ3
	DORWfW/7QuUdgpvhjiEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM91H-0000000837O-23I9;
	Mon, 02 Jun 2025 17:32:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM91E-0000000836b-2lve
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 17:32:18 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-235ae05d224so8542535ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1748885535; x=1749490335; darn=lists.infradead.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=JWZhK8des/L4A52/jOYvV4k4wC8d2X25KeUqd6w0KQY=;
        b=Rwgo95wc9hafWdImYafrkgDAnfUBIUcI01g14dEATkwEm2zwSukEhTd7f7Fx5LgQmA
         FS22kZd3MuTQmsFZmQ+Mi9tI9JHXEGu1Ui2lF5hPPHe0SyIfS3uRE0xBPSGeejxbQZoj
         0kaFNwvdEbJCjfKtxVrFxX4VCbHmRfpR/yQ4oThC1U0rvAmHXrH8jkipoYtDe2Drj3ER
         KuNgg1dTxOFLGCMHoMRXleiYerjpVTfZ9juLrTuB9hgctcf8ioSS7PcY5KctoJYweE/0
         nBPzMU8jifs+YwJl9ILLMUeYRO3sf3OEmkHxzIArn/exQ+ZVJ/LeM4nTntClMMI96sJW
         aFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748885535; x=1749490335;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWZhK8des/L4A52/jOYvV4k4wC8d2X25KeUqd6w0KQY=;
        b=t1Gf5H4Co/R3aDtOHcyZ3ZkE+g66EjqDfwvg1zs/rhu07Ka2EjYgTI4L3neaRzx/xu
         5j7wBBu6sgtAhJ/QT9x/l3K1BZGqzTLzNRxry6XZpDqe55fjJ/T8uZUx5B5OyLgG2pwL
         3y2tip2364xsQ5kE3Mb+i1DZ/lT1GH0G1UgpxR8AMUc0HgWUilK1JPLg4FP+29zAgPHe
         fzHRcidhZAyNkscdORjxuIj3skLf+wzZvbjSapUFp7Cg4m0MbIVWL3uNzbXiBKqT7OaJ
         pijOt6WQo+eWcinr9TIBYnbNSshWrSP6U8jViTPx4PHT/F7qPeuGTcY4RJCMhu+365zh
         q5eQ==
X-Gm-Message-State: AOJu0YwxMsSOR56c1qmrqecz9dv/xaMV/KXiyRBoQzmBQ5auEpN2QOpP
	4to4W6SWfWHGnf1I9JIhRVlmZqOSELo3D0S23TiBlWkXdFEZaJ/atbfaSLowAFf8I1o=
X-Gm-Gg: ASbGncu7x/tgKRqG0q6xxrDDDDttcesL8RHRsjHgsHJDY8awpZFmvpI2u8Ug/zQzSOL
	q6u9x0D6SYqwDnL/a5r4Gta9mpwe7KCLS7U5JU2L9XeIjP2suBHxZ8r7YDR6s35wwwUVJWdHozh
	ypYcNfluoc09PA/oV1TrntoQMIDNQqecKyUyH2h+8Qqmj6LToia0UEzb7w2f9iMZa6dfd+LY/yW
	pic/J7/p9CCPwYKD+LU2i8xCGjpfqwHgXb4Noilt/rqUdzFRD14aeXqBqvPGCBcIM/IPNrX9PBQ
	t9ne8VDeempcSoi+1YMuIFYnz3abW7BGTTi7dyTHbmIttZJggQ+fu6c=
X-Google-Smtp-Source: AGHT+IGUB2xqU5z1Mdwz91M+kVMbB6A8bDlamhZzUNgH/xhDHJAA+Z3w8r8ctHkNd2F6RXTKY1SIiQ==
X-Received: by 2002:a17:903:2848:b0:215:b1e3:c051 with SMTP id d9443c01a7336-235c798d847mr2268725ad.11.1748885535055;
        Mon, 02 Jun 2025 10:32:15 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:e83a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23506cf5110sm73517575ad.177.2025.06.02.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 10:32:14 -0700 (PDT)
Subject: [PATCH] Don't worry about a local OpenSSL either
Date: Mon,  2 Jun 2025 10:32:04 -0700
Message-Id: <20250602173204.19552-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@dabbelt.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_103216_703324_43C0C3FF 
X-CRM114-Status: UNSURE (   9.66  )
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

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 .gitmodules        |  3 ---
 .local/src/openssl |  1 -
 Makefile           | 57 ++++++++--------------------------------------
 3 files changed, 9 insertions(+), 52 deletions(-)
 delete mode 160000 .local/src/openssl

diff --git a/.gitmodules b/.gitmodules
index b1c74a3..e92e092 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -28,9 +28,6 @@
 [submodule ".local/src/wireplumber"]
 	path = .local/src/wireplumber
 	url = https://gitlab.freedesktop.org/pipewire/wireplumber.git
-[submodule ".local/src/openssl"]
-	path = .local/src/openssl
-	url = https://github.com/openssl/openssl.git
 [submodule ".local/src/curl"]
 	path = .local/src/curl
 	url = https://github.com/curl/curl.git
diff --git a/.local/src/openssl b/.local/src/openssl
deleted file mode 160000
index 293e251..0000000
--- a/.local/src/openssl
+++ /dev/null
@@ -1 +0,0 @@
-Subproject commit 293e251e6f0367a9aa0d3d46037b19d1a6c91b20
diff --git a/Makefile b/Makefile
index 8337efd..a0a90ed 100644
--- a/Makefile
+++ b/Makefile
@@ -1,11 +1,11 @@
 SHELL=/bin/bash
 ENV=PATH="$(abspath .local/bin:$(PATH))" PKG_CONFIG_PATH="$(abspath .local/lib/pkgconfig)"
 CFLAGS += -O3 -Wall -Werror
-SYSTEM_LIBDIR = /usr/lib64
+SYSTEM_LIBDIR = /opt/homebrew/lib
 
 # Some helper functions
 gitfiles = $(addprefix $(1),$(shell git -C $(1) ls-files))
-ppkg-config-deps = $(addprefix .local/lib/pkgconfig/,$(addsuffix .pc,$(shell cat .local/src/$(1)/Configfile |  grep ppkg-config | sed 's/^.*ppkg-config \([A-Za-z0-9-]*\) .*$$/\1/')))
+ppkg-config-deps = $(addprefix .local/lib/pkgconfig/,$(addsuffix .pc,$(shell cat .local/src/$(1)/Configfile |  grep ppkg-config | grep -v optional | sed 's/^.*ppkg-config \([A-Za-z0-9-]*\) .*$$/\1/')))
 
 all: \
 	.local/bin/pconfigure \
@@ -14,9 +14,6 @@ all: \
 	.local/lib/libbase64.so \
 	.local/lib/libpson.so \
 	.local/bin/mhng-install \
-	.local/bin/msmtp \
-	.local/bin/openssl \
-	$(addprefix .local/bin/,$(notdir $(shell find .local/src/depot_tools/ -maxdepth 1 -type f -executable | grep -v ".py$" | grep -v ".bat$"))) \
 	$(patsubst .local/src/%.bash,.local/bin/%,$(wildcard .local/src/*.bash)) \
 	$(patsubst .local/src/%.pl,.local/bin/%,$(wildcard .local/src/*.pl)) \
 	$(patsubst .local/src/%.c,.local/bin/%,$(wildcard .local/src/*.c))
@@ -66,8 +63,7 @@ clean::
 
 .local/bin/pconfigure \
 .local/bin/pbashc \
-		: .local/stamp/pconfigure \
-		  /usr/bin/pkg-config
+		: .local/stamp/pconfigure
 	touch -c $@
 
 # gitdate
@@ -99,7 +95,7 @@ clean::
 	date > $@
 
 .local/lib/libputil-chrono.so \
-.local/lib/pkg-config/libputil-chrono.pc \
+.local/lib/pkgconfig/libputil-chrono.pc \
 : .local/stamp/putil
 	touch -c $@
 
@@ -116,7 +112,9 @@ clean::
 	$(MAKE) -C $(dir $<) install
 	date > $@
 
-.local/lib/libpsqlite.so: .local/stamp/psqlite
+.local/lib/libpsqlite.so \
+.local/lib/pkgconfig/psqlite.pc \
+: .local/stamp/psqlite
 	touch -c $@
 
 # pson
@@ -137,10 +135,7 @@ clean::
 
 # libbase64
 .local/src/libbase64/Makefile: \
-		.local/src/libbase64/configure.ac \
-		/usr/bin/autoreconf \
-		/usr/bin/makeinfo \
-		/usr/bin/libtoolize
+		.local/src/libbase64/configure.ac
 	env -C $(dir $@) - $(ENV) autoreconf -i
 	env -C $(dir $@) - $(ENV) ./configure --prefix=$(abspath .local)
 
@@ -150,24 +145,10 @@ clean::
 	date > $@
 
 .local/lib/libbase64.so \
-.local/lib/pkg-config/libbase64-1.pc \
+.local/lib/pkgconfig/libbase64-1.pc \
 : .local/stamp/libbase64
 	touch -c $@
 
-# msmtp
-.local/src/msmtp/Makefile: \
-		.local/src/msmtp/configure.ac
-	env -C $(dir $@) - $(ENV) autoreconf -i
-	env -C $(dir $@) - $(ENV) ./configure --prefix=$(abspath .local)
-
-.local/stamp/msmtp: .local/src/msmtp/Makefile
-	mkdir -p $(dir $@)
-	$(MAKE) -C $(dir $<) install
-	date > $@
-
-.local/bin/msmtp: .local/stamp/msmtp
-	touch -c $@
-
 # MHng
 .local/src/mhng/Makefile: \
 		.local/bin/pconfigure \
@@ -188,26 +169,6 @@ clean::
 .local/bin/mhng-%: .local/stamp/mhng
 	touch -c $@
 
-# depot_tools
-$(addprefix .local/bin/,$(notdir $(shell find .local/src/depot_tools/ -maxdepth 1 -type f -executable | grep -v ".py$" | grep -v ".bat$"))): .local/src/depot_tools_wrapper.bash.in
-	mkdir -p $(dir $@)
-	cat $^ | sed 's@__TOOL__@$(abspath $(dir $<))/depot_tools/$(notdir $@)@g' > $@
-	chmod +x $@
-
-# openssl
-.local/src/openssl/Makefile: \
-		.local/src/openssl/Configure
-	env -C $(dir $@) - $(ENV) ./config --prefix=$(abspath .local) --openssldir=$(abspath .local)  -Wl,-rpath=$(abspath .local)/lib -Wl,--enable-new-dtags
-
-.local/stamp/openssl: .local/src/openssl/Makefile
-	mkdir -p $(dir $@)
-	$(MAKE) -C $(dir $<)
-	$(MAKE) -C $(dir $<) install
-	date > $@
-
-.local/bin/openssl: .local/stamp/openssl
-	touch -c $@
-
 # curl
 .local/src/curl/Makefile: \
 		$(call gitfiles,.local/src/curl/)
-- 
2.39.5 (Apple Git-154)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
