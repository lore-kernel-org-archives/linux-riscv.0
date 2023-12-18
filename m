Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82437C46CA2
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW0WAkpttLj84IJF0CLAlkYedpMcilU6X71/dACSn6w=; b=DhxXKgxCu5Esjm
	Wn+CcxG+1aIkgDPi86MacU0gtyaYwVhRmXHBAN388mkqfMmlT3iV/fnixBPZWKJ5LhKctiJtT7deH
	H8BxMJwWd9PF8sgAjqsw1Rtfh4dR8UrFqL1jWCDOWZEN5dO0Jq9iZfouf6GNHq46gRcQCASZJoQr2
	XWmlplBg6hWzM14S1sVgQ9yIsHhv8Adn312wKFOsNDuRRJVG9dCOzOsMfbAwVTl0L/TZg4pZv3D9i
	mqhSZUsXVkwJtWMjUODo8SBKjaltA3K9Vi3MBGsTpSo90e1n4kJ0A3GNGY13Y7+yXiz1pJh8DQo8z
	zlODy2qryg3btegrSiqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB47-009rWV-1s;
	Mon, 18 Dec 2023 10:41:39 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFB40-009rJx-05
	for linux-riscv@lists.infradead.org;
	Mon, 18 Dec 2023 10:41:34 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5916c6b2e0fso1847767eaf.3
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702896087; x=1703500887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fyVFitalYEi2ik2oU3cHAgTTSiVjR9gn+8uYrWaU68=;
        b=bPE09HBBMhld+DIhkil8XP4Plzo16eVoUz+it8KXsYUpdiaYZMcCgoXAAvIdP4YrS9
         ZL8r7BHj+ZvYoTi/JxXjUyz5NnLY2lVKjGwcMxdsQLyS+yf3WCptkMzz/7qyrDk6KiBU
         JPBGkGyfqqA1d1DzgF6Eke+LXDcwfJiWuMbycn2TXuX0YNt3mGbfMXE6yanmD3tghggo
         Q45Su5Yp+DGnaZ9m3VXHiJjso3zaayBIeIEK0HflaDAIP5pEt5MQwlK5GGEV049MXK9C
         AiI5TicaVBR3sRzj4v8fDvqK7saXT+YlnTcDXXUh9KYjbYiJ2FPKG6qqyfkaRx4H3O6e
         No+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702896087; x=1703500887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2fyVFitalYEi2ik2oU3cHAgTTSiVjR9gn+8uYrWaU68=;
        b=T3ByDogDgtEuSGWrleWjxhBs0j2aUiNvZC2ssMQi+J1NGZ5/+Lp8HgIC4XrFrKxcjo
         iLkSz4x6VjAxDcC9ELqn95YiLFVBJUoSEH2aMtCAEtcAfvIC45Vp0FfNJBO08Gct+Db1
         Ezh5/F4mBQNGOjTKrNf5x5PHoD88adXvfLdeXiTDWdYjpt9tzt3dzAKE5L3Lv+s7etRz
         p1mZWN5lBe4J33ZwvjkzXOUPRSRLWIyucRvW0+SAks87Duaq6U1wVQ5mJZAt9EG2UHQq
         3ilFxiVoTd7BExY3oGPME1EEqq3EEng3HEo6OO1FFf+Fl2IRgJbDzsaviK1GzXBDxf2x
         AI9A==
X-Gm-Message-State: AOJu0Yx1PIUiZhuf/w0ZNrzwQQAYK+5N81mNH/dBvfkTWMGwAcBALSSa
	bfYI8b4ZR6egLchoPiqa2+h2mQ==
X-Google-Smtp-Source: AGHT+IGFy5f2J+i4IqKYXFotpQOE6tOEetsGoq9vmp9+rVSODcTXCU6RbekVJWZp93Yuhj/YvC0jyA==
X-Received: by 2002:a4a:ab43:0:b0:591:cb4f:a672 with SMTP id j3-20020a4aab43000000b00591cb4fa672mr843619oon.9.1702896086847;
        Mon, 18 Dec 2023 02:41:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 185-20020a4a1ac2000000b005907ad9f302sm574970oof.37.2023.12.18.02.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 02:41:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [v1 06/10] RISC-V: KVM: No need to update the counter value during reset
Date: Mon, 18 Dec 2023 02:41:03 -0800
Message-Id: <20231218104107.2976925-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218104107.2976925-1-atishp@rivosinc.com>
References: <20231218104107.2976925-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_024132_070674_8FB2D3A1 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
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
