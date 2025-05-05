Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA7C3ABB6
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tvvYjZbpMiU/L6L0TTpNF5yjaOhI0bXuGkVescae90=; b=DWet1wKkfYVlkm
	DV97qAg7lk4wxn5cyS8J96mAm9d4kTTDJl+VyU1v+lrUfdLNAWHt6DORnSkUayUfsOqga8L2DGU2Y
	kRYjpnuiI9X0TE7SPBC2u3OZrGb+0R5UHvOnUKrwf0O431VC/m82VmIGPZpim5x1g3PaPf5/iAj8q
	/+3zsA/1UNIKezrAh2JnMEQ6abkIEvtqWXucPmyK0oGSrKRbZNDAE5wIxwCsIy1QYcpLsftOAYZO0
	9hvBe7Rl860gliNnH/tqFx2Sjx1Z09P8PJNTOeIWfbZ1ReeFCwmvOfXiA2twHiS+Iox6LKZJ53rVx
	xftaS0/s73fbbWEPwO9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3as-00000008eS8-1d0I;
	Mon, 05 May 2025 21:43:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XT-00000008dOz-1wq6
	for linux-riscv@bombadil.infradead.org;
	Mon, 05 May 2025 21:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=; b=TCYcWQqGG/dKccNWIk3wdj6WdQ
	mP4TveklMV14+l5IQIybQ+xh2MJR+bIZWj5kPl9zgk8YIFobQbdXTZgXqr7NqBRYN9t5El8BtoWgA
	42DGLW9vRH1lq6G/nVPNVvSjL1hZKCQRmVX1tn/oVfthAAWBR9bZXLaMtFbgnC+WdSD8zfETwB7x6
	e1UuBELp+LPnh4IqP/Uow14qEfPZ6H7WA2RAPpSu9jNvE7K/Ioio6MkkIjstH7nq/DQZ7lX6s5yvZ
	cnf6YMB9C9H2JNh50s5K63st+vfun4Z6zr2+6N59qJKiPYLYIGGPeXcB6BzlbGCJY6n4gKZUwCdX+
	R+PBbdHg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC3XL-0000000FYCj-2nz8
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22401f4d35aso58349595ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=J6tJm97rYmgYEtSNDtDEa5rPqKqQVzxMWzOFPYYZHJkJbsfVIlopc2vYbxRK3nrq+N
         3zAeVJqtMZP99mRrPK7EnYxrF6kb0zfqBNsuxxZk2PagP3qalJoJDTI177levASD1pMi
         dOIBugxxv2fxQmT20tXv++YakUXuQE1ZR4uDtxHeQiX5swsQTD83GPrlHNxPfPebR7Nr
         5hQ6NQn2H0v1GrN+o5v2UTdX3Nt8UhBLFPpfPos5t/TGN0iwB13yLpWsgvKhrNGOYKwg
         L4YCjCaH4eSIwFlloI8owWTjycFIMWlsU/XN5tNEhV0a8DD+rgIUBCCQrRWli/735UNr
         +gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=fbXdfuePXKdukKaOTNV15cwrt6kBCa4z6KvaYlgARvcTmzPOr10sroNT+GIdfBEtVI
         0FT7bBZWKuf2LCD77+M3VML+59IM095in1Bv9qbGhSnq8T7y9C/I637KgiSAqu2jFxVM
         4Nfqk35Qk7oDrRRybQQNAa6G+D/ZDx3ZMa/neo8WuvaZ9a7Vc0jABy+U6NJlhk38tNDU
         s18bKRrqyTNtQ+n6+N9f4XvKTu41wpGkgexe8uHjZYtDXD6Nz3iPjn8gpqJ0Vamtchbg
         cf2tnIkXoC4wU7VO6iXk4ADnHxc0MWTl3dpNfsKaDQx4SoLay8tSLWcpxEhErydrUpbq
         FWAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJLbdGuiky6ZDRgF+48hG617X60pg0zS7dEWiMVBSm1ETpRnmOT7Blq2oEzDfg0JR8hhJegR7VKNMtQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3zG58hKV9x5wmUYuSRggyupggavkyrGcH5s3XPRK1entsf3OG
	IU1N+rOy7Z/aS66nC/b/Ly+VFE0ehNd+c+Gf7IbigMvkiJ/lZVKns14rOF9hC/cPSoEjqBtX7ey
	/
X-Gm-Gg: ASbGncso3LAJZO5Im6BLCgf32Nke3Kkz1LFoS7SlK/errIZJZz7PuGtfbmbwVx2RiVp
	Q5+yaK/jH4Ybd5Rw72gtO50MvGiAFqU5IZKLretPZP9va2nw936NJkWnH6ggWuiyCCWLURygXZ5
	t+dDQo/LnSkYXXZYTUQdlvFsoj3GfG/zy9oxy2Q8NeEpjVLOjHSt7N6xyXIWSlyBMvAI5eYBaWp
	uKivSBabh4u/cJpMILF/cK3ybLib16LAdrsE6SZLHoYq/wa1XJW01PcEPAv0tCPZahGB74DRVtA
	oRnBShynSnwFlHWDOfHNYu6YrpwLSiTP6bY0Pr/ZMq1l7XQ60ZB1Cw==
X-Google-Smtp-Source: AGHT+IF0cdGfyegYWS2h3g8K1ylrRO9RH/TBuX+Z6nJcjOdwQsA79eqmv6Tj/3cv8UZxiuHtVwsgFA==
X-Received: by 2002:a17:903:22c7:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22e3633a6abmr7949715ad.30.1746481180682;
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:30 -0700
Subject: [PATCH 5/5] RISC-V: KVM: Remove the boot time enabling of hstateen
 bits
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-5-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_223944_046085_D28E94D0 
X-CRM114-Status: UNSURE (   7.58  )
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

All the existing hstateen bits can be enabled at runtime upon
first access now. Remove the default enabling at bootime now.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 60d684c76c58..0aaa9e0e4a01 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -560,16 +560,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	    !riscv_isa_extension_available(isa, SVADE))
 		cfg->henvcfg |= ENVCFG_ADUE;
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
-		if (riscv_isa_extension_available(isa, SSAIA))
-			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
-					  SMSTATEEN0_AIA |
-					  SMSTATEEN0_AIA_ISEL;
-		if (riscv_isa_extension_available(isa, SMSTATEEN))
-			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
-	}
-
 	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
