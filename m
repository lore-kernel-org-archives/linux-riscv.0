Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B42C3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKBt3qYxLUxtmMmNqqKGUstq2woU4gJXkV1royTRH6w=; b=IIL02nz7cNadxa
	b3qbzh67WDKuPWPwF20u1Capx5joSyrwpXUKKX6RrJnIrXez/uglvbsoJ0Hawfa+FX1sFJF41r0AT
	EAdok63yeCVowqoK0822OSXj2bxr9OkmdwoJGIlc/5pFhDvgYYUW5dtXR1WgObXhU2HyBVIgtpLTs
	B6rPhgTNDzPhSf9YGzKd/VHt8gQcvRDkJhhR0TYBIArBZopCJNDv5fwju4dDgLKNvIWyl1FXCFcPY
	m7ij+4zXHXW8lGwQ+tsRkJft9bxOIYYDs6IUzPfgosmrIiqJ23RACIMrZSsndlA9FgxLW05MADU+K
	NBRkCpbm1wAtUj4i03uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUqc-00000005TlU-00OU;
	Fri, 26 Jul 2024 23:59:42 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkN-00000005PZx-0C8x
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:16 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1fc53227f21so12113335ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037994; x=1722642794; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=rmiFYTIa0Wp21CB2IEf00DSh+K1YZulLvn8H57D/O8mMHWMWbbWLCe9uXzzXKAe1TR
         fHz404vKjtaeQveK51TlrQvvC/Pgp/by/+Qtb4gFk52kpxc0SmBRavmX4ZuMgYiNc384
         VbfTiPzIkWzqq/LehQzKEkFFKnVdkXXTtIOEj8nZCERuOnQavuUcKNOJmfaBW/cw2k/Z
         tEe0vct9rVwAmukNXxbtaMUVZ+K0ntm11b1afQqc/kEALrmI+W6TVNOvCAo09I4CdE23
         2E02eXHtbsI/yY4ohAO2hGuwqlBfgIdbUx935i6RliVG3hP0ZhB1rXIRJCFb9OZV4JDx
         UAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037994; x=1722642794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YtgPpIjPSqL3TzmlwlpLZvvahtPd8ef2dtbW1LnZzVw=;
        b=bUmNKfkkZ7vqDPx9V0Rra6MUBiMexMj/A/ptTUCksrCwVSftTRn9ry1nOe2CnBYmOB
         KpOtSV19odwrhGgDWIW79ajzE7WNvo9B/GbMdhPj/rBAdo6+405uqBEMzEoimqWzCDuS
         ie3ygOE5TgkowRWZCMtirRwQ2lm1xrrTZDYT4POREG15MQeKX0PYW5cAtyB4D5hQAC6J
         C8+1zdpNUsC5KQ6ftWEH7HiblAcTtgbL2kqEpCDoNOOevKkO7dJhI1zRS/qt2lw8s0DP
         9ddydbZ5I2aYwSggivRgpOi0yURf/Ub5K1oz/id2djqsUFZbezo3ejlOVke44TwDgjVb
         uykQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXE3xq6wJ7b8cABJQAGmq8NRPAS8G7LQvBI0MFeJi8/q3PcDy753Rj6APHvDlOzfylEUh6JWx2qlE6uRilgQ5BUAYSJkIgxJ++uTaD1Bnf
X-Gm-Message-State: AOJu0Yz52mZpjNNPTJHj2u+4JlLzzUWwPm+uwRzhxPIrQ32U+jQ7EJcT
	mkK5yCPcqwnZu1miv4vWhbsyUmuqmO4jfp8l8C+MguntrVbkhqCrVo1hW9DwbZm+p1FIhK4YqvO
	pkA==
X-Google-Smtp-Source: AGHT+IHmoajaYWuB/CstqlwF+EMvaWyxqBn3H/lV1e3JQu2uS0IU9winjnCx9o/cN/zsyEDP3UE3pPbYXjw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e744:b0:1fe:d72d:13bc with SMTP id
 d9443c01a7336-1ff04822069mr906395ad.5.1722037993928; Fri, 26 Jul 2024
 16:53:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:27 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-19-seanjc@google.com>
Subject: [PATCH v12 18/84] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165315_235086_87D7A756 
X-CRM114-Status: GOOD (  10.14  )
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

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 56c2d11761e0..21ff0f4fa02c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3092,9 +3092,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 	void *hva = NULL;
 	struct page *page = KVM_UNMAPPED_PAGE;
 
-	if (!map)
-		return -EINVAL;
-
 	pfn = gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3122,9 +3119,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
