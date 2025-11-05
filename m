Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADACCCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssgtt2j2dcN1Iow1PiyAonRnDnpbtidrIf2Ueo25jmE=; b=ueP0gL85kfU1k8PSlZpcLEC1mN
	BR+DGTWuZReC59x+rl4y8yKk0kaHFrJOgX7E5LWA9PI6uop0YsY8AQirSfcCKRoivUISbOnLG4Kja
	UNDHnMg1zrIAcUlsL8iSu94kq9IBd8OYItrhb+IkkppurjccehuZOOl3dK1nTRVXH09NCKMNC+qFm
	hIk7WvfTCrinqSX+5CEzN2n3CCAMG92le6G6lRwLV11wWtNi5FccnLznTL8d0loZ1Gg5b6+pj4vCY
	oxmLkHHkXF39JjLirAEY10zSo3ctXFoAOAUAtDU4LLd5mAd5THUw0N6vk6oABPNPv2zBMiR/yyGLM
	uqAfitnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGlJ0-0000000EXyB-1XLl;
	Wed, 05 Nov 2025 21:44:38 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGlIy-0000000EXxh-3FKz
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 21:44:37 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2957850c63bso3743355ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 13:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1762379075; x=1762983875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rVWjaBUX/7qo8BA7ZtqqS8rCRLhaeeey8yCwyWWpyLA=;
        b=IYuQspf7i2BvPRoa07Y+CHitWz/irQmcAy2elVJS+lD+nyTNrWXlQOpmQcZUoXDmAR
         quc9jONK9pINlU3GllH96JWBjq8syl9UZSPcRyWxA/v0T7gcSc9Atk4KOrSKZdDVHZc5
         77HVNGsblFcGzjyBTUlz9pEYBeo73alnVeCa/msC+tN/DSjtlMA7Tj1VtiMkDfHvLELz
         NvowAsZpon09CY1xNNE7z33hLCcZ1HyiOA7pNG4QoDMVs4LqOFSQqu+y7+W/KpK+tIVT
         tiHQLOA0hQ//tUdlCt0hXkdJCKJUphMm50QsnlXNsscZWXGDeEoeS2mYRcQCScm+LyXy
         fP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379075; x=1762983875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVWjaBUX/7qo8BA7ZtqqS8rCRLhaeeey8yCwyWWpyLA=;
        b=aU+R8gr5sLFgpJ2zi6C57OhI/W5orZ3MZ3MEbJEBFgDSXZTAHgtLHkm9CcKpaDRL4N
         GwMl1oB1IzqJkoAWyyasabIFz5J/Bqs+7IOs1XfQ8Z4eMHlTB6GvuptOgT22xj8mAWiP
         PuuQs6pd0R7QDHnf588jrQa7wSbGJmtBpOOjy8wa8XCc9er1x2DgANojns2C4/irAZS4
         k6YAcjISZibM3vjWEqg3iEYLkPVFo1yzaeR0dVmNMwyeEfMAb36IyFqp44jMDFEm58QS
         cO5aX8dduxVSL5AtiaxYSMW8mMggsLt5V4BUnzjOmfkSZxCTsUio7INMxJyK6Wp8opgq
         sUWg==
X-Forwarded-Encrypted: i=1; AJvYcCVv+CeA0w2qBQAKLU3dnuJVUJgZ8jRspCKOgjOfWXj66jUdh3ejeK9yapR07zyG2330G1NXkMvaY5UxQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzpIiasrBRi0RmJ1FG9jf/jv4L0szw6HUkN6NNFlRBaGasRbYMf
	//KzURmvS2+AxOetJg1MdjhbndT2xRnge0v3H6Tvg5bjVihLn0+KaSY+03grBxgOHRw=
X-Gm-Gg: ASbGncuX7wGco8EthQNPAw9L6xS0xPFlXd1msApPuvPseccdbLYkZb6RUmATkPFu+dr
	5fzVSUDwFwjCYkphXHeJ6ShLnYWWDSlofHy0W2VtU5hnB3gvNhr67o6u+c8r6UxVP5VbRvVzZZT
	D5NI1duRLwjAUCuS8tQQB+mkIAYkcrGQL6xBnwN7OYemnHUllYAB1agzF5T7qxj4RVgvfrsntg3
	O56cPDQ8/s2qG0tkuS0zPJYGTZ3FKELnYj3WCBIepxlwNiU8zSwCFSlFsXNkVxXXoRLVVrIeBse
	BLjaRpCdVrLk+dAa31JX1pkeX2GnyZT1lZVBBvSqxbCzV2DTmWOcN2k4DQcuvodiMoqJmIVQ+xS
	2f8MNrTqTcs7/eEZZtWjCDy7zlQa9CzCQpMRzWD0tE1+K6Go9Bq3wVFqyEyLuS7vHXJM5ek3Ve6
	nUZdOYqWwo3Bw5/r9eyH+d
X-Google-Smtp-Source: AGHT+IGUXuJp7B/Bqhn1WfKPsfAi2Zuz9PdCJSW9ZJXrA1YTaDItIRj/GRCMIgOV8doaMwcDTo+VDg==
X-Received: by 2002:a17:903:2f87:b0:295:57cc:cf9e with SMTP id d9443c01a7336-2964e9de802mr11033895ad.0.1762379075518;
        Wed, 05 Nov 2025 13:44:35 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096dbe4sm5273375ad.11.2025.11.05.13.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:44:35 -0800 (PST)
Date: Wed, 5 Nov 2025 13:44:32 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com,
	richard.henderson@linaro.org, jim.shu@sifive.com,
	andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com,
	atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com,
	alexghiti@rivosinc.com, Michael Ellerman <mpe@tenstorrent.com>
Subject: Re: [PATCH v22 28/28] kselftest/riscv: kselftest for user mode cfi
Message-ID: <aQvFQM38u0iwSlJ8@debug.ba.rivosinc.com>
References: <20251023-v5_user_cfi_series-v22-0-1935270f7636@rivosinc.com>
 <20251023-v5_user_cfi_series-v22-28-1935270f7636@rivosinc.com>
 <CACPK8Xcm2SeSStk2EBEcUoyiUc0=d6ce_MfnP=ce3z6MMXyuiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACPK8Xcm2SeSStk2EBEcUoyiUc0=d6ce_MfnP=ce3z6MMXyuiw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_134436_816218_ED8CB862 
X-CRM114-Status: GOOD (  16.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 04, 2025 at 05:42:04PM +1030, Joel Stanley wrote:
>On Fri, 24 Oct 2025 at 03:33, Deepak Gupta via B4 Relay
><devnull+debug.rivosinc.com@kernel.org> wrote:
>
>> diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
>> new file mode 100644
>> index 000000000000..55165a93845f
>> --- /dev/null
>> +++ b/tools/testing/selftests/riscv/cfi/Makefile
>> @@ -0,0 +1,16 @@
>> +CFLAGS += -I$(top_srcdir)/tools/include
>> +
>> +CFLAGS += -march=rv64gc_zicfilp_zicfiss -fcf-protection=full
>> +
>> +ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null > /dev/null 2>&1; echo $$?),0)
>> +TEST_GEN_PROGS := cfitests|
>
>I hacked this up a bit to get it working for me.
>
>I added this at the top to use the local headers from a `make
>headers`. Without this the selftest lacked the required ptrace
>changes:
>
>+CFLAGS += $(KHDR_INCLUDES)

hmm weird. In my case it picks it from location where headers get placed as part
of build (or make headers_install). I wonder why it's not happening in your
case. In any case, I think this can be added.

>
>I needed this before the ifeq so it used the cross compiler to perform
>the test, otherwise the test was always false:
>
>+# Check for zicfli* extensions needs cross compiler
>+# which is not set until lib.mk is included
>+ifeq ($(LLVM)$(CC),cc)
>+CC := $(CROSS_COMPILE)gcc
>+endif
>+#nedif
>
>Findally, a cosmetic one. If we set the name of the main test file to
>be the same as the test, the rule from lib.mk will give us neat
>output:

Sure, make sense. Will do that.
>
>     make[2]: Entering directory 'tools/testing/selftests/riscv/cfi'
>       CC       cfitests
>
>--- a/tools/testing/selftests/riscv/cfi/Makefile
>+++ b/tools/testing/selftests/riscv/cfi/Makefile
>@@ -12,12 +12,11 @@ endif
> ifeq ($(shell $(CC) $(CFLAGS) -nostdlib -xc /dev/null -o /dev/null >
>/dev/null 2>&1; echo $$?),0)
> TEST_GEN_PROGS := cfitests
>
>-include ../../lib.mk
>+$(OUTPUT)/cfitests: cfitests.c shadowstack.c
>
>-$(OUTPUT)/cfitests: riscv_cfi_test.c shadowstack.c
>-       $(CC) -o$@ $(CFLAGS) $(LDFLAGS) $^
> else
>-include ../../lib.mk
>
> $(shell echo "Toolchain doesn't support CFI, skipping CFI kselftest." >&2)
> endif
>+
>+include ../../lib.mk
>
>I can push up a branch with my changes if you'd like.

Sure, please point me to that and I'll pick it up. Test locally and send it out.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
