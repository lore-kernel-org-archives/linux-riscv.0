Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F3C282C6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 05:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0mnMpzi7c07OD8BTmh/ErAUpmWyqVpO7AEwpD/wdUM=; b=vBP7EbAKR7CMpJ
	GhCkWSctfOJVbm1+IdeMfd3SWzMLOC/E686DWSAG+pGKKIim4eOqS1HzcXjhxZwqNI2HFvAVSsgOm
	eC5HLtLSzIjtuKzyyUesS0BJksq5iZPGyqcOOdw4uAO9/QejVnbwLhAzoRl4y/oDP+Fxblz2UOF2w
	W7RsNznSA8dCaad46gfdoOAiHEYX6evERpGu/aQTn3bcEoQyTKkOpc5bhrJTum+ge/hVI7EgSfSHC
	Ic+MufldvnZZaLrck+HctH7Mcg+n07EY0zeeq/RbnQQ0c/HDkSOvsgivo3rYlxLinfOvP2Gbd46/c
	uLPO6OaDvOtMRiItP85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKjB-000000037go-2DIk;
	Tue, 04 Mar 2025 05:22:01 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKSW-000000034kh-3vhJ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:50 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6fd47cf3cb9so38840217b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 21:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064688; x=1741669488; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tzAqyNBDcatrD/dNYr5THRvvcwinanMOXL+SW4MgEks=;
        b=VE20NS5isoJCOdkx5yc6Dl5LXiICah/V8pbWqcNkZRbUBlzgJA5bKXnS5OtnUXql2S
         WB7P65ThnpT2fNPJV/TF5n4ZtzTbXzN3zZOr/Y6FBFKVddIFVUw0Z3iLu+RF9EtvppM3
         Y6m78D2a+oYY2SXvGUwsBbeMAsktjbzxQqW99/MCzoa+r/PQYiNYU6X7b8xQoeX9udXm
         OTST+7XwNAvN+BEOBGMkTQ7EAFGEtkfD2tZLhZ6SYFHTflzuU3NBZsH6msLsEMgfJl8Y
         FtAoGsXFZ2nMTH3qrMJcHMgzxOlJ4yJJKUCI53JZqppG2yoYRHqm/0QZfpl7FStTZyDj
         RRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064688; x=1741669488;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tzAqyNBDcatrD/dNYr5THRvvcwinanMOXL+SW4MgEks=;
        b=l5yJk6q29zdPF0YTM/gb/1yzbnK2fBuGyMvWelLmUOUZM7JGTvWn0uOIWov6kFLRJV
         oZ/Vicg4RuNapmYDwwHUt1FLa3Rw3dSZ5+BP1R8rR8+xdqMUd03bYfNCrcdRrTq4TNnv
         6TceYBqJQOT49OP16UEpF9G9iZf/kduv9RAlkr/vHWvUCUpLGrjQp7+bLzS9ViP7wFu4
         uffmkQfyyIiUoXcLJ1a2tzdR4vWLLi6V4fSQDVuZMdH5fuHqvzEuM8teEMFhgweyAkHX
         I3zPeXCHDIMtrXAZl0jgIwjgN0c/Gx1IcLotjb1l7q0HLpxl4I3Y4YMnF90uzkOVpF0e
         fDLw==
X-Forwarded-Encrypted: i=1; AJvYcCWeM8nNBRkENTDEApH7lJigQBlMn4Jlqba2DwibndLrrdHav3vcWN5qkxrb7einkt08okWl89Oks5orrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg1t0grRoMgjIGjJtr1hkGZkQ+Fodesd0jJA61SMsPjPYOqNrF
	fkkE2RZG37E1UHw7YjBRa5hKvruOa2nvXiejzH8TC2fL5MBDwe0iw63IdPMqi8stFT02/DJw73B
	dzLxT+g==
X-Google-Smtp-Source: AGHT+IGcXI4xtcRg7TZCt539wnaKT0i5MXbKrcmjSAdt+8/cOoexhcuHk6pVgzO15AtSpOO1xbrgGJNcQRci
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a05:690c:2a81:b0:6f9:ad6e:5945 with SMTP
 id 00721157ae682-6fd49e2336dmr19606227b3.0.1741064687649; Mon, 03 Mar 2025
 21:04:47 -0800 (PST)
Date: Mon,  3 Mar 2025 21:03:05 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-12-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 11/11] perf syscalltbl: Mask off ABI type for MIPS system calls
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
X-CRM114-CacheID: sfid-20250303_210448_972858_EA9DFDB4 
X-CRM114-Status: GOOD (  10.91  )
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
2.48.1.711.g2feabab25a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
