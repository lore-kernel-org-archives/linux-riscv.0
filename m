Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88122C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ql3fxAm0hZlscxB2cxGeE8yfAu3LdbtbMOw1PgmBDw=; b=3de7fMzt+qRMBD
	Jc0AYUrg1kxdHe3wkczkOFf3f6j6eCZ+DbuSa6Q/Z6Z/XrTUfxwHZwPiAa23j4s/oK40AMKWRJkRi
	lZoD5RM5GzC5Qt5xnN/aIDRxf1iZamtvxFxBDHR/cCIB+D/qM48LmEbSrV7bL3iBBN6PwjCiMFg9P
	mJz8mJjn2VacL66CmCB54MeFG1cDkMbDlRhi5cKr3lX0TVpUglPdQ7gZl/vnMkzKg5ZtCQLuZyze6
	a+nRPiemV6uGPy+Rgv8E7nPWl6PDm379ieKALSb1T5y9oAjjpcuYiCGSvLnIWmV2oduSCZ4/Xdx4j
	QTwxZDCpbolK4MIaB5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQX-00000004VNH-0VMe;
	Tue, 25 Jun 2024 21:10:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMDQH-00000004VBi-3ivE
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 21:09:55 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f9a78c6c5dso47321035ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719349793; x=1719954593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsHcmVVCPLrcBxzvj/XWrk8rIm5ozAhc40jGfT9csjA=;
        b=EBJ0glFYOI+C/p4n9Vu7gOMw3iQl4dNRSaDoArdG08flaaA9VZ0fP28QKEk+Il2mKH
         qfvldUIFxyRsEmOyWhO8ScvAEuiFhgugiRqTPiampBa7eLfr6YgcC3hCvrJcGnMO8or1
         sMlAjO89J89iFK57GkIlb/oSJdv9JiIdEfs3eKk08UYEocXGC00aJGJMefPyOZVZH1ZK
         FRL/rQluaUxC/qluqWh0MOCjs4S6MMV2V++MR9PJEzf1QVjD7BKnHaBOlshFKk6lIdVm
         IBJLpA+vLReaB9oCMYyz0PXdDgwLDSYVmp5xiKnBnlNGVP+maLsa/WjMKuS20lDEaDf9
         ROog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719349793; x=1719954593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsHcmVVCPLrcBxzvj/XWrk8rIm5ozAhc40jGfT9csjA=;
        b=kH7oV9+p/iGie/r+ExJBuauHYk1uGSJblE4+pXRvJBhSNzQ6pO9nXVXsDGaYEA38f9
         EB/2xdve2DSgr8VLk1ITJxUICOmR548EVP0oj+uRPRV6LlzwDeYq6kHxkS9SRBXij279
         9KnNY7Ak0EA1wrNyY1r/pcq2RN5cBPp2HXeubfbUduHYMc+MNwYVnzj0fnWPleQ87Rqa
         6oQpR9YHutmZEmrbQCDcq/3KZuw6dod+RfzSuciIsjHEdS3xz5Gv5MkxjnNfJ5wprslT
         jH7B+5S7xewNO9fd4Ipqv77ee+B5c1KujdaVFuj4SLaKrlvwgS9bexUavm+qflN69Lik
         4+og==
X-Forwarded-Encrypted: i=1; AJvYcCULBZFKQpJggJRi/VIbulihhNpRaO0EPI7pjb6mN31LF0L1UrWzJRlcICP3PTW6lnnycbm5btMK5r/pJRO/J2Hskb32gLpjlQHXS6bP5488
X-Gm-Message-State: AOJu0YzTvH+8eXnHTSnJTRA+UvpKrhHIlgciYCpFRYiThPNJD+PeOBBw
	SlCVWaLPrOTBbit00rGQP/afkA4cPExd4G+CxfqEwLylweTTQScZonDuZ0Z4ECo=
X-Google-Smtp-Source: AGHT+IF7960Z3y3y/X3zynf0lJ1wO8G/3jJV2h9jR5m8BoGcdIwQfMMMznl9rO+PXdYb3q90GGzu1Q==
X-Received: by 2002:a17:902:e5c1:b0:1f9:c6df:a84e with SMTP id d9443c01a7336-1fa23f3638fmr104356595ad.64.1719349793095;
        Tue, 25 Jun 2024 14:09:53 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb328f57sm85873455ad.110.2024.06.25.14.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 14:09:52 -0700 (PDT)
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
Subject: [PATCH v2 10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
Date: Tue, 25 Jun 2024 14:09:21 -0700
Message-ID: <20240625210933.1620802-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240625210933.1620802-1-samuel.holland@sifive.com>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_140954_086247_E392F695 
X-CRM114-Status: UNSURE (   9.54  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 222198dd6d04..301761a5364d 100644
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
@@ -407,9 +409,11 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
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
@@ -932,8 +936,10 @@ KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
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
@@ -988,8 +994,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
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
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
