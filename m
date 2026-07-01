Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD29C43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8WkCRhggjFPjA8XzzEtDOIlLKABZuoRMvGF+zXjAB6U=; b=n3tzrQ055sGwEJ
	7OkB6QkOoi4j8shp8BngAWbF2h4QpLIT074Oy6MKLSZI8eyv0TJ5On9bdlWt42J5YUp5ML/v1cnNw
	d6TJmxeWbLhEU7z+vbCPTReVuipRFrArmbayOj15htBa4pMLzSSUicpK3Zcu00a6MAHUyDdTKY5Dj
	Fi4Sa37jaf8NHPqv0c3hCL9OQhxVdeuA+T+W9GGLuEnCkm2oS/mEfsd+Peq2ITRyY9lB+gy6YY72R
	eQnLg25cDX8sH0brQFWG5F8krgUyV424vfuFkbKi8b+hXhQt/qIoGE63Uh4y6W1TB6tBEwJYc82BR
	gNds3pI7qyYTabKjbPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werYF-00000001EJO-0TCq;
	Wed, 01 Jul 2026 09:48:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werYD-00000001EIX-3ZKa
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=; b=oZYyTdLojwFdnpkyx5VfrLpo2X
	BO9J2gTX1u0TgGaC3bW2q9y3yQ8kMToSLRf6QGcFKKCMn5Wkzz2fdeIImCSJq7wWZBldVCurKY/t/
	LBzU6i4AWbT60oQkiG6bVNuCIJ7dG61JXt5XUmLiFt+cN3zI+BTuF2ECcYpylXxar/eWNG0vktcoF
	eTw8+5529GltY060tVG8b/sDAkIN1fn8VoIHzW2kREUit2oTAYtvuC+IkmhQFZUlLMEwld8SKrvNS
	Xs5WnJ1n57lqoI2Tf7zONDOA8lVJELeEhGT0BhhdrdW7y4KoHMWl3o+p6venK/WEQDVk9ijSeZLQO
	WnHYftbA==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1werYB-00000002aCG-0Mph
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8475eca3a66so414424b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899288; x=1783504088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=Et1Ky2kMhaZUXItuWBeebag5XPf6KNX5+rPmcyS7J6uZ2foco+JBis6f2fv/kVU5bi
         YXsRTPGyviTaslAw2g0B7ULNAoD0G5fvK5SzioB6Sxv4i9bLV9Z8Hp2fE/iHPY7jqmGb
         eKph86mbb3NsEDZSaEUBflfSOa0olH0yiNYD6GYe/RkX9vSrJzOnDv15Hf2YLIlGbaoD
         dEmIIRD3v96qI8WN9EqMrcewwSF7m+v+XC60PshFzTWybhfnXp4XZ2y/PIYLhPfh4xhG
         ibJwqjI3P9czx7W1DW7oubAS7zvQRuFrgAay3TnTg0fT2BkHGzb4kK9saX5mG48LY1L5
         +3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899288; x=1783504088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=kQnEJ64kVWRF/Mj6nnhcedPcXJQubo9lcX3WR4e9XaZPl52x1aZ7P9sCZgwIAJ8G/i
         oyD2HE3/esQ7ldupUx9LRnXA8RYX/Q4tvvSs5YtWA/b74xz0rhioh5st1ArDXu6Ndg3c
         PV3QTlf739BiUtgcfrMTJd9SrFiulTlFm7HBFtgfwle0kc4LThxVMa0lh1q1AnSSOIyX
         34pRnNuo3Ek0jOCYHA5/ASqum2WKrpHDPhPC6R18WF/1IEdNgAkmFup0Eax/ilQnIvkQ
         Hgz1sEOrmoXb+WTMIBHNvsCeJZSOJkRmkNlhdx93naQPqs0//bEApb+TQLroNmOIUrf+
         Kzdg==
X-Forwarded-Encrypted: i=1; AHgh+RoPjIu6b9NnUsAURaPF/jbUMs0PpZo7165SegOVoT6y/GrWRrUYfGEf5MTcKmIxWbLzs2hcdNh/F+kedw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJMHrowhOJP8DIuP/vx+jjPTtlegdrSCFn7rOaESu/cE4X6Y7I
	aJxPpygQap/OaC42hnSfOI998Pwo5t6J3nJogLzQNSKBUEKjKWd792gO
X-Gm-Gg: AfdE7cm7B77bjS1Y0Zd0HdnOkiIDj4qWInKqMa8c04Bt/rAQ/ldN7GD12m7GKInxZas
	6pAy4vPTfdWsUlBa+GqxplYsFYAapjfnHMf7TpcQF+JBoeOqCx6VTeptSRjdjikkRW9I1ENIygs
	+cbIqioDlOInXl+skaN6uyswFut8A/Mttyt+9Nc85rI29ZV5KfNW6oPe4+YEuCVvZR3UxkErYUA
	Auv1q7UcXCBUKi/ECzwQxp2/eGgbpXfZvxfe7dayW1wM6n0/F6OWJf69r29ZRrhWsxQNLqMDtK3
	guEpww2C9rLjqzzjDutq+I8nK8a14I9rqF8844CN/obQCNiEDI4QLbXcqmiD5WEZl2yKXnq3xM+
	McwqbAB8xltJAli3TPjhOqkl0jBz5Y3oeR7CNLciw2f0akMSn6Yhf9PsvZwR5rBxNhz+uKwrj/C
	nHCMAOZ0I+NCk=
X-Received: by 2002:a05:6a00:9aa:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-847c51a497emr24293b3a.52.1782899288038;
        Wed, 01 Jul 2026 02:48:08 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0395a97sm3662539b3a.51.2026.07.01.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] RISC-V: KVM: Reset the SBI extension when disable it
Date: Wed,  1 Jul 2026 17:47:30 +0800
Message-ID: <20260701094731.1022163-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701094731.1022163-1-inochiama@gmail.com>
References: <20260701094731.1022163-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104811_214773_371A6D6E 
X-CRM114-Status: GOOD (  12.79  )
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

The SBI extension validation callback can only fix the parameter if
the extension is enabled. However, if the extension is disabled after
modifty some parameters, the state of the extension is still broken.

Reset the extension when the extenion is disabled so it can have
a clear context.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index b737e9a7a12a..3eb7b7c57059 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -221,6 +221,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
+	const struct kvm_vcpu_sbi_extension *ext;
 
 	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
@@ -229,6 +230,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
 		return -ENOENT;
 
+	ext = sext->ext_ptr;
+
+	if (!reg_val && scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		if (ext->reset) {
+			ext->reset(vcpu);
+			vcpu->arch.csr_dirty = true;
+		}
+	}
+
 	scontext->ext_status[sext->ext_idx] = (reg_val) ?
 			KVM_RISCV_SBI_EXT_STATUS_ENABLED :
 			KVM_RISCV_SBI_EXT_STATUS_DISABLED;
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
