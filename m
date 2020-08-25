Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B70C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E4222071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 18:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zv8Ti/8c";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOCC94tX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E4222071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PByd0BgXvYkuoSP3A8tJU+38Ux5293ZD9prjTJNrMQM=; b=Zv8Ti/8cJX99lqR5IduEwkHA9c
	ZMF8EfwVARh5W3TWMkKJoJYHCSY+9X1NZnRpT1/Jz2E/UytYqYcKCQjFLctOWEviGtNZLxdzVimAj
	ugE4pL6AO8sIeE19XomVSHS5lLM69yN579V889OHapBVlAilylC2hQPns+KfLMmKzZiuiCkOLrIih
	1ajzXrD1biicYRLPVW9AKXQ/BFnwtsRlBu0da4SwpqcVOUQzkmC99VUCUSk1P7sF2ZJjpT0WlFdv1
	lYzb+c8oUI40CqpEMUig3WnYNwL0yvrtLsRHvD8NkcBUEn4/69rABL1rIHGZWhBAzRVxu5gr7Ubuw
	ZtOU8Lxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdqx-00009J-Dp; Tue, 25 Aug 2020 18:39:27 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdqu-00007l-Nc
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 18:39:25 +0000
Received: by mail-lj1-x243.google.com with SMTP id h19so14986543ljg.13
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RCVJAn2r4sVyigseGj8XV5M042whHgt3mbE/I9eFXoQ=;
 b=QOCC94tXbjjCNUrVFaKqzRlFbtnFpUnq2I/jQDJhbWmHqfYkVzgrX+tNJZrc82Se2D
 u/qXJfQYPzHBIds1mh+IpOwVMsMSn4giKYr1qsg12VATMyV1+P2rBei5lmqkuhxhs4GW
 22APxc1IcRavZqMIVDMnvWdGliIYs+oRGaklIw6wctbkCo9ymNyL8+MnfcnYqKNdP4b+
 43JDsRdrdQBMFsOX1DAcEQaqcyllaYwifmKwfAZ/Tc/TK3XcEoPTd26Tr41QzhFza5Op
 Rpe3B9rxAJHHt3/CcLQnw6EnwOokcFuluydugW4m1MKj2ozFTghA3aHGtAeLX9ojtBF5
 6phg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RCVJAn2r4sVyigseGj8XV5M042whHgt3mbE/I9eFXoQ=;
 b=fE2Ods/j4kfEtkIBc4pteDRnCyOc7GUCeVG03rWImOi7nYj+EkkoJNkv0XgxpkxX4H
 KD+mW1RUcwVwtz76bVEaAY4W11ZktYcltMmlUaHZIOeEpd+DVMObunAk9gELn10rXmzK
 24qiO+rOhOnT3nPO7ZSW5ToKvF0gRKyAUpRkqdaGadDPKBqAgNCXHpoLUdU1Xct8nAgM
 wMrXtBjVVJMzS6pVmIFlpa+ywDewZB6ZqS4/q3H2OcjyDgIcB39QJ4DJZLEOKJX+TQ+8
 z4UihwMLzFUiS4aZlkiKAhS1+3Ctt4JZLlGdVRBwkjq/W9ziqaMPyTJ04z3nWWypuJw7
 BJJQ==
X-Gm-Message-State: AOAM533cyq9qQi1LQiTZRKhO132f1s8PsG2mEWKAns6GTX3uW+kCCO1u
 Qwv4/33mL4yVCoUcHuTVf5F3wh9v3H8IoQ==
X-Google-Smtp-Source: ABdhPJz9O7z4gK1f7fdRzhAzW1LWTZ7KrHXG3NCRLdDgA6B3dDBDIYKATp9uWkmYyMGgYc5T1g1pNw==
X-Received: by 2002:a2e:8515:: with SMTP id j21mr5484814lji.158.1598380761937; 
 Tue, 25 Aug 2020 11:39:21 -0700 (PDT)
Received: from nero.bb.dnainternet.fi
 (dyn9cmyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:2fa:2500::9])
 by smtp.gmail.com with ESMTPSA id e14sm3187120lfd.19.2020.08.25.11.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 11:39:21 -0700 (PDT)
From: Pekka Enberg <penberg@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 0/8] riscv/mm/fault: Page fault handler cleanups
Date: Tue, 25 Aug 2020 21:38:59 +0300
Message-Id: <20200825183907.275950-1-penberg@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_143924_779834_758FAC0D 
X-CRM114-Status: UNSURE (   9.96  )
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
Cc: Pekka Enberg <penberg@kernel.org>, palmer@dabbelt.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pekka Enberg <penberg@kernel.org>

This patch series cleans up the do_page_fault() function by replacing
gotos with function calls, similar to what the x86 architecture does.
The motivation for this series is to make thepage fault handling code
easier to read and reason about.

The use of gotos has no advantage in kernel code size either. In fact,
the bloatometer script shows a tiny decrease in kernel text size:

  add/remove: 1/0 grow/shrink: 0/2 up/down: 96/-99 (-3)
  Function                                     old     new   delta
  no_context.part                                -      96     +96
  __func__                                      14      13      -1
  do_page_fault                                778     680     -98
  Total: Before=792, After=789, chg -0.38%

Please note tht x86 also moves these functions out-of-line with the
"noinline" annotation, which supposedly decreases stack usage in
do_page_fault() at the expense of slighly larger kernel code size.

However, in my testing, I was able to reduce stack usage at maximum by
16 bytes, at the expense of much larger kernel code size, so I am
keeping the functions inline, and letting the compiler do its job.

The patch series has been tested on QEMU.

You can pull the series from:

  git@github.com:penberg/linux.git penberg/riscv/mm-fault-cleanups

Pekka Enberg (8):
  riscv/mm/fault: Move no context handling to no_context()
  riscv/mm/fault: Move bad area handling to bad_area()
  riscv/mm/fault: Move vmalloc fault handling to vmalloc_fault()
  riscv/mm/fault: Simplify fault error handling
  riscv/mm/fault: Move fault error handling to mm_fault_error()
  riscv/mm/fault: Simplify mm_fault_error()
  riscv/mm/fault: Move FAULT_FLAG_WRITE handling in do_page_fault()
  riscv/mm/fault: Move access error check to function

 arch/riscv/mm/fault.c | 337 +++++++++++++++++++++++-------------------
 1 file changed, 189 insertions(+), 148 deletions(-)

-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
