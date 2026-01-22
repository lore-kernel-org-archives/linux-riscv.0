Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E8BD3EE96
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ep1xbq3/FgjFPQhPgLN/NMKOURwuMBJa8rJxPnQ1Ic=; b=045zpmM2pgIywE
	S6PpAgRufryC8pNxBAkicqO4jut0H4IGavtS4nxeWJzP0uyC6deLnXOlfyjzmiH8scPNRHIILgh9i
	pRiKfh3QXOWX+k3Fe+UBdFJWZCHNtdVMYgtL5HFLYd9UZmHexBpl7Uq6VZdodKmyCslSVtmMRCQ8V
	4CKSlymuBbN484N+QUjdatx3O0hNGN/CU93+UK8azG6wlsyz3dlXbG+jomxhxDBsVB/RQM180+HZd
	58hEElhVqaMVgATCJvk/RHyTWNOumTZdWCXuBHcHJ3+fTBV9n58UGp7Y3TpJR5Nk+2E0ksdqRsiGs
	JQqnonCSvMu73css3gqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixx0-00000007TlZ-0awx;
	Thu, 22 Jan 2026 16:54:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixwv-00000007Thu-3rNe
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 16:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=; b=Y6042Dv/EIIxYg3smbsQqZDJ3L
	wpCc70nopbn/Pxd3bkqDCYejSmt4N0o6a4+f4KCZ29tA84wHgfFYPiOhOlrNEouXvdbUnZdBoKo0Y
	Vz1idtbuCPSL/7/qvskbYVoPMERd/rPc3gk6xFl4x7ZRaJtmsaOkUmKm9WJk1Myx9JedbNpXb3+qd
	0TTfcDV46oB0QwcVk8VMT7PGF1Hvhf+oonBYH+uiaoju0YG8AS+fUG7fxhEuy3xRaeDeagRXYhVzK
	QesIolKsRzUqBzdlqIhykP6Mz7u86Q1PkeKO4F0oJfWBzXvvA96XEtMy+llicO8es6Zqp822/cmju
	xsrIWphg==;
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixws-00000000oTd-3YVG
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:24 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b7174ab5faso5214768eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100860; x=1769705660; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=3Ma5bSIby52OQBCAx8tqlfO5Jqu22E96JVJIrG3TsRMx2YJPpkPdEyM2g3h3v1eRzU
         AM6q4gEipurVk9iOZbdZxkKD4ULnC1VmwNVgtp8lS5wpzOuJftkv4ijSxAqV1PBQgq0R
         5SfS8cOMqXbttdGhWkVoWR0SOAqT03BIcmUhwb/fzBSVQdxOKHaVEU+KjgRQQDkmvgqj
         hBB8rcIWsnDKvdsT7cWuR1lgXbiU4c799XOd9cH+9bdMnIzGhZ3R+vfdXEqZZzmr3isf
         T04anTkrVPez5wEjGziBWp4QMJie1CVuoaU5WpXvJzxGZOBzz1SdKyEVgINcSHR5zvMm
         8odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100860; x=1769705660;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnbHjkP7sr2MY8dvLIuI6wPgadGKGFiX6WTYohRo5Kw=;
        b=ob9920v4cSoYE+I+IqtxbqMcLod1VplrBD6CjB5I4QVQQE9F+6wqBH1kfJktUlAQkj
         X7ZkuG+iIC2Eoh/oUTD2peQ5WCFKHgw4VQHDailWKWFHI0tALVyzMugCiKsyPVtOKY3V
         H3/ZqTEI4VwikYZAgmCA4AvNA1fZnkU5fk1hD3mhMjVX4i70IvHqADJMVUxab8UsbAD8
         KL6qsTFZx1qd2eLw4UUzLXvlcc38c+54P07dorUb62FtIZZgfD64SSnf/OBEZ7a7fhki
         PIttK9PUsPMdueticb/gsJAGpaHBHV/ACaoNcPdRaHRMKIx5vJmdVCsk8af1jxX8Xi+8
         Wffw==
X-Forwarded-Encrypted: i=1; AJvYcCUfiyr8dhEfUc8TO/cGQmWdy+kf0/952ZS6hvAhJS8JaP7Q9hu2TTXLGpZkM0HQu36HWDKKfRwv2I8twA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxRsgxpZlBRJwt/bU/KltcbAekcacDs4x7L1ZM3VIJCJG7601cR
	aCelrjuflLaQBXeuvyMdfC6YUSDdCUMVJyj/DIOD0UL6+aNxhhL+O4bJeWC9OllICQ5TZAEI0qn
	uAAvhSwMi/A==
X-Received: from dycue4.prod.google.com ([2002:a05:7300:84:b0:2ae:5283:d72f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:7c13:b0:2ae:824e:31ba
 with SMTP id 5a478bee46e88-2b6b3eed5d9mr19877803eec.7.1769100860046; Thu, 22
 Jan 2026 08:54:20 -0800 (PST)
Date: Thu, 22 Jan 2026 08:53:58 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-4-irogers@google.com>
Subject: [PATCH v2 03/12] perf maps: Fix reference count leak in maps__find_ams
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_165422_996583_23D5FFD5 
X-CRM114-Status: UNSURE (   9.44  )
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

ams and so ams->ms.map is an in argument, however, it is also
overwritten. As a map is reference counted, ensure a map__put is done
before overwriting it.

Signed-off-by: Ian Rogers <irogers@google.com>
Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
---
 tools/perf/util/maps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/util/maps.c b/tools/perf/util/maps.c
index 8ccc46d515b6..4092211cff62 100644
--- a/tools/perf/util/maps.c
+++ b/tools/perf/util/maps.c
@@ -708,6 +708,7 @@ int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
 	if (ams->addr < map__start(ams->ms.map) || ams->addr >= map__end(ams->ms.map)) {
 		if (maps == NULL)
 			return -1;
+		map__put(ams->ms.map);
 		ams->ms.map = maps__find(maps, ams->addr);
 		if (ams->ms.map == NULL)
 			return -1;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
