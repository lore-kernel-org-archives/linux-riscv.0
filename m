Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC8AC47077
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Jan 2024 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCxpk3DR+bHP/hUFqxExUBHAsS3/EpZfZdRNY1gxU+o=; b=1bW76iWPw5gqic
	i+SRrQfr1ZHEobJ91qGBunv7hnjFe2HJi1OJhe9a7LgTcQyu4Py/0KqL5NgCUZuUVa3+fv8pMlwIX
	WsrMXRw3TWPEI6mVAQhv0zl6u2I/t6KBIWoOCWl/AVlPV/HjRLAWkYeIjP1lhuBQYwSqA0UP8XSsR
	mYY6MHtTCX+V1tdLvlX2MeUNwiKPx+X+Venhx0eTQ9XK8+7OEb5f8SCoujN0RcFoDMmdpCvTzp6qm
	G5KHQsA3HoqPsFNLV38ZyLaDFH+JzNtKkI8/wQORv8BvcCGhODgCZNZScBF+CXWIBnD3q6DB7tqVK
	vvk8Cr5bSp+wCdTMb47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP6eA-007FXP-1t;
	Sun, 14 Jan 2024 19:59:54 +0000
Received: from out162-62-58-211.mail.qq.com ([162.62.58.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP6e6-007FVK-2T
	for linux-riscv@lists.infradead.org;
	Sun, 14 Jan 2024 19:59:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1705262386; bh=MlO0W/6NOpgeBxiotyDe0grBFJ9Aiowv2TivzweCiL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nUlBnwXrX3++Ybs94zvPDM1jiZxkJjarmuyfl3PcUJ3MVzZLap6ZQkWMcWbwSLcvs
	 RjQgM0NNWMKAY8wy8rVB/WuQ2gluhqghpiXaF4wZ9Wxd6EwFkTDLSLqvSTVNRt0oFQ
	 mVkwLtM/lsJ1jHJLh8lNIvLSl/cFjyobbowo7rec=
Received: from cyy-pc.lan ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id ED316C15; Mon, 15 Jan 2024 03:59:19 +0800
X-QQ-mid: xmsmtpt1705262364tyk1oh493
Message-ID: <tencent_817CE182D5DA478E3FB85831A621778D0008@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JupryUVYZhO01u8+NuEVFJOee/hDlQxpeUqxee53LFkxvr04h64v
	 quTsRC8m22OZ9dui7TryswLnwKqppyWMbZc3KtTnP+OLI9LY08U6SvYVZc205KspM+QtZYZGfHaa
	 lwtpbfXf5R84mmBP32A3he3WD/f8BesaWLBdSTP8ZGUj3AfEgV2LXavuJDV0sEq+6SUCucOyEBzL
	 hX1wvdhmJOMS6fgVjSIYiResaqA9BnhJblC4/CKfbfLAImS7WMdebSfegI17SIBI0qD2+XpNUBuz
	 44ONhn9kvqJclrQuWVDO+sNBUJibpYlZZbeJZ4nNu0p4jxizX8DyytnWi456I4KKl9+9663NE6tJ
	 n4BFwYwwz+n4rJmQiMskQ73laYeBAWhoGfM8lsuxzxpMX9ici9JO26uWirUKEbHTQeas0tIi/hrG
	 VgGZdzTsahDz3MA7+eF0kFbUACXEd/BsnRF5oNixHT4mDEac5/ZiCi2c5Et7P+98poUQwEfXXNs8
	 nQbg7fwhhpiuCcn1uDo8zlkfJ2Au9o8oYskPyPxDR+hpWhfB4n8A15MqXEDGcGRY/UdTAmMae8sG
	 6Y2jI5wAhSn9w0wloj4rU9S6pMhRNvvgl59wMVqTS/WkCmYOU0Zlw/jafiEvzX0pXk3fkGPNyn7d
	 lOt0YJIcBP12SZ8+hyKqWkzoxxAgR2ESn6M1LIyE7B3g3IjQxl5h2qtEJmHyMyv8WONC42Jl8RAL
	 YWovqVjmy9FB+0OIzBcN5bSTblQp34gQff4zgO4Z29iQchulRv4e/2s4bDDA9wAhpifd16P5Gafm
	 yG/X9jY7gu4vE0f8nvMbxi1s7p/YzmvjxCr3X8OMzXy+Jy6qywVztZ3O7xgk3qDIdLWEu8um3Abi
	 wONw9NTOw94ZAArDJ4584I1hXhhwpw/p+2cRA0Ftl/Z0rpDHf6CzIXgwaR64RLEJEi2yJ3goP25D
	 koCgMQM2Cg9RB07m8wweOFN2UMVzVOc4yLDWhM+k5+gH0Hz62J+UiET9cIqIwoS+PKyro5bBdGff
	 NGUBFdrQ==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 2/3] RISC-V: mm: only test mmap without hint
Date: Mon, 15 Jan 2024 03:58:31 +0800
X-OQ-MSGID: <20240114195832.275982-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
References: <tencent_F3B3B5AB1C9D704763CA423E1A41F8BE0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_115951_425802_B3FBD9B4 
X-CRM114-Status: UNSURE (   8.13  )
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

The original test from a patch violates the principle of mmap which uses
mmap hint address as the largest address space to use rather than where to
create the mapping. The address space in this context is either sv39, sv48,
sv57.

After fixing the correct behavior, only keeping the test mmap without a
hint is enough.

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
