Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10559C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 14:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13C1u2awSZnR7qLvNZPQ71wrd5LmJ2ui85jVl6LdL8E=; b=3Wp9t7NmXGEve6
	gCGNSVwyratx6z5Z3oHBlskNNN63b6zxKI81ZCKagbLlZqRfTYvqRNkJPcSe5U6RT6/5SPfAmVG3d
	nmL5Abw75iE9SqfdFLNYZLssBovBHKQGuPzqLgE0RMNneNlVwSxXNj55w3HutqYJRP+NgVyIe0j7O
	9TlRX4/Q/gI3E8TeIcOKLCwDqvGdFFHLFRiNIOrCyFklUa0/AW1uBFagcolFlLj0M/4/kwJwd8UU3
	AVs2opGE5L6F5O1auFiL9y2s6PDTmkCU9tPArrlmcaayVreNyjMHLKCADAIco+1YQLJyuNDkDmnvz
	DZR3c1vFQBVCkZpZbopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7I9J-00GZNT-SO; Tue, 11 Jan 2022 14:29:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7I9G-00GZML-IT
 for linux-riscv@lists.infradead.org; Tue, 11 Jan 2022 14:29:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e9so31818828wra.2
 for <linux-riscv@lists.infradead.org>; Tue, 11 Jan 2022 06:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cVpO0twPTQYfaXvPrtKidZn97kp3fh1pXoSqkP4do5M=;
 b=A6pNOFu2UXG3kppLMdQlce00YTOBthcO5R3s/QHOsLu7xl2a2dNlSJuXTDWN+IKkvN
 hed+rczKtREGBW+Dz/wzknJMwLjN7tKA838lwxJo7RZL/BNu6Z2ZLR8ChGYeHRXiGVDw
 qtBeQGcAZwl0avn8kaSY1eEv9Px7e5frQLxQZJAyKgaAu7TaHjAXk4ue5JDGEj3ZK9j3
 t3RXi9LXY62E3KY6KyKKEvnt8Zh+Th+E25tZndDWNoUe/wAulsKxqvsNBtsyRt2crOAZ
 tw57338YczPFLw0iR4iyAi5YO0Tm1oiK0Y25W63xyPhXWFH7SKdPPYNFeUlAqx9BmNmO
 WGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=cVpO0twPTQYfaXvPrtKidZn97kp3fh1pXoSqkP4do5M=;
 b=LaNpbIjV1NmdLc2+5hvIn3a9f152CgRdHu3Xq0IPNcnjB5LNgwYifpPQFYHYWD4AWL
 amq3jb+FipFxuVP6RiI5nHERB1bDHc1TOohLPOfx4PUF1eloZchz/zDZugmBq4WIQsr7
 PKfh4PuDuMkppR6YBCwZQMdP5EQlTFpR+XoBmsPGFHkXSVJwrku/swtzDkMTKnfMMenB
 I7d8gUAPfYl2Rp5egMlKWMsKmMdYHki9kK2D8KkpfYMoYEV88LIQP31u+Nn5tAce2Y1x
 IY7H5SNERU/wqZ3PdYteoQFpDtVvHXtlromOKg6IW8NE27tA1U9fldOyRffqEVstAEyP
 fonA==
X-Gm-Message-State: AOAM533f0mOxa4d46Tbu+O1dOpIn6LvR2omOrqLgSBDwgpBqIOQuFeeq
 QAKutG2418WC8csm20oa3REkYA==
X-Google-Smtp-Source: ABdhPJz569ql8rw4+Bp8dedwXG13FhgJT9VU8wnYfLgstT9Lg7arvKTCBiy0HFx1TJAMO4b9AOzrvA==
X-Received: by 2002:a05:6000:1687:: with SMTP id
 y7mr4090466wrd.234.1641911356619; 
 Tue, 11 Jan 2022 06:29:16 -0800 (PST)
Received: from smtpclient.apple (global-5-142.nat-2.net.cam.ac.uk.
 [131.111.5.142])
 by smtp.gmail.com with ESMTPSA id bg19sm2204544wmb.47.2022.01.11.06.29.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jan 2022 06:29:16 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [RFC PATCH 0/1] perf tools: Add 'm' event modifier for counting
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20220111142054.18733-1-nikita.shubin@maquefel.me>
Date: Tue, 11 Jan 2022 14:29:15 +0000
Cc: Atish Patra <atishp@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux <linux@yadro.com>,
 Nikita Shubin <n.shubin@yadro.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kajol Jain <kjain@linux.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Jin Yao <yao.jin@linux.intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@huawei.com>, Riccardo Mancini <rickyman7@gmail.com>,
 Song Liu <song@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <B6E7919C-9414-4CC1-BB86-7D358085CECD@jrtc27.com>
References: <20220111142054.18733-1-nikita.shubin@maquefel.me>
To: Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_062918_683482_B4F487E0 
X-CRM114-Status: GOOD (  17.63  )
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

On 11 Jan 2022, at 14:20, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> 
> From: Nikita Shubin <n.shubin@yadro.com>
> 
> This patch is a proposal to add Machine Mode modifier that is currently 
> available only for RISC-V for perf tool.
> 
> We don't currently have a level that is lower than kernel, so i don't 
> see we can reuse something existing for this purpose.
> 
> The exclude_machine bit seems harmless to as no one will proccess it apart 
> of riscv.

Armv8 has equivalent bits in PMEVTYPER<n>_EL0 and PMCCFILTR_EL0 for
EL-based filtering, which includes filtering EL3.

Jess

> Patch depends on Atish Patra PMU series:
> https://lwn.net/Articles/879905/
> + some modifications to pass execlude event to SBI PMU extension
> 
> Tested with qemu.
> 
> Nikita Shubin (1):
>  perf tools: Add 'm' event modifier for counting machine
> 
> include/uapi/linux/perf_event.h        |  3 ++-
> tools/include/uapi/linux/perf_event.h  |  3 ++-
> tools/perf/Documentation/perf-list.txt |  1 +
> tools/perf/tests/parse-events.c        | 18 ++++++++++++++++++
> tools/perf/util/evsel.c                |  4 +++-
> tools/perf/util/parse-events.c         | 18 +++++++++++++-----
> tools/perf/util/parse-events.l         |  2 +-
> 7 files changed, 40 insertions(+), 9 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
