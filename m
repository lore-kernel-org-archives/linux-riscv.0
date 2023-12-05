Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68599C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V2ONYWk6BfBa3IkcU0FydOlGd16n/3zhH2oC16ZAjY=; b=QU+Ymf+LXwreCG
	oTrzS8rjFHBUOpG9/qQpNBMHTJhr3vgzpGdXjhXKLZahEsmcUsk9kuIegtwjFddhZXwjs7VvOPw/Q
	78x1jyMQ1Tp3qsoSQ76XMLRdssLtrMWWYLe0+vrKa2GXCxom9SCIuApmiP5PSa/9c7/yOxJ22Nw92
	OQ6jMRbGvfJ9xyzfxjDwPBlXzuFfgmbJVmEcfkdTJ/CAH103a4ghLrYRJ7wlY/5goZfnyJs7ja2YQ
	t41t7MGZ7jeD9k04mRgHXYg3L4giXV3VjdWI7s82weLw22g/znoTeiDxezaZhtvk9QpedyUtQieZa
	WW1suiYQgGN1Mg6H8GaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZUG-0083t4-2T;
	Tue, 05 Dec 2023 17:45:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZUD-0083qa-29
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 17:45:34 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d0897e99e0so18830845ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701798330; x=1702403130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=bTz8WS9TxCIHHb7rBT6XjWp+aftHxpdT6kNpGrkSC7IQAIgCvUIv6MVihdwZeDlobl
         eSHkjtUGDSLKIcf7MTt7AI5S6OfP9JBlBuJUo7NXvZumJHekd7OjLgd0f8wtIClVKENz
         JNxkY6nOQfXcaxYuoLNJj6hU/6IjRVdthUqIPqU8BOVjRz2ks88kCp9Yanwh/X8z5KsB
         uss+B2JgOjdFanh+xK/8EVwyAnPKF/l7/DV0lrvjlBAFD3E310UQ4k38HynPUGkb5DUj
         tRp0+JvUTTgfSjPmVY1N1ggINrF+N86+P+TdVeqEsosJZeSk+ihkMMJ20fxfKuDzVd90
         16LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798330; x=1702403130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=SrakYdX8M/XSBQO1FT9UVchg59XEWzBjVhWpwA0gcHsBuBldS9fJqZjdYqkH0zEthE
         tBFwcscnp3mTpF2wQIEH/Gq7WtBp/I+rFixKmA2oOn6f+Kb2OMNjpu7hlcH7coN0K4+D
         sr6LLsaitznXdEhYNqbjffiF0bs5yFOnYN2FVx/VJKPGsFjuYUStOXagIul4CeCIv/n6
         LtEKs5jPDGcft/r5CBF+QgNG2az9MLfzTT4WPrgdG0UL9P9UPNBRjnTE+6CMjZdOO/im
         dQP8GtsyvbJ1Xegsygw7usKFrjchm6xcGOmw215/KyyVMNC/HYTLkb5vt9ogjvexoH5D
         peEA==
X-Gm-Message-State: AOJu0YxcadFXIkH5NB+ltfHHNH7PxRvX8oXpH66deSQtxlDdRHMotXnS
	SVRtK6pJu4SOmb8TNdaolCK5qA==
X-Google-Smtp-Source: AGHT+IF1UZLtbstXiLGAqb3dZPBrPK0Kg5I3E3SNIV6kA8JjlJ2QhfhiGUU2Udk2N9DtQEvBJyDFVw==
X-Received: by 2002:a17:902:748c:b0:1d0:b033:4a98 with SMTP id h12-20020a170902748c00b001d0b0334a98mr2747236pll.17.1701798329723;
        Tue, 05 Dec 2023 09:45:29 -0800 (PST)
Received: from grind.. ([152.234.124.8])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b001c74df14e6fsm10465705pll.284.2023.12.05.09.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:45:29 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 2/3] RISC-V: KVM: add 'vlenb' Vector CSR
Date: Tue,  5 Dec 2023 14:45:08 -0300
Message-ID: <20231205174509.2238870-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_094533_702116_3D5EDB76 
X-CRM114-Status: GOOD (  10.00  )
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
