Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12949CFC5FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tDuIMJX0wZNZAXVJOPVJ/1k0HI+QyWHalGcFGK7WYw=; b=Rz1glFPeJhEQE7
	L0dDGBCP6ee2noI8htIgKFp6TQ3wmRFy1mZBcazf3iV+B4WA2OXnh6qNfWer/BPzqsw+geDPb/nPB
	CgIB0gkMrg4iov/Osf/dmzZyD7Y+fpTCP0tvH/h1ujiv/XtVf3W3KEdGiGPjNJZxGuDz+vksU8y94
	P6muLw5JdRvsgwv6W+jTwiMT9VUfK9jEHt+J4iJypbwlMCjL7jauSE/267+aBD5wJu0Zd22/trVCR
	zXp5623LlBSFlqf9kp0bmhIw8+9p/FBhsoCCetJKORR0ThsOzkp/o6fe/cYq9C4c4yF59+B/6NSS6
	CP1EDtVjmCVb1QRvmkvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyq0-0000000E6kf-1haH;
	Thu, 10 Oct 2024 19:28:40 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxsH-0000000DrFd-1e8S
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:00 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28eea1074dso1984131276.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584816; x=1729189616; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=SlOntVtK7MfXmxpZt9qlDfPDhXBRuKbOOqW7IqQ0P93vwPs1FWZo8d/fPJW4iNnsl9
         WaFEojLUv/xsVJmZwP672jadiAn28zabsdyG4luGg8vBEBqdfYs+GmhJTKS7MdDeavEu
         IIS/1rUscUKoFp5AiL5O+Hix5GdZV6jM1pdKwvb8MlIpTYXGrXcWMrPmxpoPEpHJVb9n
         zpWK/On5Nqt1OS/n+NtmVJUQ9bqeF9a8ZoOJNBl3NwrmW1rSb5CDX6JCZIt8XI8kpm9c
         5W0lnYFPhUi4nG7xC4RgfzO65Hjb/3a1HK1I7N7Vy96v150QVnYn24O+JGrFNRZCzfq8
         7meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584816; x=1729189616;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7pIaRprT8i6iodquNsVL5vPZSNT9KsZLdIQsfz/EL8=;
        b=a0xG9Y10vL1ydiuudZ+kl+dOWiD09RxOOwVDeN3qlJXm/c0x6JSfMoHEm1OWtCAz/l
         soiV7FnUvdh3PqByELnT4U3luC2GyO84I2H13Yqn9Dcykyv2Ldm6Jzitx+eiuCDyY4De
         LkIAzU0lkOYOhzGq00voNZ6TZgFGF0XCEFpZA2Fz7LQhkQOuMrslCK/izMLwAM5QvUgI
         N97zfH3QeNxOeMjDIK3YFH8+s1Buwx17KelnTVcWEXfBtASMIGy0Xj2ZWTE2KP8UZ4DH
         a+FjkBchHxHos/7HtDtcpGGHKy+MaBmGiSHGGlP6nX6OYFvYv/pTK3xmiyIwjuJEB2Pr
         M6sw==
X-Forwarded-Encrypted: i=1; AJvYcCVzO/y3ynEr+YMaXzh3QM9+B+LO5Hp6jdpVvxRT/fvYqS5ZO6L7S/+rr4VPAs85tKtmiWW3D4m3QPq1ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYszTTjgsrBAwAWSbI3W4dLOBqWtCBTJeJDzB6Vdndt/Ibq3QZ
	OqQ2bKzr5IM7X4RY/z3KWfuzzWyyGZrAgrMX4Gj2x43wlHwXzL+hTk4UZF2DmO/XNJR32fyjlLC
	M4Q==
X-Google-Smtp-Source: AGHT+IER2ThMFqRrPlrH2YqE2Mm6yZZ3YtFM0VnOojG5BgkcM2HHrRnMjpl0ZvMfhTqewlD6nF2BR0rNKwA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:c45:0:b0:e0b:f69b:da30 with SMTP id
 3f1490d57ef6-e28fe41d0e6mr89144276.9.1728584816073; Thu, 10 Oct 2024 11:26:56
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:00 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-59-seanjc@google.com>
Subject: [PATCH v13 58/85] KVM: RISC-V: Mark "struct page" pfns accessed
 before dropping mmu_lock
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
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112657_537809_D27398BD 
X-CRM114-Status: UNSURE (   9.62  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that RISC-V can convert to kvm_release_faultin_page() without tripping
its lockdep assertion on mmu_lock being held.  Marking pages accessed
outside of mmu_lock is ok (not great, but safe), but marking pages _dirty_
outside of mmu_lock can make filesystems unhappy (see the link below).
Do both under mmu_lock to minimize the chances of doing the wrong thing in
the future.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 06aa5a0d056d..2e9aee518142 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -682,11 +682,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 
 out_unlock:
 	if ((!ret || ret == -EEXIST) && writable)
-		kvm_set_pfn_dirty(hfn);
+		kvm_release_pfn_dirty(hfn);
+	else
+		kvm_release_pfn_clean(hfn);
 
 	spin_unlock(&kvm->mmu_lock);
-	kvm_set_pfn_accessed(hfn);
-	kvm_release_pfn_clean(hfn);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
