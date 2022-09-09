Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76456ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 14:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLb9Osu24NPALPVC8frY+JtDiAVC38BqVDYo64lZWOk=; b=MzoNczysrkTWPG
	4Mhtck0fBnKid7Z5hYPrsSTcgh9adoCKk8XDlByaUWD76sVMg9D+pLhja6SJ0SJlaxkZGl2vtcLeL
	8pVHCXAAidIOTB4tVYDoppD06jPLN2LDigyZKZGJln63LNfp2tnpeNR9ARM36V1JyJ8gWbTtW81FP
	VTLoBzDxrL+8C7yOpjRHRZgxVvbOrDYMI1IgTKqJ2S9xZaLYub+2gRMm+EwniuRrocAUg5xodyolX
	lP/vYIMHdG4qPi5+PRq4FADPCjwVpjEtIY7GMv5YVLjDRtHCLKqsLsRcUKjUpuYlTEpK/Zpgja3t5
	8EKQxiNdbk5oApuGmAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEs-00GpDm-St; Fri, 09 Sep 2022 14:44:14 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWfEm-00Gp91-Ca
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 14:44:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s11so2815889edd.13
        for <linux-riscv@lists.infradead.org>; Fri, 09 Sep 2022 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Z3v1IFYkIQaA5ywngTNvXeXiHw1zctL1Mw7co2KzhU4=;
        b=Bu0bRI4vIlfpNws0weMP56sUR3RRXNF5LNvKBdTGM+2zEzrwQXqcEiaTCjFq0qR8zL
         g0mFgYeHtv97Ks2tJ8aBONt8TR/II2b7o4Xvh3kliTGrDW+SGa876CzZ97kNa8aXrhB0
         GeMWErM/4PeLZRaKYKG97ZgaKm2mEzWPuGxI4irSsI1SW2mZK21CuCFM9pZA+8f2DeTi
         2mXDYkk78dpyNpOtC81WKKwn+FrUdtpxhKeHsQxOqn06nkQS8pNo2sH1Zecpb3bU+IC6
         7VXMTZ8yeEcZ9+kGnEJIwnRcwE9Gk/QXQoxCFq/GOwPJtDazl7Lffhc9ptO9cnnby+sA
         8qug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z3v1IFYkIQaA5ywngTNvXeXiHw1zctL1Mw7co2KzhU4=;
        b=7aswp0x5hfnh9aYB4q8iGCwGjlWvSlruIkTwrCW9bPfoyXnplqb2R4FMYd40WCVhdU
         rJAAmrelJfbBAtcabjtgxbOrAE8UEjesCPekM5CTvFp3JRfCaYgkjpgNtyFt4U7X5fz+
         bsYiYxaPugWNStXfvzqmVy9MArjiJFHEADycBkNfdxBd18hgRQStQdpRvs1lKEsFzJ0J
         0f2kkfgCQQr4XzuhsL7wh4LUymiJRthAxTGPgnk5zW0QXSgOvH1yR75Mqsq5ERWmnzcG
         CI4qdPDCrKBWmT6w8hntuUuA15T10HQG7QuvXN1wW7VZ7TTy/rSTx3d81+qIstHdARID
         Lnsg==
X-Gm-Message-State: ACgBeo3at8bW/alf6VWPdCLHqkFFbjzeoveCYF1oOPvtDsJrD1dFBk/g
	nUVO2jv+ES3MF//csrhJebNp1A==
X-Google-Smtp-Source: AA6agR4Ca5E0VLco+FeqD8ftbe5ovmyMpaxXzVP1ZR1sMfAsva29qzl0MUXSbpseWteMexIzRHoEdg==
X-Received: by 2002:a05:6402:184f:b0:44e:7c1d:9b10 with SMTP id v15-20020a056402184f00b0044e7c1d9b10mr748496edy.97.1662734644887;
        Fri, 09 Sep 2022 07:44:04 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id u18-20020a1709061db200b0077077c62cadsm385648ejh.31.2022.09.09.07.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 07:44:04 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 2/2] RISC-V: KVM: Expose Zicbom to the guest
Date: Fri,  9 Sep 2022 16:44:00 +0200
Message-Id: <20220909144400.1114485-3-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220909144400.1114485-1-ajones@ventanamicro.com>
References: <20220909144400.1114485-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_074408_432623_2CA40CD1 
X-CRM114-Status: GOOD (  11.45  )
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

Guests may use the cbo.inval,clean,flush instructions when the
CPU has the Zicbom extension and the hypervisor sets henvcfg.CBIE
(for cbo.inval) and henvcfg.CBCFE (for cbo.clean,flush).

Add Zicbom support for KVM guests which may be enabled and
disabled from KVM userspace using the ISA extension ONE_REG API.

Also opportunistically switch the other isa extension checks in
kvm_riscv_vcpu_update_config() to riscv_isa_extension_available().

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b9a4cf36be4b..ed37a4a6e5cf 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_M,
 	KVM_RISCV_ISA_EXT_SVPBMT,
 	KVM_RISCV_ISA_EXT_SSTC,
+	KVM_RISCV_ISA_EXT_ZICBOM,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 2ef33d5d94d1..74d1532b26c0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_ZICBOM,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -792,11 +793,15 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 {
 	u64 henvcfg = 0;
 
-	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SVPBMT))
+	if (riscv_isa_extension_available(isa, SVPBMT))
 		henvcfg |= ENVCFG_PBMTE;
 
-	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
+	if (riscv_isa_extension_available(isa, SSTC))
 		henvcfg |= ENVCFG_STCE;
+
+	if (riscv_isa_extension_available(isa, ZICBOM))
+		henvcfg |= (ENVCFG_CBIE | ENVCFG_CBCFE);
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
