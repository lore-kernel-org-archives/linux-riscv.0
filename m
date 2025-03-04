Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D12C021B8
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 05:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRkzreWZ5Qoiz0MSqFvigiP66tr4kNuyc57KNnpOu8s=; b=ngD6tEbwqAPYa1
	kuS8pSE6Es6wm6ltIKzQ4kpICNbrxsWoW6PRnXGAyufptI1SRNRy1bLnkubjzppCUGo4yCBbALtWs
	7m1rDh5ip30VXHnUGlQlj/c/jVZCxyz2iWJDfJPRMe63RWDV5j/+oCSzLnmmzanITZTI5gTPS6dnd
	bo2H6CmVYo5UXUIK8oeXGItJ+Fs/Qp9LkH4aX2cNaxyJPamOuNNCpGrRLhuYC1Ng8iw+cFN4i2YFA
	4fptRodxEle0i9x6EMl8fq3YiBRjMdd57Qo9dsOWIWHiCChWyYS042NPfJ1W9h7+6iqUvDvHqJttr
	b9JQOrXEWxxZO4kuOLAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKVE-000000035Ka-3D2R;
	Tue, 04 Mar 2025 05:07:36 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKS7-000000034X3-3h84
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 05:04:24 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e60a3bf26a8so6647932276.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 21:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741064662; x=1741669462; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DvRfiETt9/vf5K0lL/pnBeyo0XjXyN5OT4Sb89ZDY2A=;
        b=uVbB3PagAbAmWqVF2sOCbEoA5QGg8PBwY3IkOvhtfs+DeAH9j+vi4jUgnlX/naoyh4
         EeCHWqBiOvqRVbaqE8PVIcaMH0v/sJwtKc0Aisbj3SzaapnEQdTvIRC9waE9QiPupxiz
         LIT7FvD/ADlvXuge2sLXT4QIyK2nS4/xexYdgQ02lgbBQ9DdPltPfd8dwCa9qKAPfOjd
         WG7yWKq+JNv+WBRKgAizE6HYIR5Bz9fw0qwP2iIN4TpvraW/KtuGxvCqimmahXX75VwD
         5Un28UbMw7bC8FQrmkCowt2SduDEB5TToWBIxVl89c0nDoZsERFbh9X/JdrTqTmOWx/J
         pY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741064662; x=1741669462;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvRfiETt9/vf5K0lL/pnBeyo0XjXyN5OT4Sb89ZDY2A=;
        b=OTgwHU1K4S9twgOx1zm1Rlkt1sF2x8TZQOcTfr2K/B9bzCQS1KtzJu9BmSHQg21Tc+
         tGxMmFj9D8zXFzLr6U07ZK2Qp/+Eg6X2Ed7Z2OiUm91LydYDVoVm41HOFAd2ISYf/gNf
         7YTuFXWkQT28OLLBIPkanqpMhhtQyuUW4NMbTosnZNzbvMHHWqdSwn52NmNhG1xhegnp
         12C3M9d3GrOE3w9/Td0PsUIldtQ6e9AJKb0HyBTxW8s+Er+qxE/XneuCFcERvjPoQwTr
         D3gel52iL2nSBouiSOc6PpeN5sdHQz/0nnCOAy7g5oXDjmSWHuqLuuoc922jVkUj+exh
         0CjA==
X-Forwarded-Encrypted: i=1; AJvYcCXT0JzbyBpjJAiBJDMilBHBz63qXmq42LIF48xzCQDLGYlQFq4r8CDfhUFlURgyou6fYCJDfGzuyKMjkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycSExpmoZs6sil8pi5TNq4ddQnENi8lDsILWmu39VFxWmNTonu
	JJYXFs6k2IZWNV//N7JEg4FIhftbQrVqML5iL9h6/PXSWEDfmkzEnwpoWELmCdIRPsN0IfyaiXn
	LT74+fA==
X-Google-Smtp-Source: AGHT+IGBQB6dZZ9Csl0mZ1y8IMIjXPBoV0Vt7a8kIB2h5g+5h/WV1kubj5dpIBkqnpDzwoAkqybaXtIaN5v8
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8af9:d1f7:bca9:da2])
 (user=irogers job=sendgmr) by 2002:a25:7104:0:b0:e5e:1496:7371 with SMTP id
 3f1490d57ef6-e610c1e48d9mr214030276.0.1741064661618; Mon, 03 Mar 2025
 21:04:21 -0800 (PST)
Date: Mon,  3 Mar 2025 21:02:55 -0800
In-Reply-To: <20250304050305.901167-1-irogers@google.com>
Message-Id: <20250304050305.901167-2-irogers@google.com>
Mime-Version: 1.0
References: <20250304050305.901167-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Subject: [PATCH v4 01/11] perf dso: Move libunwind dso_data variables into ifdef
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
X-CRM114-CacheID: sfid-20250303_210423_911266_4E1F1E1D 
X-CRM114-Status: GOOD (  10.38  )
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

The variables elf_base_addr, debug_frame_offset, eh_frame_hdr_addr and
eh_frame_hdr_offset are only accessed in unwind-libunwind-local.c
which is conditionally built on having libunwind support. Make the
variables conditional on libunwind support too.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index bb8e8f444054..dfd763a0bd9d 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -154,10 +154,12 @@ struct dso_data {
 	int		 status;
 	u32		 status_seen;
 	u64		 file_size;
+#ifdef HAVE_LIBUNWIND_SUPPORT
 	u64		 elf_base_addr;
 	u64		 debug_frame_offset;
 	u64		 eh_frame_hdr_addr;
 	u64		 eh_frame_hdr_offset;
+#endif
 };
 
 struct dso_bpf_prog {
-- 
2.48.1.711.g2feabab25a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
