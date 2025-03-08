Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2453BC282DE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Mar 2025 02:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tztXT/+QoAhkHdbs9o+LQlsD284c29/YveSv4alyUqs=; b=ifAQeUksCeUMAK
	9UZx/cBg/1XLuEYq/Ck0GawdU/hedC5WF+Joyq/f9jo8wYmC3KFT/Ag5n0eELQ2yEH1W0kEAXsg5a
	ysA34S4VhdaKuCn3gRd71y5M7ZCxkeRpk2U/PvqmKJ6wG5WXPp+/VXoMcugfgFoGLFiQUU23uJ4Ty
	UYnG6IzLotSybsqPxG7VhbijFfeL5eExxZrCcZHwNADa5zWkxhe/Pi23zNiUExq1ges/qqTNb/Z0B
	kdfRHSdbWB6ruDoQhlzo9LiHVKwnNyxnkKe1U+NKXR3dobdK7QIyaCd/lso+atXmr3JYzODHYbXWA
	BdjQtqIj1OXwcGcBNJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjXw-0000000G29Y-0Stw;
	Sat, 08 Mar 2025 02:04:12 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi7L-0000000FuPH-0XC9
	for linux-riscv@lists.infradead.org;
	Sat, 08 Mar 2025 00:32:40 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6fd43b37dc3so35425657b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Mar 2025 16:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741393958; x=1741998758; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aBag0ZTpgw2jBnuqcdEe2ctv9zQnS+6XrNEn3QpM0IU=;
        b=JLq9fumMbejfMLz/Fe6iybHK0vCVNZlD1X29+zaZP9cgUFaiJWKhcf0bzlQlROhQYA
         9STQlDh8tJxTf1O3xC671kYc9M+n+2rQxm3M1WEO0u9x65rrWgXTS94TjkP/wQpY8Meo
         NZ8dzojrrzvYglbCRGofJDakYJ1dbTW3+yMEqZJ7ggMVwpvjprE8M4JkS5Xd7tA2L4Ta
         PMyiPK346jluoHclsaF94O94iPksoK3Psoy5l8S7BzmsgFW2E5REKJfREo3d6mzEjSW5
         r5qptYlpsRln2beHYS1wmpHeEjI8FnnwjnDHlZnefH35MtERYQcFaPOvwW0E9rZR/Kys
         5brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393958; x=1741998758;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBag0ZTpgw2jBnuqcdEe2ctv9zQnS+6XrNEn3QpM0IU=;
        b=PpMAhYGE9wYG89BrgiBpqdyGCRdsy+YMf/5tzQwL3/RnYEkQzIbwVrg/+cTjWm1s1E
         BGCvKhvr2Vt2wwem8isIyLets7hQ22GRGpAdUyEXb8NJHRKpyOl7FIW00LSMn/7j/nLf
         CUTR7+pg544Iev4sB5PGLCGvi/Vu2DsdLvDzl96DvMtChGtEc/8+H6//a+zkvGvz5jKe
         EuyUUA5vic+lEXqIZ2WzW1x2tonDrOWKOqoss7oK5pBml+vbHQMX9Rwb3gqmTyNtDi/N
         go6Yf8y3r3GXVLFDhOmjW/Wg5exEuRUwSkjPjRXXdxQWlbpIknYf5XXGWFiPD0Qnrj7y
         iURw==
X-Forwarded-Encrypted: i=1; AJvYcCWk2Yp03pM5Dt2J1sozDe0AfGvgH0trUw2D31rTnbnArEvLwDEmj2AHNOXGatX+QGbn8uSs7MaPxrY6eA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0llP9X9nsM8dN7OmWbz8SVHWC0I4zq/TZPKcSbJGMf5MkOrSy
	f1h9//AmLB9cu9nFpst8aub9XxIduWGKiqaRU3nCcAhyjUjCo9U8JqZtu1nBbiNkBwrX0uPHSQ7
	Jw/wOPg==
X-Google-Smtp-Source: AGHT+IGhJSVrXcuIauCCTdcdrck6v986JR4xLPN3EKMbWJDNglYuGen8NURA01YPhhzdv9BlJdEWKZRc9pFA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:1541:e490:aa80:5766])
 (user=irogers job=sendgmr) by 2002:a05:690c:2901:b0:6eb:ac7:b4bc with SMTP id
 00721157ae682-6febf2a661cmr5088337b3.2.1741393957696; Fri, 07 Mar 2025
 16:32:37 -0800 (PST)
Date: Fri,  7 Mar 2025 16:32:09 -0800
In-Reply-To: <20250308003209.234114-1-irogers@google.com>
Message-Id: <20250308003209.234114-12-irogers@google.com>
Mime-Version: 1.0
References: <20250308003209.234114-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v5 11/11] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250307_163239_172227_CCD569B3 
X-CRM114-Status: GOOD (  10.72  )
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
index db0d2b81aed1..ace66e69c1bc 100644
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
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
