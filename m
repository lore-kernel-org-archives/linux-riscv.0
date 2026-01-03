Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5875AFC6180
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDrk4KnCqQUWz//IIwUk1Ogeu3S/M82M/lsLZboZBu4=; b=p3eOGBQQm6oIR4
	HoiXIP4Yrb7B5KOmYn7ODWPFDro7j/k5hGw3ARKU1nx3M9jtSK1pgVb8UO866GQcrGmM4bZw9LRiL
	t5nFsQdUn6X+RqIgqVOh4taYqwf7Hnn9IyiiOp9IsUUX9lcusrvc8jIrL1fNa/FFMbyrhTeQCDyWY
	T5OywyiUyWHtb6QdH+RMfAxlhkbRwR1qeJ9y1HeDdkkf2IFrAvEkp8xU+Oy9kxJecrxqC0deKLW1x
	j4tuOBoF2ieFVNAuIRX6Jl/LuejJLBQ64HlgpuIjIxXJ7ioJU5b63xb0FloKna5sTbxLf7JaD/oXT
	wJJKd5rdiTcEYciNFzpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDF-00000009AAu-3L0n;
	Sat, 03 Jan 2026 09:46:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyD9-00000009A80-2qFR
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:20 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso156300125ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433575; x=1768038375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxjRzDH8YfA2CgJ8ukRlCUfNc/bMZBLM3ftExUQvlc8=;
        b=fhMX4oj0E/VcOOGC1r/gaws0ZSolr0RZb+WdQ/0QCjZlVTDXQlSI6GV6bWe2M+pDvP
         4B3hNd0cyyOu9G7x3hRMMQ1nxeMZh3FT30c5CPTR2KChOzwzpsp1h7cShxlYwP2h4Vv5
         RjTAHbvqV3ZiAT6HBHsVdRbhZSipcD8+AkotlmVMjqtPaIjgbOl9xwmThMdWIqll9GsO
         xImYrs1VcX83qPWFuCOi3VOS73uo89iJXBPvfdoaOrF5JUNIH/EQ80IS26gNEHi9itih
         9yv9aRU5dN3Rr7lamPludvgNbfDD6a5Ik55x/1e+Km99N6/nRQdvKGYwrFllp+wD8oIV
         Dqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433575; x=1768038375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxjRzDH8YfA2CgJ8ukRlCUfNc/bMZBLM3ftExUQvlc8=;
        b=FRYIMLrrG4/lbvuoCh8osQeUa5/JR+iLHmqvi1HhDWkeehvCUa9TD7o5Pxv3G6NTcy
         rGMZRHiFj8dbjIfrlp96cncHnWjNsB5/xNH0uStgfovSZKomc49CQVmcRdYogyd8Lykp
         DmuRzEfTbMBfcxLjsZNUKzJ4DFEbvOMzhYclDVBQUhL+f5Dwoy/5CIpkpzxJ0h+m6pmb
         fL/gqKsNM1YZF0u8lJ97cqV53YjNVzNtugQq1kIvwd5lSxtkLjqnDOb4Wql+6F7gPhFi
         Ch0MrftBPE7xI4qaH9PPNqXX1Al+VcTZohk9L98tVRNRegdiOGKCCnLeBX3rKPvhoaMo
         BDCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEkDn/wjABdt7CQ51jWHsuS1SojtoVQDUFyaVR6vMuiBCpoC6JScsfu8pMKiwKWaF76MfY2NkaDe/MXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsDwFwJdtXnUdagVvdkw0R2J1K538LRcwGzx5YhgpZIvRSAqY5
	vfy/9BqzQk77xLvlX5nXTB0TFXGpb0CMf6aB6oqBxtQjtYMxAL/hSyccpvOJn+EiESA=
X-Gm-Gg: AY/fxX6R0ihGrsfH8bWXjdIjy+KztIUXjzUNOqAql0b22ZXth/Xdia+1tCXx8l4FDwE
	fTiEUpmBrmcfsFhKH0lampuNOp7U184ZczXISs/7FtN198dIN0ipMI0wVr7D6oW1vrfYSbADlu9
	HCiDsSFlRbFK9U7sPrWPOJdPcS8aJB/USfIHoxq1Wk3v1eVte1tg4eZ4s/TIET9kiRxo/PX1Qtn
	YkqBZ9bhkS3yy4aAekaPSyo794yzzOIik4DWwPKW1ljKJ2ycFDGrPScvI/VA7etlbrsHx1Xmq1Y
	KoS4Vn28gFRv6v23DxB9eDE1oEFUN92J/AwwxrLnyuOQeQsp1q4cEkvFO+Q4/7VwFKG1J2X81GE
	PKq/RWW9P1Hk0IFzc9dj2ETfnuQkuClDYwjNoiMVZyvmdyPuxaNIHVWnuQcGQBmQ05qwWXbtLfN
	5WgHQj9ohkjQrlylc59/VveVF235KlX18lA9DJlea3GQ17FyqimJucsSzp0MHxwdcy
X-Google-Smtp-Source: AGHT+IEkB956+B9xGmx9cTGzL/pONpKgSLBP8lNFvd+0O3zkG68Mte459jHa1jjHCkA3n/rN8fRFsg==
X-Received: by 2002:a17:903:290:b0:2a1:e19:ff5 with SMTP id d9443c01a7336-2a2f273818fmr480811265ad.38.1767433574809;
        Sat, 03 Jan 2026 01:46:14 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:14 -0800 (PST)
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
Subject: [PATCH 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:45:00 +0900
Message-Id: <20260103094501.5625-3-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014618_879420_52D2D745 
X-CRM114-Status: UNSURE (   8.07  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
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
