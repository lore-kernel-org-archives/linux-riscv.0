Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB6EE9380F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 02:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bTYlhGQ/fM0ohd15rYIA5elp1v7iDFkaPv8SIloP4qg=; b=jNsAwGXecr+XMeI1qw2OF5639z
	NiUM17oxx1VG8CRz59cUMcsUcvIq6KAEjaeHMkK9/yD6cgl3E462r22aCUxB6/7k0zCPnmt/2LvyR
	6nzitOXKKEx2Jg6Wdd1+Vrq9WWMwxaZLvhHndhO+g4PxOGJex43hxOZwss2swshOvUFRAa9RL6vEW
	B/St36CtxQOUXFypBu4aNGIOR9w2JGDqK2Q3eQkDoq0CXTlWPCv6lLKNEeL4yjXU0aCK4y8nlWOck
	nSxFztEKQ3cIUR6odncFM7fevfBLI/FuLP7o7rjF3ggZZvQm6th1NIut6znzNCumQ8n9yi2v+FDzK
	gVD1fhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7Lr-0000000Et4n-3l7M;
	Mon, 13 Apr 2026 02:48:39 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7LS-0000000EsvL-35D2
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 02:48:15 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso736113eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 12 Apr 2026 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776048493; x=1776653293; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=RDw7nw8Svmo/BDuQqU2xbO85XserjCxdiLdXv4LBawy9ybixtSUNldrBAQCl5NRumO
         ioJGuMS7YG/Z/7Cf7E5zggUu0eKrASyEh3nQQy2uOtT0L+ZOkOA3lkI4/+XumRLrej7U
         gxUnhV6o429R3HZEw1uXsvSd7lsEW7xsMqjYFuYOOFcaacwoDNA38LsnXPv0rA2K79vC
         QGeEGkTUFuhlnqndFm0TBltgKfukAi4s14RpJLdmwTOAGxL2AlLUtxEXwUNeMfbZ56up
         ev1opOlzu0RW1NWPFKvH+5T2oKz9+V/4+oERC+Rzy2KMciuaxNCDlDh05MogWGiNvwOf
         95rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776048493; x=1776653293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=HN0HXSi4AcAoFxQuIT1DJ4KzRA+ymEZ0cYPzRb9mkZLMYKJbctnuhYaO7aDSvR3/mV
         j4QEcyBhl9y8PAvP0zek0/YTrnb/tCU1Zad7WsWwQoR9sf6HnMthQJJmCm3p/xxFiswb
         9ZUVjw//J7Ua4/nWxN2X8UNRtAaB44l6eRUe5pdySTemx2aMfNuPWaS+//xFxdW1cyqm
         H9mrjSUzfRO+H/cplcsTV1rs3qwUOojtnvzbyNFmA1lWFXnrFl/TDzB6XPHQDSD08NSO
         3E3oxW624kajF05YlT5cYpqfR6uNs8rx2eeZ4cwjJJ+CELwhmwf522j3nco5pqog7cCa
         0ggQ==
X-Forwarded-Encrypted: i=1; AFNElJ/q+kVV86A4OUHRH5wWFRM3/vWK6mvDCQau58kI/KI3Q1juGNu9iuse8zl37X6vtwDq32O3I3LWJ/8ZvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpGY1tjM14pJou2+wvB4CXHGYjsAOsnYgOl3/9NF8TzpcB99Xe
	1E1VbkHXOho6ovLTLeGuiZ0JJ4v1rTcEwIW5rwjL07ibuBA3m/upLU05i7HMkdZIpO8tK3K+5cm
	qa4W66lYP4Q==
X-Received: from dybmf46.prod.google.com ([2002:a05:7301:92e:b0:2d9:3c6b:a26b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6788:b0:2c4:acef:292a
 with SMTP id 5a478bee46e88-2d587d82e73mr6543730eec.12.1776048493060; Sun, 12
 Apr 2026 19:48:13 -0700 (PDT)
Date: Sun, 12 Apr 2026 19:47:59 -0700
In-Reply-To: <20260413024805.1316480-1-irogers@google.com>
Mime-Version: 1.0
References: <advv6twWCEVBo_Hc@x1> <20260413024805.1316480-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260413024805.1316480-3-irogers@google.com>
Subject: [PATCH v4 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_194814_787280_3EE6B025 
X-CRM114-Status: UNSURE (   8.59  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.1213.gd9a14994de-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
