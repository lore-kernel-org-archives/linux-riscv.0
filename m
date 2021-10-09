Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D907AC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9690060F94
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9690060F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3hkDd/eZsVk9Di2J8CB2ZVmaWtNEM9iFu6j9AX1Kbo=; b=u4SqrApVIPxamm
	pOoHaRysHI5Bb2KsELNhjur5d+w9ehM6u5xeH6nCYaFNhbSXWnJICJsWGEpSzMPXpg6d1wkz0evtA
	zDRM4JbpLPBjr6nMdFeACmpGUbK278Yx3UeRWIHJgPst7AdhoG/QMX/T/mm2iYX0LNKLi+uBcrBLg
	q23PvcOhgtwPDgA4bV4/txPYIDDgHV8ymJBpF1d52pYIpiPgD/ZXbwmjW98/cmyzTuDL1QdPCX8sr
	bKJ598ef0qNg41/xTpw0GkuC7rOPo/SbrjxR+msBC9FCItQLFO24LMWzgIFkwM75NAwWDdhc3neRK
	gdeIy4DR5Xtdd1d5NVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ254-004aST-UI; Sat, 09 Oct 2021 02:27:23 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rU-004U6G-HQ
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 v203-20020a25c5d4000000b005bb21580411so2358027ybe.19
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=v9oEyavsvbZNuuh7Q+PKViZhWtX7WRERjDZsEYQR4V4=;
 b=SCbmKo34lA8oU3dDYTZHOvAjjDoLBR2GtJ37FhHZtdcyaf6gZ6bVC5uP3+oE2UTrpm
 SJ1/Of1dkXNWhoAvrrrc0TBpKSCl7QbMbUP05V4KS7XrfFN5yznrDd3S3rpM+VJAfNxW
 sgJsB3R3InfKb1YxSdio9cjUyN5vLtdRPSuiKEuzXF8FYwyexaMMd9+vSRILinVV6qSV
 xoprkuvodBmblmVDAvTCkF2/PUTZlIljlA8Ho6n+DzaVU4wysVfev3JmNpwSBGxwUiGy
 zAM+39D7BSF2N/tsIW4ULNBWFxHAGE3XzfEwYZiASKhZBF1Ybs3+4AJhw+TkNz0XHMRV
 DQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=v9oEyavsvbZNuuh7Q+PKViZhWtX7WRERjDZsEYQR4V4=;
 b=LVWEtG7KFPLrODJU87P9xsOl5j6RvTCvjt3i3LVhaMDWa420Mnn7QvW3nZU292397R
 O6PEGME5f0i5aNanJvCPXWSSRbqWLJ6rLgMNFKPr2nBZUElAggFvY3tD+fU6I/fo4kq3
 m11eHN6hWMFcOu6QzlXH0p9G7gH2dstqV/nVAMgyx2Fm62U/m/1QZgcKhAUTk/9kjlzB
 uQBqxfv4KLo2UJaLixLZCXj/X/LuN+VSaMz/VnQdJiUzAF7soLn+g3MQ+bTEvz/Eg45W
 Ttdxj5CHdugoPHSAZIzu2LCPwr5M5ifbWBtgXxFMCAbwdio/wJZc0k4tsJu8CFczCF/W
 VbQA==
X-Gm-Message-State: AOAM530c+F2ajl9bCe5gLye1x60wjiP80blo6J38mDi1qnaICNLnNocq
 VSSSjAqvsnT/1WbRkzYs5FrNZqPLJLU=
X-Google-Smtp-Source: ABdhPJwUqQu18tVTrfSb9It/bTdj70+Yz1bQzfPNIbddjOrg1SwRs7KNWGr+9IBciM02rc1wp9LnG/EuPwQ=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:4cc3:: with SMTP id
 z186mr7298391yba.212.1633745598902; 
 Fri, 08 Oct 2021 19:13:18 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:08 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-16-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 15/43] KVM: stats: Add stat to detect if vcpu is currently
 blocking
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191320_663448_9DC3CC39 
X-CRM114-Status: GOOD (  12.38  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jing Zhang <jingzhangos@google.com>

Add a "blocking" stat that userspace can use to detect the case where a
vCPU is not being run because of an vCPU/guest action, e.g. HLT or WFS on
x86, WFI on arm64, etc...  Current guest/host/halt stats don't show this
well, e.g. if a guest halts for a long period of time then the vCPU could
could appear pathologically blocked due to a host condition, when in
reality the vCPU has been put into a not-runnable state by the guest.

Originally-by: Cannon Matthews <cannonmatthews@google.com>
Suggested-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Jing Zhang <jingzhangos@google.com>
[sean: renamed stat to "blocking", massaged changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h  | 3 ++-
 include/linux/kvm_types.h | 1 +
 virt/kvm/kvm_main.c       | 4 ++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2d837e06eeec..bdaa0e70b060 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1462,7 +1462,8 @@ struct _kvm_stats_desc {
 	STATS_DESC_LOGHIST_TIME_NSEC(VCPU_GENERIC, halt_poll_fail_hist,	       \
 			HALT_POLL_HIST_COUNT),				       \
 	STATS_DESC_LOGHIST_TIME_NSEC(VCPU_GENERIC, halt_wait_hist,	       \
-			HALT_POLL_HIST_COUNT)
+			HALT_POLL_HIST_COUNT),				       \
+	STATS_DESC_ICOUNTER(VCPU_GENERIC, blocking)
 
 extern struct dentry *kvm_debugfs_dir;
 
diff --git a/include/linux/kvm_types.h b/include/linux/kvm_types.h
index 2237abb93ccd..c4f9257bf32d 100644
--- a/include/linux/kvm_types.h
+++ b/include/linux/kvm_types.h
@@ -94,6 +94,7 @@ struct kvm_vcpu_stat_generic {
 	u64 halt_poll_success_hist[HALT_POLL_HIST_COUNT];
 	u64 halt_poll_fail_hist[HALT_POLL_HIST_COUNT];
 	u64 halt_wait_hist[HALT_POLL_HIST_COUNT];
+	u64 blocking;
 };
 
 #define KVM_STATS_NAME_SIZE	48
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 42894ff7c474..a36ccdc93a72 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3211,6 +3211,8 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
 	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool waited = false;
 
+	vcpu->stat.generic.blocking = 1;
+
 	kvm_arch_vcpu_blocking(vcpu);
 
 	prepare_to_rcuwait(wait);
@@ -3227,6 +3229,8 @@ bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
 
 	kvm_arch_vcpu_unblocking(vcpu);
 
+	vcpu->stat.generic.blocking = 0;
+
 	return waited;
 }
 
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
