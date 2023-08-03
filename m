Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31093C04FE2
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxLOcccd++7h/ZTHL//XbWMgk46DXNPATAHbz/fKYQE=; b=NEtVj63Ry4D3CZ
	gfe5pgZDxUmXPmjOyful7T7jNLTFUi3zpT65ZhWWmDnqezcqsDYR2IdiuDy5A8P1qkT3xObkMGQ04
	FKCCH/AOkbF5W/kMajoN4b55ttbCPBTc78lW3L6chDiA6T97So1aIc2KPblpHBNNebrV2MKlwha6l
	P4t5Go2Z0NHbF5qMGvToCA8p5sKzG4IR9CPiruyB+tYjLT09J58qheHj4RoTO3ItXECIQJzmTZGDX
	U3sdNxNisUlzp0yx2CmtLyOEphLlP0DLAsTWfom2MhABJO9+ZeaY0M452sIgF1kMOHR8I/lYzKdIC
	munUMx3duo/qFx0Ex/Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGI-00AKV2-1w;
	Thu, 03 Aug 2023 16:33:18 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGG-00AKSO-01
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:17 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1bb571ea965so811052fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080394; x=1691685194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Se2JbaEVYLXjTL+pjhDmFAfPctGeuPvLnZbRGMw0k0A=;
        b=b4rf82DOOXLAo6uXuOPKsQdJ7VimE8510z42ayRg4RsS1w9OSeVvKZNaAglixIl7SY
         tSv4f5vykKGjEmVqyCzXRP5Tu8eseQr2wcSecarFNdVy+TICVxg3JsxM28azIhKMXWX5
         lqqH17GN1xoOcY02EDZPFeK5VxnG94CEFcK9RFoRlDyDm3nrFPigASPwoMG+68oXJ+hi
         X5viSYt/tCkPCc1Hr7VS88atC8bCtnLmRgzM26+eWShJyrbXGAESEc/+bAOo5HQF713u
         kyLwSgHc5RKPXoEzbE42igH22frMLNfy/AQ9IUPUl+rDcd6gQkNbcbQntDXIuyH1tKVk
         ZsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080394; x=1691685194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Se2JbaEVYLXjTL+pjhDmFAfPctGeuPvLnZbRGMw0k0A=;
        b=aJ7zBITqAoJoa9lzzvO9sxz2OGQvV4ZDItsg73PfgcTiW+UHdkDqzzu18WEc7FU5KH
         P74Zkw9HB4LK7lRN2fovXfRCCyXMjuczEn/xi7Qy9tQFQGiaZqaEprBz1bNfz0JSUo4T
         dom0sWrL/r9ndKPC6ZZLOd3LexRV78pnqKy01RLIQX5PjmVgMtZ+94L8LgmNWfYVFAZZ
         VVQHGMW0ad3zRLj9Pe/K/44ApAz08aaZD6IemcZra2/fsqOdNAKEymiE6kiunbUSOB96
         npZ6liHYhRZIkv93mQ/r4+p+EfgfWHcDWq684rU/QxGzSy6Auq7pDSpsrq0aaJvHaXE9
         /c2Q==
X-Gm-Message-State: ABy/qLbF7V1c5CSl4uRGuCgqX7ITU/U2NMsUoHp+Opmzip4jwZtiX8na
	znnZ//cc7aonB4SESFGdXDOGPw==
X-Google-Smtp-Source: APBJJlFGD5MMq2Hoaz5rq9/cnX5nwZ7QsFelzBO/SLhIYURmphmt1RQt1A03YSPSmHlaKbGw6A5SAQ==
X-Received: by 2002:a05:6870:4182:b0:1ad:4c06:15c with SMTP id y2-20020a056870418200b001ad4c06015cmr20868299oac.18.1691080394134;
        Thu, 03 Aug 2023 09:33:14 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:13 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 02/10] RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
Date: Thu,  3 Aug 2023 13:32:54 -0300
Message-ID: <20230803163302.445167-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093316_064277_A54B485C 
X-CRM114-Status: GOOD (  11.94  )
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
index 456e9f31441a..1ffd8ac3800a 100644
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
