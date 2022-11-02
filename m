Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06D6C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdeD8A3qhYI39F/IDrmepURLdum+RAcUj3jwd5Rr4YQ=; b=KQ9lNrZ+WW1WXn
	6POOM6ytibR1wv0+3u09xpsKtcst/HJRmPYErwHZKoSRVa5/M7F1YAFkNz5a3aWsSGxmGlOFcdPeM
	yKgqkO2EL/GwdxNiphbbOGrbHwmqspZJRjZUDsIruC4g/Skm4pWIKhyQmM0P04y7QwBVVbfRY4lT6
	G2nKmpw3/gP8TENkeR33suMJxyn3z+bs4JkOQAUrQiv2J6pskFElasNDBr5I9SRGNi5kJI10hbGvJ
	6xK0i5VOgtMpKK44cnQGjfmAL4a2qF1bisEcrGCJ63Qj9Ge7JmhxnB3CBQpyUrc9YllLwjg5MlyF8
	en7EcHGrW1KbweDec0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO8Q-00FKcx-Om; Thu, 03 Nov 2022 00:31:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5r-00FJ6v-Fo
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xdi2HIR5lDsLzEB1UZrukxTClMK6e7wt2nFiWo5gXdY=; b=bXqLUI3By2Lsuiz+mae6GLUyF8
	t1Q38DwitKD/HlsixGoHgF5mXilzAnBvtqN7iHOI9yRnHogXwSfpuOfcMdNr3QjQi51VubEj8grzs
	SKKLxxObZ7mE9TEUaPsi0xD1nEbMbl1aDayOOktTSXNRWAqXyRyfXnHkaGApmIyPmx2+ccq+dFTeD
	UoGh+azic5yHXQEWu+xLL8dg/YHrHPhR23tRMueoghBswxh5Gfay3ZR5NjMb1GAOqZgi+InqKAitB
	6ojgg8o0ea9FFHCwLrQdYrdA5Q4K0PL6TL39Krf7ce8xzeNZjsTXieOa2zlbIfX/FUiNImhNqZNQq
	yvAi0Fjw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1k-008X29-Ob
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:10 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 204-20020a250fd5000000b006ccc0e91098so358285ybp.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xdi2HIR5lDsLzEB1UZrukxTClMK6e7wt2nFiWo5gXdY=;
        b=sb/k/6YChcjl+a9VYlAXhWYOgQyjQV32YX7EFiw9qqpx/WWSDY3oo2CdFxdxpN5cQ+
         bsen7KFdwbaDgiY7tE/ARuN34CNUQVNfQj40KonMSYzWyRevQJIJ8ucvWSt+5e0xldbM
         dG1h+yI8VvXovjZl23qRN2G1h0VDtyVIK/a8wCZyDk3med1nNg8la66zBWDcMMULCuHG
         GgMxZJTuhnm9Kg3Kf6izcH6H9MKXIo5IEEs5iURRrxNb+NCxH6KXLxeRheLVzOIs5Da0
         /j3GVJG8PRl/KZMyimVoe+5FEyijlgyVWBHJWpAL02rmgy07fT/EQi1GCc1WFNc58HpZ
         GW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xdi2HIR5lDsLzEB1UZrukxTClMK6e7wt2nFiWo5gXdY=;
        b=TDas05J9kBxc1B0o77w16BGFxIT5dVfrH/fDcsZCEe2iFf/quQ2cQGMARCeWq5W8w+
         TEf9pKiyeKJEVrU+VzvrmuNncvAbuy8zUEsJ+jG1/WZWUPZ3a4IV0mURpfrudQkXZmmu
         wBZhhELmNR4YZ2LXB6fgHbSowGHG6CiQMp8xjJ2sJOXdE9hmNfUlBBUxPD9QablXC8jS
         jaFySwM+bpQfFFrcjqcrAMe+dOKuCWWdReTiZP7u0QcXzNnf2O+etErBdSp8IELM6v4y
         M9j18Sj2kQPjdKOh3kYGVTzwZtgsBKKxm1i3cs3c0fd1AGjY3gxZxRVn/0OBN/E7gPia
         eWBw==
X-Gm-Message-State: ACrzQf39Zvdz74JTBvA5qaBfBFt9AxQalfNzjFerrtXfhbCtM24EPc7R
	FF2vFgK+0sA0by38n+eWOvVQOV+8Y/A=
X-Google-Smtp-Source: AMsMyM7e+TGdJRwAqNyPJfnKmxSn80oz3hoXq+YWtTdlfH8WIBioJcR7xPecdYC8HpWoY/uUAUWZTvNWC7g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:443:0:b0:6bc:e3d1:8990 with SMTP id
 s3-20020a5b0443000000b006bce3d18990mr28148778ybp.191.1667431207141; Wed, 02
 Nov 2022 16:20:07 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:58 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-32-seanjc@google.com>
Subject: [PATCH 31/44] KVM: x86: Use KBUILD_MODNAME to specify vendor module name
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_232009_070695_A73B4D3A 
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use KBUILD_MODNAME to specify the vendor module name instead of manually
writing out the name to make it a bit more obvious that the name isn't
completely arbitrary.  A future patch will also use KBUILD_MODNAME to
define pr_fmt, at which point using KBUILD_MODNAME for kvm_x86_ops.name
further reinforces the intended usage of kvm_x86_ops.name.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 2 +-
 arch/x86/kvm/vmx/vmx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 99c1ac2d9c84..13457aa68112 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4737,7 +4737,7 @@ static int svm_vm_init(struct kvm *kvm)
 }
 
 static struct kvm_x86_ops svm_x86_ops __initdata = {
-	.name = "kvm_amd",
+	.name = KBUILD_MODNAME,
 
 	.hardware_unsetup = svm_hardware_unsetup,
 	.hardware_enable = svm_hardware_enable,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 25e28d368274..a563c9756e36 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8074,7 +8074,7 @@ static void vmx_vm_destroy(struct kvm *kvm)
 }
 
 static struct kvm_x86_ops vmx_x86_ops __initdata = {
-	.name = "kvm_intel",
+	.name = KBUILD_MODNAME,
 
 	.hardware_unsetup = vmx_hardware_unsetup,
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
