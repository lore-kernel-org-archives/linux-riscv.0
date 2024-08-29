Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC8BC7115A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 01:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KzGw/sG45Wv5N/vy5MXMT1SmrOWd2Jx17Vn0UKv7n30=; b=XVBNSPzwx8+w0O
	BSVL2hwH8ce3e6rd58ow+KuR1eVOPR7/YiKUzU2S+cJFkMiPw52X6Gq/vRrla2pGdZULTGOm2GSBZ
	wswIhbImta5eYPpgcxE1KMF4pWQVQTvos0b+X/f/sdTnQzRNOGVmP/ow//unmLL+lLMequmenSHjf
	rOEuS16rI0Z+B75BdG8s+P2k9liyDEBrHoVf/oQU9COs3xk1hhdg2UP6b1eaXzlQrVE/1j//elWg3
	BH48KbswDDzroT2C65Uu3oRYwETrxAxSqHuhkOkISrFQIIh2jQ7ft0fJuZy2g5jJQZM/CtFNlFx+8
	zKkPjHu4pRzP/Ix/s91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYO-000000003ty-3oW8;
	Thu, 29 Aug 2024 01:02:24 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjTYB-000000003iL-00t1
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 01:02:12 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7143ae1b48fso88169b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 18:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724893330; x=1725498130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ85hK5DD6/7RMQg7pUyZ001ybckvLWjPJtkX5mnwuQ=;
        b=aqXHIaiZ5dfItNJ1aUDFlBvWL0ALPLszi500DybIgaNPOKayiCWTpFt7E5XHUOvtd8
         lVrWKbuh0HbPSQ0hH0DtT3Sr9VPgjyFoLccv/TsL7JpGfiOmf735tWlgjdCy1CYquubW
         ezBLTnVKREZGbleo4+HO6lJr40vBJ8+9k5kYxrsCb3EresPDzBUosgQbynwZGNY9GFL5
         OG60F6+wncwA7AP9Y8xYdvQiYBnV5Q8W6A5QMPdlj7h8u3qReTmmOP0YEMqwXu0o9t/I
         2umdUJA4k52aiOu0h/srXg7Nja279TZXF7DK12YcV2a4HsawrIAAIZONfV+DTu0CqW8n
         w2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724893330; x=1725498130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UZ85hK5DD6/7RMQg7pUyZ001ybckvLWjPJtkX5mnwuQ=;
        b=sDrEYwpLVxgs9lD6nJiJKb4RJA1cLQ40HWJk2396akQzsXA5/ayT9d5GeKClkVs3jB
         ITNx6Q0vEua3xFJa9GeOfXC+qeBNkakGuYGCkQenCbZlMTWVMHvj6c4AEXp4tyYpnjCm
         viR59oMHv5RVSBr9FoLgWelTfxDQn9ss8wQ7YVnzJmzMWLCHdEr0H1LaFS4tny3SZPU+
         uTX88U+4pLp0fT3RfptfB49mMGWA3SPLQHAk+sgFkQvy7WhlPH8c2jH6Ps/X8ZrWUMoM
         zbjbt29bNY/UIBDiCXH2q/HNWB65tRYxVrW4tSk7O+SywGHSSq644i8ok8beJfptGSxd
         UmUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhrO3qoiJe+j6eBU5xvjtgGbBnUebCTaaz597/gVBUYcKA/Yr38nv8YY3On8M2ogbGxw1Qbljc9Sprgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1X9CIm4n1YaG++S9BCvpkzGdCnbjcLsvJR9HHu21R17gxAUkq
	+ONGQpKhhouEkYCi2X6n8i+Pfgyw3QcXzy6040vAeX8sTCZo3KahCpNPdblpGvo=
X-Google-Smtp-Source: AGHT+IHtPqetJTcS8DJjyTVqTZf+ptUYcRum3naxhEpRfuBLTylIE+8MNrQmk7y3vEqVGl/I7s74+w==
X-Received: by 2002:a05:6a20:c890:b0:1c2:8d33:af69 with SMTP id adf61e73a8af0-1cce10a3b9bmr986022637.41.1724893330253;
        Wed, 28 Aug 2024 18:02:10 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e5576a4dsm89670b3a.17.2024.08.28.18.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:02:09 -0700 (PDT)
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
Subject: [PATCH v4 10/10] KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test
Date: Wed, 28 Aug 2024 18:01:32 -0700
Message-ID: <20240829010151.2813377-11-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240829010151.2813377-1-samuel.holland@sifive.com>
References: <20240829010151.2813377-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_180211_157372_2F978578 
X-CRM114-Status: UNSURE (   9.53  )
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
