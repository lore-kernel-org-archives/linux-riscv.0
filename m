Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B039EC5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 00:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wzmFudRNKFNyCQqclUvDXubvuukoT77dwYLozwge7Gw=; b=X75E+MfBtHVGHBYg8AAOr2alpT
	8prW7H3X7VLuWjFBUie9/uF6ytZIBu2SKPih9C2/lxEacpEDSZIyS0WYaQZD8jDsFZ41zpgKg2EjF
	5koe32ljc8tDOBJngCrZnhbz9Z+8ZPRtFhv/MdSFge53CmbJZJZxT7YFRji/FVqasN6yhKiacZ6t8
	NJRiCvppf4TWN0v7wOdo6+SYp6OWSaHTiR8BE+3y2UXZXi7jacruWbxA9Zbie7ElrtiXZj6VEcAGH
	n4pzz7+qb3UskByQ6o/JAbQF+9Yk9yK+yoHcW9i5LZtk/tYK76IHl4kwoIW6fGHk2dfyDjn3G1b6R
	/A2K4ngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUgF-0000000BTSA-21ie;
	Thu, 29 Feb 2024 00:53:47 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUgA-0000000BTPg-49vk
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 00:53:44 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-29b0ac33382so104059a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 16:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709168021; x=1709772821; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1fAxVxcSGJDtvwC4OA6vg9SQpipa+6cd4wlsruGTgI=;
        b=J0Rhn6GIlLUtDplYTJVP9t8b0kBnfCrGP4ZTFmtKNeqSqw7knQbo+EL5LfboF7va5d
         pe8oOLfmXmQgft6KEPriWGnnHOrTueKyvUDuw7f4dnsDv4+EgSTvrSEevBkl489tx29w
         uVGEJR9dy7KQ6zPCM0jSbBjWgCpPeeRqEsf71vDRTx6r/BQ82YJfbHk8PIXJo22rhnOZ
         2R9BGqiUUtxJBEyt7bgBKx3wi3kN5wvrMhZgyyjxfKTlKE/sNbf+aKWfCCT4ervVEo5T
         oSDJLqVgB4gsCYXPV6eqWj9/oB4t2p3NHwGj5gpl64nvC2ALRvm+tE+IyLEeZbdOe3Lf
         OEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168021; x=1709772821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1fAxVxcSGJDtvwC4OA6vg9SQpipa+6cd4wlsruGTgI=;
        b=o/bi4xYBWBBFGVn93djP7ZgoJ2zslQ+6LwuGsAlQn6L8K5bx/JSkN2Jl2C/fujopsA
         hYj0kSX5Z9v/UopbPD4lMPV9ED/A7EsyID3aB9gc3Nn4YQaCi8gmqc9ijlSxcW3y+Q4V
         KwJQJ33EHfPUVv4ZdqYdUSgNOhKRSTx5brgtG9Pg2U/97DLZBwveHn9OdDXLtzf9lhn3
         uCyDTfDf1giBlpPQzlgzXatSNUacujO+gMd5C5mPeA8uENopRZNI5pj3eOfRCzNEZZ0p
         Ja802UQKMTjQgz68dvmw630dfl+Jg45Yy1dDWuyQoUFn9T8TmrCd1CDpiQDlXpymUcxk
         u7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXQ7qGa7T9GizUJMxRNmIW5fzk1X05vUiFK2We1kFX7oqAdQbOYLdaLx3AdirVRYB4zhMpMd0gfC2XPst6zsY/ERsKOYdX5hoK4Z8QpnWol
X-Gm-Message-State: AOJu0YzjVInwx7ccoO4ZrRd9zd+qPfHQQQHnhD/5SVh/mMoSFiWlXUd+
	9NTLzFCUMCeamTdpqsb5Ug4Nqm4wqJfWJXP2jGMBZODrqj1Eb4tPruB9gvg8FxzmXDE3htD24HB
	eUA==
X-Google-Smtp-Source: AGHT+IEGDx9KNnQuVlFL1a+o7VDJ3fqoKiHSZ9fod3C0H0yXTT9TpbbqlundidtZGFnRpu3hKNN8Sj3g9iY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:4f44:b0:29a:c5e6:c5f1 with SMTP id
 pj4-20020a17090b4f4400b0029ac5e6c5f1mr15628pjb.6.1709168021232; Wed, 28 Feb
 2024 16:53:41 -0800 (PST)
Date: Wed, 28 Feb 2024 16:53:39 -0800
In-Reply-To: <Zd6Wo0hQu11L4aPc@google.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com> <20240223004258.3104051-8-seanjc@google.com>
 <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com> <Zd6Wo0hQu11L4aPc@google.com>
Message-ID: <Zd_Vk1dlpLNjUzQD@google.com>
Subject: Re: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory
 in guest page tables
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Carlos Bilbao <carlos.bilbao@amd.com>, Peter Gonda <pgonda@google.com>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_165343_053408_D707B6C3 
X-CRM114-Status: GOOD (  15.32  )
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

On Tue, Feb 27, 2024, Sean Christopherson wrote:
> On Wed, Feb 28, 2024, Xiaoyao Li wrote:
> > On 2/23/2024 8:42 AM, Sean Christopherson wrote:
> > ...
> > > diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > > new file mode 100644
> > > index 000000000000..218f5cdf0d86
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > > @@ -0,0 +1,7 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > > +#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > 
> > Since the file name is changed from kvm_host.h (in v7) to kvm_util_arch.h,
> > we need to update it as well.
> > 
> > Ditto for other archs
> 
> Ugh, nice catch.  I'll fixup and force push (likely tomorrow).

Here's the diff of my fixup:

diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
index 218f5cdf0d86..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
index c8280d5659ce..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
index 4c4c1c1e4bf8..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_S390_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
index 205ed788aeb8..9f1725192aa2 100644
--- a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_X86_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 #include <stdbool.h>
 #include <stdint.h>
@@ -20,4 +20,4 @@ static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
 #define vm_arch_has_protected_memory(vm) \
        __vm_arch_has_protected_memory(&(vm)->arch)
 
-#endif  // _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
