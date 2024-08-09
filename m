Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6795CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 21:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NvUB4E3bCJxASL6xCJ3zlLwUdNeqEdbMHQooHwn0VcA=; b=iwGtCm1R+PQs1P
	dnSSYaNwEs5lloEvUalX7LU1Ysvg1JHyu4N+JYTH3F597s0Ku81JE7k9OcBvLijLR+NwFKSe/KYVF
	M0AOUkd9Mio+YjXUyM3WN4ZT1DEofHFRXcL6nuvojNE+BH1NRkiBGp85R7kjqL6WtbeeQE7GxRC6x
	mrRZsF4Rl2heUjXInKiy807gvi4RtAML8CsIrR3vbl19CDFUtbin/oy1UpgJwyqOgOPzCRhGJI7ax
	Oh/TwhHhJek9KpLt83ZGXBgnZy5XVUtZqyQ2418379/qBGva4RYmZX2ZoQXqvd77GvbGCcW8qtZ5i
	itTkKvKZ21daVMlGs3qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdcGx-00000001Zzw-3rlv;
	Mon, 12 Aug 2024 21:08:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scKUr-0000000AcqC-2hcf
	for linux-riscv@lists.infradead.org;
	Fri, 09 Aug 2024 07:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723190225; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hc7RzBokHDN2N9oNmXMxZQ2W2gtcn4BfdhAo7EGb5VOW/IWpn5FKeke0G3JR3FfxuGc/GLuxIeuWp1mKevBXTQ0yoFe2a3zPSkk4IfDoQP2BBOb/X8Ai/p74KrUBb/mkUhitK0oBT9/ylttChDbd4jVtbdN09YT58hqqQivyvas=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723190225; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=icKPXt17t9Kx30jQW8DqzSUWcb+Xzik3rs56lRblVGo=; 
	b=S+rqzHnzIgpu9k8DyzqRY6iDpo22yYa5iGor6HDiruYIyTjdobZ2Ss7L20DnlrFjjZQKRQ9KrAQwxqrA8NZueRUT922z+kf2V44ZP1POeZgP7+rdvsJtDGSkJY/F4AjqomZBwl8EVzETE/LICgSEJCjNikVE/0Xklu6ipCKfzIc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=usama.anjum@collabora.com;
	dmarc=pass header.from=<usama.anjum@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723190225;
	s=zohomail; d=collabora.com; i=usama.anjum@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=icKPXt17t9Kx30jQW8DqzSUWcb+Xzik3rs56lRblVGo=;
	b=baoEat06HZ2Q4x+RKme432Zc7LrqBMAMUPE0jUd68CNpaX4vyylF3E5BbSbBCd78
	J3hjUfJbGvhCJtRM4e62TTgXeA9M9qfQRAQJRyqEO3Si3TsxoO6fb3Alsn8U+1LhW4O
	kG9VU8VXXd+Hhv3AjWM/56WC0h6yuPivTzf2tGt4=
Received: by mx.zohomail.com with SMTPS id 1723190224501788.7935482020652;
	Fri, 9 Aug 2024 00:57:04 -0700 (PDT)
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mike Rapoport <rppt@kernel.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>,
	kernel@collabora.com,
	stable@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] selftests: memfd_secret: don't build memfd_secret test on unsupported arches
Date: Fri,  9 Aug 2024 12:56:42 +0500
Message-Id: <20240809075642.403247-1-usama.anjum@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_005713_754994_63DF6C8A 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 12 Aug 2024 14:01:09 -0700
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

[1] mentions that memfd_secret is only supported on arm64, riscv, x86
and x86_64 for now. It doesn't support other architectures. I found the
build error on arm and decided to send the fix as it was creating noise
on KernelCI. Hence I'm adding condition that memfd_secret should only be
compiled on supported architectures.

Also check in run_vmtests script if memfd_secret binary is present
before executing it.

[1] https://lore.kernel.org/all/20210518072034.31572-7-rppt@kernel.org/
Cc: stable@vger.kernel.org
Fixes: 76fe17ef588a ("secretmem: test: add basic selftest for memfd_secret(2)")
Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/mm/Makefile       | 2 ++
 tools/testing/selftests/mm/run_vmtests.sh | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 1a83b70e84535..4ea188be0588a 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -53,7 +53,9 @@ TEST_GEN_FILES += madv_populate
 TEST_GEN_FILES += map_fixed_noreplace
 TEST_GEN_FILES += map_hugetlb
 TEST_GEN_FILES += map_populate
+ifneq (,$(filter $(ARCH),arm64 riscv riscv64 x86 x86_64))
 TEST_GEN_FILES += memfd_secret
+endif
 TEST_GEN_FILES += migration
 TEST_GEN_FILES += mkdirty
 TEST_GEN_FILES += mlock-random-test
diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 03ac4f2e1cce6..36045edb10dea 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -374,8 +374,11 @@ CATEGORY="hmm" run_test bash ./test_hmm.sh smoke
 # MADV_POPULATE_READ and MADV_POPULATE_WRITE tests
 CATEGORY="madv_populate" run_test ./madv_populate
 
+if [ -x ./memfd_secret ]
+then
 (echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope 2>&1) | tap_prefix
 CATEGORY="memfd_secret" run_test ./memfd_secret
+fi
 
 # KSM KSM_MERGE_TIME_HUGE_PAGES test with size of 100
 CATEGORY="ksm" run_test ./ksm_tests -H -s 100
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
