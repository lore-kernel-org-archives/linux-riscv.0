Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A138FC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 22:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1szhXT+D+p76kh/DFiRPPdZnFcK2JaSb506tbzb8hks=; b=ShT
	HNDm5AjE5Gidy4t3cuFZZgVnU9E/3KBqJdTZJ51eWsvh80waHdU+DASwkpmRkJYmaK2ECve21DWS8
	6sv7f+d0hU2S0Q3ZBWfts3KI2EPZuVRWOtV7sXI6gbda4Igcb7XNiYG6zzShUGAr0of9+Nsp0m5+e
	2NVXL5+JP+H6ysU+ek1HpkvUThIU9V+KyzXMJMXIe7n8LesR3Z3XNweaLXYN67YC7kycnRcL9NVZH
	fkLWOl3h+rc/Isuie+zXQ6PSlYOuoa/t2ZoSU0demxAmJTnDTN6gdRpuD/QkT75Gs6g8B+POfaUo8
	yLPTgNznZXMS4ep4X45eFvhcljor7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Px-0000000B6CY-1vvV;
	Tue, 13 Feb 2024 22:38:21 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra1Pu-0000000B6BF-3Dak
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 22:38:20 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6077ec913f0so31287177b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 14:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707863897; x=1708468697; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CfHqPDKZSILy8wF93jY+PBQlYR8jUuDqYcw6uvluZVk=;
        b=Ew1Wm2PnUDCtsgsklPWA54oy3LCVSqs5i6uF+uOu72nUW7+LSYLXIi9ndZPDLZwZPh
         n6KHw4n36287xNq5hAJfIdOa4hys8iStnaLYVnbbPRPOwqzZWLml50R91Wp/VaUqwRRC
         BIjR4u2bsmXPuYi6vEuIiZV0BQKSAB/qsF6Ia0p+R8DG2tH/Blwxy/WU+1xlPbVqWZVI
         nVss0nvXRsasvav211V4tIk8/sPVu50y4o190oQvMkolamUyLYdSh3NxwN1qpD+O3R1z
         aTF0XVBh60syH5/4s+KrskahHITr/J9E6/04sLq2lr2P2g6hN34VsgvD1Pfpj1dTWfOM
         Zwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707863897; x=1708468697;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CfHqPDKZSILy8wF93jY+PBQlYR8jUuDqYcw6uvluZVk=;
        b=UV/QlLcYShaal8Ff3Ti8gkIbSO2ede9VrRLkOGtEnpX37I28Lx87jvYo1pQW+9VUEv
         zDp1zv2Ej/tWIohGVuPppZYmqKm6fnAnQie9dXLzHvfY98D4yST5CT/kqoaJxYV/YAim
         0ZqF/vOAqZuuwwxqrob42E8BUPxCI6IFQ6KQwMdJJ3w4MuH0HzhTNhUYKsC7GS03Eq1E
         FdsiMyCxpNKA7LBsinbwr3L2V88fgVUaRQBEVXDHyS2U53p8p92noOz+I2yLyZKfw7/Z
         UlPm8AZLWUyUqN2VqljQCnSh96jnHKiMZ/xWLsec34YID7vR1fknTdE915J1C/VvYZq2
         X7XQ==
X-Gm-Message-State: AOJu0YwNHyGQihYv+k+h2RoEoco4cYtrrMpHXsF6WnyiU96VQmJtDXJm
	Auptj7P8jkdCaSZmyhPRBp+SFY6hUr2y2Oz2+m/sCUcVuLYcttj/fH/HILYvCMRgjPHdplveWYU
	UnDU2R6TdkSlC58kJTg==
X-Google-Smtp-Source: AGHT+IGYHWVD+M6IZDD5yA/7KbHciMkZjoVTii4uO+v/Mq8hqyWAFUVfE50fvfODJp7k/KiJOvBIsrCx/lHz03WK
X-Received: from ericchancf.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:4139])
 (user=ericchancf job=sendgmr) by 2002:a05:6902:1007:b0:dc9:5ef8:2b2d with
 SMTP id w7-20020a056902100700b00dc95ef82b2dmr175464ybt.4.1707863897101; Tue,
 13 Feb 2024 14:38:17 -0800 (PST)
Date: Tue, 13 Feb 2024 22:38:09 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240213223810.2595804-1-ericchancf@google.com>
Subject: [PATCH v5 0/4] riscv/barrier: tidying up barrier-related macro
From: Eric Chan <ericchancf@google.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ericchancf@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_143818_827383_1B77DC41 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

This series makes barrier-related macro more neat and clear.
This is a follow-up to [0-2], change to multiple patches,
for readability, create new message thread.

v4 -> v5: [PATCH 3/4] __atomic_acquire_fence and __atomic_release_fence
omit-the-fence-on-uniprocessor optimization, and fix the typo of RISCV_RELEASE_BARRIER
when spliting the patch in v3.

v3 -> v4: fix [PATCH 1/4] commit message weird line breaks and let [PATCH 3/4]
fix the form that can pass the checking of checkpatch.pl.

v2 -> v3: split the patch into multiple patches for one problem per patch.
Also review the changelog to make the description more precise.

v1 -> v2: makes compilation pass with allyesconfig instead of
defconfig only, also satisfy scripts/checkpatch.pl.
- (__asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"))
+ ({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })

[0](v1/v2) https://lore.kernel.org/lkml/20240209125048.4078639-1-ericchancf@google.com/
[1] (v3) https://lore.kernel.org/lkml/20240213142856.2416073-1-ericchancf@google.com/
[2] (v4) https://lore.kernel.org/lkml/20240213200923.2547570-1-ericchancf@google.com/

Eric Chan (4):
  riscv/barrier: Define __{mb,rmb,wmb}
  riscv/barrier: Define RISCV_FULL_BARRIER
  riscv/barrier: Consolidate fence definitions
  riscv/barrier: Resolve checkpatch.pl error

 arch/riscv/include/asm/atomic.h  | 17 ++++++++---------
 arch/riscv/include/asm/barrier.h | 21 ++++++++++-----------
 arch/riscv/include/asm/cmpxchg.h |  5 ++---
 arch/riscv/include/asm/fence.h   | 10 ++++++++--
 arch/riscv/include/asm/io.h      |  8 ++++----
 arch/riscv/include/asm/mmio.h    |  5 +++--
 arch/riscv/include/asm/mmiowb.h  |  2 +-
 7 files changed, 36 insertions(+), 32 deletions(-)

--
2.43.0.687.g38aa6559b0-goog

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
