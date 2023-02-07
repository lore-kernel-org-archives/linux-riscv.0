Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFADC636D6
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 11:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtvdizyOgUpRm/ojlPjTHGmd+OZfeIpGlU/k4JhINBY=; b=2WUhQ4pIie/xYo
	FToj15VQZVpPFC0v9PX41JV811R3CxcBfU2pKLDb5TyEIpem/YErXB3iS/e9w698WSOzE+SpNW5Js
	FOVGF22+InLD50tC4wee3aw31lhYLPjAYz0PH0SX+yBLwcdtg9XwcytRpUh5uqbex3dj5UpPp+y0i
	YUeZ0xeWEc8Q+/0s3ZBjkk+Quj75SYWICfqxf6L7gM4so/SeRs2MHJq/1AlZbgefy+r4B3qtOYS1f
	Si24lasHE5vrR3Bae9IhA/LfculWj0z8W9s2mKpO1PhqsDZ2Ef5U/bCmFJZ9syfCKDUnH+UEY5h2y
	w8E0Dc50M74ic0XKF7zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLiB-00BqXX-Sk; Tue, 07 Feb 2023 11:00:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPKiG-00BbLO-7e
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 09:56:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id i2so1697301ple.13
        for <linux-riscv@lists.infradead.org>; Tue, 07 Feb 2023 01:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3Hr20eyCmr1XHvNCY+x9mO1pacGqN3TdQd+bzW/k8M=;
        b=4HEe0hzldZYwed5Z8Cp2++a5PJtmn28f8PTxEBZtcLZlF8EZm170x+BYoMl26u3x5T
         TRKm4iw2gy0MRLw6KZq/QzFP+V9r0l3hY4NGP5/PiII1Ol1HyHOOqjSWKLRHGo8ywXFb
         FvjnfuaC/OjtogkNOItzaP6cyDqZG/+6ugri5f74tfAJ/jfTwl4FEbfz4rCTwAv3uwDU
         lvTK/D9mtthTxn+aicm5Xw4+b3rtrifXhYBMCGHpEgMbxzSCTP7nM4Pq9N7GxMgiLOyC
         53mUzm4iUP5qMNNC8rqchdmoVr6Ligi6Fa3/nC6Cq6Igfk11s1aHMv32+2c9BBhyBNt/
         Kcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3Hr20eyCmr1XHvNCY+x9mO1pacGqN3TdQd+bzW/k8M=;
        b=fGBu0xXn7PhbY3w90CNrE8g/BFNyzj+d4aErra1I/99JzYqqBwH1k3wELr8spjb38O
         wy9sqgbK0hhWZCJB1yeFnDtnj03jcg9Uoe0mroEFYRUa0UZBuu50iL/InWVBycs7tXLF
         h2FbxFAPNgg+MAdzS7hprvBQl6rFikyetEMf9eyyvT3ZYBpCVEP1XmU0TXhctZ9BEmoK
         TWlFjzQzq8WkDvbmLlFy3iyyOmTbOwbZwqsyDZbdeAnYMv56LK8gsn9/a9zrfMFR4eSJ
         5iozRjnCjJwNtJ2uOp8gJyreBSY6X5iid8yNRGMaoxRJ5eclCH8jYm6Ot2gzthaPHkbe
         hFWQ==
X-Gm-Message-State: AO0yUKX4+hqD1N+fbFbP9vDi82IZQqYxwhNuM9695YiY9D1gmzQwT8aN
	E2rAwHgpJNjg6beGfPEFIAVgVA==
X-Google-Smtp-Source: AK7set8QQLOwrqLTTA0LlDm/5ideQ9RT0pkFR/RF033vPbcn2NcFmH2jpV7biDMrXUHPtAQvFVZnzw==
X-Received: by 2002:a17:903:2444:b0:189:5ef4:6ae9 with SMTP id l4-20020a170903244400b001895ef46ae9mr2840251pls.45.1675763790800;
        Tue, 07 Feb 2023 01:56:30 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a1709027b8800b0019602b2c00csm4030598pll.175.2023.02.07.01.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 01:56:30 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v6 3/8] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
Date: Tue,  7 Feb 2023 01:55:24 -0800
Message-Id: <20230207095529.1787260-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207095529.1787260-1-atishp@rivosinc.com>
References: <20230207095529.1787260-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_015632_278764_C182B46F 
X-CRM114-Status: GOOD (  10.58  )
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

The privilege mode filtering feature must be available in the host so
that the host can inhibit the counters while the execution is in HS mode.
Otherwise, the guests may have access to critical guest information.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e79721b..6c1f073 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -79,6 +79,14 @@ void kvm_riscv_vcpu_pmu_init(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *kvpmu = vcpu_to_pmu(vcpu);
 	struct kvm_pmc *pmc;
 
+	/*
+	 * PMU functionality should be only available to guests if privilege mode
+	 * filtering is available in the host. Otherwise, guest will always count
+	 * events while the execution is in hypervisor mode.
+	 */
+	if (!riscv_isa_extension_available(NULL, SSCOFPMF))
+		return;
+
 	ret = riscv_pmu_get_hpm_info(&hpm_width, &num_hw_ctrs);
 	if (ret < 0 || !hpm_width || !num_hw_ctrs)
 		return;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
