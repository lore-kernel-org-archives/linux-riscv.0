Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5383EC35FF1
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2VwqYdwIrhvSgi+6cbuIe4r5DB+P1Qo6TSLgXYoWUiE=; b=O3mw4sGHdvmCYROhHyrWY7DO2h
	ng8k5OIEpuPCAt4WgXL0+m7yVxlJ1/xyG/D//3rv30ScbbWXlsreaBdzpY0wdDwhf7Z0fMU2zbxqD
	r1RH1MXJeGZ3JiJf95Vhd1VPfU474CvBZpYYmb6PyIWJM5b7TY32YVeXWLI+bLhec/L7OEwXApZn4
	YB7p7Fn0bOUgHDW78tuSrNNzqLEr8cEBvhY3q0Ly6o1mSthV2lrPJezeQe5i9e8oekg4IHBcbu3vg
	Gd49L77f9+w6off0PMgw+k62B34TTPETfO8wU1zIFss1gbiQNLC5FZC2HqAd1nffWP8qJoa1hXa1z
	eJchVEew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuli0-000000081Uw-0fdD;
	Wed, 19 Mar 2025 05:11:16 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tulef-000000080gF-0HBM
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 05:07:50 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e63458181eeso10293193276.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 22:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360867; x=1742965667; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=abYRMOxViqYMp92GMDii3ruSxpFYmB3QwrQR3Z5L6HY=;
        b=yJNhReJzkxm2e8LGhYEiqjWled5/44YViF/cY6eFVtPrRmoNX1Fl5PdOMsgh00ne+p
         LybWA3kfuqMCUv9jJs3Xz9BIwMmi1g3hK9x2R9EQ6E+DFEWPdiw7T/RmYUyf+8TDBEQU
         Wx8eGO3ANgLrJog3lub0oSAsMr+30/luv7MIh4S4muWRDE5FP7LMljVRUv8xdD7n6wTh
         eV2Jvr7KEf7ha1bfo6Yf+7xy+0SGx+OG64ZEc2qz16Fbo2nKDvTHDT+Ne5B8vAZZhUzp
         f3PaSrb3sh01n+7uwwJBcHgvp5kuLtSBqsWbkLsN7DbJTXFRtnUdph6dBCPgOkfoIomy
         ZzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360867; x=1742965667;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abYRMOxViqYMp92GMDii3ruSxpFYmB3QwrQR3Z5L6HY=;
        b=ntq5DYGN2d5zZ+Ymm5YbVN127iKa+OB1cOpObfkmIYgawG/uM9FVIUP6doHVH/N3YQ
         tR+nNzH0YkaZK4fln5W7/v7A4hy/uelE74YTPdUzcET2QvLccnKOHc/sLklsgnRICKro
         1eQLXavb0pyseAxHB57gd7heOMAHpLB3eLn7lciTBkCqAw9raPZomQGOdETNHglG1MyM
         KbshQwPLj270BzXoYLEtvE4uUYwtmaE+nzFVssGP2TZZUU8sPyKjRlAREmttZSOvhSPB
         ELVSbKQALDXExdLsW/8/Nt+KMJdZcp/uNr6jZLIHdDUU6Utyx2DS4H7N/BzjLIi9fyOC
         BvTA==
X-Forwarded-Encrypted: i=1; AJvYcCUSyLtXaHgYfII2T61gOt1fMFsQg9fPdydFeFfVi+NRzaE/gMdJXT2R3qAANkAmvOdnD4VgdFtrCTp15Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxA5SJEm+J83Jr+qZ0EeDfj+YeDNmPwMlobggra7M1OdYLYaclk
	chBWfUKWrphYOlz2HnO7X11x6vvFOIhFdu53ZSXcPxS78E8VDru6eCBA5zS9aD9F9qtDJblj6nA
	VrUSg7Q==
X-Google-Smtp-Source: AGHT+IGRmoWaZCuVB5ee3Iv2LzVEuNeEJLA9zgD9tzBFtuvqHm9F4Ignee+o0RWj2MTQlY6HLf9109e/Wj7N
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a25:b323:0:b0:e5b:f74:f5a with SMTP id
 3f1490d57ef6-e667b456dc4mr504276.8.1742360867177; Tue, 18 Mar 2025 22:07:47
 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:28 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-2-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 01/14] perf dso: Move libunwind dso_data variables into ifdef
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
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_220749_104007_DB5FC0E6 
X-CRM114-Status: GOOD (  10.79  )
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

Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 846b74510038..2cc1f6593f9e 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -155,10 +155,12 @@ struct dso_data {
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
2.49.0.rc1.451.g8f38331e32-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
