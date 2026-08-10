Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B346C5B56A
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qYO518ZPihxpGYdQoz2+u+wtTtvrTuvfSIDV67O5rIg=; b=l27choALFIJTQz
	P26DYOPAqKFGqAP6ryMkElexdGm5gOIfpix1fAcT9D6vF/QnfkDO4WAVRygbToujk9yMUhSf933q2
	riNtoFcfQdwh1lR3shxEFcDpIk9yL8lXYEYMMR2PU2KKxsOwK3PeYsaTAIRd5VdqTVDzsqLPf9Ek2
	I92vMhJ120V013W6fljylOsMpbVshf9lrelJxBhjh7EwwvYvkvRa6BimgWk6ZSuy9EJBb2tzsADoW
	9wJIkenEInozR83JqS51/0Kypf7oLKRe+ZNHy5vRS2ElEEfWgETkXdzD3U3PkZ6aLxKzsTJDGGlWP
	MzZJS87grp+1y2cv6tjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkD-0000000CVow-2CMz;
	Mon, 10 Aug 2026 17:25:01 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTkA-0000000CVoD-1JGc
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 17:24:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2417604a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 10:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1786382697; x=1786987497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vN8qwwrdlIfwslGM8HuVqUq/QJ2rZvBBYs2JUB+CUms=;
        b=N5V29AvKjacMuD9hPj3fV62Ec1sJKvfROEt1LdH37IU+j8Cv5x9jdvsYiA52Q7mc3m
         IUcO4ImU2AdHfO/fRujsHY3AhigDO7B5vMqf7ounUHWdnwh7BYpx5KgRIROIzHjeNB/F
         bAGjBAX4vylsIkQ0JFMGX9Kq+TwKIVZQQEtFVOGq+WqgxxNPJnJV8kzFSeL4m6mocjlr
         S1LEZJ9njCwuAaW1Z7/5DscOCXFfY/veI2bpkRYuk1nAWmsEpYhDst8Jq4Ce/ccTUxCo
         G0g52gFPx12WzfmeP90JLmppmaDigRxcOJHEkL6ydhTSVi13mPKYuz0qeV5xFQyY3oWC
         6ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382697; x=1786987497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vN8qwwrdlIfwslGM8HuVqUq/QJ2rZvBBYs2JUB+CUms=;
        b=Eu5oC4VUQVWLDw7SCtIlxDaYtkDBWyNuRR5ARvwrpWnGxl5TmblYI2TvXXMREgBtG9
         l/LabAQcQzlaU4A5GoidibaASQpFy6eFpo4MPXWgnWHrS1FurCEhT7W0dN6ndvPMCMp8
         gKbf77I4tDvYGRIM7dcq5cghEAmNdR86RQblSG2ZV5dZFoYBQLLFz3eo3vMsW0taCZ0h
         VhVNBKE3JWbjb7j9qDDB7MZ3t3CWOpTZH8GqSC4rtlHvPliREpndd2rI6XnHlZvgfGa5
         A/y4MKzPwIPVt73RgtF4/JPFRu9b/OkcHWq3OrcBW0CwCcq3muPNCq8Rd0aPVga53mGM
         lmSg==
X-Forwarded-Encrypted: i=1; AHgh+RqN7kY5pmRbNbhs9xO0hiwhr2I+TMnCNQ5oa95Yt0tbaCKCYtZe/Zloik+B49Z6vW15y1XtXxStX9Ewvg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQMyFbOUU/ibvguE3pQXFBberufi/kP3ZhAGlK0/QdDaJrMa0D
	OSemwNYUASvfOve9f9vWngxeNL8vl7Xz9h89lrX+d6cUNJ+JRuOGYdasUxThrZHqLe8=
X-Gm-Gg: AR+sD11ACoU65YygAI65ji3+Ndzt/IzuEWitIkGBIY5F31FPcMIaGvWIu5LEh0eMfBM
	e1zUQmpH0IZYt6UTNiwlw8r5a0d/5MuZ+Bh7EuhwxcufhgNF/JIf4P1V9l8y/V9vgy8/iswx4DL
	xw7BH/5xKCMedkvTGSUHOaRDwleYPXmxdgm530wXolvQOU6iQ/0t2l9PATDU/wBk9ByUakGHou2
	uTlnuwXxmrD+Bg7gFIO6zy2mLNEBPOfPCj/F5vHz3qqaVL4DuFl58z4kv7bBRn3hY7jUfFG6Sky
	R0wEFQGnPpvpPhD4xy+RavWNK9HODtTUEjxBmXOTYJH5FNPh42eoOs5ijEeplSIqBo5sAAJ/8xy
	dje5/FOJb5Y28hrUIdk748mMAe+YV9invFLmrawxjbpPMpPBuu8KtF/3/amPCCHfhfO6Ky5pqwo
	R88I6gxwgcv+627heVs2/PVRZiGdWiTRA25xryoORumAVvjfBbYsGiujsBtt+NJs563YffulGCd
	EcjStxmLIbdMiALUUX6iNBJrBbmblXq4cZebEXKhpZXU5Z2cKve9saq1+2l6JuGpljlTax+S1lQ
X-Received: by 2002:a05:6a00:1c85:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84f9c8f6f4emr3859760b3a.14.1786382696548;
        Mon, 10 Aug 2026 10:24:56 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (61-222-153-199.hinet-ip.hinet.net. [61.222.153.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a5898f8sm4149949b3a.52.2026.08.10.10.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:24:56 -0700 (PDT)
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
Subject: [PATCH v5 0/7] riscv: optimize Vector context restore on syscall
Date: Mon, 10 Aug 2026 12:22:27 -0500
Message-ID: <20260810172255.1532787-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102458_483276_07222AEF 
X-CRM114-Status: GOOD (  17.21  )
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

This patch series optimizes riscv vector state handling across syscall
boundaries and context switches. The kernel now keeps track of the
INITIAL state in status.vs to optimize unnecessary context management
operations.

In addition to v4, there are 3 new patches. Patch 1 drops a csr read
from the vector context switch path and 2 adds a selftest covering the
vectorized user copy.

Patch 7 is the larger addition, it adds CONFIG_RISCV_VSTATE_OPT, which
keeps vector enabled on kernel entry and skip nulling the user vector
context on the syscall fast path. That cuts ~80 cycles on getpid and
improves 3.5% reqps on a nginx workload, but it gives up the ability to
catch illegal use of vector in the kernel space and stale-vstate bugs in
the user code.

Patch 7 can be sent independent of patch 1-6. If we have concerns about
the trade off, please feel free to take 1-6 on their own. I am happy to
collect more discussion and respin it separately.

This series is based on [1], which has not been applied yet. The
prerequisite-patch-id entries below correspond to its three patches.

Link to v4: https://patchwork.kernel.org/project/linux-riscv/cover/20260528190927.886558-1-tchiu@tenstorrent.com/
Patch summary:
 - New patches: 1, 2, 7
 - Modified patches: 3
 - Unchanged patches: 4, 5, 6

Changelog v5:
 - Rebase on top of the kvm fix
 - Do not read sstatus in vector context swicth (1)
 - Add a test for vectorized user copy (2)
 - Enable vector in the kernel-mode and skip nulling at syscall fast
   path, gurad the optimization in a new config (7)

Changelog v4:
 - Fix a build warning (1)
 - Prevent setting INIT when it is already and provide performance
   meassurements (2)
 - Address comments from sashiko (4)

Changelog v3:
 - Refactor function names. (1, 2)
 - Merge daichengrong's patch, with a fix and optimzation. (2)
 - Fix ptrace GETREGSET failure. (3)
 - Strengthen ptrace SETREGSET semantics and add a test to cover it. (3,
   4)
 - Fix a potential ABI break in signal and add a test to prevent future
   breaks. (3, 4)

Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/
Changelog v2: rebase on top of for-next

[1] [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
    https://lore.kernel.org/all/20260803215250.824417-1-tchiu@tenstorrent.com/

Andy Chiu (6):
  riscv: do not read csr in vector context switch
  selftest: riscv: test vectorized user copy
  riscv: vector: refactor vector context operations
  riscv: vector: adjust ptrace and signal behavior for INITIAL state
  selftests: riscv: Extend vector tests for sigreturn and ptrace
  riscv: vector: optimize vstate operations

daichengrong (1):
  riscv: clarify vector state semantics on syscall and context switch

 arch/riscv/Kconfig                            |  11 +
 arch/riscv/include/asm/kvm_vcpu_vector.h      |   8 +-
 arch/riscv/include/asm/vector.h               |  63 +++--
 arch/riscv/kernel/entry.S                     |  13 +-
 arch/riscv/kernel/kernel_mode_vector.c        |  12 +-
 arch/riscv/kernel/process.c                   |   4 +
 arch/riscv/kernel/ptrace.c                    |  13 +-
 arch/riscv/kernel/signal.c                    |  11 +-
 arch/riscv/kernel/vector.c                    |  42 +++-
 arch/riscv/kvm/vcpu.c                         |   2 +-
 arch/riscv/kvm/vcpu_vector.c                  |   6 +-
 .../selftests/riscv/sigreturn/sigreturn.c     |  71 ++++++
 tools/testing/selftests/riscv/vector/Makefile |   6 +-
 .../selftests/riscv/vector/v_uaccess_stress.c | 221 ++++++++++++++++++
 .../selftests/riscv/vector/vstate_ptrace.c    | 111 ++++++++-
 15 files changed, 538 insertions(+), 56 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/v_uaccess_stress.c


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
prerequisite-patch-id: 1e2a563c66af3b5397eb66443b1668ce91e1c20e
prerequisite-patch-id: 74285ae638395cf8fbaeb0258c97c57994d3d3a8
prerequisite-patch-id: 544077ce90baabab876cd02335e066c0ccedd6aa
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
