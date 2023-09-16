Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC1DCD37B5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5AaYswakxa+tcc64Rdiz1hzTqnwJPIagFHN9GlYt9SY=; b=IDEF5sAlg5FapD
	MSVAkY6wLNaxw4PSu5zD8ThxiL3T1sDcDUfAto20hBGxHZeOjBHwIhEL4k9F6P3rfBxSysASgbsoy
	miD5lh6kNNUWBYzLG92QRC5t+U6ojL9yam99RUP4C5afUDUcS+fE5JzAbwR7+fvMu/gtkTSaF+qk8
	sYnhjokScVdTxvIDhzrUZUlqtfk+zCAmEfaSUz4EjBJ7ZQyHGTIRhMK1QErPw0YTjnc0m2SYYHu96
	ct8bnyg5haUvLXai6Wt2VbGG/8hudSJomQ8CXc+kigq02J2cnwxmb5jwWRbGoaUuTNQvWq1cJINhx
	zU2Zx93u6YwuYSJOuNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEm-00Bdbo-2F;
	Sat, 16 Sep 2023 00:32:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDy-00Bco2-2s
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Sep 2023 00:31:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RPxwiI+CF5oY5axnD8PplP8rMTdwT2bOTUtJzDVfTIk=; b=PUigVEVaZz+lsq/Q3BtyIDCTme
	Av2oE0uXilLriuuxulWehHg5gMA+A1qFbzRbLwIrWQKicpTrwXu7TkSU77eFxzutHNY6MbL+9xSlC
	6iw+quUPqP+JZlPBNF/YV06NJ9mfwfF0dMo0PGKEONpXEtI1CWcFYxmYDUncCiu6RB+R9jv2/FlVE
	927lXQhnJbUL8MxcE26R2TAj0s29sUwky810Nw7ySLw2Z3YZpPI+VLEQKp9YDvCmA+l8bcpFcUguv
	i7cDoFOmUtrkSBFAJywMr/C4pZ6BDxT5arore9yyX8xJWhy+LGbRqPkqyebc/S+5OT+Euyc/MgMxr
	zr3bzang==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDr-009jmV-1i
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:49 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1c43cd8b6cbso8823365ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824300; x=1695429100; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=RPxwiI+CF5oY5axnD8PplP8rMTdwT2bOTUtJzDVfTIk=;
        b=Zd/zfv038dYUiRDxyELg0a6fDlsmbrpWr5tB+aXZA/vfZf87102BawQPdKPDc9FhQU
         vYXK6IOnOmCrJDuWw3V2yHmqGsMf+jkmYGkuQL+5MlPa55hXwDjVIOLV1z9s/zltRqIo
         70iU43IrHOtsnz0KJG1YkRzPhFpxAisLFE+4wS9U4CB0Qhx85Qtp5Lazq/81INBrV/kv
         +zdszbRt5SRPQCiGc0x2MC8TKulgKOA2gRSxEixb0ggd9mQLDNi9m1gN1gFkAZdSz4zc
         3SNNpxWM7MI+I3I/x3T95JH6A76Ys6PM85ibFJwokhUcolSCEjvIDztgjPkhFdRMofS1
         EdmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824300; x=1695429100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPxwiI+CF5oY5axnD8PplP8rMTdwT2bOTUtJzDVfTIk=;
        b=hN9xDVVsnJC7imTn/M8Wgc7H826INYnHCXdaeLaV1ZFToYCTJ5x//3UrQs85p3saso
         V6cNj3Ylt/7762GEN8cMjUos16deIMWX08pnKsnIyaiZgadQs6vInKgLW4LDj1g2G4hY
         Zmqh+m5Rvdiu+QAS0SFOkLEqJTJYeoPrfP09F0Z+GKlZ/BjVIxybaKd/dtc4IE9AV4l6
         JTI4Jajp/I0bxA+f+UrReXvpYH52hTsKLCiYwCEbVUfdqDEGD53ZQ6UzRptEFjcszuYo
         mD/AmN6HKsi0nsawshT8yTj3ph++OnTmZUj713pc2iZ/HwAp8GYIH2CiNfp2OdProTVv
         jkfg==
X-Gm-Message-State: AOJu0YxHiY7fPjaSpka6I9TpmcrzHWw34AYXowdk9mkvIml4dSCzRRTh
	AwHpt7BqJqPSE5IS73zcIwVwkVOkkJ8=
X-Google-Smtp-Source: AGHT+IHW1P62bdhU5bhLcOltXlUxrv9g7sIQXkfjHJs3Wzbb395eeX6g+RNXiUsvwMV2ESouovB/6KamMFU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:2302:b0:1b8:a555:385d with SMTP id
 d2-20020a170903230200b001b8a555385dmr88540plh.9.1694824300497; Fri, 15 Sep
 2023 17:31:40 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:02 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-11-seanjc@google.com>
Subject: [PATCH 10/26] KVM: s390: Stop selecting and depending on HAVE_KVM
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
X-CRM114-CacheID: sfid-20230916_013147_761531_D1F8B7FB 
X-CRM114-Status: GOOD (  10.22  )
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

Now that nothing in s390 or architecture agnostic code consumes HAVE_KVM,
stop selecting it in s390.  This is one of several steps towards deleting
HAVE_KVM from the common KVM Kconfig.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/Kconfig     | 1 -
 arch/s390/kvm/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index ae29e4392664..8a5dca0036d9 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -193,7 +193,6 @@ config S390
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-	select HAVE_KVM
 	select HAVE_LIVEPATCH
 	select HAVE_MEMBLOCK_PHYS_MAP
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index 459d536116a6..9056cee72945 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -19,7 +19,6 @@ if VIRTUALIZATION
 config KVM
 	def_tristate y
 	prompt "Kernel-based Virtual Machine (KVM) support"
-	depends on HAVE_KVM
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
