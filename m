Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55A5C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bFbgrtyNfYlwTCl4XLyTGIbsKN/69OPZWMBiQEgwkJE=; b=mzKaH/Z6pI/gOd3/c1dmzPOo/G
	zsx+PMr3zj95PLdcV96MRKs4iRwka6d5DXobhLeQH10YzTY8AyddD4Bop390iCeElU2nKkiWRihVd
	o5gZi6awSlCtx09tmasgARhLrNpqrZ3kfF1CKeY3nQ5O06ULetRMVil5equGgVLp6/zxWq3u+eZy4
	RkhjvnMDQ9692DZgZk5Pqn2NqK4HcOJSj/ACkCiStn8LObxMmDFBzZyzlUy1CSTsCx75OQts6oCXI
	rgElYE3DOp1zMVedn04z6fi3Sw47DqMfZ7USdhFFzqOFO7pYdYp1K9zYToEgUcPSSxJYeIMV3quPL
	o1BdncPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG6x-00ERzG-3R; Mon, 06 Mar 2023 19:03:03 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG61-00ERWX-S0
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:02:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a2514d5000000b00a3637aea9e1so11588331ybu.17
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XCoFR/ZEz+o/3af75F9xOrPS2psj7bAuPaV+hSWOgQo=;
        b=UtpACFkTBCbOuRJEDO4GIV5VZyNtvBXfzND3oU3x+MTJtqKf4RC+aJ4iEUgKvk/Gbv
         QwvfJnU9JToxEfS+WRcwSwlVT4IlfuPHxbDlaSiueIsWANa2Ta9bs7g2Xb/SoaztXvbW
         AcZzwTzgMy8MObXk877NToyNHzCNVG6tPs8bD3L2lDLtP1vJbpQNVe/QUw4MOneGcben
         A12+mWFZoMCKAD0Z64Pf8fB/rO0lgxgHvfoLNCDEimxkEwLixX3fA9CtbPgaW1lHLH/k
         mZfeAEacPOyAvkjV/89Ze4YmYA+t2BabNvI12wvTJZnOvTvidyImSKerp51EgZ1O07yo
         W1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCoFR/ZEz+o/3af75F9xOrPS2psj7bAuPaV+hSWOgQo=;
        b=rBestrZBvY9f/5bPvuSoLwOk6T9atdgFTrezFDFvs4uINo/31zyFD9IDqC1w4AvgTJ
         ga1+KhMWd0JGIuCKMKUyGMO9c/SKZOCbqa3nKZ60CGAfCU2pl4T5VuTqlHCug4lSf0XZ
         OEU+FkrDnxXf7f5H/FDVrNqxbmiknFwuz460hUlJWmLCY1Q01/f1esNfvOKjwsa6pmcg
         OVAb+yowWby9LEdlWTlF/sEZusCPGFwTZpGwlcXWeLczAlKmz8EMH5LgrNE+nwILA4f2
         y048AYSdEkjBH6IH8syTxfIpmCyF5zNMcXgNFkXny37TlJHjuwcgMTfSGEnjsAmFSVxH
         ZYJg==
X-Gm-Message-State: AO0yUKXEvLd3eNmQ2LhUGDN+4v6NwoAaYDB7xDG0Hl2KSaRgzdcUJrlD
	sLlDlxotj4TgQF7ONsoeiPZ8T6JbJlOxJg==
X-Google-Smtp-Source: AK7set//cZ5G8Yg9tzyC35+cBUfG5YD+QOMFZSqm+c6ivqgffhDJvoZQbaLGDxeXrS7rdZX3Y2pHJ1bn0bJjqg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:ac4b:0:b0:533:9ffb:cb12 with SMTP id
 z11-20020a81ac4b000000b005339ffbcb12mr7643877ywj.10.1678129324575; Mon, 06
 Mar 2023 11:02:04 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:55 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-4-dmatlack@google.com>
Subject: [PATCH v2 3/4] KVM: Allow custom names for KVM_STAT()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, David Hildenbrand <david@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Eric Farman <farman@linux.ibm.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, David Matlack <dmatlack@google.com>, 
	Sathvika Vasireddy <sv@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_110205_955264_37F40340 
X-CRM114-Status: GOOD (  10.10  )
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

Allow custom names to be specified for stats built on KVM_STAT() via a
new inner macro __KVM_STAT(). e.g.

  KVM_STAT(VM, CUMULATIVE, NONE, foo),
  __KVM_STAT(VM, CUMULATIVE, NONE, bar, "custom_name"),
  ...

Custom name support enables decoupling the userspace-visible stat names
from their internal representation in C. This can allow future commits
to refactor the various stats structs without impacting userspace tools
that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. For example, the union
for pages_{4k,2m,1g} is no longer necessary. At Google, we have several
other out-of-tree stats that would benefit from this support.

No functional change intended.

Link: https://lore.kernel.org/all/20211019000459.3163029-1-jingzhangos@google.com/
Suggested-by: Jing Zhang <jingzhangos@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6673ae757c4e..fa026e8997b2 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1761,40 +1761,43 @@ struct _kvm_stats_desc {
 	.name = _name,							       \
 }
 
-#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
-			      _bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+#define VM_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,    \
+			      _size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, _name, _type,       \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
-				_bucket_size)				       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+#define VCPU_GENERIC_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent,  \
+				_size, _bucket_size)			       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, _name, _type,     \
 			_unit, _base, _exponent, _size, _bucket_size)
 
-#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VM_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,     \
 		      _bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, _name, _type, _unit,	       \
 			_base, _exponent, _size, _bucket_size)
 
-#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+#define VCPU_STATS_DESC(_stat, _name, _type, _unit, _base, _exponent, _size,   \
 			_bucket_size)					       \
-	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, _name, _type, _unit,      \
 			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
-#define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-	SCOPE##_STATS_DESC(stat, type, unit, base, exp, sz, bsz)
+#define STATS_DESC(SCOPE, stat, name, type, unit, base, exp, sz, bsz)	       \
+	SCOPE##_STATS_DESC(stat, name, type, unit, base, exp, sz, bsz)
 
-#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_##TYPE,			       \
+#define __KVM_STAT(SCOPE, TYPE, UNIT, _stat, _name)			       \
+	STATS_DESC(SCOPE, _stat, _name, KVM_STATS_TYPE_##TYPE,		       \
 		   KVM_STATS_UNIT_##UNIT, KVM_STATS_BASE_POW10, 0, 1, 0)
 
+#define KVM_STAT(SCOPE, TYPE, UNIT, _stat)				       \
+	__KVM_STAT(SCOPE, TYPE, UNIT, _stat, #_stat)
+
 #define KVM_STAT_NSEC(SCOPE, _stat)					       \
-	STATS_DESC(SCOPE, _stat, KVM_STATS_TYPE_CUMULATIVE,		       \
+	STATS_DESC(SCOPE, _stat, #_stat, KVM_STATS_TYPE_CUMULATIVE,	       \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9, 1, 0)
 
 #define KVM_HIST_NSEC(SCOPE, TYPE, _stat, _size, _bucket_size)		       \
-	STATS_DESC(VCPU_GENERIC, _stat, KVM_STATS_TYPE_##TYPE##_HIST,	       \
+	STATS_DESC(VCPU_GENERIC, _stat, #_stat, KVM_STATS_TYPE_##TYPE##_HIST,  \
 		   KVM_STATS_UNIT_SECONDS, KVM_STATS_BASE_POW10, -9,	       \
 		   _size, _bucket_size)
 
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
