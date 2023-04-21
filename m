Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F813C77B78
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MxLJiGFE1veCXy9S6DMBp+rmZvNRdVo//fGohZ89vUU=; b=IKb7Y5wCwv8suzRPz5O4kWTnJ7
	XJHdQljAVm+ef6xBZaO6MsFe/jPWQ9YSI9yPlJsalk5h09NMq/6YXM+hXgHxyoNss5Qn+X23ktNar
	nODdhQV2INSHtQ9VDUIT4hf8i5h9thO5LKgWVaCwQSzKy6Fb7deDxy+seuob0cYoqi3X3Azgsdt+m
	r4WPc7dPw0tMXIArjHOlkHUG+sDK9iV/3IDeCq+U9ssOct/nWxozWL5OyEhLjk5IfhhhifKXVsXsV
	8dMg24rebZwHPIyjPdlo5xLlP59RY8rKA9+wV166s8OEv6Y2Rj6uMeFEyZjVPS5d84z13oZ+82sxj
	DkEhku3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppv4E-00BYwI-1K;
	Fri, 21 Apr 2023 18:01:06 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppu0b-00BR6B-0P
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 16:53:18 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1a66bd44f6dso15805945ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682095994; x=1684687994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PAF8eecHjdHkncCHVDxnuwZD238/O/D5uX087DV6gk=;
        b=PTkyUTn2160dQG/w0LBEubHoXT6/kolM07eAXpOkI5VQKBjVge2/G3D9DJWv4EmluF
         jwrYT87c/pr1Xst3R4sPDfwUW1QW6N7gw0yt507TfR8+t+X9AZokv5qPyHgjsmekGrNG
         N5lb8NDbmayYdr4sbEsTRxgCzT7JDO2aRCdXd3ULGGsFS/IzMoTjppouMIJbEHzjtzJn
         0UQdx9F3D1PLMFaK3GeO580/u61tzYb2QXdQjUSDj2cShYPf8ASAPVv3u7/P4wOk+ciC
         66tN/SEGEQMjy6UGRqCfjY+yHppjjUO6tyxdYKf7p4Z/hg9iu3GtO1l0LIPj0nE4z4c0
         zDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095994; x=1684687994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PAF8eecHjdHkncCHVDxnuwZD238/O/D5uX087DV6gk=;
        b=Qs/keRm0CDeDYTJGbRCSC+6wfYZ/UG9RCRfOF+9HBkLT7SFvcrBSUK84ri1+XYDpxs
         dRqIcm8ABM0uJAnlLTL52VwcuqIEySde7f+v7JwZjbmGjV4+nTpKtu4jWocjOMFtCXVx
         PFvJzWq7S+VlDOcMyhMpeCRCrRl1klIrJs7SZwT/slOMqxr71ZmBEeJJ+/QqMsqphReh
         rgXum0+DtrTTOWkGpf2TDJmTZMmmj8RC72vnuiVDryme0uwUc1EN6IsQakI71xHTMXzA
         Y16ZZwdX3VFCPeNwNocb7qDsb9/O1lsqPyutGYdUyfZ+wueWIIk0qO1SjAPaExUWjb6W
         QxoQ==
X-Gm-Message-State: AAQBX9fyDtAPT45gh35nMgWQUm3ruA4bC/b6W0GOns58qBxUHXAf3LUv
	X+a3jTR2FFLOgqvXNMw+yAbOvhQDQdWY
X-Google-Smtp-Source: AKy350ZhDTjaiDsWlopRxc48Dw1pNwwJqPHfzna6+NHQQh4Cp6jlmLNI1MOs2L3SqIF7smNjuMPM7IP//W/I
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a17:902:7b85:b0:1a0:4321:920e with SMTP id
 w5-20020a1709027b8500b001a04321920emr1816879pll.12.1682095994335; Fri, 21 Apr
 2023 09:53:14 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:52:59 -0700
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230421165305.804301-1-vipinsh@google.com>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421165305.804301-4-vipinsh@google.com>
Subject: [PATCH 3/9] KVM: selftests: Pass count of read and write accesses
 from guest to host
From: Vipin Sharma <vipinsh@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, aleksandar.qemu.devel@gmail.com, 
	tsbogend@alpha.franken.de, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, pbonzini@redhat.com, dmatlack@google.com, 
	ricarkol@google.com
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_095317_176444_695740D9 
X-CRM114-Status: GOOD (  13.77  )
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

Pass number of read and write accesses done in the memstress' guest code
to userspace.

These counts will be one way to measure vCPU performances during
memstress and dirty logging related tests. For example, in
dirty_log_perf_test this can be used to measure impact of dirty and
clear log APIs on vCPUs performances.

In current dirty_log_perf_test, each vCPU executes in lockstep to the
current iteration in userspace, therefore, these access counts will not
provide much useful information except for observing individual vCPUs
read vs write accesses.

However, in future commits, dirty_log_perf_test behavior will be changed
to allow vCPUs to execute independent of userspace iterations. This will
mimic real world workload where guest keeps on executing while VMM is
collecting and clearing dirty logs separately. With read and write
accesses known for each vCPU, impact of get and clear dirty log APIs can
be quantified. Note that these access counts will not be 100% reliable
in knowing vCPUs performances since vCPUs scheduling can impact
the progress.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/lib/memstress.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/memstress.c b/tools/testing/selftests/kvm/lib/memstress.c
index 483ecbc53a5b..9c2e360e610f 100644
--- a/tools/testing/selftests/kvm/lib/memstress.c
+++ b/tools/testing/selftests/kvm/lib/memstress.c
@@ -50,6 +50,8 @@ void memstress_guest_code(uint32_t vcpu_idx)
 	struct memstress_args *args = &memstress_args;
 	struct memstress_vcpu_args *vcpu_args = &args->vcpu_args[vcpu_idx];
 	struct guest_random_state rand_state;
+	uint64_t write_access;
+	uint64_t read_access;
 	uint64_t gva;
 	uint64_t pages;
 	uint64_t addr;
@@ -65,6 +67,8 @@ void memstress_guest_code(uint32_t vcpu_idx)
 	GUEST_ASSERT(vcpu_args->vcpu_idx == vcpu_idx);
 
 	while (true) {
+		write_access = 0;
+		read_access = 0;
 		for (i = 0; i < pages; i++) {
 			if (args->random_access)
 				page = guest_random_u32(&rand_state) % pages;
@@ -73,13 +77,16 @@ void memstress_guest_code(uint32_t vcpu_idx)
 
 			addr = gva + (page * args->guest_page_size);
 
-			if (guest_random_u32(&rand_state) % 100 < args->write_percent)
+			if (guest_random_u32(&rand_state) % 100 < args->write_percent) {
 				*(uint64_t *)addr = 0x0123456789ABCDEF;
-			else
+				write_access++;
+			} else {
 				READ_ONCE(*(uint64_t *)addr);
+				read_access++;
+			}
 		}
 
-		GUEST_SYNC(1);
+		GUEST_SYNC_ARGS(1, read_access, write_access, 0, 0);
 	}
 }
 
-- 
2.40.0.634.g4ca3ef3211-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
