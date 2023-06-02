Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2F7C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uzsYC+XEaQYstdfJRCOsT4QhSsTzi+OQUBqcqCRB3bs=; b=4PXElRgy4qVjH7cC84vkox5tz1
	4hk9PDHll5oD/PzDR/cTBc690Ur6Ddv3zDNeVRzZHJdcX6xnQUUOBuahGAc7Tgrrv8xgi3f0O9r7I
	jbqebAblAvGIP6DOOtt227Wvefv2Atj+s8AH5d+eV1bPcg7VeHkiT9okoaOq2cm0+FzMF1e9eVX0x
	V3GTrk5EC9LTYcFvX4pvy1UlwRweHOKoHUfBV+AIqhpL07AiFrsHrqVAfB+36zJAhMIcuiBNiEUQF
	YSmk2LMFrcK4eaVyz9kXZmztUO3cxq9EsDNeh0rWL4ZFdkpe0V2cGTHTmrltVDPTQfxoBL4+iWtI0
	tSmrRyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q8-007R6R-19;
	Fri, 02 Jun 2023 16:41:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57q7-007R5g-0q
	for linux-riscv@bombadil.infradead.org;
	Fri, 02 Jun 2023 16:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NyrihgmYesBmBKLp4ITVdJ3LGNh6LVDPlJHbJ3BWmKo=; b=VwXFF2oBvMh1txyZtgY8+XKuxA
	W717UCwypD+YexGfNk6wvYuZS8QHj25WIFYcmo7GqVMIaTvigqxLWCIUJJog02JGbseMst0BAmQem
	Y2Zn5PInhYfEl12gxPZlw9gIhj2wTrvXxVkyugb/1/EbGiAmadt8VMiTpU/ovzGbyIDNvLIyXRXW2
	ncQNmuF07S1jEEQpjoNhtqKC1EDPQjLdx6qv6GPpheS1WF1Y2BWxd+x4AmmAQftQVDK1kFC1oiv9v
	awCNaGHYGi2qNqAKJpzEFLHheeLNd25knK8i1uY0AS3n+rzopmn5vjVsP98CuMFjllyyzMk9P4z9B
	wNQiqoOw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q57LQ-001N9X-0N
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 16:09:44 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-56552a72cfbso33353447b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 09:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685722178; x=1688314178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NyrihgmYesBmBKLp4ITVdJ3LGNh6LVDPlJHbJ3BWmKo=;
        b=6JvB68luEiFeoyKEfjP/g+vMwC/sRddTQaYllS5g+5bpQDmhXIgwwZiHHiYhNY6/hh
         +N3LQSiNtnyna/XZaiM18ivCXXQ4yuX/15A1AGZwy0Qa/f1hIAf3oKXB2h5AuHkYQgCs
         xj8Y82H0f8TZvkTqQ0Hx5MWBndbNiI7NCzZ3czEuYGWHs7LAUCirzskxbkVOl+noMZFx
         tm27fSCTKAwfbeEstcfEbI/nW6D9qAihf0lb2MdszgnmyhfNayDhGNG1boLJ+W+UNY9A
         PKxN0bCcFoMuNsJAFUnK+mzP9snrdOrZPjuzoVjhjXEuIkdNPWm6zU7rdhcbdNuxMxHK
         DaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722178; x=1688314178;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyrihgmYesBmBKLp4ITVdJ3LGNh6LVDPlJHbJ3BWmKo=;
        b=QhbmWDruA04y4uN5t6ysbqgHT2XAey5a885S0gkFn9126DsHWE4JsdViqmW09JpVA3
         KgmMymzmR7zZT/oHNRB203Ew3kOlwU86VvIaJEzhvY9zDrp3yhuz+waAhamgKFLQIUwX
         Wa91j2r9ZtqR8+Wq6ZFPcp2/98ABX4xlwZJVxqXGDgeJS8QPMgOZuS0D46GzfdxWsApt
         dvEg6BtLN9qqZQnzuvUh3bTvmf1VlxZQHxFajkmJP9GE8iztUcIvG/X07XTSXYEA386z
         rXzh5d+rRIkaaaAZv8Y1nrP5HKhWP+ur3lqYPkyqiLwiHXOCuTq63hRS2YnzVWoMBaKF
         u81Q==
X-Gm-Message-State: AC+VfDzxbWTZaWirJvDbnowfEbcfRFhbtT0/9u5LOOlA9mf6oCpH8X7u
	N+yNwYXKHIlPNupcQ10bU3UG+8lY+Zfi
X-Google-Smtp-Source: ACHHUZ7z74Jy0Y96qFW+7u40ZiTgX4ucCC/5bWAvnbf5ZGF1cU7Xjv0z02cQ2QpbWgJAAII5qTnOdyVeR9zk
X-Received: from vipin.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:479f])
 (user=vipinsh job=sendgmr) by 2002:a81:b620:0:b0:561:b8d1:743b with SMTP id
 u32-20020a81b620000000b00561b8d1743bmr170869ywh.10.1685722178126; Fri, 02 Jun
 2023 09:09:38 -0700 (PDT)
Date: Fri,  2 Jun 2023 09:09:07 -0700
In-Reply-To: <20230602160914.4011728-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20230602160914.4011728-1-vipinsh@google.com>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
Message-ID: <20230602160914.4011728-10-vipinsh@google.com>
Subject: [PATCH v2 09/16] KVM: arm64: Document the page table walker actions
 based on the callback's return value
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
X-CRM114-CacheID: sfid-20230602_170940_464377_D9215ADF 
X-CRM114-Status: GOOD (  13.79  )
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

Document what the page table walker do when walker callback function returns
a value.

Current documentation is not correct as negative error of -EAGAIN on a
non-shared page table walker doesn't terminate the walker and continues
to the next step.

There might be a better place to keep this information, for now this
documentation will work as a reference guide until a better way is
found.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 8ef7e8f3f054..957bc20dab00 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -711,8 +711,19 @@ int kvm_pgtable_stage2_split(struct kvm_pgtable *pgt, u64 addr, u64 size,
  * after invoking the walker callback, allowing the walker to descend into
  * a newly installed table.
  *
- * Returning a negative error code from the walker callback function will
- * terminate the walk immediately with the same error code.
+ * Depending on the return value from the walker callback function, the page
+ * table walk will continue or exit the walk. This is also dependent on the
+ * type of the walker, i.e. shared walker (vCPU fault handlers) or non-shared
+ * walker.
+ *
+ * Walker Type  | Callback         | Walker action
+ * -------------|------------------|--------------
+ * Non-Shared   | 0                | Continue
+ * Non-Shared   | -EAGAIN          | Continue
+ * Non-Shared   | Any other        | Exit
+ * -------------|------------------|--------------
+ * Shared       | 0                | Continue
+ * Shared       | Any other        | Exit
  *
  * Return: 0 on success, negative error code on failure.
  */
-- 
2.41.0.rc0.172.g3f132b7071-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
