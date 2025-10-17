Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E2FCCD19F
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2noF6c+bfTJfp7WHNPl5a/+GxDlhb/oIGFxzh08iuE=; b=a886uH06Cuujm/
	PBtbLF31m0efz66+gRXhplnzoYf/+u8gvMWB7cq49X49AdqQP8FIKfttVWJBI8oia+ZGO1Pf7oDL4
	QIUlnV9wpVZog0R4ivcAQmULhovITQJflKPXZa5SOTKQEzho301mQhC8EAFikpMP2eLb9vAyxv+oe
	SMsZBOkDgqfuoCjRNluXQZUtu5J1gepUkNlGY4rV+0QK5xmmCiE1jEu0N+6Sv62VJ+kKlmaJgwpwB
	LG1Wn5SB+f7SfWCwnynG+0y18NwA4qCaTFb5BuH6OWht38VrlMOm3v04RiCA17m+c7kP2hjM1N6Pg
	7vxkoBUKtE59IVsVOFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mse-00000008M3r-2tbO;
	Fri, 17 Oct 2025 16:00:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9msd-00000008M2X-0Yru
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fOxr4kUrx3o2qKQ3zJr2xwhR1Y/B5zgWnTBkv0V7+0s=; b=JBBonFeuEHsszuK1QtqMb3smaP
	sXd1wJk8HLSdg8sWu2YIacJRDn+f+3n7G1xiI/0Q4cN927LpgG+wkKpucPNWDaEb/rJQHeP42O8Uh
	ef2Dyy+sNGIav6GG+/UjnNeVTIZNnwr/JQq/Jaysh6oDShE43owQ907QRnjoXKzNixFZdDSE5A4WR
	UivhlbPW26PhujGfa+gpsAPYtTO1igKR7qTOOHSOZvfMP1zfWo4pvCHZTAxCfzzgOOId3HvYV3Y40
	mEeunGoAUNlY+Jpqsb9FJdPZreHwxhZLsnkGdK0fD+h60ZoOVqhS2zqNx1VpRmPOK6KEV7vrs5AFn
	MXTR4ROg==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9ms3-00000007iSL-3Zuu
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:00:09 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33be037cf73so816020a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716797; x=1761321597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOxr4kUrx3o2qKQ3zJr2xwhR1Y/B5zgWnTBkv0V7+0s=;
        b=gxXTC/cIIYGzVE9rLpqkNSYXLLH6rMu/i/Bb6MDeeY/mmoVANlaeuXCxyj/kRsC4F2
         LkjdRCuxtGcHlDW5ex7t8JXVzi1UgoLfVBWcx0HQDsVrpOkCkuG73x1yYxGF9rGBDSaV
         qgQOyLGT+xd0L3iXZ0xsdvrwXJPqqd25aNfuewity66fp++LI+Aq2vvzIeI42xqCQMYO
         E5TMz73urMPMVmn+ZSU5NaZhQdru79Is5nM6H5gQqLwOTxV6WRSBV7qSun+LxL3ZqeQC
         q8Hu9aS+tcP031UZzuqCTYzpMhhnzoZqWDGlgIXNHwVi5bXaWzbTQ0LpNPwG+L6f8LeQ
         +Cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716797; x=1761321597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOxr4kUrx3o2qKQ3zJr2xwhR1Y/B5zgWnTBkv0V7+0s=;
        b=tL6w40SP8EZ6DHxLHP55R7uCienb4KYJxfJa7FlBgGpd8jhvpHsUANgTDLpOSQi5rG
         v2yjz9zDeHuk2CMxIf8WmemF9lX7hR4Hb4TsMihILsJ34JcEcWWZTIFrJuQh1Nw1o9Px
         DsJng1qSiZZCH0pfafo4orYv5KjAD+/9HrX8dRZA1T6me7Zkzqfqq+1P/2XvuFWKH0lv
         7n7A1nxhPLanK4zgUFMZuNsH/3l5H+7kxXUSyyWHBjGK30fHUTj6DiDMNoMYOr2z9rxn
         OBOcLPal8suJquC9RrRoHBctaf1u+VyW/eUQnIFDRCHx1LezA9K3wQE8FZhtBuej3l6b
         LFUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZhY0RFGOom3J1fxC+cWVxouGi9n7O4ofWDboZ1JCV4QFIVbyhr+DnX8ckxj3tuAnhDtlwISsrv3BIWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4MU0QH+XW0ZoOeThumZpy8Z2+o2VJeRCueVcgr0MhnTPKcw3J
	+BGahFHtgU8cSqf4dJsGfqKFnOwd2iWmfi4EdFlS37CDHPOU3Hcm8GePDQ/JM3K9HCQ=
X-Gm-Gg: ASbGnctx/UvE6Ridk0zx1jjuXTrW1AZvXjy4xf9xE6GSgZ927Z0CW5X9ItKSdEwWxM3
	rtYHad12PtN1A6tKt/HkYUYglClXMUMdg3D2PR0K0jZXhx93tCi5re/LB7geyhRdVBg1tH1Q+xX
	DElZ/QNe3vlYxs6aivZhQDnNxCqJK7pXFRWaANLOR9fVVmiYEojI31/ZmpoDRuhGUDQcRCdeAwh
	+xtfmWUMcrb3wQw62jTy9xkU3Wb9B+6KHOMRZACdsU36bsAIhD1DJ7eQfHqK3Uq9NJh6kD1e1qm
	cpDPPc1uSa4IE+OUbFzIm3wQkz51kbdVc6CjdqUF5V3RRKYejjOx/hjkejN6NoGnyBvbrpd+/i4
	SJWsO8Nwk4J8ZLdiBspBLJHhAKJCbZx47Mtugpn7B+Qr31855QNlyzVRFNimi8OiOek3uOw3dLX
	53kM9/hH/UzH29HzIFAD7+RPcHrKfl6X4o
X-Google-Smtp-Source: AGHT+IFoCPBiPeGQQLQ+fG7ai4z/yEAOOUIjHcz+WvJaH5Mkp92XTCRypBxB5qA/CcWwuixBEctClg==
X-Received: by 2002:a17:90b:2690:b0:33b:a5d8:f1b8 with SMTP id 98e67ed59e1d1-33bcf86ce26mr4729546a91.15.1760716794026;
        Fri, 17 Oct 2025 08:59:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/4] KVM: riscv: selftests: Add SBI MPXY extension to get-reg-list
Date: Fri, 17 Oct 2025 21:29:25 +0530
Message-ID: <20251017155925.361560-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170005_384430_8761D374 
X-CRM114-Status: UNSURE (   8.22  )
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

The KVM RISC-V allows SBI MPXY extensions for Guest/VM so add
it to the get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 705ab3d7778b..cb54a56990a0 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -133,6 +133,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT:
+	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_MPXY:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
 	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
 		return true;
@@ -639,6 +640,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_FWFT),
+		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_MPXY),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
 		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
 	};
@@ -1142,6 +1144,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
 KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
 KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
 KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
+KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
 KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
 
 KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
@@ -1222,6 +1225,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_sbi_pmu,
 	&config_sbi_dbcn,
 	&config_sbi_susp,
+	&config_sbi_mpxy,
 	&config_sbi_fwft,
 	&config_aia,
 	&config_fp_f,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
