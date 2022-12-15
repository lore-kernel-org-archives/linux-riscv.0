Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A809C25B04
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgyGd06ycTFkgFQJ5iG8IXqgnQ5QGmaXHfAy1mD3e6o=; b=cUSe4QGNP1ERgg
	JkHRpJPGORwx47pPzy7NYMATIsy6ajgqttarqfl/uISUXF7EMJtNs6VgQJyM66QWY6CzS0ppwfFl7
	4aobG5qbzT9rhcwVS28VCRlVlQiGh0le0N5atn+x7lsZBhvGao34tE7P6eTZIHfMmHjNbZGqMLdvF
	x+gc1qaPwqEa6F0v70CqsNQNhMmQkQXM5s3a/kURTdAnPXskBgQ3j5r1UVl7Au41Qz2T9FnYmj1Jg
	67s/VjtvXhQBYvn3OATSGjgeHah5U/IOSstvnnfhlghcvxHVMo2pmVC9vzl7SftoBi+UCirzdwcSf
	IMGLdezLGvwB5n6d5fRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5s1o-00AYyS-VY; Thu, 15 Dec 2022 17:28:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5s1m-00AYoz-TO
	for linux-riscv@bombadil.infradead.org; Thu, 15 Dec 2022 17:28:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K7O8/7ogKx8WzzRgxh6e6gC9a0ALFnBxrPW4Tv+K91E=; b=MtTNS8z249ZZNIG/DWloRIRan5
	aUpbqlahbDkH+heB0GbQWM7SILLCqRtaFtOyF53YDu0/8z8SliWr2LPP175HxWjEnikT+3UNFe404
	xIDU+vZvIUQ+MHPXneNUaQwymDWM5Da0u42iplUrL5pIOFAE3NHxKLg6ye31+UXpzPrT6Fb0gn1dX
	npae+qP1KXR2QmWljMmFT5oxntdUrhcogMsSQE35ciMyOkjqUEG+T+jOj2jYm3FUTxMeDr64dm19b
	lB9e3FxDHdUX8TUpIUUyF1O5JcKYnjHEWbyQKYkAr8naVUZlmIhQ8GuW8tuRuDCSR//cWmAXKMZPf
	fJg6ortg==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5rbu-00AtDp-03
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 17:01:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id fy4so11175539pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 15 Dec 2022 09:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7O8/7ogKx8WzzRgxh6e6gC9a0ALFnBxrPW4Tv+K91E=;
        b=rx5/T0r+M+q8zEdlugSYmMVCXj3c21Bm2FfgOzoyHwc+8Jl8/RpTpMXSOEzG+i62mg
         Q1KskwJXn+ytDChd+aW75GbgLkL9lr70oeZXw6iqxWVXLlJZ9QMX6IEBdLU8qjdheZi3
         E/uQ7AHH53sLZrdrevjBMOJNz9LhgJdFhOdIyvFy7ij4O2/UJ9CmNY7ueRA2DnuIRIZ3
         aDo7Wwzp6f5FW2tJPVGUnUOKyhoekaAsmy9mE/pPzTZWEye66pJitiioktZEy9TWx8Hv
         ql+fLIg7uF8vcCxW8MEjrangKuAIhb59R6clhGfh5qluqS2StQzO4YrEf9LVbGyXHgKe
         iPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7O8/7ogKx8WzzRgxh6e6gC9a0ALFnBxrPW4Tv+K91E=;
        b=Yyiius4GW5d9+dA4kenMNVeJ4KCPR+aFeHo8Rp8mE5OXiKjKYgbknxbzZMLqJNGLSM
         OoyH6Ok6VdSrVfSqIAc8+lLeIocq2InmrsbzO2hNFOZvvvUbsU4yzD7ExljbMenfRm+h
         uR2/UXDUDc0L7S1/PUy5/peuKZ5mwuILZRwvDJmVmd1SGr4aqLlJ2UOyeyx1/virFoij
         QeZuMHS3XxgK/d0cJ8pU27h5YnO5Z1+27t/L6WbQgbQ9xmuhKfePCyfNqCSa+Iw4U9Yd
         FUrmIeM9cJkHHeiD+0DWeq/RcPDRSNuh7xjdT8VQajoE/I22TJsACgAwMXZTCtRL0Yeb
         Lm9g==
X-Gm-Message-State: ANoB5pl9a6PnbDO7c5/38hJ4f6ab23Tqb5FcwPZR0zXUsIPZ8+mThmXr
	DdEYUgjZUXew69svj9DWepOPdQ==
X-Google-Smtp-Source: AA0mqf4TLyGoJXHjVVtP4w82MegmT9LdD5zX1zlasjVB4tCX+Jv61apQFV8x8y6zeXa83IWHB2TgoA==
X-Received: by 2002:a17:902:e54c:b0:189:c1b4:8fe6 with SMTP id n12-20020a170902e54c00b00189c1b48fe6mr40417449plf.53.1671123680764;
        Thu, 15 Dec 2022 09:01:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id p10-20020a170902780a00b001897bfc9800sm4067449pll.53.2022.12.15.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 09:01:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Eric Lin <eric.lin@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 08/11] RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
Date: Thu, 15 Dec 2022 09:00:43 -0800
Message-Id: <20221215170046.2010255-9-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215170046.2010255-1-atishp@rivosinc.com>
References: <20221215170046.2010255-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_170131_264641_9BC7D070 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Any guest must not get access to any hpmcounter including cycle/instret
without any checks. We achieve that by disabling all the bits except TM
bit in hcountern.

However, instret and cycle access for guest userspace can be enabled
upon explicit request (via ONE REG) or on first trap from VU mode
to maintain ABI requirement in the future. This patch doesn't support
that as ONE REG inteface is not settled yet.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 58c5489..9c2efd3 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
 	hideleg |= (1UL << IRQ_VS_EXT);
 	csr_write(CSR_HIDELEG, hideleg);
 
-	csr_write(CSR_HCOUNTEREN, -1UL);
+	/* VS should access only TM bit. Everything else should trap */
+	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
