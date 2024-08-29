Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EB1C71156
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vvb0jXdd4DpmtLZyWvjjN4RrZbNhj8BoNFEHG6jn5XU=; b=ywnKKUoHPepRFd
	Fcl8xXssHNWVErCVkRwnbWlA3ycIZBqv6U1UqOMZ4rRxa5JvoAYBI3EGoI8YAudKlI0KsWoIjjMOy
	+08B2boePhoip/262E2x7gKUZ1xQZ6ZmcU3lI6X5WrVN+00JRAfe2YXglviJ6MBfyG0PkpdahW1r2
	a9xm/8/v7shL2zMz3ujwwiYF7HremXX7HCQ0TFr0QDM638T9tprJuUEJhcQLnvC1WkVbpJKkLJDqI
	9ZU50wl2y9bYe6VGlPf6Wwy0udZ/7ieujXn1pAbL86bBQEjQIPRdktVJknTreV57Wg9prNdMB9A0x
	PWc4EFDG5jtzRJDauS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYM-000000003s3-44Dq;
	Thu, 29 Aug 2024 01:02:22 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTY9-000000003h7-1TNw
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:11 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7141b04e7b5so66749b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893329; x=1725498129; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVeUN5Mn4knmfhlWREJV6zJkPuiqFserRZxouOs1BJI=;
        b=CDwq0oun+sdff1lg5OmYYAoJQIvaPyKcasTU8D98yUcTuQ2zmsH83DxHEWWcJp0dUn
         a9DmAnbhbcqTPpPdrthO6qappdDyAThwVaU5UxVnE6XgLrLudHraUwxGfXnDglT1Exdx
         MbcDERAwgECLpRvRHVFYncc70Dij1Gh4enmEFbhABfwQLATOLthdJKHif5p7Nmvw17uV
         FtgqiZS55WGdebxBGaahFMsWQLSba3YwY8o7qQgNSsYa97EjDqOXt48Q0vsyySMYZFJj
         eTyPHj2l00UfkpP5E1IyWD2Wsiat6A8bOahhzM2bAUvGcKTRTUv7VDHQz7HWY5Wa38K8
         qVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893329; x=1725498129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVeUN5Mn4knmfhlWREJV6zJkPuiqFserRZxouOs1BJI=;
        b=Ek6btTiSKoELPMYWUVUh/veXLoEhg1jJhEyaP0TV2aFWLa8IVk6pUuOKM/60b+8GqY
         66bFx/LlXFZtCewPgICagQgGzi2rSDvZb57Lt18kf+xke1bgAe2yDqjBE5/i5piiLsYZ
         +cKlI1ugkpmNC1I5cxoQrnNlLrZ3NiItcV3xLFuPT1uMT2VNygZ3UzlJkuaJxl/WAuwV
         cXsVQn0AiQOxgdnKZSFurvwurEvGykYzBsUL2vlZO31enzD+G5gwKwp4mZ04fkfe1sjv
         nXjYw+pz5DoHGdQLJMdAa1anJlBVdI1Esg5yrGQzsX1dm3okrj4JL8C9NkJgiNhvNBCb
         Asug==
X-Forwarded-Encrypted: i=1; AJvYcCX/lI80KMYCxFa99+w5B2cRvWbTmjwa1fjmUOsGozycz4Vujh+lRrwWgFzt/poR18MG+rlUYrfcMTClwA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu/d6cadHYDDgKldo2xpBFD1AMtvnlP4eLeFi6MGBVo7AU6vUA
	A8wsaGZT+o8Fr+TIcvtIKljZAYtEz2weiiSugzpIzAahcc2IXPWl6zEEmtC9734=
X-Google-Smtp-Source: AGHT+IE20Iz5wZXTitHFQF8jSuAcL+G/x9Gpo+1x4hS8Jq+hDLNQBGiIr2r+fj9xMkWCy+9sL14ZDA==
X-Received: by 2002:a05:6a21:e94:b0:1c0:f315:ec7e with SMTP id adf61e73a8af0-1cce101e3eamr1074001637.28.1724893328672;
        Wed, 28 Aug 2024 18:02:08 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:02:08 -0700 (PDT)
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
Subject: [PATCH v4 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
Date: Wed, 28 Aug 2024 18:01:31 -0700
Message-ID: <20240829010151.2813377-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180209_508554_BFE3B4FE 
X-CRM114-Status: GOOD (  10.98  )
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
