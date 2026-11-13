Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CDD60A6F43
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k5fMhRx1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=KfIrpmdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=kyipinnLSvfemTj9iNOoUSXQNsM2QclcUoPKWKklGJs=; b=k5fMhRx19ENrX7MS+bMhQQME/9
	SZ2EJKyRzntguF66w8m5O45E8SkB4YI9EdTHrcZIZ058L1Nqau1569p5U3dNmcBrMU/TN1GgRymuE
	c3NSbuKEKSzyhlcplQsvBGrUXbFJw+GU1HHj6ckKnbsD1P8u78jBvANB+veGXeORfigov4ENlmpQX
	nJiVtTL70aDlXyyvmRO9BDaSBaXmdgNANnwEmrjBDmqmbJ4Fiu/je+UnJw2ielkg4kTsz/9A0LQyc
	UCZRGfP7T93zYoVQax0xJlWEcubbPiu6VWvz7DFh93QRFT5az0oQ5qI8NwrUq9mtoCtZnJMWslGT8
	BLJ+JbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmh-0000000C5IX-0Qzn;
	Fri, 13 Nov 2026 08:37:23 +0000
Received: from mail-pj2-x0b.google.com ([2607:f8b0:4864:39::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmd-0000000C5GU-1g5M
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:21 +0000
Received: by mail-pj2-x0b.google.com with SMTP id d9443c01a7336-2ed0cabf65fso3069335ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 00:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559038; x=1795163838; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=KfIrpmdg9C2+0dh+bLNjz2AcK24KKKL6s09LtE9ro11KnXkvcz+rvSJaPFSKJgCDIa
         Ktg++zMcWT+gbewqbh1ilGIgDxB6JVb/6AZEB3LpiwYh8f2rAodCOil1eaPQokqwccZ+
         Y3BJAok/Mn+aY1AhOeWjna70EyqC+bkIReuLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559038; x=1795163838;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bxaxghc2jPugp9fqdcujLfJj76940RCF2HnEXA8AlnQ=;
        b=D0PTmAXSzlXdAiWjXtyb1S2ziBjb/DzXnvbzVBzoC9EAZnIShoHTd7LQfzZPwaIP6A
         bIdAcZjtr0IcDy2i3U7XUSZwYMriTJgAh7W9WIJvY+mwpetHXr0Z+z3fHpynnV2nkqPO
         UDzaK2RnwO+rttnw3gNQhGGDsbVJraXGYfYGf9Hp6Bn9kvDGRAb3HFvUyn+BbUhKQs7z
         ytuOILW4tdF5VJStgV/oJxmRjwyUQ/A9yJTXPrCcYIqT9DpSKwRwshMLcEOU4Blw9rZp
         9Tht4uFnNHUGPd+Gjrlfbb2vKPRNcmbWjLRaW9A1yuuK2PUTbb7oJ/T3dgdyznoCcXnJ
         lMbA==
X-Forwarded-Encrypted: i=1; AL+hErFWXVk/oYLdITLFqMYhlVeW249ru0lmOx3MYQqA8PjkVq62A2c+9ozSbwjnbvgEAqEs+eQx/Xad3e5HwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+9iKyIHMh2HupZrVUvgi/ziROhjiIN3Mf++RxaPrEBKsuq5S9P
	1OO+t5BIUcnQHKr28AYcnelc4I9WoqLql1BhIGcf3CKdiDEpTbuJInieFwzUAOrrZUg=
X-Gm-Gg: AYBFou2PkcEaCeHkwcTbbtAxd3DDQsnmCxAEiUPnyW8PLQqKzJvrDcaWsPgcCbl4YZg
	5M/gX7rfPJfBjn2ZHiK6Fn0p9VIAywmjO1xYvNfEHzL3LrD9UvJ+499Rt2s56qfq2IP/xgl0aip
	dmWGhsvxyPLsgtX8ZFlJiaCjdM45iD4oktHZXvFn2Gj8ecWFNtyw0nJw7B8nzYQl9AsBT81z5KJ
	wetVykV/PkyZIkPw9lAZtdZTlXHV1ctS8nzLzsOTY80HZ5+KJsLkeVXd9XGi5w/iarRxyCyXVgp
	HaGnak+YFLjoCCUW2zFIdOHCqB8Fw1dJZ4tUWIHW8yePnMDlynB7CPb319A0BNU7GZOKXyPmHoQ
	Yf2waEpyEUgqDCYqo3KpyN1ug8WiiveTy5yEoCOjA9i8o1fie+KoStZ4TX+9j3EKQKikuz5UneS
	j6TDkmcA0s9VFcb3sjtAuXFN9cQ6e53IQGzRiBbJuQHnzCT/27dMzXZWTihPir5fh9rvQwsJyON
	kAMuE3q3t8loIo/OhhLy3qvaTdBHPqBSFD5mmvCr1jqLZ19KcnQTrQpzFDmuEUU3Z7ncmo5x7hS
	MnbSs2thRRjdEa1aU5FNMMLVs1g3fcK1mTUVCstSs6FE0kP5z1j9OQ9Yk/CucmnGGVa9PfCuhKh
	JjxeDYTMCUIZNXGUCBPk/A+/snRNzHKRAWUWyS+FRnjwKOF+KR9dsjghWsoKRNn2Z8/d5c/cPPM
	HXYMf72luEJ694mX2wy4pugc3m6mJlfqBkGVfXghFBOuKnKwyiUjB4bcNlp3o=
X-Received: by 2002:a17:903:120d:b0:2e9:5c51:19dc with SMTP id d9443c01a7336-2ee0dd14181mr18456195ad.41.1794559038435;
        Fri, 13 Nov 2026 00:37:18 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f874871sm6731535ad.54.2026.11.13.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:17 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:14 -0800
Message-ID: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 0/3] Make the scheduler stack end check selectable at boot
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003719_667333_A1045874 
X-CRM114-Status: GOOD (  11.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

v2:

- Check scs_is_enabled() inside task_scs_end_corrupted() rather than in
  schedule_debug() (Peter)
- Return 1 when sched_stack_end_check= can't be parsed (Randy)
- Say in the changelog why the other task_stack_end_corrupted() callers
  are left alone (Peter)
- Rebase onto tip/sched/core

v1: https://lore.kernel.org/r/cover.1793082868.git.chris@chrisdown.name

Chris Down (3):
  scs: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 include/linux/scs.h                           | 19 ++++++-----
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 5 files changed, 68 insertions(+), 14 deletions(-)


base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
