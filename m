Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D58CD2A555
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ek0Xobrgmf9BqBYdk9jn8E2Pcdlji4sWhgMpXndVjrg=; b=VQEyHBc4wzvDug
	h9zKFoxZGzsgE5HG8g3ryk1amDUBDxY1xt1LZAC1fFrYbZGN1Y98Uaamm8OaVn1P0AXKZxTGrbfA8
	r0ZePvyq7IhRko4Nxyu7HTPtJB3QPj0CBd7nIg7SYjBgz8z5nvKV8T1FUr3tsYlFLhvFByqR9B5kK
	WrP53MMAa09ZUpuQHpBQAfaK1y0erPydDK7vOg/YW6CNODOaYONKZqLeKYj4X6z8xm+3Ymt0nwiGC
	MdOygyzHFH/nZ7hO1yZz2ioy74+d3Gfcaoul8HCvizvfBjOpWbFvYL6TO/L2DzP5+CbvQmGUP6jzy
	LTe5MOc7pMwxNUBJeROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdL-0000000CwZt-0M26;
	Wed, 16 Oct 2024 20:28:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1AdI-0000000CwYU-0Kir
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:28:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e28b75dbd6so173805a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1729110515; x=1729715315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WI0PfAqEvWugCZ5STUUK7Rk7SGo8azDpX4lf/J5+9s=;
        b=Agdp0yhLpC4YsnpKiBOz3ZTJmbwN7pS2rmK5FEFT/CC2COI7lhsso6yob+CqUzWqoj
         japKE8rtOhVO1PSeTdV7fVnkh2n8hdvtuc52JpkUC2givhTBmkBPrrRS9Zb8peWLX4W+
         R9n/1U4E54OVSoM8i+WfAXHh/Ju+D93VabHQDal8wn9ZECajgAzPEHNe2bHMgnAvr3rZ
         1yyKv62dWaw3pGNrK22kxuKKmzUnC4yWCPA/LcyGuIubcYpVRC/LM9+cMSyUVA2reDuM
         arDCf/W75OQjYkNlfHsRUlbNTBAFZPwQjWmPoyYAfW+V6GAfdVkcomUcqHGS5zJyXQJL
         zYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110515; x=1729715315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WI0PfAqEvWugCZ5STUUK7Rk7SGo8azDpX4lf/J5+9s=;
        b=xB0xhN0hB9vEDJ5E7gX/KbfV56N2i9TSiKqbDf5TFSrEPpTM7R2/LXrjcYWLzMPucy
         Yya525LthGA5wdS2gasIq3PmPvSz2PnpBNp0QMyLGfcYzFSk9gCwH7JDjn042xPBct34
         R7h0c9qFIX8BUUE16etybTS5dTm3yXHPDkNiaJb+rM3eINGW6pqoPp9ZMP6L8rmPSzcJ
         OzDBeC17d517kJVKVjvEq+vfNsjKZnMCsu6pb0LuEDJN5Q+vTfGTBCJNyFUpjF5nsBXN
         VPMZkQQR2VZuANqytpojR0LBZ9bqRfLBdoEhlNxdpcsSYMegmvQy6cT06zsBc0Utvu4b
         bwwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU699ObfbFWIkznhF7Fche89Q4d8ahnXUGe60ZDveRxezWMJp8UxLxkvPk8/PJhU96PfUkgpSswo67XDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDo7BoMPtX8LSDObjH2i2lj28TU9T2HQ91xDZSZX1L+MypZHxI
	rKeLEQUoQI3fyWjgGqkMHX2a8awoFHuhM5DgLAEHimcz64q6/XPCh9vgJBPVvfw=
X-Google-Smtp-Source: AGHT+IGcSXANWUtxTrqBQY826KCMZtK9Mvi3eTSETMPgwJlkMpZfT0sjFjvzgcJsn91FjGVwM3cBqA==
X-Received: by 2002:a17:90b:802:b0:2e1:ce7b:6069 with SMTP id 98e67ed59e1d1-2e31538f1camr20096845a91.33.1729110515177;
        Wed, 16 Oct 2024 13:28:35 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08f8f89sm228613a91.38.2024.10.16.13.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 13:28:34 -0700 (PDT)
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
Subject: [PATCH v5 10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
Date: Wed, 16 Oct 2024 13:27:51 -0700
Message-ID: <20241016202814.4061541-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241016202814.4061541-1-samuel.holland@sifive.com>
References: <20241016202814.4061541-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_132836_137913_F78D0BB6 
X-CRM114-Status: UNSURE (   9.14  )
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

Add testing for the pointer masking extensions exposed to KVM guests.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8e34f7fa44e9..54ab484d0000 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -41,9 +41,11 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_I:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_M:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMNPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSNPM:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
@@ -414,9 +416,11 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(I),
 		KVM_ISA_EXT_ARR(M),
 		KVM_ISA_EXT_ARR(V),
+		KVM_ISA_EXT_ARR(SMNPM),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
+		KVM_ISA_EXT_ARR(SSNPM),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
@@ -946,8 +950,10 @@ KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
+KVM_ISA_EXT_SIMPLE_CONFIG(smnpm, SMNPM);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
+KVM_ISA_EXT_SIMPLE_CONFIG(ssnpm, SSNPM);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
@@ -1009,8 +1015,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_fp_f,
 	&config_fp_d,
 	&config_h,
+	&config_smnpm,
 	&config_smstateen,
 	&config_sscofpmf,
+	&config_ssnpm,
 	&config_sstc,
 	&config_svinval,
 	&config_svnapot,
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
