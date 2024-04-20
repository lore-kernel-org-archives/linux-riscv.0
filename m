Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC77C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/6kcOGhQC8OEgf93/u5AXhghbPIAArA4ygly40MBYk=; b=xKNKYs9yap7D+W
	IeIEcSkgbegX2r8AwaFBwIYu5mjv1ItbkCGXBBnIKcHxqlfaMlZHyH6YYc4a9jIXHkTs57uJSOFME
	DU7wM1y1ttNHEQHAJqoQHQTxfK0g27IDf/SgSUnE/Ha1R6zlPgrWXXOSs/NsbtuSptB3eSoHScLkc
	d7W0qXurukUsXXzE0lFhCQADNJr9t74FKMgepwxF8bQqnGo9CpM4ZQ9CAeLOhoGhyLyHnb1UvR/vA
	3ZUTsmTgon7fv1612H0VFjWeaKl0DBcx2nP4jZxubXiY8vZkG9fGhsWPrcGUdPsgDv35giYcvWHnG
	BN+JMae1rzbDNphoDubQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxyz-00000007Jup-0rbQ;
	Fri, 19 Apr 2024 23:49:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxs-00000007Iya-06lt
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:24 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1e5aa82d1f6so23016185ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570499; x=1714175299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=dSL8kbcsiiHpV9mM+0jSbz2ojutHztnou9VNfMfl6UgjMbBa9GeTEq0lg/ChZ2vOK5
         i8IfaP0MCU6SllPLAxXK3IU39JP2N2fRwS0LmzlnARkorDUMVVObFWVWQj6I6JkMC2iw
         pnPVEq0FZEFME+nto1hUhyjw88RUMPBWbYnFkp8sltvgmxjzfm8ipSWCxK/dNQcMnn55
         HI3LZcOvmIOtBti/32CxpI2diUYuiZn+Mj90k9QuFwNyo5yvmAXQT4ebmbV39KwsOzqS
         kHwoywQk1V7R20pTAcDxmTsd91xe98JtFa4XXUr4xxsAMTxY02/W8N3aJXkUVMqmMD4Q
         8Dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570499; x=1714175299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=A836MNvTvaQ9yctd5JVhBu3Ke2HINurUmm3mUeg/Xrni7j7INSe9IPbfjRjf98S3W7
         Bz6j3eVqsFQcJ1UrwqN4eQfr6XHTPobQ1GaSYqBP91gCnMOAOzc34eYiJVwvLi0a6SfZ
         bphxmNCN6Vptgz24HHUb8Zytp255xmp+wWuhxAVmG4HMYtslXWWLmy5NytfsRkrF2H4M
         i3aXG87IGYFTpqtUQI5wm9EbmCzehyHOqjGBBgGFTHSk+TXqga2L8SPAry65gAk0PPMp
         eVpusJNc68eLYw4A02jaJL0WqbtsswL2OB4qxcU/ck9fdlevKI2sgySnnmvnhfAEnd8h
         3Bag==
X-Forwarded-Encrypted: i=1; AJvYcCVOz+zMTyJFePv54VgsWdWpKMvqqB0bmm+v2oUsqD6nY4oUR63M8ad36OuAQUcNGrgPO3051bcpWLKy4mQz5ihlsW8yLXimHTJoiC8dyOdV
X-Gm-Message-State: AOJu0YxzsYnnEK8kiLtGFltmNOkxAh3oVK0UNJ9awlS9l8HTrOSxFLkz
	nss+NEwX98mbrvE8QkZdpxK77ORQSSHC92sdw5OBrgw5xdHemX6sgoFM54k5+jw=
X-Google-Smtp-Source: AGHT+IH94ZDu/qiw6Yoj8MWg6zwqoinf1KpfcrzFJNX+17e2PlQXtFOUT/DN+eICy7GP3aaT34hoHA==
X-Received: by 2002:a17:902:d50a:b0:1e4:1fb8:321f with SMTP id b10-20020a170902d50a00b001e41fb8321fmr5727941plg.20.1713570499356;
        Fri, 19 Apr 2024 16:48:19 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:19 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v8 19/24] KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
Date: Sat, 20 Apr 2024 08:17:35 -0700
Message-Id: <20240420151741.962500-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_164820_276134_5EA72D48 
X-CRM114-Status: UNSURE (   8.84  )
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

The KVM RISC-V allows Sscofpmf extension for Guest/VM so let us
add this extension to get-reg-list test.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index b882b7b9b785..222198dd6d04 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -43,6 +43,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
@@ -408,6 +409,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(V),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
+		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
@@ -931,6 +933,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
+KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
@@ -986,6 +989,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_d,
 	&config_h,
 	&config_smstateen,
+	&config_sscofpmf,
 	&config_sstc,
 	&config_svinval,
 	&config_svnapot,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
