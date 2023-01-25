Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE01C27C76
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbLJDn4GsgUN/rtlWIqmx1c91m717KjUPoItaEZHelQ=; b=AoQqonKo7yOhUT
	3moQtoCsz/wk/wmPnrmcj9bm0i1nCSyer4PpIQu/c4Nm2P/oUlNvdZ6rhtpSV+AX7DpNAMexDg4RD
	Syq3H6RJhu2W6pq8vW8zWya7CL9DPaM6e8kCou5xHCd2l25tUVj81ubpn3XVQfUja8wc+ikOF1bx3
	rTnTqirt8nQc974BkRdrlPlFgiLZnnuplshamegEzbZnYOlAfC9xuV/9118ugk7HLRC/AqKTT0Hau
	qyPgTr8Re5NPat2WQwIIPEMMoktHN/XZaVI44wdyIzsGGoWijeCF400zuPd3YtvndSE0KVcK7HmlD
	MGQJkZ2JNjJvy+Ri6boA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIE-007gs1-LD; Wed, 25 Jan 2023 15:02:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIE-007grp-0Y
	for linux-riscv@bombadil.infradead.org; Wed, 25 Jan 2023 15:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2C3HjWrZB+7wSfjrD6r343Y4MWemAjdetwdnRYMFDS8=; b=OG9l9OhoCNvrHkJ1n9sALhOjIj
	Fbb9n96dFzM+iXndzZze5E2rIb05EaYqlPnTmW1SBGROE7NpptS4qbhxIUpIm+/1H64p6wf+fbqGJ
	38JXz09lmrIvEQG22pB7jX7/PfZoDh6yk8TJNL9nfygBTUoEMAZ5sBdqUkQOITSo1R0NS6ANceahr
	izT8tj9lxGd0pBd2dZIoAkfyJhLdhCcWr6+NwLVmgu2wS8EcqOnqcqFK88lgi89wptIQSkCcBkQdn
	xnExNaN1dQsqMkONClJ4JjlqtkDehuLOgQzNOyd9UAjnpEZ/TTsbHFoKP2zOPb7qaBLDrqY92UzjD
	GKMfIVIA==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKgfD-0029sn-1r
	for linux-riscv@lists.infradead.org;
	Wed, 25 Jan 2023 14:22:13 +0000
Received: by mail-pj1-x102b.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so2163429pji.5
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2C3HjWrZB+7wSfjrD6r343Y4MWemAjdetwdnRYMFDS8=;
        b=WHskQHqaOrEN26WyhV97d7Bg1iUstUPltyWS3O/fjmP+aSMAy1DoSKn7CMZml+K0yJ
         d+5PX44kEX/Q/gqJGcM2zTd5Lewm76vjAC0t2yD253Vji1Ci06HxX5599SPKXI9C0Kci
         U4LYPdODDXEl5pERcWF41p5r4kJ7emeU7czoNtpPSCM6rBgj79Tlkv5c7u6ABrGXAcwv
         Zr7WdrtZWuuHr/dw7sn5sp0O4FZZtC11h9t1pQvsiyfGQEgKhgAT9DUwmYzv2LL+3cxH
         Tai7bu2utXuMArBGP49Gh8EDJL4QrkKuQczUvWgJkIiz2/TKKTeUSqtJCmXmtRlhkn7E
         tyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2C3HjWrZB+7wSfjrD6r343Y4MWemAjdetwdnRYMFDS8=;
        b=tlD76qn6Y3AhsYLq3pPllO4mp95o+ygXtR3iRZ4cU7Vl1+BbjHVGb+9eVRpN5Dae28
         PN1WiWK2EXbQv9l2M648BjWFnZmeCH20Q6BiWmf/LreQcBYZ0HD0jGNyQHYun0HpJ4Qr
         rLHo5Mw9M3X8ei94ElwE0z/zoK53wveuph1cHA/GiSEThNcaxecrJZRbkjdogLxn1wEi
         tV5hsFRXlDlBATRN7F0tYHLc5VgQWhcwnPQroORnOosVN8HAhMvDUmTpYDE7XdeP0qIF
         cSujkYVURTuT6kX9ixzQnaaXS/8gS+MkeNYfwA0bw2HTO8F9v2uHHYoAyraBvk1iAXMb
         lrLg==
X-Gm-Message-State: AFqh2krYRtvyE/zi51yJPHcW1n2s7KyLvo6WmkckHVGrmCej7t4lZX4g
	rNNqNQk1lTCG7clrRb8BQ1qfHq8fTxvqAgNBAS8hsBu4UxHguejcm43ObLlCHtpAv6XdR7XFKdx
	il7l3asZZKPn7UmFX5/LY/4FVgyvXz7xqo7UnWZ9xlQv96/Qz6CPSbIYW/d1CXmR3JDV8zUlQvc
	tNaF6IgswzeQ==
X-Google-Smtp-Source: AMrXdXtxy2JSAotwxjD+LLAsHQS6lJjbYHIewFy59htIOvhSpptE3SMPHca/oLJ27jZ+84EGJbLR7w==
X-Received: by 2002:a05:6a20:4998:b0:b8:652a:79f2 with SMTP id fs24-20020a056a20499800b000b8652a79f2mr29889418pzb.11.1674656561421;
        Wed, 25 Jan 2023 06:22:41 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:41 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v13 19/19] riscv: Enable Vector code to be built
Date: Wed, 25 Jan 2023 14:20:56 +0000
Message-Id: <20230125142056.18356-20-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_142211_732341_6F7B9D64 
X-CRM114-Status: UNSURE (   9.42  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

This patch adds a config which enables vector feature from the kernel
space.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
Suggested-by: Atish Patra <atishp@atishpatra.org>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/Kconfig  | 10 ++++++++++
 arch/riscv/Makefile |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..f4299ba9a843 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -416,6 +416,16 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_V
+	bool "VECTOR extension support"
+	depends on GCC_VERSION >= 120000 || CLANG_VERSION >= 130000
+	default n
+	help
+	  Say N here if you want to disable all vector related procedure
+	  in the kernel.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZICBOM
 	bool
 	default y
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 12d91b0a73d8..67411cdc836f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -52,6 +52,13 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+riscv-march-$(CONFIG_RISCV_ISA_V)	:= $(riscv-march-y)v
+
+ifeq ($(CONFIG_RISCV_ISA_V), y)
+ifeq ($(CONFIG_CC_IS_CLANG), y)
+        riscv-march-y += -mno-implicit-float -menable-experimental-extensions
+endif
+endif
 
 # Newer binutils versions default to ISA spec version 20191213 which moves some
 # instructions from the I extension to the Zicsr and Zifencei extensions.
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
