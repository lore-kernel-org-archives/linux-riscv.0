Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D733C9830D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZCtalVqY2HtXKkC23Ftvq3C0/59LYTbYIuO0rIeQVE=; b=BR2lW3h7v48vx0
	XRJruPPsQlw4gt3vkJbq/omKz7uaN38OZTEMQrTT55UenrafKSa4sxVGXfpTs2C9b18+XfC6qsF/x
	6FM6Z7bbQdMhK5I0ftz2yeYKqBt3Cs4Yy23QY1NjcfyTJpt8J5/mpsJp9wznByD8m4gZHc+n1wKGU
	CQ9BliIviit2EEDhQUn0QZEegCUh30ia97Iraw4yDsj5Zmn1nr/L8o/S7RMe5nFp7WxDA2rR4E0R4
	iyiEFGVbyX0vNTNd2IpdMibfXeRR/P3Ryz3kaDbdlTBz1r09agaYMx3qDUjaesHSO0fC32YM05gEf
	4ksXPP1ZiKu/br0Sm68Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysa-0000000FEdw-0zhU;
	Sat, 17 Jan 2026 05:29:44 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysN-0000000FEPT-33ix
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:32 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-123377038f9so1362829c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627770; x=1769232570; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vqg+qXSoRLfoai7ZDLIZjszxPa5Zftw8iNvGyqINItg=;
        b=QJvOCRtiUZvkve3YLS3Slj8pT4K3zlEx5IGMDnAArbAz31Wb227rCKtRRzdOk6cTrw
         xl9LXlxU50nFgJIc1LzaSFarwVznPt3alp4sBuOODcsE8vx0oB6EJwVTX4CuGjUDfS5e
         ZPMFCAmFbOR1vz449IUsQ9E8x1neLOJWYQzENVou/hm9A46qjkjDb3mq74f3XutNbOpt
         KYhnSmIxrF+xT3qf/VyVVjcpsw4bJt9MrRjCvjysFJKVyDJQvFQj8H9RPMYYhiho8xRt
         V5j7V41P7x2nQkv5DFzQQ0gTf6lmdzwNNRLmVVuMYBXCBACll4pStVg9X07EFTlXa+PV
         ilrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627770; x=1769232570;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vqg+qXSoRLfoai7ZDLIZjszxPa5Zftw8iNvGyqINItg=;
        b=IOQTZlezwZwefyyb5KPJImsekhZRHu7RRKhRHCWoHCXIsVr0a0FVcuy6LUF4UmyRIS
         O0tLcW8ngD4oZ0I9SIYbijI6bHJtVXSYp5BB4JwenjYIsfjxraFmzws3OShjtDbVXWHU
         S+37Eqk1YJSfbU93IyE1nZW+Ck3lqFD6BJhABIR2V++uJmF2M6S8Eo174aDbRNff8UPh
         1wIBWOctaTnJS/7EJNn+RjmleBIjmdq3ZL54R2cuhHtfFq3owOGOT9fxkv/LAECqXV+Y
         AbUGHBmCiqVt7NWnTKZFtGEDMPjUWDLEGxVNqOA/yHzEICMyuxj0Z6SNi6IxKpP8IK3b
         HmyA==
X-Forwarded-Encrypted: i=1; AJvYcCVXfiyorY5qKUR3eGAT9SkMtUg0ra51gugCWyG36hEoJdIrnpSsjyxKjR8Bvf2aOJ6Ek/FgBoOA7/L1xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYzWqG6qq/wvRFQu38zuJdmwutSMqucIHckIl42ut/CHdzwinH
	V5IoM+hINWiVPKfS/QN9ROMgatl7ZNoHuOdWNnPvbv5jjvvLT/XtRkyDBrvGJqSBRcF8H2X8T3V
	Hx7VbNRmf6w==
X-Received: from dlbui3.prod.google.com ([2002:a05:7022:3d03:b0:11d:cfca:1df5])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:438b:b0:11b:9386:7ecf
 with SMTP id a92af1059eb24-1244a75c5c6mr4763418c88.44.1768627770088; Fri, 16
 Jan 2026 21:29:30 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:32 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-7-irogers@google.com>
Subject: [PATCH v1 06/23] perf unwind-libdw: Correct argument to dwfl_attach_state
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212931_765576_5253EF43 
X-CRM114-Status: GOOD (  11.27  )
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

Argument is a pointer but EM_NONE (0) was being passed. Correct by
passing NULL.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/unwind-libdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index b2e194a8be39..dc882f17f52d 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -339,7 +339,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 	if (!callbacks)
 		goto out;
 
-	err = !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread), callbacks, ui);
+	err = !dwfl_attach_state(ui->dwfl, /*elf=*/NULL, thread__tid(thread), callbacks, ui);
 	if (err)
 		goto out;
 
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
