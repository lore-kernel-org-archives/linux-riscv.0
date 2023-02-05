Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06CDC61DA4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A54p62iFVpKYeDfjRIWOw2kOTKXPsyTuvZMppqXKgCQ=; b=DCN8F14JiJ3Po/
	xTugaWgd3Cp8B9tgFiMjMqY6Z3rC5xfuH/ymPK40yQIDzs8I0DdemCy52l//C8g8Y6OcHw9mXt/GB
	D1ypyQkhm1E5zcdTFQuzyM0vXpQQRItT05XXKQ3JvxfU9EoWosaYdSZDO60PHfOJaBkjk66wzDCpH
	nyEJYMtxVhYteD8O6Fzm36Nglkz1WJJ+STQ4ZuRuf8QjzCFtLjN2ygzLuXwCNmbTCHEMmBJQJUOHZ
	jVy+xHuVBlM5//DckaitEoiBMCfbEHKLyLj+bel9emYQTOv0PAs7n7LZMZ2p4pgpmc6jIfnSlWzIL
	e1P3PXJv4yuQbrRsLhxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUaK-005rmR-6H; Sun, 05 Feb 2023 02:16:52 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOTd8-005oE7-0G
	for linux-riscv@lists.infradead.org; Sun, 05 Feb 2023 01:15:44 +0000
Received: by mail-pj1-x1032.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso12181401pjj.1
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL1w5YmH06Uag3nFKBzVH+Q8AGlHge+37YxFY5KSNeQ=;
        b=2KeB1jxYPaCLPXLkMP5mt6zfi1XGL9R1LKG36JlfXA9sVgGLJ3oSGg7U0iBnoTF9SN
         W9ugtfrjJObjFzbd2okc8e504/jTXoldkYd+zyNbyuOfEpFwLC9O2IaNDduH0KbYS7rQ
         8ehshYLN9x+NL7+tVh8D47adAOcUPpcGcQiLmliBx7L9YFoav6/hGfEVZ2Ty7fMU0pNA
         u4dEzkas+DxaeMrHMCNZpVMGOdk2k7Q3Pnp4ehpOlS5HkZAUx3EWXDImbAXdh63UXiOw
         PTBJfy/MDkagjRDhImgyXX7SeeCkQtXwoPMOGSa4g7dD2yJtl1wFmRw682Zh1ze4scsl
         keaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL1w5YmH06Uag3nFKBzVH+Q8AGlHge+37YxFY5KSNeQ=;
        b=SS43E08P3KZ6CvPa+1wek01LYB5iPWWZXWRFjSIZZzulT3wnvHd/KxrO7P/HlIspfW
         iqbAYgN9olzRrNtLIXsU7VquHB5zoq+/gXUj8BG1yRjjZDUjJfIpf0jgsuj26S7bhMI7
         I2dWatRxU6cm9H88qX+hw7sDRNvjInm2urU4R6jqTX8yRA4q1TjepLSc2zM1WmV4XkjO
         Tf1sWDWFfIeKew599PtIZUAML6KVCrzrAsFwFdK9dCQmHK+lsGeDsvt6CVcr+W1yM6+Q
         Snb8XXzJDWCpV+tKATPxnQZWuAwUT6Chrio5nH1ECCs5iu57Z/GENA+5sM+nE3X4doX3
         pNoA==
X-Gm-Message-State: AO0yUKWQIgAxwQxM2OuMBGExRZwGOfQzRpS1iCjNkttoGAvcS/yB+jJm
	rAWZJ7dDEZ0elKObozg6LXmh1A==
X-Google-Smtp-Source: AK7set8tuY6it1dMb43/djmw1KLyJfznVzK0z5PWcllP0Qw81NpzHFtxnsPU+VM3CZRIHzx0rnWs/g==
X-Received: by 2002:a17:90b:1a8e:b0:230:2b29:aa66 with SMTP id ng14-20020a17090b1a8e00b002302b29aa66mr16102301pjb.36.1675559727248;
        Sat, 04 Feb 2023 17:15:27 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 05/14] RISC-V: KVM: Return correct code for hsm stop function
Date: Sat,  4 Feb 2023 17:15:06 -0800
Message-Id: <20230205011515.1284674-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_171542_198689_32C70B12 
X-CRM114-Status: GOOD (  13.30  )
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

According to the SBI specification, the stop function can only
return error code SBI_ERR_FAILED. However, currently it returns
-EINVAL which will be mapped SBI_ERR_INVALID_PARAM.

Return an linux error code that maps to SBI_ERR_FAILED i.e doesn't map
to any other SBI error code. While EACCES is not the best error code
to describe the situation, it is close enough and will be replaced
with SBI error codes directly anyways.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi_hsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 2e915ca..619ac0f 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -42,7 +42,7 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
 static int kvm_sbi_hsm_vcpu_stop(struct kvm_vcpu *vcpu)
 {
 	if (vcpu->arch.power_off)
-		return -EINVAL;
+		return -EACCES;
 
 	kvm_riscv_vcpu_power_off(vcpu);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
