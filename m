Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA1DC433E1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674F520674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngKWIjax";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="geDW/4Vs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674F520674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9iCbkTLxbdfnf6NOJw/puk1uc8YuH+fkJmI9upKlpmU=; b=ngKWIjaxPECFEuGeA7ZmqHD+T6
	P28V624R2J+Co5uPLnf+d6b89wBKbHiY+f6QmmJUMp7UQdDKe8jK5rhP6IyXsGyvh3MXpEfxjIiY9
	+c1EI4xiLqfyYJbSc4rHvcAvOFXcgs6qzBe3QDHSOcufe6M2ik5pZfMGigN2wg1miQN/2sFSuIARz
	1oMD7zLjrvkBENDKEs3QKtG8Vgz95MNhbKimoeYDhBfEss++ObeIK2zr9/W5h8WJOuQLoLWcwbC4Q
	GPEXP0A9oPygoMBqH7mV+4T2M+TeqjJ5IPS6fsVIUkvR+dx4E0wr9IEMkEO6NpeJMN90wG/ljSxJk
	LXFKN7tA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdxx-0002zY-L0; Thu, 09 Jul 2020 21:20:25 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdxu-0002wj-2l
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:24 +0000
Received: by mail-pl1-x644.google.com with SMTP id x9so1342668plr.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=q32i0M4AAOmiL37Cc0ms5q6mnstnv6IiqgVgbQXeWWw=;
 b=geDW/4VsFmUd2iNoTqYiNeXFLB883oZctQXAs2D86DOrrhvJ3uX9T7CfnHv5Qy7vgf
 dzmPz9mVhZH0PSriVPyhCQSBfGcqiaXjVk1ySds3e3W2JsGOtmDKlZh74wbWhAKInjfN
 pF+Tm0A9E9wZURlI0Xpp3trFNMxBoXEkxjVq/PWMuXrbYfSRwxX6JN7t6TDWdlKDmIq/
 vgUQV6OIc4cBDwhI+sVjljmGBwlDGIdoqXnPsxjM1LSaEGZj3Qg/qRW65M+KoT/lGlNY
 EFzpdT9qAmQXVB14FTyDMXRwPQQoPWElXVOJ8UdoKk39vx5Lo5w5a2gvMJ8Sz0uziPZD
 Do/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=q32i0M4AAOmiL37Cc0ms5q6mnstnv6IiqgVgbQXeWWw=;
 b=RSba0eDx3ujWc0AuUxQsilk3ZlT3MSqwvLmCk0h443BZrdTdE+BcLVQZqjCguSW5z+
 Dn34oJsDkBuCW52tLwk2vfaQY+9l3XiLEwFkKEw3Zi4Jrb8FWaFJtanzLnfs+Uy8BRzV
 uP2SI4rQaiyXTeqy2pt+LYmtKzFKm4zYBn0ZB2nIEpGvksgPUkNNyRDxT6l0DcGJn7uQ
 y3GqrtpjrZUXGEw5WMwrIMsZevn2pGpnNjCLg8jw7idIBogJYAmt3sQhA9gKFUsio3e6
 zJXNSTvaPT50xRjIb2F+ejAP4qVG+U2F/BwjkGi9fYrKfaAZVEG3ndxxb932cH6bCvbV
 2Z6g==
X-Gm-Message-State: AOAM530pyDNVKML55qb/vzSevsSnc+fE+n1bibFVfTv1lUnGOPoMOt5r
 XNkXLc+Cu3mOFcBmRGgP3v7jYQ==
X-Google-Smtp-Source: ABdhPJykG/WLVKUlYBnUN3nHkl5YVtpBexbKLtvO2GxnZHrRM9jePVegtvJ1EN3BQSn7pk6voA/Y5A==
X-Received: by 2002:a17:90a:db48:: with SMTP id
 u8mr1926985pjx.169.1594329619856; 
 Thu, 09 Jul 2020 14:20:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 7sm3617059pgh.80.2020.07.09.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:18 -0700 (PDT)
Subject: Add and use a generic version of devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:20 -0700
Message-Id: <20200709211925.1926557-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172022_192841_7881F0DD 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org, brendanhiggins@google.com,
 elver@google.com, glider@google.com, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org, ardb@kernel.org,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, mcgrof@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
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

Changes since v1 [<20200709200552.1910298-1-palmer@dabbelt.com]:

* Don't have GENERIC_LIB_DEVMEM_IS_ALLOWED select ARCH_HAS_DEVMEM_IS_ALLOWED,
  instead just adapt the users.
* Remove ARCH_HAS_DEVMEM_IS_ALLOWED from the arch Kconfigs, as I forgot to do
  so the first time.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
