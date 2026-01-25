Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F3BE63C82
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CSxf90kU/7I+ZPSZ2limSp+l81lBQEaykpV2AEjWR/0=; b=Z5MgY6oCQUi+3f
	mhFd9lD4Mxx7t7Z3F2THYluDWzX0Uw05kwHibF8fpELLO3f92v1MEIUUiVShIzAHARLwYWnp99YBW
	faGpWHSscTInXYSxNleBlpZnZugD95uoaHycVVldjgmQgtPs85zoUY+13PCNda8o1MjrGW6kLJDKp
	E8NlgtLpMvEWpSE1EkW8omzNLl2gyBGJ3LobJG5UXy01qLB1+UgQWZoPe9moRqCOcXuDqGbeV3tFe
	Rc6wYtAHSipNmPji2Vh4M9yZfhKN7RV4KQDyN5bfX7oyHWh1cYFxatv8JFM+trcQTUt7nw25ZJwkm
	xFSPbWzRM9hABjul5Nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtF1-0000000AtsA-113g;
	Sun, 25 Jan 2026 06:04:55 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjtEx-0000000AtrH-44Dg
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 06:04:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so2879169b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 Jan 2026 22:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769321091; x=1769925891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+PLBq69wrKLc26ADhjxIh+RODq0JZVHyjoP2LCVX+I=;
        b=OT877MzUfv1bGrBJHkHjVdw4uYawXGTbeu7OXUuF8u1VyV5Ywb6qSfEQ6yUgRA3Ccs
         SzHYCxtg9CcrVYqeu/+4FthD3gHoo3JMIABL35zUs+QHGydqM0Upm03W6ZvQv9my4qHV
         7gTzeRj9AjaQUEE/f/2ib8vT1G+RFCwNLLEIyBHQu4U+4+rTitAzygZtgFrlkUNT/Dh2
         V5nckAZT1CvJbEC18p6e4gDdhTzY3+PBixrj1mlXcg7usI8h6x1IeAID0uQmdj+Two+f
         VGPWc+sE0s/Zu/EhNFgdfIC2hO22xCUSP+AHGRq7/FN2AOXwHEahQccbKaxrnSLkFgNY
         jq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769321091; x=1769925891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+PLBq69wrKLc26ADhjxIh+RODq0JZVHyjoP2LCVX+I=;
        b=pFzY6ijhEtFWoiMBgIZCD9aFiqDoExBKxcHGmxLKCw4EPw86Dh0dCt0WGzZDMxq4q1
         q0sW0Y8ZmgbSQs+SEmK7y0lL9MC+/7EmF6SMZp6Wl00RYglCkUds4XaELHD8GvceHZtZ
         xTmg64JrNRloF+rmOvXNnlcmqF0Ce4ARzf0X2tjJeQY5byQXdkiVMAPS5r1y1QAApFLj
         l4LBD6/cfwIzDhcCShopo6jghXwocR+KffjK7EWlqy+ZwXrJ2ddDOWPfFX9AK8jZDBr3
         WlmKuYSExoOjQliQMoxdBOO7VQ3A+jXT7EedRc8S3qqZcL2o/5QatjNqZm1omFdHpE43
         nEFg==
X-Forwarded-Encrypted: i=1; AJvYcCV5hS7o7qY1o7mq28WaCc/Kd/MTvaNbI+Pz14Hhm/QP3TwcUciJTTNpmH+Wv1iSqz/VwV/J94ceb33hrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGVkNRGLePsIyCtYbe/1zc+HQODvniv5lKocFdr4/le7qgik6q
	Rb/9d0gPekBN3v+ue0PC8Fr6V/2sEpv9pEPvuTXSY9pREUzXCa8IGk7e
X-Gm-Gg: AZuq6aIi/gzvvo3yW62Tuj57qhm5MEeuSodzf/2nOSAiH7bHAGls0YgCY1GuqlD0F/x
	+E276bNrJqob8FRvGcMC5/yrAu2MPkV+cym5DZbmBE1CAhA8YdLLI2M8Vm1sWz0gNSCWSvxFpjv
	pfHTsUmd4+Mk6PksPxnWt1q8chUE3LDuLGtP5geje63petxJnJ2mCKRVL2LIpWsiEgG37SgVpyv
	R6QaqO0q4HgMwaue0IaDz83rUnh0QxHpQzK4BBiWVzd7392drCryiT4m5NxudtSg2cqWQUBDO7Z
	zBv/x5BYNjdxVhQ7oFFGt6Jr197Vgqzw0fPnMaUyUqw9ZVSBrCDk2t3TSkVBo4T2J1trm5wblNS
	m3Kzl8Lq4OU326qZ2Foat0kWryBeomssakhIBrwhYWhXypsCn1hPd6WMMC9Hr7TnO2OFEfZZ9Zg
	lzpzYvdkIqAzYZ3MzUdTIKvgcot37aCXuzaD9szMNrynetBi1V3GQ=
X-Received: by 2002:a05:6a00:14c9:b0:81f:3a83:9756 with SMTP id d2e1a72fcca58-8234121ffbcmr739273b3a.30.1769321090580;
        Sat, 24 Jan 2026 22:04:50 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231864489csm6108340b3a.9.2026.01.24.22.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jan 2026 22:04:49 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr
Date: Sun, 25 Jan 2026 06:04:41 +0000
Message-Id: <20260125060441.2437515-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_220452_005587_D87D13BB 
X-CRM114-Status: GOOD (  10.50  )
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

Add a null pointer check for imsic_state before dereferencing it in
kvm_riscv_aia_imsic_has_attr(). While the function checks that the
vcpu exists, it doesn't verify that the vcpu's imsic_state has been
initialized, leading to a null pointer dereference when accessed.

This issue was discovered during fuzzing of RISC-V KVM code. The
crash occurs when userspace calls KVM_HAS_DEVICE_ATTR ioctl on an
AIA IMSIC device before the IMSIC state has been fully initialized
for a vcpu.

The crash manifests as:
  Unable to handle kernel paging request at virtual address 
  dfffffff00000001
  ...
  epc : kvm_riscv_aia_imsic_has_attr+0x464/0x50e 
  arch/riscv/kvm/aia_imsic.c:998
  ...
  kvm_riscv_aia_imsic_has_attr+0x464/0x50e arch/riscv/kvm/aia_imsic.c:998
  aia_has_attr+0x128/0x2bc arch/riscv/kvm/aia_device.c:471
  kvm_device_ioctl_attr virt/kvm/kvm_main.c:4722 [inline]
  kvm_device_ioctl+0x296/0x374 virt/kvm/kvm_main.c:4739
  ...

The fix adds a check to return -ENODEV if imsic_state is NULL, which
is consistent with other error handling in the function and prevents
the null pointer dereference.

Reproducer and detailed analysis available at:
https://github.com/j1akai/temp/tree/main/20260125

Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/aia_imsic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..9c58a66068447 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -995,6 +995,9 @@ int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
 
 	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+
 	return imsic_mrif_isel_check(imsic->nr_eix, isel);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
