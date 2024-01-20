Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495AFC47DAF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Jan 2024 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Sc/ghpnriUjAlLpzdPaUn50cpx/4Yq4y8jGhiUNeZU=; b=li6YK4jT5Bv9VE
	+ynqtArsFNTN+OK6DW8VVr1uaOty2tzWmm2dtzw+t8Y0O7C38mJhptWSbM6z5Nm0m3NMo21vq7+uj
	J6lqAw6cmxJb3YLIYacGFkXYg8ND+JhsSDxLysc8PTQvxFxRg7rpkyK/diGuMWlliyhF5OrwyfD/e
	xDOE1Sxe6mVQwfHTVrapHvpQ6GrowwAuwjlYuT3iAkxP3D+r4hnOHuVJRlHdvMdU8BQXOzWlFelol
	TVy2sJflU9pXPMbvmdjpBf8y/jE/lAthNPjWotyoiqhV0ajLOGZA26Y9n7D87esIeF5gPkFpURBao
	ZmY1kXneS91y0RdINydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJEH-008TMr-0r;
	Sat, 20 Jan 2024 21:50:17 +0000
Received: from out203-205-221-242.mail.qq.com ([203.205.221.242])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRJEC-008TLr-1s
	for linux-riscv@lists.infradead.org;
	Sat, 20 Jan 2024 21:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1705787409; bh=SbEh5VB4GzFFImDZ98RQo/aVP6rIyZlESD+33dGh2Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NuCknl05Y9BtPtHq3TniUiL8depkg9vZKlYCkx+8ht7fkZvZLox6tld6yr4tMCcfK
	 p2RNjRj9IEN4CFZmKeJ5S14KG4DLVdXaAaYvwDrEax6SUk1nxG4igG2PiqON5T2GOi
	 TarUkkMa/8+8hJ/D2CuYy/uex17L5WBZDQk5IlS8=
Received: from cyy-pc.lan ([240e:379:2240:ed00:c92f:86c3:e615:ca18])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id C832D4DD; Sun, 21 Jan 2024 05:50:03 +0800
X-QQ-mid: xmsmtpt1705787406tbsozqm54
Message-ID: <tencent_1A8C66C86EE30ADF9160AC36B46314AE5306@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XdO4Vg7r72bh7nPfnPN7h7nnFbDIZFVbwGB1EPTLF5c6L4O17kK
	 okydMi0HSUFb3ygdby52DFLVNzPj6QYxpuKP/VYfWtXuvjyJWsNtwxSP5HGM1zjpBOgCdTLngkQM
	 arhxCEz+4wmwvCZ6Pz8BstxjVpsrfxUnHbAKBlnwf710ssPN3bFjgFa6RlvLsTlU4KOfmtNjfbet
	 W1qX99HU3HRJTYqpG2w71qPx0mD91MIvs47SunOsARj5c1c+j6eC29HI+tDRi42NvlWJGMcV8vFy
	 vno5buf4nACHogJIGezz6ZDGlx+Md+mdT2P2hBlpqhBEWLtCMsS5xDLSa84Q9z7dR2hBn7GcLgDU
	 OQgJN+cX9ihAqO5O1aNfAEtQ2R2NGpTosfTd/dSYiFwTSHQUnTpAk2csxacyg54NKtQwYl5Cv/g3
	 DdIZ1R2V803HtjTwvm2HQ6dkgG2Z5O7S3JWmJRoQ7j+ldZgVGvuvmbkPO7C9P5UttbIYZ6YM6b/R
	 ufXJ17oaFOwmRkcrlQzukx3v6dJZm91qAOkAfqRZ2WH5Q6W/a1NPndCZwB9NOXsEh6dvZnC3/aLw
	 9RY/JTGFTLFsUvfanbMupBuTUlT9f7eHLh4gCM16c4RYb9gJHg0sxYFnsSOT9hLlIf6MvqtuHdSC
	 zko3RiXHGhVf7HidLg9OVbjVbYZC+qn5ixDPtkI89rEG9sNSB0NbUfp6rW7IgwNHEPZi6flnV7z1
	 08eGSe5ow5R4aqwZnhPV9fNG0L8ESzn6mEiwxkTojUSAWqCbQFvYUHYgyNvoPZwwNr+UxAn1YftN
	 tl47WLcn4IZn3LvtUJpA4qDQsAM3rULwsfLBYiVaPjglnNgZdgTnj7KW6nSuACUEM9d/ywH+XqeY
	 2bAXEeXvY9PaMVfR2ONG2i88yEh3h/cFq6HSCVY6UHhNSBz1uGQ4cPcsDlDbtUeV/GM1GjVXGG8O
	 CzFRgV6aJwKNeVr+EctVVgKBxZ5za8xhjzLPo/ljYPJSGoQwrJQEd+nl/ShJyabAc9uCYCHE+dkD
	 US+Bylb9/aetiTdVGmNmb0p6jQhaQ=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 2/3] RISC-V: mm: only test mmap without hint
Date: Sun, 21 Jan 2024 05:49:59 +0800
X-OQ-MSGID: <20240120215000.291877-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_B2D0435BC011135736262764B511994F4805@qq.com>
References: <tencent_B2D0435BC011135736262764B511994F4805@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240120_135012_952085_73CCF135 
X-CRM114-Status: UNSURE (   7.97  )
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

The original test from the previous patchset[1] assumes the hint address
on mmap is treated as the upper bound of the return address. As we
reverted this special behavior, this test should be updated to reflect the
change.

[1]. https://lore.kernel.org/linux-riscv/20230809232218.849726-1-charlie@rivosinc.com/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 .../selftests/riscv/mm/mmap_bottomup.c        | 12 --------
 .../testing/selftests/riscv/mm/mmap_default.c | 12 --------
 tools/testing/selftests/riscv/mm/mmap_test.h  | 30 -------------------
 3 files changed, 54 deletions(-)

diff --git a/tools/testing/selftests/riscv/mm/mmap_bottomup.c b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
index 1757d19ca89b..1ba703d3f552 100644
--- a/tools/testing/selftests/riscv/mm/mmap_bottomup.c
+++ b/tools/testing/selftests/riscv/mm/mmap_bottomup.c
@@ -15,20 +15,8 @@ TEST(infinite_rlimit)
 	do_mmaps(&mmap_addresses);
 
 	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
 
 	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
-	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
 #endif
 }
 
diff --git a/tools/testing/selftests/riscv/mm/mmap_default.c b/tools/testing/selftests/riscv/mm/mmap_default.c
index c63c60b9397e..f1ac860dcf04 100644
--- a/tools/testing/selftests/riscv/mm/mmap_default.c
+++ b/tools/testing/selftests/riscv/mm/mmap_default.c
@@ -15,20 +15,8 @@ TEST(default_rlimit)
 	do_mmaps(&mmap_addresses);
 
 	EXPECT_NE(MAP_FAILED, mmap_addresses.no_hint);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_37_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_38_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_46_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_47_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_55_addr);
-	EXPECT_NE(MAP_FAILED, mmap_addresses.on_56_addr);
 
 	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.no_hint);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_37_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_38_addr);
-	EXPECT_GT(1UL << 38, (unsigned long)mmap_addresses.on_46_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_47_addr);
-	EXPECT_GT(1UL << 47, (unsigned long)mmap_addresses.on_55_addr);
-	EXPECT_GT(1UL << 56, (unsigned long)mmap_addresses.on_56_addr);
 #endif
 }
 
diff --git a/tools/testing/selftests/riscv/mm/mmap_test.h b/tools/testing/selftests/riscv/mm/mmap_test.h
index 2e0db9c5be6c..d2271426288f 100644
--- a/tools/testing/selftests/riscv/mm/mmap_test.h
+++ b/tools/testing/selftests/riscv/mm/mmap_test.h
@@ -10,47 +10,17 @@
 
 struct addresses {
 	int *no_hint;
-	int *on_37_addr;
-	int *on_38_addr;
-	int *on_46_addr;
-	int *on_47_addr;
-	int *on_55_addr;
-	int *on_56_addr;
 };
 
 // Only works on 64 bit
 #if __riscv_xlen == 64
 static inline void do_mmaps(struct addresses *mmap_addresses)
 {
-	/*
-	 * Place all of the hint addresses on the boundaries of mmap
-	 * sv39, sv48, sv57
-	 * User addresses end at 1<<38, 1<<47, 1<<56 respectively
-	 */
-	void *on_37_bits = (void *)(1UL << 37);
-	void *on_38_bits = (void *)(1UL << 38);
-	void *on_46_bits = (void *)(1UL << 46);
-	void *on_47_bits = (void *)(1UL << 47);
-	void *on_55_bits = (void *)(1UL << 55);
-	void *on_56_bits = (void *)(1UL << 56);
-
 	int prot = PROT_READ | PROT_WRITE;
 	int flags = MAP_PRIVATE | MAP_ANONYMOUS;
 
 	mmap_addresses->no_hint =
 		mmap(NULL, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_37_addr =
-		mmap(on_37_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_38_addr =
-		mmap(on_38_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_46_addr =
-		mmap(on_46_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_47_addr =
-		mmap(on_47_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_55_addr =
-		mmap(on_55_bits, 5 * sizeof(int), prot, flags, 0, 0);
-	mmap_addresses->on_56_addr =
-		mmap(on_56_bits, 5 * sizeof(int), prot, flags, 0, 0);
 }
 #endif /* __riscv_xlen == 64 */
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
