Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E55C35FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 05:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emS0aFGBeCiyP05Vz/SIuylLRPrrwwQJcCP9qWtTJiI=; b=Xo44jCwpi1Mk5J
	Ysg1rJCsx6g8nhXG557/IoXrPQgQ7adzR+XfP2q7LzH9dX+vkZpQZJhQFy/aIbSvXrh7mpjrGeyc5
	+f59+liQWkV+rhTeubG5tOBedr7hnqFaPoQbOqEsdhBRx49SjwrSDI6fU7Y+sdRKxl6xVacTRG83K
	v3qj7nOUVbVuG6EfuR3nLBbss9QdO76DqJpja2ej/qB7kmtMK5kofXcFOTQh5KVO9gfXSft8Ys+K+
	Z/VG56g8wQqlnDmjJCPB9gIixNqfaCLFb58SdYx5qgRbWbgv62E43o/4DQafHXXkBjOsNWm4zOZz4
	Unr94so4BvoMug8cTnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulxE-000000083SM-0V2b;
	Wed, 19 Mar 2025 05:27:00 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulf6-000000080vm-0JSd
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 05:08:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6f2c7746509so97309437b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 22:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360895; x=1742965695; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=AxEJE0bRJl0wRZJ8nmQU9wTefaj/wetOlfXQAR4Hs9eO/5iPwV9eFVmp1GSC8/kMpj
         WdKML5YyCgiPThAVKDrSln7GpETC+KsJP6wtsGb71R3zPG+V8KnPKXloqFAodEzFcl/0
         ot1CI8ZA3SLzulooiD9VNJ665es9MMS1pTsxNmBK75pxROGuv/VnDNIm5pMBLP8BE89a
         6zisykHbh0tYqiII5rbKQoYQ7MeMNg4z9QNkMVg8j9fRympN/YU3Sm/u6Agv3RCjNudN
         NRcsj8L62gonJgvNkpIBwDDGJg0lpqT4IJWsVrW6ng12A9v0g87EJgvBD1jzjXe6R6QU
         uYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360895; x=1742965695;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=AOHvvG0FNJzErsEXzwI+W+D59I5kPLzzHT7BAFy9DDtB8VjqmV+gng6dFiD8hZchIq
         1Qp4p4YxUv+lvKXZFhR+mg+KF0kqRFbA7mGnEuWu1uuBldShmjUsCs4LOTz7uI8C8+Iw
         p2PcBW3yiJxKYEB5KYUy0puUBTI5VtYgqUCYCBU6+VSsn9sSciPO4MDtXbjCgNBdvcbz
         1ko8lAn96EJmHNb0JMEGUzaRoRx5VWbmOdyl0OJkWVMUK/jawgFZ+Rem6abPXCqrQgIj
         k3WXpdMBSf5tY4MsxPOLWp7ro/5lgJSLPBe4jjdA4JRVI/aGH+rGb4Elh6a7Z0qfki9H
         d76g==
X-Forwarded-Encrypted: i=1; AJvYcCXGUa/R31vAvhgl2/xX7Ia6uMU3rrEMqkLiLtFpm1Yuzt8Ovuv97oajp6GMMMsjzlxwuN+yyee9HUM31w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzO0TYZ9C8yowZ443BBQagB6/b4N7fhUestREPXd1lGQb61WW5I
	WG46iFGr3971dXJJhyToojJfLUuZIl9uywsbdtHTJrzDBIcdfn6hqNvfaKgcg6m8sWgpajvL5p/
	f6HoDuw==
X-Google-Smtp-Source: AGHT+IE7t62G3L9y/1w7Zr4bPbVHFfW94O8jbx7xn/oloQNZ3Xii0SOFszp47Hze8CWLQYL2UBnV/ggmaf2X
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:690c:6501:b0:6ff:1fac:c4fd with SMTP
 id 00721157ae682-7009bf39905mr12697b3.2.1742360891193; Tue, 18 Mar 2025
 22:08:11 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:38 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-12-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 11/14] perf syscalltbl: Mask off ABI type for MIPS system calls
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_220816_117145_15C5FA3A 
X-CRM114-Status: GOOD (  11.21  )
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

Arnd Bergmann described that MIPS system calls don't necessarily start
from 0 as an ABI prefix is applied:
https://lore.kernel.org/lkml/8ed7dfb2-1e4d-4aa4-a04b-0397a89365d1@app.fastmail.com/
When decoding the "id" (aka system call number) for MIPS ignore values
greater-than 1000.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/syscalltbl.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 4e6018e2e0b3..67a8ec10e9e4 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -46,6 +46,14 @@ const char *syscalltbl__name(int e_machine, int id)
 {
 	const struct syscalltbl *table = find_table(e_machine);
 
+	if (e_machine == EM_MIPS && id > 1000) {
+		/*
+		 * MIPS may encode the N32/64/O32 type in the high part of
+		 * syscall number. Mask this off if present. See the values of
+		 * __NR_N32_Linux, __NR_64_Linux, __NR_O32_Linux and __NR_Linux.
+		 */
+		id = id % 1000;
+	}
 	if (table && id >= 0 && id < table->num_to_name_len)
 		return table->num_to_name[id];
 	return NULL;
-- 
2.49.0.rc1.451.g8f38331e32-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
