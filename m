Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67F3FC6160
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxO+2RdnKHhoodXIljxRC0IusNaQlIIVxiHw3RVBdQY=; b=ba26aopU2dkpXq
	whQFGxSouasRVmMGz+ej0DGlGn4lySLOqFJC/SwLApnfE7WRB+ruH+zmS580xD9hFVxnW4pC18hhQ
	FFR1bRyw+LZ8YnE3PNXUQnTGNMUEOGXt+7p9oWvy84KT131IU+FTSbXAYXDO3SS2pySfMy1+9mt55
	GpV/NRB7DPLi5xJ0ZKBfEmfVO5Vaz4z6NtV+paFiHXIBJWaq4vBNvJg0uGF1W2Qb932pgqS1Gh9gR
	0SBOCZ6HONGyDnPBm/s6jdMWj3Z88bVPAOc8s7Jz4kSzKaGfjIJkc86LInZSB6B9bM8yvhpYm0p+w
	y37mrFR+8eh+ncw9ORLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Ub-00000009QxR-1UzG;
	Sat, 03 Jan 2026 15:24:37 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UX-00000009Qu4-27GR
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so3239282a91.1
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453873; x=1768058673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbTfmd3NSnTt9lXFsPx3VDeaOg/UBFYzN+h8hVF3FMQ=;
        b=dSUb2n/KZq8wvf8TFZ/DfegYhJcK0TOqGm9eRSUVDKGSMwQBk6zQXaYQLaKUAjiq1k
         nkt+2fSY1EVf5CDlONTUJ/YPigLl8JGR9am0AZAeSq2YrOBt7DLZzfyQPO1x2OH74cN1
         ftm5deIALQSHNdPn0Dk8sjRDJT3N0aCbYdLO8egrk5slhTaRcaXVKg5SqjGcZ8W/ocYq
         4o1c4jXNL197qvdm4hnBUMPMqiT2Cpr8z1AKxtBWcYmNdvpNFdxVJGc12hMfxOfuTOES
         P1KKmPw4G8i7KKI7FsRQsbWmHEZTktZ0xuP3W+SWmRYV4V3Yefh7rI82MduGqjqhx5cW
         Jsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453873; x=1768058673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbTfmd3NSnTt9lXFsPx3VDeaOg/UBFYzN+h8hVF3FMQ=;
        b=jt4DZR3/rzw7huCXrqjm7iU+Er1d0/cs/ReyNlMgXvqL5DM61Jsjwk3yXfEjDE3cfl
         BPDFe+c68wx8de04YVRwpsh6gzy2mwOUb+mcYmFcPfN377PLj3i7sOX8oG0GUofuHjtP
         wW1QtBRU5QKi7EdYzyusC7GfAztJDr65+vRE/xjlczXfYRyI5DF8F5bh8kG+xvs0abS8
         FCzMgdDc+jd2S0AULnHeSQtU0bC5vMTzTzK0RdWyF5MskXnh2jqKNd6nzKnR8dsfSXv3
         EChvX7Q/t6FIA8iut9BpJmoBwSHqYyAMPwnehhMsUTTVc4bN2KfPfggb/qrNrfOz7uwk
         gn+w==
X-Forwarded-Encrypted: i=1; AJvYcCUiQvT24+a8R8M4ZFqSF6iHLpQiZZKOpkd8X9dLaigvfkEPm2vqcEww5M51v7Jn5jsLKgW7oLybI06ouQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywor4vwcWijRYrRB4MFYbbi/u+NEuQa0OUrmnCJ224LCSPSDsjR
	jguynTamjT8ZGqrGuZCG6rMu7bLAxvRqOQb3EcD1e8jkeGQNVFKQYgWn
X-Gm-Gg: AY/fxX4kKrOVG5HC/onL8onjY2668DyxV7O+TmJbEzZ4Alm+8od5ntU7akFiQTT71fL
	CegWwppB53OLA96wMbMoRIlBHN6dapA3QJf1RIH03ap64CPQmhx6ESurDHhPUmr+gg5lFw0JlCu
	Sy9QgOuPIPgUuFRSbmJboAASqb8hhg5TVCpX9C0FU0p3gmr9pCVxOrnSnLCR1RdGkWMAjTNoct9
	jVs4x4xxakpp/CY5AWwl20aI/BoLG2+cNSbT2VH5zplIGRj4ctbWvmP238IiczSL0Hw7YXvuyR7
	7FOecRDbGhPLPBv1hZUfNsN46lJwOsZi1iOEAmn+pmqpyPKDj2YyK6Mvx0wyUc5qiX47mPH18LW
	M11y3piK+dXlPTDJp/UGldIOn5A6BbOukFz9JA2+Wq2XZ3Asm/ZDckR71Sfhr5I1BsOy9LvMp1O
	jw17umnMoELe5LwTqiCyulhhADKQmN+LnZCpQb9c4OevRZjYHlS1ojglvPQWpxdtA8
X-Google-Smtp-Source: AGHT+IFAqFIt8xnOvelgL+iXx2mpTPUOQaCU3Q7/FdJxFlUC1bycD0YxqtWt/Ab1RF9sp9aze5LfoQ==
X-Received: by 2002:a17:90b:4c45:b0:34c:fbf0:fa55 with SMTP id 98e67ed59e1d1-34e921beaf0mr39991715a91.21.1767453872679;
        Sat, 03 Jan 2026 07:24:32 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:32 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v2 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:23:59 +0900
Message-Id: <20260103152400.552-3-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072434_454746_99C60F47 
X-CRM114-Status: GOOD (  10.21  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

riscv: fix timer register update hazard on RV32

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 85a7262115e1..f36247e4c783 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -72,8 +72,9 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMP,  ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, (u32)ncycles);
 #else
 	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
@@ -307,8 +308,9 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)(t->next_cycles));
 #else
 	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
