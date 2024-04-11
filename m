Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266B6CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/6kcOGhQC8OEgf93/u5AXhghbPIAArA4ygly40MBYk=; b=wwNGNxwN+RZatv
	hzh5G5tNptapFnBWylioT9HI+L1uNI/sDNKbqbrT6s4Ba+1wmnFN7v2YnZpA+oAe8wJc6gLs4LhGV
	cJywtr/t/7fHtG87f+cv74gv6ufv95zsJOXaNfiW5ZrpvC3hD/eE5Tc45vWwggKo04tf/adIm5iSf
	YE7yjSRKl3fwWbvj/Ycxu+r94NTPBZJwpcoMRv15J6JLS0pjU6K1o+PEB6tT/LG7/ChvHHzOhXyqX
	K5LY3+8L+AxzkrGkWOEzUxQ5KPQ538P2TCPAOa0pCjIAkntx8T+b2qG0Wpwk3q1PnRAdGluMKxBFq
	QUR/F1xsaz4hj09lv0gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0c-00000009aoc-1evV;
	Thu, 11 Apr 2024 00:09:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzx-00000009aAM-288H
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:05 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e3c7549078so2323835ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794141; x=1713398941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=tEdOP9r0qQMWzu10+zDnCgDcqUh5lfTangCJ3ZYAadOYEsLK1QfE+I8POf1UZgiXNt
         aCqjUKPVuu0dzaKh1fl1DDx37flZxueTS68lXLxlYJ+DMwU5Qd/s6+zK59EOcWOxReYj
         YoQy9kmT+sday6nxbGM09PZzpcQGFe5kt6JRaSgFLBqyrK5Ibl2Apfdvu7wpKlkUDtYp
         e5YhkNnUl9zgUk+OHtrPvYhNIH6VWAawJWN2ia4+PBU62n/gNgMOdHA/62kQWjmR76WB
         Naibbl7F02k2Iaeopm3XsDvM+tHKJzPA8eU6F+LaGTg5b97fqgGnnsG4WoIwfCVGOI3c
         /wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794141; x=1713398941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=bd/AMUW0tz1+GENQK2nIvw9H6sXBtuHgkJEP4oEWfOqx09h74xGVF3NAs3euBKLByI
         yx+WWERwygzPPZIFkNGTIS3t1Yw+AH/kTM8zXfoqMGYrjiE26fo3v3a+DFNmzkgVBIIc
         jlV0nh5hggON0c3YB0p7Whztmgeb1S/2ZQLoaYRaMlMzYqmapL/4oQVEPI/qO51Rwd5r
         jAxRXKa5Q7Cd4NturQJEc10ck+O2lR+3Kb8bOcT/XbBhhnPQBUGHdTT6KjveCA6hhB5F
         KSKMOock4hNwkpltWIC9HtsEYfLw4vAfkHtY+iT3JCmFiYNo+msxTp+Luhw++BZ9JC2E
         4B2w==
X-Forwarded-Encrypted: i=1; AJvYcCVRUy4md4IEgXstQrZBUGmdSa6xOH25Xdu+WfhwN3MH4XaEjnmLF61BDvRarv7hk285rsJD3ia+YMEyRpwc1TL4Wi7Gl49cDndySIiizWev
X-Gm-Message-State: AOJu0Yw4f+EbRarR2ATS7QRSU0GZwyQOR6ilFb6E1h4HJx+jTolDvM7F
	4yMSuqn5C3PQw9AcRvhiD0SrMMGLxHeEFDVr7JILBrMMVJLbRBRVUBkDGcqp7kU=
X-Google-Smtp-Source: AGHT+IHrdco+Nn3vB823qWCjNowMIOzBoGtN1xF2JabKGjxDIXVa2NH6OeieucLnKkpVZpIdiowNLg==
X-Received: by 2002:a17:902:e743:b0:1e4:39e0:660c with SMTP id p3-20020a170902e74300b001e439e0660cmr1368224plf.23.1712794140724;
        Wed, 10 Apr 2024 17:09:00 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:08:59 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
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
Subject: [PATCH v6 19/24] KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
Date: Wed, 10 Apr 2024 17:07:47 -0700
Message-Id: <20240411000752.955910-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170901_960445_A33A0D71 
X-CRM114-Status: UNSURE (   9.03  )
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
