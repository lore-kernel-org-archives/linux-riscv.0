Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30B1C83F11
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 19:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9uC6C4yvlAohCkqO49wNfIOXNSt0umaBUebIZYjKlLM=; b=zlT9NfwnonPQELdXx7y+LkTgS/
	dt7HVcU0SPX5Cm9j8eVE4Cl22PiyaR1+QMPWXwUoGFnC/kTOWlt/gxQ6JxpfGcaP9i2XOUYuX/65u
	26Mp08roxlpm09Hm6E1M8i/HLmnM2HRuDOlX9WbJaz6fei5h8hvx5wyFJjAQuQ/X3Reoo3e8VJbZC
	feMnjnmqvxjH6ycFIk7pTPhVpbFx9c46Wo6KVMyIfY9s5qxw+w//7AU7jFeBTSRtkTjkhnQgRkkJk
	w2JJ4JbybcWZjTpQ8OHpXP8SKfnDfXjLOyb4kpXJLBzUsRofk9iAKeTxaLW5ZG2qcI5vh4hZAuuLJ
	p3pqAdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiO1-00ABy4-1i;
	Mon, 28 Aug 2023 19:58:57 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiNu-00ABvs-0R
	for linux-riscv@lists.infradead.org;
	Mon, 28 Aug 2023 19:58:51 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-56c556b5aceso3537976a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Aug 2023 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252729; x=1693857529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqxXsJhK/PDnu5QKzOuhVQVuGBQ7YV59awRNcw8M9KA=;
        b=5vbcngL8ZVHRFE2eljBR/WQoqnwHuLVs7upb4C37eJWQbZVjr56f/ur647yJ4AUyqU
         odlSa8/RjIkDV07G0UBaBb4auy8DU4amPuju8M5IQqLJYH54J4qila2NhRd+E1O4RyAM
         uVYOKvozn6NT8UEW8VWKOZJe/DKWNoXAIn9cnQYVR4AleyEg1/b63QvqUxI0dcSLbnMx
         XLuUylSfyiMonef/eNWAAMq+tnS4EWsKMBu8wIhTW3R0YLJ6tJf56CDFzDgaITSCuq+s
         BLuYHuv7RfEgVzf9k8LBhuxRvd2HXWmtf2Vk/OTijRK93Crc/qqwJGPUvgiTw7PzvnTZ
         ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252729; x=1693857529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqxXsJhK/PDnu5QKzOuhVQVuGBQ7YV59awRNcw8M9KA=;
        b=FmleVxaPHMMkUEB5761zKVSHf0+wxOckMuIpoKZpvvm3rYtZ0S0ffMC2TjKt9OSZRz
         yMaIaHmASnLD30BPTNXfRPU+6jvqyjJCCiVU8TS4znvqQymG5pyaLmhXf8y0z/7MZ/iF
         UfhamrRdRSb+6VNhuONvMQgAUw+c5agQC5vzIU8hRQsqF+XUQqLsHoFXiDuxy+gVMFw3
         H587n11gDOpMJePKFvU6zuYa6b1nTCoQHAgIds9kGS2mWfqfYPW3rslWQ3YRe3z+VB9y
         cwaGlXLSTzR+f/DPxL79Dr74PmuEYQFjJ5J2XEOurpnCTbiLp/GzZWb5ZDVe+Y9DQFue
         DXjA==
X-Gm-Message-State: AOJu0YypIo2YVb17INTno778qKMW2HVZaVcFdDchAwt0LWZZ9/uoLcwK
	FsZ8s2uoWtSA6+2M1eJQvyfKfsfykCKVmaykTOA=
X-Google-Smtp-Source: AGHT+IFGsaaO0XSM/Y67KiglbiGwn9oCum6xrnQEFf9Pggoc6RCuQ0rJ2Xb5U12wKvaEKKMsCRfVVSyEDOKWowHVSW0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:9351:0:b0:569:52d4:fb68 with SMTP
 id w17-20020a639351000000b0056952d4fb68mr2368998pgm.5.1693252729217; Mon, 28
 Aug 2023 12:58:49 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:40 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=samitolvanen@google.com;
 h=from:subject; bh=P2l56HkzVV4iJDbhsS59ZlfJgm96l/buqsb6+trKTfA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqKl9k+yTdNALVx1ZMSiIiYkPp3ifD0Ueug
 LDeD+59dp2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7ombC/44I2N+oNE0mhFWTI0lDlgL+4/JMQhfMKSufRM3U1T5OqabvtPwFHQhOXRz1TiwEcDr7i8
 5yQiZuqOXgg3iZ4h+9F4cRzw28ArehJIEGz+O7FO70FgOBNXOSHaWGcyv7VuHdprWhST+C1v9Zk
 ZgslARn9fBw5HJwmwr6bN8M9im4r9jKtVsPr55L3xnUWbk+knu12/aZpE/GGE0bbf3QK+N4vt3A
 0nNh0iiFlV4YayOAPFabrTDShrkvvWlE4rzF+fG11hd/h8APu37zoH57B2AywUWNj14p83mXT6k
 u9y2x57j40yu0iK/b1JflZvDK7CJ0s8ajtQhMOXhjDmApgyeWZVLMLAZTpKv4gs/oO2xodXiw4R
 ksl1GmDHjdIlhyeMTWWtCCcg/DIiAd6f1B740jP4kkXUDiP9Sy3P/G0MHt1K+RGieGHpaB5B13/ UvPppmx2PeR8h40O/fHIATSyyElr9SQ8Dg84t2Fd6nUgiqKsWp+OrKSdL0qF6hmaWxQ0o=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-14-samitolvanen@google.com>
Subject: [PATCH v3 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_125850_177430_2D61456D 
X-CRM114-Status: GOOD (  12.45  )
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

On RISC-V, the return address is before the current frame pointer,
unlike on most other architectures. Use the correct offset on RISC-V
to fix the CFI_BACKWARD test.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/misc/lkdtm/cfi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index fc28714ae3a6..6a33889d0902 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -68,12 +68,20 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 #define no_pac_addr(addr)      \
 	((__force __typeof__(addr))((uintptr_t)(addr) | PAGE_OFFSET))
 
+#ifdef CONFIG_RISCV
+/* https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention */
+#define FRAME_RA_OFFSET		(-1)
+#else
+#define FRAME_RA_OFFSET		1
+#endif
+
 /* The ultimate ROP gadget. */
 static noinline __no_ret_protection
 void set_return_addr_unchecked(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
@@ -88,7 +96,8 @@ static noinline
 void set_return_addr(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
-- 
2.42.0.rc2.253.gd59a3bf2b4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
