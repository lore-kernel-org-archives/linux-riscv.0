Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE336C83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Mime-Version
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ldLWEyj5LAanGJD9ltdhNH6Cx2M3AmSgvnf+3J0gJwA=; b=4kIQMC36YNglMs
	n1deIVJoWd3omu2+RT+1Dpd0b4qHKhu0xveYAVK6pdZ0dMtOUrUB9NqdmPLZOrq3c2ASrh8SSgDBt
	O8/zyNPVUVrBldiXsNlwZOrMPYV6CG48kSyhDc+UJtHrH6Z35CuMNENpbr1XjbRhQiZyRp8stnx/r
	NHK9FvUMDaqSg5i/W1sjPt6hwgDV/WuzNXnyOAQkgvwP0tHf2jUSPzc0sL9OonGAYKteYjI4s9ORP
	QVNEmPjjQ7+N/njKCxLsak2qwQ4jcAbDwMa3qlpCVU2gzwrSovGdcV+kfamJyqrfspkMvi4zlR6Bv
	B0rkCNASFfcTEPdGBbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSb-0000000GDam-1SZz;
	Tue, 29 Jul 2025 08:13:21 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugfSW-0000000GDX3-2rwA
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 08:13:19 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-23fe28867b7so32661285ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 01:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753776794; x=1754381594; darn=lists.infradead.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wUMFq1wPKC/c4Wk+DwUN8ZuZ12Mj3tTGq8HNHYgHImA=;
        b=CIrl3xhCccrd68sj4aNd9fDq6Ch2Hs3tU+9m64zaNOiSfGxMJcj3EhAp1F3aeoRlLP
         JwxkvkNFUa3gzYVCYau7Fslafcp+yvgqRtxr6gVlj9Kz03O9kAh8VCrGD1weDgdkQmAU
         CW+oEBRjyFlnbyulpc9x286cu2fni6Gl7O4zOkaffj5b542pLNpXn8B/IDcKSWIgaocc
         W3Rhmvhjj+uO4ML2wqyg4OwQ7D0fVRQLCEG2cr0lopfAEJEjBV7UcHhuzv0jXW51OI1+
         EDbxtg9rjB3nzKdzJNygPwb941IOJWBp3/tnDAjxk+hDq3fPJQEGFYNGIVAvJomTMfk3
         Ur1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753776794; x=1754381594;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wUMFq1wPKC/c4Wk+DwUN8ZuZ12Mj3tTGq8HNHYgHImA=;
        b=fx+7Yd5lLmJBVIN4g61t629QnWTer+nUqgvz+ZgaKyYFsARUpX0yoRn2tBs7JjWqRb
         R4VCm+0MKAWxBRBmeahTE4Zxvmop4VBJ/De8MwSdKf/sef0JqKCsGgBhnqXbb4X9cq5K
         JUAszuqYqs2SDP2GHApQlWiPG7T8S41I9KLxI7sCwMs3dsf0HEvljcHBMRHKPnUkZfEC
         wg3Umcj+lyqhNpdQu/NcKxU7T3wqOyBHVD3zG9r4IH5sCbFRsHxQvqzpOsGg8ECahKM5
         d06OjwCtXjrc6dNS0zB0Z93YBrq+IzX4BWn9o6GPagWATP5VrOs2+KFr1/IRW978DEE+
         /M0w==
X-Forwarded-Encrypted: i=1; AJvYcCVrvZR7xGihr4uk7qEFxKhi5wpufBThbwHvF2QfSmcBZcd3MdbDHgtRQvZ72+nqivoPLz2+VlOUrTwNhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrGpjiGyXdyEPsWxNtTvlRwQxnovlFkNgzHp0NDZ4x+2giBo3B
	VnMvpBo3WzY4WnqtDJpKZq2G9Co/Lk18d3CW0HMQw8sdSrivRZo2ZKIG0vT1MO3o4HA1z3ToYRP
	rV4R3Uw==
X-Google-Smtp-Source: AGHT+IH2FBcENjqFcvbmmWBOGmaCHiMG9XtA360Jm7sdXYiLYxjwC52n8n6Sc9K/m5hpE1sc0zxCwEOoNwI=
X-Received: from plgc18.prod.google.com ([2002:a17:902:d492:b0:240:770f:72cb])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c7:b0:240:4683:90a7
 with SMTP id d9443c01a7336-24046839be0mr58409105ad.20.1753776794561; Tue, 29
 Jul 2025 01:13:14 -0700 (PDT)
Date: Tue, 29 Jul 2025 01:12:53 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.487.gc89ff58d15-goog
Message-ID: <20250729081256.3433892-1-yuzhuo@google.com>
Subject: [PATCH v1 0/3] perf bench: Add ticket spinlock benchmark
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yuzhuo Jing <yzj@umich.edu>, Yuzhuo Jing <yuzhuo@google.com>, 
	Guo Ren <guoren@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_011316_721242_483BE6B4 
X-CRM114-Status: GOOD (  11.43  )
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

This patch series adds benchmark for the kernel's ticket spinlock
implementation.

This series depends on a preceding patch series that introduces the
'perf bench sync' benchmark infrastructure.
Link: https://lore.kernel.org/lkml/20250729022640.3134066-1-yuzhuo@google.com/

In a quick test, on a 48C 96T x86 VM, ticket spinlock performs better on
2-6 threads, and qspinlock performs better on 1 thread or >=8 threads.

$ # set 't' variable, and then
$ ./perf bench sync qspinlock -t$t; sleep 1; ./perf bench sync ticket -t$t

'sync/qspinlock' benchmarks:
Lock-unlock latency of 1 threads: 8.5779 ns.
Lock-unlock latency of 2 threads: 187.1022 ns.
...
Lock-unlock latency of 6 threads: 1202.8312 ns.
...
Lock-unlock latency of 8 threads: 1541.566 ns.
Lock-unlock latency of 96 threads: 44140.8765 ns.

'sync/ticket' benchmarks:
Lock-unlock latency of 1 threads: 12.1888 ns.
Lock-unlock latency of 2 threads: 168.1132 ns.
...
Lock-unlock latency of 6 threads: 1033.2760 ns.
....
Lock-unlock latency of 8 threads: 1667.1647 ns.
Lock-unlock latency of 96 threads: 66915.8949 ns.

Yuzhuo Jing (3):
  tools: Import atomic_fetch_{and,add,sub}
  perf bench: Import ticket_spinlock from kerne
  perf bench: Add 'bench sync ticket' subcommand

 tools/arch/x86/include/asm/atomic.h        |  17 ++++
 tools/arch/x86/include/asm/cmpxchg.h       |  11 +++
 tools/include/asm-generic/atomic-gcc.h     |  51 ++++++++++
 tools/perf/bench/bench.h                   |   1 +
 tools/perf/bench/include/ticket_spinlock.h | 107 +++++++++++++++++++++
 tools/perf/bench/sync.c                    |  17 ++++
 tools/perf/builtin-bench.c                 |   1 +
 tools/perf/check-headers.sh                |   3 +
 8 files changed, 208 insertions(+)
 create mode 100644 tools/perf/bench/include/ticket_spinlock.h

-- 
2.50.1.487.gc89ff58d15-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
