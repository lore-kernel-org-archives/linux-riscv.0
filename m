Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC096C282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Mar 2025 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=emS0aFGBeCiyP05Vz/SIuylLRPrrwwQJcCP9qWtTJiI=; b=ad6cUHCmp3ZaXa
	/87lqK0UHSqXb5jl88w1e46Y1d2n/PZptRW8m31L2ucnpPxGaNXzfcUkJUn3htfymWCL7kLTdsRXm
	qTUIg3c1KtSZEJILjsGDYOndq2RI3XrszrxDkx4sapqOO4XqpfgZPrKiWm+bFZSrinN0PnYyKwSiA
	79nUKmWPlSsKCBcPy0ItaCUzUO3UfK+8vgixFjmQUoA5XiWW+MhhQrn7oK6S/eUlYM9PWNV3ecXgN
	1Nrq4aqAXRfKmpQgyfPi/OE/DR9zZWRZpjVXz6Oof60tsa8oDgEf1GHp82J5ulH973hA7zxV63HOX
	PDMPSAxypunc7j7ooXwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuO2k-00000004Zyn-1e2B;
	Tue, 18 Mar 2025 03:55:06 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuNgk-00000004WLi-2nXr
	for linux-riscv@lists.infradead.org;
	Tue, 18 Mar 2025 03:32:23 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e3a0f608b88so6647913276.0
        for <linux-riscv@lists.infradead.org>; Mon, 17 Mar 2025 20:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742268741; x=1742873541; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=ZkR1cFh6NG1cdEXpgf2C75Ru7pop7XNDEimt0RbE0H9NwXd/qWTs7GO39OImdmXde+
         xQRUICnNDNmkEg+PLBT1fjkgxSxYh4aA0sEa78WYK22FLziUgTMgF4FBgSOg8dwdf832
         CD6trRjt63JpQ1GhyFdiLs46JtSEJu6kgpklyth2mxAn9NjakP3FNfrmL8vDBSrJ1fAS
         fBWH1xk08mj63BS4cWgtwtZjNKJIl6kCIaIOuroYQFvo+WAGSvJda2gobPwe261FRXh/
         9TM/QQ3Rz3CVVlOodeSOUREeVZAw39e6mpLkC1EACDaFMsC6QEUKPpghYKa8UQdj7GVt
         QiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742268741; x=1742873541;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncdSM+lbXMb9xe65qVg6II6RWpGKh15ceN/q8SVr8Hw=;
        b=uhYs+DZ1uDtsuHE4DO1YRZwoiIhJDro23L9qBzFJz/+hnenWXUQ24txIgXJ2sueYFK
         hs8m/wKY7KyibNizlmdjW86vEdDtUW8nHrT7HV4IjKKMg33DreRfeOpKme0+lBYOvcRd
         wO5F2wcimz8ZKA+1CgimK5+b0WHNYo7YreVMei1Im6WbQhokwsaDfiBygv2hi2WJRVEN
         wdYOcdiHBb3yWxqrsxOAPW4j2KQrXEnUl+VkLfzhg2IhltPwBLtpk7hxKGeDN8KuG7YY
         gPzntbmAlabxIi0/yozLk7VW3bio6ocI/yp1KW2wQFI8UerehUByecruvVlTWjPq3r/d
         U/0w==
X-Forwarded-Encrypted: i=1; AJvYcCUI1dH9bwIh4qP8wpC/DVHiHgsvBbjYGaJt3rm5FCkLPTXxZPxTraoHkqtkKxFomN2uH4yaMHUKdWNSQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgce8BEyMMW3v+Ua7E+SWDhIaHmg6Bwca7OCR58Peiq6HydkqU
	oguGTPoJ7uyLnZoNfN9ttRHLOcj1cOTWVia8tjxFZzPOgrX0nfHVPG8gAmF5s/vIOe+E/LVn6ee
	WJWrMSA==
X-Google-Smtp-Source: AGHT+IFff6zTrm/qdBPCcW4VzBl/8HVEtmJ31hx7NBMcpMHrGakVqIIkkB68EE2nkLWCDeZliwqsntSQnLqE
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:ef29:15ce:a42a:b69f])
 (user=irogers job=sendgmr) by 2002:a25:3d47:0:b0:e63:c603:37d2 with SMTP id
 3f1490d57ef6-e63f65f7ddfmr17773276.7.1742268741220; Mon, 17 Mar 2025 20:32:21
 -0700 (PDT)
Date: Mon, 17 Mar 2025 20:31:48 -0700
In-Reply-To: <20250318033150.119174-1-irogers@google.com>
Message-Id: <20250318033150.119174-12-irogers@google.com>
Mime-Version: 1.0
References: <20250318033150.119174-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v6 11/13] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250317_203222_699037_F476D69E 
X-CRM114-Status: GOOD (  10.57  )
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
