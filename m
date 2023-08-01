Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8911AC04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j8TyaTU+jeGhQnXKpU28VXm/sN55OyJHzK3+gsT/EI=; b=q2IQqMtosWz7hh
	C2prHebhBBxyUOxMONvbT26edAYvLYnL848p7ethR1mkrXc3HebrTJUI3bNO9B99fgsjB/an7XsnB
	HzG0UhR7D8l115lfTChdM/JKII7oqQXoGDBtrJPjlQW0cCVY2RpftT6qVIUsAlZzizuNhyDe+9GNQ
	Uha8lVCxq/Xh7dNyLG7jC6eTPtrzGgdbTNwqXaeth0N6kAnDjRqtcrtGJ7sApN+Tno9HHKeKqcVfW
	JbT9D+3wP+CDdFIuMhj/oqT0xsFb3EhNa0m/A41aCbG2R3FTo4wVJ/HrJVdLlRt0Kawg+FikSFgcP
	lTpUha8pSRu/bIPmF+mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpS-003R1t-0e;
	Tue, 01 Aug 2023 22:26:58 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpP-003Qyk-0V
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:56 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bc9d16c317so2265804a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928814; x=1691533614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7r2555zrpJ45pF+RZsLZv8NXTIDALNMtu3ezuIYWIw=;
        b=ir1bf1NkUd1QfJs0MVe44GeSJKW7Ts13wluYRfyXEMKO4rAiARVU3OEf1ZOSa4uVQF
         Mb4RWqPD1BOAuEgWt/4d+56bFlfW5NVoBuWtt61bcrrh1mSxlq1IjQq1zOXsGHwjocco
         Nk978lpLIl07pOTduDqRPuhAw7NJd3tQZ1twkagrsOjpoXPMPD/TvCVzzAuQD5DBvppr
         lnO3xRJByWxB6qQ8dJe4OgZrn0Yj+u1+MlgNaaFs4x2kmSr3R8m7PTMz27Aawz0goNE6
         9JzzQO3md131Sqfur2oRUuCQ/DcEku7139RHYYkiFbnchk9pL3X3PADfe5HLZYrvZ14G
         23EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928814; x=1691533614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7r2555zrpJ45pF+RZsLZv8NXTIDALNMtu3ezuIYWIw=;
        b=Wf2izXz9yCu0+vu1Rn3u603UDjgqZneunUp0Oka9VKh/djG6CiP/0oPBsXnwOAwYSz
         MPQaiZcYYW3p8ow4yhD5ORynYvn+wK6iOEbmgP0nFdj5slGlCv/RJY7YgO3jUbZMgqaT
         L5zj6KAHff8Wup1Twv180bCn5BMS/eT/J5nvtTmkj1s3TEU3qFxILtUy+p48T9uimtAT
         oAP6HC6pMHLecl2UBIL/DXHcLCt+ynpnrRxiL65lSPwiqxitkJlFqOA+gK0rzWBKR984
         auiE8l1RpmCbUZ5ABxEOLrFLoPI114lI1CgTKHTrMu0NWLoDytmWUlTdLYbOdFWQzVkr
         Msnw==
X-Gm-Message-State: ABy/qLbzAcleTkGGXPPBDqkkkziU3jcp1oBRBu79Ri0n1Gu2curHfBQ5
	Y1pObtEnDpnb6Ez77REeI8Hwsw==
X-Google-Smtp-Source: APBJJlFRhJs+P7xUCrp791oiLfhFUY5WOcY/fx+DPuNv6D9PvqDYzDNwGY3bVHnAmRGk3hvNYCx9jw==
X-Received: by 2002:a9d:7543:0:b0:6b9:1917:b2f5 with SMTP id b3-20020a9d7543000000b006b91917b2f5mr12958739otl.28.1690928814338;
        Tue, 01 Aug 2023 15:26:54 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:54 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 7/9] RISC-V: KVM: avoid EBUSY when writing the same machine ID val
Date: Tue,  1 Aug 2023 19:26:27 -0300
Message-ID: <20230801222629.210929-8-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152655_219161_A56F6103 
X-CRM114-Status: GOOD (  10.45  )
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
index b0821f75cc61..1ceccc93ccdb 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -232,18 +232,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
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
