Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52415C4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW0WAkpttLj84IJF0CLAlkYedpMcilU6X71/dACSn6w=; b=HpNWJev8fGlXQK
	lJEUpNpDS6AR/+dL+9XAKnB+4AKLKW5X4KRX4dLoSzFG5/lH3IIHkocUMu0jp+oXIuL7BPl2ag+i0
	JHwh3anyk81uGM4xsVo2dJvEhv04tdHzbnV4gf1fwRPpBlmtKFXl483Yz0J7uJEjmLaZa1ijw8hg0
	EdqOAd1ehHY2NCqyJ6QInI8yzfBsb9GCuhzzUCoplh4uvj1zMjSsz29MKmC5UysWAyELa2Ar5bvYo
	shgCjiobYTAdcaoh89v47GZC8wAWDciVFiSek1CS3vsbsm1rNRruO/cfCijdlnloc0pKLfhNnSnaZ
	4tmWPRvFKrlw6nSH5snw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKkK-001byg-1b;
	Fri, 29 Dec 2023 21:50:24 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk6-001blv-2v
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:12 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6dc025dd9a9so2085303a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886609; x=1704491409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fyVFitalYEi2ik2oU3cHAgTTSiVjR9gn+8uYrWaU68=;
        b=H42S+hhHQSd7HKzagWM47ly6IXb6a4DptHICaKjrFWAVkg/9VmW8vxnqsHTEozHZBF
         TZ2BpTLDYA6SNsSv85BSVNTnpNGiIHbpLfyIbXacp+yIWqLg5VRBGUVl0mCwy1dKNJfe
         YpTVZDIMszvXMhsbjeCwTimnHYBqe7QjkIIk0t61VBMZdZ/bkVa+T+VNaaVYPfsQ6Zqq
         aWYuROEUBVL1cJBey4YLfuHeRQNb0c4J0tPc49Pq1BaPBKts6QuFc7ExfQQXt23vVcir
         YcfVecFpnSJA6NzNPN6PcKx8LGedDxctJ3wvzbWl1MOArWyN5BdNUQ+q5udMGve9Fnbj
         wclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886609; x=1704491409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fyVFitalYEi2ik2oU3cHAgTTSiVjR9gn+8uYrWaU68=;
        b=Q3xAzDlPOSl30NSSkbZixnqMfItxv1ldS0131id7lYXF35etu/ZiNo9KnbjxuM/n1/
         Gzb2tMLqEbsltpFpa3gqqj4qadau+hyrjbMFVfiCZv1YP71UZp0SM0mc7b5GaFX0mru9
         T/MjyFWK2cuIYxgZX7oviWXy7jIJYOy3s7O4IgdeVZeI9TlKPEuffJRuyJf5anD7jcpW
         YGDF5U5yXZuBxeAcvWfSt6x7jjG9DBfWuRa4jhVm+sq/udKnIFviTrO0JSb5DaXqpq1s
         cINTnSzuId/v5GfkZ4sAZ3zmyBMVrequyFPM/v664KIFRP1vW/XSQLyBRDDjOXWCSZjV
         Mb9g==
X-Gm-Message-State: AOJu0Yw5gGlOvXuKlcoHcRMR1j6xsp/f9afElS+90DZB64rr8eLFEPSs
	m29F4rjwpaYrQuMsujEE+FIOWzIE8OffMg==
X-Google-Smtp-Source: AGHT+IHbk3CijDIRIrtiDGuY/LNrpS3P4TiEu1ZTTNPQVqNgmydk0JZ2Oa/okLXufROZVjkTabBcJw==
X-Received: by 2002:a9d:7f0f:0:b0:6db:e1d0:6628 with SMTP id j15-20020a9d7f0f000000b006dbe1d06628mr6576894otq.74.1703886609050;
        Fri, 29 Dec 2023 13:50:09 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:08 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 06/10] RISC-V: KVM: No need to update the counter value during reset
Date: Fri, 29 Dec 2023 13:49:46 -0800
Message-Id: <20231229214950.4061381-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135010_942445_0A166DC2 
X-CRM114-Status: GOOD (  11.99  )
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

The virtual counter value is updated during pmu_ctr_read. There is no need
to update it in reset case. Otherwise, it will be counted twice which is
incorrect.

Fixes: 0cb74b65d2e5 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 86391a5061dd..8c44f26e754d 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -432,12 +432,9 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				sbiret = SBI_ERR_ALREADY_STOPPED;
 			}
 
-			if (flags & SBI_PMU_STOP_FLAG_RESET) {
-				/* Relase the counter if this is a reset request */
-				pmc->counter_val += perf_event_read_value(pmc->perf_event,
-									  &enabled, &running);
+			if (flags & SBI_PMU_STOP_FLAG_RESET)
+				/* Release the counter if this is a reset request */
 				kvm_pmu_release_perf_event(pmc);
-			}
 		} else {
 			sbiret = SBI_ERR_INVALID_PARAM;
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
