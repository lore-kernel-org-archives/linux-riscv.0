Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C30C636CC
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Feb 2023 02:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCjqmU/oKAZjfE/FazwabLALzSxDYRHCQZnrvucHfb4=; b=WQJbJFAf/t+2vu
	AZVJyynDcKeVdTY0X/4iJpIy7DHFKU/xMFQyRvDSk54Ovms3Na3JC0/QFcnEj5ZRYXWdA5lwRqnAb
	7ruIwmz5Nf7FfX4rfCFwietpxm+FM6IZ88ga/1IxZh9GY3sLIko4MCFg3CjJPt9/EkZJsmLXXNIlb
	gwxRNFax79awvLFkKf7ryStEBgW0nq5kPbXZFfb+1soJEcFhyYZreq1YqUTClHthYNWP4JgarJPtA
	GeUHW0LU9To0iqJ1uwAgGycg2pL4ixuNSGMW2gh80mnGU2X2bruvHAH/q4nWilWeGPFF9FDiG2135
	4vgir3pI+mbpXXuZCicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUMj-005qE3-4B; Sun, 05 Feb 2023 02:02:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOUMe-005qCK-04
	for linux-riscv@bombadil.infradead.org; Sun, 05 Feb 2023 02:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0AVlyEHbyyemXbCCJ04JjX0BL6y1QGd5zwSvkdXtPJQ=; b=oWXrZok4REf4ps0ZA4V9WMe6Of
	5lUxJL1ZNjlPtshVq8shTLf+wo6dHVOgu2aqDEeu6eqtoPstnbtns7aqGJokOytXGKXCX8seaauwp
	PnTtH1irvbSaoB5uA425noxnHUxfVE0M0C62k12wdk7ndvSwXJwb/9Ia26CpfqYyW2QCzry+OL0es
	3QNw4PUOVKBASrrLiV6Tjc0I4v3mn8u80djnxQD1IMyFnxlJmYUlmLJnFcBkOo6OEsYyoQLXniKqP
	pwgfxzwX7+DVfe2pH3RQThewbYYgcyl5h/TG22b7vkB3TJlkAeI7fm+pMzgVqm8pVnNHEp5Nm01BV
	J4hR6drQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pOTcR-0063Wl-1T
	for linux-riscv@lists.infradead.org;
	Sun, 05 Feb 2023 01:15:02 +0000
Received: by mail-pj1-x1030.google.com with SMTP id o16-20020a17090ad25000b00230759a8c06so5282036pjw.2
        for <linux-riscv@lists.infradead.org>; Sat, 04 Feb 2023 17:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AVlyEHbyyemXbCCJ04JjX0BL6y1QGd5zwSvkdXtPJQ=;
        b=FgqKEoOoZgRolw5POmyvUXh/mijLkxb5w8TApP3igblrnHfvRSgyoplkkkftOHr4Rq
         l7Zg++CBz0jZhffhS0C6w+LPoH3o54NahnXJHB2o0PXKKtnYf9RY6umvZHARXD3dszmo
         5ThlZqjAJpvWGBusFG/ESsmLdhTmMu377wyF8Z1rS2wc8LTEpR7Ut935sHHvInN9SVRP
         OA6JnM9xlFdZjpmfmc6MuqvTqlkZYEdioFKf6asTNfBsIEqUQv0pG4C7TsLPiQfL9lsg
         DaQCYRik/B40basr6055LhqqFRJWEPksw9vSIsQUvjhWfqlcWh7f1ia3s8VOT+ujs6ek
         RKBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AVlyEHbyyemXbCCJ04JjX0BL6y1QGd5zwSvkdXtPJQ=;
        b=Rq2/uPIo5e5X5pTHohL/bZmkjNxtpyaZltePsAnSZEIh/6VvUiZ/IC3bYAhOOiD8yR
         KTEeaUcMSY2Nlhv2kVcaUd8sYU1AikxlPpj8b6B877+LXyCm5ufA7QR1e/vv+hURPl+0
         JPKZiyo7YPd2ZD40enC2ZiXTyA4iPajpHyg4frXGdNwPCVIJmV5EICV2dZ7QNyIEN7P+
         2SoignOhIyTq94dMgXquEBG3lv5F/ZzmlKxIjrh3yMCDtdQuP4ARyZAcNLABlAazP1UC
         7pz/4QeuyVcoHrKhVVBnxC6r0bseduGNBENvR9RREDcpe7isUpsHCu0WsQM8C1Nekla6
         MoJw==
X-Gm-Message-State: AO0yUKX0byIzrqreXAZVCQa5Ysmix7e6P/UuBNHA7chvEBYiu7QQhDMG
	aGcoZDZe52RbbbiIOYzPzZoedA==
X-Google-Smtp-Source: AK7set/oi9xtk3D0Eq1rYz/SuC2Pba9Hx3SWd9xHCM5mD1XcAcOr4gEozd/X8WGb0NofSI+eOtU1NA==
X-Received: by 2002:a17:90b:1bc6:b0:22b:e75f:8502 with SMTP id oa6-20020a17090b1bc600b0022be75f8502mr8558170pjb.9.1675559730788;
        Sat, 04 Feb 2023 17:15:30 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id c7-20020a17090a020700b0023080c4c3bcsm2721917pjc.31.2023.02.04.17.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 17:15:30 -0800 (PST)
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
Subject: [PATCH v5 09/14] RISC-V: KVM: Make PMU functionality depend on Sscofpmf
Date: Sat,  4 Feb 2023 17:15:10 -0800
Message-Id: <20230205011515.1284674-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205011515.1284674-1-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_011500_470761_7C76563D 
X-CRM114-Status: GOOD (  10.51  )
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
index 4919255..6d09a6f 100644
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
