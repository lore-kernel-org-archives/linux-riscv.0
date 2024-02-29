Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB38C5475B
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/PwkbqEFRQj1/C6Cl0NhkInsfWkVwhY65jj/YHFqFA=; b=hA9hc17G7quJC9
	jwx6prDSv0K8dn7W1TA1lxMgVjxdKIMbCaZm9hgmEmU69mH55sGkZZI7jDN/Itax6CXbQ9sNqw/TG
	0bz4DrQwTDW2jDkMB2vMgRpjU29gfZcjz/kIwcku1uSLZppBF4XYUBCGuj01DGx1IP2DfdWA3DC8Z
	khANUYlyoEUrFaUDXo7KmJhJeReWd0V9gnXfu717D8l4ZTKvlZvcbnT1Sg3sq3Y7/UC48luFAgU5J
	JTSoEiU0OKqk+pf0lagDDIQhgJPSmhMGnU80YEdyEWMBPWCEG58WfivnYqZlnuoScA/yqQ/qNcRBL
	ysKwI0+UODRKK6NQfdYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUp3-0000000BWrK-2JCU;
	Thu, 29 Feb 2024 01:02:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoF-0000000BWCY-0Ylc
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:02:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d93edfa76dso4243375ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168520; x=1709773320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wdj/IM2T1N8fRp4s3UGf7t+cLrV7XEBMNyC4UJYNwlU=;
        b=DogH+yPoeSCAksI49yh6zB6FYjEzl9MRHQkUOg2SSRSc2hy56k1w71N92KqqsX3+fk
         9KvhT8ZNyGK1Bf4ndoYjwhoNysERqsswmV948WyWxZRtIS7nYT8wBs73F89qUnU18QS+
         r0kAh+g2TPSj8FWv/hVrCQJ0tGgRtEX3N0aQc+f6iBM8X0oWiQBa8HXagfLnZiyMUIC1
         UuuJ2Mlgjxl6Cl/SjU3l0ox6rPni2mgo4fLiWXsx6vH/KWMmyX26leU0muzswNxcrQKL
         GG1PSnlJsbhUwqCidlV7o3ebXhJCYtP43b7A5hp7MEVbw9tmg4Oew5iedGrN97iPOAaw
         C27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168520; x=1709773320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wdj/IM2T1N8fRp4s3UGf7t+cLrV7XEBMNyC4UJYNwlU=;
        b=ZiBsjUfKKKynRBP7w2zv1Q0+H5HOQgl/PU3AuN/te+RsQnPL0uVSj2wRvwiJ7hdI9P
         qCkeiJiGyk8exGbWJALHUdvZ34/bU0WIQ72OFWnVklYMkuw8w+W6A4XPvsFxTFHv7XT6
         3zwmBaFdng/X1tgKuov7IZANh3ikxcwjFxxWuKWTlf7UnSpJwG59LWC8AEoqsSgXXJk9
         0U9aPdYnGoGF5fycSgdKu0I/spmhgyJFgdtYP8JcK0U7g59TYyvjPItfA9aQqcyAMPHf
         ckkLKAPknAPVqwm2FqXineOVx9+T4gZd21DD65KfH5ePDv4hcLIPkxekrcKBMm8PsXo2
         myMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSBAPM86dqlUROAUW698KKEVYSHkBhxf/g6yPFO2TO8s6il/+5HN5zpR0R9/LNXGL60ZQdl7iaAFmiaIe9vCFNh+NNCmhvj3rLOXKn2MUz
X-Gm-Message-State: AOJu0Yx2+2lXBxiepUSG7ZzK1sdmLXiCAaTRXQR+X44dSJzGqwz6kprY
	DJ7pobyevMTy7O6GHrbp8Tnfbq4KwDSPxiYwC71d2yNKVjMYGFa/TUQfNd6PDVoeczrVEh2fpI7
	n
X-Google-Smtp-Source: AGHT+IHtgz/3aN9/6IGHFaoY3zOkodaD7W2xNlaR8Hf1IQmcwst3CPEKmznAT/uxd+CVNZPaUomG9A==
X-Received: by 2002:a17:902:d50a:b0:1dc:d515:79c8 with SMTP id b10-20020a170902d50a00b001dcd51579c8mr691775plg.23.1709168520546;
        Wed, 28 Feb 2024 17:02:00 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:02:00 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/15] KVM: riscv: selftests: Add Sscofpmf to get-reg-list test
Date: Wed, 28 Feb 2024 17:01:26 -0800
Message-Id: <20240229010130.1380926-12-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170203_683660_58DA7A72 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The KVM RISC-V allows Sscofpmf extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8cece02ca23a..ca6d98a5dce5 100644
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
@@ -406,6 +407,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(V),
 		KVM_ISA_EXT_ARR(SMSTATEEN),
 		KVM_ISA_EXT_ARR(SSAIA),
+		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
@@ -927,6 +929,7 @@ KVM_ISA_EXT_SUBLIST_CONFIG(fp_f, FP_F);
 KVM_ISA_EXT_SUBLIST_CONFIG(fp_d, FP_D);
 KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
+KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
@@ -980,6 +983,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
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
