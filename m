Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198C9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 09:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3EC60200
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 09:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD3EC60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2XnhBxCmdxtgeIsWB6k9v/8z+RX8mGH7AnRAc1J/Syk=; b=RTyZWDAhNMjy3f
	JCzlELs5jOtpsq/ztris+tiZNB4TltnYtSoqkhjx6CFESQoUwdMEJN/Ce7+dKWvZF3YuI8Kp1+D2g
	HDOVDA2WwoisFDnhrXbVqOFAbx9JSzcxfwGTWNnB9ACz3B/0nssqyN3buWrJJ+qFxKiiYsPxH+V9B
	Vlq1bpKCvBBsaMB+exuAELdx8vYzBf0b9+gU31XQ+Rj2gGiJkganjw1NuT2UedsmyHD7LGs/WjQZx
	0NZXdqWo6ixE8Rx3op1WrJbHimlhE7klO/y+TrMBXLNfFmipd1808jZ/3ES8t2qaxasZhGRxYVcBR
	XPswflR5XWoyBVBiPSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThwh-00E0nc-WA; Fri, 24 Sep 2021 09:56:44 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThwI-00E0mQ-GQ
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 09:56:19 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t18so25740898wrb.0
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OaYmp305ehIjxObH1n+1np51IociiH7SmbrwDZZ6jA=;
 b=dSDIjyzW4fYRhjjOMblgat6lrCCmhpKHUCeM3zDLzkaSdrLNtDMp6ytkatKdlZlHJt
 Ql5ntcefbmCj7saQbYspqgTPKmM6wb93sVKlXqutPZZaBrjXRGJLq5kqWKdONXPUJYDB
 FRCZu8Ye2tz52fzovhANhn58kAG3zM3FIjCwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8OaYmp305ehIjxObH1n+1np51IociiH7SmbrwDZZ6jA=;
 b=iiaELHpHB6hq0UnrHgKKrjirRtjjXLs1qXPWYZAfH6Iw2x5+A4ljs1ll0D+MFmHSwe
 4rrMsvxt/YpAN622Zak4BLbhXSYWEsWBvyQK3LRMNw6MssrNW5aX312FyRuxAIz7/Dyt
 MRUW5BMWVFL/NDD/EVTwH9Djv/h/i0cS+GF0nAN9ZVM/P/OOFG5ZIy6FYPYzA8LYclk9
 dJCWBJiTuwcAZ7wn6suGt6yu3Rlzf6HvHnIhvm01BPUquSIveOEKsHFCmGaiMX2m4u5x
 EW8aRfFLkES1Mv4zDZbkHQFdhWTGIb2yINCF/wjQ/ym+v3/Fo5wKVM573umT/ppfb6Eb
 3s7g==
X-Gm-Message-State: AOAM531OrWt8aAp8WlC917B6sfUCfKGm01nC0PyGz/SsWzlHZYJCBODY
 5UbJmcplRejQ8zx2ZidAPaU2Vw==
X-Google-Smtp-Source: ABdhPJz3OYnepK5UMSKnkJNgitEVJ2cxRSxVD810n3eZaUJJbybqMB1g3SWKHgCq9eDnA5coFxXpKw==
X-Received: by 2002:a5d:4985:: with SMTP id r5mr10708455wrq.397.1632477375807; 
 Fri, 24 Sep 2021 02:56:15 -0700 (PDT)
Received: from antares..
 (1.8.8.f.e.b.b.b.5.6.9.e.c.8.5.0.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:58c:e965:bbbe:f881])
 by smtp.gmail.com with ESMTPSA id v20sm7871106wra.73.2021.09.24.02.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:56:15 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH bpf-next 0/4] Fix up bpf_jit_limit some more
Date: Fri, 24 Sep 2021 10:55:38 +0100
Message-Id: <20210924095542.33697-1-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_025618_574333_7C7416EB 
X-CRM114-Status: UNSURE (   7.67  )
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

Some more cleanups around bpf_jit_limit to make it readable via sysctl.

Things I'm not sure about:
* Is it OK to expose atomic_long_t bpf_jit_limit like this? The sysctl code
  isn't atomic, but maybe it's fine because it's read only.
* All of the JIT related sysctls are quite restrictive, you have to have
  CAP_SYS_ADMIN / CAP_BPF _and_ be root as well. This makes it problematic
  to scrape these to expose them as metrics. Can we relax this somewhat?

Lorenz

Lorenz Bauer (4):
  bpf: define bpf_jit_alloc_exec_limit for riscv JIT
  bpf: define bpf_jit_alloc_exec_limit for arm64 JIT
  bpf: prevent increasing bpf_jit_limit above max
  bpf: export bpf_jit_current

 arch/arm64/net/bpf_jit_comp.c | 5 +++++
 arch/riscv/net/bpf_jit_core.c | 5 +++++
 include/linux/filter.h        | 2 ++
 kernel/bpf/core.c             | 7 ++++---
 net/core/sysctl_net_core.c    | 9 ++++++++-
 5 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
