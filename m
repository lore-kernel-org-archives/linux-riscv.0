Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276E0D625F8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vny9jEyhcHHBdvFrt7nJfuBPWozeXwOoZbBnwUk2jSQ=; b=1/reFnvhn7IRiT
	6l9nhxWtVp5zjY5CVwNad4k8SnbvjOh5Xq1Dh8iiTjFJUmGXF9c2w5VTaYhDtrrJV9mj5LIx8Nc5A
	cjX1RLQT/7NaY2tL/3f7d9msfdDOS6HNZdOyH49E2a7VIk6ofckVeGEkj9qMxleE8IVVH+cvz3tG+
	peMC0fDi0/cF1kr6OGfML4QjfU77OHKLBG+dgJY0swSCeEr5EGDgwAAvA8akn+14Ngn951CFPJNlU
	unI2fKy3+B7WDhsqb2OcL7S5N7p6+rojlU+dPC7yF9vPlw+sz/8mwfy7s37OlTnFutDqbL1F7+9gd
	jSOS7zfySa16cSShuJHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipB0-00000006YzJ-1c6L;
	Thu, 22 Jan 2026 07:32:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAc-00000006YQc-0eNz
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 07:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=; b=OtzuxbUF7lJiB02hLujziuEY1d
	Ap84YZDI5jvRep0Ee3EGcQxz4Ny93YjZieZpclhegq81Vwqu5ZPET1jShmFjeW40QXqTZJpKJrp5i
	4pFbuszwHmMaTWr/DtqQBxf+j46pH6POfERM58hHrRdt70Y1/Dv+yekmCmpQ8M1VRnAxMjOkEPqBY
	jc2gZ3wnAyuDsq/unw9G4KqTxGB8QpY64VYHuZj8kAKaL2Jj03Q2UdYwPRy7W++JNq071VbGunu0a
	ZDdgdvBsgCn2tcRDmAELNdLMnPFik1xaTDNlDpsySYXU9Iq4xhH3KX1kHI/+XQ8uRHnMO8w93rL5n
	Hwlubzpw==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipAY-0000000HZq4-3kqJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:31:56 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b722bc1be1so3557188eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jan 2026 23:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769067111; x=1769671911; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=D7dQAhbNqMzpALG3F0CzAUhDj4Rl6gbpiztBKRaq2vxSlIKNQjnxfApaDgZhEHfHUY
         7WkrpHkcRgA5nR+LbKeK+Rh7SgPY6t6/JB+xGEVwCJjaJbPZ4B2RYu09bAgnLpbSiZqr
         vmRIo+OX4RG4IjfZQKZu9bhyAocFwxII0reANloLCG6NyLDnZjtUJMddCtpOsjhe9bve
         rRj9NN0sr6m+HPRj6LBiOGfpOZwcCbZZzX7jQQq8/nM8//NLQqcD/s/xzR2CbCjEmb3H
         ImemfrlI8428LAaeDQtaQH6nX9z09iEhO29DZrBiEnD6sYQwauT3DIBfrYhnT08C4vCV
         b2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067111; x=1769671911;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=h8vHmdU09+H2foNdFiXqN4zm8X8dKTubySW1H4MtqFtxQDNtFbrqDq0OLNvxgL+Qi7
         Q5u2gZEGLq4zR06PML2GzLXTWlnY7ga1ZxxG0qkz62PyoKn/hOYKrZysUcgtDn1qHcrU
         zGoYGt/SfIkWIdu9b9q9P+NtnoCm67TA7PywPu+coPtMi/ALgoN7WZ1ZQVy35C/T4zl5
         pLHl/jSKnh7Qh5f1J7AmGDePLPv/ZGKk1bmnUyG5bJi9uHQzkwDXvis5kc38kyEb6Xee
         BiK8fUdNkmIl9r+XCHFSH7go/+YZVne8h5+5WLNs1WUANflGZvUehxTgVqfQt4V/Eqo8
         QInw==
X-Forwarded-Encrypted: i=1; AJvYcCVJppcadLcPJRieta3dRYLuj/2TyiRN9ebWmCyshjdzbJWd4iKF6o58YVFbD0vzezy8ozJY0lNDShOv9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZHKgIfB11BGfJSCdF8NEvPBi5g8UsNjLNmDSr2h9SMl1vM3n8
	GMMuaWmBxViksrA8RWi0McZyHE1HgTrXUaGZ82bS9AamzA3ZNUZvycT9CyYQu624XBR70XHhyNQ
	qv3uv0uVQBA==
X-Received: from dycoz10.prod.google.com ([2002:a05:7301:fc8a:b0:2b7:2358:5b16])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:4350:b0:2b7:f7f:6ad
 with SMTP id 5a478bee46e88-2b70f7f09f8mr3795608eec.26.1769067110372; Wed, 21
 Jan 2026 23:31:50 -0800 (PST)
Date: Wed, 21 Jan 2026 23:31:27 -0800
In-Reply-To: <20260122073127.375139-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122073127.375139-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122073127.375139-12-irogers@google.com>
Subject: [PATCH v1 11/11] perf disasm: Minor layout tweaks for struct arch
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
X-CRM114-CacheID: sfid-20260122_073155_144958_11842214 
X-CRM114-Status: UNSURE (   8.43  )
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

Pack some holes to bring down the overall struct size from 96 to 88
bytes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 2793d48aa04e..6a1905f9d4fc 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -18,22 +18,22 @@ struct type_state;
 struct disasm_line;
 
 struct e_machine_and_e_flags {
-	uint16_t e_machine;
 	uint32_t e_flags;
+	uint16_t e_machine;
 };
 
 struct arch {
-	/** @id: ELF machine and flags associated with arch. */
-	struct e_machine_and_e_flags id;
 	/** @name: name such as "x86" or "powerpc". */
 	const char		*name;
 	const struct ins	*instructions;
 	size_t			nr_instructions;
 	size_t			nr_instructions_allocated;
-	bool			sorted_instructions;
 	const char		*insn_suffix;
 	unsigned int		model;
 	unsigned int		family;
+	/** @id: ELF machine and flags associated with arch. */
+	struct e_machine_and_e_flags id;
+	bool			sorted_instructions;
 	struct		{
 		char comment_char;
 		char skip_functions_char;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
