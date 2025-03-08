Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC185C282DE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Mar 2025 00:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hHoCqmNjUym0QHzMpbXizsP/pRE/A5bArAv3+ShzME=; b=ILkq4OrJVMJIdo
	oW1TuCfm2WpygeqKcTbe9PM+4IO3zpcDwRniPMA56KJnxKxYHYs+DQKQwuyqKOzpjmicEhH2/UOy8
	oy0WJGystMyP9zOQmhgjb2hiROTdBIAS9bqG91L7Y5UdZd9Rwi8xml7KuIM2JsHU44BwrR55YTMnh
	5D1bYNaY/08+e6hEMyHG3VDViWJdIjmRhBxG4k5wfal4m+CMfKYiirXRGcILM6Ia1LH86QVkMFivQ
	7a+CNDXtjb9AyNJRU94aAFjuYhjRWqlT7TIcTyy4Vd7+HnnlMI3vd34E1jSCQIQ+LZsGE8y2MlUab
	4q+sTmbJBL9wJnK0n4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqiGZ-0000000FvxF-2kkT;
	Sat, 08 Mar 2025 00:42:11 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqi79-0000000FuI3-1nik
	for linux-riscv@lists.infradead.org;
	Sat, 08 Mar 2025 00:32:28 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6feb6604cbfso28004027b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Mar 2025 16:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741393946; x=1741998746; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8nEy5rB/hIdNS8kmhBvsJmZBEly95jw8NQmovPnRcI=;
        b=Jowb8eQtKsvYbFG75xi5rXrRCfMKC+Ez3V8uagitDBoJjrN+VFESbq53zonX/lQ8z9
         0jaNz39wOJd7L+f1veqVJVMckrEJ7GqXX0JLVYA1YKdNoS/IE05bj9Jt2CN9e6FMpjxd
         XHtgUHe0FoKgcPO16q09Zy1mzTADkdGY66c/h2Jz6VBbrZlFZSm3UKMuoVGrLBoNysqa
         hlovEIE6VPRuwmKGgkLQXjfBe+Rk6eREYzeyr9bhZWtVp87b8O8I8WJAVrvg5Hga8EOn
         NfN3xy3OWfYXJ/ABCQdrfNaLwRVd5D+MCKIp5E7KMNCPK55hwYmbYd10metaxkO8s1Da
         Ar/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741393946; x=1741998746;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8nEy5rB/hIdNS8kmhBvsJmZBEly95jw8NQmovPnRcI=;
        b=Ltm/Zwzqv54BjaOnby36r6lb78v31XX7oUJ5mjjIBSMlFEN+s01W8/1BcDtyjnP6cP
         7GIAE6gDLeb0WJuH4dWodv13tQ/4YR6ZU+LSvp5P71YAumjx5431q2VkBIdI/QfiL9FP
         DPldK2QETrNfvQpflSchbMcqs5aCDsad/S7oCvQs8E2KrqWCtbp7+wjLKR2mHfObLkWc
         GmU4VPbWSdiDnK8/8GWvFpw8NgpIZQ/inWaWGMfdrHPH70JZfnZMaiGwZ8rQHM5Ni+2d
         j2wfU+UMt37hBxywXFJQhdBxJrKUWWWSjWuJv3ywTSJi58bjN7LIXr1ulNxlmeoLWcUe
         kkNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBdtnFpP2Ugcw7KXU4KUj7uyLImeYWtDSR0Ccy0PwPyXV2UIMRes2d7dLgW+8F+vNUI9eszYdoGYHafA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyG679WECoBHj9S8OgjvWA645rKGbdGBguHmJX94BD1g2MGCprM
	6nZkVKJd4yiQSWfEbWFu0SV1s8C7Xl3LHx5bqLkj1dXAOA4uuzigxzUz/TH5lboahXbf4uoLkfE
	q2+DpJw==
X-Google-Smtp-Source: AGHT+IEReJ5DG45Y2N78xw+Wv9anGhMhyh78SY1Xp5hvlU3qYN+t3i78fMBSJgNA1+oBXk1aHtUloiroGn65
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:1541:e490:aa80:5766])
 (user=irogers job=sendgmr) by 2002:a05:690c:20b0:b0:6fd:2b79:fb13 with SMTP
 id 00721157ae682-6febf3b53d7mr4850647b3.6.1741393946311; Fri, 07 Mar 2025
 16:32:26 -0800 (PST)
Date: Fri,  7 Mar 2025 16:32:04 -0800
In-Reply-To: <20250308003209.234114-1-irogers@google.com>
Message-Id: <20250308003209.234114-7-irogers@google.com>
Mime-Version: 1.0
References: <20250308003209.234114-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Subject: [PATCH v5 06/11] perf dso: Add support for reading the e_machine type
 for a dso
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
X-CRM114-CacheID: sfid-20250307_163227_479817_BF23AAF3 
X-CRM114-Status: GOOD (  17.17  )
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

For ELF file dsos read the e_machine from the ELF header. For kernel
types assume the e_machine matches the perf tool. In other cases
return EM_NONE.

When reading from the ELF header use DSO__SWAP that may need
dso->needs_swap initializing. Factor out dso__swap_init to allow this.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.c        | 88 ++++++++++++++++++++++++++++++++++++
 tools/perf/util/dso.h        |  3 ++
 tools/perf/util/symbol-elf.c | 27 -----------
 3 files changed, 91 insertions(+), 27 deletions(-)

diff --git a/tools/perf/util/dso.c b/tools/perf/util/dso.c
index 5c6e85fdae0d..00fec1bc32bc 100644
--- a/tools/perf/util/dso.c
+++ b/tools/perf/util/dso.c
@@ -1170,6 +1170,67 @@ ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 	return data_read_write_offset(dso, machine, offset, data, size, true);
 }
 
+uint16_t dso__e_machine(struct dso *dso, struct machine *machine)
+{
+	uint16_t e_machine = EM_NONE;
+	int fd;
+
+	switch (dso__binary_type(dso)) {
+	case DSO_BINARY_TYPE__KALLSYMS:
+	case DSO_BINARY_TYPE__GUEST_KALLSYMS:
+	case DSO_BINARY_TYPE__VMLINUX:
+	case DSO_BINARY_TYPE__GUEST_VMLINUX:
+	case DSO_BINARY_TYPE__GUEST_KMODULE:
+	case DSO_BINARY_TYPE__GUEST_KMODULE_COMP:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP:
+	case DSO_BINARY_TYPE__KCORE:
+	case DSO_BINARY_TYPE__GUEST_KCORE:
+	case DSO_BINARY_TYPE__BPF_PROG_INFO:
+	case DSO_BINARY_TYPE__BPF_IMAGE:
+	case DSO_BINARY_TYPE__OOL:
+	case DSO_BINARY_TYPE__JAVA_JIT:
+		return EM_HOST;
+	case DSO_BINARY_TYPE__DEBUGLINK:
+	case DSO_BINARY_TYPE__BUILD_ID_CACHE:
+	case DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO:
+	case DSO_BINARY_TYPE__SYSTEM_PATH_DSO:
+	case DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO:
+	case DSO_BINARY_TYPE__FEDORA_DEBUGINFO:
+	case DSO_BINARY_TYPE__UBUNTU_DEBUGINFO:
+	case DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO:
+	case DSO_BINARY_TYPE__BUILDID_DEBUGINFO:
+		break;
+	case DSO_BINARY_TYPE__NOT_FOUND:
+	default:
+		return EM_NONE;
+	}
+
+	pthread_mutex_lock(&dso__data_open_lock);
+
+	/*
+	 * dso__data(dso)->fd might be closed if other thread opened another
+	 * file (dso) due to open file limit (RLIMIT_NOFILE).
+	 */
+	try_to_open_dso(dso, machine);
+	fd = dso__data(dso)->fd;
+	if (fd >= 0) {
+		_Static_assert(offsetof(Elf32_Ehdr, e_machine) == 18, "Unexpected offset");
+		_Static_assert(offsetof(Elf64_Ehdr, e_machine) == 18, "Unexpected offset");
+		if (dso__needs_swap(dso) == DSO_SWAP__UNSET) {
+			unsigned char eidata;
+
+			if (pread(fd, &eidata, sizeof(eidata), EI_DATA) == sizeof(eidata))
+				dso__swap_init(dso, eidata);
+		}
+		if (dso__needs_swap(dso) != DSO_SWAP__UNSET &&
+		    pread(fd, &e_machine, sizeof(e_machine), 18) == sizeof(e_machine))
+			e_machine = DSO__SWAP(dso, uint16_t, e_machine);
+	}
+	pthread_mutex_unlock(&dso__data_open_lock);
+	return e_machine;
+}
+
 /**
  * dso__data_read_addr - Read data from dso address
  * @dso: dso object
@@ -1525,6 +1586,33 @@ void dso__put(struct dso *dso)
 		RC_CHK_PUT(dso);
 }
 
+int dso__swap_init(struct dso *dso, unsigned char eidata)
+{
+	static unsigned int const endian = 1;
+
+	dso__set_needs_swap(dso, DSO_SWAP__NO);
+
+	switch (eidata) {
+	case ELFDATA2LSB:
+		/* We are big endian, DSO is little endian. */
+		if (*(unsigned char const *)&endian != 1)
+			dso__set_needs_swap(dso, DSO_SWAP__YES);
+		break;
+
+	case ELFDATA2MSB:
+		/* We are little endian, DSO is big endian. */
+		if (*(unsigned char const *)&endian != 0)
+			dso__set_needs_swap(dso, DSO_SWAP__YES);
+		break;
+
+	default:
+		pr_err("unrecognized DSO data encoding %d\n", eidata);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 void dso__set_build_id(struct dso *dso, struct build_id *bid)
 {
 	RC_CHK_ACCESS(dso)->bid = *bid;
diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 4aa8c3d36566..38d9e3eac501 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -730,6 +730,8 @@ bool dso__sorted_by_name(const struct dso *dso);
 void dso__set_sorted_by_name(struct dso *dso);
 void dso__sort_by_name(struct dso *dso);
 
+int dso__swap_init(struct dso *dso, unsigned char eidata);
+
 void dso__set_build_id(struct dso *dso, struct build_id *bid);
 bool dso__build_id_equal(const struct dso *dso, struct build_id *bid);
 void dso__read_running_kernel_build_id(struct dso *dso,
@@ -818,6 +820,7 @@ int dso__data_file_size(struct dso *dso, struct machine *machine);
 off_t dso__data_size(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_offset(struct dso *dso, struct machine *machine,
 			      u64 offset, u8 *data, ssize_t size);
+uint16_t dso__e_machine(struct dso *dso, struct machine *machine);
 ssize_t dso__data_read_addr(struct dso *dso, struct map *map,
 			    struct machine *machine, u64 addr,
 			    u8 *data, ssize_t size);
diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
index 66fd1249660a..71df13a5722a 100644
--- a/tools/perf/util/symbol-elf.c
+++ b/tools/perf/util/symbol-elf.c
@@ -1173,33 +1173,6 @@ int filename__read_debuglink(const char *filename, char *debuglink,
 
 #endif
 
-static int dso__swap_init(struct dso *dso, unsigned char eidata)
-{
-	static unsigned int const endian = 1;
-
-	dso__set_needs_swap(dso, DSO_SWAP__NO);
-
-	switch (eidata) {
-	case ELFDATA2LSB:
-		/* We are big endian, DSO is little endian. */
-		if (*(unsigned char const *)&endian != 1)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	case ELFDATA2MSB:
-		/* We are little endian, DSO is big endian. */
-		if (*(unsigned char const *)&endian != 0)
-			dso__set_needs_swap(dso, DSO_SWAP__YES);
-		break;
-
-	default:
-		pr_err("unrecognized DSO data encoding %d\n", eidata);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 bool symsrc__possibly_runtime(struct symsrc *ss)
 {
 	return ss->dynsym || ss->opdsec;
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
