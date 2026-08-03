Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38566C55822
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 21:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCakMxtMTliYxt1vAu22CTz/OwyuNwtLz7UzkCRHHpk=; b=u3NfNzRQ7jqmWZ
	nHEKSJZIDDOeXOzMcEbJwpqAFVsFxKHLhr7PqUOCGdD0icRrxlP8M/N6URL6fvAZzmbXcz3HbSn1V
	94uWyI/F0MdWGuFaCFh6EG9Br2lkKkOnuF6tkfTvlnLDgt0s6JxFMkRKV/xfAgzkzP130ooht9gGE
	+3O/eeIqlOi/xwn6BWLobEQcA5IazKK6UqgPTUMruQNvcsApBN3lbRRBKFoxKXpXflx/1lJfHc1Yp
	OztHiC7puOU4anFQbR9red3rD2Gn33x8kMWa7GxDK8PuMcp37qXAuYu+RLKNWbm/K65yDKFFs1D+O
	i5ymZrP49KN1rAeNDEmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0ax-00000000YhD-2PHo;
	Mon, 03 Aug 2026 21:53:15 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr0av-00000000Yg2-1pru
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 21:53:15 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7eb545db3afso2591482a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 14:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1785793992; x=1786398792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hFj5fkOWDX6E8mPElA+UXDuk02rZ/QIYAtSZ8WctP1Y=;
        b=EwsGPlulTuOhgXXsBe4wK6bl7qGspWGbmZNwkl9hOZUSFz5DtTgF+OfFqQ8LtyO9o5
         5qsMiwAnHdujh8Mk/uLSCfO6uB/SrV40mJO7It9qRJhOwVhZv1S+EFFo/l4/eo+ukDCF
         G/26FVzTyv8LjWCLjVaWydevZScGDcTvHpIBoBnxw1X62yGqbDI5axDVtSBjL3fsqFij
         127K726TwHKoAohbPkKc5WQI548oh66c113g6REKKMV+MKeWBV120HEnP12mxaGCgi01
         zw6bWwR+G9qDwGSzkHjdgv1NqEAyTrZlPSJUhcUPYaaQCJwDsk1jOfWYLKhnDe7P01p/
         cZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785793992; x=1786398792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hFj5fkOWDX6E8mPElA+UXDuk02rZ/QIYAtSZ8WctP1Y=;
        b=ZfcDjuUzgvo3bxTDU7uXgHLobrAusxyeA4BRYjpPdOgx7kxQWmktrL+ZuujEMcScb2
         Ag/eLATMhYjnNB8ffvZHHuNqwlNIgsMtaMvq4GjQn4oJGHHAOcq1uHL0U9epyf7EbiEN
         +vKhEPwzN3Mn7Y6R37TMikAna3lwOJHjXcsbBrErBDkXA2hWV3k3U4bj6dSAySxeKJmy
         OdWdoRt8hBRCXMR5O1UVDHiJKRbmFrpNUKzc4e2elTwRF/qs3FGlHizT9lNAT5n5+OUn
         xk+R0oy8pElGgy2DJIsoSv7sE6vjUoQK3nqeUC4JKgP5E8Zcs8hMzQ9CwVQslDLzg07n
         gHaQ==
X-Forwarded-Encrypted: i=1; AHgh+RqueXcqo05aYkm7gxjNqmNu3mu4utLgh01v2RSPAL82wTVfCbGWxOXSlvRtA6/Tv1f25BJDAi/3vyLs3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz0wEJzA1CFxCPZ4UnuzGaAPI89Y1fI5ZOyDb/zhnQQmIC53aV
	MGwnhCbpHTr81wHCc6OtMMFN4Nm6kMdyhO18RpoFB9OyKi/zxxu+fLpe2gFj8aRr5Fw=
X-Gm-Gg: AR+sD11ePdJkLJGSSauiAKKE5CfRVg+whU936KQIoyZwiFtK76+EDayW6L2N3zGpv/p
	BPalqFA7VI3J9XxfPWqAYY14UfA05VlKMQ5peHYJXc2OHqu7rvv1QuBcGvuUZuuVnri4BGmqyzV
	2bpX/5o6pd5nvHrixFVP7+pILRRpsdztU0KpDvtN01lIeu33pquBYRfjuxjOg3n0d4almQx1i0p
	q5MvehPf2Wc0NxqmRfnJQAw+SDkZ8QP4ryrPU5HZM94tQGPCnILj1T/CzmhcqNjCQTmjz/1k2RS
	aG8N23egHHjRslg/A/BLXnOR4vpjNHi3iZz6vS8CbAoiyzUo/gAF5TDWRwb1QJlx46GjQpabxUW
	fBoNVIYiFxZ4O7EOo5qvMtHH8Es7/uAN5CNwKRd39LP5o8DfOw/5LJvZYnXymI43C7EztOcRdFR
	nRohOmcuawy6VXV2r9r/YQf/Ciqn2Ios39K4cRVaWt8sA/F5uq7YSyiUgXRPaxu40yrvbx+OpsP
	HJThkXudA45W5Tb8o+vnMy12YeB9UKZoX89lw==
X-Received: by 2002:a05:6808:2221:b0:4a4:866:c39e with SMTP id 5614622812f47-4af5e1ce788mr16822670b6e.11.1785793992035;
        Mon, 03 Aug 2026 14:53:12 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58e9551dsm7403958b6e.11.2026.08.03.14.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 14:53:11 -0700 (PDT)
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
	andybnac@gmail.com,
	linux-kernel@vger.kernel.org,
	olof@lixom.net,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v5 0/3] RISC-V: KVM: fix vcpu vector context handling
Date: Mon,  3 Aug 2026 16:52:39 -0500
Message-ID: <20260803215250.824417-1-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_145313_598354_744331F2 
X-CRM114-Status: GOOD (  15.27  )
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

Reason for this respin:

put_cpu_vector_context may casue a volutary ctxswch. If we prematurely
set RISCV_PREEMPT_V, the context restore path will rasise NEED_RESTORE
for this kernel thread. As the result, any irq taken during the
subsequence preempt_v would trigger a restore from the empty/stale
context memory on the irq return path in riscv_v_context_nesting_end()

The fix is summarized as below:
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -181,8 +181,8 @@ static int riscv_v_start_kernel_context(void)
        /* Transfer the ownership of V from user to kernel, then save */
        get_cpu_vector_context();
        __riscv_flush_vector_context();
-       riscv_v_start(RISCV_PREEMPT_V);
        put_cpu_vector_context();
+       riscv_v_start(RISCV_PREEMPT_V);
        return 0;
 }

We will send a optimization patch that removes the costly riscv_v_is_on()
for voluntary switch detection. A kselftest that stresses the vectorized
user copy will also be included into that series.

Patch summary:
 - unchanged patch: 1, 2
 - new patch: none
 - modified patch: 3

Changelog v5:
 - add the r-b from Yong-Xuan
 - fix a guest boot fail that hits ~1/100 in host kernel-mode vector
 - Link to v4: https://lore.kernel.org/all/20260725001749.2579274-1-tchiu@tenstorrent.com/

Changelog v4:
 - Include a header to solve a mid-series build fail (patchwork ci)
 - Drop preempt_v_started test in may_use_simd (Sashiko)
 - Link to v3: https://lore.kernel.org/all/20260724165001.2317788-1-tchiu@tenstorrent.com/

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
 arch/riscv/include/asm/simd.h            | 16 +----
 arch/riscv/include/asm/vector.h          |  5 ++
 arch/riscv/kernel/kernel_mode_vector.c   | 88 +++++++++++++++++-------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++
 arch/riscv/kvm/vcpu_vector.c             | 22 +++++-
 8 files changed, 139 insertions(+), 40 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
