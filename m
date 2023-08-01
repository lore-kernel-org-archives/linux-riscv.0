Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13F2C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yreyxF1qtlv/HvrvIGk6s93K8p5QN1oPWRleT0UDYB0=; b=kGra/vMEbq+92K
	Tw0bKvCCyChM+wfIKW42kG9JxkI6GAaNkwwp+gPARWXVrr0CHa49XH69NFDqGxDEHVKARaVIwqK1u
	mNvkUAlZ3oJbgXXkcwwrDOuYH5nC/hI316YuHFOVGPvidDMI2r33amGettnJzKRi3JGGd9nP33RB4
	QO1rTWq0gyBoiRjKH6usOuXMjCMm8lTVvpJHaJyXeZnT3CVLr8NvEtW5T3lS9Iijdwyu95WRGFZlZ
	GHoc9tGs+rVLrAXu1YEbgBJ+6n3IFIatzO8NBSl6cLmwvhn7wB+3n+SVnD/KGlF5T4IF7bC2DA8nR
	c+YzrqPTSK3p6raoDfCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpH-003QsA-2Q;
	Tue, 01 Aug 2023 22:26:47 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpF-003Qos-1L
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:46 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6bca5c71a6aso2256399a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928803; x=1691533603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3eA/e/cB+WcDUoMj89fMOnZM8t06QYD1BWj3IhHamk=;
        b=NRMXz2Obdw/cifjK+L0RgolPw26C7twXbt2QebSreG/+KYTvMociZTnO1XU1TFhEAg
         gEdPIB0CohxtjU6w8w8Anwnu/pmXe3e3U9ER3hEBAXYID0s0WeKAhFiHIffHtBSYKLkU
         D4NWRabUxNCuZQG8NkIx1tjs8i+B1Evnsy8YZ+4h0RSKtnTjp93XrAUq2uf7oebPM+2Y
         bytVHHg8cwRfub405gSLORmLY1PZiZmYMtxlohaEsO5bTA/kKNg1EHpw3FwHLm6aCoWS
         hIgZNAlseXlOzvUfzEk7Pr2EzwJswSIufNi2eFU2pC8phuqWDPAUW2Dh7U5HL2KC83/X
         Cnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928803; x=1691533603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3eA/e/cB+WcDUoMj89fMOnZM8t06QYD1BWj3IhHamk=;
        b=VQvvV07roHDrCEhVv83vEttjPaKg4vJ1d7bReqoLTW57wrraT4sWyLWy+Fp4LOc0Gs
         6K0cBtDbJitkTO/VBkvucVp8YYAO5SlFb5pDHk5vVXXpGxQwpxOm3r9IW+ZMuR1DsF0x
         8N5yR679uRlMyHVlEyZo12w+byOUChdSe2KPNA8ECwmwwYyqtu5ghUHCMsYwjQoKFMdE
         9FlWJTQhmUuiaQVjIvPwNqifaiKqlpqZCF9qInNYWv/AAXqic35FeBLCLlpSAozKMZlk
         cb847tcGw2ZhvUG87e9JP2c71kwtecJ1Eu14AAjGqKqllEw/XE5BG1ght0g4Cnums7HN
         k7zA==
X-Gm-Message-State: ABy/qLadWrXdZnJ3cDOkuTj13prX8/VlzA8R9Eo6foED7wI2vfWWnj5p
	UGy/MWAk5AadgkMITM9UM1QbSA==
X-Google-Smtp-Source: APBJJlHmOOJ+gAPePagRtIsqfdWm48Qym+qt0rsxV/ggxmZSqjYFPuyZ3A92I4GeuBjq8dcaf9fobg==
X-Received: by 2002:a05:6830:1b62:b0:6b9:2b25:459c with SMTP id d2-20020a0568301b6200b006b92b25459cmr15315290ote.28.1690928803303;
        Tue, 01 Aug 2023 15:26:43 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:43 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/9] RISC-V: KVM: do not EOPNOTSUPP in set_one_reg() zicbo(m|z)
Date: Tue,  1 Aug 2023 19:26:23 -0300
Message-ID: <20230801222629.210929-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152645_455940_09612694 
X-CRM114-Status: GOOD (  13.15  )
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

zicbom_block_size and zicboz_block_size have a peculiar API: they can be
read via get_one_reg() but any write will return a EOPNOTSUPP.

It makes sense to return a 'not supported' error since both values can't
be changed, but as far as userspace goes they're regs that are throwing
the same EOPNOTSUPP error even if they were read beforehand via
get_one_reg(), even if the same  read value is being written back.
EOPNOTSUPP is also returned even if ZICBOM/ZICBOZ aren't enabled in the
host.

Change both to work more like their counterparts in get_one_reg() and
return -ENOENT if their respective extensions aren't available. After
that, check if the userspace is written a valid value (i.e. the host
value). Throw an -EINVAL if that's not case, let it slide otherwise.

This allows both regs to be read/written by userspace in a 'lazy'
manner, as long as the userspace doesn't change the reg vals.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 291dba76bac6..bd4998c3897b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -213,9 +213,17 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		return -EOPNOTSUPP;
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+			return -ENOENT;
+		if (reg_val != riscv_cbom_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		return -EOPNOTSUPP;
+		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			return -ENOENT;
+		if (reg_val != riscv_cboz_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (!vcpu->arch.ran_atleast_once)
 			vcpu->arch.mvendorid = reg_val;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
