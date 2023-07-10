Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D88EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 18:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mu71qn5LTOL20Uv4WuOws6gpr/4SoYIzCbQEgJbILx0=; b=nyg6TjP16lThR9SR780s3Sv1WI
	Tou6ac/87kREJQEeOPLgbez7nLrpkf42D9XHos+2cjiaQ5RCFwN16s/gpEC8coB7Jrjcy7qST8I5E
	S3UhiwaicMhe6Cd3ttf+g16ifJcq3bulvHchB16MS0dv1H+a5GsX7v60ZuI+vlMCh4CqkfhrLp24w
	A+/1v3TS91qIkuXcbING05KCrZRJW55RZYI8mHzJpXCGY7tqP9oeFH6UHYiCcvCcqHIkmaE+cypsD
	4CBPWJQCmrgnQpZRrHALsguC5muqU2+ZqOYpmeYy+kRYYUa1LzU7zIduOo4T2RjBsa45xExSo/9bW
	n4XaNTfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjt-00CTHQ-1e;
	Mon, 10 Jul 2023 18:36:01 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvjq-00CTFQ-2F
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 18:36:00 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-56cf9a86277so59215167b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 11:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689014157; x=1691606157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aa5lQRof/F8cmDC3HRDbQ84WnKxCQ1duxxw+zC9cpn4=;
        b=23a/BYJOg6q/fOh8fzxml3B4m2aOP1zFQvS2kQGJ08o95ldNeS0IPbiHDbR9gH9Fp6
         kR6Sl8+BgYjzrFsG6yb+Rkk6MNGZW8hEsapNMPKNtCJKuk6nYjCRdQQ+uQb3B9UfB++f
         utBahDQJYg1o4JuRkSh968uQqvT98b9OmdJjbsrIk3o42Fk2d/ok29nfEUL7UUhqzHJv
         prPYLaV/c2enA8e2PLnR/POxy31CGGLrstg7H7frJDcw+SCozmYUGTbmwg1dBvxg2NPq
         3w+buPLo/MfK/E/uNGpXJFH28p0Ada1smGQG/jSaDr/sxTRRhtnyAA/kKPGymQX7nGfJ
         8FSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689014157; x=1691606157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa5lQRof/F8cmDC3HRDbQ84WnKxCQ1duxxw+zC9cpn4=;
        b=a9BUs9K7hnoWuyIOfPSVjuY1PhZ7zwVddDV+3WJ8siKbyf+l/8XJoZzWmLlCTQ+R3S
         B24YHeC2PrRdwLhcZYgoCNArWKePbfbelDmtJzG2aphG/c6oWowEJEOJKBMJ0QmAw4FY
         5zsEch+TPrS9bRO6wdGVcWD1I9hw8eGdiJj36u/ITJPxWonGRjs0nuy7MrAaqjNSijKY
         KRgA2r2MSwDpb0FS4DcSxtONO+8UWtoPAGBzIEP1zowGezuCSpQPOFbs2zN+ozGcQbtw
         5RrnNJY89ea5OO6H/wurSmz4FN79T0LqDMiDjbXM038m1cWtHdUK87e623o7eJuBBI2z
         UKkg==
X-Gm-Message-State: ABy/qLa4UlytgYtTTMiCUOx3DSqeDDAEcZl8tK9LRS0QlpBRDIBOBUNd
	pSv0Dnqgp7jVoVZi7+Tp7PN+APXL5mKQAZoqw3w=
X-Google-Smtp-Source: APBJJlF1HS/nqxQGVVm7Sw+Lyqck7QIthyrJFOTZrHwkstg/4ASzhXm/9W1XHOsTeD182p89+d7OuhX8FazlF9+8Pwg=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a81:b3c3:0:b0:569:e04a:239d with SMTP
 id r186-20020a81b3c3000000b00569e04a239dmr97416ywh.0.1689014157245; Mon, 10
 Jul 2023 11:35:57 -0700 (PDT)
Date: Mon, 10 Jul 2023 18:35:50 +0000
In-Reply-To: <20230710183544.999540-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230710183544.999540-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=820; i=samitolvanen@google.com;
 h=from:subject; bh=kymeq10zoWFqiY+GAwwmAwqNZBv1fmNg5qliMfkaSfY=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBkrE+BqQqqxzq7jHsOZNuj+FFSkh4kaftmf8PyY
 jDkFEmsHKSJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZKxPgQAKCRBMtfaEi7xW
 7hR1DACL7wNpbhOW9RbbJ6wgRvYcoTTSZDHUgsClXupLaaeipyUO9QC9zsPf4Q1iemCy/NFGNyC
 JF7AS7FxhKhD5Cc5XVhwyColrHi1xcvd6H9jUoiE6UhKSdLbDa11uc/dH6nMQk1B7K8bUV8dq7y
 BTGqNZBzFvNBEXKspIzcxH+1qhZUKR5L+PcoVhaM1MPO22DQXRL7bBhknQ68Q4DNRNN/fEhIFd/
 x1VO+WAhzdrmbt0UsBsYs8Iins8w4y3rr5takR5uFJjejP9YWDAusk8aDsuvoWfbYgMEh5xbCxa
 1Fj/kfCx+v2CLL5VbmgP5kseMz5eTtbE1oxt4oMWlYHEMHcUwrS7+8W2qXt0k99dOtQnHVRZRuP
 8luFpa8IutHZkKTVnPrLhUyCkK1TJjo4EjU8L589pXW39fW/up+mozwX985Km0FeB3Z220FUTGL zfFr01PoMwotR0AcrDE2aotdqMYL1mWrkB1IF3Umg3PtPxFoKaU+zURdOn13bxn/CxtbI=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230710183544.999540-13-samitolvanen@google.com>
Subject: [PATCH v2 5/6] riscv/purgatory: Disable CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_113558_743421_0ED0FB24 
X-CRM114-Status: UNSURE (   7.21  )
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

Filter out CC_FLAGS_CFI when CONFIG_CFI_CLANG.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/riscv/purgatory/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index dc20e166983e..9e6476719abb 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -77,6 +77,10 @@ ifdef CONFIG_STACKPROTECTOR_STRONG
 PURGATORY_CFLAGS_REMOVE		+= -fstack-protector-strong
 endif
 
+ifdef CONFIG_CFI_CLANG
+PURGATORY_CFLAGS_REMOVE		+= $(CC_FLAGS_CFI)
+endif
+
 CFLAGS_REMOVE_purgatory.o	+= $(PURGATORY_CFLAGS_REMOVE)
 CFLAGS_purgatory.o		+= $(PURGATORY_CFLAGS)
 
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
