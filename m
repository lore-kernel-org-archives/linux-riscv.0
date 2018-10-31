Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445F0ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:09:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142102080A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 17:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MCDsAGG8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OuXecmrI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 142102080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=gvbOI+xNVZOfv7t+wjNGXACIBz4T/bFCYJbBQmO6iGk=; b=MCDsAGG82EBF79Z7Z2Jisp83z
	eGME07+jfQSVDGrYMigpcyCx7J8/vTJqLc7P4Vu0BMqVqIqIiud+UKL2JFaMkNi86SrpUz41kJKIi
	WUP4qG/QfRrI2F7aFsKs/UVTerZk08KDDz5Wt5bKKf6ViHdADgUvsIsMCIXe6uK2RjKuc6H94vgld
	NvEQ8udE7A25etYLgYq/mjPhhJLnRF7RLlp+imHfZS8R4o0NJOAZYmzAPqLKCKo6wtS0Uuc23bYRZ
	ZdbCgTIXlTq6TEkXYIa+H/ZRUf36n6aZabVrNRkudAZadt+gmOJduiFfAPvuOCCDOEaVA1wj3DhUG
	R3QUgoHZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHtzf-00042v-4V; Wed, 31 Oct 2018 17:09:23 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHtzc-00041k-7k
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 17:09:21 +0000
Received: by mail-pf1-x442.google.com with SMTP id b11-v6so7919042pfi.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Oct 2018 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=AsXg857izCpeTVDxK4Kso/YE4Hfm18P1OOkhWRrs/8k=;
 b=OuXecmrIK7FRamaSghnfVdpiXmd6Ey7Tp9/DHzo3iICkrv6DOTVH+llV65iOZU1AVw
 abfrpZGyWP9jEeqxNxoJ7w4JRBbEDBlQGqGhbFHsgSzkukK69uoDgSl7w7sSNG0GdTYm
 Z/o0jptejm4Tsoj8jSxgSRy/GPqWewMRI5AswznK+ZbdKV++gQoxnhSTLXeATzW6/z2e
 /b3lvztL6WDz8pOrMkv0d4zcZE8VM/bwmkjQUZ6SFRRbbN5gl3kcH5J7dKn9O12LmtVO
 99S5qMYkyu2lh/6qFfu4+vwBRA2rLc8zCFQ/8/o+dGDNx9XadDvw+gdr0+xnea84P80R
 t9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=AsXg857izCpeTVDxK4Kso/YE4Hfm18P1OOkhWRrs/8k=;
 b=aBi+MVm7Qa/iOpIsQRWk8yJrzEyMLb8qYd1p00x0eyxu6ATcy+7L4IjLiKIGi5VhuX
 Sg7HluFwYT42rr/J0KVTd1rK2LCg79+YYoj91Wox38kcFOSnesegssRQ+Km78brJmEJA
 p11Hxo/8fSHmJSs7trDbopIlomLx9mS2ZOPuWeGVAJla4iuf0c11FZItTKh/jbpCjbOP
 tq/UtKtcCog+y+Rtk3uBDh+LpIiXwdH4VgvCd/FCwxcvNBnwDkAtQpvZ4qk17DCnSd1i
 ue/sXoz4ft0rNHS64R4H19+GHFq60nXmCJ48Sd2fCIHLiWF/bwIOTZ5MDKxdETqPsqWs
 tbOA==
X-Gm-Message-State: AGRZ1gKmV7HT00duFjbc/fnstz2vyPNtwPmMx+Xvrbpv5H5n7xP5G9j+
 p9DWAiMxq2MrJEsnLwuH47+U0A==
X-Google-Smtp-Source: AJdET5cZYhgVxWlaSuWYOUOUX4SQkeq1kjnVstsuRypYVN4dBncSbg3XZJhLabOHLhq1lQEnMxAENQ==
X-Received: by 2002:a63:81c7:: with SMTP id t190mr1237601pgd.393.1541005748738; 
 Wed, 31 Oct 2018 10:09:08 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id m1-v6sm31868906pgl.33.2018.10.31.10.09.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Oct 2018 10:09:07 -0700 (PDT)
Date: Wed, 31 Oct 2018 10:09:07 -0700 (PDT)
X-Google-Original-Date: Wed, 31 Oct 2018 10:08:24 PDT (-0700)
Subject: Re: [PATCH 0/3] RISC-V: A few build/warning fixes and cleanup
In-Reply-To: <20181031064709.30981-1-olof@lixom.net>
From: Palmer Dabbelt <palmer@sifive.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-74b51433-1762-4741-935d-56ca1b3548a0@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_100920_280247_82A38B87 
X-CRM114-Status: GOOD (  10.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, zongbox@gmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031170907.FUXaCn59G7ewdXgAU4zmvfikNROKR8TMEhzEGhrAQlk@z>

On Tue, 30 Oct 2018 23:47:06 PDT (-0700), Olof Johansson wrote:
> A couple of fixes for build breakage or warnings, and a small whitespace/asm
> cleanup. The non-cleanups would be good to see in 4.20 to keep builds green.

I'm happy to just keep them all together, since the cleanups are non-functional 
changes.  Patch 1/3 appears to have disappeared from my inbox and I can't get 
to the infradead archives, do you mind re-sending it?

This also brings up a bigger issue: I need to stop breaking the build, 
particularly as we now support a bunch of configurations.  Is your CI stuff 
still running?  It'd be great to have it run against some of our integration 
branches so I can catch these before they make it upstream.  I haven't been 
getting any emails.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
