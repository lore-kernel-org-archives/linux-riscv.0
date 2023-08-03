Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F5FC04A6A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0Yt26qZpbBWMJLL0xKhtJc1ZJLRYcc7dwDEMwHhCJc=; b=TLrAS8aTmrbKOS
	VRwSwE6d/IQg9FLd7fK/j0R4k/3ShsoCxjlPn6Rn+tuATyZzVbXhFq/ahTGqwqZ/D6nuVTTnqZshh
	HucMjW1BrJyQbDx5Nr1TL3CtSIPLq1RvxlbSjqTNr5UuXYgnR1bsTPXbgvh3QnCR7B806bSKJmv8M
	CFPU4yGehUjrR1ZV2EWhPapErLoBVbq0ai/s33fFUNTNFLEaXNlFughCXuAGCLrILBtpZ3Rncdh5+
	UXox3j35c+M8D25zc1MqJexgQcZSz3DGM3mDFgE+3h7RdotIgW+Y6w+ukEDfsgm1SQRInxBo0CRTY
	/7KSAfUV2NpsbjKHb+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGU-00AKgq-2J;
	Thu, 03 Aug 2023 16:33:30 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGQ-00AKay-26
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:28 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-1bf0c4489feso834964fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080404; x=1691685204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu19x8hfUH10MYfTjpP1RF1Ut52SK1pMVXhmwflqSgo=;
        b=TpvWicxWFYBiktBxgQXprDfHQhi710ZNwh4iGPKDpbCU/Bvhfjek9JiF1dQ2N3M/fS
         Ph39nnqBvjqk+T1167JKk+ymWTagirpcR2W3t9daD/GyK/yB5qEDfw0L7YEg1AzITc4H
         Q3okzjb0hoB55w56MJp7/rUu9OMylkceruThMCRTUQw5doWxdoeOOh8CX5bHRipt0pjq
         +ecomc3SRll5frP13G8eqWLz6x/Ln1sDXaIMCP7UXAZgIKkYxre/m3CqJCFAmgmxyUVd
         s9U2tYKlZozhRjwUXaFzen8vTx3VI+Z3Hq1X3dP4pO7my5+oU0awjlkxQHx1BNofnJrS
         svHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080404; x=1691685204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu19x8hfUH10MYfTjpP1RF1Ut52SK1pMVXhmwflqSgo=;
        b=WTka7/4eRSguKsfI6J5Krzxu2OzixhBjDWEPLZa54/3jFmw+XN3lDovcrJWbOchrri
         l8Gwz/nk3BWEu93yFL06biowHfofCfdkqBKiPCuTGt782/ApqXmkdhLZi/AIUT4zxhTH
         cQHz2oB0UWcD/TuBNePtT32CB5DUZd2rgHbdaLPT3sgdVDwaxQAmrj5C3tAAKNCu2oPK
         oEOrDNlTb9ywGld30QmNKuaiBhZdvIzRsCOap3Dvna2TkahUNZi7630R9LI3ru4GbcuH
         cgM5vhoNTMIGeAE2nycEvqdMO+E5DPMnYPOD+6Lyv2Ul07KVlSkKSfFzjwFmPDU0PceH
         CxIA==
X-Gm-Message-State: ABy/qLZvRvibBMgeJiD8nHgZ2P3ooB6Oku9fiV+RSfimWaEirzM/pbpE
	pLhB1UXnm9Xg0zOQRJcHXDAAcRjF6kK3t8CFKlf0bg==
X-Google-Smtp-Source: APBJJlG263MxMOlhWr+lUKGc/wweZv2EVJn1qhDZ7kk7BlzsBVSKt9RLtfuD9s11IUfZLBrI6BZ4Pg==
X-Received: by 2002:a05:6870:970f:b0:1b7:1904:1ad9 with SMTP id n15-20020a056870970f00b001b719041ad9mr22111121oaq.53.1691080404645;
        Thu, 03 Aug 2023 09:33:24 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:24 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 06/10] RISC-V: KVM: avoid EBUSY when writing same ISA val
Date: Thu,  3 Aug 2023 13:32:58 -0300
Message-ID: <20230803163302.445167-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093326_756703_6D8CB96C 
X-CRM114-Status: GOOD (  11.48  )
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

kvm_riscv_vcpu_set_reg_config() will return -EBUSY if the ISA config reg
is being written after the VCPU ran at least once.

The same restriction isn't placed in kvm_riscv_vcpu_get_reg_config(), so
there's a chance that we'll -EBUSY out on an ISA config reg write even
if the userspace intended no changes to it.

We'll allow the same form of 'lazy writing' that registers such as
zicbom/zicboz_block_size supports: avoid erroring out if userspace made
no changes to the ISA config reg.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 971a2eb83180..a0b0364b038f 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -190,6 +190,13 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		if (fls(reg_val) >= RISCV_ISA_EXT_BASE)
 			return -EINVAL;
 
+		/*
+		 * Return early (i.e. do nothing) if reg_val is the same
+		 * value retrievable via kvm_riscv_vcpu_get_reg_config().
+		 */
+		if (reg_val == (vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK))
+			break;
+
 		if (!vcpu->arch.ran_atleast_once) {
 			/* Ignore the enable/disable request for certain extensions */
 			for (i = 0; i < RISCV_ISA_EXT_BASE; i++) {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
