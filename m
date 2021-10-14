Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A5AC43219
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:26:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A27C611CA
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 14:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A27C611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZM0SF3wW8obdJ9AJThvO5TMgzFZLJAfallPUmYVdCYU=; b=mUgOnmU+EaUB3k
	66oCjJyJ0gJUnj3JyO4eBd0h3Oo77kP1WoQn4uXHtSYdQCPcioBVamJzkZmTi3B+/FP9Yoc8/VYUv
	exfucvPk5goeLgjc6iezBcqCTAmY0itXfj2yNKPw6yQqLq5GcJ/S+4qHjWYYij3tPPH8x1sN4102U
	YdssttaRhcO4RlDS+W1M5sYq6SO0VUXH8UDms3l+ZkxNulP9x6f0XCbyrn4UzbnD78kf8QPMgRtt4
	Gbg1eotkhu65XSmRGcJnIEB4aqwCSOBjP462CaWSlgKkd98w6ZbWqRjWvUksVuJqp6kBqVtQsKydX
	owxgUFxbqL2QGDYlMOoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb1gO-003QyG-5w; Thu, 14 Oct 2021 14:26:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb1gL-003QwL-TL
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 14:26:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id o20so20149849wro.3
 for <linux-riscv@lists.infradead.org>; Thu, 14 Oct 2021 07:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/q19B3/R6J7BzRleBPGaijLiNuKPab4A3ikMD+aFpc=;
 b=vkuert2c6NwOmACcKrGEBG/ZVwlGY5+xuph3roHVDxv5uGnVqsdzXobkO+AbFVLy9P
 RT5LJdxIPpjc/91Rw9i7ruyDESi5qlbq4y+ViU3yu+Of/8gY2WLOZsB6GrizPVen7Xqt
 88gtCXWUIFPPmd4Tuy4BXUEcNvhRKEOKBWtf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5/q19B3/R6J7BzRleBPGaijLiNuKPab4A3ikMD+aFpc=;
 b=cYfqWmqLE/Ov5e0r2W3WlwsWOj/hbelM3Bse24nbvRBOvjfIbw3OBBhDViykBbn4No
 p4Sbl0E0P43M4ZGD8zUSCUEWEjMqEqmqc5KaIuFXMbJX1OAm0iAtxSqEdXMwBx1SHuAJ
 NO7gRpmWpZwwu9qRY3ZdfOeOADE2OZ1kzm+ng6Js2J1TZCso60eCuxEI/5AjCvNBI4Ur
 XtqMg9RgVxKGfKmGL0Xulf9grfqX5W0oStNvgjsJpyiPKWN4VL69PT0mOeVbwdjpvaSQ
 4e7VIxXqJAvCFwpwFn+YDZWE6tXeGyy0XzEnregIOXDaeZHpo6v8HjLKLj4NaMNoYVN9
 +YXw==
X-Gm-Message-State: AOAM530jH0C0LK8/yxwt5BWg+zmxCTq05vF+sB6cX2Pmui8tgDfvxLz5
 /4/Hdqhp583oKicrl7JtksT1bQ==
X-Google-Smtp-Source: ABdhPJzB2mQjtO1jbM2E5FRM6Hgfz82vytUWdiGWhil+caGVdjTD7sQWZqzw2X7wsf9dE8yHVxv6Tw==
X-Received: by 2002:a05:600c:358b:: with SMTP id
 p11mr19459456wmq.156.1634221563632; 
 Thu, 14 Oct 2021 07:26:03 -0700 (PDT)
Received: from antares..
 (4.4.a.7.5.8.b.d.d.b.6.7.4.d.a.6.f.f.6.2.a.5.a.7.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:7a5a:26ff:6ad4:76bd:db85:7a44])
 by smtp.gmail.com with ESMTPSA id e8sm3731111wrg.48.2021.10.14.07.26.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 07:26:03 -0700 (PDT)
From: Lorenz Bauer <lmb@cloudflare.com>
To: nicolas.dichtel@6wind.com, luke.r.nels@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: kernel-team@cloudflare.com, Lorenz Bauer <lmb@cloudflare.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org
Subject: [PATCH v3 0/3] Fix up bpf_jit_limit some more
Date: Thu, 14 Oct 2021 15:25:50 +0100
Message-Id: <20211014142554.53120-1-lmb@cloudflare.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_072605_975647_9D328171 
X-CRM114-Status: UNSURE (   7.24  )
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

Fix some inconsistencies of bpf_jit_limit on non-x86 platforms.
I've dropped exposing bpf_jit_current since we couldn't agree on
file modes, correct names, etc.

Lorenz Bauer (3):
  bpf: define bpf_jit_alloc_exec_limit for riscv JIT
  bpf: define bpf_jit_alloc_exec_limit for arm64 JIT
  bpf: prevent increasing bpf_jit_limit above max

 arch/arm64/net/bpf_jit_comp.c | 5 +++++
 arch/riscv/net/bpf_jit_core.c | 5 +++++
 include/linux/filter.h        | 1 +
 kernel/bpf/core.c             | 4 +++-
 net/core/sysctl_net_core.c    | 2 +-
 5 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
