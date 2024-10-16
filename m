Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FA0D2A555
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/c1GQoFFFr9TZJHdNQdq14oyzofXs5aSqMQp0abXr0=; b=D++vVB69uBbO+v
	da/YPguC71hqBQssAARphu1WzJzHjmXO4rIYkm9UMEuJT+w52nyo53pfERBUGeZmJHb9m15ygfLL3
	BUG3I80pZF2FaxyedgnAuqJ4nqO1KaT7eunxCq5nbe3mx1h3GWZOW4VVcLCeYDJ/BKXlVu1XiKl97
	rZwz7PPjKqY1M0RMQUDmT2rVmL8YR6QFRbWwE7+3yEnxNSX9IqbJz29WPLrHGp10tMNDk1rVciWOY
	yms5BMSe55idJueiTweFXO6Nla2macU9zbWLiwjE9srOFTV/qQbY++IbpjRIWfzDllJEVmvrKkPvk
	Lnth9Z7fF0gPuSRiA1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdX-0000000CwjA-00og;
	Wed, 16 Oct 2024 20:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdV-0000000CwhA-1WfA
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 20:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N8qp+tseh4bMUHTaD+Myf/jjkdJffKFnGUeOTquYIl8=; b=JhjIeMrsuN9upypMeOWptXjZ+3
	L7EoojI8lWlNmEOBOitCPHSreuhaEA3LHpFPalj6odQR4zJZWRTBKd6rk6/WMxoqxiPHFDZt59EbN
	38+2Rg8TLzuWvuILN9aeVDq1KTyG24iBwFJ4jh6QC/UmbKg8JEbfCxF9cfx5LhqJc5F/nRBD9lP9P
	eiZnsDbFgkmmelfICCkcM6wmeAhuBrMCfPAzbzM7v0799ffI0ukQSPgM1iKpgs/mmcZXzO+yW7kYL
	4GTUvRGV5AIpZGRU8au+nb5sy+Xpv4z9gV+hzTb8YkwLvR7axsoSC4ErkaSevaG3yi4nQmCtTXa5Z
	oVPwFWzQ==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdI-00000006u8T-34q8
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:40 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20c70abba48so2105925ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110513; x=1729715313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8qp+tseh4bMUHTaD+Myf/jjkdJffKFnGUeOTquYIl8=;
        b=k5AQXzQhhbsX1TlMkucRM7fypiDhugMHi47ODoLsBLFNrrm1R973MpTd2KN93YX/Wu
         lHl3fT0ED4OInbnGcuYwE6m6GkFVM9dJxmkf4wk2Wc6kBHKb9CDU+aR40j3C4qBxMViN
         zQMaYPoSrgEl52jvI9w2Lxj8R81bOuL+DJUrZRS7kqf4H4EuQ08TJ1VpWrp0rb9D5JoC
         qCB5p/TBqfJ/BLFF4LOAPlFPV2/FvIZUIi68Rdxl2q6VntbB/z1LFzOJ1H+1ayZY7f9B
         MHR2DSmToyabCp3c0mp04KnWJdDQRFNDMydF8DYOyG7JKt7Qj3YOPB7zl8fefrEnGGdk
         mRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110513; x=1729715313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8qp+tseh4bMUHTaD+Myf/jjkdJffKFnGUeOTquYIl8=;
        b=pE+CfB668dwvSx/VsialT6GRq+iAWJapPr0Ko9nt6I7UHv6cxeQm7cskgAA8F9Vdmr
         oTcyNVj85ns5I+ujyYF/Yi7+MHNB/8/42nR+2+e7dH7alUvac+EbywSPIulJ23oNWZ87
         O1vV98DkhgcBarb22BohegeupGg5/hTsXRaufTlEs7BVp56Cd8fU7a2TTv/bGu6B+0kb
         8e6QOLpIeC9y95tswayA5ioKse1/eKa8OD44VDOiFkLfiuxKTNjyGy8UzdsY3Fbv2F3Q
         WI8w9TEzsWiuhxghLpamRP2yJumP61Aj43lC5LwILQgZEo1trzoAlIuCmS9lsbjxexJu
         E1xw==
X-Forwarded-Encrypted: i=1; AJvYcCWlqdl/58Oqwof6zFJIMbvi6fYXLlfP2xq2646ujsSYnJkd9A0nnmdi6Yjh/WmEg09hRD0825V9+e0IkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgxPWr2Dzhry/Mtol8L7w3m4+5HXVK0jEosUW5TkolSKCx2GP
	qgnk+uIZR5aSUIN4SazIYHiGfA++Kd9+gTGFTJdm/1FdN22Uwij0pUIe9i4mvBo=
X-Google-Smtp-Source: AGHT+IGt9EJhWPb2QUdkiIkAH1GPre203CbDhO3HM7OqUiVLzcm8QmSQg0UHLFTAJE4hx0loBwaHQg==
X-Received: by 2002:a17:90b:617:b0:2e2:991c:d7a6 with SMTP id 98e67ed59e1d1-2e3152eb736mr19638942a91.19.1729110513399;
        Wed, 16 Oct 2024 13:28:33 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:32 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-kselftest@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Shuah Khan <shuah@kernel.org>,
	devicetree@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	kasan-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	Evgenii Stepanov <eugenis@google.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v5 09/10] RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
Date: Wed, 16 Oct 2024 13:27:50 -0700
Message-ID: <20241016202814.4061541-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_212837_772605_E681E289 
X-CRM114-Status: GOOD (  12.14  )
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

The guest configures Smnpm through the SBI Firmware Features extension,
which KVM does not yet implement, so currently the ISA extension has no
visible effect on the guest, and thus it cannot be disabled. Ssnpm is
configured using the senvcfg CSR within the guest, so that extension
cannot be hidden from the guest without intercepting writes to the CSR.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v5:
 - Do not allow Smnpm to be disabled, as suggested by Anup

Changes in v2:
 - New patch for v2

 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 4 ++++
 2 files changed, 6 insertions(+)

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
index b319c4c13c54..5b68490ad9b7 100644
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
@@ -127,8 +129,10 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_C:
 	case KVM_RISCV_ISA_EXT_I:
 	case KVM_RISCV_ISA_EXT_M:
+	case KVM_RISCV_ISA_EXT_SMNPM:
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
