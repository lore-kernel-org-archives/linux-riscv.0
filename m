Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DF3FC617E
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vq9gWo/7iPO5jIYM3lpoDBaLiMOGXjKLQaJ9i5fuBes=; b=EZ+KAD9PU0a3of
	m1ncjwkOtdKpKk0LXSKoOjwAYftn+iYzZbn8cHWvek/ZICxk9koCnhuFcnh9djAK4TSwqRRuLt4n6
	1IBla/5/S/5fQUZOIDLbRbH6jWgFDozU9RkSpqMESgNrjHe/1v3rJsO6X/s8T3J0KsRZ80MOINb5H
	he4jA5zsUqiGgnHHpPkAXiHKgpMcvlOthkYUWG8wBsK04NMW7zIA3efnthYs2esC3aloQXcStjolI
	AjLbmbLN6oDgV70UQhrDk+v58MeNz50icVQGUkV9a/71l+iBBvjlw9P3XtdIdrlKzedRbHQZKHmL9
	jtmZ7RYPey4O8EToOc4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UZ-00000009Quv-1XT1;
	Sat, 03 Jan 2026 15:24:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3UU-00000009Qse-0aIC
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:31 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c565c3673so320216a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453869; x=1768058669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY+1CqHRW6wgOOvSa/xPbABDm4UWS4wzkJXrx4Ok40o=;
        b=Yr40yFkImq7Hyp0IIt7P6CoUIw2MDMrgImK25kxoDIC2xd4gTtduq5gmswCst/kczp
         l7AY7nRpGC91Kt8k5YtwOswnfyJ+guhKgQzPKP996HghrU/qT/He4NBX6Qh6L1ph5u2x
         xtUREKg7vhwgRFNS4EhuxmK0bNQBh8ZvXOD/u2zIbuZgMSwWXznwrxG9TdJK7fOvyyTs
         pvAogTLHgpl22SkmYM42oGEGsOVJ0Buc87JzDxIPD+4hqqOP7DIzlSzRQvbSL3Gmjr3O
         eQe5PLS6kMjBrysZAcwJxe76daGWVVx2ckgRR0GzBDFJGt9ag01uAOWYapCz154Nb9WX
         lhag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453869; x=1768058669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rY+1CqHRW6wgOOvSa/xPbABDm4UWS4wzkJXrx4Ok40o=;
        b=b8KOZ7qx4riFaMqsAvp/GdUu6mt+Av7QsowK74z05avCeMhNHxgjxacwSyYcXzzbM4
         AtO+po+f7WM13PrLj7Y21qUkpEHTXVeOQ/LpC7ukrV9slrV+mmrvYKbTjG/TFK9KKvVg
         UVxMBB8k5C7f2fN2Rz0ypagInawKBwDdwhlr6NvmF/4vYjvOe7mjtehZluaOiFBMSt55
         keR/fVI4DxwZF2sQjg6Yzrx/mdfW3ZbM3f5g1gOMJ0MQPPQWcyLUe+ttcxRScX+aF6DS
         RCclA6ytuciSRfP7DSWrQ6r5KQFGyUthVIqqhtHws8zdjDBl8iqdyOmEnaejrl6bNkfP
         lT1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOdL6rOAlVjfm3wgA2nmkIEvrLaae5aFluR7j2rNroANm0QRi6UPx5eAvJu//uawToPM0Pyky2eKGrqQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YySurIb4dOOXIVDZJTWdXrpU7zt0z4z19AmYOqEhx1n5yoYfKvE
	ILqoee383EFjT5jb5lnJkCiXihoxpvG9bSPt6hZLrKG93+qK5xxtmSl6
X-Gm-Gg: AY/fxX7KHQxyxZN9zXkLqblAJj7DLOV4nDV1rjI3CE1lHyiq570jcPGc5THP63RNaOe
	M6mIZ18UIceMnz7ZfR0mLeMu5B7CUOgAQSHoLH2S8KnoUiWppagtySH7urNEw4BIr6GrPE4dRkW
	VXCRnNGuSrRLmhlaJx3biUChpZQMg5fU7sBO4dHp6lGTO/8ux0hTYQGyWlI93JE6aBaJAL0I1bm
	hgZ36OYLcxT2kvzOzmT3GoNfmFrdWqjuB6rEM8V1YN5zx8Y7AU4msyEVGpPQCVnH2cUM4escSMp
	l2iT2KUyxZ9+gdnHJ6f38XyfVfjJH4DvU/tkNtCzfEJxNpeXvuXhq/CoRnNx1kE5RGVNnuDEItz
	nB3VY1o2+LKkkzY+E4emcJ52WV/MozWtEzscZ84lmuG72ylL3/bzD/Wkr1ECw/AIFOwASlSnuLA
	LQbardZBRm88D8DURg5ZRgT+SeuRBLuaFO42sIMs+5Una3m9NzYN+aiFqqmJ3y7IFefBTJ0jmar
	48=
X-Google-Smtp-Source: AGHT+IHlp9HPsn8fm7xK5iwgx3KOKWhA+7VN2RCvm7LTYT1W4zfwOzZOihBwzvrzDg7BywoDL8XQrw==
X-Received: by 2002:a17:90b:3c8b:b0:32e:23c9:6f41 with SMTP id 98e67ed59e1d1-34f4537da08mr1903713a91.5.1767453869180;
        Sat, 03 Jan 2026 07:24:29 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:28 -0800 (PST)
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
Subject: [PATCH v2 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:23:58 +0900
Message-Id: <20260103152400.552-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072430_178539_ED729444 
X-CRM114-Status: GOOD (  10.45  )
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
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
