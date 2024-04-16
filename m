Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA66C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O/6kcOGhQC8OEgf93/u5AXhghbPIAArA4ygly40MBYk=; b=FxTke4EK67wWQo
	HYvkua7tcwvTWNOFKFV0ipdRNCCl7EXS3WDXv3wv+0op7SFzeObI1kCAywIxfKLCDYAFaUc1YnzZ4
	SSf0u68VH7XFNmNM/Bvk0hC9HD/gxV6JsOgonBB2mBlv2GI+ZgmfM4YMG6z3e+BJPHrD8uzxFQoOk
	dzmAk+1zIrYmTb1eo4NgssFrun08qcRORbOyOHEebY4rFuBrDgPNVF8aHEne39TYR89tti9Tzq2KC
	cBxg2q4oHLbPcE2aZyvPqrklMCJxC8GsGukHqsHzGalh/5qYVrzhucubchF4ygBXhDs1p4nMi8e6P
	gudyEu6kNTte3ImszD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnp0-0000000DNSG-330v;
	Tue, 16 Apr 2024 18:46:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnv-0000000DMag-26PO
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=; b=DRlp2NFMWC3Od5cnRb0suOmT2e
	tLkAG2ZhcRUeiOT0f8vvU9AofYQiJLlEGyTNitN0dtzvLljxx6CObJuBVGWUXTHhKVXGMrNrrYxDR
	7JuEWreizFn1Vvuz2dFDn1MtJyvnK7WiZfyWUgg3slQfoYyxcC/kDaW/u1POaVPP+lFZq5oBnDRo/
	cYOT3ASFL09eIgV1AM9XpawIdnN05Ne+dsDMsfA2ZG9JKgQCyP0PymmJPJAnE45c25YHH8hMYXt7n
	tWoB/WCeNuY2w2IxZZhynrwVlqQ9TeCxO15fJC47n9HWgJ+7s3oWKI3UkzcsgFfeEVceF7TLl/nvp
	nf6LhD/g==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnq-0000000BCMb-0wkm
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6ecec796323so4926292b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293108; x=1713897908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=suaLu66wgVIy6itAX2nQNF+V182CMXmclDeMNhJeSEZXRbiBQTf6wKewZQ+Eb8dGml
         L7xej+wx6tWI9kvJxqwiaX+MMUWG6xLa7oYDWm88BS0cDVFkbqh2NrReBhZW2uKNLRo/
         yOKGD4DtQ0JL7TfUE7KJPRHLRzZYJe+4U2px89evLhvDKy3PxYFbX7yAvSwvb5+sVoCE
         wv+25OEjfXIfnsNwZJlr/GxFVfdV8ketXn2qksGcCs5ZNM8Ni6Jf0f7DKohKMk2/6j9S
         9WmxdubDN9pa/FxFyeN0CE/XziWmY5YUyX39Sch8Qmw/SXZq3Ad9QC78BRyVEIKSqeZS
         66KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293108; x=1713897908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZMdAGbGUb3Pn/mM6S9aCTNbs+MKWuMa25SVPrHMqxo=;
        b=XvbQ4kFTyFMGy9JBzjaW1j9r/IWxwqgY8cvxOpqbBxPsT8+oyDJbW6ZHuec7jIfiBv
         YR7zISsBqo+brQhN0+IlFXYsB4j9h6+nLdP67XJ3JCBRi3dVseAshdv+LlbfLaTOGStx
         4/Fz/bSEL9dEdTsPqPmidUSOpQMdrjzdOWMQAvIn4bQyAX7ADSgxPbMjbp8WtrGw4VNs
         XfCK+72EuNjtOrBTserAh+VhPYbZoZej4QPaT9a0z3jWlnu+jIHhPxqSwrubZD+aQgRQ
         n0GwvEEfzf2+Ah/EqbZwteKSTGqdC7lWXLL5auTU+cSrTs9SgFX7wkaQmAH7m7olXetl
         frXA==
X-Forwarded-Encrypted: i=1; AJvYcCUFVkUQaCQtmjcyd5GSJodSNa/xa4RkN59kQ/qAhMPFEABVVKYnQ0yVmz2Aa4m9JHsNyyI31AjModdlx5uuV1FCGgSTIVNTKlO0Oj/5Z3Kd
X-Gm-Message-State: AOJu0Yw1j14jUgil+rrW7QaMsf1A2L6/Na5a+VdOLyoXYuK1UWI4Z5L+
	CRrukyo33wdz0sLXKU1TSmylV5go0zHLR0JzGtapZ73KrJn6JTBrm0xVPyzOCUc=
X-Google-Smtp-Source: AGHT+IHgRG4T/+azse3yQ3uEFH4UwWDhG7EwA6pm2R37KVOzESHt+dYSJ3kmp52wvG9g6bY/TLOb7g==
X-Received: by 2002:a17:90a:fa08:b0:2a4:7df8:bd71 with SMTP id cm8-20020a17090afa0800b002a47df8bd71mr12249412pjb.13.1713293108318;
        Tue, 16 Apr 2024 11:45:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Subject: [PATCH v7 19/24] KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
Date: Tue, 16 Apr 2024 11:44:16 -0700
Message-Id: <20240416184421.3693802-20-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194512_171002_1836DE35 
X-CRM114-Status: UNSURE (   8.83  )
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
