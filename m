Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92574E63CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4bYUFQYNNkU2NGna5AQjwZa6jV2en1sWr2V0nKYDj1c=; b=WSd8/jY89UwpgS
	+L8z9ZXw37+l/O3ErQZr92oURVMcLinNJUxt5sgwy1nvKn91QCRkLcZUP3o8PeejRUZY5+fsj2dlw
	lHLUqf9b8w9Mcr6n8k+6OnlrVIhhf/Etj13FQc9t7XTzaGlgo/m4HI0E7xZ1ccHFDkD8sI+lWHJt0
	7Oq6ZUYj+3nQI8btvJjprQx9PrwtkO/5zGKFqypIKTosW0UVyX4spFffCJ6oLfSqenzEn6FnX0keI
	sKdwz4Y0O2mmKiSLq19+ibiZk708QqXojCDYweAUuUK9nbqYB7xNhgA8vZ3xd2ca03JSuhZXKzHIP
	ZpeG7+xL+sL9n0/1UNnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjykr-0000000B910-1GEE;
	Sun, 25 Jan 2026 11:58:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyko-0000000B90L-49Sy
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 11:58:08 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7786d7895so23525555ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769342286; x=1769947086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGmrDbJpv9Mnf4OlN/zRFu5G/nsgDAKHAOEKObolTbA=;
        b=jijKmZ8jE6jKNhflj3M2bYvBzJKm6wr1is16OSeOVByFFn8owX8SnMkCLmQ0L8waWz
         miskhfB8KKwaXHGIhJQ61RvzwZrN1R1FjQfYmNKdBmbllsrcmB8+5XHea0OJI3GDWMjz
         6ImTio9sZBpHBsgD/aeOlKBEI1SMC+5fuk8cGGi05Iryel1S0bt7vWOmvEAGNEWr0ECq
         aOpm0mWV7d4IX4bCUOhhwGLKrN8oX4NqTG/sRXJPu/l6QuOL/yF8OQZk6+6B49t36HYw
         sCQAUpJycnT9pyXkJs/YrT9eK4Mavqyd1qkfwQDPk1dM59zUDk9h7jcXsyzKKd5MgpvQ
         t/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769342286; x=1769947086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGmrDbJpv9Mnf4OlN/zRFu5G/nsgDAKHAOEKObolTbA=;
        b=d5rGmY3NQiDvj/wkJigp3DPN52DNOrp7zTx+oGX/azn0091Zf2UM3Bu9o9Ow6G1Zjd
         MN8zgXGKYksoHo5778T9PdrZr7HatiSvZeqOoeITy8jaHYfVFhRZTtOIcplBl2ygxVkG
         3HuyL60igakNnG+eMMtDOPsWI/rCbTiPTEbA/0XbvPU1F401zxnnTDpN3SKZU4e9nU6R
         PTxntvP/sl3l+ognfSbrJenO3m595N1klJ6tsslP/vMwjm6Iqt5tdNRd3SrmpPGCp2cB
         cLqk+Df0fl4bi5Ibqrxw0bdC1XUu7VwZ07wiaTCKs4KtLMNPLtKq3NGYnzRegjlEKk33
         K6og==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6+VdcZy360dEBw13lao9tsJkrtg0X1tCb0lYivy2sFAIsVrvpzYKfyU25aTTWuoCljwcoZg70Nds+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMLMAeqyNtePQz19iMmS12AfF60GmawazAcivTx86JAI6fz+f1
	OvcR3mz3P+s/Ec44R+q0QNOaGA5P+w04pSINgFyALu/+dlPojDSzpLzE
X-Gm-Gg: AZuq6aLW3SaPDVQpP1QffM+xuBe2gnXndMPPysQfqjkzOg2rb76hHvQ0UbHEalmySHW
	HtwuWU1NfV/dAymrBCgBbzIwG4ln4GOoRlyP5eIzaR3u0qZvlDX6gDYOJG6bZSNZF2h6WF9pNUc
	A4SFA6+Rt7f+ahm9xrhq9y2sTDhGSQ/OghOShfgEZrTK2WHRI9BIUSy5ltbw4MKBq32i+kzfZ1A
	8EqqXBt8QOc4nQOxJhAikVF/LUSrFPjw+RxqaLO3KXQ4NIe+dkXlTzjQoRpzFSc+wVfhLGPCIk5
	l7wKHC5wxte6A0Sn+YJum1h7A61aGMeJ/RrkAQBmydjANs2m4f3QA/OdDrOeiT8FPXVgY9AdMKp
	Plv5u2RbhK+NGiNkTqmBBug0PRoJfY7LlnMO7hoxnaWyp3S3EqNwUOnudpv7a/Lq7G6FTs3b044
	AaRlZ6FPMFAzuxrA+FlYTyFQWw33HA92apM7d3iCnLCEBQvzn1ZJI=
X-Received: by 2002:a17:902:ce8e:b0:295:9e4e:4090 with SMTP id d9443c01a7336-2a845307823mr12548625ad.52.1769342285789;
        Sun, 25 Jan 2026 03:58:05 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa675sm66792385ad.15.2026.01.25.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:58:05 -0800 (PST)
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
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gamil.com>
Subject: [PATCH v3] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
Date: Sun, 25 Jan 2026 11:57:58 +0000
Message-Id: <20260125115758.2486687-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_035807_036395_584E7688 
X-CRM114-Status: GOOD (  12.58  )
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

Fixes: 5463091a51cf ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gamil.com>
---
V2 -> V3: Moved isel assignment after imsic_state NULL check.
          Placed patch version history after '---' separator.
          Added parentheses to function name in subject.
V1 -> V2: Added Fixes tag and drop external link as suggested.

 arch/riscv/kvm/aia_imsic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..cd070d83663a9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -993,8 +993,11 @@ int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
 	if (!vcpu)
 		return -ENODEV;
 
-	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	return imsic_mrif_isel_check(imsic->nr_eix, isel);
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
