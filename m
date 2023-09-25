Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502A4CE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y5nZOFMe8VDfJIBn4NA23mEZvAqI3xZ9ntS5efx2Dw=; b=040w1k1dU7ctpQ
	0WJD2pEpLFiB/ZKsi7XZKw09pwao+J900wsCyRKQvRiFh7e2tYwBVwOWdws8GbZSVOp+hy3HKJGWn
	TWw8MN2bIUWOo7g7tzd8RVg6uNwShmswRpm+7mtSO6Z4iX61QwSsPXJEz2tvUQhP5uTOcJvrkvbjE
	fiP6ik350QwIJJ8VFCr59cKo7vfTVZWK9010LYpudnjHWpJsjU/vOB8UbFxwV2UaA8lNZ5WNaPHwm
	KOMsKHddaXNj+rd5d5voB3IwHNO3DDh2mVIdb5nQfTq4FRLgO1ZamBtWwagz3s5C/BTQjF7Uu3uWU
	RgR5KSfFDonKEvFVKWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloV-00EMN5-2i;
	Mon, 25 Sep 2023 13:39:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloS-00EMKE-2R
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c61bde0b4bso14708705ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649187; x=1696253987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vUWcwNassqNthW+S+LkFt6P4jG1B8nw+IYC+PUr7yI=;
        b=aaEwSBSkBLYkqghK4/HXOBQPOpVWtZl+pHPLptuoXHjPhFKQCmlFGkS/CNWVWjP4hl
         ka2NeYggPDMRehpPYPbO1Z+R0YHw5B5kzkyC9m21y9vwcwr/RZ2tIbadGT31Uiy5t7ST
         QLwFGEHl/ZDR+8xJyZQxrNzvDsZXnEyIcSUgj4Mm0E21u5eQb1mkLqNJxRDNiYRVevH+
         Ds5B3C03HOkjsx494yPg92GJWiS5/Hz8eyjCgi9mpHDEgN4DVQVoCDSEfjHnt6ysfTsx
         Y+bYSJd0ZWmSorp85ICUdAlxWUbUVzdGJj0gb+S/FVjmGS+p5V9ZfnC2ZgnmGnJpmuXx
         1j6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649187; x=1696253987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/vUWcwNassqNthW+S+LkFt6P4jG1B8nw+IYC+PUr7yI=;
        b=n+RmCmPmS9EGhmHbpowHXaU1fsR0KrdJwzYdy/tW6BFt+YGZ5qit8c3S+ROqyd8aVl
         T7CksazwNpxGFOUTJ16culdcKVesyQh285Ce6qiw+fwhQ3X9HvujC+ZS94pqHScdzFrQ
         HjgJDvkWdERZSvqZ1PP0+wnJepAgJ0lUzbLm6gLYZV/ng+btk77HgnNRtz3ruBB8D4Fa
         scvgaxcv05PdPEH/zCbUYVpn9lgV3b3LRjmHSx7h0WQ4/GtdJgbPdIClZv8QikuGiQi3
         sQxgj8szNr4l1hPx9jXd1wftROugmACXCqjn1VcAvXvB2nLIna+DPFKi09upDTAj8+Ik
         8XuA==
X-Gm-Message-State: AOJu0YyDwr5XRSHUUFuSzq2zojxHnm9YPxfwEBhQuXd6p3/F0e9X+K69
	malIsgRBc6A4Y0x4Y8GuakzfUw==
X-Google-Smtp-Source: AGHT+IHSOl9ki8QCBXo+uVtTVFpD8HahTf26vYb6+QGHrGWFkZ/UI6Ksnsz5GkQiW3yp4D+zsZYpGw==
X-Received: by 2002:a17:902:c412:b0:1c5:b4a1:ff3 with SMTP id k18-20020a170902c41200b001c5b4a10ff3mr9924366plk.40.1695649186774;
        Mon, 25 Sep 2023 06:39:46 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:46 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 5/9] RISC-V: KVM: Allow XVentanaCondOps extension for Guest/VM
Date: Mon, 25 Sep 2023 19:08:55 +0530
Message-Id: <20230925133859.1735879-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063948_799484_34A21C72 
X-CRM114-Status: UNSURE (   9.51  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable XVentanaCondOps extension for
Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b1baf6f096a3..e030c12c7dfc 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -138,6 +138,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
 	KVM_RISCV_ISA_EXT_SMSTATEEN,
+	KVM_RISCV_ISA_EXT_XVENTANACONDOPS,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 388599fcf684..17a847a1114b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,6 +40,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(XVENTANACONDOPS),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
 	KVM_ISA_EXT_ARR(ZBS),
@@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_XVENTANACONDOPS:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_RISCV_ISA_EXT_ZBS:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
