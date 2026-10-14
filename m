Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BACBC3DA7A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o+p/1YwDLsYD7UAD1d4Aqtw4Tz04yXUHgVyK/r6GqX0=; b=IDhOHQsT6T85AU
	B9AtJlZy2wQLIxtuwKCDs/rNq+rY95BKr7E15ix/8Xx+f9zrBCJYPBkHeUaGucNvhQcuEY6mtbI1I
	kX/XDyIHbOijOllARdvnKDXMqvy49HiqG5ob9wUW216AqDI6aCgJlnd1oWjfaHaBMlrWUyRGLlLEW
	EWhiRIDGQJZJSD2eZvIMlkeiolXdu2f9KJnB/uWDPveUQDmOw7l07EFHmvlnyLSWhpLc83lHhBUsy
	c7CQhMDCOdgyfmJ22LSrmlwLHfZbgXno7mjNyh2FwUJUDpIIwjezBXq9ztiEYHQApoV8ctAW9b4xp
	woIMSSyLbSsSnYOuo9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AE-0000000GEca-32uy;
	Wed, 14 Oct 2026 20:01:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5AD-0000000GEbk-1Xgi
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 20:01:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C3664358B;
	Wed, 14 Oct 2026 20:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBACC1F000C4;
	Wed, 14 Oct 2026 20:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008085;
	bh=cQ1kewUL52K9zpMDeh2ONUK6G+L48N3I/Lb6qZvfwLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PVjx+ehWybamuJ4XnmVcra5Skw2WuFdP/it84zbL6FfZpOhMnPQtkGf41lQsU5Atq
	 sdt20SlueVSNrpwjYIj+EYJ6/H44cdw97bb2Y5Hai9xyUlKdI9RePkFMB9nc0MLN8A
	 oTgij/H838Zs9uB6Ged8wcj2Tv8NuHZUptrkI/jskH/IoF8YXPB2uFgGJMcZGN11tM
	 pHqosn7dzbz9eG1eRDX/LaFha6VKG0wCNh1R/JH+boAKEfcGTQFcAVksppOy06l1Jq
	 NhZ9WCvG2qY9TzJVBL8sE/3/7PMBFtVEi85kJMrX1+6TCNFMotiZIjygonDs2wzQy2
	 JzbwRjhsDgs9w==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] selftests/riscv: keep building and installing after a subdirectory fails
Date: Wed, 14 Oct 2026 16:01:13 -0400
Message-ID: <20261014200115.1363363-6-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014200115.1363363-1-sashal@kernel.org>
References: <20261014200115.1363363-1-sashal@kernel.org>
MIME-Version: 1.0
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

The RISC-V suite builds and installs its subdirectories in shell loops
whose status is that of the last subdirectory. A failure in any other
subdirectory is lost, while a failure in the last one fails "make all"
and, through "install: all", drops the installation of every other
RISC-V test as well. FORCE_TARGETS has no effect on the loops either.

Make each loop fail only when no subdirectory succeeds, which matches
how the top-level selftests Makefile treats its targets, and stop at the
first failure when FORCE_TARGETS is set. When a build report is
requested, record each subdirectory as riscv/<subdir> so that a
partially built suite is visible even though make succeeds. Default
OUTPUT to the current directory, as the arm64 suite does, so that the
loops also work when the suite is built directly.

Fixes: 287dcc2b0c83 ("selftests: Test the new RISC-V hwprobe interface")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/riscv/Makefile | 39 +++++++++++++++++++-------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index 5671b4405a129..52d1228be8d03 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -20,21 +20,35 @@ CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
 
 CFLAGS += $(KHDR_INCLUDES)
 
+OUTPUT ?= $(CURDIR)
+
 export CFLAGS
 export top_srcdir
 
+include $(top_srcdir)/tools/testing/selftests/build_report.mk
+
 all:
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		mkdir -p $$BUILD_TARGET;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		mkdir -p $$BUILD_TARGET &&			\
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,all,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 install: all
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 run_tests: all
 	@for DIR in $(RISCV_SUBTARGETS); do				\
@@ -44,10 +58,15 @@ run_tests: all
 
 # Avoid any output on non riscv on emit_tests
 emit_tests:
-	@for DIR in $(RISCV_SUBTARGETS); do				\
+	@ret=$(if $(RISCV_SUBTARGETS),1,0);				\
+	for DIR in $(RISCV_SUBTARGETS); do				\
 		BUILD_TARGET=$(OUTPUT)/$$DIR;			\
-		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;		\
-	done
+		$(MAKE) OUTPUT=$$BUILD_TARGET -C $$DIR $@;	\
+		status=$$?;					\
+		$(call ksft_record_build_status,install,riscv/$$DIR); \
+		$(if $(FORCE_TARGETS),[ $$status -eq 0 ] || exit $$status;) \
+		[ $$status -eq 0 ] && ret=0;			\
+	done; exit $$ret
 
 clean:
 	@for DIR in $(RISCV_SUBTARGETS); do				\
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
