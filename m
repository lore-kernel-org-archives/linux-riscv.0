Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC22BCD37B2
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0cnjOUY1P32Rjc17+RxiAm7vZZOMd8mgmQ2OL+fg69I=; b=jqUYwwXQYmOIZS
	RvXrNEEc5k9xtDR3f+wrRG6HJewfUqmf+VBOOPLA3tJwC1LkySvt8Q/SwNpnwabxYPUaFnoAAUOdC
	LCS/jRuxyoPA+D2qskCeL4+72Y1RIskjokJlje1RHyLJmiZx6Fdv7iwhM6aE3JJQoJrEYqS+4R/8J
	i9B91HAO6exrqLGwx4RhwlXJ7flT995JptPtLXXGSW0u6Ace3zbmaeZrDQjO3VQWjIWIt9z+Lu267
	+/ZkZwWQRh4hGl5WDFxHMLk/EPiYQmjhiex1RoiJGLwP+wwNFRM7TrN5CB74ADo8IiE5MmFrL/BKk
	5MoprQPPvB6AuV3wcphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJGt-00BfcH-34;
	Sat, 16 Sep 2023 00:34:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJER-00BdIv-0E
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=; b=pdzWXnEvH+qjIs2j7xeypTX1rg
	qIlocvRfb4PAqRDqHnDMAmr5pGXKWpAWNYy1pe/M1bkDj5Ed0O4qo1AgrEIjoS1m3iE78rZha+bDD
	7WaJaoWBUXZa9emdccNnm9kGaipj1E40tuwd7jxqr+Z1+LFDTk2bJN95S1qp7JOeeUews43TGAPSG
	rdCMzF2xfeVxO9gTAfnSvpm6aExjrDQQBiLPKMjRpIe3wqEJylTjhqr87AWzlcfgjOMbJDOfZf8EY
	vUc6UtxlHhdyvnBdymLtcakvL2A4i2fTJflz1zyVq5lEcLPWVnkQrpIG5JzZcN2d5lBUNb5VnHSTJ
	YoC2RHjA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEH-009jv5-2u
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:32:14 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59b6a51f360so33312107b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824329; x=1695429129; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=gjUhE0vNMgu2uJGQH+peDOUYhVf06S++4j6/2jkon6ZZY6jozUCL0TMyMp/b0c560r
         GIp1h7bYZXtFFFp19Y5rhsMrfD/E8+XMxMm7foxJUnGBQWQfN9HdIsB9wfiz6qkAZ+V3
         mvzWn+ziSoTvlt7bfUYOzVzDvmtn4+cb/wWGdTy4WJhkDhZnVnfKAaVJmnQlSiBKEXkN
         My7qZyvU4zikjudzJSBg/NPoYOtJgJmtz/qbLzJPgsQ8yjbFxz+VMLResWyxmGik/Ug9
         BK+xGEnG2U6eBUgkJf/JYft7+olqSKQACX1dCW4vPttFBW/6SYtQ+V4myMQGxqje7Jcs
         dD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824329; x=1695429129;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VtgUtus3LRehL4neqp1OYPW/02VDjf+LHA0REetHQw=;
        b=SyCG74UZnisrqJWb88JzYpoJCvZN5ff6R8VgObglEp8OFJi+w4RN2g9NvGXkkVYyUd
         jtCkxE7rJorYIFxVVU/qz8SGxvXHXfNhJEDmYdHVYOixMHKNAEIhLEqXdDhsLVI+tqPq
         5Z5EwieQAmF111k9rZq+0QySsSNb3EhesGTQ1Fsz/VfWKTJ4izLMCpqimvYMPvoKUoga
         hGXANym7WGwqzMCHnoFUAlxJbLjYMPcXVZxG3AqOD5COTuFi/xbuSaHO0TAB4TFKfmv0
         m9r0e5aOUAMU+t4YpqPiMNu8PjOi/Yat+0nP6JgXngUbPsOpKXxbeVOIts9/8zg447YC
         hI2A==
X-Gm-Message-State: AOJu0YyXMTMIB03vFZax51CoivefFdGuOv2a6ejf7nr+kAHy+NFR6EXu
	MC0w/xVXH0g+k8rXsFc0td5haXuMfn0=
X-Google-Smtp-Source: AGHT+IGS7sQUeRqIzboGgj+JmfOv6SrnKFoWg2KC/khh+vzWzgZdEe9LRtHGjdK8tkWZSSHoGr6LIc8WFow=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b620:0:b0:58c:a9b4:a64c with SMTP id
 u32-20020a81b620000000b0058ca9b4a64cmr86672ywh.1.1694824328926; Fri, 15 Sep
 2023 17:32:08 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:16 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-25-seanjc@google.com>
Subject: [PATCH 24/26] powerpc/xics: Move declaration of xics_wake_cpu() out
 of kvm_ppc.h
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Venkatesh Srinivas <venkateshs@chromium.org>, 
	Andrew Thornton <andrewth@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_013211_506251_13479036 
X-CRM114-Status: GOOD (  11.48  )
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

xics_wake_cpu() is provided by core PPC code, not by KVM.  Move its
declaration out of kvm_ppc.h and into xics.h.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 2 --
 arch/powerpc/include/asm/xics.h    | 3 +++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index b4da8514af43..72fee202d3ec 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -1072,6 +1072,4 @@ static inline ulong kvmppc_get_ea_indexed(struct kvm_vcpu *vcpu, int ra, int rb)
 	return ea;
 }
 
-extern void xics_wake_cpu(int cpu);
-
 #endif /* __POWERPC_KVM_PPC_H__ */
diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/xics.h
index 89090485bec1..17a45c022bd9 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -32,6 +32,9 @@
 extern int icp_native_init(void);
 extern void icp_native_flush_interrupt(void);
 extern void icp_native_cause_ipi_rm(int cpu);
+#ifdef CONFIG_SMP
+extern void xics_wake_cpu(int cpu);
+#endif
 #else
 static inline int icp_native_init(void) { return -ENODEV; }
 #endif
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
