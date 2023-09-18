Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDC3C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 18:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3KIvHsK1L36tJNQPtk7COftyloJU58eVUR3WLHzM8c=; b=4yPlm3x3nO4JI1
	kDFFIfpeOAluZil2kPeOsYjQbgFI3ka5TDruY1Ryjwl6uFCEi3qjiCDkTrw0gHBwsrN3rA6OYM9I7
	bzomu2dpicddGAfsimn43oZkuXxKYVCjG1Rj3OnOCSn0qPf/rwgFJ/Gckq+/rgVCYxFX/gc9ZE4yJ
	uO1UKDDTB0JSAwmiu/dPfPbBkSsY3H9+AtaGXfLRetaM9Xh/NH2/5E39NuJhQmK7EcyXxGEqYHjjc
	phRpLI747JVqp8832gd/+kXbIaDnMNoZ2pvUsXW/DVIqQrYowZCU4pB6lBuEa+XQXpczxhqpxFbim
	Xjr5l3Ej28M/R7QUF35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeI-00G2Tb-0e;
	Mon, 18 Sep 2023 18:07:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeF-00G2S4-0d
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 18:07:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c337aeefbdso45169865ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 11:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695060421; x=1695665221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/FxLJCDRi2+AhF6FOTSx+aBMLtSpJjy7MQNwR3R94og=;
        b=MDY8rMMyQjakMx7zA4+KhKQZbta5fOiA5Y7fi4C8+74yx83+LuFdXiwm5g/Z1eRZOY
         J1C9tOUnpUpJxz9OKOXGrcB0tr31hmfvKdTriALpm5H2rGa1lZrg8zghn/vyksQKTLVX
         7D6TUhQKL8KeNI/j8yDpfy3p7GpRn9oHwPSSDknHvlhp8Xewd2Fw+hGXBqemkCRLwdHz
         Bfcqf6NTb4t/ubSE7ZbkLj6vBaoQri0COR1W2oiENSzZemcHRmIeW/jbn7IqW+urBzt1
         FZ6dVRckKY8IdWxEDWekDnsU8N64Y6G/oGMmIT+exXqF+UNMU0nSvYOGSNwOdUrK47Zi
         3bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060421; x=1695665221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FxLJCDRi2+AhF6FOTSx+aBMLtSpJjy7MQNwR3R94og=;
        b=u6KoV+lZ7BhRcRcqJmm3VShk3sNRuSIhVGNrXOAtzaUYbUwUGM/WJeHcBPMlx4R/tw
         z3vAwfOVynEuj2RaJV4XVHBXRQORoLD7X7/j7UweU1XtNmvrOExzzYBh+yLTqoBgqKSv
         028sNCM3U1I4LowKUeioKmwi/8oSBzvAI5593mU+ilGl8EEl9FUz+5hTLngOGc7sCtvd
         DY2L4IFx36H6QinGqWomN4spvgokaZJLTJI8gQJ22j/J3oMJxcsu0EnRfsEaEbIPeos4
         xCR9Zo0OA9CD0plSZ7RKAu1hx2Qxp9cywYBT0VE38M6IJIwFr3JG3g7gJUGEzZ8sbtoP
         d0dQ==
X-Gm-Message-State: AOJu0YwPizjKCy0xGj8snIMF2yq2ZFRmseOssRpoCB4TDKQ6LcKv0HlJ
	10DdID5mykgwLPfsP5BS+MwU9w==
X-Google-Smtp-Source: AGHT+IFDMbQdNhGOLSD6ilndqDb8cXhJ+CzNk5FP+g+eBNqALQDifdWhN3LJ8Nfabjtn2qCQLRxJug==
X-Received: by 2002:a17:903:1247:b0:1c1:ecff:a637 with SMTP id u7-20020a170903124700b001c1ecffa637mr11725339plh.15.1695060421024;
        Mon, 18 Sep 2023 11:07:01 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001aaf2e8b1eesm8556720plt.248.2023.09.18.11.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:07:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/4] RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
Date: Mon, 18 Sep 2023 23:36:43 +0530
Message-Id: <20230918180646.1398384-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230918180646.1398384-1-apatel@ventanamicro.com>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_110703_258390_EBFC14A7 
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

The ISA_EXT registers to enabled/disable ISA extensions for VCPU
are always available when underlying host has the corresponding
ISA extension. The copy_isa_ext_reg_indices() called by the
KVM_GET_REG_LIST API does not align with this expectation so
let's fix it.

Fixes: 031f9efafc08 ("KVM: riscv: Add KVM_GET_REG_LIST API support")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1b7e9fa265cb..e7e833ced91b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -842,7 +842,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
 		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
 
 		isa_ext = kvm_isa_ext_arr[i];
-		if (!__riscv_isa_extension_available(vcpu->arch.isa, isa_ext))
+		if (!__riscv_isa_extension_available(NULL, isa_ext))
 			continue;
 
 		if (uindices) {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
