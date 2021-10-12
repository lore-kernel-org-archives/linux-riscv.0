Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A12C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:00:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64AF461040
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 14:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64AF461040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LYIwVgxKVHCH1CZEv9IjFLhnPJzG3hWBFMBaVJXu5Q4=; b=yTwI+eW6FwS/jN
	uaYfK5sHoFWFru6WuUtRx5Sz7XijFzKUWbbfeoE0q4peMq41faLvwRKUAlgy4Up/f9DFl/R8kKk3G
	CexYNcSWgakULeGMa76jDBEtPqIhZI83sywJeQSUJ5dzXNAu2CY3X0RY5/cCt3nWxuIiKhv1LZLnJ
	gY/s9KDVbMzI5idIb6De9qpwgZOSOqmDfWL5FIOocFGWilMkQPlmyZpY+neVJTjPyfH3Q/Kcd91DU
	Ich9FZRbVPRr+Y+mgio4mIA12SzUbClZ8IlsVkGDvE7Ur40msLV/nwNJcWCxsLaE5M2+u3OEFKj9+
	1zQl8hctPAS1ZRPmGRZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maIJo-00D6jo-Dq; Tue, 12 Oct 2021 13:59:48 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maIJm-00D6iP-4S
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 13:59:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id i12so54572397wrb.7
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 06:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+GuIj3aWc+P2iq5KRg3Ocnb9emA6/eo+vt5L54uAB8=;
 b=taW16PAyESJ5O3dRnEWjPJa2DMMYr4oAUH/8HAG7iqZRv+eV4Cjf1Vja1t2FiBAFev
 flYbmHkQH1G19nooWHG3uyVLv/fvw2QSE/dasax6pbqw2Y2DrrlvlCgZqEXoogfR+xqS
 EWYIHrd/cnopoVB+lFVq+N1XNgCBrAfkX76OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J+GuIj3aWc+P2iq5KRg3Ocnb9emA6/eo+vt5L54uAB8=;
 b=7RBcgUeznVxNw0aE/fVMH5cbygTEnvj4Ck22GxlJ2sPEgT1yu7b0uPZM+AAwqKLUTV
 q6nJp/N2BVJkiWkKgd6sZX+jqleKFjueQvHHTnF4YPk+fkMuFT8uC6uG0HSB1gY9Czce
 enmzQX+beir4RO+X/kYGXzWfqiD+eR8nrg4o8damEibj1Cv01eOvT5TEUCnCg1ERGaxe
 ynyDPQYEd4UvWD99hED4XJi3Q0yhE7OBiPfXig6KUQwXrqdrFb6lqzEFtlC72QVFAclv
 tibBtkwzMbJIp4BN+g+AWdVpJ7S/UhT3leMWlg/wajjRn4AN7Vs3jygELz/ZDLWSeHgC
 1FDA==
X-Gm-Message-State: AOAM532KtL5niYSvtoEj1WdaJMMY5p8q8JDSfSX9lGy9dqw+9UuGPB2K
 w7Zp4jsruffcmQ+PMctf9glV0w==
X-Google-Smtp-Source: ABdhPJzEvONrPWYpm0JwryJr3pc0eUlNhggqvqv4BA1FliYf1tYhBkyS6nLO5ZstlXnqog5GloEXcg==
X-Received: by 2002:adf:aa04:: with SMTP id p4mr32712587wrd.67.1634047182565; 
 Tue, 12 Oct 2021 06:59:42 -0700 (PDT)
Received: from antares..
 (d.5.b.3.f.b.d.4.c.0.9.7.6.8.3.1.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:1386:790c:4dbf:3b5d])
 by smtp.gmail.com with ESMTPSA id o6sm14875894wri.49.2021.10.12.06.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:59:42 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: nicolas.dichtel@6wind.com, luke.r.nels@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH v2 0/4] Fix up bpf_jit_limit some more
Date: Tue, 12 Oct 2021 14:59:31 +0100
Message-Id: <20211012135935.37054-1-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_065946_208658_AFCD7701 
X-CRM114-Status: UNSURE (   6.50  )
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

Jakub raised the point that a sysctl toggle is UAPI and therefore
can't be easily changed later on. I tried to find another place to stick
the info, but couldn't find a good one. All the current BPF knobs are in
sysctl.

There are examples of read only sysctls:
$ sudo find /proc/sys -perm 0444 | wc -l
90

There are no examples of sysctls with mode 0400 however:
$ sudo find /proc/sys -perm 0400 | wc -l
0

Thoughts?

Changes in v2:
* riscv not sparcv (Luke)
* Expose bpf_jit_current in bytes, not pages (Nicholas)

Lorenz Bauer (4):
  bpf: define bpf_jit_alloc_exec_limit for riscv JIT
  bpf: define bpf_jit_alloc_exec_limit for arm64 JIT
  bpf: prevent increasing bpf_jit_limit above max
  bpf: export bpf_jit_current

 Documentation/admin-guide/sysctl/net.rst |  6 ++++++
 arch/arm64/net/bpf_jit_comp.c            |  5 +++++
 arch/riscv/net/bpf_jit_core.c            |  5 +++++
 include/linux/filter.h                   |  2 ++
 kernel/bpf/core.c                        |  7 ++++---
 net/core/sysctl_net_core.c               | 26 +++++++++++++++++++++++-
 6 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
