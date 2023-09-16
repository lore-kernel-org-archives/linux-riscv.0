Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6716CD37AF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hk5Xbfssq/TVIZq5QxHRnCcyYYrrTIjR0qzCR4ziLkA=; b=kEsE62sD4kcP8p
	/NefhgMtO015zgNZbhFRRcE0jnENdW+iQxDXqinzIS24eAjJpH/oGhrBkI2JH/BWSn+CwSYwKkRF1
	BwEgJdgwgckl6JTwPL14AHrZEFn03bSnhkdedXiAD8GOk3pxuNwfUdETZbfUWKOoz6Br+f/FNDiTG
	ce9Yt4fhK3R68E2F2vlIzRmuLMLDUN36hfVv3pplHVP1WvJ0ESH/rJJjZizm3dhdhmwytUNGbIpxr
	quapx27H58z02vhYFo/8zVXE+VL+BPQMrmZ9XeO7diBXhp7M+u1U0DHYgNk0v1K4lTemCqN0mIfZJ
	84TScaYZyow5/0XxdP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDe-00BcSy-32;
	Sat, 16 Sep 2023 00:31:30 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDa-00BcMo-27
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:29 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59b50b45481so34126547b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824283; x=1695429083; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CcWcgzjI/Sjr3SKdjnMS4CWAtaq/GpOs1NzqJV8HV48=;
        b=FYBuZ5fv+xw1oDV1tu9yPyM8sUVk9+f1yXuKbNlo1sQE1P7c1MS3zZKhVswyrJs2kR
         FkEq4d+MZeOlaMBwiiqh+GqG+TOCL269DunUZ4mDHZb5SxFMiw5o0XBM2JCRCdkSGXpi
         gDeq1BW1gBYsJD5xvj5J+zc+y9/eP1abH+14bfb4ndxfRmrSK/K3/giWDmALL2PYCS4i
         LPY4IbCYc5IH7BIPRYPy/TL6st0KeM+61d7YhwrD6k6STAxGKpt1FyURFb4hCQ+qq19i
         1NV6C2wut/rkacQOBtcfA0yTSQAqirp/AGMFq7K/MmDGmKvfTcUAo+GhpLInCsq8iIuN
         QQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824283; x=1695429083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcWcgzjI/Sjr3SKdjnMS4CWAtaq/GpOs1NzqJV8HV48=;
        b=wi1uOeV9MEaoeuy2Bnid8maAUxJIPcHPMpa/7O7nPmnZVbfp57uHnX+zL75dHulrPy
         OA0HW5mUg/f2MQFYel1zj45QyxS0Qy3nVPJfeGlVBmL4O76XrCq8/lFbqlQhjoU0ABst
         XIObUap0iCRmlaV1PptsAm/oeu+XffqIALYHLPsboYGSOB7JrFX0nYz3/keFt06IGw/q
         lgGnInzjjxjC+dmQnrXjzn4UtrTQDQWNoHKqf9i4R6nTRiq8PYmpvgk9VonXY2p5N1r1
         IO6iLNwtW31RZM7eOOV+m4fdYSGJePZas60xQVXik3+6Y1EUI6kSchDhPrfO8Yw0zv8b
         /TVg==
X-Gm-Message-State: AOJu0YxP0DSWiOtfBc8m1hSPGkN8VZ+WdILLwiq+esjcHsHZF1Dpubux
	c3oZF5aDARLf2Yn1l1FiGBQK30SNCWc=
X-Google-Smtp-Source: AGHT+IEjplB8N3p+oR/7zKlMcxL9iCUBmO4vshw551ibG3RHlQehJcUKg5dHZyrgSIjo7xUVmV5xBYFOkj8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b612:0:b0:565:9bee:22e0 with SMTP id
 u18-20020a81b612000000b005659bee22e0mr85362ywh.0.1694824282871; Fri, 15 Sep
 2023 17:31:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:53 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-2-seanjc@google.com>
Subject: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of CONFIG_HAVE_KVM
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
X-CRM114-CacheID: sfid-20230915_173126_694187_B775E423 
X-CRM114-Status: GOOD (  12.00  )
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

Wrap the helpers for getting references to KVM instances with a check on
CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
to get references to KVM based on whether or not the architecture supports
KVM is nonsensical.

Drop the guard around linux/kvm_host.h entirely, conditionally including a
generic headers is completely unnecessary.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio.h      | 2 +-
 drivers/vfio/vfio_main.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 307e3f29b527..c26d1ad68105 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -434,7 +434,7 @@ static inline void vfio_virqfd_exit(void)
 }
 #endif
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 40732e8ed4c6..80e39f7a6d8f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -16,9 +16,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
-#ifdef CONFIG_HAVE_KVM
 #include <linux/kvm_host.h>
-#endif
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -383,7 +381,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 {
 	void (*pfn)(struct kvm *kvm);
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
