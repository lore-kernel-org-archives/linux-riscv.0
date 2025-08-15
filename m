Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F13CA0ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0P28W7nTErs/iTzFd7AQOsqUu5Paq2QggleG+5DJ8k=; b=1p73nkifIjDdzb
	i73qdO28GMaFf4xCHfgbEoaJdb92hX+++bs9F4PI1XzaLxDfK49hFAOd8Xr28E5Wt5cNoocyQSC+6
	zldpAvtRupQ0oeSC5Ki9aI0fT2qPAt4lOKFSriao0UlSznQeHlEXClAxAZHXyXi0PE5coFXVg4vWc
	lug9+wASWdwa+3UDWPx3J61QLnEWZrYB2C3WHKwvRLjeFgfxReOU8p21+IHYAQGyeKEvc9zMXJFxJ
	D9w3dH0p8Yh8hkfjQXU7Liwcy1adG399vj/rDpvNSXMhhkBx+DnRX7iIb1W3PZlOTppR1R0fCqm4j
	F77IZpDSNGwRF2Nk3EGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0u8-00000003QfW-2dHS;
	Fri, 15 Aug 2025 20:20:00 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umz9m-00000003FRn-3DwN
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 18:28:03 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b472f0106feso567816a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 11:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755282482; x=1755887282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PRc1fd64O4J1Onrw7dVFQU3zu1pxcaQiGTVN2LS+H5M=;
        b=OBvLqpXTGbPjD/vWj8lCJ2nGRMWQYeSs5dMtXeZ+JdFM/Pyf/YM9wbdaGul1Qyu3rm
         d7ci+Xy8FHvAiw/IjrLY7KKbkF3UCaY6VLKZTb30ICDOlkbyHYUwtGTxeIDiMChUJi1g
         QKwTHOFr4sYKBDREzAqi5yd7OuUkW3pI7BCjPshFG99Sc9eEWwIoRb/qvq8sS0FnfCUd
         bhrlrbcFWDu+rrnK3wWGKvdY9ZgguqSm8f6Ic2Rn9bKKWvUxxyzNQjCiytHvVzWoVNXz
         K4tMvP3dXnTIAOvsk/ocpGFOsE4AOB4qtu7K3kpnfgdNU6XrTPSJUkT37pAv3w/KNbFF
         EipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755282482; x=1755887282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRc1fd64O4J1Onrw7dVFQU3zu1pxcaQiGTVN2LS+H5M=;
        b=ViByUj0QF8wmise8tv4ymiLSeEQ+2hJ5iOwGl0jrfcCtC3YBLSjN91je+H6B9DOQyq
         a5sT1GxReh7bXuwU4WXtr7yZFWDYEL84ee+hxzU3CcoJ1R6DS/y9TBlk9FuaW/xT8GlZ
         aua9t1S4RaM89uXuk2v1x8oAFXXmIsr+t5a2CDWaDmoJhiRutTE1SrpAO7lvcQsoZteM
         S0vNimB77w7qPhzzKLH0VdW2oRWJAUAgSeyhgTR5bL9V0tEJXTpYm9/bYoSQYX6GAN58
         9sQchotwkivjv1T1Bdxw1y71UC5LoP4Qaw/ZsvKgFDZUX6Ksg9aV4PZaapC8EypSYROq
         vYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyblK++ofSbqLqY1um83BgfszIwvFvaucaR9WuTBhxQMcpeVHmVR17HuhXELZlzeEQ9kkMbKKolRJkyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr9KDa+HJVEjBsf+SUoX4M4d4HhwQZ9KJ7swsPp4W9clBsnqoz
	jeXa6xR0slEl/GnK5D13AKMPSnnZCjBEexH8i+QUWDkVC2JD5D6e7FXs
X-Gm-Gg: ASbGncvF+ubWCnsY54g9Rhqz/wTjDUxD71/qhBoaMubaWNFEf+xVY/fCZN5tRfl6Ruj
	QahuXehuLw36LgqqGVyTmFC54wMXULNuYoZy5I77fTCkSaCweSHEies3sc8UataydI/SvssICnF
	M1h86qxB+td1LAf3dDN8VEo406WpQq3XyD6epGvZhINkWYDOoj4+8lnC4FjAZCrujdxyKjf6U1a
	/a4KZBAeMJl8WadjgN87qANlq9xQAb+sIuKcwwcIy/wmaO2bxC38Jq/Y+zoynaz9Wv2YtzLD/R6
	3lol1n7oHzM9R8B5tChuu6iU/70cK2JHuF4Edwg10cazcxQ8t4LE16/NwD1ExZZnT9MUPifFa8T
	H0D1Yukz+iMo74R6Fs6ybE2tZuHOE5I0H
X-Google-Smtp-Source: AGHT+IEHD1GjcrbAdBd7la+otQhbrqDF5HpTciQ3G09/nn/3VnQgMLKqhY0XaiQcIXJt9SZb1N/YZQ==
X-Received: by 2002:a17:90b:3fc3:b0:321:4765:a423 with SMTP id 98e67ed59e1d1-32341ea7860mr4878289a91.6.1755282481580;
        Fri, 15 Aug 2025 11:28:01 -0700 (PDT)
Received: from archlinux ([2401:4900:93f2:6a91:9b6f:8f9d:11b:d64a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343994891sm1791582a91.8.2025.08.15.11.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:28:01 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS architecture-dependent
Date: Fri, 15 Aug 2025 23:57:42 +0530
Message-ID: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_112802_810168_1000A381 
X-CRM114-Status: UNSURE (   7.66  )
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

Replace the fixed definition of TYPE_STATE_MAX_REGS with architecture-
specific values for better accuracy across multiple CPU architectures
including PowerPC, ARM, x86, RISC-V, MIPS, and others. This change ensures
the type state registers array size matches the actual register count of
the target platform.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 tools/perf/util/annotate-data.h | 45 ++++++++++++++++++++++++++++++---
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 541fee1a5f0a..0dfb12a8f1cc 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -189,11 +189,48 @@ struct type_state_stack {
 	u8 kind;
 };
 
-/* FIXME: This should be arch-dependent */
-#ifdef __powerpc__
-#define TYPE_STATE_MAX_REGS  32
+#if defined(__powerpc__) || defined(__powerpc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__aarch64__)
+#define TYPE_STATE_MAX_REGS 31
+#elif defined(__arm__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__x86_64__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__i386__)
+#define TYPE_STATE_MAX_REGS 8
+#elif defined(__riscv)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__mips__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__sparc__) || defined(__sparc64__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__alpha__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__s390__) || defined(__s390x__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__sh__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__nios2__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__hexagon__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__openrisc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__csky__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__loongarch__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__arc__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__microblaze__)
+#define TYPE_STATE_MAX_REGS 32
+#elif defined(__xtensa__)
+#define TYPE_STATE_MAX_REGS 16
+#elif defined(__m68k__)
+#define TYPE_STATE_MAX_REGS 16
 #else
-#define TYPE_STATE_MAX_REGS  16
+#define TYPE_STATE_MAX_REGS 16
 #endif
 
 /*
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
