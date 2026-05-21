Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFF9CD5BA4
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6oc3tJMWEtfOs4l8v8DSR+JbpqVOsfe2+x1/9/gf7AI=; b=l9CZh+LloTqTt5
	nrm3xH+Qemy1wM1VjsTxiY1ubxGNfUGUVY5fonDKxALqfV6+rDU6+/pZleDPLzv9WLjiA/SEBZ3NF
	Vi7bwLBl9daj9uNux4EoSHCGDacgLyCqer4EhZG2tIjQ4I7Cs/KUlzjhzG6fcy+dgDGZuj/bEmOW0
	e1bn7VVWMDP2DZZyRR2huI3xi1Cne7aSHqYKR56TadXdLHsl2HMraeurIc5sWoIziPsBkBnmk5u2L
	CNiWpXIynSIrDxeU4PvCuByXGu/wnV0ZNQhIQxntPYeBJvECqQS6rpvlUx5GzbvKPBABzc53VNrsI
	DbR0X6f65nlLSLeaMUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ074-00000007Ng1-0MK0;
	Thu, 21 May 2026 09:54:46 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ071-00000007NdY-0fX2
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 09:54:44 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gLkK33WwPz9t4w;
	Thu, 21 May 2026 11:54:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779357271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZBfCE1tFEw1bHwVhbXsEcGvBGEMDeaoxSgRqgJTJ9o0=;
	b=nSU0Lq5HyQqkFkbqIdXT9Blb6N3UNZVpqN2iMx+JHIbrRf7cbbc1oZxM7akGlRFWHUmn/8
	DSICq3E7PaJJKqT293eciMZ3QB5aLZTEXg6FH/WtFQp8IBHdO0UbQGboSbQ5Qnf3/EmssM
	Xi0/Or1PcE9zP3/rvInQVNlTih54f5XlkHOjdpNogIMJAwxePMlCzdQXBxshmrb2zMBAck
	0oDgI0Z8tLs3thJptkKRM6M7C0zn+lS2mKxWIHR3j31VQLJk8SOrwWgiHB1ZYAtwbbNrh/
	VINV8uDDeYvyzSuRMf95MX9RtOQ7JgjXm0CDr2Oaiud9Qbd6GbgfPiHatAuovg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=YiYx2wtD;
	spf=pass (outgoing_mbo_mout: domain of mhi@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mhi@mailbox.org
From: Maurice Hieronymus <mhi@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779357269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZBfCE1tFEw1bHwVhbXsEcGvBGEMDeaoxSgRqgJTJ9o0=;
	b=YiYx2wtDp2CyM5Y6pBWSfoab5hHzcMT97ZjKyxRkzjDhxCyALo0IFwC6Yl/Bl6/Q5UKIOw
	7v6UXSIdYdoLa2z+881yGo8+yBG/VA7Jtzn4/fdV3KjpmdAAMzvkTIuDL4f2dHHBSz68RG
	2sKu49Qexh2u6PCCUSJil2fAMy9MT6bQNYdW/yn2REH5uyQMnxdwQlnLxDObanAUbpCJn0
	3KMllb+Ndo9YA1x+L18bs3cDVveqz0R14/2VEN68PWa7V9E7y1hyiN/afHf+QE8d5p5183
	KqPLsyl4SEeynNqRdR9M25Q92+z2lgvqMvlqyiIsZi7u69Nf9KLyZQAaF7LBrQ==
Date: Thu, 21 May 2026 11:53:59 +0200
Subject: [PATCH] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
MIME-Version: 1.0
Message-Id: <20260521-pwm-th1520-fix-v1-1-df9cd956dab4@mailbox.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyND3YLyXN2SDENTIwPdtMwKXYtUE1NTU4ukpBRjQyWgpoKiVKAw2MD
 o2NpaAH9Rl1JgAAAA
X-Change-ID: 20260521-pwm-th1520-fix-8e45558bbd31
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Maurice Hieronymus <mhi@mailbox.org>
X-MBO-RS-ID: c7d68cde2b283687114
X-MBO-RS-META: u84cfcd635d5m45as961oynfre6h9ony
X-Rspamd-Queue-Id: 4gLkK33WwPz9t4w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_025443_356437_AB16A4CB 
X-CRM114-Status: UNSURE (   8.84  )
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

The cycle register is always u32, so cycles_to_ns() can take a u32
instead of a u64. With that narrowing, cycles * NSEC_PER_SEC is at most
u32::MAX * 1e9 (~4.3e18), which fits in u64 without overflow. The
saturating arithmetic is therefore no longer needed, and the ceiling
division can use Rust's u64::div_ceil() directly instead of the
open-coded numerator/denominator form.

This also drops the TODO referring to a future
mul_u64_u64_div_u64_roundup kernel helper, which is no longer required.

Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>
---
 drivers/pwm/pwm_th1520.rs | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index ddd44a5ce497..933c1ec59c2a 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -67,16 +67,10 @@ fn ns_to_cycles(ns: u64, rate_hz: u64) -> u64 {
     ns.saturating_mul(rate_hz) / NSEC_PER_SEC_U64
 }
 
-fn cycles_to_ns(cycles: u64, rate_hz: u64) -> u64 {
+fn cycles_to_ns(cycles: u32, rate_hz: u64) -> u64 {
     const NSEC_PER_SEC_U64: u64 = time::NSEC_PER_SEC as u64;
 
-    // TODO: Replace with a kernel helper like `mul_u64_u64_div_u64_roundup`
-    // once available in Rust.
-    let numerator = cycles
-        .saturating_mul(NSEC_PER_SEC_U64)
-        .saturating_add(rate_hz - 1);
-
-    numerator / rate_hz
+    (u64::from(cycles) * NSEC_PER_SEC_U64).div_ceil(rate_hz)
 }
 
 /// Hardware-specific waveform representation for TH1520.
@@ -192,15 +186,15 @@ fn round_waveform_fromhw(
             return Ok(());
         }
 
-        wf.period_length_ns = cycles_to_ns(u64::from(wfhw.period_cycles), rate_hz);
+        wf.period_length_ns = cycles_to_ns(wfhw.period_cycles, rate_hz);
 
-        let duty_cycles = u64::from(wfhw.duty_cycles);
+        let duty_cycles = wfhw.duty_cycles;
 
         if (wfhw.ctrl_val & TH1520_PWM_FPOUT) != 0 {
             wf.duty_length_ns = cycles_to_ns(duty_cycles, rate_hz);
             wf.duty_offset_ns = 0;
         } else {
-            let period_cycles = u64::from(wfhw.period_cycles);
+            let period_cycles = wfhw.period_cycles;
             let original_duty_cycles = period_cycles.saturating_sub(duty_cycles);
 
             // For an inverted signal, `duty_length_ns` is the high time (period - low_time).

---
base-commit: 3936b25815ee686a273ca7bbdc9ae19af5e608a3
change-id: 20260521-pwm-th1520-fix-8e45558bbd31

Best regards,
-- 
Maurice Hieronymus <mhi@mailbox.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
