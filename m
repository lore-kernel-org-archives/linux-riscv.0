Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CEAC001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e5kb7yoQaQgF608WQeXcfkIRr7BDd6PzFTuz8WIAcDw=; b=LwTI8T1bufUC9G
	jbedg7jhYZ5OaEQdc8Nf8bkaDpClGB1YhFn8mruTG7lbxo5TLctH5l+ZZ+XlmrCi0NGJFIglDIIaw
	T3YnZ99nV2IF85IeceupM05SX4bTxfknmCzJ2aqDA3v2awGyUjmV5GsuulMDy0dQAIMrycTz5mInJ
	gt3Xf6x8fD/U2fuIk4h3QGwdyktVNAXt99mYCn420xyRpbAtLqRBAyYXn26WETIiGhsM9QxbobG/T
	G72hXX5GHDCg1Ons2O4SlImaiqND9GEvzpfymLWL3pyDu1TUAPqJep8Qd1MlWS9OPiGFBPt8HjLHu
	C++CrneuzfD72kRFKILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpM-003Qwf-1H;
	Tue, 01 Aug 2023 22:26:52 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpJ-003Qtn-2F
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:50 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bca3311b4fso2153866a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928809; x=1691533609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YX68cKaF4vnEW+We5lKkwIPc6M0gbxoD0/Pl/wnYmY=;
        b=NnH3ZwjR+6ym79ufxj3REHVCVWAeZnzD6sE/KtDoPaGASei6BgOjGnOIrHQLFwAy3U
         XVSGEs+KVi0Doy801frFsvgI2DyT9wCKY3XW7IwWeqiMpgI8bI9eDTfdmOtbBPLE6klE
         O1JtG42w3iQC8kxerAhiebSICsKy6mL2MTlKv2o+Oc1oigPJmIgEvd0pgOaedovQOtLL
         S5Shw/AyR9huvVM7ZudNzKO8cyLbPf9A5p7lyJGQNzStSZUnmB28HFpyr1Q6Bm59EF3S
         iJkE5nutwowPiFjH/RrZYOEVloZpHL2/HulBHzD01JITmtkpEKG10+6BXPxW/zVNgTzb
         9hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928809; x=1691533609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YX68cKaF4vnEW+We5lKkwIPc6M0gbxoD0/Pl/wnYmY=;
        b=FXSUENP92nKMxM4tIFThTDOYnB6fSkDc/dHv5Vp23j4juF3D/CYj27tKFbRWtnfMDT
         2dm+O5UgW9HE1lcUlvAUKXFrMmXHqIUvChWqG72Mj1GGwhBWK0lw/YoNxH11+aX8VrSs
         lFkhodwNkZCzYN4wmQHbrr1E2oay2b/G4W0P5spyxQH8zBs2lo1v3H1eEG0fdeRVsRka
         D/DgeCw3rciLeMG7CAy0g5ZevvIqFHQA46JZuDJ5tt6Wm0ojY7KCKl2RUd3pggbafTeu
         ZnsxPHTxQ8MoikCklocarwI4pLCFwt6usRAvTMC/hsQkIl7dRLpAfaDB1Kul5EjTm3/b
         0Wkg==
X-Gm-Message-State: ABy/qLYiaJBfbJeFo9/quTYbkwuYMdAnB1eS1VYoVjWvnh9F8bWe8t43
	cv21TITLhJgNJsyzY4slD7VypA==
X-Google-Smtp-Source: APBJJlG0JXAwYbBXteC+AdyNoGZj3thfQ5xcgBrMbS00AErUZEJPmh0buonf9MaVmGH4Fi/5TqTGWA==
X-Received: by 2002:a9d:7d85:0:b0:6bc:8aca:ae53 with SMTP id j5-20020a9d7d85000000b006bc8acaae53mr12449074otn.12.1690928808861;
        Tue, 01 Aug 2023 15:26:48 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:48 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 5/9] RISC-V: KVM: use EBUSY when !vcpu->arch.ran_atleast_once
Date: Tue,  1 Aug 2023 19:26:25 -0300
Message-ID: <20230801222629.210929-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152649_733718_621A0B97 
X-CRM114-Status: GOOD (  11.29  )
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

vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
set_reg().

EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
case since its a condition/error related to the vcpu lifecycle.

Change these EOPNOTSUPP instances to EBUSY.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bd4998c3897b..67e1e9b0fd7e 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -209,7 +209,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 			vcpu->arch.isa[0] = reg_val;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
-			return -EOPNOTSUPP;
+			return -EBUSY;
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
@@ -477,7 +477,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 			return -EINVAL;
 		kvm_riscv_vcpu_fp_reset(vcpu);
 	} else {
-		return -EOPNOTSUPP;
+		return -EBUSY;
 	}
 
 	return 0;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
