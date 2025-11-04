Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D50CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Nov 2025 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cTxDQzQNmu1WSaMk0EpGW5uNHojyhEomSvuoPyNp5gs=; b=RDxMtKEtc/HELy
	uDk/hAnwxRS3m9NZ5LgWpC62Er6mzoZ7tkai/4FS525wfHMcb/Sr21i22R+lt3W0ZW5HaobLGU3X0
	oqV+j/bBfo3BtD1eEcZETO5/gvEZADT61EXyhsyJkCTnS+XAmuz8Yhb56wDrkjc01bV6RshMfv4Pt
	uo/YpUYKhnvp+n9BHRGoO4nXUE5i796XmLr2hEQpM569DWHfLhIzDWMD1Tm001bqXaXHuD/owfKD9
	jDHvDoznFvvyyRza2UQt3PRSVn07fJF5ACt13Qy6OlDwHyT2x5wJzQoOYOA6Uz8mCl6iqEJF7zH9v
	Oo+Ta4IAWkzis4uJqkag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBDH-0000000BIgv-01ma;
	Tue, 04 Nov 2025 07:12:19 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBDE-0000000BIgP-2fBp
	for linux-riscv@lists.infradead.org;
	Tue, 04 Nov 2025 07:12:17 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-784966ad073so63214207b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Nov 2025 23:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1762240335; x=1762845135; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6DhNHinDEMKrStnZak8eWQGcaJ3OpsuOyGuzffapdkM=;
        b=cEAokTLm0lrqy4x53L1Or0A9jQo34neZMc8DRcVJ9s1QENWTO9V6hUhZtml9UrTjM2
         vsn6Mzim7I17dntXszptNJB00LlRFKUljHzCtNpWEV+dTt2gTmbpj7X4srRdE6HgH/Lb
         M/jodvMSahOLinJKvn5DUlMB/1effBtJUsZBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762240335; x=1762845135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DhNHinDEMKrStnZak8eWQGcaJ3OpsuOyGuzffapdkM=;
        b=NoXal992Iui2mTYOxE4v5mMsK+nUoxaEX0KxgvO9YZLsup+Xv4REynwmlirf49a4Sh
         5fIDs4vxNMy1bxYf0jyNE2biFRQnyWxPsrN+3NrMEqRI6ZcCYWJ6142n1fp3KACzqpP5
         ZAUSsms5X6B/rOjqMY18JtDfNkGqs5k7tiMj5VlfHPS0BhFoWVhPMAGmOFfx1+oo7owK
         Ncn/Ie1rYYp6nHr4a+FhRjJjGc8bxC+mnl9EX41uluTqbwKVfRVGvLUI4sRptogxn3br
         MTWNWog1xHOWbZV6FZM6JoyfW6ZCklP/oB2efIgxY4xu95HEIEmjoTA2DS51yxohIVq6
         xjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSnGtoto0NsR1g1apS/aBN2TI6L1RPHpuxJbqr6VtWaXcgb5NKmLsERr7FSB1xVponvAru2PTruN8I0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF7efPa0NcjsAoRz2OkmaW22bOCeRxTnoAhXEybF+kUdhDE1uD
	U6EcLWk3Ea36lD8bohVfLM5O9c3nayaDpb0r2zSpzbES7oTwNN67szyf0YmLwZE/7PRYoYqle/S
	kW6lnSrshty/N4F4GEcJvcTalvLy1FbA=
X-Gm-Gg: ASbGnctdvmz6wgHrB3zfLW2gwA3FR3ApAp0ERYx0QJsKPL8v4UwRYNos8ffVtXxuFOe
	gfSDs2QReFvD4LOwdxhBjqA7tbXt2W+CoVSMIqyV28o9mdh3WN3/NkezAvMH3vYQ5kpBRMqYfY+
	1oODQwMs3dyeQriBIEp9qZzSOEigt4aAO0GA/FBV8fn6jt/gzeFPh8NzCebjkOIag9XjkLy1UpR
	i0SmsykXnQho01jrwWW4mQ8dvMlAD11AhfZtOFmuVRndLSLwfhI12jpMT40
X-Google-Smtp-Source: AGHT+IHWRyWNijx53xdxcYVGd10kXtulpgaOMtWFtsRlweynhoG6M9QlChpPQOzFPjUGlHnvC36yDWnuxBQleSiZzmI=
X-Received: by 2002:a05:690c:e1b:b0:786:3528:7a1a with SMTP id
 00721157ae682-7864842b407mr121635297b3.26.1762240335364; Mon, 03 Nov 2025
 23:12:15 -0800 (PST)
MIME-Version: 1.0
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com> <20251023-v5_user_cfi_series-v22-28-1935270f7636@rivosinc.com>
In-Reply-To: <20251023-v5_user_cfi_series-v22-28-1935270f7636@rivosinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Nov 2025 17:42:04 +1030
X-Gm-Features: AWmQ_bn-71oLlMqKX_VP5NpE8pEs2FlYkPOhgrus38FzpqsR57s_m7fjE9VyofY
Message-ID: <CACPK8Xcm2SeSStk2EBEcUoyiUc0=d6ce_MfnP=ce3z6MMXyuiw@mail.gmail.com>
Subject: Re: [PATCH v22 28/28] kselftest/riscv: kselftest for user mode cfi
To: debug@rivosinc.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
	alexghiti@rivosinc.com, Michael Ellerman <mpe@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_231216_704313_50DAFE36 
X-CRM114-Status: GOOD (  13.91  )
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

On Fri, 24 Oct 2025 at 03:33, Deepak Gupta via B4 Relay
<devnull+debug.rivosinc.com@kernel.org> wrote:

> diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
> new file mode 100644
> index 000000000000..55165a93845f
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/cfi/Makefile
> @@ -0,0 +1,16 @@
> +CFLAGS += -I$(top_srcdir)/tools/include
> +
> +CFLAGS += -march=rv64gc_zicfilp_zicfiss -fcf-protection=full
> +
> +ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
> +TEST_GEN_PROGS := cfitests|

I hacked this up a bit to get it working for me.

I added this at the top to use the local headers from a `make
headers`. Without this the selftest lacked the required ptrace
changes:

+CFLAGS += $(KHDR_INCLUDES)

I needed this before the ifeq so it used the cross compiler to perform
the test, otherwise the test was always false:

+# Check for zicfli* extensions needs cross compiler
+# which is not set until lib.mk is included
+ifeq ($(LLVM)$(CC),cc)
+CC := $(CROSS_COMPILE)gcc
+endif
+#nedif

Findally, a cosmetic one. If we set the name of the main test file to
be the same as the test, the rule from lib.mk will give us neat
output:

     make[2]: Entering directory 'tools/testing/selftests/riscv/cfi'
       CC       cfitests

--- a/tools/testing/selftests/riscv/cfi/Makefile
+++ b/tools/testing/selftests/riscv/cfi/Makefile
@@ -12,12 +12,11 @@ endif
 ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null >
/dev/null 2>&1; echo $$?),0)
 TEST_GEN_PROGS := cfitests

-include ../../lib.mk
+$(OUTPUT)/cfitests: cfitests.c shadowstack.c

-$(OUTPUT)/cfitests: riscv_cfi_test.c shadowstack.c
-       $(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
 else
-include ../../lib.mk

 $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
 endif
+
+include ../../lib.mk

I can push up a branch with my changes if you'd like.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
