Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192EC00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 22:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klVMTWAx7DiRln9EPvmp7zkQ4WijDYaQqjRMgi0fLq0=; b=gynFpJS2uKRh1h
	GvoUPaMo3xwTcbOg5ZDYhF3QRgabHGdEzg4cyjXAR5okgurwc1GBb8OrQpVdA+7VlYq3fO2RZ6eQK
	z7g6aBS+sE2ln2SWlPRZIhqJvazCDqPBYI3pde/4VLP4gWMzM9KOdI3xbgZrz21ZIs0G5dPfYODBJ
	o7CNCFdJ+1y60Kg+IQWlN/NWVXPWw3l3kmJx1ry+EgcmhyNFV8dTGQLp4muRxFRIzJUXZETWM+P0U
	bcHleyeBrurP84JoRItmhpYwxst1iND6WwQn95h2McICoMM5KCFexXnSHhiNqEb4OLbsi702ATEUX
	3XWrO+7iPOW+DW+/NNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpO-003Qyb-1k;
	Tue, 01 Aug 2023 22:26:54 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQxpM-003QwC-0s
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 22:26:53 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6bca5c71a6aso2256501a34.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 15:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690928811; x=1691533611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOO1y6rFtOUhSmw3x6tvYmkLxmP/yHG5NyhRapfW0cw=;
        b=Kd2ObS4PBSVlc3KE0i7AOupNIkfPC0ojkymUuEs/RpkO7vw+pShEUn4xuiVqwfabzD
         FZ9JLaRVMxavQUj8C38DHrMaq3++WltjtYm8Z8E92/f66OfKLxSgG66NCbuo1MFyJ1cS
         KDkCTx06TvjUI1Yn1jyBlAgFnxsPFBB264zddxxbMpYsetlHE4tLVyFihpj+jewmc0tn
         Xhry03XR+F8kcm6YvPLhywmhHSKp3GX/I4QbCKJeWAWJNLyza7aVLbYs3YkPrkbRUQtn
         y75QrNhqLRkqpRUbNsCQeADseO8OdVK4aPJrFwu1gZoj4ArU/b/x4gJmk295AWswAf2s
         EW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690928811; x=1691533611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOO1y6rFtOUhSmw3x6tvYmkLxmP/yHG5NyhRapfW0cw=;
        b=gEQhIsLnGk9jM7SvwBVi7NdPCDDrttvngPMDm1kkc6VtSuL5x48trHEl9z8W4D5PpL
         SeU+U/vR0DQoR8Nc4kEJN1g7fL5GmIEfe4kxZKRojQowmnvXTgTXFhDg3JjFBvNuvks5
         4Bwz63JAC1NT6TXHcWCi4Zr1M2BXMfi6y3FBCv8umWJztIc3oQYPX6ptuSoRMITw9WsI
         xnnAuSq1elFlrkXOi7lPQHzIzn0jYvljMeLOD+pMEztq+JiJEYeWJ6In1upr439Fvo5+
         gPzQue4yYzAw9McNKcXKiFJ93D+kuQxXEyjlegN+yKYaArID0qIKLBLB3zCtAZunrqKV
         mR3g==
X-Gm-Message-State: ABy/qLYwBFrjMcnWhHd5kiRo2vTdY5VxF2isa2hq8z9hql7TB0pgjWbe
	1a6IM8VaWtysNqSv4qPM+6KkjA==
X-Google-Smtp-Source: APBJJlG4GWvMNowYo03XJ1piFonad21+/f7KwUq/B2gZi+XYLHHwgDZK/4ISSAWIkcafFvWJ1jjiDA==
X-Received: by 2002:a05:6830:1016:b0:6b9:9129:dddf with SMTP id a22-20020a056830101600b006b99129dddfmr16236457otp.16.1690928811545;
        Tue, 01 Aug 2023 15:26:51 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id e15-20020a9d6e0f000000b006b94904baf5sm5422429otr.74.2023.08.01.15.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 15:26:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 6/9] RISC-V: KVM: avoid EBUSY when writing same ISA val
Date: Tue,  1 Aug 2023 19:26:26 -0300
Message-ID: <20230801222629.210929-7-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801222629.210929-1-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_152652_309368_28A9A832 
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
index 67e1e9b0fd7e..b0821f75cc61 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -187,6 +187,13 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
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
