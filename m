Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EA6CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPVvAPrtSZpQ+uN6T6D5gqfeHjWda1vvHac7cOOhXK0=; b=JakMd3Qqq7D00r
	UGRALask8wGPYuy+JR02ZPEc/kquxbV5ICjq2JOuebmquPJuITXyznirDw6zfB69uo528r7GKR/ml
	9P3SqgiE83KEGkFIqXSUS+cZ9dY3fv2yVp2szjrGqsh9YhUzxftfG6knC5SogCmYaVEmLVj7NktaW
	QbyyhDsRCGrsgHOc9bpKLZye4xasZ4np37Wwtz+K7iM49bt6M7mcmnS4MsICz2S3PPB/Vb7f/5gqw
	QSNGhZW1PiISgl0bVJ1by39bSts6qBnk/tV+7aY79qlcIIkkddi/n9PuuK/90m7fOHrGdf1C/EkOX
	bB/6l7Ips1DgItMBVjIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJGR-00Bf6C-0q;
	Sat, 16 Sep 2023 00:34:23 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJEC-00Bd3O-28
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:32:09 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59c12d31d04so12968097b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824323; x=1695429123; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kZSgVl8Q+hmlGcu9E42B+6nCYbsSFCH4k+E/cwlLEa8=;
        b=Kt3hlIXqw3efHDA0Y+qA3OWfblVgjo3swNseeHFIZC9u+cvlRssqJOrnQQNm5g6+7I
         kU4DGUXOah2DjmPExDjtcdYb9hLLtTBGNSnVatcDXz4p9zmx5UK0lYilhy56LXEWYQEk
         3un42rxZcm6wOkgtUVHw934HU9hx9C5awH7FMWTiAyw+2BKXEppsIv3w+80Qongo80gz
         ulDVVwVnrknzteKaQMrgdVkE+/OsZ8rnxJziHSxxwODeslJvosvHQhEJnvSRHI5DOc7d
         jaRnVzkoIMn7fFdEXTSn+ZV4PvlyW5LpJFGSUpmVeYS71On8ApsYszzdc5sFXht3RIzT
         guwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824323; x=1695429123;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSgVl8Q+hmlGcu9E42B+6nCYbsSFCH4k+E/cwlLEa8=;
        b=qKmg7Zhyqr2JsPdBUY7JFJHDq+Xph8BdQmVC1FkK8UMMAfdmwmMVbTTFe0nw+iYKJi
         h2CSZeW6U0oV7bWJREki0qqYE3O2xxR/LpBSVOB7zoNbH0j0FLwLefPnR8MSbdBz+KgX
         4VHXJAVCN5HPUpb/U2XYyiVuy5hWL8jKCbQV8gYlR4Wl4Su51SjEhHkeBD63ln7z3fnI
         eNu9fop5EvsYBHg53zxpZQUWgbEKnbUeZL/2HHGPFN9JWUOKVqhamV+3GYN6lS6gNYaf
         gAdAbKjeaaCvSRrObncfoj04cvRjbGtbfUitZxiEdUpXTAuvTX//10qL1rthAmT68UiG
         tHHA==
X-Gm-Message-State: AOJu0YyFSuDDGrzPVJsUHEhbW+RkwLl39BXTil2jCKBakjg+hLWKdoLv
	E9jZaMG48/MtK7Z/mSs7ncr+/WQ8HgE=
X-Google-Smtp-Source: AGHT+IGvK90kPH1o5bQH0EPib2Mktorl92L52Xc3vYMLm3HoBq+aka+3/3i87f2Q/TuhX6d+6vnq3Y1BBZw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b60c:0:b0:586:a58d:2e24 with SMTP id
 u12-20020a81b60c000000b00586a58d2e24mr95790ywh.5.1694824323076; Fri, 15 Sep
 2023 17:32:03 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:31:13 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-22-seanjc@google.com>
Subject: [PATCH 21/26] entry/kvm: Drop @vcpu param from arch_xfer_to_guest_mode_handle_work()
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
X-CRM114-CacheID: sfid-20230915_173204_766128_0177F882 
X-CRM114-Status: GOOD (  12.13  )
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

Drop the "struct kvm_vcpu" parameter from
arch_xfer_to_guest_mode_handle_work() as a preparatory step towards
removing the vCPU parameter from xfer_to_guest_mode_work() as well.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/entry-kvm.h | 7 ++-----
 kernel/entry/kvm.c        | 2 +-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
index 6813171afccb..e7d90d06e566 100644
--- a/include/linux/entry-kvm.h
+++ b/include/linux/entry-kvm.h
@@ -25,18 +25,15 @@ struct kvm_vcpu;
 /**
  * arch_xfer_to_guest_mode_handle_work - Architecture specific xfer to guest
  *					 mode work handling function.
- * @vcpu:	Pointer to current's VCPU data
  * @ti_work:	Cached TIF flags gathered in xfer_to_guest_mode_handle_work()
  *
  * Invoked from xfer_to_guest_mode_handle_work(). Defaults to NOOP. Can be
  * replaced by architecture specific code.
  */
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work);
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work);
 
 #ifndef arch_xfer_to_guest_mode_work
-static inline int arch_xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcpu,
-						      unsigned long ti_work)
+static inline int arch_xfer_to_guest_mode_handle_work(unsigned long ti_work)
 {
 	return 0;
 }
diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 2e0f75bcb7fd..c2fc39824157 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -19,7 +19,7 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NOTIFY_RESUME)
 			resume_user_mode_work(NULL);
 
-		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
+		ret = arch_xfer_to_guest_mode_handle_work(ti_work);
 		if (ret)
 			return ret;
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
