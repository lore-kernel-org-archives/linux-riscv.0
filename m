Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6243CC9830D
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV9TRVoYyuqIIYYvVKlixH0LSlP67N84qfafXvZ11rM=; b=zauKhTJFgB3tfF
	yLSlTlBPX+Y5IHOs9pYNlxdiRw41OEU9TnlCsPKnUJ8qDK0g9jGI47gXwlntd87e+4NrqsiGtL9ZA
	z5tLwhfd3tGv9/eweh4kloKE8Erp2Lvhrar0F7i2pCBbGZXAv7kvVDvds+7CKXIlWdC9fVHL//FKQ
	IPmwblbLFaVCQlWNLNApD7IuXi9pgzei9/1aytrrB8AG66SCFGmpYNd6BIjpyO3LohI3mkYgw1PCJ
	/Fd/+KUERESqMknhHfEKA5EAszrHX7D/qkg5F3HoVo8HtrRJaQf9SlhX4l2JkbBfpC41HyxHSUHKj
	y1U7Fz7qtWRwRYtSA0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysN-0000000FEPm-0txV;
	Sat, 17 Jan 2026 05:29:31 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysI-0000000FEKq-0zKQ
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:27 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2ae26a77b76so4880922eec.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627765; x=1769232565; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mz2w6bSYQtg03VDKQBBKJWoE2q+Ly0vxb+x/N3KKFNE=;
        b=fim9VoL+apGZe3zEL30CEjoUpnIG12ZrMxjCztHceSZMiISjfnd6lcmb1YVZIswiFL
         NmGkLm+lj5g2P2g6PpdCJ7JpMkLZoclWYW1Fvzwyb7xNAu+kKgf2JXlIwY6eVCrypCQW
         HQ/Fk2yMxjWAZl+oB63uf9KK25xnUg+AnTFOWh4KCFEztfQmXe4+3BwpRQzQ/dOXAI+C
         UV1An0IMGxTZlPSnEhkDsmKQCqxlFuFgF0I6LAXN00+qsfnhx0HxefnXKSFW9shMeLv2
         4pXbJsl8TAdanIkHH2U/0bQ/ZpPhVtJCVYgeb2rw+OFK6c6E+0N0Q1IrVyAj1AxbqFdl
         b9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627765; x=1769232565;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mz2w6bSYQtg03VDKQBBKJWoE2q+Ly0vxb+x/N3KKFNE=;
        b=X87yJAXFKArLfpsFRv3KZ7aJbUgMEh9z6Zs2eiX9HhebVw4cKl4P5OwVWRT6hkC1c4
         qCXWP0BsDM/S1d8DC0CPedPa3512GixTSiPuSSj09HHfOeboZmm7x712b2tHNrfN66cw
         2TMhnFxZrdSRsKsN4+zGOv8gPBd3uSok7wLvoIP5U3S9iNkWHY+pLp126qbyB+KuH99u
         cvnVgJSVm1sN5nKiXJZA8lph7ddIaWilJQhXR70uFpf4T6EwqxfG55YEFVlTyRBIALMA
         Dq9A8n/0BSODKUpaegvlmwl5/Ny8w3SFgfclIXAhHyfwvpaU/Fkk11hkT3T/zAKf7Uka
         dgBw==
X-Forwarded-Encrypted: i=1; AJvYcCWa5h5F1UROA4IrWqt3NGiBdhiMjovuXo8gZbg4Dt+ZF3Soisr0XXyPMRV/Q29PuUvAxpCnnAehKHZhHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzowWalgZNEAMS2ZEVzt75aooRo1E7po4q4UyNukZl+1v7ylKaF
	dB4xj+KeGTeqxtLFBPXXPeCZmUPKjl1gdRm34hTob5KVUVFGqMAiVZ38WXBLGU+WXsxvitK3oSB
	DG9K00DKz8A==
X-Received: from dlad13.prod.google.com ([2002:a05:701b:220d:b0:11f:330d:ed15])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1e01:b0:123:2d38:928e
 with SMTP id a92af1059eb24-1244b36d491mr3478584c88.35.1768627764374; Fri, 16
 Jan 2026 21:29:24 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:29 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-4-irogers@google.com>
Subject: [PATCH v1 03/23] perf record: Disable inline frames when marking
 build IDs
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
X-CRM114-CacheID: sfid-20260116_212926_305103_B1172927 
X-CRM114-Status: GOOD (  13.10  )
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

Marking DSOs doesn't need inline frames traversing as the inline
frames are all part of the same DSO. Disable to improve performance
and also to avoid potential issues with dwarf information.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-record.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-record.c b/tools/perf/builtin-record.c
index 003e47a4fc1d..663ca3a03396 100644
--- a/tools/perf/builtin-record.c
+++ b/tools/perf/builtin-record.c
@@ -1509,6 +1509,8 @@ static int process_buildids(struct record *rec)
 	if (perf_data__size(&rec->data) == 0)
 		return 0;
 
+	/* A single DSO is needed and not all inline frames. */
+	symbol_conf.inline_name = false;
 	/*
 	 * During this process, it'll load kernel map and replace the
 	 * dso->long_name to a real pathname it found.  In this case
@@ -1519,7 +1521,6 @@ static int process_buildids(struct record *rec)
 	 *   $HOME/.debug/.build-id/f0/6e17aa50adf4d00b88925e03775de107611551
 	 */
 	symbol_conf.ignore_vmlinux_buildid = true;
-
 	/*
 	 * If --buildid-all is given, it marks all DSO regardless of hits,
 	 * so no need to process samples. But if timestamp_boundary is enabled,
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
