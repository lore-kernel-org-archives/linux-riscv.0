Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681F610ED659
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KzVDMuv/2EdL3leO09h021adq0i4HFOvX4PEehuCjx8=; b=DR/wcTB6NQQLQy
	J0W5D0yCZA/DOBaWDnf7mgI0BVCgO61IYXX4dq6MnqtySPAX7S7rcCnPLaV+i/Ia7upLjsoffrstn
	uztTuUEWeCjxgzVqDojGBLy0TxvRZ/SjVfXQeZ2iO5SoOVDtpBedZK86HuUvtD19+BrY0z5U3L3NX
	6T/OOXwT+6dTzT67Q4Aoa0g+TT974eBitGxe/AVTtBEuUtDS5Cmpg4IFDzm0M6aWLfie7ZZ+jqeH3
	g0XEOBXn1aCSIJGjn8ixiKWy+XXOn1AH5Gv21bKia78LyTPwlHIckCK+MW0qynUcu0st9o5YNwHT/
	2FbnZteHR6NbTSl7W6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65fW-00000007IsQ-2u2c;
	Fri, 27 Mar 2026 11:48:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65fU-00000007Irb-1Pjz
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 11:48:01 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82a7539851fso965291b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774612079; x=1775216879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=E5vpzx3rd794KmtPsoGSBVYW+choQZOgSAYh/igXH/OS0/jtoyrVzldRGkA13R+5ZC
         Gmuir/zBpMwvdfE/Q4mhpUypr4UoEqzCBev+Yr0hM3Ujc/+AFkydr4JNADUCFs0nC5Pt
         xmKnXs47kTsFHdaHUOS0VFCrt7oa3+N117e7hMooyLDq0LcwCZoh2KKQiNgtonPuCu23
         7ngPted1gfRovxNunuDgy4226dg7FOL1rt0dL+Ze59ZXptfqvKj1anUV5AXjeRx9pahG
         RLvuqJ8unuboooPVFYsQZzWK1QgMTo8WLvLOvrHgupajr8XxnJ3hHzW5ck1eUcDf+nKH
         WV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774612079; x=1775216879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNMzj7FR5eiPcLDxvC3wno+fgNRRz7YkO5bQ1NKOas0=;
        b=K/OYvPMN+6qE+YwkJQTG+UYrhMxP0/ItZpgxxN+f3fPzy2ss9u9fLyRsZXXwBpuPVg
         QCUU3kNQNwV1V6JM4ETeS5mpZFr8yajdB+9Iq38i6dVJHB3SRwa4g2/h2Cl+oAOxDAag
         5pBwoV2wj5ITREMNQQYkHb0r9jJGBJ6SBRcvnPiffuCcBxTV8xiA7GdorttWND7ruvlC
         RHUfqmu+kebZVZlJ5taaQ++775G8n2JNp2UOr8H9dFRGnJ4V+6r00hxsFfhQugFJBEik
         nLdsPunZf5uH8AWdREs1AsKM6FnKX3ix4HiTmevMHPC9AOXOjL6x07qTgrhLT+buzIs0
         yKiw==
X-Forwarded-Encrypted: i=1; AJvYcCXUOw1caQBctmeQCy0Yg05lhElRng+AJn9vnck5xD+XQ2GCPms53P5ugSEMs8AMeAcpYMucdzntcU0I9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxA9jlOG9bmS+E558X0wHBSeTdhtkEMht8cTGpUwBv2K4IlRiF
	3QbPrcK4V2CauqvijN8Eim34ho0AyrT/I4lf6K+TmeEsmOM4uMzepWt6
X-Gm-Gg: ATEYQzyk/CFmeXNIfDhPqWEsfbMvU38xht0Dhi0B2R68aydiv06gGNwdSaDtb0/06h6
	FBc9j04NqGPmyONkv4pjwNEct0cmMvq/X0xPkvxZy7Ax/4cB5RNRdoKK6orFrkEdLoC0zmppnVQ
	uHK5BiB7h1tFrxElVQpqohP0TT3Q4XWqPqJI9sXLMV/cL9kwC9aMJubEB3OiSPwf7JhJL0DaIAH
	F/4j+8jRJqGvO2FKQly9KuE/ny9YeSSgM7xgHLpoxOfk0BQfQMIDm7tT0g+3U6b0HlMR1JadCQh
	NN6SFQ4myMt598IGwGYSnE4KqJXzElAO5UhwgQZsQaAghSz7IrYRhzVugStKK/m1ASEqOzWF78E
	uyjdH2gi0HJ6hNzopuvxwzkGo5cycL1HDEJ5p3TWRLYBUH7s/n2fRrLcsprdjzLg5WFRILzUJJG
	IqHfTbUFYAH0Ff/o4DRO/K5Y/6jK/7e9yjQInNmf9rERsH+2xPbA+XPuBPzxENzqPv
X-Received: by 2002:a05:6a00:600a:b0:824:a706:bd75 with SMTP id d2e1a72fcca58-82c956c2ef1mr2401030b3a.0.1774612078684;
        Fri, 27 Mar 2026 04:47:58 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d3c289dsm5235572b3a.47.2026.03.27.04.47.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 04:47:57 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: axboe@kernel.dk,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
Date: Fri, 27 Mar 2026 19:47:39 +0800
Message-ID: <20260327114741.91500-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_044800_380821_89746E9C 
X-CRM114-Status: GOOD (  15.85  )
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

From: Kaitao Cheng <chengkaitao@kylinos.cn>

I have been working on adding a new BPF-based I/O scheduler. It has both
kernel and user-space parts. In kernel space, using per-ctx, I implemented
a simple elevator that exposes a set of BPF hooks. The goal is to move the
policy side of I/O scheduling out of the kernel and into user space, which
should greatly increase flexibility and applicability. To verify that the
whole stack works end to end, I wrote a simple BPF example program. I am
calling this feature the UFQ (User-programmable Flexible Queueing) I/O
scheduler.

This patch depends on new BPF functionality that I have already posted to
the BPF community but that is not yet in mainline. Details are in these
two threads:

https://lore.kernel.org/all/20260214124042.62229-1-pilgrimtao@gmail.com/
https://lore.kernel.org/all/20260316112843.78657-1-pilgrimtao@gmail.com/

To try it, you need to apply the patches from those series first.

Note: This is still somewhat experimental. I have only done basic testing,
there may be bugs or security issues, which I plan to address in follow-up
work. I am also looking for community feedback on whether this direction
and the implementation approach make sense, and what else we should
consider.

Kaitao Cheng (2):
  block: Introduce the UFQ I/O scheduler
  tools/ufq_iosched: add BPF example scheduler and build scaffolding

 block/Kconfig.iosched                         |   8 +
 block/Makefile                                |   1 +
 block/blk-merge.c                             |  49 +-
 block/blk-mq-sched.h                          |   4 +
 block/blk-mq.c                                |   8 +-
 block/blk-mq.h                                |   2 +-
 block/blk.h                                   |   2 +
 block/ufq-bpfops.c                            | 213 +++++++
 block/ufq-iosched.c                           | 526 ++++++++++++++++++
 block/ufq-iosched.h                           |  38 ++
 block/ufq-kfunc.c                             |  91 +++
 tools/ufq_iosched/.gitignore                  |   2 +
 tools/ufq_iosched/Makefile                    | 262 +++++++++
 tools/ufq_iosched/README.md                   | 136 +++++
 .../include/bpf-compat/gnu/stubs.h            |  12 +
 tools/ufq_iosched/include/ufq/common.bpf.h    |  73 +++
 tools/ufq_iosched/include/ufq/common.h        |  91 +++
 tools/ufq_iosched/include/ufq/simple_stat.h   |  21 +
 tools/ufq_iosched/ufq_simple.bpf.c            | 445 +++++++++++++++
 tools/ufq_iosched/ufq_simple.c                | 118 ++++
 20 files changed, 2094 insertions(+), 8 deletions(-)
 create mode 100644 block/ufq-bpfops.c
 create mode 100644 block/ufq-iosched.c
 create mode 100644 block/ufq-iosched.h
 create mode 100644 block/ufq-kfunc.c
 create mode 100644 tools/ufq_iosched/.gitignore
 create mode 100644 tools/ufq_iosched/Makefile
 create mode 100644 tools/ufq_iosched/README.md
 create mode 100644 tools/ufq_iosched/include/bpf-compat/gnu/stubs.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.bpf.h
 create mode 100644 tools/ufq_iosched/include/ufq/common.h
 create mode 100644 tools/ufq_iosched/include/ufq/simple_stat.h
 create mode 100644 tools/ufq_iosched/ufq_simple.bpf.c
 create mode 100644 tools/ufq_iosched/ufq_simple.c

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
