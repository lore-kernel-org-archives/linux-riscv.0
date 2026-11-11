Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7568E606A32A
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 19:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbxoPnTr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.a=rsa-sha256 header.s=google header.b=U/3B6+fM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7phIzGnTaEd1GfhtOld4rcmCYg7zBuMtQXOyqUC9tqk=; b=SbxoPnTrgWMJPRBeZwNjj8oH08
	XVk25EAyJzheGbkS8dh7Bpr4KSZ8/p2+3FqETUtKj1fxUWSr7ZSX7cWs5KiWoNm2Jfe2ilIqvzy33
	+uTNdrZu4vYqy9BdDhZXIwa8wOmIUUgLiLb1zveIhx7lnlW9Ag/NbXsN6jxNhAotyKnCls9EgMLe1
	6A/BmjJFaIjjQuT77v6o16/3Z5ha/2S9WRT/nexUhL84aEMT66E8TU/tqlj0ITgulGA1IMy/23Dt3
	P6qMlO4gWZatjgBfZVgWdxCVhY548HWIMSVYVt9NTDJl1A7LXoJQQB3pLsrW57qw0uPo9ik2IB+mW
	TDX3Ixcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDZ1-00000007Sfl-1JNL;
	Wed, 11 Nov 2026 19:00:55 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRDYw-00000007SfQ-2Dk7
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 19:00:54 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-67be6030c9fso3090570d50.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 11:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1794423649; x=1795028449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLrwOHZ1vOGAPfvTBTgw9NT45opR0v5Or24JcyLWJp0=;
        b=U/3B6+fMvfnAvcBR2D7HhI3RPnkusF+EuLeRtMz+FvhIq0g2RR8kmbT3Kcn8EThS1g
         IsXXEJZx7EXM2da7l+ans4FeH0IKQRMC83u8ykuPGKe79Z+6eB7Zv79vmpnt/Ql218WL
         us9IPzzvmojnzKJjGwKzLdZlMUL2VpVPEcwo97EDSnQ5EOBsq8Y/elVjfMV9jFtMR3je
         k3YeOqmInKLYaIQWmYMHva9o0DXKGV7oZO2a0QHgzKUGMWSl+dpSNJG2NCQ03mM8pF82
         8b0E7dFost1tWSMLR3u208Sk7dcl+dq2hIA2oVApXI7UjxzEen8fC9djqf82wkQ7ySa9
         MCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423649; x=1795028449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLrwOHZ1vOGAPfvTBTgw9NT45opR0v5Or24JcyLWJp0=;
        b=eAdjwY7KGxcGnWc6Fuvv7yimhQ/CGzfUMM75mmkBZuuL8i85q/8LBINkyiWZiPCTpl
         rMWuG8tz5A98KXyfkJ5OpudHixPopfxwShHrGbigXEjjWgEEBO0pcuwCzfqJQuCWCuHo
         jNIcyvRzZQqN8EOK8XqmraYBjsLiPo5xNjEqvl9gDJQWdJD8Y+5HRWQZdR49pzDZWQUI
         +9fSh7zdeFTGSfeeVGk+T+DjWho7fZ9CfNojDciVIccXRuRKXMvfgqRCb+Xo74ljWCcL
         J+pPmdU+GHBZnJhpKS7eeNdYd0h2CU5Wnbz6GiOoumwRTVo0SBU+25ml6/rCFhAdrf9N
         WDgQ==
X-Forwarded-Encrypted: i=1; AL+hErE33xPaSWQFDu9LD1DaErpW+5guQaFXY15NCltnzFuDBz+wF4dYX8sUbiowm26/JfW++8upC6KOwN4ljA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Ayk+teKNobVBj4TLQwKE3l/1E3SENZqsGozrATBHmx7u4qPpp
	+7TmrAezNbknvTKvPMlJiDmwyMQTdrTuPuPRRRMqtIU4VhtGDd7MsC5Qa3cRY5mFUb4=
X-Gm-Gg: AYBFou2fs7Z7xKoOgoLL3+wq5K5HcFCErRNd8tx8YSmTn05/B+JvqwtACI8au01NQt3
	WzabFppdhsULa5nccrdg9UJJTRen6YL9On/lVjlC/e5NQAxPUYOB0rNEo3MrU6I032XT22qx0BL
	ChSnybfOV6n1rbHPwRsvoWFhcigDT2EoOt1DxYQjEDNp30UxzBrFng/ay3WuefRdRR/OA5fF2a2
	c2naJx0xZpMAPyiJXhnPn2rx6CBMRrgqQlLVr6z5SjM5iWbEHf8vyrq+qZ+lKM79jP6Ei5t12VL
	PS4UxmTcJwmdizHMjZW4mL5sbR91zHcfHpYD/WhVm5/DjKq3mOAnYyhpBNn2xWSzP79Tu7VEs1P
	bb+da9T+3DBbPep+xES7e6AR/+OMhNwfKp3OvWgT6KOstVyX/MeJShLrCNwQLgXqQ53R/gVCZp/
	nndAV5kON7ej/5sFIU6F5MNLpOVs0ApYUjGH8i4Uw5KGpWS/CmpMYr2KIXVMO1GoWT5cxsk1Ga2
	wn3VB4HAayNGr2W2GwQibhIpWBPDJYkNQMHuRU53yYGSuprPvorTb7xnOkB20Sh8OWFDOGsZ5Em
	3bRRblgfBGWBUKmBkU/OIKOpYnpQZHgBoJUYJf36haZiz5mehKaleOGkd5kR2m7/IJndJB8O9cV
	PgIfEFBS2yI5unhsC5ksS7Eotr+gTcPRa1xJDgwdD13MOU9J117/0neTiryJ8CI0DH20e
X-Received: by 2002:a05:690e:11c1:b0:67b:eb7a:e62a with SMTP id 956f58d0204a3-67c67a48a3amr2377800d50.0.1794423648748;
        Wed, 11 Nov 2026 11:00:48 -0800 (PST)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c589a2354sm5209197d50.6.2026.11.11.11.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:00:48 -0800 (PST)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: [PATCH v7 0/6] riscv: optimize mode switch latency for Vector
Date: Wed, 11 Nov 2026 12:43:22 -0600
Message-ID: <20261111184359.1239821-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_110050_607722_68C5D939 
X-CRM114-Status: GOOD (  15.11  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series provide several optimizations targeting system call latency
regarding vector context management. Before the series, the kernel
handled user's vector context in an conservative way, where registers
were null out and VS is tracked as DIRTY. This introduce excess context
saving and restoring when there is a context swicth.  Also, the kernel
turned off Vector at the exception entry, making all in-kernel vector
usecase take the serialization cost, which includes context switch and
user copies. The cost is not easy to hide as vector code are usually sit
right after enabling V.

Since vector register are set to a known state at syscall exit, the
series set VS to INIT at syscall entry and null out the vector register
at the exit, skipping unnecessary saves and restores. The series also
introduce riscv_novstateopt, when unset, enables vector in the kernel
mode, and do not perform register nulling on the syscall fast path,
where there is no context switch or kernel-mode vector during the
syscall.

With the whole series, nginx request throughput vs base on a four-core
Ascalon-S, by served page size (* = statistically distinct):

       86B     1KB     2KB     4KB     8KB     16KB    32KB
  v5   +0.79%* +1.36%* +2.33%* +2.02%* +0.14%  +0.93%  +2.42%*
  v6   +0.33%* -0.23%  +2.88%* +2.19%* +1.02%  +1.14%  +1.40%*

This series depends on [1], which is now queued in the
linux-riscv/fixes. For those who prefer git, the series is also available
at [3].

Patch summary:
 - New patches: 2, 6
 - Modified patches: 3
 - Unchanged patches: 1, 4, 5

Changelog v7:
 - Resend the series based on unmerged patches from v6
 - Rearange patches so that it does not introduce bug mid-series (2,3)
 - Add a KVM patch that skips duplicate context operations on host vector
   context (6)

Changelog v6:
 - Refactor the context switch of preemptible kernel-mode vector (2)
 - Address checkpatch warnings by reformatting patch 7
 - Drive the optimization with an alternative instead of
   CONFIG_RISCV_VSTATE_OPT, enable it by default (8)
 - Link to v5: https://lore.kernel.org/all/20260810172255.1532787-1-tchiu@tenstorrent.com/

Changelog v5:
 - Rebase on top of the kvm fix
 - Do not read sstatus in vector context swicth (1)
 - Add a test for vectorized user copy (2)
 - Enable vector in the kernel-mode and skip nulling at syscall fast
   path, gurad the optimization in a new config (7)
 - Link to v4: https://patchwork.kernel.org/project/linux-riscv/cover/20260528190927.886558-1-tchiu@tenstorrent.com/

Changelog v4:
 - Fix a build warning (1)
 - Prevent setting INIT when it is already and provide performance
   meassurements (2)
 - Address comments from sashiko (4)
 - Link to v3: https://lore.kernel.org/all/20260521162521.188629-1-tchiu@tenstorrent.com/

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)
 - Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/

Changelog v2: rebase on top of for-next

[1] https://patch.msgid.link/20261020-vector_fpu_regs_status_rmw_fix-v2-1-474a59155e96@intel.com
[3] https://github.com/tchiu-TT/linux/commits/vctxopt/v7/

Andy Chiu (5):
  riscv: vector: refactor vector context operations
  riscv: introduce riscv_v_ucontext_save() for signal and ptrace
  selftests: riscv: Extend vector tests for sigreturn and ptrace
  riscv: vector: optimize vstate operations
  riscv: KVM: do not save host vector context for vcpu

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/riscv/include/asm/alternative-macros.h   |   6 +
 arch/riscv/include/asm/alternative.h          |   3 -
 arch/riscv/include/asm/cpufeature-macros.h    |   6 +-
 arch/riscv/include/asm/kvm_vcpu_vector.h      |  17 ++-
 arch/riscv/include/asm/vector.h               |  68 +++++++----
 arch/riscv/kernel/cpufeature.c                |  18 +++
 arch/riscv/kernel/entry.S                     |  15 ++-
 arch/riscv/kernel/kernel_mode_vector.c        |   4 +
 arch/riscv/kernel/process.c                   |   3 +
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  56 ++++++++-
 arch/riscv/kvm/vcpu.c                         |   5 +-
 arch/riscv/kvm/vcpu_vector.c                  |  22 +---
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 +++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 +++++++++++++++++-
 17 files changed, 364 insertions(+), 78 deletions(-)


base-commit: d1a8d411533d6be16ac79796c02a9bfc7d7958f1
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
