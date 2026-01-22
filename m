Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC7FD6CFA4
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vny9jEyhcHHBdvFrt7nJfuBPWozeXwOoZbBnwUk2jSQ=; b=CdqXmqx4DCMib2
	6vDAsJ0kcu7ejdXOT9DkX203jLPaqilAghaX+/jFMGwa3Z3Dqyqq96j5DHN+cn6K+Bk7fTIs2vyqp
	Qw8HSndFzZNuJcvKOego82dX/tE+fPbciskkYTU6qHSHLPHdVR1ZMPAONyfhc8E/jSZpdZi2g07MQ
	BCRLjPTYnBCyQ7fQFn+joBeFaDXov0ZJFICaT/zaka9YoZEFCkiceeiNSXZbPhDt43aTimh6lHI5a
	DPJ+oVJ8r0LTNPH5Ezlq9Ni9Tcy4AeGzDtuGQJHc123QyKsR3daKa/P66MZZxLpmm/oWdrjnI/YVd
	DFi+0JvM6Jo/29cclImQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2LQ-00000007mZj-2RvY;
	Thu, 22 Jan 2026 21:36:00 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2LD-00000007mTS-2aNe
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:48 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12339eea50bso6745753c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117746; x=1769722546; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=azC9Yt9syLyDP2jO50hWysvRjuYzdJS9E0SbV3PAybshQkp7p+n8taRubgLAD0djY5
         XaF1zrmq3nHgwdKG4AbGAC+EUPyRgqy5mbGPNgurjgJ/qxn5rCgA8P7JJ0w9CPQ1sc9p
         hl6dfAIBBMsCny23MfZPkcoJArSQTX3HQWwRmH6HfqgvHgB3T/hM4eDSMUsB0EPJ6ypy
         1FolS7WBOdM0Z2NC06dRl4S2MP14GDGKSjKavJxt3GM8Z0TnOiZBI3X0O/NFthAg9rxH
         6f8WhEAFe+0XwGd7LBeNr3c27LVL3mceRIXnRUo4bOkEH9tegzFD6wHBwTZQfXXHQNxG
         4mTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117746; x=1769722546;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zuXMW9ePaQZdk+//RX5ln7bDZ0bQbPZ3cyiYbZ9aMU=;
        b=e1VgjJ3TXnzv/cNLhP+/u0Plw3ovBPXfkHTLww7MUclgo3zuEY+/4kuHqBzH5Poh8s
         kxui8vJnIFIUPNCPR9gytph89tsrQADOlS5oYP3aT3z8Youfc/BEygJYdmPXZxyhzOrM
         rsjDZcD7uSPeU7i3137ECgKcSCaTjYYy5lLvLcLIx4IwCCzI9oCQedzqeAQfuee6C4iZ
         BLESDdVoiuIL1ubaKdNdK+YoenbIXeOQM/T99gHy/G2dKbSUntDzqbtHpLoBAwrbzWmB
         sEbq59lU6W4TLvVVO9r81MfOiiS5TSzY59WAHwwkKxdudD0t0xDpk7E3m0FI6Ecd8TFM
         P70Q==
X-Forwarded-Encrypted: i=1; AJvYcCXwgpW0S+EEQ5E9FqUxY80VavwtpFd9SKNMMnITkRSXtoFHCRZHVAiDKR2QyG5JSeDFDl/sBoc5HAZSng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyFkmOKbU7GJk0ILa3X/At/dd8TuaK6srku4eiOfkm0hzS+/qw
	DEuJtdwoZIfVS1t3OzKfUt08yjQC4dfBVNAuHlY3dayJreCwTibvWpkt1TPtvzDDKZCK/44L4+6
	ojt4cufNUwA==
X-Received: from dlzz28.prod.google.com ([2002:a05:7022:49c:b0:123:360b:d5f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6981:b0:11a:4ffb:9825
 with SMTP id a92af1059eb24-1247dbad26bmr458271c88.6.1769117746365; Thu, 22
 Jan 2026 13:35:46 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:16 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-13-irogers@google.com>
Subject: [PATCH v3 12/12] perf disasm: Minor layout tweaks for struct arch
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
X-CRM114-CacheID: sfid-20260122_133547_651331_5FECB7CE 
X-CRM114-Status: GOOD (  11.35  )
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
