Return-Path: <SRS0=zqna=AV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE63C433E4
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038B820725
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2020 17:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5S5/6Y7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="WDUJNGFI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038B820725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Ysb2pL+OQLV0+FM9CwKwP2/TuAe681gz1Fut6GdtqNI=; b=A5S5/6Y7CRxoVWy6NeenqCFs7
	UmYolpd049IGNx0DCTyBS91kWvcEin3XnRyVjuBeGEWUHQ32WvKdR9YLd1QUdP0dvzl83z7SJC7c9
	Fpr2eE/4FzxDFJ9DW9I0JwcHoYUEZYecWejQl5+9WuWaPnCuuQEGZFOrxkVSkWzBS/OLDEWgURKk3
	TtDWl+Suw/EM+5RzJ3SvhCQKC2WDOUlXgXqY9rStl5Srm5Kb81TLqlTEqMYhLClc3OhE/sYaN2OQW
	M0KYUkDmEYT87j6W6pJD2Bha8HinfLYh8vF/XFwj4UJywJ5dU9K9XWjVBDzYMj5B9iZ91vVHIcHIW
	enG2GfIyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtwqt-0005TN-R2; Fri, 10 Jul 2020 17:30:23 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtwqr-0005Ro-2o
 for linux-riscv@lists.infradead.org; Fri, 10 Jul 2020 17:30:22 +0000
Received: by mail-pj1-x1043.google.com with SMTP id t15so2902778pjq.5
 for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2020 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=l2uA34GNTlTqO/W96ZFIyV/mRu+IkUKlU35UNNxeW9g=;
 b=WDUJNGFIA4EdNb5W94nkUMinF+DG/WArtRQZ6F8ji53qXCzWyeacf4b9mRa9qdPdSh
 zkIrOD+o1tAImxDmnsiU8JwmV6nyW6gcI51+116+Dk//txgYzCBtIiz+07ljo6ygevVb
 G2cgcZVVPsY0IayqEbL9cWLf5In8Kfqflcr9GZR1Ol03922uIBs8CY2phVPGqXT37JGQ
 5uLPU5mVmIAcByL7fMH9F0IK3IpcH6ORu/1tWaqyb2J3B6noSreW7a8bv4EB7dR8yOad
 oxkUS+t/PS7Jgwv3bfG9qLrWaQ9RYs2dIfP2373whRG+1iS5WP8YFueLnRcum7ixZmm4
 JIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=l2uA34GNTlTqO/W96ZFIyV/mRu+IkUKlU35UNNxeW9g=;
 b=Oo1fAGwNZLUckWu1a/nHcFYNYVNfBA7AYRjX9y/fKP4J0hOCruPtqxa7gvF0GvzX14
 jKF66uYJsXP0wSId72yKPDhJ265f+BL74WKszjzoz78x4agymvHIS0vJlHdJqYHZ4aTv
 fuXX6rganDd6olvfCEE9cPuL9ydpcz2vBFe23jFegeliMmCZXLb8jykHH+3fiOhDt/qz
 1mJC99JaeFWFdCjPesFgO5RJvAmTd3MtgZSGMHcjVooJOPIJ3CumUxqy/GprnkKqC1dw
 Sjx0s5h8gEM5TRN7Pa8R3gropkgM+WiHmSuTvayMzVRuhyf0gMfgskKugjeMOfhmxb70
 szew==
X-Gm-Message-State: AOAM5333gQEBfeLzl2k0OAauWtNZb0E/tPfcjYr7U+l3vToGeJQ5BLHP
 bvWHpEiCBMbBzeZKcoZDN21Oww==
X-Google-Smtp-Source: ABdhPJy8I9DSzEbBIjkPAxDPxcda493pn76+6N8SVtK1VxnIk0vp+Kmh8QE/9zbf7ssGlAGKpC8YFA==
X-Received: by 2002:a17:90a:2681:: with SMTP id
 m1mr6362135pje.204.1594402217944; 
 Fri, 10 Jul 2020 10:30:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g6sm6660462pfr.129.2020.07.10.10.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 10:30:17 -0700 (PDT)
Date: Fri, 10 Jul 2020 10:30:17 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 20:16:48 PDT (-0700)
Subject: Re: [PATCH 0/5] riscv: complement missing KGDB features and warning
 fixes
In-Reply-To: <1592890593-31808-1-git-send-email-vincent.chen@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-1c52a6b9-6d37-491d-8a83-0fcccf9893e3@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_133021_258556_F6BF6BBC 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: vincent.chen@sifive.com, daniel.thompson@linaro.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Jun 2020 22:36:33 PDT (-0700), vincent.chen@sifive.com wrote:
> After comparing the KGDB port in 5.8-rc2 with my final KGDB port, I found
> that some ports are missing, such as XML packet support and warning fixes.
> This patch set is used to supplement missing ports.
>
> Vincent Chen (5):
>   kgdb: enable arch to support XML packet.
>   riscv: enable the Kconfig prompt of STRICT_KERNEL_RWX
>   riscv: Fix "no previous prototype" compile warning in kgdb.c file
>   kgdb: Move the extern declaration kgdb_has_hit_break() to generic
>     kgdb.h
>   riscv: Avoid kgdb.h including gdb_xml.h to solve unused-const-variable
>     warning
>
>  arch/riscv/Kconfig               |  2 ++
>  arch/riscv/include/asm/gdb_xml.h |  3 +--
>  arch/riscv/include/asm/kgdb.h    |  5 +++--
>  arch/riscv/kernel/kgdb.c         | 10 +++++-----
>  include/linux/kgdb.h             | 12 ++++++++++++
>  kernel/debug/gdbstub.c           | 13 +++++++++++++
>  lib/Kconfig.kgdb                 |  5 +++++
>  7 files changed, 41 insertions(+), 9 deletions(-)

These are on fixes.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
