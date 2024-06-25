Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41235C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaqQoWdKLsrEoLDpyNJ8HmBzEBChs2FZ7DejVoVyCQ8=; b=lwvL7WtDCX7sSD
	hpwqWeHawne6d9HCDcvfvkQqC2aqPpMI+HzWQcQjUZLoWp/AMxcWR87QHLaOIiBkQ0jM7pzol72eS
	ptfqRyMv2WVgB734mVqva3MNZLpy+xhZM8rkmWc7WszIx77ykxe/yh/teUsD9GnShRQ/1y1gJfMFM
	aWOICGYv/rWMDtj1qXyk/OnWY9BqNEsZj9G5vzOX5fDpXbwapuRA3Cl9ophDmAJ6gheG4CBmBaiZG
	uGIUI23cHxrse+kotV0IdsBf5hLaTsmoWelz4SSzwkojlty/55IbQFjmr5ysbPTU38qMxOT31/v27
	8fdUj6nkGyvJnz7xtUGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQU-00000004VLD-2CVi;
	Tue, 25 Jun 2024 21:10:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQG-00000004VAk-0d6W
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:54 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f9b364faddso49242675ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349791; x=1719954591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmS6vWk00EfafKWbKkl85gc2oDZFAwwt7tuzVTWTGwo=;
        b=nX+ohpKFPLENKSirvNKqu+zoh/UvCgiql1fP4shoKiIO2pr/YmjApwx/2S9uJ/x7m+
         LSkym/lS998RWrxq4XwBKkpQPZukza4121MmhsBOk7rMmIGrlk4EaYNBx/Tw6F0IH979
         dBoi+69YNaKG2/E6BI9ubsKM5DInNTR4xYIhvteNKT/SoAvHPiZF7xgc8uMooddTSzWh
         hZzCpo+WS7Yie7qQdvLRVfGfnncnOuX2sHBP1hbXGNbOYAjwJg3AWTL5Tv2T5daWUguu
         vSnZJiCOEOAGTMS2WqUQM32yQovqKT9V5yvg0JgSVcNNuKLcKA9vaGWGtSxbIxXGSzD4
         numw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349791; x=1719954591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmS6vWk00EfafKWbKkl85gc2oDZFAwwt7tuzVTWTGwo=;
        b=VBjtVwQJHg/i1v27NKSEjsQ9pT4gSra93P2dquz6eUiOOLvQbZAoBy8cIi/pxcd+hS
         8YGA4qrgLRuZp/rt4L1WdiguMPxqTbpJtBDX7yyWmI2C/nAjdco4pdOrzorGN94Csr9v
         qNTUcs5oPb0m6JLrtyFGN03gBgnQK9Zf0ZnbfTkhfvuusXp7iYA9VaeEK54agHv/Ysik
         yZHqtIeUvyx+xVwNDY5IHVZidrt9ZUrELCEee7mvGnIXVGYLbtuJ0vI4lqv/MycaVaGI
         036/6lkbO7ZLyINyk1iOnXaiuURXlfyIt53qnZyJcqSu/+63lFi85iiP5upSnP2NIdaV
         Z/UA==
X-Forwarded-Encrypted: i=1; AJvYcCUpJg3SX5c7n5tQS0EpvPhwjT/PnzSKuiorGOB2icblTeAwedI3aEP4xeO25WJF4m8s51nXk1gPxGG3ucntXEW8WFwx5xRV1+nObThFa1xG
X-Gm-Message-State: AOJu0Yz7P6eDm4vaOCDhqqiK3esV3SZQttBVREVxxApm29Js7Ls5xWUS
	TCG8C48Ws0trjxA9w3YO0phYZbQY66eZb8tg8nR2pGYbaq9HayLNdDpkCeAn1ZI=
X-Google-Smtp-Source: AGHT+IHTw5qN2SpgPrcqrPEXyzhXThDZldXGwPxQ/Q1c/gHxKEx75NLlZ00CvfUvOupr2aJXM+dfMw==
X-Received: by 2002:a17:903:32ce:b0:1f9:e95b:5810 with SMTP id d9443c01a7336-1fa24082313mr90605365ad.53.1719349791487;
        Tue, 25 Jun 2024 14:09:51 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:51 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
Date: Tue, 25 Jun 2024 14:09:20 -0700
Message-ID: <20240625210933.1620802-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140952_755955_DE1EF0ED 
X-CRM114-Status: GOOD (  11.10  )
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

The interface for controlling pointer masking in VS-mode is henvcfg.PMM,
which is part of the Ssnpm extension, even though pointer masking in
HS-mode is provided by the Smnpm extension. As a result, emulating Smnpm
in the guest requires (only) Ssnpm on the host.

Since the guest configures Smnpm through the SBI Firmware Features
interface, the extension can be disabled by failing the SBI call. Ssnpm
cannot be disabled without intercepting writes to the senvcfg CSR.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e878e7cc3978..eda2a54c93e3 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_SSCOFPMF,
+	KVM_RISCV_ISA_EXT_SMNPM,
+	KVM_RISCV_ISA_EXT_SSNPM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c676275ea0a0..71c6541d7070 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -34,9 +34,11 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
 	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
 	/* Multi letter extensions (alphabetically sorted) */
+	[KVM_RISCV_ISA_EXT_SMNPM] = RISCV_ISA_EXT_SSNPM,
 	KVM_ISA_EXT_ARR(SMSTATEEN),
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSCOFPMF),
+	KVM_ISA_EXT_ARR(SSNPM),
 	KVM_ISA_EXT_ARR(SSTC),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
@@ -122,6 +124,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_M:
 	/* There is not architectural config bit to disable sscofpmf completely */
 	case KVM_RISCV_ISA_EXT_SSCOFPMF:
+	case KVM_RISCV_ISA_EXT_SSNPM:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
