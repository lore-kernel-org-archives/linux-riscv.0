Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B0FEB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iU3/7wlSzW7dhrOh7DNxwG0fuDAD1umcjB2Ce+3C7G0=; b=g37c+13yWaR0qZ
	EGL3wCUW5LoRnt21+4jmaYL/83PWeGSSuwbFI++tn1OnPUW2i2WJQH64vVjLminEkJMCA2+b1IXnq
	M3ci11IVooiugfr8zUsaKtzY0J48H1wvCF21WToq8E2fWDY8jSCSlnGVNS5iT6eSfWxG+DooubZ8K
	3KFNB+t49d+JwA23VjZhjy085+9z2g3+Yqcq0d3inDJ4Kf9vpX3sxJ6RV3mbJNa6tR/A4VIEJoQqy
	x8jPBQNnakD1CDjvMOk4TkLoRMFQbb/Ute8FCp1IyTSTmACrtWweWrg3ePqKeRtUaBN5YYnkPaqF5
	tnsvlE6Zs67lt615y2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHEm-008rLb-2B;
	Mon, 19 Jun 2023 15:56:16 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBHEk-008rKg-2V
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:56:16 +0000
X-QQ-mid: bizesmtp67t1687190155tjgcboy4
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:55:54 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3j+DH7O25w4I49usNQKwukZko0M+fI3sghNet1qUt9QPoFPGaQxB
	qUMyPH1KyGxQc++m+763kfmCEtcyL49JXo2yHMQadZgrhtZ7A1HIxET4qQIWuaQOQuc0B5z
	vXxgUMSbD9P70U/yfA+nxAN7nnTlIGoBh+4w3niCvA+Z/2EOraI8DQpA6m6s2k1ajHZvFoE
	FAdBwRDieRX70M3hWobE0uCkcUfsM27XxUYZSJ731A6sywzYCHmnPH1saAHF580yKVSi5mj
	zZ4fd6N1vzXqxDKGes/atceNbMHFINvKZj0tmM57KNReZMT+tcf5OTPZU7XYbS6Z2xzD3im
	9Tcu3DQ5VpCXjBBMGVSGOFXsL98Q4YN1yqC9dgHnKrP/0d+Ma8YNWMUUD2oOwcdwJyI9WXD
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1231696777476800510
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 10/10] selftests/nolibc: add mmap and munmap test cases
Date: Mon, 19 Jun 2023 23:55:41 +0800
Message-Id: <9c46f648cd8c784405afed565bed120f0a2f239e.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_085615_122229_8E04AC6C 
X-CRM114-Status: GOOD (  11.36  )
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

Three mmap/munmap related test cases are added:

- mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL)

  The length argument must be greater than 0, otherwise, fail with -EINVAL.

- munmap((void *)-1, 4*1024), -1, EINVAL)

  Invalid (void *)-1 address fail with -EINVAL.

- test_mmap_munmap(4*1024)

  It finds a init file, mmap() it and then munmap().

Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/testing/selftests/nolibc/nolibc-test.c | 31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 80ab29e2887c..f7c0ca72cb28 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -592,6 +592,34 @@ static int test_stat_timestamps(void)
 	return 0;
 }
 
+int test_mmap_munmap(int size)
+{
+	char init_files[5][20] = {"/init", "/sbin/init", "/etc/init", "/bin/init", "/bin/sh"};
+	int ret, fd, i;
+	void *mem;
+
+	for (i = 0; i < 5; i++) {
+		ret = fd = open(init_files[i], O_RDONLY);
+		if (ret < 0)
+			continue;
+		else
+			break;
+	}
+	if (ret < 0)
+		return ret;
+
+	mem = mmap(NULL, size, PROT_READ, MAP_SHARED, fd, 0);
+	if (mem == MAP_FAILED)
+		return -1;
+
+	ret = munmap(mem, size);
+	if (ret < 0)
+		return ret;
+
+	return close(fd);
+}
+
+
 /* Run syscall tests between IDs <min> and <max>.
  * Return 0 on success, non-zero on failure.
  */
@@ -666,6 +694,9 @@ int run_syscall(int min, int max)
 		CASE_TEST(lseek_m1);          EXPECT_SYSER(1, lseek(-1, 0, SEEK_SET), -1, EBADF); break;
 		CASE_TEST(lseek_0);           EXPECT_SYSER(1, lseek(0, 0, SEEK_SET), -1, ESPIPE); break;
 		CASE_TEST(mkdir_root);        EXPECT_SYSER(1, mkdir("/", 0755), -1, EEXIST); break;
+		CASE_TEST(mmap_bad);          EXPECT_PTRER(1, mmap(NULL, 0, PROT_READ, MAP_PRIVATE, 0, 0), MAP_FAILED, EINVAL); break;
+		CASE_TEST(munmap_bad);        EXPECT_SYSER(1, munmap((void *)-1, 0), -1, EINVAL); break;
+		CASE_TEST(mmap_good);         EXPECT_SYSZR(1, test_mmap_munmap(4*1024)); break;
 		CASE_TEST(open_tty);          EXPECT_SYSNE(1, tmp = open("/dev/null", 0), -1); if (tmp != -1) close(tmp); break;
 		CASE_TEST(open_blah);         EXPECT_SYSER(1, tmp = open("/proc/self/blah", 0), -1, ENOENT); if (tmp != -1) close(tmp); break;
 		CASE_TEST(poll_null);         EXPECT_SYSZR(1, poll(NULL, 0, 0)); break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
