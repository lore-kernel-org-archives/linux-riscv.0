Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9989EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZNSnzWUs0CBJ+YgYY2t1nxCluA5lvg3TLEsDx3IC2M=; b=kFD5BpsiNudDhR
	kMU613RCwSaNQbwCVmrmbCwJU/IzI/1jrRabAIuBos33vCbjazqUWyR43WNaQbr6F3SaijThkKtex
	jJXaJukIwG26evXiyok5Gx9Nygi8OkNBTX+jLjIlI0IS5e9sgick0JvHqa1GQFCAatwdTXXPQtyiz
	cDHHdQmaZ9jTtWRIap22zNPB2oYpajqj8inw1X4HsQqwtU6mSNLRe8XZjXezhoJc37IzF5hXXdy6e
	ik8bA/ZLF7HJSxtss5uF5KitbwX9C7ueRT2sLkTVF0lKdd/HzBQXndVoV2AdGkbvY8rwqxIY5+/sY
	X+EWp7ahiQYH9IO/isig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYY-00BIUw-Oy; Mon, 28 Feb 2022 09:43:02 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYL-00BIKx-RF
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:51 +0000
Received: by mail-oo1-xc31.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso18131855ooa.4
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OFx1LkRnyPSZoRPt++yRCZ/X7QAcbDXb7DbJRNFpb9w=;
 b=E/WAf0za9GRV++42YJoQEmv1RWq2LbVhjKreactOPjFdu6G631daU/9dPqnPLVnznt
 bCPt1pXZMtrMRJIMbxTHeVyRydO7cNrFhuYktKG/FE9DMUiPVA12wYyRxQ++M6on2BoY
 DteC19AIVn6jX9jfv5nHAPQmgPq5N+QIDpFqbxK0wczRdEZd0XLuxYwP9Ko1mO88TsA5
 ZuDp+MRF0MLr4nb9P9dxN0lqLo+B6ZqrWGNfvweHqem44F6PsgKg0XkVMcr5gstVSY6q
 cFwCu8x2HfVezTQ6JqnF0weCzK0oytliORDfkuUHSK/fN+sRqUbkpVDfbYiQd4X/ZykY
 lYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OFx1LkRnyPSZoRPt++yRCZ/X7QAcbDXb7DbJRNFpb9w=;
 b=UwQYg5Kd3hdf0g7++o5HJGatrvfTMQ9lWXZisD5A5nfQmhMGqpyFyPn0ULLvhQ6s6u
 cxa60m1mFl2fxMupGr4VBX84w17OjocCNk7rUTBTaZiEgWw6MRdsNOwHxLNO2I6NCLar
 hbxle9to9Br1o1UInVxWN2nz/IGsqHeDLmQrNQne/NAAYCUxQ8/Jzy7DNAU1sK7NW9Js
 9rs7jIvmCERQ++XEdTmOtzenlHtNodfXie2uPKSPhMOsVM318qlRlNASnJH67oJLqAgX
 ixLEes3UIFV/iSHxLgJGafstQNUc/dNR8iiTU+mqyNrXj8Bl6//uWjg48wheNUVYTcqZ
 czOw==
X-Gm-Message-State: AOAM530s/8PjRDyaAZMwaiOnzjsX0sM+KIzMJ/9Mck/hsv6U+Bao1lOp
 0tY1jJEZDcYZrQs0vg0aVMyed6m9W6aOgQ==
X-Google-Smtp-Source: ABdhPJzhIKtfZEIAafRI4JUqKJcTAu7eH4KpEJ6cvcqwvvcRPwCt5Hxo74efVrqx/IfP4dRTJdimiw==
X-Received: by 2002:a05:6870:b7b4:b0:d6:e56e:b85c with SMTP id
 ed52-20020a056870b7b400b000d6e56eb85cmr7507039oab.327.1646041369323; 
 Mon, 28 Feb 2022 01:42:49 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:48 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 4/6] RISC-V: Restrict the isa field in config register to
 base extensions
Date: Mon, 28 Feb 2022 01:42:31 -0800
Message-Id: <20220228094234.3773153-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014249_927790_AEE85E50 
X-CRM114-Status: GOOD (  11.97  )
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

The isa field in config register is meant only for single letter base ISA
extensions. Multi-letter extensions can not be encoded here as it will
exceed the size of ULONG easily in future.

Only allow single letter extensions (0-25) to be encoded in that field.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index f808ad1ce500..aa9f5a5c57d8 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -47,6 +47,7 @@ struct kvm_sregs {
 
 /* CONFIG registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
 struct kvm_riscv_config {
+	/* This is a bitmap of all the single letter base ISA extensions */
 	unsigned long isa;
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 624166004e36..7a07dba504f8 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -182,13 +182,14 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CONFIG);
 	unsigned long reg_val;
+	unsigned long isa_mask = GENMASK(25, 0);
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
 
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
-		reg_val = vcpu->arch.isa;
+		reg_val = vcpu->arch.isa & isa_mask;
 		break;
 	default:
 		return -EINVAL;
@@ -209,6 +210,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 					    KVM_REG_SIZE_MASK |
 					    KVM_REG_RISCV_CONFIG);
 	unsigned long reg_val;
+	unsigned long isa_mask = GENMASK(25, 0);
 
 	if (KVM_REG_SIZE(reg->id) != sizeof(unsigned long))
 		return -EINVAL;
@@ -219,7 +221,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		if (!vcpu->arch.ran_atleast_once) {
-			vcpu->arch.isa = reg_val;
+			vcpu->arch.isa = reg_val & isa_mask;
 			vcpu->arch.isa &= riscv_isa_extension_base(NULL);
 			vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
 			kvm_riscv_vcpu_fp_reset(vcpu);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
