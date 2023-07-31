Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48326C41513
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUS6qfD5eBVbYVnMthN7kyptyWQgQiA/nT65g1S2Nos=; b=XjR//09lXmf9GS
	CF9tY3p/4ja/PRJEx6oFXePtd56ehFG+xZYnXvV2ho854cRcusU4ialxLxZwr73LMVhD4nUyZRCPs
	qdSvervdJNXZD4/dgm9P5oa16AyM9pktivNk7ZmIiMitDbgT2IwKj/3sPceye3csq7FHDcNAQhKfl
	rOyY5zFomJmif1k//iIuXixSyOaZhkBTAdS2JKKp3hi8lq9vX4pKwsgHlVf/6063tp/cZTsbUhpQX
	zO5GazLrhz8yITxiFkR3D9U8egMmEvWU7WBwch3sgsDKr3gKsxU0G85AJrOg9re4ir9N+JlMPRLvp
	nvUsFHA26CeIOzupBYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdh-00FUgI-2j;
	Mon, 31 Jul 2023 12:04:41 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRdb-00FUbV-0k
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:04:36 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3a425ef874dso3347809b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690805073; x=1691409873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNE6gslN2FZbtPWnxyvZs6WmzJ7A08h9mcSC6XkxFoc=;
        b=aESJIiWznJiuLXWXUOl9f6pcdRsAo325ZsbUWL3XuYBw8qSDrwFkt/RPtlzRM749rM
         ckkfXOuQ2HP6NVrxWB1awskSoyWRzgXsu6v7SstGbnvmhQs1b/JcQKZPSSGQNyubvtnA
         cWWjrll0bMsSZBjNEb9dyRSGZz+FLB8I36Tsi9PSA5WtsmfbiRku1VDnXT4I7t7eWxGQ
         XLj/sq8XRI+BlXtr++byayMgvkrfRa+Drdz8UK2x+bsuWvH6UTFRkNgV0VquhPbVsx8J
         vUH1bKyWT4lZgAaxCQcU8lIuGqMNWPOEBWGkQnvh5yfGvP0DRhgbAdctTyf0Zy8TUUuo
         kS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690805073; x=1691409873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JNE6gslN2FZbtPWnxyvZs6WmzJ7A08h9mcSC6XkxFoc=;
        b=Jb3p21Mx3ZfD+kgDbX2hdRLYRP95c3aFIhoYNin5zVcauS7F15IhwAP3mMJ36Kgd4M
         a5zN3jtH5a/7Juwm1RtlhvZ5voMPBeT1PsEysKNGDqu92AlZ+7cHBa+8vhm/r0lkecr2
         0gi3i1qHfWuY0RMY6f8hYLs2560WpyRwBhKTeTRfz4Uu25LGFMOOaJPE3spVvq+jKpuB
         UNt7tZX8SQVZVvK4pJnWcwFlSiwtpdDt4Jqpt1kru9B8icjNMFe5kXVa1HATVNKUJBqI
         8zJt0dCM0E4okLrqKckp+pOUdO31UWeOqMfNefcsavet3V90BWWtD4c7SsQTm2r6YMf2
         eyNw==
X-Gm-Message-State: ABy/qLY+ucNn6OiCxu92grb9ZXKGUWOrgNv9JERs+Sqcwpa3KSGRWqwE
	KIT6pnJ6fVOyVUvqFNJm4ovP1g==
X-Google-Smtp-Source: APBJJlFCdHu75NZrNZR6O6xW5Sj2fyqLsx5lLm8SnY0dOo8MvPVRM1v8rZ2F6hfUo9YOE04NSqHeaw==
X-Received: by 2002:a05:6808:1205:b0:3a3:f45b:aa3d with SMTP id a5-20020a056808120500b003a3f45baa3dmr12376830oil.39.1690805073344;
        Mon, 31 Jul 2023 05:04:33 -0700 (PDT)
Received: from grind.. (201-69-66-110.dial-up.telesp.net.br. [201.69.66.110])
        by smtp.gmail.com with ESMTPSA id a12-20020aca1a0c000000b003a41484b23dsm3959316oia.46.2023.07.31.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:04:33 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 2/6] RISC-V: KVM: use ENOENT in *_one_reg() when extension is unavailable
Date: Mon, 31 Jul 2023 09:04:16 -0300
Message-ID: <20230731120420.91007-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731120420.91007-1-dbarboza@ventanamicro.com>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_050435_272226_68AF6C66 
X-CRM114-Status: GOOD (  11.76  )
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
index ba63522be060..e630a68e4f27 100644
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
@@ -452,7 +452,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 
 	host_isa_ext = kvm_isa_ext_arr[reg_num];
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
-		return	-EOPNOTSUPP;
+		return	-ENOENT;
 
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
