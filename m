Return-Path: <SRS0=6gMx=OM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50BFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7743C61184
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Sep 2021 00:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7743C61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxDYgYEUjVkpDdcJuBORH92cmT6RLnhHpJ85WR5M58s=; b=Hzzy6DSFvRcgPJ
	8UWITbsSKQpua3EOvkEjWLPOZaI48ruvHsS1V7cByBJoiI4/8PZc+eoYt6L+IpH/Pgab8KoRk8PhX
	AJ2QtzH6n3L8v328XKq3ScVcEABhHpHc+JOCbgbyqw1oApTqtEvU8uFRn/kit47AqKPBKA5Il60ab
	al2KjNhdMyeQ6KsSrl+pKmokGZNp8dZbBekGISQStMXfFLrZ+5ubHYN0LGeuMdCOR5RpSa5ltCc9o
	hMha0Wv0VyfrVSUJpCXVAL4yM98bKl+ufOrm72Zv5umU8ARIiRnNkX3R0NA9xV/w8xHUFyDxROKO+
	LdvUuu6J9oR9uQQMpkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSpx8-006Mcb-9n; Wed, 22 Sep 2021 00:17:34 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSpmB-006Hep-VG
 for linux-riscv@lists.infradead.org; Wed, 22 Sep 2021 00:06:17 +0000
Received: by mail-qv1-xf49.google.com with SMTP id
 p75-20020a0c90d1000000b0037efc8547d4so7274842qvp.16
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=hykBvrf8DnzH3Q8YHjL/Y0GXRoABX5ADBK+0/12MWfw=;
 b=jKopPzwiybt9fB96grPLhcmov4eHABK3Rn1V3+jC89gDcrIoprd65bnGYY9DP7ju4b
 85kkPs7ZPkL8WlWgMXplyIY3a/z2qIzxH+/FI3XjcdmrliPkx8nPrp2a5kX5Pjc1ywob
 ByTND1+iT+q5EbaKv8lVZV94ko5nNdJrrzXW+BlrNXXtl2FDDO+EPFHPKuUM6DjPG5xB
 A3Kj4DmZiicnBCVFqv70LMvPNdNZybwucvdKO2/8ODrWoNpkysFbo74lUlyrUvFEKlBi
 o1a2jdJRabm/xdF8RFOfzaw+a+ydqqTbWa982xz/HRYZHvnoWhQfVxgfpJMjXOW1pVY7
 0TqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=hykBvrf8DnzH3Q8YHjL/Y0GXRoABX5ADBK+0/12MWfw=;
 b=74JkW0VnrEf/3nDXl5s4V5LLoUfgdTqHGGwM2nkNBjOeviAOV/GYHSqskaw2V6kTZp
 +ddPtX1RKzycn/D6fpv8uau8YMbe2krIC9zALLC96D2p8tmIPFC70aXHewZNBoCY1FtT
 1tWlDAtxk6f3WyXQNYILb23x+u3AGzPUYcbFshKVgm9Jyac0m+h8QQNUBHjbH+jMhqMv
 pbDysIqBHo6SLEAtgyfbTngazu2901ilIP14vJFH0Xr7W9rvb/7Ok2pPFdqM8hy57EFO
 2lgTtYb3H5cjv1BbunpjYe59bTgxyAdBpAFrXoITIg3VP7prbJBXv3siOkTbZCzqxtk8
 /t9w==
X-Gm-Message-State: AOAM530EXA7M8xYEZpK+U2vbKCs/wuDgOwmvdU6TL7RTkhDek3rXv5is
 abqrXSER763GG0qXQPHomM6uYEyREVg=
X-Google-Smtp-Source: ABdhPJy5GySvAYc4kjGUgxPeiS0d5MaL33kPbz4EVAybMqnGUcP/K+XpH6FqRymRPMD4ga0cIEmdn6OzCzE=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1143:: with SMTP id
 p3mr39279294ybu.420.1632269174363; Tue, 21 Sep 2021 17:06:14 -0700 (PDT)
Date: Tue, 21 Sep 2021 17:05:31 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-15-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 14/16] KVM: arm64: Convert to the generic perf callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>,
 Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
 Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
 linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
 Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_170616_096530_6F256D5E 
X-CRM114-Status: GOOD (  11.22  )
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

Drop arm64's version of the callbacks in favor of the callbacks provided
by generic KVM, which are semantically identical.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/perf.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 3e99ac4ab2d6..0b902e0d5b5d 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,45 +13,15 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-static unsigned int kvm_guest_state(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	unsigned int state;
-
-	if (!vcpu)
-		return 0;
-
-	state = PERF_GUEST_ACTIVE;
-	if (!vcpu_mode_priv(vcpu))
-		state |= PERF_GUEST_USER;
-
-	return state;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return *vcpu_pc(vcpu);
-}
-
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.state		= kvm_guest_state,
-	.get_ip		= kvm_get_guest_ip,
-};
-
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
 		static_branch_enable(&kvm_arm_pmu_available);
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_register_perf_callbacks(NULL);
 }
 
 void kvm_perf_teardown(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_unregister_perf_callbacks();
 }
-- 
2.33.0.464.g1972c5931b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
