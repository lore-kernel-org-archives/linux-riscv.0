Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B526C6FD1F
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 19:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zhfR7VFheNHlVnQbdPiUO56ViYjr2N22bbj6ucP/Cgg=; b=Qyx3gd4h72448VXpKyT7s0FYg4
	0q23hn/JJ3SaTfPrEXxD0/w9OSf7+WjspqDDYgARc/ue7PHu6EELlwdXUSziE2H/enrb0c32CDEKz
	s4j4WNfBviwTRSWt0AJaNg5XgM+FMsSHxVwDGKDDRrqLrLKQOZ3B4ecmWQbmlj1VWqdLWw3Gz05Pc
	IvRZ3b9xumDIO2K0OFFLk7lRM6phNNisBP5soU8wyKX1SSi5hofgOK51n1ENorTdMaJbEN5xJUP4i
	5udjwsJlgcg1G9hW+iAAcDiVx7IUJN8jfj84bT+HXXMoOl245GY9ZotJNxvfGOI+AQQTFH3SB5YnZ
	vLJ4O5PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG6G-00ERcm-Nk; Mon, 06 Mar 2023 19:02:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZG60-00ERTd-6S
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 19:02:07 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id a137-20020a25ca8f000000b0091b90b20cd9so11468973ybg.6
        for <linux-riscv@lists.infradead.org>; Mon, 06 Mar 2023 11:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YtNaR+Rua5pfZ3i1GgJ4+hfSm+WXWk7IiLK4Wtb8+uM=;
        b=A42BX/LP2I7Yrldf83rjJjVVWP9EY7MIToR2w3fKfHNuwlJilnDlJG9Ga110/MBKfg
         bANY0GGZpHkSiBa5gtT3zYMm3kqQ6eoCd9XQbU1Nw97OaGmCCVTg5gCJq6SSBEjZs5D2
         WXuRcS2VBsFJxrimrp+JQlNpq+OFmS1Ohh71sBzmcc1MXrTW549F5OJ3aZCaRVfQfJrL
         Xl5df+WIcc/z0GU55ilZ3Am2ARcrEJpAjke5BrZTBJ9d+m4fByyPMgXYOtOtNovF1gQu
         M0K+F9OgIzJN5j3FpXghI6sTRl0hwMpb0KkZDbWtWBZRE7ORKqG1rS1sA7NOJROAsX6B
         zrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129323;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtNaR+Rua5pfZ3i1GgJ4+hfSm+WXWk7IiLK4Wtb8+uM=;
        b=LSbk2XekrNNktLIgZnp1ycUuYsinQy0Em1Xwy7usKa4S9djMngHR4GLf1m+NV5klcW
         sPS+yV9N0TkLfxtrVgk8Sm1QH6Pt5GlJ3PU/h68OeOszWEHLu+GLb3AyZ9JmYfEOxfru
         kw40kp58WK8bspgBMXucyXXtwI1XNmUTygmuU2a/8s/kLTSSvfU03uqRFhX9BBQU6Y4q
         1tqarb/OLZ1L9B31RnqrRJW1B8886f9lLNUkxcw1Dv1ZluABRF2gJ3hpA33hwi+l7R9c
         4vu3/OWyarlTrpXtgizCp8q6rDf+PPjVRLYQD/uBlatLNM0a5GmThApH6jOEdW7l1uyf
         NrDw==
X-Gm-Message-State: AO0yUKWuhSB/Vpsy34FG7GUku2sWCJlvhUaQ/M/EK82+44Z55TFPs7/W
	+CwLWDIsiARyBfP1SyhftgH8DvUO0iZ/gg==
X-Google-Smtp-Source: AK7set90Igml/rc2W0Ya1hk1eHjjJqlvHrIGVSaZmJTzp6vbZseA2XP1DWQDVsfl/YAYC2c0ne8CFj1tJ7LMiQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:ad0d:0:b0:52e:b635:5496 with SMTP id
 l13-20020a81ad0d000000b0052eb6355496mr7126400ywh.2.1678129323101; Mon, 06 Mar
 2023 11:02:03 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:54 -0800
In-Reply-To: <20230306190156.434452-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230306190156.434452-1-dmatlack@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-3-dmatlack@google.com>
Subject: [PATCH v2 2/4] KVM: Refactor designated initializer macros for struct _kvm_stats_desc
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
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_110204_375178_B8FF266C 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

Refactor the macros that generate struct _kvm_stats_desc designated
initializers to cut down on duplication.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/kvm_host.h | 75 +++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 40 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 02b1151c2753..6673ae757c4e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1744,47 +1744,42 @@ struct _kvm_stats_desc {
 	char name[KVM_STATS_NAME_SIZE];
 };
 
-#define STATS_DESC_COMMON(type, unit, base, exp, sz, bsz)		       \
-	.flags = type | unit | base |					       \
-		 BUILD_BUG_ON_ZERO(type & ~KVM_STATS_TYPE_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(unit & ~KVM_STATS_UNIT_MASK) |	       \
-		 BUILD_BUG_ON_ZERO(base & ~KVM_STATS_BASE_MASK),	       \
-	.exponent = exp,						       \
-	.size = sz,							       \
-	.bucket_size = bsz
-
-#define VM_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
+/* Generates a designated initializer list for a struct _kvm_stats_desc. */
+#define _KVM_STATS_DESC(_struct, _field, _name, _type, _unit, _base,	       \
+			_exponent, _size, _bucket_size)			       \
+{									       \
 	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, generic.stat)   \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_GENERIC_STATS_DESC(stat, type, unit, base, exp, sz, bsz)	       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, generic.stat) \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VM_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vm_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
-#define VCPU_STATS_DESC(stat, type, unit, base, exp, sz, bsz)		       \
-	{								       \
-		{							       \
-			STATS_DESC_COMMON(type, unit, base, exp, sz, bsz),     \
-			.offset = offsetof(struct kvm_vcpu_stat, stat)	       \
-		},							       \
-		.name = #stat,						       \
-	}
+		.flags = _type | _unit | _base |			       \
+			 BUILD_BUG_ON_ZERO(_type & ~KVM_STATS_TYPE_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_unit & ~KVM_STATS_UNIT_MASK) |     \
+			 BUILD_BUG_ON_ZERO(_base & ~KVM_STATS_BASE_MASK),      \
+		.exponent = _exponent,					       \
+		.size = _size,						       \
+		.bucket_size = _bucket_size,				       \
+		.offset = offsetof(_struct, _field),			       \
+	},								       \
+	.name = _name,							       \
+}
+
+#define VM_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,    \
+			      _bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, generic._stat, #_stat, _type,      \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VCPU_GENERIC_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,  \
+				_bucket_size)				       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, generic._stat, #_stat, _type,    \
+			_unit, _base, _exponent, _size, _bucket_size)
+
+#define VM_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+		      _bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vm_stat, _stat, #_stat, _type, _unit,       \
+			_base, _exponent, _size, _bucket_size)
+
+#define VCPU_STATS_DESC(_stat, _type, _unit, _base, _exponent, _size,	       \
+			_bucket_size)					       \
+	_KVM_STATS_DESC(struct kvm_vcpu_stat, _stat, #_stat, _type, _unit,     \
+			_base, _exponent, _size, _bucket_size)
 
 /* SCOPE: VM, VM_GENERIC, VCPU, VCPU_GENERIC */
 #define STATS_DESC(SCOPE, stat, type, unit, base, exp, sz, bsz)		       \
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
