Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3902CA6CAA
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o0rWtVZUorNHql9VSp9oNXdFYMGhb1ONrbJiJ+1BCQE=; b=FpyRm0am+WF/AJ
	thErkIdcQzdaMhvsbY9FWLYs6yQVGM8FVAvT0MCsZMm8GC+Kt/G/7ywTI4bYqxP9I4P1QrKhw1DB6
	pIr3J+qbaDUq3X6tcAlOhIFurLi0ubULrifJRUZ9Uvt/2KueYEz6XT3HO4fSFKjSPM3ZtOTlSRiqb
	ST9Oc6+9SpmOuqKtMGHxO/3Qb7YDuA2wROoiBXEwLMOjZ4bxWGiZlcGMYXH87dh/ST6opUatc+ZZ6
	9ciAuUHuNgqeHajBKO/rkCcA2siCLc9lF6Xqbh1IwbjLv9fBgsxXXyMzi1TICb0pkALfNIp31FZBf
	Oew/OtM1B5LO799oKQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeg0-0000000Dr03-2Fo2;
	Tue, 27 Jan 2026 08:43:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkefx-0000000DqzI-3gqu
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 08:43:55 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a743050256so35817135ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 00:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769503433; x=1770108233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsvMU6ygmVPOfBtUBm6r4nNfbsjDFVMoFcdeUelLuBA=;
        b=aoFH5Hi0NoDFrFQqg7EjvAy1AuipN/i0ocEGAmwn5yG4GFQ+fxarVo6LMh9aceLhd1
         999+fYlfTMhpWGBeGaDcMEMmKc1YyXXR/rV/dZ+ROBJKwW5UUVeWmcR7ZJ1N1NFU6X7Q
         lIE66SNeistSnUHAhzP9VjVwcYtKecz1p5SQP8WSwpUvBZ3ulB+RGp0LxMuxiMmYaGN6
         w27N22mwLEpQcENh4a8kivfifvsm0skK2VpCJ4UvWtzMlX0ciXfMI36abtn2zL1LwClg
         hetyDMxyWz/6E1T4m0JNEa39r6WOYpt2iGePQc8W+VyT859H9L/6VP7kh7YJBTRbm0dt
         6U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769503433; x=1770108233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsvMU6ygmVPOfBtUBm6r4nNfbsjDFVMoFcdeUelLuBA=;
        b=s2/Wr7rz9Uf1iIYP0XyclYMBGiAVrCYts44CZH6sXKSYa/5ttiAeUEJy0eiXeTE8GN
         +Gw1eb3yzHThUjRy2rnL9C0eUCrTCf/2GmInQIw+gHvxDqA8vgIbdZEDS9SCz8gsicnl
         eB+dAGNbEHbbi4W6KATiKyr177NDZhJVk+wOke+EBOG0LI/G1ZgZXl2YNupnu0+69kS/
         woJcIZgyIoq/EiT5z+0+4wF0H26h5O2xS01fwGobxOW/BDYU5M4TxgJ+ZcueHmI6aLcX
         lgirlK2hJji6s1UVljZZ4eRmK+eH3kRlFop1zZtK90mSoS6q4kPl1wZhIbSR9j9z/vzL
         W7ww==
X-Forwarded-Encrypted: i=1; AJvYcCU4S4KVG7yGadkSJXdFlqz/+bmF4YxMNalYRpzDkEK/YDADazlNEwZVuAI0mSnbjKi1sJfbCxoueNIRyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrnWx3Iefo8lXAm3wtwB7SAelw8rKXV4njX0Ovp9leM/YIMs+e
	G7UdE/dOHa6r7IyElqrZdgl65lXCrg1KHa2lSJdzraaOxL12wvtjETtY0eQQFWVKHHM=
X-Gm-Gg: AZuq6aI3+YIkP1EdfQaHDv7UKK/J0zELtVX5fp7AxT4cmChTPR9YvlfSjMaH9L/XCe9
	BfaXq0TXN8MdDFSTQ4LoboBe/iFArURLFe4q3sOFeu4x1x+QdMyN8GRv3aNAmQzx/xdEVQ3OMIL
	OxFTLGp2e0jZfbbobaa7tmDRqG1tGxUqFZokyWVYaxjsEZSkF13rSqc4vkaqb9bk6oSEe6AwB3n
	dtxI1RJXSIgOVp3KOltxlfonIcGrR9t2JxSJqlV98NSZ9ZLFJgIMAeKYWCuiOxu7YMFTW5hLG91
	wLHKq1G5v+u7OANUbsnustEpRF75PhPE7coKpNOK+zbQM934AK5DQgv89/YCnsI1eFJ5jQ3V0WG
	7mRTqUO9iSMmhts3psaZBG6QXInvID5G5OegPpxWvG3KFuJyuJ6pnVSOH7Z8DNfTn2ntebfqb/5
	o2qHZyHNbcXpwSTCAts/8ZGDyzP4qmJuE35tkghugS
X-Received: by 2002:a17:903:2c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-2a870d7a907mr11402265ad.7.1769503432479;
        Tue, 27 Jan 2026 00:43:52 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cf8sm108838235ad.42.2026.01.27.00.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:43:52 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized
Date: Tue, 27 Jan 2026 08:43:13 +0000
Message-Id: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_004353_947368_12CD6C09 
X-CRM114-Status: GOOD (  11.64  )
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

kvm_riscv_vcpu_aia_imsic_update() assumes that the vCPU IMSIC state has
already been initialized and unconditionally accesses imsic->vsfile_lock.
However, in fuzzed ioctl sequences, the AIA device may be initialized at
the VM level while the per-vCPU IMSIC state is still NULL.

This leads to invalid access when entering the vCPU run loop before
IMSIC initialization has completed.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff00000006
  ...
  kvm_riscv_vcpu_aia_imsic_update arch/riscv/kvm/aia_imsic.c:801
  kvm_riscv_vcpu_aia_update arch/riscv/kvm/aia_device.c:493
  kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:927
  ...

Add a guard to skip the IMSIC update path when imsic_state is NULL. This
allows the vCPU run loop to continue safely.

This issue was discovered during fuzzing of RISC-V KVM code.

Fixes: db8b7e97d6137a ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_imsic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..a7d387e280d49 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -797,6 +797,10 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	if (kvm->arch.aia.mode == KVM_DEV_RISCV_AIA_MODE_EMUL)
 		return 1;
 
+	/* IMSIC vCPU state may not be initialized yet */
+	if (!imsic)
+		return 1;
+
 	/* Read old IMSIC VS-file details */
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
