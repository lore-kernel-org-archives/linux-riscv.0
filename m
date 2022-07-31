Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44434C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Jul 2022 09:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i5a0RiD1WaTkfHGu9qSQxd2oRg/KXfExskzutavcDYI=; b=tPXFtTGtDXVo3h
	sUpXFFWcbTR/iJ7XCNS+yPxBtqHMBcygMuV8kTrZey7Tii8DZtmP0ARDHVLkCgczMeTv5AbjoY/di
	TzE4s+F9XwKXFFA2z5dw8Zm3dSJdF/KvBqaWjHWHnOx7ESW3zYwt6eAvGqezQ8lLnT9yT3UMz9GCs
	zSank7s1cLGR5OaADMIrvDBvsIjKBFMMJWiKOrg7wkK0XLSIeo/Gy4DloFEwKcQaWGCDlDCUx581W
	NwhXHqwcyeq4MzRbnuKPg+ObjAdi6iy32YNbCzAPECVCzUbz6UKM7/88I+uS9u2FDgUr/VYKrH5tA
	0ii+tF/elkkJH4fihyGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI5Co-00ASEK-Kj; Sun, 31 Jul 2022 09:25:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oI5Cl-00ASAi-2c
	for linux-riscv@lists.infradead.org; Sun, 31 Jul 2022 09:25:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id u133so1444405pfc.10
        for <linux-riscv@lists.infradead.org>; Sun, 31 Jul 2022 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgm3Q++1bshM2vl04u7TMk9GX8r0/GgZjPpDoVpdNEw=;
        b=nOYN6MEV8djhhHocvXe+hviriAisVPDKDjgJEmXQnC7GE3aIWE9Ofw/xhg2liiM82U
         +KwO7/qekJpFxGJTcIQs6Ctl4GJ9n7x29rIcz+B4lWnbhR8/e/3AaZFRo8KHc1eoRael
         X69jxEngBuKi3ivSukSnVKMM/JaZVdbWvwTwPK3t/I9QelyFY1ZC3lUHBLd4EA29jYwp
         Db7keNveNxVLU8fBjzU7u0+K4F6xtZ+/Q8cAztfuOCffqEbLLomDQ45aApYY0HBpbPk2
         SYHx7082vuAwMVHkTaOO5s83Pk9GFsL75hDgnJ/h/ctiqjRX+ZmWGCl9ZTaTKar4Kp6G
         7KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fgm3Q++1bshM2vl04u7TMk9GX8r0/GgZjPpDoVpdNEw=;
        b=bbdRY9Qn/sFpEecdWIK/JcDcnUUghyR649HJmnFoBWSZNS1bqhbEJnTSoFLuNoqXNP
         u6NE2td13nEqNKHsowRYrg7/pSct/iNoXgBMwBP669fgqByI7g5/k8xY82WU3guZjaWC
         CGQOJ7PNL8Frb6ZPyKvubWuHJrXX8Kp/ZLYYo/ZOHV3YLYU3J+WB97bA+j353Qk9VHHs
         ZZXFFr71ZGzl86WuSte90o5wYXgOMTqNa30BY8Xp+8hpkL1YkKRrLjbTh118Q713wRob
         hckduMPi/QSIVUt10kh1Pshm6wOG9jffGbOFuco9fyTWoT2/36zg+S5qWqmIvBJGiMT0
         EfAA==
X-Gm-Message-State: ACgBeo1KFD79lidmGB7G+s1nDd3W7yFQGmnMJegcg32wxfpIvtdOv2WY
	mMQJEJeo/ZXSy+DV5TmdKQY=
X-Google-Smtp-Source: AA6agR7VU84e7l6aGVkbcFw+tkLywcnjeN6b4ZIQYsTlc3xYB3BhyXpmuUjM/Tsb71Wj1g6nvgb6AQ==
X-Received: by 2002:a63:5425:0:b0:41b:a9e0:bfc1 with SMTP id i37-20020a635425000000b0041ba9e0bfc1mr6783924pgb.206.1659259545257;
        Sun, 31 Jul 2022 02:25:45 -0700 (PDT)
Received: from biggie.. ([103.230.148.186])
        by smtp.gmail.com with ESMTPSA id t1-20020a170902e84100b0016d1b708729sm7147827plg.132.2022.07.31.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 02:25:44 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: keescook@chromium.org,
	shuah@kernel.org,
	brauner@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org
Cc: Gautam Menghani <gautammenghani201@gmail.com>,
	luto@amacapital.net,
	wad@chromium.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests/seccomp: Check CAP_SYS_ADMIN capability in the test mode_filter_without_nnp
Date: Sun, 31 Jul 2022 14:55:29 +0530
Message-Id: <20220731092529.28760-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_022547_148341_DA71DBC4 
X-CRM114-Status: GOOD (  11.25  )
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

In the "mode_filter_without_nnp" test in seccomp_bpf, there is currently
a TODO which asks to check the capability CAP_SYS_ADMIN instead of euid.
This patch adds support to check if the calling process has the flag 
CAP_SYS_ADMIN, and also if this flag has CAP_EFFECTIVE set.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 136df5b76319..16b0edc520ef 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -392,6 +392,8 @@ TEST(mode_filter_without_nnp)
 		.filter = filter,
 	};
 	long ret;
+	cap_t cap = cap_get_proc();
+	cap_flag_value_t is_cap_sys_admin = 0;
 
 	ret = prctl(PR_GET_NO_NEW_PRIVS, 0, NULL, 0, 0);
 	ASSERT_LE(0, ret) {
@@ -400,8 +402,8 @@ TEST(mode_filter_without_nnp)
 	errno = 0;
 	ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &prog, 0, 0);
 	/* Succeeds with CAP_SYS_ADMIN, fails without */
-	/* TODO(wad) check caps not euid */
-	if (geteuid()) {
+	cap_get_flag(cap, CAP_SYS_ADMIN, CAP_EFFECTIVE, &is_cap_sys_admin);
+	if (!is_cap_sys_admin) {
 		EXPECT_EQ(-1, ret);
 		EXPECT_EQ(EACCES, errno);
 	} else {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
