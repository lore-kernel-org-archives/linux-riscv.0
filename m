Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C4FC10F09
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48CD42085A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 12:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCBH1Eq4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48CD42085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w7KBHKNhi5SfrNhp2VUMRtaO4gKz1mistj6Po8E/Ekw=; b=cCBH1Eq43HHFwqUNVVKYzxLxWl
	Rt5LpndVSyRqmcfwkxATHwQChu14RtPu8zEi7+EdiCyiUuey1nG0CaUU3Le8WR+cIwNeZWnLbNp7p
	MtRmw9MP6bTaNPqvwYjIjDdWmWReZ7YzrX5vXzhbQAxi4UzW5HLsVMm1Dulig8SmBmvptSVsXIgVZ
	ZFpGKHGQEBHpjv/+HNW+ZjyVoq5TSwDnIGh8gl76CRiA7kDDTJJg8bE34Eq+p3ceOlNntBXeuI3YW
	hgmdpXE2So77S9QJHhGJ0eB4ehUHnvGffVwhV10KEu0cunNk9/9r4CP71hr01Goh8QXErGZF1A7DJ
	g9O1keWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2EsD-0005kW-P6; Fri, 08 Mar 2019 12:45:13 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h2Es4-0004g7-Oq
 for linux-riscv@lists.infradead.org; Fri, 08 Mar 2019 12:45:11 +0000
Received: from orion.localdomain ([95.117.97.241]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MPXta-1hNdLH19gA-00Mer2; Fri, 08 Mar 2019 13:44:57 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] debian: add generic rule file
Date: Fri,  8 Mar 2019 13:44:24 +0100
Message-Id: <1552049064-32044-6-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552049064-32044-1-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:R3JLL8sBMmKhfDQMbrg5EzF+7Ba57fKqfYnxGB+ha38n1r8aQuP
 mjTGpYJcbAnimrTFaSV9++tGRGm311DfVX9fpqDugRcdW+l9s4xKlt8TGgQn/3HyOOTCxVM
 DgvKhPQYM5Z27npVTAO5VInoD39RGEi3MG9bf6aa8THMG+9g1wbn77xO4aj/hej4E4SAI+1
 Sy4XpTQ7IQTEiBjGwDwAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I+ktiGOYKKo=:gjhIqya2r76CM/Wg5q9h6f
 AMuvikgwzHUnQjscoUhPA4Xc0WNAzDX0N+8QfXf5l5SApFeTS1osB0KYqQUEJ0cP9nd7CEeTe
 xr14jebppnTBNGXVr6nmiXAHVZ/FsG5kXdpdgInl8ssgUwn1Wsyqm7/OMqjWo02kgvgZusPpg
 hebaX40g0uxRpmj5DTKBJmV/VS1ubFFcXGe/zB8BP1W3hQF61sx02pAu4FLnnmfWuZd4KSP4f
 vbYl9w0u/mS7H/i8aJT0t1Bw1zx9i3WDfDqTcIn1FlhCgpYDXJYJ37bbtmBtNPTBHgm3Pszre
 ISa3kvQ3QuczDjzoFiKqsvtcSl31A5uzsYS3nMZjkAaKdazua401uKq5+uM63GnKKNhqokuJ8
 X0maH/NxDxcMs7vWL2MGeZ1Fd+z7iyjr0R7lrJHN+M0/He3RLvV+Ka9QX/RIt4CRaZq5JMq/I
 8ZTZ+E7L0kmLbew9j4MR0B9GkzS+tshF/4hpk2kmQP2o9qsetKHkskOel9/k2kcyjQeDTAlVa
 BP1bHnUEW61q+SVWa0b7U9tt+GZGEpp+LjRXChcWLfzJPMaZuimpq0Q+jFPiJDSonTua5JhLf
 LKOqvJEDWlEjbDVVNvvV0jF8QpDE9QQbrOe5crqrsDeDJkifqKuN7meByPwx0ZJ9Oe+gqqi/9
 0HCbeZGO7v2iM/Lb2Yzdaa1c/Iav4Ay8+3dSfCPYqBRna3LS8rCe1rEVvi8KCqxGt1+GnZrAu
 O8+MqJDSH9GtXQVAIP5Xfrhd/K3wON+NmvRL1A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190308_044505_117286_BC24EEF2 
X-CRM114-Status: GOOD (  10.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
 yamada.masahiro@socionext.com, apw@canonical.com, joe@perches.com,
 linux-riscv@lists.infradead.org, info@metux.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Adding a generic debian rule file, so we can build the directly
via usual Debian package build tools (eg. git-buildpackage,
dck-buildpackage, etc). It expects the .config file already
placed in the source tree.

The rule file contains a rule for creating debian/control and
other metadata - this is done similar to the 'deb-pkg' make rule,
scripts/packaging/mkdebian.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 .gitignore   |  1 +
 MAINTAINERS  |  6 ++++++
 debian/rules | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100755 debian/rules

diff --git a/.gitignore b/.gitignore
index a20ac26..2d8081f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -68,6 +68,7 @@ modules.builtin
 # Debian directory (make deb-pkg)
 #
 /debian/
+!/debian/rules
 
 #
 # Snap directory (make snap-pkg)
diff --git a/MAINTAINERS b/MAINTAINERS
index 09d47cd..1edc169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4363,6 +4363,12 @@ F:	include/uapi/linux/dccp.h
 F:	include/linux/tfrc.h
 F:	net/dccp/
 
+DEBIAN PACKAGING FILES
+M:	Enrico Weigelt <info@metux.net>
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	debian/
+
 DECnet NETWORK LAYER
 W:	http://linux-decnet.sourceforge.net
 L:	linux-decnet-user@lists.sourceforge.net
diff --git a/debian/rules b/debian/rules
new file mode 100755
index 0000000..c2f0319
--- /dev/null
+++ b/debian/rules
@@ -0,0 +1,27 @@
+#!/usr/bin/make -f
+# SPDX-License-Identifier: GPL-2.0
+
+export MAKE
+export KERNELARCH           = $(shell $(MAKE) kernelarch)
+export KERNELRELEASE        = $(shell $(MAKE) kernelrelease)
+export KBUILD_DEBARCH       = $(shell dpkg-architecture -qDEB_HOST_ARCH)
+export KBUILD_BUILD_VERSION = $(shell $(MAKE) kernellocalversion)
+export KDEB_RULES           = debian/rules.auto
+export KDEB_SOURCENAME      = linux-source
+export ARCH                 = $(KERNELARCH)
+
+debian/control debian/changelong debian/arch debian/copyright:
+debian/control:
+	./scripts/package/mkdebian
+
+build:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC=
+
+binary-arch:	debian/control
+	$(MAKE) KERNELRELEASE=$(KERNELRELEASE) ARCH=$(KERNELARCH) KBUILD_BUILD_VERSION=$(KBUILD_BUILD_VERSION) KBUILD_SRC= intdeb-pkg
+
+clean:
+	rm -rf debian/*tmp debian/files debian/changelog debian/control debian/copyright debian/rules.auto debian/arch
+	$(MAKE) clean
+
+binary: binary-arch
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
