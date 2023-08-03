Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE4EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2fNTUP5EYjEOUXyhHXapyzw4fxIE6smvfdDZI4PKho=; b=v2eiQa17aCRi+O
	IfaOgbNYuZgwUTGuMFcLVqJZTI4b7/V3rI9xH4VV53oTeoxGfaRcVvZG1bo8F33rfCQ1EtJAkBlw6
	HNxxHoIyavzMKGZSsfhDp9NaFVzdy83ZwtpVsTMYOH/xf+he3oRNkF4s228qcMB4L+s+HxWcyWdQ/
	jRoC3AY+3nhZ15fLdpN8Ru20rhHsBXC2HDskSgaAbCQ63iR1puB4BcfoUgL1KEle1iWgsvP/M7UaA
	F+ocu+1kAFguKkC6qPVT+ydx+OBoRlAWr2q4PvbtYdxjdLHSKSVbHHcn5XEQgdR/DLbIMA9OutV5e
	CtRRRXMd6UKqIzXxZorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsf-009M64-1a;
	Thu, 03 Aug 2023 14:00:45 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsW-009Lwp-2M
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:43 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1bf08ca187cso650780fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071235; x=1691676035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuntyFMMxpMt9nVYv2KUnVvoZk1tiTsim5h+Q7JzZX8=;
        b=KUQRcqqCueLtkJkANl19wC4Ex0o/jB54dilgf2d02Q32lrdsx++M+hB39W/CXU3YyK
         bo+Loa/oW6hV9AOQ+GIlJVcT9NOrm69AaFSDgYWu4FS6/v0BmL8adcbrVUJkgJuSWw6u
         AVfNmwTVBr2IeSVFRQKcvEfgw0qhm2V3+ak3vcyBc5MsI/xR30Cg+k94AZERuNNHmC4u
         Dl6c00qwNTSm9q0xQG0lTt+MtUQnVKXeswRiJiLKVuk+Ws/LX4SVL5uvmOXA4Yo8EUVE
         1klTiBzn1l5kQDmOHjGIxb6KrVcByUtIgPICSovlNvYip8cGd0IG74rX4f8Mxw+IpyXv
         hydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071235; x=1691676035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EuntyFMMxpMt9nVYv2KUnVvoZk1tiTsim5h+Q7JzZX8=;
        b=Z33CfQrDI+QTWFaixb+aq2ToBDfUPAXL6sshol/FheMhk7luUG2SbR8Aqb8pFgZpyU
         QIREKB9TBuz8yAw4HEA7Eh9ags60gwWpVLXIejEEDAWy/xf2aHzbxHbhbOvQ5sEuOGP7
         fz1Lik0mn+H0styAfKibhQshvIIxC76Krb2N1qZi+ZM/VqxnUcto9tbb7i6EUxuM6GdW
         hrYCLHhuapwVCd6LN/BIv/+nc6N4w5D4u+sNaYwshQe/TleduI3HIY+ZxowA6e0vQ8/A
         lpaNljTqzM82k0Hz837Sz1mePTQochcowLbTR9TTUknUG7MZj5OvNeNsvS7H7N0/VGHU
         3nTQ==
X-Gm-Message-State: ABy/qLbfcdTvMS3LggUbI4PNdXpykAqsFF9Kkk8QbmkccEiyJr9lnbx2
	L3L3MJEj/WHUGd+QGS0qLM9ZAA==
X-Google-Smtp-Source: APBJJlElQYAvKgaEkiCseTai7Ue5DF/IRbGwTrYye5MVdAFIKDUk1Iv8VYnMebTd0sXI3edCmkyW9A==
X-Received: by 2002:a05:6870:818a:b0:1bb:6133:fb07 with SMTP id k10-20020a056870818a00b001bb6133fb07mr22300012oae.3.1691071234813;
        Thu, 03 Aug 2023 07:00:34 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:34 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 02/10] RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
Date: Thu,  3 Aug 2023 11:00:14 -0300
Message-ID: <20230803140022.399333-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070036_795022_07DC0755 
X-CRM114-Status: GOOD (  12.05  )
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

Following a similar logic as the previous patch let's minimize the EINVAL
usage in *_one_reg() APIs by using ENOENT when an extension that
implements the reg is not available.

For consistency we're also replacing an EOPNOTSUPP instance that should
be an ENOENT since it's an "extension is not available" error.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 65607f80f8db..546f75930d63 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -135,12 +135,12 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
-			return -EINVAL;
+			return -ENOENT;
 		reg_val = riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
-			return -EINVAL;
+			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
@@ -459,7 +459,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
-		return	-EOPNOTSUPP;
+		return -ENOENT;
 
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
