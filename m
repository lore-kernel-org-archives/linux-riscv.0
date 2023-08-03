Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ED7C04A94
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KA4gdWR/A8KmPvcKqrYRacyzEojy2q5O+CVlH290SnI=; b=xmDfqJZt4q9J3S
	1kfUd9Ji6dshuShYVmyuJ0wGQXrs0oLxKGnZtCVyd6PGRJUKzqeQ2baKtiFMZVyPYspJbC2wKYm6v
	3g/TlmUK6ZOyGoZ5UqhGRDNc8AgPdG/4XmZQAZesEUPaT+lA4zL3k/RRR0KPiWjghU6uZngSt+oge
	yNZJ+JhJ2Yxlu+fSNRTZwQyYeyEWvwFNuQ+Z1a6TUGgCP9G4qDCmbE9VhMOOLOWAd/pSWdTmmm3BA
	QyVXTxSjHl42riuAwOQHH34BEMRimi3cpGjhl5ScR4WsxCFEJyM5OdpsqReXbArXcyvpu3lcInTsl
	BX2fHdrVb9G0Cepp/Fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsu-009MPv-2m;
	Thu, 03 Aug 2023 14:01:00 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRYsi-009M8l-3C
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 14:00:52 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6bc9efb5091so697671a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691071247; x=1691676047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMgdqxcdnDQl98YLRV0LQz8Q38GTfP1yqCfHWC0ZO9E=;
        b=OCubc2jtAM5saxSdv7vwSmoa0U1OQXP79Jz28sjbUAmAnzUFCYIwjnly6PT+H9qfel
         ds3DMFmheazZErFepvPTe3pKElknJ08jUJruuQrxei/F9g7B2xjN4SCVaXUBVy3Qipup
         lHO167bvB/GQJUgwCb8SY1P4IdoSNPsrMR6oyQpHIaW0IrpbNfe8XACcOIFszH07GDPW
         TfHUGOAZtE4N9hSF5q0qNHZBpKct3f7cBxaZ/H/rGGD1oIyFnPSIfeMv75OeNO1JFyMw
         IRVZZhYrrWJK15ZfFLGCjdmj0HdA1qPHcwzYBw5I+p5HuKmN7ZQ2k7qdC7O8Wm1N5cfw
         Rz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071247; x=1691676047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMgdqxcdnDQl98YLRV0LQz8Q38GTfP1yqCfHWC0ZO9E=;
        b=hic0A4R+AMTqQpsVh8+ZmVtj4zQED0uMb+hAWZsSFqoZ3qM4U2NpdT06LIIbh2NiWR
         55puyTIDjeVltfLBudfe2NYopIaYRNISKyaauZ4+OWzs1OUoXJdqAt1QR3Y17kx0l1Pr
         JaoZ11F6UxVX5yxzE4dkf37ZDMNpDnoB+RYpoTxgQjbTbjIVpvw39fTgN45zkAvNQcDK
         q4xjTDfuDIDocoEPjZCugxdro9CQ1DNudu97mfAUlpylyHg83WKwdt/Mod69gWu0jKn3
         1KB3KdPjvENgfHtBbNmd9O/DpZqFhlJyY6+Yx/2idqXoOP9v+kOjSk/NWiiwcwVN6iaY
         qX5A==
X-Gm-Message-State: ABy/qLaG4kSsySbuoJfsfb2MCnPJL1dvDg2Z6Ly6Y2ppBEG6BRnPsCY6
	Yl2UJFMKiEKzisf3qVSe+omz0A==
X-Google-Smtp-Source: APBJJlEcDRgMfvC3IQOWIDRGvND2vw9Hl/YKtkj7BedFr1ziA1rcBuyU5M2yaJHjMLmruPyJIQMDLQ==
X-Received: by 2002:a05:6830:831:b0:6b8:6bd1:d0d3 with SMTP id t17-20020a056830083100b006b86bd1d0d3mr18175614ots.5.1691071246747;
        Thu, 03 Aug 2023 07:00:46 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e14-20020a0568301e4e00b006b29a73efb5sm11628otj.7.2023.08.03.07.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:00:46 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 06/10] RISC-V: KVM: avoid EBUSY when writing same ISA val
Date: Thu,  3 Aug 2023 11:00:18 -0300
Message-ID: <20230803140022.399333-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803140022.399333-1-dbarboza@ventanamicro.com>
References: <20230803140022.399333-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_070049_072209_C8416CEE 
X-CRM114-Status: GOOD (  11.59  )
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
index 0cf25c18b582..e752e2dca8ed 100644
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
