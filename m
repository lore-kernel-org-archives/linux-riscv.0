Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1C7C05027
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 00:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZX3MsT5SNchcfx5INoK39BxdgdTzgj0tsd+jOcango=; b=Uln+enGp9K7eMq
	3q/Wj/h7UO/L7OckdOoaOzWJaGYNkYDS2VWqXzIQG+IbP+ytuVWZuesr8UoqC25zyuu4CV2mqrW4M
	rao/kYZqJm/DlO5O2RToQGJm+3IzK0MIWLPDecCAAY0PPdIw3Jh9uOLs7KIb+ISZ+XGnNj1UxQe9E
	V4lQ4rpRn/7kIDHFwYGSLcFCKmZAu0tXU9g12LssmGWbP8mM8BMZtZRSZcpejr+KP+fMcvY+Bsx4G
	AGQPTnz9gFPYMgO4dpJ5xsvcJgJ8ALni3LmcVfmSc+ZG98A1abKVHj906LL1nG2fN6JEDpiOAYEal
	ZSSrwvL10cG3SR/jxtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3y-00Dv27-7G; Thu, 02 Feb 2023 00:02:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNN3x-00Dv0C-2A
	for linux-riscv@bombadil.infradead.org; Thu, 02 Feb 2023 00:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=; b=BnIs8fS6a+8r/Cd0MkiL0n25EO
	N70z8olxI9h7A5JP/56mbJxemuI69pswyF8qAjwxXYHlF/lKNU5kcTbJKT/iqCEUaH4sFh6lmMSbp
	IeK/FQ2M94uka/VSwo/ZukhfJzdbOMa35oeXagcjQmsgpaAPwb/jaQxmvihl6sdrH418xaza74CAg
	m009Vpazd3LifqFzqfVUk1odEad8nAqS0LRghErQTJkCLTq2uFgIP/Yb85o/tzWP6J0G84PqMnSvZ
	CvUYEPIkPqqj+4eoWaDhMqY3UYqt6I2WvsGqGEMY6JKoH6YDGu1iSRA+RuGiGV10QyzuGoW7tu64C
	uQJxKLXQ==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pNMHL-004win-2O
	for linux-riscv@lists.infradead.org;
	Wed, 01 Feb 2023 23:12:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id m2so93607plg.4
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 15:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=7TLtW5CODtHh/vA5HmpEZpfnI1B260cDfOCTny43n9BCs4bcIQY0ohtJ9r6Z1d0zLR
         AQ1Ps33WkBnV/jcy+F5QHHDHW1bfTgc5n/mqBkPxDw/KFLCJpKOpOWy1yR5xeMxKBZNb
         i9ugyDG4WX7NjSgEu59zFlhnxmlR4cKgvFxvDYO9PLW3jsP9W9n4Y5C/kIv8XuzrJ8cd
         t92JgC6M6ckmnZ6t6VcmUvuJP/VRlRD6rlSM47oLUVWXRomoU14CQzntUjr8ITq12qCi
         tf1s6m5oRb4AgiIiT+4SpO00ITFwO3udgoHBoLpkRLfRgJT0Hmg8oKTEkttrshPneMXN
         /sCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bBrWzpq7M02ECVIO9gyLMkgsYGf96qlJ2xLFArrFiw=;
        b=HJeHldigeJ3xBISekCrAsqBrUv0rVXaIXGacA5nlY8I85m0CMypJZ1485lLDSAE/3q
         XpR2RSureZL/zU8lgA8D5p9SwTL7oE5nnOOm/uPCxHio8x/fCTfrx+jaf23H+RYsKTav
         hFr87xwgR8+3vxxPUw8nVcFYmMMVAUPjhoBRSqithwZKiqbp1ylrZqBisCCexNsZHNXO
         yIYtapiEzZeK6rzv2JLJdGiCBtONeydtBVRZkObbXhHkMZ7jA48m6wBXGmVSZ1AVnMIm
         ddk3wGjJpVwJwmAHWTJcc6+5Fz7WHKGtmdw4FsGZMbW5BA0yxHFwYlnZ4r3YIkQlLBT6
         7OrQ==
X-Gm-Message-State: AO0yUKW9QW5KXl7Tmk1B0sFX1MbBWA1lSZs5AEFNDu2xCf7WsLjzfP3T
	960Pk8pWtyK0mx0ugPqoglB5Vw==
X-Google-Smtp-Source: AK7set9BcpmyXgQko2MEIaMm4BP0/xEocNmPG21oITCLGZTFp/ad13WuJnsyVzCwkS+ZTGiGLRLXwA==
X-Received: by 2002:a17:90b:4a50:b0:22c:891f:5753 with SMTP id lb16-20020a17090b4a5000b0022c891f5753mr4169223pjb.40.1675293182071;
        Wed, 01 Feb 2023 15:13:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id t3-20020a17090a510300b0022bf0b0e1b7sm1861774pjh.10.2023.02.01.15.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 15:13:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Eric Lin <eric.lin@sifive.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 10/14] RISC-V: KVM: Disable all hpmcounter access for VS/VU mode
Date: Wed,  1 Feb 2023 15:12:46 -0800
Message-Id: <20230201231250.3806412-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201231250.3806412-1-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_231236_019622_38160EEC 
X-CRM114-Status: GOOD (  10.82  )
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
