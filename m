Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C8CCCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VvbddJ30sbDlBGuxU0YPTrqY/7g8ta/1vua/vHPiFwo=; b=GeYsmKAdO0xZFb
	P+ON2LTitTXPxQs8fiVWLk1nu1LweBzs04KGrozMUPskM2btI9anHgWk9zOBy28c91H1oJNi30XEz
	6imiMeoV836ZE9YFZkMGhncERtC7ihluV/AyIQdVmwjYpJL/rqvh/CsaaiZmwLPA9I5hVJ2MF/x44
	4+5CZEwm8TH5bQ0Isqb3BoM0kZ9eo1Gmw/lLaY9+T1Bh6xvjYrrknAifgL+H6xIjAKnE3Lr83Ww9w
	Cji1GGBRRqwpvKFTRnn6rAZuSwEIhmk1+KweL4Y14amJPXpTqNMlHFdaCcwLH7xchnAOKsKf7Myl3
	Ej2U3DOU3evGbguPyzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMVJ-0000000AGXp-1Eh7;
	Fri, 24 Oct 2025 18:27:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMVF-0000000AGVy-3WQH
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 18:27:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7a265a02477so1870178b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 11:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761330425; x=1761935225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAS7HLWyE203ant0NTxx4AzsxmUZdwyOFbiZtXWA1Xo=;
        b=J/VPCurMtCpqrEJmWkv+eiHO5mmuxs7fWi5I6h1448Es/O+rVEYShFnU0x3m5UeUYs
         rYprXWyqnHwuTLPTxwM+WmsIdyYrJ2J6yQe3twDhpPCjZhTLDwbmsdDfJVrzwpGa9JzU
         bV2+JhyUvtXyYm/SVizK7py/978UyT2zFznw5BPgMW8z1oktowMR5EGYSrCX9muc1BC3
         noE9st9D5OVSXs6DPV+90W+KZVq4AtDi7aE2u2wdwXDf7vs939UWEu+9OjLbT0wwEYBb
         4VRbxEBqiMUP4uC+vcFhL0e9w20I0ubhLGZrzJlFyZ5697oHK7gQoPKWi45TY82Lksn4
         5xew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761330425; x=1761935225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAS7HLWyE203ant0NTxx4AzsxmUZdwyOFbiZtXWA1Xo=;
        b=qL8noHtg16l8Ov/Li4HLdB3lzqUWfmG9ZeZftXb1UpzQI7XClmNqtxxvN6cuIpAA9T
         xTB/aO/305w8/vAt32J7xjJQJZ1CM76MRCqfNEPomRmX9UDJA+2uxdxOyl9LdcOobEYP
         /GRP23Yam8chv1QwWOqa4urYcxlbPtFvbCXyJOl7g9oWUF8KCfrS33Y/z6OweFtAeo4I
         BwJBfvfRzTXU9meklaugz/4ITOApw+ORnMmXE4pDXWZD9fStL9UYU4VXC48PC95r00Md
         iHnzu4kuToXiDgA067FkIjJzxIAGo8kw9EGDWaAcMhk6uwwbnlj9tyum4rKLYiwhhrGV
         2WIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIUdGYY3H0yG4878oYT1P8xMQ5MYSA/5/8yMKacUJBtLdpn4rIpCaAvVx9/R1RrTYxqs+knw9jTbNVyA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxNb5JOtUC7DJVE2tcyLR9z2HZ4l5xxy6+d2FKkDVLeDJVfJLo
	/+hPXlNud76nK84E2kcYQ3OOcJSqWja6m2pma08rJ/ifhGU+rEJs3PBQ
X-Gm-Gg: ASbGnctWy4Xm9Ik4yuEqMh/Id2XjFnCvIBdmOxySnpr4Yrqc0wYq1wk6Awm7JYInil2
	1whJ4arg49uX2lM2oyzsmwUhE7OBE9FLkMdMJ+StXbcNJWy5Y7Y6Qoq59fRWeyzQm+CnR1/IzNd
	H1fs+Q5a26x7jLe3j0/lfLqkRqBV28YgdVjumfNXRsxSECHrXR/BWOp5jx0HqNFu7PtMzCF8E4C
	Y9WRHEp0pEj67/xSRznPHCjwnKWP4MDOFc3gkWCE5qdzxohKxR/NMDjrK2QWgNrerqzAbWgziRZ
	zX9ysHzJ9DxowqS/WRPG+Yi15kBTCv/qVFJZTux6YK6nNO/rAwAuro67nAaXCS9VgTL+r3J1ywh
	VyRMAN+L6g03Ti3kIzmk4GzWENbsPJX9spJ1rGlkWq1O4Q0CCReYKrdiDp5ey4Up+3p7PixRUyI
	VhWr+0OSFufLIUnUvFATWr
X-Google-Smtp-Source: AGHT+IFGe6oRjXPNPGl24FfDVvabdUA/zgNZ4jI5ptDLqD482exk92jQbNg3NAgkHLmfva10Udnmhw==
X-Received: by 2002:a05:6a00:2d06:b0:781:2272:b704 with SMTP id d2e1a72fcca58-7a286765aacmr3785072b3a.5.1761330424441;
        Fri, 24 Oct 2025 11:27:04 -0700 (PDT)
Received: from DESKTOP-8TIG9K0.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274ac3158sm6616572b3a.32.2025.10.24.11.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:27:04 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	mathieu.desnoyers@efficios.com,
	paulmck@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	davem@davemloft.net,
	andreas@gaisler.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	anna-maria@linutronix.de,
	frederic@kernel.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	qq570070308@gmail.com,
	thuth@redhat.com,
	riel@surriel.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	max.kellermann@ionos.com,
	urezki@gmail.com,
	nysal@linux.ibm.com
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	will@kernel.org
Subject: [PATCH 0/3] Optimize code generation during context switching
Date: Sat, 25 Oct 2025 02:26:25 +0800
Message-ID: <20251024182628.68921-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_112706_570325_8CC7DC34 
X-CRM114-Status: GOOD (  16.86  )
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

The purpose of this series of patches is to optimize the performance of
context switching. It does not change the code logic, but only modifies
the inline attributes of some functions.

The original reason for writing this patch is that, when debugging a
schedule performance problem, I discovered that the finish_task_switch
function was not inlined, even in the O2 level optimization. This may
affect performance for the following reasons:
1. It is in the context switching code, and is called frequently.
2. Because of the modern CPU mitigations for vulnerabilities, inside
switch_mm, the instruction pipeline and cache may be cleared, and the
branch and cache miss may increase. finish_task_switch is right after
that, so this may cause greater performance degradation.
3. The __schedule function has __sched attribute, which makes it be
placed in the ".sched.text" section, while finish_task_switch does not,
which causes their distance to be very far in binary, aggravating the
above performance degradation.

I also noticed that on x86, enter_lazy_tlb func is not inlined. It's very
short, and since the cpu_tlbstate and cpu_tlbstate_shared variables are
global, it can be completely inline. In fact, the implementation of this
function on other architectures is inline.

This series of patches mainly does the following things:
1. Change enter_lazy_tlb to inline on x86.
2. Let the finish_task_switch function be called inline during context
switching.
3. Set the subfunctions called by finish_task_switch to be inline:
When finish_task_switch is changed to an inline func, the number of calls
to the subfunctions(which called by finish_task_switch) in this
translation unit increases due to the inline expansion of the
finish_task_switch function.
For example, the finish_lock_switch function originally had only one
calling point in core.o (in finish_task_switch func), but because the
finish_task_switch was inlined, the calling points become two.
Due to compiler optimization strategies,
these subfunctions may transition from inline functions to non inline
functions, which can actually lead to performance degradation.
So I modify some subfunctions of finish_task_stwitch to be always inline
to prevent degradation.
These functions are either very short or are only called once in the
entire kernel, so they do not have a big impact on the size.

This series of patches does not find any impact on the size of the
bzImage image (using Os to build).

Xie Yuanbin (3):
 arch/arm/include/asm/mmu_context.h      |  6 +++++-
 arch/riscv/include/asm/sync_core.h      |  2 +-
 arch/s390/include/asm/mmu_context.h     |  6 +++++-
 arch/sparc/include/asm/mmu_context_64.h |  6 +++++-
 arch/x86/include/asm/mmu_context.h      | 22 +++++++++++++++++++++-
 arch/x86/include/asm/sync_core.h        |  2 +-
 arch/x86/mm/tlb.c                       | 21 ---------------------
 include/linux/perf_event.h              |  2 +-
 include/linux/sched/mm.h                | 10 +++++-----
 include/linux/tick.h                    |  4 ++--
 include/linux/vtime.h                   |  8 ++++----
 kernel/sched/core.c                     | 20 +++++++++++++-------
 12 files changed, 63 insertions(+), 46 deletions(-)

-- 
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
