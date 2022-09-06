Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D9ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 08:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1RImhohm1UwW1Tqei9Zv94Dte2SsGS2w8gvtXYPNxcM=; b=LgfGsMi70tMiaB
	ZvQ8CTTAEHaIIHqQ6kP7cFtaesr4CD5ntvz9gk+1HngDNoYnSMjtI6Eu1ieoG0PdFuk+8MDJkAxMa
	+TFHKwa4YGdCEiJiXHU667SRcwup1RAN+vwon4lPAXBzqKCTlNYmMQPNT6F1lvf/ntUsGLovCiApY
	OgU4nEi58AsRXLKarUsl4Y5X0j8w74cEqAaVyY65p7AjfuO4NoneCdgms4urj0zTxBDhEu7DXSnmB
	Qv7JM8I0hhCayuxjarwcvEfoGzyJxpwVKosH16AlCLYsP1u8FrINgWJmOdEQ/51WhNIDrLQEC8joR
	yA90028ihWf9DiGeu69A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4N-00BJba-Tl; Tue, 06 Sep 2022 08:36:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU3w-00BJIy-9H
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 08:36:11 +0000
Received: by mail-ej1-x62d.google.com with SMTP id gb36so21466893ejc.10
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=K0PbgrG3aEce+RNqVBrfv7es9LlST45m+grejWUOs6U=;
        b=PrdqU1cZ1HghRZTDIYbB2OHdFouvReQtmKEIIazTE3+bG71IPDaNeFTWG7kJDT8okv
         UHpsi21w+Wc0w45fd/rn6BWvs0zt06svSFmaY0xBuT1+HcGZAHz6gwh/e8DC9+xeA2xr
         kjZaJ/fjQloNMOp+7drn9N2WDKyP57UM3ifzUlf7LjWYBezkSn8pekDYLP6erGXX7eFp
         6wzoQXaYts0o76dLNMh+gJCz4ve1gT4cjZU3Duk+LBSAZZZNrzeAk9lVeOohytH5AFoK
         eXC4uJ9rklwhBKJVVDYq8CEEXIGIhRUVuaJSQMImd92uh+JwNf27xnk7XGznYYvJd2fE
         xMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=K0PbgrG3aEce+RNqVBrfv7es9LlST45m+grejWUOs6U=;
        b=ZjCDkaqtEtSrqlT1TatmznKsUcfqUCNvjzLED/CL30fQDmgdPuUO03ebuntSXKX6f1
         z9bn5lQxzhDdFWwxrfxSDYHyudnqw2raINjtECJdZByrmlHPMYBM0KUrCd+oka8lHjae
         M4Em0vono4V56Xrl5ZsGu2IWb6oyWQ+kjitXxYF0ptxUw982Rw4V+ZBUgQ4o0lOgNuaZ
         nIjna64tQDj4syCBzjfz09v6BopXx3pCLyxGBOUMbjhhKqstHljykc5ZB0ZJqv2+RYhU
         /ieGTyPNgxeWGZ+PNQnFSbiydyDtM0uPTQ+KjSHW5Ms9IzYli+sFzEo9lRi9Pu7gwZu8
         viMA==
X-Gm-Message-State: ACgBeo0PsjTBu5F/WXUU8emCWZYcc6sDzPI6orkDvGANpzCHxiAhXURs
	oZ+CBb981WBfJ0Ok5BHle5I8wg==
X-Google-Smtp-Source: AA6agR7nYfbY1GSdXqsuaL4WdMWDHUT+LNz7bU3OEKAjDKWlYckD1nCZThji/A1t+vSGTW4t23asjA==
X-Received: by 2002:a17:906:da85:b0:741:40a7:d08d with SMTP id xh5-20020a170906da8500b0074140a7d08dmr35183008ejb.263.1662453361294;
        Tue, 06 Sep 2022 01:36:01 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id d14-20020a05640208ce00b004482dd03fe8sm1734062edz.91.2022.09.06.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:36:00 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Subject: [PATCH 3/3] RISC-V: KVM: Expose Zicbom to the guest
Date: Tue,  6 Sep 2022 10:35:55 +0200
Message-Id: <20220906083555.931806-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013609_722089_ACB1786E 
X-CRM114-Status: GOOD (  10.40  )
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

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 5 +++++
 2 files changed, 6 insertions(+)

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
index 3f36e79876e7..3ce4f1c11b4c 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	RISCV_ISA_EXT_m,
 	RISCV_ISA_EXT_SVPBMT,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_ZICBOM,
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -795,6 +796,10 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 
 	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_SSTC))
 		henvcfg |= ENVCFG_STCE;
+
+	if (__riscv_isa_extension_available(isa, RISCV_ISA_EXT_ZICBOM))
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
