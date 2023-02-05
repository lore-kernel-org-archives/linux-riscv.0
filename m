Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C2CC61DA4
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZX3MsT5SNchcfx5INoK39BxdgdTzgj0tsd+jOcango=; b=vZbB+ILPKyEZoZ
	1cKEC3rd4K/045EO2AwcwqapFEvTPfOKJfN9ziGJxn9TTeduCKyYWnQ7qwEDl+ooDrqS3CjLh49RA
	bF8vE2SEBRJc9ak85/btnGY+JWUykJB0MffKvf9CzKeK5WiXzyxckJ5WhKe9q8MCEJ1ATp4DWng6L
	LbPaCEWMqFht77MdMUDiAoRbwERU6gPtNrGaXzExmsskAyk3+58gdeWUniKsxTmed8T42ZpxFl3bv
	wQaLJonuE/HcvyCdDUHnPiVU3FNlMMyGUQPR7/UmE2bPqJcrCNV4pbjz626aFeFXIjLVrdpuh0FKp
	GRmXzxkKg4qf6NlN03bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUMf-005qDL-HV; Sun, 05 Feb 2023 02:02:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUMd-005qCK-Ku
	for linux-riscv@bombadil.infradead.org; Sun, 05 Feb 2023 02:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=; b=RycS6r/ecaHZIWYhy3o/DilR0E
	PRdKsjPuJBsrR+3V+Ft9nkGkHcHGHVTzhvXPIW4G3F9+mXOlXYOz0GTWzWDKoNktVdgSSm9isIY9I
	dvliL/ESY7ytDUitYIkc93U7zygsx+U/8vFjAH/j/oGStm8PkWWmiHym7FOJj6AX2+OcrqyXYjUhD
	uTRvDG9WwzgGPx5xolNpxXCK2PiZgSci9oWaSjOKDAcNcIoNZDx1Zg2/ldIPxZST8M/vI0LCq2LTd
	vHUQsVVPoPdPRsPYlEaK0YAxKOmyHBZSsVLkjTgv43NaiLHnt9bB9NAybHJ/yMKV0JIQ1RPSp2QDn
	TVSszmHg==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pOTcR-0063Wm-20
	for linux-riscv@lists.infradead.org;
	Sun, 05 Feb 2023 01:15:10 +0000
Received: by mail-pj1-x1032.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so5282058pjw.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=F92is3Mh+/4hyhAyWsahqTmK7UARQNYPMeHkiY7mZovc6cBrMgoqpEGCk4R52vY1O8
         Vug8Bko93PzM2rTs6vqEAC37cpCQDLMPZmo6vWBsvVt9fZcm1rXW/WgXEMjNTaVD62qA
         CmnjLxgFsOCoDDMBPj/n4FzGO85igcfP4jwKYx986iQ3/3QVnPBrYT0zNbYjZhzpWE8f
         56DPDbP0Zb5jdVJoHGWOdrb2tE/SFattmiGe7ptXlhBDqOVM9o79TGl2m3KjwkTdA0om
         A8CXSYOrnovno9n6FCXWHTqXlnea782esyGgDBFrKrCv+04s+VZynG38dO9eYKqS0VSK
         4bXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=gXzkBzd2n46k/B9mGfpBa4HOI4z5IBImclNypdidZ6EW5GIaQTcVB/Nceosgg54wzC
         EO7yk2lGqWxHoybEEQwFRNJS0imxgGvbeNPx3dE6ZO9wqduWL3Uo8qcXn6NEqIRhJZbs
         dgh4iwbZUcxdTUz6/7cX/9heDUu09ySv9ZKWjrDmP3NaccKlXoHJRmAzfQjGIA5Y/9a4
         rTABrgSwlUBG6hN6AYThDt9nKhq1YO/r60mtiqPhRhIDJX7sSIKnq2UcZRwHfT4xZmGJ
         Q+yZ339A8RLUDacWD3cqX41qNeR5hmM5WJ0KoxDSs59ENv+1GOey9YZqaFZPoKRePeYk
         Dqdg==
X-Gm-Message-State: AO0yUKWKwcWVYaxzUwwkNZBSgso/17byy8O/VCbwcJGqa1AIX+EJ6S7X
	1RXvJhXCzYs/MrTUndlaFnxY3A==
X-Google-Smtp-Source: AK7set+4ln0bAKYwNgoY25DxxnEGxsM2e8kkFPWgYYSDouGuwrBrJINrymy3FaBtdnt5yOLCF66RaA==
X-Received: by 2002:a05:6a20:1590:b0:bd:7ee9:e77c with SMTP id h16-20020a056a20159000b000bd7ee9e77cmr20145173pzj.48.1675559731634;
        Sat, 04 Feb 2023 17:15:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
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
Subject: [PATCH v5 10/14] RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
Date: Sat,  4 Feb 2023 17:15:11 -0800
Message-Id: <20230205011515.1284674-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_011501_675753_C0C8030E 
X-CRM114-Status: UNSURE (   9.97  )
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
bit in hcounteren.

However, instret and cycle access for guest user space can be enabled
upon explicit request (via ONE REG) or on first trap from VU mode
to maintain ABI requirement in the future. This patch doesn't support
that as ONE REG interface is not settled yet.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 58c5489..c5d400f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -49,7 +49,8 @@ int kvm_arch_hardware_enable(void)
 	hideleg |= (1UL << IRQ_VS_EXT);
 	csr_write(CSR_HIDELEG, hideleg);
 
-	csr_write(CSR_HCOUNTEREN, -1UL);
+	/* VS should access only the time counter directly. Everything else should trap */
+	csr_write(CSR_HCOUNTEREN, 0x02);
 
 	csr_write(CSR_HVIP, 0);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
