Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B88D2F7FD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8Q74/ZodgxNzdo7OItQBm9E2zexomxV7brSb6+cEgk=; b=Csk51cqw3Cp311
	EQ+sW9RbOUXql4VcFYnHm6TO9vP87zxcbkiZ8JxwnCcds8O/2rQMEgpSRfR5cdnRy5cwLF9bkc+jd
	s+sOo6QyMv3gXQWrDL9U5fJxm0pr/6t6C21D8FK6GnCyaA6HnMcrrkV/CT1GzhjrDfEAcMQDBtANv
	fAlbvJE53IzPbTf+juUjWjFvzh1r03ExjuZDrya//16VV12rfniSlLB+x+JUMKEQjU8Hrxc0ojvOs
	czlwPkfFz8gHcDLzFE56WQhwNtwg1BKOT4Yr+KAssc2V/QmTcYFOOA58uRorlB98Cal6otChYY+Z6
	dYBpSFAV93LC9Fp54M0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCq-0000000E1bo-3s6F;
	Thu, 17 Oct 2024 07:46:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1LCa-0000000E1YF-3G9D
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 07:45:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d55f0cf85so395643f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2024 00:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729151143; x=1729755943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8rkpibg3VRRxV0TBms26AVcD4lHuXfg740Clg2CEGQ=;
        b=OJxBf12/jQd4ibErCykp8I3h0oXc5QvfsCHbBm+DY4cVBorDyfbt+8GaemH6uIv9dT
         TpIALB95OWqEH5xI2/5YBA7e03cfMifnx0wt/8PdUn8Z+09tw7qOw4qbjdKG/qepRUKp
         I9ztwCs2R7zkmn+yDnX90d3Yk5V7cHlCc4RoTaFx8UIbhmwMQOEcDEr4p08uR2Pn7FPR
         MGyw+c3ag8ljrTm3sXww9A5QczGDTCeSWPW20v5ORzvQOiWKTIWoIndLrKSwlEA4aSmH
         +IysGKmgK8pG1vqXEVXsGwHaXYetzAjmfIBGl4He0EY63qOoaCrNxmEzWxMOFio6OMvK
         OTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729151143; x=1729755943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8rkpibg3VRRxV0TBms26AVcD4lHuXfg740Clg2CEGQ=;
        b=acFeMBCCpX2n1Rt1sokNvO8orbxhMQ6SGA3c+1265ntv2QOVybo5hS+e49RUVTwvRw
         teCmTL5i4X+I1xbjkAVuQMMHqQMJzAQlfjFPxPQXShQGvTr91YHwkK9ijm0CHS70ljuu
         UIzW4V8l9/ixh1hNjBQGdEGDiBJpI9JgBFS57UCYqubkjfKr0VVeO2EXxL8vROIHbyAd
         cKfgNBvBBlHyPTVj7/psEn+q1gvwQlBenG+p/zK6UeHnfucdOJsyHRfQuIsIPrOIu8+0
         /gK/u+tqitX/5tvx5o2ThtxAaxoX944foXq+0GNE0h5+IsMMog2YMleVN0q8BQ5sEmEn
         n9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVk8kqla/NmUSMUcbl7lpMhHYt24FR1Z3TH4aB8STF/1fQHQhDMEibYRfD/5YYCnMhNK7zXw2ur8YqC9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkmPqkKaCmzj+8oT9Vcncah6kUfY7vMMzhF2LvrM4rUrzXMQ1G
	AR2DZ8rXhtwDvOV+IC7RXeQzuLMPrPPntyH5dwYTNon+C46oyFKOP01Ck/OX/fw=
X-Google-Smtp-Source: AGHT+IFVo+Anu4g9Wi6sAenrmeX+Z9yTB6qVRUU8Vol0jL/cwPOAHcRnjzBnu2Xf3rfEOZ1AqqCU0w==
X-Received: by 2002:adf:a415:0:b0:37c:d1e3:ebd2 with SMTP id ffacd0b85a97d-37d551fc6c1mr13537094f8f.29.1729151142958;
        Thu, 17 Oct 2024 00:45:42 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fc40a24sm6402951f8f.104.2024.10.17.00.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 00:45:42 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 2/2] KVM: riscv: selftests: Add SBI SUSP to get-reg-list test
Date: Thu, 17 Oct 2024 09:45:41 +0200
Message-ID: <20241017074538.18867-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241017074538.18867-4-ajones@ventanamicro.com>
References: <20241017074538.18867-4-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_004544_842128_68D22A75 
X-CRM114-Status: UNSURE (   9.20  )
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

KVM supports SBI SUSP, so add it to the get-reg-list test.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8e34f7fa44e9..7c33556ed59d 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -108,6 +108,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_HSM:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_PMU:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_DBCN:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
@@ -527,10 +528,11 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SRST),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_HSM),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_PMU),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
-		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_DBCN),
 	};
 
 	if (reg_off >= ARRAY_SIZE(kvm_sbi_ext_reg_name))
@@ -941,6 +943,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(base, BASE);
 KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
+KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
@@ -1005,6 +1008,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_sta,
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
+	&config_sbi_susp,
 	&config_aia,
 	&config_fp_f,
 	&config_fp_d,
-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
