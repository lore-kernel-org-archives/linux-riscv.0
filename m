Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0CAC352A1
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnJRjXbkJMYpsrbBMrny7bYeg0yz8E1w+41JQ4wl93Y=; b=PLTjrLToRrUBAG
	CW++dmDOLYVVu6pLOGCBKjneDWzuZMBEJgep2fZSa5KEs61vdsVuN9RWDAqZTAFrlkNSv1SR207ku
	fy6zxIsmCN9bKoQWLTh+1+WQZZJxXTQTRXWDWb+p+4PB5EZLOTiRJlbcW6W0MoXVKnqF7/tRBC31p
	Ja83AxE/CKVgjXJj3h1faOOEcHa7TIfyF6KHaUMGEosNm1j4lJH7mbkD2Uu3MKF/WsmCfiIpv67MP
	YGXy/USzc/aU+g3w940ZWAgEoTDYjjUNNd6E3L04imdT8/prG/M1TCYqYrN9/qwO2xxa6WeoMUy7u
	qtnSwQ93d+4+pBzPZdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0X3b-003TKO-A0; Thu, 01 Dec 2022 00:04:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Wba-003Gqn-OO
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ELQ4r/TqKHaBJHvAWCVxPtXKZjhdmN2xYeWWLtdN78s=; b=TtmvXA2XGskcS3MYtGzjGxUKV3
	L3i20Ovns3dFPLsGM/AYyHLWnEdHKc/qCljyhbmFtiNgbzcGYVDm33Ctpg1xLWI90uPoKRCpBtvR1
	OApHWjFADufmlD/hE+WY1RTHmakMkMNGlmNfvCKF6t/cj1lKAg2R2K+5uBOA3sghb2h4AyAW3gJ+x
	wFf4TaMK/Ch4o60kxj/dPs1CfxClq85uKBuU9nVOV8Ne/ftQwbhsyWmbsRsOXC3g2AZh2LdlMuGyw
	0OHUS5iH9VpLtXgBh/nVjNflaQWHPecF37O12kr51Hy1PqZPVfi+bs96zP11WZ9ABhUCRGgMAxM1F
	JtYEku6w==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDY-00FPmW-Nv
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:18 +0000
Received: by mail-pf1-x449.google.com with SMTP id v23-20020aa78097000000b005748c087db1so207799pff.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ELQ4r/TqKHaBJHvAWCVxPtXKZjhdmN2xYeWWLtdN78s=;
        b=rV6sXkwW0NobTm3rjPA4K5oJXg7Chbj9zLHGkDIEdGJ4GDvAf1gR/xdVUzmRVjaVxZ
         Lpv4mXcdPvHfacU07BhEHSV/clf7T6Wt4K9p7HTpl3MuGOSlPJopPlIOdMhwNJq55wJQ
         C2XphKPH8RVseXHYjMsaGq/j2Utscd+e1YQpyMJwrt0VKjAxdKimwtuQPugYzzhiHh00
         1sder2j0DzOfxhA6vqd3HzFSqamEahbTJmdvrPEKWeFh0CbO4l9ispHgKo3f6y1MgB15
         Il0zG/AUJb/AsRXvsLsQjRJk0smNChBO607PrkbuzuuP3tG+dumldlOL4wJ4R/wyXPyf
         wKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELQ4r/TqKHaBJHvAWCVxPtXKZjhdmN2xYeWWLtdN78s=;
        b=lObshPB/SNeMyTRGKwu6Qe3BxqPyGQSvvb32MAAY4cXREAVA/vHBJyKvqKh6xuVTkl
         I+5njeJmqaYsqnTuuxnoogtLBOxkalxR4EkEVr7LVMAY/R+PuQ6nA9E0O6UXlMThV/lG
         D2uYjs8XbbOtZKQcWMvsSBN582ynkjy5F3kbw9twbmXia6/2Ggj85yuJUpcRS6haLKAG
         NY2bYni8V2MUD5tpqLK2tH/cBlGIrQ5IIlsSzknSaaHoKvfovK3OQFKmG6cMqnfbNx9A
         LkgLK24yORAiFlqaaaBbRa8mFdayIkAcnFsYMuif9DQosqUeAkTTWHNRqrDW491W1ai4
         qrLA==
X-Gm-Message-State: ANoB5pmuTqX19EZrRK+t5bN9palNxEm9KNoFrvRL1KmpN/LWRrQ0Dwkk
	cFQ3COnSdhnZD06OKpe1WDhbAJSBhdE=
X-Google-Smtp-Source: AA0mqf6ABFslzbC+5qGGF8++aLIGKcv8VtrwUOxMpqn3yz+UIKnkh0KvASvkaqQSOu9f+r1p0oHxko8zbBk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:f89:b0:219:5b3b:2b9f with SMTP id
 ft9-20020a17090b0f8900b002195b3b2b9fmr848420pjb.2.1669849807964; Wed, 30 Nov
 2022 15:10:07 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:02 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-19-seanjc@google.com>
Subject: [PATCH v2 18/50] KVM: arm64: Unregister perf callbacks if hypervisor
 finalization fails
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_231016_820663_49C8B9B9 
X-CRM114-Status: GOOD (  11.19  )
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

Undo everything done by init_subsystems() if a later initialization step
fails, i.e. unregister perf callbacks in addition to unregistering the
power management notifier.

Fixes: bfa79a805454 ("KVM: arm64: Elevate hypervisor mappings creation at EL2")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index fa986ebb4793..e6f6fcfe6bcc 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1839,12 +1839,21 @@ static int init_subsystems(void)
 	kvm_register_perf_callbacks(NULL);
 
 out:
+	if (err)
+		hyp_cpu_pm_exit();
+
 	if (err || !is_protected_kvm_enabled())
 		on_each_cpu(_kvm_arch_hardware_disable, NULL, 1);
 
 	return err;
 }
 
+static void teardown_subsystems(void)
+{
+	kvm_unregister_perf_callbacks();
+	hyp_cpu_pm_exit();
+}
+
 static void teardown_hyp_mode(void)
 {
 	int cpu;
@@ -2242,7 +2251,7 @@ int kvm_arch_init(void *opaque)
 
 	err = init_subsystems();
 	if (err)
-		goto out_subs;
+		goto out_hyp;
 
 	if (!in_hyp_mode) {
 		err = finalize_hyp_mode();
@@ -2263,7 +2272,7 @@ int kvm_arch_init(void *opaque)
 	return 0;
 
 out_subs:
-	hyp_cpu_pm_exit();
+	teardown_subsystems();
 out_hyp:
 	if (!in_hyp_mode)
 		teardown_hyp_mode();
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
