Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249DEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vG7/0OHsENtjvSSmLK9PmuZgesScigNkZn2xzA+t1qY=; b=aFR88e6qnQQ6Va
	uvwprVxjMQqtS3p3HVQDabXFp483smUdESl1/tOUkWZ7kgf48WaIVP3PuGL3GgY9TQ7LODygAMWO/
	odqVR1Mzq7YL5UskvjbbQ7ptUsD3G33Ni5DXrTi+KbYdaP3VK5Zal2E4x7ZL3wUiUaarM84YLYYbj
	n/SCzOWEXIN5FNtkF/GQWTIaQMQYzdArAgLGpHNGRvpfvc9MsRfxqxOUs3upru9MXgzYRyrPsCTZE
	lR+DqohXfLIWPxVAJyV4heJjMlw/u+NiSXVVd49Y4Sktmbtfr2n7zM9wIiyCWXLA8pfU6ci4AjT9r
	K46B7XJ3xcPCJeMKnXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmf-002jCN-RX; Mon, 28 Nov 2022 16:15:05 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmZ-002iuF-SF
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:15:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ns17so3162813pjb.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hv1OFha79GkiviE0uDMGNS7exO8nWxI6HdONFPzodJA=;
        b=lqSNnSKbWlZ374V5w1PVkdsGEI3ifekQqCTHz1J8U2HZjC+qA2twMy4VL0AEBUMCZq
         YlVw/udi8rz6lWI6K5sg5aKFW4rmOunzSL+MhQFVRuwhVeQzSAhebIAU14uB4oVjvCqq
         D8KstXofbeugtPgqSLS1GOjivEnhF0SXoDoEXhZm6ka44+q9OOxiuFEh3aInV5zPuw/W
         DBhuvqTxSIIcygMAKPvxVkBC2KcF9udOi+NUfmXJZY0RgndFe+I3sBv2esLSSM0n3ERr
         w8WAggDnqRUs4gOPYWhALfXR6aReh98SeHWE3VFdVmOIUCvnVbRhjDcUn479ZGbIAbz9
         Tm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hv1OFha79GkiviE0uDMGNS7exO8nWxI6HdONFPzodJA=;
        b=A2z+zrGPKZHYJaRlM4ElhIBa9Ev+O+lTqvLCcVLLPoIFVJ+tiIYrwql91P4+IQcwdi
         /X01PLqLsJ76ZmzugwStCUYjjyinQEQjPrRv7nPNvSsE0BNZd/pPfuhNphYiJ8c/6iut
         DT+9UD7lxp/Htl6J3GiXQuYFwXXwTg6HqikKD3kB8RCqcy7Ja+gsRRbiGuG2S3k8YdSO
         5+NGdKnmB9o7OHHFVDJ+WqkFNzP2yJgC6Z4f0U9yKthoIqyptZmg96UZbSPW8QaZeYG6
         W/xYhAShNhvyXgzwi5ozug6wUsFxe3DKvtOMKBwEGSIrpXDJGTssl+bIu+X8LqtTVDA1
         2WkA==
X-Gm-Message-State: ANoB5pmmJ0TDUw3Cd7MTQIZdeQVolhnsCQ4RIlAS/0T9aSILR4EqKrqd
	qXGP0nc1NMMGOC+nrxNnZnjowg==
X-Google-Smtp-Source: AA0mqf6XVMcPFzw8jclMeBq51f+TGiw5TkI7SlXYuc+xtAmSnBI3XLt+ndtlCp6fYKA2CDEFePuEjg==
X-Received: by 2002:a17:902:d893:b0:188:542a:68d8 with SMTP id b19-20020a170902d89300b00188542a68d8mr34593125plz.126.1669652099425;
        Mon, 28 Nov 2022 08:14:59 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:59 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
Date: Mon, 28 Nov 2022 21:44:21 +0530
Message-Id: <20221128161424.608889-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081459_945469_D16BFAAB 
X-CRM114-Status: UNSURE (   7.54  )
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

The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
can be used by KVM module so let us export these functions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kernel/sbi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..5c87db8fdff2 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
 
 long sbi_get_marchid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_marchid);
 
 long sbi_get_mimpid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
 static void sbi_send_cpumask_ipi(const struct cpumask *target)
 {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
