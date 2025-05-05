Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C949CC3ABAA
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 19:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dtd9s2Pypwfmlxgmv2focRdEg5SWIcwN+t1m9BQzsBs=; b=CUyTFCpcGKlLG8
	HdqWMXibdPwKMHWsU82z9nJQ6MWM8w2hXk9fp5bFOwIFClBOjaOqEQdzF9NwMxCDolJO2OXX1I4+g
	op4aglW9qIKg6QxOg6JgFk5o1KN1tpP5MbncrE+OWzp5TkX61Qy/VYDn/DjOGQqOTkE92pAjyWd+j
	aRqZOQxSr6euA6ybst1TgbYsOMogRbHeYqr2bNDVUWz/+idplhS1+0hpqV5OKa2A7q7fWN2Q55Gsi
	nugbHUS9VUhKDK6MWjg7+aso2XT/zXJQiXFuIiX5KjLgD2xKIlnqkCWSOJecqBOX7ZA6Wy4Hu6xe5
	czEOt19ET6/xRlM4EYDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1mJ-00000008RJa-22ri;
	Mon, 05 May 2025 19:47:03 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1mG-00000008RIp-3oX4
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 19:47:02 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-309d2e8c20cso6317481a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 May 2025 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746474419; x=1747079219; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=PxaX3OmEljzE7zT2yLlbMvvD6sJRneHXUZk37ePU7aXQ92NlGy3JN1kvG/Qp3TCexu
         OufsVs/+snz0Do07UJVdNPgoX0mr8Z921k8tlpBjL3Ma/VEVU6ibhA5XaaNWIXrRMn07
         XSoQyVMTRoUWjjcwSdomUx8HkFgnxSeDQC8HkoATIXGUUt7GUCaAPcIe+d31xw35cRFi
         lp/tMO5zhGWTWVt99FY2Al6+k+2h0UcRxLRjIc9MV1Lkj349yIJk0Ct72IZdLz4iqCBc
         L9QbngijW1sAcEev+ayOX8VGT2+gG29lvl/gdvbSUcMa61Ij8mNI7YQQFmbbRPbI95O+
         vv4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746474419; x=1747079219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Plt6knEw0shoMZnzf8M4P2C9rMIfWDgHR7NQgQL6Uzo=;
        b=a5W4wJVU1n+u+l8Tetjd1sik4A39hF3F+esgkhtJXUKz4EhMlXaCxBC8haS/LjgxsB
         K6H4cWjmPK2keZtUPBpPMxPgfc9DTJt5awHS5N3OdlAwTAEVtRykknfB06FinnIXcqYU
         cju9TkIltWsQHR43VGl/nbL2vDyJtPIyhqCBQE7YpGILhzV0VXZ5WU9YV3nMyai1GLNK
         fIOlZEIRSOs8Kopu1jC7mBDbJfboQxFql97/SG+twFb6Nr+YW6QOfbJz8+PDnwIoXHYf
         cEmAriPluvdp53w95BNL0kWUfML6/7MymIVqsDNWkexPdqHk/GBE1PJFigMdST9MZyBd
         Mfzg==
X-Forwarded-Encrypted: i=1; AJvYcCXwYRPyXQzmwKrMYNgdcWylGPg8ygGB3ui0T6ZEjQJTt1V7iH8LrTJq0ZXo5646/CVm6W1ecDYGRbJ6xg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpRHEkZKGAY3gC7+goKQH6c291AQbhxPkjUp1aaLsbPPWDTvNq
	ryyNxKARP3tYs/QqwJ65S0lQzEmp7EBELloUTuVU/E6CqCIGrqsXKeGX4B4puts=
X-Gm-Gg: ASbGncuWUZvUjVvYEh/L7nQem10t3O38EKp7p0xJJnK8L+k/zQozVxDFhYj0/a7AucR
	TtZROGd6JZOXTDpa08gPwxLAprfUj3RWH5K2bu6H83jSBT5rAYLX6I5pE1pRfmJYsOV5NRaAPzM
	qknNZWXSq7SyQokdxBDr44qTU7Gjv+yMf7qMRJNZTauG35ZlPSbSpZJCTVygF9LGXWoQwqrwhgE
	PRM6IesmuzIPvRlbY6iJe9Cx3EqKGPosTFzBRBTl1yMicfiGtn6vsqRAZAADYAUr60+H7c0bLCa
	5btFLMmTfSI1/SKXfaxUBouBTpoJ/fAM6UnXDo0p0GHdliIhCmpu+Q==
X-Google-Smtp-Source: AGHT+IF9N2TMIjAxtdrrQ2QWC7apsZXf1n2ya4YvkWtGuqNlHbY6PxtJ98wUVfZSK5UimT5DfxWc6Q==
X-Received: by 2002:a17:90b:2744:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-30a800a11cfmr172541a91.31.1746474419573;
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ce9sm59083085ad.163.2025.05.05.12.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:46:59 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 12:46:53 -0700
Subject: [PATCH] RISC-V: KVM: Remove experimental tag for RISC-V
MIME-Version: 1.0
Message-Id: <20250505-kvm_tag_change-v1-1-6dbf6af240af@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKwVGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDINTNLsuNL0lMj4fKpqQmGpkYmxomGpuaKgE1FRSlpmVWgA2Mjq2tBQA
 HM59HYAAAAA==
X-Change-ID: 20250505-kvm_tag_change-dea24351a355
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_124701_150452_CD8DE627 
X-CRM114-Status: UNSURE (   8.54  )
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

RISC-V KVM port is no longer experimental. Let's remove it to avoid
confusion.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 0c3cbb0915ff..704c2899197e 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -18,7 +18,7 @@ menuconfig VIRTUALIZATION
 if VIRTUALIZATION
 
 config KVM
-	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
+	tristate "Kernel-based Virtual Machine (KVM) support"
 	depends on RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING

---
base-commit: f15d97df5afae16f40ecef942031235d1c6ba14f
change-id: 20250505-kvm_tag_change-dea24351a355
--
Regards,
Atish patra


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
