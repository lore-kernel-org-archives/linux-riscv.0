Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A2EC6FA8E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Feb 2023 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rmn+xffy+S+SvEh9CJaL6B2LDCtpmc0a/IqVLNZAM9s=; b=ks2TvuLh9Huijw
	6c6h7NeKTmC7bES3M6lA4y126bBdXzVQTNQrvsILVxripTBDPCQqQ5tsLvEPQ0SGpU6aOlK0jgDiZ
	IIylBB+wSa8p6KjEo3R/hPkwI6GhFAzwzvJrCuIsM3DxqXapwUkv9R0yb3QyLNLTgqyPovJKFSTM3
	Z9KlaX4hAqyxWq9ZKRqGvzswsVPo1MdyG6aWNVCwqqPQ8gJ5YSGEmTQp9VH8A5c016+cjU7JllhOv
	QAnV2P2pMU3bdstpT4xsf/9hSkcW+gtn/D/xDJTW5TwlOxUv2Xbs4HVogc9NT5fnGM9NRQ1HPG0LX
	xd626ZPL4A8WUMFOl/tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVbuQ-003JJL-ID; Fri, 24 Feb 2023 17:31:02 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVauC-00378K-T8
	for linux-riscv@lists.infradead.org; Fri, 24 Feb 2023 16:26:46 +0000
Received: by mail-wr1-f49.google.com with SMTP id q16so4153895wrw.2
        for <linux-riscv@lists.infradead.org>; Fri, 24 Feb 2023 08:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=Vy71SU7zuNIXJiH/qB1kiXZfMEfbB0uoSbnTAnzP1PjTxaknmh+uieMfRQ6/zp3xwI
         1E0yfSZRExBO6kXuBZ82OuZcPS+SA3bXdWyGMvPV6vhXVvnifzs1o/w3kobRRYgNct3w
         rkkjMf3lVRjipghLhcn1DmgDh676bVYG+nwh09AJ61Lq/e2GCjrP0fK7E1wcEny1D/Hg
         Qu6sSvnhbbuUHEse4hbl84VcYhM3RXXJzJafSlqWdRGIFFQUPQxoJqKIJiMP7V5/YkZC
         2tvWjg6zURxTidnqq/Jl/Cu/1On97PKDfMO814pQ0+Z84XRQ8rCmzQbvtjIfHlxBNgpG
         Xrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Z6tZFFE5BTtnAERh23ZFuGlAMKjWB1LeNlstGrShuA=;
        b=SCvK7+l8Ucp+h/Gpu1UX/hZm47EAbHS/MezssM+47avZiZ+E1/pvKVPXZ1MJrngtGT
         EeTrwGGYny5QzG2NCJAqhuLMtmv5fKdL8UyBcIh43eIB+MIKrJMwfzQPyVWis+7oV0b6
         DUL/1D2cCUqURDrF7dWQZG/SciXrw5sbGKBYsIsGoR3jUbzeYRSvcs0dp/5bE5qsnO/t
         DWNB5Ko5zi6o4spzXN4PCAgR2XFpQbO425egy3n3XvvIQTV2SPEG0HIUoS88uEoozIZH
         t9VEHlOBcVFAYZWktUi+Z7C2IQ+7uEf2cNAH08/0xa02gshjl1t2layYGIYyKuVvPG+S
         nfPQ==
X-Gm-Message-State: AO0yUKVlRoUf6QRE1BMPlNZujSCyoTYkB9y4mTjRE3YBpSuPWRbsRzhY
	ifrI7EpGdS6SG0jr6wfy9zlU+FP//gViVHc8
X-Google-Smtp-Source: AK7set/VtgsyzXm8Ap48VZCq1ILylsYFDhexWn5ba7SjzSOIRQncUWlH4PUYTDZ/8fn10OmbbTANfA==
X-Received: by 2002:a05:6000:89:b0:2c8:42b5:8025 with SMTP id m9-20020a056000008900b002c842b58025mr640072wrx.47.1677256001439;
        Fri, 24 Feb 2023 08:26:41 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003daf672a616sm3318597wma.22.2023.02.24.08.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 08:26:41 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Conor Dooley ' <conor.dooley@microchip.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Sudip Mukherjee ' <sudip.mukherjee@codethink.co.uk>,
	'Ben Dooks ' <ben.dooks@codethink.co.uk>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v6 7/8] RISC-V: KVM: Provide UAPI for Zicboz block size
Date: Fri, 24 Feb 2023 17:26:30 +0100
Message-Id: <20230224162631.405473-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230224162631.405473-1-ajones@ventanamicro.com>
References: <20230224162631.405473-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_082644_962427_369B962E 
X-CRM114-Status: GOOD (  10.90  )
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
