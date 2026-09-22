Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639A2C982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 02:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j4vZEYMS/w4ugm/kG6SnJf16u0/YcZB2j0fMl+WyTeU=; b=qbEDIVh5NE9DSN
	0v0uCTeD7WNcb+7nRLjYssz6C/jIIdOGItd/6lwPlAG3A0JyGh9NQOnkzIcubTgLT5Rz8q7yPiX8H
	U/6MMutq9Lli2VXZHocVae9MiOcdtmR+x0UxoFwq3jonx3xfa9AVncIjQ2NcbtG1I7hEjoxtD3fuI
	nMblSokycDwJUD1VzEjmtPanPXcOMq07OIxBF49O2Yxa5JvLcmXIFAJTFNHxhwvQNqIsDEAYytae2
	4N92s3YmS93upEFM9trLA/iifHuT9mcJbl9TkFZ3uPfShEnK4kRD4sfPO7eUl375nSETi/YFEKL04
	fycc1Ur9sWvZaGD97f/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8q5t-00000003xcZ-0uz6;
	Tue, 22 Sep 2026 02:18:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8q5r-00000003xc7-0aGg
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 02:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=; b=mRtoGsp44Ps/JBGDVbLWgww0EO
	K9CwNGY2rSQ3m4r/JhpEnSE/ZZZvaO3cU45sFWei3Le9eOfbwRyJuxR6V7NEtp16nQf2uAPsls2J/
	HJamc7liTVgxF0J6q9Fpe1jSjI6P73jhlX21o0OMy0QZDJoGAC4+Ta2E9fCgY3IGfhjoRDbdCWwld
	CKTN1vtR3NYXxfJt70qixOGCRknU/la1156wQaRuj3KWWKdq2Q03ArSfKXVgeQQVh72bdZ0gDu9Q7
	ASKoc4udU2c143hXsC3V8mGNyeDFoorDQHPYJyfl1/dsmeEHwN7FC+u4qAWzDL/15wd5nTpuXlMYM
	C6OsdT2g==;
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8q5n-0000000D0SK-0Mwr
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 02:18:49 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso2506835a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Sep 2026 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790043523; x=1790648323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=;
        b=UYWZdb4y14jDHsD2pHpEucbToXdWa+rmqfBD+Xz/PAKgkYfACah60iNaicynwkRh8d
         u1jArA/zwWuDYf3eEaxGZ29LJ7+P7eow2nhUQ+Jv0Pb5jI/G483vEKEOSOK5xuuyWY32
         OIBQqYVLYY+ju22nwm5t/a6LE+Th8X9uMzByZjzsoDK5Vr0BeLqwojnmOoTWnzRykAtN
         5K+RcpFSU2kS3Oe7kFzFfPuzpARcwFQC154EXSn0hoCVa/zAkox+VeR3Cf8Y25MK0stL
         yxfPEPS1bUnpKTSZMRZaG07b7Nq8NxIVXcGM0UPT0SrtJhB8ZF2tCG6w6uue46Eg4Gu5
         HSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790043523; x=1790648323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WQok9u00TIs2XVurEer//vmyvUbX92gGWOe15d0Bq0=;
        b=EZYCszQEOWJWIHbHhfhTzQtYFgiioNNcQnKzz5KyI+dCYQ4DmAks1F6Y1Qia+sJBuY
         89RSXaPMGyTNEi8XPRb8HnH0/yDgd7hkvm0LbrBu6es6pFeZUnpmCXIkZZq8A+dftOVA
         I0zqnyxOkzo6qBTA4WtCwEKIvps1whoDc2MNwKWYYZ01WK6rn2k8wugwKJ8ZbP8QE4jG
         QwkO6upbJVrHo4MZ8F+8cjpBHJGdwpNQUlTTPt8zIGeFkHCgYm5F8Iadrk9kb6KRDUd0
         mXULFNJj9r3eAHYHDt9/x49xElY22gSVMxUeqG0jjsS5xzwHlgTwwenbDINhMBTL92tT
         Y+ig==
X-Forwarded-Encrypted: i=1; AKwUvByiSJxbHVJ6ibXSBOxsd0fsBVfHq5j9kA1fn2FksJWNQAaqfR9SE05Dp7QieNwQKQLJd7rjOZhMnnwt1w==@lists.infradead.org
X-Gm-Message-State: AFuF++kC1AVmISlaJR8RxF6fzkyu9TBwr9ihGjCBEtCeARdrpk+THYy4
	gG/qdpEx6Y1Expy7/jGWlAq/6PiL313DQLo38ATQdlbWGv5CKZn5V7kgkXZ8Wk9D5OQ=
X-Gm-Gg: AYBFou2vpdtSmZJ3tRfqof1J8kRYoj1TReaXIvIUSL1xQKL0TWlivNyl+LdI/Q9lhAC
	KZNX/S1AWs/5wE8z/PAPD2yYesNFU0AHShm+ohpEWpI58jYbjAeGpv4J1ic3h9yqUHwszGfmH80
	w2LHSPEhtsRxm4jnMWihphHNxJlS+H9OKUBnEz7YTW8Brv8EumMBI9C+Vy5B3wi5HvrQae8/MGw
	UXsKM78kyGFSKcFw47OinlZlo0d5NqNtfSsQN5HOSszdiUL92bhPAMbU4ObYcF4MlIrmS5+wMx8
	GSHH6VLEc6LIWZXg7rbp1RI5GVQpsG3SwX8lg9v9VTwllS+hO4PVKo/WLtI61uVTINK4zoX15Gf
	T9xHi4Q41Z/RgVUBKzvaD5+A1ddfrET3z49XPjSbngrWWEDiwRf0GJZDMqW2XJsf3B40eD27oPz
	ri2VUjFmX3BLGVsgApkBDzLEdwxD+BeYnFgVLpEiqVgCQNpSooGh9YciXtXY7ghW+9kZjX3YndK
	Oa5ry3qmpl1zfFfMI5hjfNA9HnpcmyJNGkz4ev8b8F+1C2blJ8taM17H+ga0A==
X-Received: by 2002:a17:90b:590e:b0:39e:5166:df84 with SMTP id 98e67ed59e1d1-39e54d1121bmr18157424a91.16.1790043522580;
        Mon, 21 Sep 2026 19:18:42 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([139.177.225.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06747204csm1823793a91.11.2026.09.21.19.18.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 19:18:40 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Andy Chiu <tchiu@tenstorrent.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Fix build with vector support disabled
Date: Tue, 22 Sep 2026 10:18:24 +0800
Message-ID: <20260922021823.44251-2-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031847_624758_0B624E85 
X-CRM114-Status: UNSURE (   9.71  )
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

The kernel-mode vector context handling added unconditional calls to
get_cpu_vector_context(), put_cpu_vector_context() and
__kvm_riscv_vector_restore() in vcpu.c. With CONFIG_RISCV_ISA_V=n, these
calls fail to build due to missing declarations.

The get/put helpers already have no-op definitions in asm/vector.h, but
kvm_vcpu_vector.h only includes that header when CONFIG_RISCV_ISA_V is
enabled. Include it unconditionally and provide a no-op implementation
of __kvm_riscv_vector_restore() for the disabled configuration, matching
the other vector context helpers.

The paths that set RISCV_V_VCPU_NEED_RESTORE are compiled out when vector
support is disabled, so the restore stub does not discard any live
vector state. Keep it __always_inline for its noinstr caller. The vector
enabled implementation is unchanged.

Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 6371d5ea5392..50d4789b9cac 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -11,9 +11,9 @@
 #define __KVM_VCPU_RISCV_VECTOR_H
 
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #ifdef CONFIG_RISCV_ISA_V
-#include <asm/vector.h>
 #include <asm/kvm_host.h>
 
 static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
@@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
 
 struct kvm_cpu_context;
 
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+}
+
 static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
 }

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.50.1 (Apple Git-155)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
