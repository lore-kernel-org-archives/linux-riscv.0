Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F58AC021B1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 20:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3bBA6LhEywLQHroaqoJ0qA6YcZPvP+NZAYs5RshrGE=; b=gaIxZVcnj8O6hU
	VUPmH7x1f57X5ohztSbTMb6BfC1AxbI8qCDCD9GV23CSdf0RdAbQGb5T8KPf/HavUNOvJ25oEZwaG
	gUwZSHOs+JgOefucDMmvGIzaGYB6sFPcax+uvBrPA1i/uUdZT5lSkDBzbBFe92L4PJKtQ5ZW1G9Vn
	sCRKOvSySdkDwFPAbOQq3Zw4mcPf7XkavuIwTmni+LxitBIzofZt84Ti3KGQUKwaXURPi0Hs+jI2R
	X2sv+ivbORo1EtUF9dCgcRYKikpPHV/B2VVJ3/CwzLdPpn/TjklYSyCw+jdVlRyxNcua4dsGE2Akg
	rUISR3gE8U7+uxrxqHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkqPb-0000000EoNU-2OtP;
	Wed, 19 Feb 2025 20:11:15 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpGC-0000000EU78-3m2w
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 18:57:30 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6f27dd44f86so1300317b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 10:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739991447; x=1740596247; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIzMGizCa0TqJAjUgJqlPFZGjy2pOOpFJSWoUD2uhWM=;
        b=uPRtwckz3nQOiHlsHQ1oO1GM2k38Jnk6R93lks2kN6gWWTyxuTlL4AaQlsyUZLi8mC
         EIvMWKMGMs1azBL5HVRTgRFFyEIE+3akzT8EKcQvqh+j30xN21fm4xPu/+qdPaLQ9k3N
         UaNIF3WC+grtbXQoU7QWPKIVM7xh2SztLSStuvMuFxOXoBS8gSbjxQ2TV84yytkl7dlV
         8fPPdDVrqhxtrsvo48XqOJXtQ7okaG5pyze7lgasVIMn13EpbaxwUZs0yWdxUM24oRfR
         2RX2EfH0Qvyhh5Ufp9ffCx8VwIWF0SQvzNqB5XrFj+QQ/Ujc/1hRcr1qVdMZ8Ae57Qjd
         jfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991447; x=1740596247;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIzMGizCa0TqJAjUgJqlPFZGjy2pOOpFJSWoUD2uhWM=;
        b=b4Qs11FEatUmK/0yWLrUTfws6oA95dH28tLr6Q/XUtITrrNJGRzzb4tE/fcVLu6Uz7
         Til5vrfOsye7JyoaW5cc7aLF1sr1vyxY7Jmwck6BT3ICb+EaxkPxGC4LHFIa8pHbdE9d
         LJh8rZU3Jr381Onq8rI25ukoEyT4fRSANTIhW3HgecToiH2fkUssTNFXn60rLvEp+N/J
         s/pUN+3D4koIrRbUF/0594j3RNUvaXsQCJ1IjrzBkmrIdUWL0XjOWQDAV/+0Xnctpk5S
         rttSXlbXoHOezK6pA1MzSII04hbLkJa2Fq09mQzdGpOQAHu5jyjn9OAEYYwSXl3ZTIFT
         pubw==
X-Forwarded-Encrypted: i=1; AJvYcCWHRZTDnKVS3jdBPyzblpf9/2fRoJz99pa+XyGUIqAUaNMe+NxVAaIzXPCupav3xv/sw+17nfPxc5KuKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzzE7dUuE8s4o1JvIudHMCSB6TN3NmDj+kL6MgUYcUomm62T1cu
	pg43yZPM9h8yz1rCJHrdx07QjY2MWXcT0bkz76eyJ0k3/LcB+s41stIBA71UcB4rJVBTsNkLi+/
	+7r+XJQ==
X-Google-Smtp-Source: AGHT+IHBIqCbWM4vcI984nDuEzZSczl9Bby3fcXaZ7gK0bV5Lnp/HxnIbC0vqnoo+ZtzSlf5EYQ7UBrYNZ0b
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c57b:86f0:c166:3061])
 (user=irogers job=sendgmr) by 2002:a05:690c:2f81:b0:6ea:ecc3:ec61 with SMTP
 id 00721157ae682-6fb582571c3mr2102467b3.1.1739991447284; Wed, 19 Feb 2025
 10:57:27 -0800 (PST)
Date: Wed, 19 Feb 2025 10:56:57 -0800
In-Reply-To: <20250219185657.280286-1-irogers@google.com>
Message-Id: <20250219185657.280286-9-irogers@google.com>
Mime-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Subject: [PATCH v3 8/8] perf syscalltbl: Mask off ABI type for MIPS system calls
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
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_105728_936792_5C6C0962 
X-CRM114-Status: GOOD (  11.61  )
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
2.48.1.601.g30ceb7b040-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
