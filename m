Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 366D2C52D7F
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvb0jXdd4DpmtLZyWvjjN4RrZbNhj8BoNFEHG6jn5XU=; b=kzOCEHOuMZs3L1
	tA+YieqZWRHohQ6cROfrtO8LMIgFeuV6T+I3tkaOvAyXNfg34t3KjqF4/Ag0JCMSWXWUNddmd3pFL
	Ror28pRcKagWhGJLxQaeTt+PlOMUDy6YZuC/jZUa8RAxETELRmJtcl6sa148hWIJhNU/FUm9RkcdN
	5zd4ctE0CaZz0UD86VMkleMyz3NOgBVhEGEGLc1MJxGnsa2voXOnTIRiMPliYUv4akgECG3Ep1E5C
	AIL5MtIYVavcDfft70ivEX7JbPftygyRVBK9UxenZ3ZL3ufgJi54RpgFmjpWSWM0BLSKdC/nBdtiL
	xHyuttbcvm+7NZsyir2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99p-00000006ClQ-2Ynj;
	Wed, 14 Aug 2024 08:15:01 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se99j-00000006Cfx-0vL5
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:14:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fc52394c92so57686445ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623294; x=1724228094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVeUN5Mn4knmfhlWREJV6zJkPuiqFserRZxouOs1BJI=;
        b=fT0I4bo5xCJA9lbysGu4nrAZL8/P2hzbSZZQb8Zc2M7UdhGXDvHV16vBaxZckn/yT0
         neldIGRdJ1snqVcg/mHupYKqnTZuPq4N+FqKEBnMGNfiOgDOY4MJYx3fxE/gbu8oy0W3
         r17TukItPiJuHUsC6p2rWvjNPVbhIiV0wixUnIndqsWsf6Iv6i1yZCinGCbpL1PuR7wn
         76ENuzlpsaZj4YUql25gnk3FdqR47UO459E0nP2h4OzX1GrcEHsmsz3JNcNwhUzaQSGt
         qGX0uYNsk2SXrSIQloGmTa9uQgXKG/ufPiY5moqTVe4bid3VgZbv7BloQvcfkjtUvukq
         5qUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623294; x=1724228094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVeUN5Mn4knmfhlWREJV6zJkPuiqFserRZxouOs1BJI=;
        b=YKrYaOE0Bw84yqy1zQToRRrAeUNZZxuO4ZCSv7QnqNXywYHzxqjPxMa9tn2AtHzZQh
         l+UQA/Yo5J+KZ1Wl+EjvUG+kKYSpO2vMMvQssN/ChDXZsvoNTaTP2DPXaC62Ev2zwAiB
         lAJqwOfWgJMuQVlyPMPDxXKlDroiA1q6ax19yXrd8iBqSPEiBe9JXm9AAvkLjZpCsWTh
         P01y7q2IEwODqPlNPuk8fFidTBiBwel3QiqRiJgwm7geFw6umFDMKrHBC+pyVQU085WI
         9Y60kqJDnXiHpgVCmf3n2n2XewLd1CtiJqnSQQPJT9RccPyd8e2/duHf+LcHQvKe1Yzl
         K3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWxcnoxM+eEabokj7u0bo9oKZPlr48y5xcgM4cngIwPeZUry0/nv8sgz1vhDeEkzB5QCe2L6+OsRFD7Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysvEfS4rzINWR3eJYLER2zjBlQ5yLLE7cZnPGRkJZJXoU175/U
	8RnxKPf40qQzCI3u3EVh8EJZdzCmQSAlBx0qHA0UoyQBeEQbxdkBWOJdSrb58wE=
X-Google-Smtp-Source: AGHT+IHNro3gb81z53doED5Gyylpj3OG2ixdFIltK+ZKy21Y3ei4xESkqvArh3W2F6ZIrtmsUyCvrQ==
X-Received: by 2002:a17:903:22c4:b0:1fc:6c23:8a3b with SMTP id d9443c01a7336-201d63abd21mr31984405ad.17.1723623294220;
        Wed, 14 Aug 2024 01:14:54 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd147ec4sm24868335ad.85.2024.08.14.01.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:14:53 -0700 (PDT)
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
Subject: [PATCH v3 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
Date: Wed, 14 Aug 2024 01:13:36 -0700
Message-ID: <20240814081437.956855-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240814081437.956855-1-samuel.holland@sifive.com>
References: <20240814081437.956855-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011455_473129_5C112286 
X-CRM114-Status: GOOD (  10.97  )
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

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456..4f24201376b1 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -175,6 +175,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_ZAWRS,
+	KVM_RISCV_ISA_EXT_SMNPM,
+	KVM_RISCV_ISA_EXT_SSNPM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b319c4c13c54..6f833ec2344a 100644
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
@@ -129,6 +131,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_M:
 	/* There is not architectural config bit to disable sscofpmf completely */
 	case KVM_RISCV_ISA_EXT_SSCOFPMF:
+	case KVM_RISCV_ISA_EXT_SSNPM:
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
