Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8C0EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 16:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0xX6M/M7ACdQh+27o5dXh71E2/oUEYKhm0Y30geEkXM=; b=oS+6m646p4KVgZ
	IlYwurJ0EPQdv8lXBn9XbBFCHu50nBfqWxVqAoF5mcjLghppFlHADVtyA2ocibqUhm1fbChTMkIdI
	DReuUwXMMLTy/ag3WZ6yDY02HS/nCeFc6wAHvf9A93an0tMkr3i/j9FZAXtc5pHwDR9aOPmyI50ti
	j8fYRiTE3KwvWa4DPMXCwOAqqK0XOAQnIkDh3rzHfW6L0ZsuHDhL4IBwflc79Y3cIn0rctFnjMDvC
	WZS1y9IGMAtdhPb/5rgdx+K6jtVVnGaPkIVB49O1tZdhpJ1IscdK214naHvLJB8C4CPsMxx30+3G5
	2kKwyIwsYDC0feaDyrbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9eb-0083G8-0K;
	Wed, 19 Jul 2023 16:03:53 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9eW-0083E8-2w
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 16:03:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6687446eaccso7040496b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689782626; x=1692374626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hc8CATj9nkJOW21Ag2xx0X17Rq9jOlUFNgbDSzYER7E=;
        b=LpY8EVBFrsrom1VQP0GEjHN5FXULRKjV/5vysLPf/WHDFRkrytj+Kg8kQ4ecsM6Mag
         TQ2hCuwy5kFuENmDhNlLupUGPzYD2gMqJkT3dLOZpZ6tgz572JZRxzOzCMtP78qpVNpB
         isdr46OMHbzgy3IuE1nwUg+w7v0lMYGgUkCx2bm/NSK9ECozMaAI4JBu4GzN3L7pJWig
         ez+zC+0jdu6Sxf2HBECKiITiD/A8+8uuaQ/wG/h4KNlewM3bIWmXvXnmTf2IuanYMCkm
         AcCX3/pMhtjuP/G/uzbfDgo45JytAfx0c5lT4f5qEim//rysSQ3nE1f+8umA67ZlIexM
         KwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689782626; x=1692374626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hc8CATj9nkJOW21Ag2xx0X17Rq9jOlUFNgbDSzYER7E=;
        b=Azah0g1avv41aeiTT5v+9S+x1YgDHv+iJsSh+EJiIfdibs25765s/EZnHKUFqvYirt
         Y/VJoxWnA+b027qw4+8UH+sU4Vry8HnBXGqZYJCacu39mWXedZ0S4HSgpaUbOM/TwlQj
         67VALUNxU2XzVvTMpQUsHpJVNVRRdJndzDQFa90LYHdOPfgl+mD75vAzReovoutVrAWa
         2f23idI2zA3Y9G7xuUufHWgvC5WIQwLCIpyujaHxMROEO1sEcAFmAdPReeh61ccvaLdc
         ryaDGUwQf6XaGyweWko8OoTDtaN4AZ/FI12HwBfSrXdbHuJSFnQvRe+crrX6qdiUgu07
         utvw==
X-Gm-Message-State: ABy/qLY6TvtOdXCjUFoFVp42mV4MS01DfrAoYn0YzQvApquMo8zqWp5O
	pVGdDjLkFdIsFN5aQUt/O5y4Ow==
X-Google-Smtp-Source: APBJJlHAuhkdoXx6QH3B5wwHXAeNd9kM5hqG3zr705ciDzeKLXtWgBrSDNpuy7wCgEZjwngSHkxMgA==
X-Received: by 2002:a05:6a00:2293:b0:682:7d8a:f891 with SMTP id f19-20020a056a00229300b006827d8af891mr27910840pfe.20.1689782626344;
        Wed, 19 Jul 2023 09:03:46 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i22-20020aa79096000000b00682936d04ccsm3447023pfa.180.2023.07.19.09.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 09:03:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v1 0/6] Risc-V Kvm Smstateen
Date: Wed, 19 Jul 2023 21:33:10 +0530
Message-Id: <20230719160316.4048022-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_090348_983189_8112D438 
X-CRM114-Status: UNSURE (   7.33  )
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

This series adds support to detect the Smstateen extension for both, the
host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
interface and the vcpu context save/restore.

Mayuresh Chitale (6):
  RISC-V: Detect Smstateen extension
  RISC-V: KVM: Add kvm_vcpu_config
  RISC-V: KVM: Enable Smstateen accesses
  RISCV: KVM: Add senvcfg context save/restore
  RISCV: KVM: Add sstateen0 context save/restore
  RISCV: KVM: Add sstateen0 to ONE_REG

 arch/riscv/include/asm/csr.h      | 18 ++++++
 arch/riscv/include/asm/hwcap.h    |  1 +
 arch/riscv/include/asm/kvm_host.h | 18 ++++++
 arch/riscv/include/uapi/asm/kvm.h | 11 ++++
 arch/riscv/kernel/cpu.c           |  1 +
 arch/riscv/kernel/cpufeature.c    |  2 +
 arch/riscv/kvm/vcpu.c             | 97 ++++++++++++++++++++++++++-----
 7 files changed, 135 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
