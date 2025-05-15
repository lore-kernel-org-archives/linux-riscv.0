Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB41C2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nwIRbbbNP4D+QsvanRzWj5J6GkeS3PIk8Wp/Fy8Gb2Q=; b=sLdC3YEzz7mOHU
	4ythBlhmX7UKYnpZx97c1kZcbJPgDWATifwx3ZNWuVW1Ww4H3NtCSrDYak8HEPUbfkbs8NGTFI7XJ
	ZBvRABtG2TMoxVbcDJHBCM1A5CDrg0Lh0DjnAa/kQnoe/lmYLAcG3jQx746qoc+KOp5I45RJL9+pQ
	4R5gEOpvJ5mKlXrFABvQHzOT+6si41H85FQ9n9Gvy32ORnwvAS4b3E87y97xlGZOZQcEHcREbwJQk
	CFRLv45DUllM9CVpodfP95DpJvAcZcnDpCJ/0d6S4CbMovq5YLtKvtgtqIA7G6FJ8cNv1HDa5m7am
	mIJoSfgvcVZB9kCE6Jhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgiT-00000001x8a-3eJ5;
	Thu, 15 May 2025 22:06:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFgiQ-00000001x7u-0QWH
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 22:06:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2317d94c9cdso14495155ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 15:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747346769; x=1747951569; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=nasvshqa7jts2G9SX8bVkE2kueTIw+JW9g/7ISxoEmshFpaOu7buRDqVAtoh6VDgPe
         byzrYe70IFo5rCCFa9Yc9y/Scloxr198gtZFTeurtSkcyJNyo6ng6+x9pmkww4yayZCS
         Ce+CMWYQB208JLpy31KA6cGYJGu7Ae2RM3DvfmmUIJ3Tim/kOdZWTwLbba0+ZOuQ7wNk
         u/ssYK8dUwLK6HU8uiD4DuFqb+LQot+FHO2D5MjeS3OcSNF2gTraDjIbmzxecFrcOrfx
         28zR7NOflhaXLA6QIT+hqVfUrP9K9ks1gHSA86Zd7wzDMwJGaTpwTqhyhExzAwRbVSoU
         BeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747346769; x=1747951569;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKEzAEjPYjOvvo8wW1NKB/AseRp560F6iFtwwKSA2eo=;
        b=XTXYRQFkEvYQHfjapNONQOX5CXHpk+MneOBBqTAjFaPk3HdWfX8WjniWlGdCcFu8LE
         vKW0kATed1TInjQ87Ah6EA7wtbStGbf/sW4AW4Gi6WyPjiND3u/sqHUaG/Zj8fr3vjFm
         J8tpHSqZj4fCGj2EL2k+gXXuZ+riYQMen++20nsySlEsqReoJ1Wa2Pdt98jiD1itTUTd
         LC63IOSgYARw4dmbJCz0GopMwnVOCx+LV5uGa0aeT7RhaQdmdeI4vLBCmOgknsNMfPQX
         u1R4Lfmy211i+8cFqpaaZnuV/5MF6MLyB0VYpSBgeylx+ccBy7+YiBIv2EqDzrXy+NyT
         7W/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVv6do1LoznAd7O70FwoNGtFCNPylRydEC6SP++HFFNpWggSYgY7uZSJgUr8TE2Pf2RYL4+qLc2hi3EA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGu3BUOKE7yhdSqal3JnsXxbFgQdYX/Osv9mU/lNTwLk1c4oFe
	xCdgc3+HUtB6js0JyrWzJaKcu2lwnDkfc0ylP3DLzOagY+kci3tWaZR9rynk7WC26i0=
X-Gm-Gg: ASbGncsjhKSGyN8/21qPSZrkpYBvtUsCrmC7n290Trt0/S0WoSJUs3k1le/JJcwOzLX
	B6Rh8DnniwfiJ7TlrDZ+WLKm01tkZLuq9892QOOR80pKtR/OzUGliw9wqgUyccZoGNBp9gUefJs
	Qa4YnPVHNg5wnaoSvXFNyWJA5HpBNzJJuSu9Z+wZ0kHoWH57dZFXCyCnlAq3hlboC+c430JpNie
	LW0LHc7vBzC9WEDIwYX7OE1yB7JLdjRW8VFmP/MLgC1TRJZkmSVi2HZqevknQCgKetCPrpP/Sb7
	phxcA5Ip1cnXP2BAtVIeEWM08xLGM/ZwvWh1hPiRI/XSPPxn+bYsQUyHj6Za1OxR
X-Google-Smtp-Source: AGHT+IFiKNNYtzCEg6C6XYe7DP0nZARy3KIK4XDqNnkJzROZ4X9NmluwSJ7FFKC6yeImxQGIHZ2cIQ==
X-Received: by 2002:a17:902:e805:b0:22c:33e4:fa5a with SMTP id d9443c01a7336-231d43d9c05mr11341725ad.9.1747346769141;
        Thu, 15 May 2025 15:06:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed25a9sm2470515ad.223.2025.05.15.15.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 15:06:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 15 May 2025 15:06:05 -0700
Subject: [PATCH v2] RISC-V: KVM: Remove scounteren initialization
MIME-Version: 1.0
Message-Id: <20250515-fix_scounteren_vs-v2-1-1fd8dc0693e8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAExlJmgC/32NQQ6CMBBFr0JmbQ0tqYgr72EIwWEqs7AlHWw0p
 He3cgCX7+f/9zcQikwCl2qDSImFgy9gDhXgPPoHKZ4Kg6mNra1ulOP3IBhefqVIfkii3DSdT8Z
 abO8tlN0SqZR2560vPLOsIX72i6R/6T9b0kor1M6a0XUNtt01cgrCHo8YntDnnL+d7uw+tQAAA
 A==
X-Change-ID: 20250513-fix_scounteren_vs-fdd86255c7b7
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_150610_407447_25F3D13F 
X-CRM114-Status: UNSURE (   8.82  )
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

Scounteren CSR controls the direct access the hpmcounters and cycle/
instret/time from the userspace. It's the supervisor's responsibility
to set it up correctly for it's user space. They hypervisor doesn't
need to decide the policy on behalf of the supervisor.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v2:
- Remove the scounteren initialization instead of just setting the TM bit. 
- Link to v1: https://lore.kernel.org/r/20250513-fix_scounteren_vs-v1-1-c1f52af93c79@rivosinc.com
---
 arch/riscv/kvm/vcpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..fa3713b5a41b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,9 +146,6 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (kvm_riscv_vcpu_alloc_vector_context(vcpu, cntx))
 		return -ENOMEM;
 
-	/* By default, make CY, TM, and IR counters accessible in VU mode */
-	reset_csr->scounteren = 0x7;
-
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
 

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250513-fix_scounteren_vs-fdd86255c7b7
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
