Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7CCCA476
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rdTQIkEj4p+biqcpNWrCFB157+4EEJYRdFAa2r5Oxbo=; b=A1eIyUlL1kOUXE
	PHWw8Lrfy4kI5xsy9RFSqdFGTGSN1fLr+bx8NCgVizGDpBUWJr8gRvhMxEmrhY7baobt1KPsh3TEg
	hh18b6L0gA20RStu8K9mWVMMksop9S1LGR7/3za8aKBQTbpIKcLGOfLIhGfzaqLyJK3OyQHtm/z8l
	ylRW/upr4oYTT8H3tj55kpZ+NdPo3Pu5mrDr73mW8C0U6kxoJVATtQ8323Kk1ncMYQmzOh2fMjlAx
	+Q+h1aBhF+fPTfHcAsqoFlC58jR8RqsqiIS3Leu1dwgH+yr0lHbWkN0ZkdHKeLKX8ykCclxhY8WAt
	y6o/Yo6y72ssdQeDMR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lAy-0000000AyW4-2kuG;
	Sun, 12 Oct 2025 01:47:08 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7lAv-0000000AyVk-2e67
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 01:47:07 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso2955991a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 18:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760233624; x=1760838424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KYbEOZWKrX8qPsvFbYgylfuWLs26ZJ9jrLUaztAw1EI=;
        b=iuvZAMhNCtGc98BAx0EO3c96NFM/erYL9MjLy4UxjoJHRXNiGQXAnUAqAA+qd+vSPI
         pGPhnvkIVqONgHeaUJHTHrw2YMNzeQ3gAIm9TnCKJmH9MxBSxtzfr/XLtNjWSvxhyT/d
         IRtnm7AJaoWftQnQn7xUb6XH+f75vDYNBq5YokLGnWH9JbSh7nBcA+5leF/+h2c993Fi
         0Tu6zxg5ZgPJBdnMO5B0xZmamSp5RUZfna76f5LKZFFlYE4n9y5ONDZiWIQ7pyYAI99Y
         qmddjTNdoLBh5l3pzC9S2Tnz6X9KXavQ9NQs0MHs+w+0cMtG9LziZ0PcMhouzVm07dMS
         KyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760233624; x=1760838424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYbEOZWKrX8qPsvFbYgylfuWLs26ZJ9jrLUaztAw1EI=;
        b=rfcw7cWNCf6THzLmsHX5R7UT+Rmo3Cl22OafwZbfDUlETxUFue+ExtHPU05w1YUVcX
         F4UXMBgiTcyzskZ/qhtWzYk9FNBw8YfFiK5DhnqAcozHl7Q5G7OQ5Fi1YelmXVchYV7P
         A68iMmL7gLodkjDD1xRHHyR7QmynTWxZJw03qMSo7zihioi99GhH9piPKpgleQFU0A/d
         dHF3InV0pbEaOgksTGwGINmu3LdMBzswXh7AXG2s1BRAhFC2XvGEmM065dWb5a96iamG
         7oXHOGcrxOcyrBD4ir86PDjmfm7OALgZmWImppfz3ZKWQdMb69HtqJMVOyqbXjEOLSx2
         roVg==
X-Forwarded-Encrypted: i=1; AJvYcCVTZUb8vyzLy6hh7Gmvt2JkyT9edpORdnJse+oiDlfbUJq+/5armr0G7F09cB7t0q2N/X2d2PBiHUGhxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgduixA79Z3zM97jNiShCnRckdt4iWSazJ0l0mc2sNMjxrDPFc
	X1dbIlsXUAV8PGJd/mloHO96J2eOzME1wgSiAtoHvs4J9Mf68LQXv/xO
X-Gm-Gg: ASbGncvlV98UY2/0jgamX8Ur4L88ybPNRcbV+aejjWUQVPh3uIQcPtWjxTrCeTOi7/V
	eUVP3HIxDK9MHk6zFQWErcRS8zkJUTlMAUEw/tWGunviNwyZkyZ3yWVy5hIwB+n5E6RT3mfYFms
	lxtppBOr7CB7sdQYSUHOntzx2+AfdJYIPvlw5bzYQglUM+5LkB6Cqws1ipo1KxHz7U1+HtfURtt
	ulK0HQW2OwTEyv5D3Q11WQLv+ICCpt/UEXFsnb7muvexsfxnyQ//IxxiY7GavuD02SwwET0Kpjn
	vKo8Ab9d3dYhLIIrRPo25ioh8ZvCFSVJSJe/Ryz5S5CRuzvloou6W++MSf5lV77cBtROX6usZje
	jioYHOg1FN2xkoYahK+VMd32yEuhdEa8MWyI6O33udgoC8/M0pYM=
X-Google-Smtp-Source: AGHT+IF7fdQ4DpLL7d5WN2b5Q4XZzmynuin15/teAqQfYmvPl8vAgZO5oduNg4XTy9tWmKlYPreuFA==
X-Received: by 2002:a17:90b:33cc:b0:338:3e6f:2d63 with SMTP id 98e67ed59e1d1-33b51117433mr25555653a91.6.1760233624523;
        Sat, 11 Oct 2025 18:47:04 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-33b61aab6eesm7712060a91.15.2025.10.11.18.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 18:47:04 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Lin <eric.lin@sifive.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Guo Ren <guoren@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] perf vendor events riscv: add T-HEAD C920V2 JSON support
Date: Sun, 12 Oct 2025 09:46:19 +0800
Message-ID: <20251012014620.799046-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_184705_691068_BA7B4398 
X-CRM114-Status: UNSURE (   8.22  )
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

T-HEAD C920 has a V2 iteration, which supports Sscompmf. The v2
iteration supports the same perf events.

Reuse T-HEAD c900-legacy JSON file for T-HEAD.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/perf/pmu-events/arch/riscv/mapfile.csv | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/pmu-events/arch/riscv/mapfile.csv b/tools/perf/pmu-events/arch/riscv/mapfile.csv
index 0a7e7dcc81be..d5eea7f9aa9a 100644
--- a/tools/perf/pmu-events/arch/riscv/mapfile.csv
+++ b/tools/perf/pmu-events/arch/riscv/mapfile.csv
@@ -20,5 +20,6 @@
 0x489-0x8000000000000008-0x[[:xdigit:]]+,v1,sifive/p550,core
 0x489-0x8000000000000[1-6]08-0x[9b][[:xdigit:]]+,v1,sifive/p650,core
 0x5b7-0x0-0x0,v1,thead/c900-legacy,core
+0x5b7-0x80000000090c0d00-0x2047000,v1,thead/c900-legacy,core
 0x67e-0x80000000db0000[89]0-0x[[:xdigit:]]+,v1,starfive/dubhe-80,core
 0x31e-0x8000000000008a45-0x[[:xdigit:]]+,v1,andes/ax45,core
--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
