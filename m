Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3929EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D4cEl1JfEgqHD7mecq2z+HGT7H4tgiw+BY4yf4R5wHI=; b=OOcQI82oFvDxrA0OTH8CiYeCGK
	CjQmLmTIRbeF0OeA04FtHT34ZEO+oAy+9GXofae57jt5nTeywEfVDPAAzpXII4m8fbC4RiIzNWeL9
	DAVoqNKgHmbev7aaNPJXgMEBdFHKU8+yBdu0zAcWjqu5yHk5SjQkBw/xHQ+BA6SE8HO0lfjLm2MlY
	0Rs/l26dxzzhCtLv6CpbyinRGdgeFZLFKvz2Vw+skngmmyoEg7Zv3h6X6V7smII5/K/91tdHIuSun
	08TPS0zhzaRZt873HaAIqbACxK7uabWxrOl1WYsCTVQMjSwZ5BI9rBZwQfbggzg2WcPgS7mwSM+3r
	Ut+gZFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1I0-002Tz0-36;
	Thu, 29 Jun 2023 23:43:04 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF1Hw-002Twe-0k
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:43:01 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-66eba523cd9so799956b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688082179; x=1690674179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Xlw8wqmc7m2gTD7N39tQeUlWC1WXyQLWb4QZRUB8Y=;
        b=p3VLofC9uBlj4VqikzkpTVhIEDvSp6dp7csrh8LTmsJ2AioG7ohNPCyZXFqNRY4xl2
         67M3uESl94bLO1M1ieHMv3cFZxN3FFyNQ0yWBa3oxuxiEFwLMPd34J+muGl+kMjVt8sZ
         IaP7ZZcHfBi6OBW/hhL8waRnsfqbeMv3qP1yH2A1MZMIWsagGhMutscPGf6/l0CtmEJC
         eH4izIvergiWXqGTOpw9Vsbk5iEj4hbcxvhKT+YPCyTIG/cK4TBss9B64FaAeElrkph/
         /FmsTHj9LxHPV+CVsN5UMIBeeHMoz+ubIgnc4AlwKuZkWfAvt5iWCuI+vv7VU5neuWXL
         aJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688082179; x=1690674179;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9Xlw8wqmc7m2gTD7N39tQeUlWC1WXyQLWb4QZRUB8Y=;
        b=RMwoU54iT12mSOrkx3aOkpxdGv01qGzaU71TXd32h9TWKpK17MYvi2XIbBDHwAAgXq
         T7HAZDNznR2fVRuk1kzNTs1ZOzl+ka8paHcj/a428sjMT/PLLONE4tZ/M/PqMhEc68rQ
         0WCIiLUL0Df+Md4+MgTIyENiwp+siM7OoEkApnGRfcR1/5frZWHaAiHQvE0NHarU+yNY
         lyazSXq20guujFep2fN91Zf/k1xeyRsOWjKNJPYKZl99JqHAdFGlVnf438+eZqUaGkau
         pucofGNXbPWDw0nfDAcD87LG8Rci57+qY6fQOlLaUhlKk7/1Bh1IeOuYIgfwDhXVrQra
         wOyQ==
X-Gm-Message-State: ABy/qLbXr5/m57l0fTXBqkie8tQQln9EADh2LLKS4+rO/iG5dNOzxLZK
	h/dnfL7GtV4EK5flE4N/UNp3iPAR7Nuy9RG/2kk=
X-Google-Smtp-Source: APBJJlFHLSu7NeB6EU8tOB3/UHptwEsU/4w39fszUoslEvKjGXk+rTe4axHVWR092ZKjtQWWIfnwLK3jAyxYC69lOLA=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:1783:b0:668:69fa:f795 with
 SMTP id s3-20020a056a00178300b0066869faf795mr751698pfg.2.1688082178828; Thu,
 29 Jun 2023 16:42:58 -0700 (PDT)
Date: Thu, 29 Jun 2023 23:42:50 +0000
In-Reply-To: <20230629234244.1752366-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=722; i=samitolvanen@google.com;
 h=from:subject; bh=gs+HqEOxqge1JD2H3C2OtV2QqbKbTGj0I3LUMBMWFOw=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBknhb1mBbGJYC+ijqffqvxPbBoNNe723klVhBkW
 m8HhCBORNaJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZJ4W9QAKCRBMtfaEi7xW
 7nW7DACWpElrAA2aMey2/F1+uNsTn4cuQjvpzYjhSgMneDZUzTvG9j2obc9IHVDVv2V35NZZ4Rx
 qYnhvOXv6ow3iGv+8NVoRor2ccyLXINBkBk/bdzyJ+g5Iz6AutmOsyLdDODLa+au96lNnKDLqq+
 Txok6LqZKNvnTtmBO01sSp+NaX0Fhils37JKcU6zNe4QxFb9dq6jTzowqNUjIX5wJ5zoAHL2T0s
 tLymrEt+OZ5ON9rDFrhMSYiF/P47V6jz8+j2F6hEFzx/c06i14VwYtWoLPoOv/HD6BOPuit+m3q
 W9JWzrIJwcyWdDLlG9ukewzXluZOrbvAQVgin2f6Le7Y2mvWOHldJvFbUa8nYeErwxYpRjXoIFy
 8tVOHkO6lNvnaruOkuaq0Szw25ktCiQV0nrgU30ZQ/JnEO6BozZdXZC/CZ6K3n3QL1cUDQqAgHg I0w0CpD9whXokITAv8X6e6UXd4zEDbwHvv3Zk7/XIwHjMo0Doyr1T55fqBfmjLc35Zmb0=
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230629234244.1752366-13-samitolvanen@google.com>
Subject: [PATCH 5/6] riscv/purgatory: Disable CFI
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_164300_277117_C25E022B 
X-CRM114-Status: UNSURE (   7.03  )
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
