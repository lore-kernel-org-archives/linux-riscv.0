Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 240EDC369DC
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 02:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=5M4wIkP3g3QhUYQsu8hrWMZEguKAm8gZ/iX7305l7nI=; b=sFg
	IhVNWtx8ipv39YetChRGbywjicE5163AG2i8P46P3EyRXTkDrfldaepggzEYPdynBVjNTJMhsgbea
	uJploUzC19rdxyiTvj6AvR0wACJvyvydp03k24o5KR7//gYKB0oNUS3gk4xtp5CpNIJ8gVH8JsFwj
	wRl5CP2pqSpXPx8gsx09lfhOG+M/mvSM7bMgT1j4R3I0bZD9yvu1pmbdYyGtyHp1tEY52Ic/IzuUF
	4soFc2Mh2C76ZP2vlPt/ArFbHLDzogHY5VzMlv3x54wSjJ/DeN3XE9d+hi9dae0W1D82gde1uzwiV
	tzzp/iEbbf/s7VyyyxOeHu6l4WFqkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9wlD-0000000BTnv-45Rx;
	Wed, 30 Apr 2025 02:01:19 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ve4-0000000BNUi-133m
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:49:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-227a8cdd272so54604015ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745974191; x=1746578991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uVJn6R8AyLKP9RLCMrKJhUthQHLHAwUZd1bqoncqyPg=;
        b=FfF1Dl1UFbTvhtwijHP7E0P3FruWNGVvpV/XXwDzob79k1engIOI6Tj8l/zuJwI1NJ
         pdCPIyZTebe/uZs+McIdvrS3Wbef91M8lUUGxceMN9STiu0JZATlqH9XC+HOtcqhkzGS
         MHJ/AaAzVKaJV4Jw35El2lQyrPH/cbnVJsLjL9SeavRB8uytnkJu/ZKfEEUtax2TqT35
         mJlI3zHDPZhpbAETLzdgoQq4dBajfZmiGZl4YBwaDntP5VMG0t4alFta5mkPORVKFoSJ
         Xg+Bm+yM06mtBqe2Gjpoj7HIh9ANAIWZvvhAMOv912lVXfKRci9PN5eN7ixftrRPNJTl
         9HjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974191; x=1746578991;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uVJn6R8AyLKP9RLCMrKJhUthQHLHAwUZd1bqoncqyPg=;
        b=wnNCccydx/38xwCwmCDIsZIz1PaKf1IxCWz32rZ7GeJMfD47bkM0ZySHHBNmn8S28/
         C51IGwunQQzVdS08WfJr3t4cPyAl4r3/VhJec5Yy8yGyNV80zg3qEMgvS1WFGeDfz7NR
         gi/8aoRqSfAkp92z7FiANOfn2XasKLxSzKzLbztybov144AeqVDySKLw+/6kA6kkCz3X
         D1/FBJlIvyo+4+6Cevin7Z1n108uc1J3Y96MwFTY38mwF3rbygqKojW79/rHP6SySoNF
         lix9hd+xgibA6I7VuOu41gom64vTQIUikenCtU0nyEtlBjHVTkFgnIrfW+6A4slPAEFn
         U1lg==
X-Forwarded-Encrypted: i=1; AJvYcCWC6u0MhBhNdUKh1YF7M90DzA5LECP3T4S9ITpaWcqPbhjj+skf/+Kf+gZCm5vEl8Qod22bJ0lB4MJC1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9YxKkf4jShR3+Fxzj5Dk0zKzfNviOHFJ8tEK48PfY6+Bvwrm3
	H0jbvbPbFk1MrhCIqs2VAtXH0MVF8uwHpknjD0SAzz7nw0JammB8NbyyVFzUH6MMo7t7OQYYC5K
	ztpQdgEd0EQ==
X-Google-Smtp-Source: AGHT+IF9zsphPMP1HajZC8Eo2sh2+VzDRKm+YZlHx2A2vQLcAL4BFROSnhFTkQQBucvMfF5NEp7t7fHg/OmYfg==
X-Received: from pgbcr13.prod.google.com ([2002:a05:6a02:410d:b0:af2:4edb:7793])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2ec8:b0:223:60ce:2451 with SMTP id d9443c01a7336-22df57a5cabmr8537185ad.15.1745974190699;
 Tue, 29 Apr 2025 17:49:50 -0700 (PDT)
Date: Wed, 30 Apr 2025 00:48:53 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <cover.1745970908.git.yepeilin@google.com>
Subject: [PATCH bpf-next 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, linux-riscv@lists.infradead.org, 
	Andrea Parri <parri.andrea@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko <mykolal@fb.com>, 
	Shuah Khan <shuah@kernel.org>, Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, 
	Neel Natu <neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_174952_289285_FF65D5DF 
X-CRM114-Status: UNSURE (   7.98  )
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

Hi all!

Patchset [1] introduced BPF load-acquire (BPF_LOAD_ACQ) and
store-release (BPF_STORE_REL) instructions, and added x86-64 and arm64
JIT compiler support.  As a follow-up, this patchset supports
load-acquire and store-release instructions for the riscv64 JIT
compiler, and introduces some related selftests/ changes.

Specifically:

 * PATCH 1 makes insn_def_regno() handle load-acquires properly for
   bpf_jit_needs_zext() (true for riscv64) architectures
 * PATCH 2, 3 from Andrea Parri add the actual support to the riscv64
   JIT compiler
 * PATCH 4 optimizes code emission by skipping redundant zext
   instructions inserted by the verifier
 * PATCH 5, 6 and 7 are minor selftest/ improvements
 * PATCH 8 enables (non-arena) load-acquire/store-release selftests for
   riscv64

Please refer to individual patches for details.  Thanks!

[1] https://lore.kernel.org/all/cover.1741049567.git.yepeilin@google.com/

Andrea Parri (2):
  bpf, riscv64: Introduce emit_load_*() and emit_store_*()
  bpf, riscv64: Support load-acquire and store-release instructions

Peilin Ye (6):
  bpf/verifier: Handle BPF_LOAD_ACQ instructions in insn_def_regno()
  bpf, riscv64: Skip redundant zext instruction after load-acquire
  selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL when appropriate
  selftests/bpf: Avoid passing out-of-range values to __retval()
  selftests/bpf: Verify zero-extension behavior in load-acquire tests
  selftests/bpf: Enable non-arena load-acquire/store-release selftests
    for riscv64

 arch/riscv/net/bpf_jit.h                      |  15 +
 arch/riscv/net/bpf_jit_comp64.c               | 334 ++++++++++++------
 arch/riscv/net/bpf_jit_core.c                 |   3 +-
 kernel/bpf/verifier.c                         |  11 +-
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   5 +-
 .../bpf/progs/verifier_load_acquire.c         |  48 ++-
 .../selftests/bpf/progs/verifier_precision.c  |   5 +-
 .../bpf/progs/verifier_store_release.c        |  39 +-
 8 files changed, 314 insertions(+), 146 deletions(-)

-- 
2.49.0.901.g37484f566f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
