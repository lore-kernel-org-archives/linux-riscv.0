Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D723EC41513
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0koejPtddOF+ifV9L1aqpTj4PRuUbF9tBEqyS+r7BcY=; b=jLRUeMgRDZRUlU
	mBJ2gAHP1PfkZLvqA/HDtHi99iCbo8ssQwQ5gmVsnV7z8wYiT2fHIjJnctvL0S+IMsiVPbrliaAt4
	bAqjd7YiDpap3nz2iyKkZa5LdhBPaQJCS1Q1/O86M5VHPvNBouZUp4eAZkX6z2mvr1wKGjvMiFM4d
	iMGTyLxpXpGyMk1UMkyDn9Z+HxePf4XGc5R9PnuX6JZex4FhnNbcH2VRa1xxeEr4Q6wzJQKLQBBJd
	dt3zCW4OTR6z4SOfuJjFUHsdMGt3aqfasj0lkhtyeokgj2ybiY6Lv3mJjNm6Ao6ACGpoKXpz2KnRE
	TpsHwWmPlYSoxlEbWVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYt2-009MY2-1G;
	Thu, 03 Aug 2023 14:01:08 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsl-009MC6-0C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:53 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-6bc9c01e154so1336787a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071250; x=1691676050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0/jj8XZe2G0/16QSZpeAFh+25Re5O97IU/+Y05CM7U=;
        b=TMj2mDCqaHn1I7iRa95PfoZqVLDu/uigTDCqaamPwaAEITunT4atuoTgcUVlgBPnRw
         r9t77Nd1b81S5uWJ2kTsuaAKAZzGaDh3aQhlysDm3e0smm74UJk7QqrGyKlHgolWQ1oV
         BYTvJZWl3coXumhKXwtQCBRKooFyE83LZLiX//OaK/MO+9qMKtAitngfpAKeg8sHCatd
         FnzumKuNswefhxaXUjYJdke2RFBYXqpDcyicniWDFkFcx8vsBTuROU4lZYSlvhS9QyWf
         +rknPZGQ23JeiHt4vjxadRmvReQ8JARfNQ/8FKj3cy5Z1CFzxuegd967m0jIQ8Eia0qn
         cHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071250; x=1691676050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e0/jj8XZe2G0/16QSZpeAFh+25Re5O97IU/+Y05CM7U=;
        b=Mrf2YCldQSUFWNMnz0kHhF+EyuGVQWogeusc3pyZZulnnXTwDL7fPG9j1Uhyif8Dig
         Wd3V1xs6sIkVgAjuUe9ZLH2jTaAJEe8eN1kBziOVluZ8qNUaiWJlKyhTArjraK7IDM7I
         Vo8M2T2hGIxT1PWSygLjSvR617Jl77nAiaSmcKhW1pIGuq0HKMFpS+Ni5jAQFqXUBov2
         +vmBkOcbIW8al1lzAsdUS5v3O91BF3+l4Cqx1+lzKzznM7Fg6Y0QsmDwHYYh2QhTblys
         LwW/PO93+EkcP4RfnNVkrsFNZv+DngMcMpuN6yhNw8dnwd6vgLvA3mm7LnDvG+t0o10c
         L3QA==
X-Gm-Message-State: ABy/qLaindwN8XdDGeifDbtvMkrgwD1dWqj2mq8OvzdgNEUgI+UPeqst
	mUSyFiBmciToVBlY66vFEhsCjw==
X-Google-Smtp-Source: APBJJlFN0Rk5STEm5jArdHCeyZjSMbEocsbopm5itxXndoi1sdc8VNe6PTE/U5cndrjgITYvO07ytA==
X-Received: by 2002:a9d:4f1a:0:b0:6bc:b06c:9277 with SMTP id d26-20020a9d4f1a000000b006bcb06c9277mr6918980otl.7.1691071250017;
        Thu, 03 Aug 2023 07:00:50 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:49 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 07/10] RISC-V: KVM: avoid EBUSY when writing the same machine ID val
Date: Thu,  3 Aug 2023 11:00:19 -0300
Message-ID: <20230803140022.399333-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070051_130057_76799AC3 
X-CRM114-Status: GOOD (  10.09  )
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

Right now we do not allow any write in mvendorid/marchid/mimpid if the
vcpu already started, preventing these regs to be changed.

However, if userspace doesn't change them, an alternative is to consider
the reg write a no-op and avoid erroring out altogether. Userpace can
then be oblivious about KVM internals if no changes were intended in the
first place.

Allow the same form of 'lazy writing' that registers such as
zicbom/zicboz_block_size supports: avoid erroring out if userspace makes
no changes in mvendorid/marchid/mimpid during reg write.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index e752e2dca8ed..818900f30859 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -235,18 +235,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
+		if (reg_val == vcpu->arch.mvendorid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
 		else
 			return -EBUSY;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(marchid):
+		if (reg_val == vcpu->arch.marchid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.marchid = reg_val;
 		else
 			return -EBUSY;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(mimpid):
+		if (reg_val == vcpu->arch.mimpid)
+			break;
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mimpid = reg_val;
 		else
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
