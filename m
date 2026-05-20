Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893D4CD5BAA
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S98zSeWc9VZ1UgMVxHs0BKNB+EOj1pSS3M7/pe5fZfg=; b=pcc8Hr0O9vFRNa
	C0cKtLCRnlUYkLsQkYnIX6MvN9F2RlPF5yYxNE/DDbcsCRIWfcAqMrxG3/9M+g9Muqo70L/Vy18IX
	fJt8013sQSrdbfLFfje+OmFR2ubVuNP3MlTLt2w11nzjcIRvyiQ2Jpef8ijgVaYR685oG+U4rxcaB
	vuJh40RKNIHnbFVcupSiLjGV2kap79bkga8eg3epYSVT2Rzx5RmDdYvsz9/du0TJSlIq3Hfs8sZhe
	IPI4Vf3RTih08CAqNH8jhgNxM9MNc/0yDXHXjMzbKEQyW9AYqCzhDiqqZi8rquHkdbrymxRErSdx+
	rnLSIH88BaCXv/LA7VTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHL-000000054zM-1Fxe;
	Wed, 20 May 2026 15:56:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPjHI-000000054xY-0eVE
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 15:56:13 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so54672005e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 May 2026 08:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779292570; x=1779897370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1T2Qb9RrZsz7qcSCkhnlZDPbWojGSBsbannTJKJ4R7U=;
        b=Kg6MWabysUrK9EhVqDt+I45TTTNugqUALXqnT6htfo3c/yMF2pw30Mld0Z1LV8ASFo
         wFQdE5EOWk9WIvdDM8aMTMRtUuikJ+0epHH9gs7Nm97H+V0pIxgg2JL3UyrXSeSRSGiL
         05zjQOEARdLVmbScaEB69XD+6eKwt3sJjTDtWa0fsWP3BPAD253h/JrLXQWDDAbPFcRK
         ZRskO0jNA4ss4F1okY47CXKFdenXWgGgdKlF0flZBurLQK08uB9NH1jJgtFG0pQ0BoZZ
         CZcljdWGPSEAu4afr5HddwHepGiTjvca7ghF6J4nhp+5il2gwi4xYF5gDgg3TMzmk1EE
         PZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779292570; x=1779897370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1T2Qb9RrZsz7qcSCkhnlZDPbWojGSBsbannTJKJ4R7U=;
        b=CO1xiILUSdRLIglFLWT2KRZplo/cPA7LhEkqqRbNLrBb86heo+H1blbAz8yf7thz6i
         JLbvtgI0u3+gGgjl6q5nNZc7t2ERkK9fJDBvLKWYygPjvWXLhYJ+1ZS6pq8SbcU8SCcR
         Ow5nk44w862jNWFlaEFKvyB5W6fNpJIB6gQkbE5L4C/hvyUP91/s6ISsAZ3ksYtXNkwk
         emccUeRXyveLIQkzcwTJiZUrdRcEWQ5BKObJncMbFG4x9ra5zDmA1c5PGCgw9zo1nzTR
         t8leDXyehN3ezwk8ZUKNflNW9Jk2cgk21aIADuOmZqWKziDfC0IsuadltD92gI8Gt9Io
         U2Ng==
X-Forwarded-Encrypted: i=1; AFNElJ9890tvOwTAqy4H+a9KcYouRtoBNDo151L9irUepRChySVPTp/EP7ziz13SUKreSAPJlI2c6wVlsTN0Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWMYmiqXdgvQi+R3eKWBfXqlnT+AZbXEWFgB5AavwxMNtkQgd/
	TIjs5vQBZOoUtNPBNUKVRetcaYw6XK9oQpbx/e8BMFqvpokmw4k7FWf7
X-Gm-Gg: Acq92OHowIb+1yrJUnFL4B8vaTUIxqTtJSRYVUoTalZOB3IXCLau1lBkhHDs4++zmaw
	QjfkV9G2BNU28FKkrcN+nvzRTl86tWdfQqCvjcELpvS3O7rQaavYSlKyFyAbw9dPiRIIXylJ9iB
	aeA+U+s8iT8uPviQ9ifL/Cmf/1zoP/sslStZIR28ezUaKHaj8IHAexCFX5+sAKKpGUnbY3wUY4W
	vKFjgia/lEDQ19enBc+GSgfujY7FPrUzsmMCvbsColVR9iKH3aaDvzRaL0uKf51oYeBowoRrFLC
	AEgTYLFJz63Zh5kaeoTxDXRa+hgQ6yv/fmUICNHbJo2uJYkRnAK3AjC5Y6YGFMMzTiw86n2HBfd
	xpEpJ+9VpTtdyUxJ1r044uztaOQ02hoYsdJ8pisqX8PFyJ6MYMWniNqs7DxsWQBfSKughnG0Shl
	C03QAuMXxcRJZy8bIAfzND0M+4llUEJUYtv23o5ixxiA==
X-Received: by 2002:a05:600c:470e:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-48fe60f195amr364284635e9.15.1779292570096;
        Wed, 20 May 2026 08:56:10 -0700 (PDT)
Received: from RTRKW671-LIN.domain.local ([89.216.37.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feab290e1sm215565025e9.2.2026.05.20.08.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:56:09 -0700 (PDT)
From: Milan Tripkovic <milant2002@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kees Cook <kees@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Shevchenko <andy@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Dusan Stojkovic <Dusan.Stojkovic@rt-rk.com>,
	Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: [PATCH 2/2] lib/string_kunit: extend benchmarks and unit test to memchr()
Date: Wed, 20 May 2026 17:55:31 +0200
Message-ID: <20260520155532.1139471-3-milant2002@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520155532.1139471-1-milant2002@gmail.com>
References: <20260520155532.1139471-1-milant2002@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_085612_211013_35091952 
X-CRM114-Status: GOOD (  10.14  )
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

From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>

Extend the string benchmarking suite to include memchr().
Extend the string unit test to include memchr()

Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
---
 lib/tests/string_kunit.c | 53 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/tests/string_kunit.c b/lib/tests/string_kunit.c
index 0819ace5b027..3a7d96e292da 100644
--- a/lib/tests/string_kunit.c
+++ b/lib/tests/string_kunit.c
@@ -881,6 +881,57 @@ static void string_bench_strrchr(struct kunit *test)
 	STRING_BENCH_BUF(test, buf, len, strrchr, buf, '\0');
 }
 
+static void string_test_memchr(struct kunit *test)
+{
+	char *buf;
+	size_t max_len = 128;
+	size_t off, len, match_pos;
+	char *res;
+	char target = 0x88;
+
+	buf = kunit_kzalloc(test, max_len + 64, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
+
+	memset(buf, 'A', max_len + 64);
+
+	for (off = 0; off < 16; off++) {
+		for (len = 1; len < max_len; len++) {
+			match_pos = len / 2;
+			buf[off + match_pos] = target;
+
+			res = memchr(buf + off, target, len);
+			KUNIT_EXPECT_PTR_EQ_MSG(test, res, buf + off + match_pos,
+						"Failed at:%zu len:%zu pos:%zu", off, len,
+						 match_pos);
+
+			buf[off + match_pos] = 'A';
+		}
+	}
+
+	memset(buf, 'A', max_len);
+	buf[10] = 'B';
+	buf[20] = 'B';
+	res = memchr(buf, 'B', max_len);
+	KUNIT_EXPECT_PTR_EQ(test, res, &buf[10]);
+
+	buf[50] = (char)0xFF;
+	res = memchr(buf, 0xFF, max_len);
+	KUNIT_EXPECT_PTR_EQ(test, res, &buf[50]);
+
+	buf[60] = '\0';
+	res = memchr(buf, '\0', max_len);
+	KUNIT_EXPECT_PTR_EQ(test, res, &buf[60]);
+
+	buf[max_len - 1] = 'Z';
+	res = memchr(buf, 'Z', max_len);
+	KUNIT_EXPECT_PTR_EQ(test, res, &buf[max_len - 1]);
+}
+
+static void string_bench_memchr(struct kunit *test)
+{
+	STRING_BENCH_BUF(test, buf, len, memchr, buf, '\0', len);
+}
+
 static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_test_memset16),
 	KUNIT_CASE(string_test_memset32),
@@ -910,6 +961,8 @@ static struct kunit_case string_test_cases[] = {
 	KUNIT_CASE(string_bench_strnlen),
 	KUNIT_CASE(string_bench_strchr),
 	KUNIT_CASE(string_bench_strrchr),
+	KUNIT_CASE(string_test_memchr),
+	KUNIT_CASE(string_bench_memchr),
 	{}
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
