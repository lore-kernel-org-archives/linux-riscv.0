Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25234E63CA5
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 14:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VsYGT4VxVaYnYY9vX3AMQDYd7lwSY9xcM4QDFuohO5A=; b=nrvQOmoLLgEECf
	cYIyHUAnwnV8mbkZRMpy/yz2zGUzgV0RTcSSjzZBPHcsraE73izQJuYpHeKAuOyVyTx+EhTUYhOCe
	mGjLWRvse07yVV+tj4Fn/IFVLbNBBrF4PRuI+am9C0MXh5hPNxmbamhUCwdY34/9o4hnZwTQqrLDU
	3SQWlxOdEAff1qWM+KCyE5EncCh3OnjKoQ29RiNldzJZq32pGXnshdNovAkwYHiRKMm/xXP8QyrKz
	gFxB3ZiVGG20cQmpE5zBL+qWWO5Gbfm4g7Bx5Jcphh9G9BGlDuRYdb/URdn6gB9KUDZq5U9Hs4zRw
	P2NamuoEsiN8EBSJMY1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1Bb-0000000BF4T-0qk6;
	Sun, 25 Jan 2026 14:33:55 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1BZ-0000000BF3q-153D
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 14:33:54 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35305538592so3554114a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jan 2026 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769351632; x=1769956432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vrpTgp19j2v2S0F0+kVV2ZQQrhahMGVY6XxldYPxCk=;
        b=M36DMzpgS8VMhkmkGE+oJO1r4hWtRJlehJLY3ayv5cEOo0TbGoC6d6csrqjNxVb8qt
         BJphDfTi9yQu3VFJW/munZgyJR6LHOiqSDS3y50qZAF/tzsxN/XkgEBDtSoOy2MJHblH
         8iLiRwhmrIxVMV8wmEKpBdCESDkL6tKYazZtsFZmbZOFMJgykCtOAOSyFqdYSh50js8U
         xRqYyhlMRJqA4cpbbdi01tA41ZJR5UgYacPJj6Rkai82U/pw93lh7e5Gz8gdbrNtzjFf
         cvP5sIInVR11s8cK11SXzXVZ/sYuKs9FFc1T2yEumVS5fO2ipOovAZdtAQPJN+tasVbQ
         WAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769351632; x=1769956432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vrpTgp19j2v2S0F0+kVV2ZQQrhahMGVY6XxldYPxCk=;
        b=uLGxp20dPazAzXZOBedhA4lB0lRmwbuxCwhOT5T7Y68lMKXiK3ALrchzF8SXD4R7tx
         ngRqlLp76Ug7QQdEqAGn8EbQxwv7+xOyjDq3zRuvHofGOfoVQrFIt2kyE2LViCpUqO8n
         PRZNaLMDilT4+o4G9p9ZnkLRoh9X6r+2tbDKS5f0iaVqj3wObZ+cDXUu27eeMbVK9loa
         ppo7w3nmoEkGqflXXbb/IdboOpfFA///zgIjC5AA3Cd2jXqhhpe3QXwh0k1u5y6YjgSl
         awTaAEUs2UVBNofKsww753ZLP51IALwp2WTngg+SoGR7TJHbu/Qx9xO2B8untmkRRhBQ
         a5Vw==
X-Forwarded-Encrypted: i=1; AJvYcCX4Dv+cztFTdBN1xtiJOAFAdzqiU1pcumdFAOORYm6QWzETeUpe3p49nJUhFMIievlQP+ucr6b7j/RUOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHRmdxoxL/0w7c7XSCh1H35pvT2yeCJHeSoT8fm+W14u9btTA6
	QtDQEj94Pq5CqVRDVTSmuZPGnfZ89g5e5VyhgYa2nn0+zhBDX5c/41Di
X-Gm-Gg: AZuq6aKkf2gHsWthwAODi9gB1+5rKYV3IUbuLRN4Y0Sog/L4inaeEtjzWWde/6WIjqB
	3+J2jj+UzmDz2LLsvW5c4CcdeEiUSwP/tcGhj5MuTmQQHvsPVGhGWr+3hcMq+r/ipgXD63Lkx3o
	b19xZk5zK0O4h/obEGiD57P7i3X/X29eDs4v+fQ+qeGQb9iBtfKIare7/WBPIjNNiSl9QrLooYv
	3lzortxBPBdfZP7iik3qDyIKEsxNQt0YUTMyrEuOq/F7gKiyI3md7o1MW5Ce4a2ebTGtAhzPklV
	Wp0ntKudT7rbjpP4el4gRbYnsVvEG1rX/Apn0EfIerhENy31E5M1z1ynIEdep7nrP8V4RM/L8EY
	ALHkcyXiJO0+EO9WtIulYEwWrYrJg4R0KrXjVGIvBZeRHD22Fgqul3c4bzGIzeonuvO74zR/ttg
	HKcJnBge/pi1io2iNmKBiWWRBhKixdBrfOfqzi4ZTjYVULcdJ1Fb0=
X-Received: by 2002:a17:90b:3d12:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353c418d276mr1450186a91.37.1769351631814;
        Sun, 25 Jan 2026 06:33:51 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354a6b06sm9351073a91.10.2026.01.25.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 06:33:51 -0800 (PST)
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
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v4] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
Date: Sun, 25 Jan 2026 14:33:44 +0000
Message-Id: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_063353_300332_C4B13082 
X-CRM114-Status: GOOD (  12.78  )
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
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V3 -> V4: Fix typo in Signed-off-by email address.
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
