Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C42BC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W3Mk+fadvdmpcz2MFWDjUPkZ7ckCz/yT/QvR6Mgj0k0=; b=YU15EbG85oMeoxvt9RU6L5nVId
	GYy5ON+jXc1g/6iSp8uB2AobcMr7v8rsrKbiT3180Icsl3LdmIcAmNL3b+zJOIVcS4CvCTwotsTv0
	A09mFCKv6v1ieA1WQzeFwZOvExAv90OqJKkdKzFIP6taTWo/NAENnsfw4sz5618oJv7mO671Vuc/m
	wZC7PYHwO0dFFaZukfjmCgUGoyxoyMauZkFExW9jSfXwkdcgmkEBeP5IvT6xT52uK4qEBs6MK1bp8
	WF5rasgb79FPfSnzqx1hUDbe3zFTUd4Uc6Gp1Vcv2fVr5+amnjjxFUMo0RkoLT3cCC11r99mIXoiO
	dEIBMiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xq-00000002baI-3wXM;
	Thu, 09 May 2024 20:02:03 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xJ-00000002b55-3WjA
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1e2bbb6049eso10632875ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284886; x=1715889686; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Od8ki9QAqD1fUhM/c9ehfUOTPfP0DcxD+whg8mbh4TU=;
        b=K0si/Krvc5IAbjXa4Kf7J/MoDMvqw+60dvKkJKGI3IWJZuPi/eg6xlSPSa51Y80dOl
         VLKgYKtTXcZylK6/S9gOMZMaaAnoqj4XYufRriAQEEKoP310cHYDig1pqb/j/BiUqfFG
         tDpKmRnkr1Sdm2aN0Tk2eUnVol4axj8igtGICWpNoKGj0ti6ZrLSuqwSUHJboeLrF2tg
         HuZnHK6hgb+DCVW2Sj0C/lm+RnuIGu4hVyRZ3rTmF5Y8KDVeJZIZ7JVbRasyz2EfegYB
         H+HIl/jhhkTdKu8B9Yf3Rpw3aqf9oAbMi7keu6lEAHseUQGMoXqHeffOoWn99Ar7ksnO
         8MFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284886; x=1715889686;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Od8ki9QAqD1fUhM/c9ehfUOTPfP0DcxD+whg8mbh4TU=;
        b=tIh5N5ng/wUVcHmR2ZS9j3WWTBpAKfnNEJ/kVkApHeIm5JK8o3HBhAs2cABEb2X6fb
         DtAYalIGKoyKLBCOEdAWZzrGAWVrOgsx7Pgj+VyicOGuEd62lBwfgdjb8LeAmXzudQVQ
         JbC0f/woTgbVKkl8nWWMh1Yz/PSJCoqrJRhVngvj6ftDRnFM/WUlVsKWAww7HeVOXMqg
         tRLj+Tr62zoKeS4er6NlxeZNVnSZyIez56HZR7zj2JrUyeoVObGxkfu6nglg51qc7bGw
         afgSiSgD5XlkIDFajAX73CJQxuNg6QU1iBOhBFo8f5JRDz3R+O4q9w64NeFRP/I6Sgoj
         sCDA==
X-Forwarded-Encrypted: i=1; AJvYcCVgeCwPACLINVX+WEStfxtbxFiySnlAGqCzaSkR3NxyqIkhmJbInXY4IEFR/XeizfZCmz6tGhEXjjA7zCUnkSLz1tSsJ69SXp9kWMQ/vwip
X-Gm-Message-State: AOJu0YyzSe8kxHmYT3Y/DPPpLF8r/0/wiqRMgL2ILGAkWBtdCXbFuuqB
	7ziwxhE5Ymq0UaPLXZKmEUQshmv1hgQCASflhEYYaHJ5HOvudKIeGjcfwVm3Liu/Mi+CawBsCOI
	o4g==
X-Google-Smtp-Source: AGHT+IF+9O8AdOrC0sfYwymi9nDgS8P3uCdoKz+tbRqRCiftF6S/rlAyRlPcJO8FmcCJmXEqc5hw6LgYks4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:cecc:b0:1eb:62c6:98b0 with SMTP id
 d9443c01a7336-1ef44049854mr17265ad.11.1715284886040; Thu, 09 May 2024
 13:01:26 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:05 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-14-edliaw@google.com>
Subject: [PATCH v3 13/68] selftests/damon: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	SeongJae Park <sj@kernel.org>, Edward Liaw <edliaw@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	damon@lists.linux.dev, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130130_331682_8804411B 
X-CRM114-Status: UNSURE (   9.64  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c    | 3 ---
 .../damon/debugfs_target_ids_read_before_terminate_race.c      | 2 --
 2 files changed, 5 deletions(-)

diff --git a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
index 0cc2eef7d142..7a17a03d555c 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
@@ -2,9 +2,6 @@
 /*
  * Author: SeongJae Park <sj@kernel.org>
  */
-
-#define _GNU_SOURCE
-
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
index b06f52a8ce2d..4aeac55ac93e 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
@@ -2,8 +2,6 @@
 /*
  * Author: SeongJae Park <sj@kernel.org>
  */
-#define _GNU_SOURCE
-
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stdint.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
