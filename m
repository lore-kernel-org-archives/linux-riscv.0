Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8594FC678DB
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 20:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmn+xffy+S+SvEh9CJaL6B2LDCtpmc0a/IqVLNZAM9s=; b=Dg3XKqa6etEO2Z
	imukIUmpxYMhLDjAiDz6mkmfYLDh/3eOp3BdNpLt9qn4/aUjSSRYABkLH7Vr+jzSXFdehBVf8a9hb
	pU0FTIaalxrLeQgoN1wFmw6hlavov/LLoY7bX1kfMgP9jE/O0OKMhpYEkYG2IgZv48V4wRo5eBkYi
	xT6z2mOVv9wPot4CA1pfsEDsN1bRUuNMlYGRzPBXyuqHJ34uKnFzDGC9cWbm7sg9JkkEHZt3I5N77
	nzQiuRHjSYClIbJJa5yDUAwclXpauxTgijSgMF4uKe9mGi8FmR2ysSIpaoVAMvxZaEaT7YCX+s+Mc
	ObqbnXrXeI/ISjGRMA6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUZ37-009fkH-Dd; Tue, 21 Feb 2023 20:15:41 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUY14-009Uva-0o
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 19:09:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id x10so20568361edd.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 11:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=Ix1WNvgwNW8D11ctXgNiOM0FiK4BP7PrjTKvgkUfpwf9LXRk8uG51OjAxnA8ioAYFi
         D7SM+TuDqx8chuwOWx4IOfWJnA58WTuVxTWmB9gPJ8po+vGR2jZpanaImIuYL1iwnEuK
         pYuvxb+l68vlmFFaqmaUQAATaeyb9d0LttpnMIm1qZJuEzg+yLqrctAmD2rSgkMiEow1
         IxL4fBU6Gy8FPm2oLqKq9ButSf2Pf20/i/i/sbkVaFkZiY/BNXSoBmlXyHHgKVIx2A7B
         p0LwD7ukEuh8lnqf0SKjFJI5Y6+OOpLG9+xNTYZ9V8ybN4RldqgE30eL869Evw3RWDcQ
         kx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=3Hfn7qXUZP49FzfKMKNWt32JoLG2yhM3dpvwg6PiOuLtfLRWIV9MpZWxsfkq5S3VSc
         xQm0aktaX8yKAXiOHN5xP9X5zdvPZzxOD63Bpm+VmeymcnYm3hRy7sN+ux2r3GwWBuuF
         Pw6/8jn/5sBLrVG+JNe7OVrN2Cycu/68HDDhQlyEYdSAKEBn8XsjC8mWl77tgvBXbpxd
         dtTLHeOkFZRi6pn0PurYVpZJAiWyRro+PnJl870us/jNAhFqPpuaum6Am3BL9zIr2+Ht
         JBMkkq5iIoC8qMmDOSAc5ROmrs6FrTZnKqYV9v8gw0FWJ/aaAMlDsf2zw0q9RG72sacZ
         KjKQ==
X-Gm-Message-State: AO0yUKVLKIz8fo64Tfj1bX+BuWYcsgjeOMsBSuBKo8cj3Pv3ju+6OePK
	zkd7kdBd1/qDxzdJek6FS8UmuYMydfcCEbky
X-Google-Smtp-Source: AK7set/AalazSeZ6RJbQ8i5VBI5Nicd13b/AoGuXnMO/zFDUec7sv0ihAdmsDzdQEpzsSiF/L+IgHQ==
X-Received: by 2002:a17:906:fb14:b0:8d4:1e81:f87e with SMTP id lz20-20020a170906fb1400b008d41e81f87emr6368743ejb.57.1677006568414;
        Tue, 21 Feb 2023 11:09:28 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id y25-20020a170906471900b008d2683e24c4sm3043840ejq.69.2023.02.21.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:09:28 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: 'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v5 7/8] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Tue, 21 Feb 2023 20:09:15 +0100
Message-Id: <20230221190916.572454-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221190916.572454-1-ajones@ventanamicro.com>
References: <20230221190916.572454-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_110930_068756_F76AFBA9 
X-CRM114-Status: GOOD (  11.44  )
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

We're about to allow guests to use the Zicboz extension. KVM
userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 92af6f3f057c..c1a1bb0fa91c 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -52,6 +52,7 @@ struct kvm_riscv_config {
 	unsigned long mvendorid;
 	unsigned long marchid;
 	unsigned long mimpid;
+	unsigned long zicboz_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7c08567097f0..e5126cefbc87 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -276,6 +276,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -EINVAL;
+		reg_val = riscv_cboz_block_size;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
 		break;
@@ -347,6 +352,8 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		return -EOPNOTSUPP;
+	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
+		return -EOPNOTSUPP;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
