Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4DCDC433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9185120748
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fWyWThYO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B+knHV1z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="fc4JFaNM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9185120748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aJgLkMTkLQoLPNjWj8sj1fklUXvq6W+VirMPvS1+POI=; b=fWyWThYOBBSlfIuKGWsB5ut6O
	EJmKM34eVolANVkTIjDoH/ig1+R1rE1RGK14OP3+5nLkLaNaScjvt0DioNW6v1L/SwLf5eWKOVO/J
	kNiWr8vfJ7kjbevzrowOlgWdPhaLru2vbW4WkoUy/C4EtWg4dHtNz0AltbRjLU2ySVXIWbGjP3oCa
	jZkxybyCQQcVtydIYVe51pbyLBKG6tYkKoQwiJf3YYRHiW+VTA/2e3Y/sZBTuc+HzCUaIdZaNCaay
	JXfJI1JsZQyBqSKUBwn86rrKA7B9nMbhsNCJcmH1bQZ+CwhDQ20uK4xV14NgTlIv8/uKFBAtdlHH6
	RC5iDGuWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcqP-00046r-7K; Thu, 09 Jul 2020 20:08:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcqK-00044i-Uh
 for linux-riscv@merlin.infradead.org; Thu, 09 Jul 2020 20:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:From:Cc:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=n3uMLnloJ4eoHyrHmlqZET1T4BdruPnLDoTh0ErPA48=; b=B+knHV1zWxTnP58bE2WJqoLcb1
 ITDRw0BKnX1wQSb+bq12MvpB/PUOTGChTwWk9AiHLXsDWTh24uHYXGkkjP3WuF39AjAOJQEbyjlDm
 73z7Z/4FdycoxaW4KiS8fz3o9B5EelkEvgpAQRcgwxfir6YzHqs9JhS5bhaA3KsgDd8xR56q4Mdln
 E748C5+/tYZd0WS4qLhrbBaayCD+jsnoqZnJlBZlPV5ANPUOTqFks19OgdwVO9LlFWW6udfKN79Ki
 rG8Ku5hIVrula0/oGwbLjPxX3pj1uMgLkvkC5ic0zhZlB03gUZCqQw3WS7XQ9H0o0fHRtsxfXTUfX
 eYBkq5zw==;
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcqD-0000uA-1h
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:27 +0000
Received: by mail-pj1-x1042.google.com with SMTP id gc15so3669974pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=n3uMLnloJ4eoHyrHmlqZET1T4BdruPnLDoTh0ErPA48=;
 b=fc4JFaNMdyj0dPO/QlxHDnNGYF06MrbAFpp8sghfIUTy9dRGb9sGKTljAM/dZfdB2J
 nju7OIrLaeY0xcFvtPbU14enOZWIPr+6Jp7iwm9BOsywiSS4GbXB5LGvfTSgS8MYJQfo
 wa/5mP4c22pL2wlOc0LmsEZ4Hyno4ztpOYJaIV60LjxDcw2YaB+jn5C7ETt4a7WeT4Jo
 GgVwqvFwY3RRSLDCxEOH3JoZcD0ps5TN9GS4uQbmuJUr5TmEvqOHSY4u5HtUexKZn2uE
 xe70ZY3UqKrjiPZd8mUbw8C88c51Lq4w+n/w+kuulNZw/j+fz/5hYb597azr5VWVxm2d
 1PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=n3uMLnloJ4eoHyrHmlqZET1T4BdruPnLDoTh0ErPA48=;
 b=WEvxPXGNg5pkmLp22q1BNDXtL35mDJg2AElEeIPg1vNoACVuUBGJ8MVpjUM9yMYjjN
 TZfktdWmXiGv0FmoSnw2IdHB2UaSTLKr3lAj5vojgnkvo7aREqYgEUq/1VEIVskxjTsg
 wHb6SL/ovvwR0QF39m75tR+2nsxYInkwFBfSvx+mQ+CVib4lhz4uw+dS4f09mGv1tSiD
 xdKCFohdkRo88Gf+KfV+Li4BIyP6fDRYNpt2/tYpZsDu6r49HpwXhIaB+cyFu2kSVbVe
 WSey0D0j1+SoKxQ6r79UV4WJM8hILz9tPT3I5zYg2zuRkVuEJIlrLn4ew/zHRLnk5F8d
 ywmw==
X-Gm-Message-State: AOAM532xHp6f/A7bg+mLYqM1JGMtANs9oGe/nSn2Qgd1cMc2C4a/4OaD
 mcqji1M1ceHYjYZPBjaq+1c1xg==
X-Google-Smtp-Source: ABdhPJzPLSTzb969rohb6kFQ0eaLxRBJfCFE9pkdCodyKMGtAcVwwZo/EK1rcCJ/fOCGGMRDDpxRxQ==
X-Received: by 2002:a17:90a:f981:: with SMTP id
 cq1mr1890239pjb.173.1594325295201; 
 Thu, 09 Jul 2020 13:08:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u26sm3619193pgo.71.2020.07.09.13.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:14 -0700 (PDT)
Subject: [PATCH 2/5] RISC-V: Use the new generic devmem_is_allowed()
Date: Thu,  9 Jul 2020 13:05:49 -0700
Message-Id: <20200709200552.1910298-3-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709200552.1910298-1-palmer@dabbelt.com>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_210822_003930_FF727F75 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, elver@google.com, glider@google.com,
 willy@infradead.org, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org,
 rppt@linux.ibm.com, bgolaszewski@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

This allows us to enable STRICT_DEVMEM.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 089293e4ad46..8ff368a65a07 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -37,6 +37,7 @@ config RISCV
 	select GENERIC_IOREMAP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_DEVMEM_IS_ALLOWED
 	select GENERIC_PCI_IOMAP
 	select GENERIC_PTDUMP if MMU
 	select GENERIC_SCHED_CLOCK
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
