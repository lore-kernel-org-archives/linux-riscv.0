Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE498CD37B0
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 00:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3EYwMzYOmIeNCk0OI/ChKSZg4TfMVj8gk447r89wmQ=; b=CloCUf6EfW4Q17
	B6N99+vS/IlvwkwkiEgRAHib2DivIdHHfAJMINzBDMkKh3QFT8eJMv3g3nh5Vj4AHW9pcNVRs4NWN
	ZhZ8eH8RYSSZLdeGECRdcvHvwskbcRNcA+q1p5rRcdB10c7aLgbW/xPfvk/MLEWsLSUfFkGPXYUf/
	OlVWxOoKgXZGDSxa/InP4PL+unFsIvfzDrgEU16I+YXBkE4/Uiie3cgmUMY18iwQjAixV/pj9KXLk
	DBKcWBeBCZGjp/cOJISRmAi1R5LugK6B8pPQw/YQoaxxGRL2gJjIkfi98P32o/rotuK1H9F1xA6Jk
	EY1Xt7vuNaz1KDpYW+rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDn-00Bcbj-30;
	Sat, 16 Sep 2023 00:31:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhJDb-00BcOy-2z
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 00:31:31 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d81ff714678so834576276.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824286; x=1695429086; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=Au/whQJEbAz+tOQ0jTzYnTHaUFqhk5Pgnrngt42R++heKHXOJ2U0YqnWh0A650p1pa
         PgbaR8YETO7ZKMYj3h4ONGnm912OY1X6nLqjUcHYZw2SCfppPlE9QI2MsrQBEt75JnUC
         id4P01cAv4bW2aLSS66YB0WfN9NrUSsO4HoyRU+POe5EIZ7yVc+3t4OXLj8PN8fDq6JE
         c1c2P6OXojAgG+hgLNLnSW9HWM9GkahkdPQXAfN7FUfYqpv0WvPKm9erEu/ZABleqTqp
         zYfI7WBh8dzi1TGBAWipfQzZdZFRePBIBZjwqD125053Cb0+8X4DsgJKIjfE45v20PE2
         j8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824286; x=1695429086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=tznPA9omB0kneW2aRClyk8DeXKmTqTC9vxeTgnOcsiHuMtsLEIo8iIHRC3c8ZZ4O42
         O0VHaJGEJXGALTWEOsAQud+eYklQnLKytChZT60osqo8H32w1eC8CSi37D+fm+TMr2Sh
         DpTjDDrryNjUVOr0IXnfiRfXgaaPW1JKXnLYFMwDdy+17CvX8s6jOohZBItRChgXSxvH
         aO3qKivgkpmGwZo9wIG06OrRCbpynO/8jlUxr821n1SbHEjEX+lYBD6oEAnwxSXkrqA/
         s4AmadXBkBpKeTvX3MdpcmKwW5V/mN2OEpQGqOHRIjg2OPA8VK+UofGPa+rYs9TGQasZ
         Ynsg==
X-Gm-Message-State: AOJu0YyTQDBJ7pPvPfDYUTxvXv+gsuL6pe/YFfLJgb3f+tpmVzIGksVu
	XBLmMaZl8ti0znFiulY2dmoy9Lrkzvo=
X-Google-Smtp-Source: AGHT+IEq7PdKxRZn76T8dxJekIJKystQKt2vwlGFVVGJbIP+fTzk72beaUliTqaKSj/nh0feFGYdLVI2swc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:98b:b0:d81:5948:970 with SMTP id
 bv11-20020a056902098b00b00d8159480970mr72987ybb.13.1694824286666; Fri, 15 Sep
 2023 17:31:26 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:55 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-4-seanjc@google.com>
Subject: [PATCH 03/26] virt: Declare and define vfio_file_set_kvm() iff
 CONFIG_KVM is enabled
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
X-CRM114-CacheID: sfid-20230915_173127_983667_1272D81D 
X-CRM114-Status: GOOD (  11.95  )
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

Hide vfio_file_set_kvm() and its unique helpers if KVM is not enabled,
nothing else in the kernel (or out of the kernel) should be using a
KVM specific helper.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 2 +-
 include/linux/vfio.h     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6368eed7b7b2..124cc88966a7 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1352,7 +1352,6 @@ void vfio_device_put_kvm(struct vfio_device *device)
 clear:
 	device->kvm = NULL;
 }
-#endif
 
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
@@ -1388,6 +1387,7 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 		vfio_device_file_set_kvm(file, kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
+#endif
 
 /*
  * Sub-module support
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 454e9295970c..e80955de266c 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -311,7 +311,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 #endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+#endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.42.0.459.ge4e396fd5e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
