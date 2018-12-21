Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527AFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:27:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E15221906
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 19:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1TfxwAd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Am4bIxoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E15221906
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLGtwji7MudMZZzkE7VNek9HnBTAS0+4cqINMaljdrU=; b=L1TfxwAdbyWCXA
	g0UyFm1GoqYgxPAOVi1PNNBLw3x/1Dy9p6dzWvNuGSL7kTnXhr9iQ8wqc322MlikA8rxLm4iq1PEx
	Ymc461CmUvRf2kWEJGf9Y1p7Fq/6WP2kXUrArpCKt4uyRJ1Zh+gUGYnbRoXAp57PsJt5y2LbowJGs
	+rQWXvXvKx15zEJxMb4S+mn2JO+5R4Pzk79VAWu7tO1qTrlCUZieX1K65yqtuJR+cKHkcLamRjgyM
	bgH32t4rYf3vH0yVThusJGFj3aTaF8JGRrqi/xfmQnKyaNoZHi3uEjmAW6pTxkmcKC7pXBcurxp10
	xUFpSdrqds3fO0SskzEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaQSg-0004Nu-AZ; Fri, 21 Dec 2018 19:27:54 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaQSe-0004CD-3s
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 19:27:53 +0000
Received: by mail-io1-xd41.google.com with SMTP id t24so4525804ioi.0
 for <linux-riscv@lists.infradead.org>; Fri, 21 Dec 2018 11:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rZjr0t7r+0yrFfTECBQDjKIAbla4O7UXrgAYzrDfzF0=;
 b=Am4bIxoUKSMqUVhwRhlo7/sR5IbLv6JUb1lMtOXDsy+4J9b+VUrFS0//M6njQKIi3M
 GcYbfMKlEb+BpXiMRt2N08oB5d8s/1S4lk1S3HscfQFU8B3jdVwGlesDpWjpZ/jy7adF
 RsaG11V9eM6aVLCmeLLmUF8u/n3dJJNYUYRPq/XbX/xaVeXL1dMwR7GV48nL88/ZKSJ/
 4yzNayxiSkKVjQKB06kyRvRWRmZFkCHvCg33XQMGbp2YzzfDLtGLE0+orY1mC8wkG5ux
 Ge2RjFJZ5F1Xq5lEtvc6/ootCWDCZ3bywWvY2PvF4oT5ByRYKxb9ZB3NpWWvLQUR1ouf
 DhjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rZjr0t7r+0yrFfTECBQDjKIAbla4O7UXrgAYzrDfzF0=;
 b=Fevo0Qvh5GvmVeHwmXtvs9EooyoPTPshI6C3qB1SCaj8L5YkbvtcTuRaBc8BcSms/f
 id5hlB3RQ43+dr0PJqYP8YDV0+leHgh1C39DohNhOGuKyb3yk0tZVYdxXMFYTN2BlP59
 MigHVEZFPuK6pz2iJTREAKoJUHI5tkJ2iehhxozmIi12UCRSsjDKTBfvYQPGWniRmbfm
 DGM7iVbsOr+A2VHFycO1dx0wJif2oxc5gRX8llrPpx6S07OsR/D9nj9w4N9pYlO6ePk4
 IxsO/3ehC0p9wqCHLdV5YhW5KDRUvRDLVgFkWaunYTlJhyCiEUaEyL7OSY9oxcQd8UCn
 ydrA==
X-Gm-Message-State: AJcUukcEdcAqLBOaXjzuAkGGy1wLh8fT0r76YgP8K9sGWlK6OYL6FQgr
 hwkCmaU3Bcj/v6EuNVaGTIOYqQ==
X-Google-Smtp-Source: ALg8bN4cHLxcqS2VbI6j1wI964qIPqab1mnS29FQS4DLd30OCQWQiktpcX0qe7BhBD+JbEa2LQEq6w==
X-Received: by 2002:a6b:b28a:: with SMTP id b132mr2513633iof.256.1545420460856; 
 Fri, 21 Dec 2018 11:27:40 -0800 (PST)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 l186sm6411860itl.22.2018.12.21.11.27.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 11:27:40 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-Google-Original-From: Paul Walmsley <paulw@sifive.com>
Date: Fri, 21 Dec 2018 11:27:39 -0800 (PST)
To: Alistair Francis <Alistair.Francis@wdc.com>
Subject: Re: [PATCH] RISC-V: defconfig: Enable Generic PCIE by default
In-Reply-To: <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
Message-ID: <alpine.DEB.2.21.9999.1812211124180.777@viisi.sifive.com>
References: <20181221190615.19003-1-alistair.francis@wdc.com>
 <alpine.DEB.2.21.9999.1812211110260.777@viisi.sifive.com>
 <541e8b85bc2d3010741daadddc71ada52b847b8f.camel@wdc.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_112752_154940_0A6E4796 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "palmer@sifive.com" <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


On Fri, 21 Dec 2018, Alistair Francis wrote:

> When the MicroSemi driver does eventually go upstream this will
> probably have to be discussed though as either the config or device
> tree will need to be edited to ensure only one PCIe device is present.

The right way to do that is to have two separate DT files: one for the 
HiFive-U board alone; the other for the HiFive-U plus the expansion board 
combo.  There shouldn't be any problems with keeping both drivers enabled 
in the defconfig.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
