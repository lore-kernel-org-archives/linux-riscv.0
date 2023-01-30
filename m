Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69033C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmn+xffy+S+SvEh9CJaL6B2LDCtpmc0a/IqVLNZAM9s=; b=0l17e/tGgfRcy5
	urBd6tUbMdCJ4vVpOyyglaCqQ5/yZkVcXPrPcFC4BxDuXjz7w8ODvWd2LTCXJ2ytQl69t29ls0xve
	1nhqUOxDI7cUy340qG42CDWGGz+T61eTCFeT7ZTYgGOu+p74xTysCDmjRFyuF3ZNsEekDo6Ydyi91
	OR6Baa4plNoXYNEKPp9OFW3rToabbqTnpv6dm1Rml7RuHmQsJ5WajLpNq9hN7zsd+KtaYaFnKLa5b
	dg1j0aVpz5Cco5FETZp1ohZ1DzQjkJEWnUQt/QbFb/HszczE5/6tspZ28vDTpDZEx4/AecQ/gmkzZ
	bhclrcwMEdsFQBDtpTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSr5-003PFX-2z; Mon, 30 Jan 2023 12:01:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqx-003P9B-PU
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:41 +0000
Received: by mail-wm1-x335.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso7964156wmq.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=SFsYC07kkEAsM5ezI637XK7r6EP24rFpHjQDJirzqndLASND4JcBszbw101RJx8KMA
         2k9Y5udjbrlfCzEbSVG1CZFvfFFsuygRjTvGgPzwRSJhK5CcHKfjTN82FjCvwMfx6+gW
         bnG8PJErk0mj/HjxGD7ZfO01mryty0QxmBINhoo7KzhR/l705ZbQb8HvwrqQCU+0a/Ql
         rQf2YFZJ7EtcV88IrHHViz1kohZQlXjeREApatjpndnzsPPZtyewPh2KY54f86toFpDt
         I/IXQJHebnwYJE1HS9fjtJPt0lT/mYVRJFVUZgJnRyYK6WaCo0apHSTFECZl9IPXig4Y
         ASoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=VV2l+uPwxBwKYIKW5Qg6P5bevIAnSeVek9m9zpjjS93Qpvf0DEjXxeMqShtyEvXStO
         LBPx/WMpA2wzMlqyTI9hWLSidXzmE5auMlmHbU1Brdu4TIqM4XVxUzryBzlx0a0Omgmu
         VFUBv7lO2fAi9g4uU0O6C87PRSEGTORvhMkXa5cRYwf8YANGVjc6/sOk/YwtjugIUb5R
         egkvXJgLJff25/PcWb1ulLj5QE6h42yUjt5+freaNCsehg9NVHLy+yX+wDUssXQCQe6E
         5xtlwXKsyqR6n9nH+BEbwfcn5IqAV4eLLcrj9qOQXfVG2awcflpD7UG5elhjAFgwcaO/
         YGfQ==
X-Gm-Message-State: AO0yUKWq4lgEsNqj4yYUr7xDxVEcSXdIrgaUxmWhpgZOrzQl+W1f8NXM
	EpL4SSFgW9LZRk3yETfpQ+UP0y6OuREXceHa
X-Google-Smtp-Source: AK7set9r4Pn8t4fjkHw8Nhn2tBSaPoxXGKLIPE9POwVxQLE7iNsvf5JAg3InByEUmn8SPLvX0+24Hw==
X-Received: by 2002:a1c:7210:0:b0:3dc:46e8:982 with SMTP id n16-20020a1c7210000000b003dc46e80982mr8145087wmc.19.1675080096955;
        Mon, 30 Jan 2023 04:01:36 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c130e00b003dc541c4b13sm4353193wmf.21.2023.01.30.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:36 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3 5/6] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Mon, 30 Jan 2023 13:01:27 +0100
Message-Id: <20230130120128.1349464-6-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130120128.1349464-1-ajones@ventanamicro.com>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040139_862848_083B1D29 
X-CRM114-Status: GOOD (  11.50  )
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
