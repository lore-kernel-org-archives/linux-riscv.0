Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0327AC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V2ONYWk6BfBa3IkcU0FydOlGd16n/3zhH2oC16ZAjY=; b=E/2GcklVCN+pEK
	IBo2Uk+9Q04jbojUzk0QfrEa0XE198FYZmJTanaZ9j1jkj1bTVSZWsq1tALp0zDGbH6ucJ6YKIHh0
	XmY9ohSBGS1ilzXcuYJyX6R7GoKdCrYiNGjDZb0z+Ymvl0BHfL0fLI75tSsDp8/h3LJjJ8oY3Xv57
	bc6vhql9kPqHMwtzi7jokk6a2qW3UW+9uKeW0gV0WUr/bfOcIepXEaDY/MFikp+UBlvq1bBPL7d/S
	QYITj2ZZpbbJ9yQ3WxuUjoWnRZ8sgblgs7kibVmVNthOukqJGm7IwDpaF1aUegHsrR6i26hmbYDO5
	F7rXVxSt/aDfaV9AuJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADh2-005JNw-0W;
	Mon, 04 Dec 2023 18:29:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADgz-005JMO-0u
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:29:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6ce2ff70619so933796b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701714556; x=1702319356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=UsoId6VgN25ziZh7HDV5LfgfzEis50+WkAHaFCe/84tdf6jUqG/7PywCtpAgvlqKrd
         hDQcvzCySFj61quEOTvW7EWdmESu135W02RcqSEZuldlzuXamkjdg0urrQ8H7TMdjL48
         1qbbTEzuUID0zmfZPCo53Izfskn09PYIVZkBdlYkg0XcnVeZtjhj66RKakQl98rc9xGW
         duEtYLvdtf5JQFb7wM6aCtTsoL+O6RVQ1Dtm2+6B7PJXhwIRKUmumReFmBcm5uhSxXTN
         p3ve7e1KXzwvp4iOfKx8s41C3dBIzO3DS2ca3KbjhW2k7Sx8JAey1TjsMtv/TfSdjA3A
         K/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701714556; x=1702319356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=abYuM+6gSm9y9vzyxhcvFfR2FZcut5uzjCP2+FWqzqxEnIVvjl2KQsv2v1X58FTFgq
         SefqQv0MuDBUWexL40gBH6Kp2RHgOpo8zMj91AY6UyMQ3AN4HJQ1HMQJ2W8+L7DiIq9P
         xLrIx4FX5QhLwEUFkKw9k58SQWaeTJMxaI0syShJU8sTOfnkP6hLHPI68jajSxaTkx4v
         hqjtfzpCiMa6njpTAJiKp0ytwdcN+wJT8gpyLhAyS1OQX7ovDp1LypTP9A9ru80bltCD
         Jrouwg/uhevyXBH1VB3fzYgKe2PJACPIYeyHA/9jEaSMC9VK0+0uO5JqXQpcM84F8xGA
         Uzug==
X-Gm-Message-State: AOJu0YwyzvhQlXVXIt1zVc68S655MbrnFn+F2cnmYCx1hjDzq/T2Mr0a
	uyO3Q3nKZuRGle39EbN8UCbs9A==
X-Google-Smtp-Source: AGHT+IG6Wyqv2WvJP1zaZXMUuQtyu1/S6bopl2FuO6DN7j/U4MqqE9hCWwoYJQU65ZQ+sT3VU7DtaA==
X-Received: by 2002:a05:6a20:daa7:b0:186:555e:bc80 with SMTP id iy39-20020a056a20daa700b00186555ebc80mr1933829pzb.25.1701714556270;
        Mon, 04 Dec 2023 10:29:16 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b006cdce7c69d9sm1806224pfb.91.2023.12.04.10.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:29:15 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/3] RISC-V: KVM: add 'vlenb' Vector CSR
Date: Mon,  4 Dec 2023 15:29:03 -0300
Message-ID: <20231204182905.2163676-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
References: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_102917_533922_9CFEFFC4 
X-CRM114-Status: GOOD (  10.27  )
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

Userspace requires 'vlenb' to be able to encode it in reg ID. Otherwise
it is not possible to retrieve any vector reg since we're returning
EINVAL if reg_size isn't vlenb (see kvm_riscv_vcpu_vreg_addr()).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 530e49c588d6..d92d1348045c 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -116,6 +116,9 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
 			*reg_addr = &cntx->vector.vcsr;
 			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
+			*reg_addr = &cntx->vector.vlenb;
+			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
 			return -ENOENT;
@@ -174,6 +177,18 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
+	if (reg_num == KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {
+		struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+		unsigned long reg_val;
+
+		if (copy_from_user(&reg_val, uaddr, reg_size))
+			return -EFAULT;
+		if (reg_val != cntx->vector.vlenb)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
