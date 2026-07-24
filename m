Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47892C53200
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b0IpYOM6udJHWObyPPn2txPFdnn3i5Ssf+dfo6KPFBU=; b=qh+xEVErSemenU
	xaiAi3HkhHqM4N0oFgqHTGM7o7D2+kiC51UzGrOm61404Zd1YXcAJGCgoZgFG3HSLABUlqCdEm7jj
	wmah5aQH0TIPiWFbNmDskchbZSQPFOrlsxCAxYZGZDM48mPJmdApL7AIeq29+/PLR8Bt9k3obMjSP
	tdM0gRAyPlH9nh0rTOQozU4jJ6fTum8qeQkbzDy0ss2gaiF+4k89+BGzEXz+A8bkqii9ZGesUohcX
	JLAh539Muo3gsoLhKOD40kc2TmXwU9LjVr4RuDPO7MSLOW7CD8BRHvBypDtNcSw6PYPZyWVWT4LbT
	bo6Q3Ek9LWi5WbPaAunA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6L-0000000GsXO-0AgT;
	Fri, 24 Jul 2026 16:50:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6J-0000000GsWU-1Nqq
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 16:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YBM0KGHFm+ZJJiHai+rkJEmg+pEOOVRs7ENpJ01Wvqg=; b=k9MHxlqJASqlZD4JykJVU4avaV
	O/IWDkBedIOAFVdu00V58JK0EnbkrmczLQ8xsQ+mS3Zea/gND9EPBDHoI7rFYGq3vTr0emA4RaD7N
	4rJWbsKot/yjuJcrUc9Iwv7VhXswmeAcjtd9QcBQgZLqJmVbUOAAgwTFyPk02IC2IjtRj2wmxtYeO
	+WPi43FedVe1cNP7i2/4pQdDVh5gYeYmlAlJU2Xa8GL6fTpaysVnyT32ccUnClbjM+sqr4veVybwv
	a/8LNXjq8hhLTQpOU0hYwiaSyQ2KArkfs7uVo2gXhoaqdQtsQmYJysiT/cLv419GQwiUFbnqFi36l
	g4XCqB0g==;
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnJ6G-00000002mUx-0z2e
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:18 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-6a116bd18ebso400623eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911814; x=1785516614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBM0KGHFm+ZJJiHai+rkJEmg+pEOOVRs7ENpJ01Wvqg=;
        b=Af5HngSqwQJnB9uFKAiw6DtlV2ha2rc7vXnedMoKoEWkuaGOgfjUdG9gq6enFm4Pa8
         m1bRUD0SHb5bx/M9pU1NNKbAZNTEN93sjMcS2YbXfHxUsdLo1/XDw2uq5x9SoGbhPjeU
         A+8R6q7OX8c2L8lUosxiBwO8XrRGsJWUJj3LpVBv+X94L+KWyj3Gtcf6hZkaQck0pCzQ
         gBXKmq1sWNFsALTowq6QXuQ+boxg4AGur5iLl1jkwhsxeQft7q5pedWI7Iw+hhD9Jl3q
         oOFeTnlQVODCo2DyPWGGH81GPT50eLlyfF9RkFtCdY2zoFs+ZV4sjWFpEkub7Gz14gef
         kPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911814; x=1785516614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBM0KGHFm+ZJJiHai+rkJEmg+pEOOVRs7ENpJ01Wvqg=;
        b=D/IBZA6KWy7dIAUr6sIzh97RtM6489dEzhP6BZWPGqEgkcluisyTj5S3luvBnXdTs5
         +Qu+Hgiu3YUgBdVC7nqfzcRRyF9CJUa8QNsveAqjWNsZWrWlizcv4vX+hhEuio7CNYT/
         9LTbW9fuSKWLML/I0qtCWuP9aKwhtbCSAnii6BhLVE+pS+xp8F5igIb7VMpDtyBNtHuH
         tULxel1/xjMGvLGzhb87E+sY+u0aKNpoVpWyE69lXf2uAyUUU/jD0CAkgC6XKiVckIy6
         tI0vLi1Zr1PImBz8kT0eoXvxLs7jAbzmFZTSvbV69fEJ+b+zII2SFrwHIWS5BjlbXSw2
         Wt3A==
X-Forwarded-Encrypted: i=1; AHgh+RqpVIMncwwwvfYmgvG751uofauYkRCoSbCWNjwvGo5rrW9dZIBKtTaFS2pvBsPJUSizokvtNg11UwPmew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBQk9BZePfygqdgYP2NYl/IMQqv/JeUJ6/Om2hyeZTXggk2l3u
	cDppfHtvTv4TFzaaD8aU9xXLGvvkfGCws/waiH6kDeWPTuldbN6Lf0GOkH82GZX0V1c=
X-Gm-Gg: AR+sD12kLxbyhsx4gVZxZMoEnWeh3Yb4Wd0do74F+kGA0yqjxXh6q7F2fhvTP0eUYJd
	vsM/bYTeGAsgDuYXJGhBxsXddrmTBSPSwImkIyn9RBV7XZBm99ZVVZiI4gop5rXCiAwOlOsHTQf
	VomHYOrfafm2tmmIywEEE9I4IviMOcMFbCpsAGuMQ7CE1e91/ncq4leggJ7k4lh7XaPk+PfEV+k
	3EvtPFO7GdcCNRVmhEpcQtBnAG0PzPpC9wEoIR6TqjZ33A6tDw8wWAdm+k6yu4bNz3wXDwZN9NL
	JuWW2DImi9T5RucwflBPqu/hg19nv3koXzMzwmG1YbI2lRLvqwhTEre+WoLETlyX4ZG61GBHsF8
	Ov/FkqGBeNSsppMudNPqWxcc5j/rhm672arj1O098UIc+mlGAaYSU449gfjVdgFvfs+lP+nFo7O
	s1U0ASYjLT0WG/fk/6ZXvgkrJQ69x3tMMsMmA=
X-Received: by 2002:a05:6820:4c0c:b0:6a3:74fd:a86f with SMTP id 006d021491bc7-6aad3f90de9mr4702136eaf.9.1784911813572;
        Fri, 24 Jul 2026 09:50:13 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:12 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: kvm-riscv@lists.infradead.org,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v3 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Fri, 24 Jul 2026 11:49:51 -0500
Message-ID: <20260724165001.2317788-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_175016_376939_6E96F331 
X-CRM114-Status: GOOD (  10.22  )
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

This series fixes a vtype corruption encountered when running perf +
vector workload on KVM.

The root cause of the bug is that the kernel-mode vector (KMV)
misattributes the guest's vcpu context as the user's context. To solve
this, we need to correctly save the vcpu context when the kernel-mode
vector is serving a guest.

However, calling directly into KVM from RISC-V generic architecture code
creates a reverse dependency, which is problematic when KVM is built as
a module. To address this, we introduce an RCU-protected callback for
context flushing, which KVM registers during module init.

Patch 1 is a preparatory cleanup that refactors
riscv_v_start_kernel_context().
Patch 2 prepares get/put_cpu_vector_context() for gaurding the use of
vector in kvm_arch_vcpu_load/put()
Patch 3 implements the callback mechanism and fixes the context handling.

Patch summary:
 - unchanged patch: 1
 - new patch: none
 - modified patch: 2, 3

Changelog v3:
 - Limit the export scope for {get,put}_cpu_vector_context()
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document flags added to riscv_v_flags
 - Link to v2: https://lore.kernel.org/all/20260715051629.1169645-1-tchiu@tenstorrent.com/

Changelog v2:
 - Address issues pointed out by sashiko (2, 3)
 - Link to v1: https://lore.kernel.org/all/20260711015835.767259-1-tchiu@tenstorrent.com/

Andy Chiu (3):
  riscv: vector: refactor riscv_v_start_kernel_context
  riscv: vector: allow non-preemptible kernel-mode vector with IRQs off
  RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++
 arch/riscv/include/asm/processor.h       |  8 +++
 arch/riscv/include/asm/simd.h            |  8 +--
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 79 ++++++++++++++++--------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++
 arch/riscv/kvm/vcpu_vector.c             | 22 ++++++-
 8 files changed, 129 insertions(+), 33 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
