Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DC3C433E3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E862077D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fGvVXFlT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="KnIIIqN3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E862077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K55+NWuYG3edrqGIOtNicuDhiJD/Fr535E0elgb1fu8=; b=fGvVXFlTUe58Js9U3fVJrAJjoK
	tUvg1oOMKzIsiykP8q4cweAzugZaNAIeK4pKAh8ObmlbnFNP0FK6iM9csxeDxSfdQcDl+v/3RYGxB
	H00nmvK17KKLquofrVDVe8zL6ViVjzavBWYbuV/Oskp0IeX1RQrWHMuJbh3gBrTBGAdLT1+u0VIf8
	Dhbf2fSFf+iVD/H7uMi9B8pvTpUAk32tdTw/+hMY/uSlGsLLtwsioIuahskCtdIoGU97S38jIB5Vu
	BJqxliZm1foELAboEoT8R4TNvJOOoiYnbGKLKv54XsiKxoo1XdFYKF9pvcA1jCygq1i5kqP7KN8ZS
	97rJITag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcqA-0003yT-Rz; Thu, 09 Jul 2020 20:08:18 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcq6-0003tm-DP
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:16 +0000
Received: by mail-pg1-x543.google.com with SMTP id p3so1454032pgh.3
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=Q0u+ghHjJat2tciyUX1Wacu6e3RR04dbPYpHQAKH1XE=;
 b=KnIIIqN3s6KhBZh3AyqkGpXYB9BZWlXi1AJ1rxdTymORJaZJnKeaNLDDh1UfPf+E+/
 8Lg6Oi1o2n6rAPZylI6JGSDL+qZayQ3Y3aSQ6hgVeC0qby2lByeu832z1Fg/1aDyzLQf
 kS5n+gwFHS2InuDDWHeiEwVY7ZDiF4yulJv3VwTr3/0aKeFYaW3GHnGxDaYIPwhyCVGS
 4+2BdURZoUMwgPQjUDa/M6gQwwvK70S6JY2EYfIMzfk1UlfORNwLWM6fue8rjuWejkRG
 ZXrVeZFtCVI1+eDl7mN2K5BwHA1kYPj5/40WuAyGPEEDem/jdKOeiLYb84LTKvE+nywh
 emEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=Q0u+ghHjJat2tciyUX1Wacu6e3RR04dbPYpHQAKH1XE=;
 b=Ot4mYNU9cKEl7idwfOZ3koaHED/n0h1XHW91w9sEE4famPmDdKhOoPxa7HP3p87GFg
 GXi6A9T8rcwUaozcnDPUo752eI9hR3ViOU8sMM+xSe+tBrjg+mQcXi/Zbve5AM7bWjUi
 kHDBkeXFcZNgrVbsQfgByEmdqTWZPxbH9Bkg5rixCPLtkfZR7wewyP+S+inawVZWRJOW
 AXTOWdjb+ida8pnnuYidhmVGxOITP0UDy7a4ph27Zf4zO2Jqp/iEjAnohBPut+EV0LGR
 wgyzuX5526ybQ6jaHzWEdrjNtGgvCBIYfCDZBUS9ofyDU9sI1EsQ2HE/kS3nPPorm7ut
 XNCg==
X-Gm-Message-State: AOAM532NtgI+7IvANHRJSJBnk65+rZBdLYNcVXXH2+6CJUnjMb1Z87Ws
 6AwiGqsAWcuqTY2RJdC4aI7emg==
X-Google-Smtp-Source: ABdhPJxOB97sUtsu8ZrmtJokh0OJEA49w3aoCwF7IfEXGT1IwMqiowNcZ7FmHprplX0SXTMGdWA/Lg==
X-Received: by 2002:a63:dd09:: with SMTP id t9mr54505309pgg.41.1594325292249; 
 Thu, 09 Jul 2020 13:08:12 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gx23sm3441387pjb.39.2020.07.09.13.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:11 -0700 (PDT)
Subject: Add and use a generic version of devmem_is_allowed()
Date: Thu,  9 Jul 2020 13:05:47 -0700
Message-Id: <20200709200552.1910298-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160815_289026_2AB36C28 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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
 catalin.marinas@arm.com, linus.walleij@linaro.org, elver@google.com,
 glider@google.com, willy@infradead.org, mchehab+samsung@kernel.org,
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

As part of adding STRICT_DEVMEM support to the RISC-V port, Zong provided an
implementation of devmem_is_allowed() that's exactly the same as the version in
a handful of other ports.  Rather than duplicate code, I've put a generic
version of this in lib/ and used it for the RISC-V port.

I've put those first two patches on riscv/for-next, which I'm targeting for 5.9
(though this is the first version, so they're unreviewed).  The other three
obviously depend on the first one going on, but I'm not putting them in the
RISC-V tree as I don't want to step on anyone's toes.  If you want me to take
yours along with the others then please say something, as otherwise I'll
probably forget.

I've put the whole thing at
ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git -b
generic-devmem .



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
