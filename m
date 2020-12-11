Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18900C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:48:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B71EF23ECF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B71EF23ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RQH5wGOd0RbsQeiVAG3Xw+Ms/EMkyK7LwQ8M2tN4Cbg=; b=syZROaBt44PZeHEKpgU3HHSvC
	5gXxOlPQ3q+0ZHTMqfBOMUyUhXa7ppX6GlUUaJWk19LITFOU1kYfkfSQUhH8f8ObPy3kTOH1mGyMM
	Jb37SRbvt/gkRuoG3tkQiam6s8ahPQx+dg9QMoqxjr4noREg4DSE01FiqkREOtomPIroZlVxy66pp
	Mr3+RlZSitEmC0TMngT9IFSbu+XWjGrrMkr76l34PQDqvOzAza4sfvc6jLmxc0ayKtkl5sYzJI9kh
	xvPPL3JsZwpvrmyoTP2w/OS1oGG/7LSfILOGSGLLsch+osp8SJT+qoXysZFjc6Lh28Z9XZpUZ3ltE
	Lx1jGeovw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZQ2-0000Xg-9P; Fri, 11 Dec 2020 03:48:34 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZPz-0000Ww-OT
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 03:48:32 +0000
Received: by mail-oi1-f193.google.com with SMTP id s75so8419054oih.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 19:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=642NAFsM0Lm5NS4AR+A1xpLH9spPHQSGMiEFOam3eac=;
 b=awvu1VsC2gplGUeCDmRllSv7R4lsV1X/mEGr1/plaaZfO6xScfawC2A5Rv2jEoomrb
 w6JQnwm6WhiG6FtyVNAgO+u97XYGCm8uoOaVlDnI7JcRWq+p8BxfYnRDoGvsUsNHb4bm
 9uonwgzk4QAuUgd9F0zUHu/nEVPb40axQciXs8hINbVqXeZbtYz4uOjDUDwENMFpuBjA
 gWfEFsUJSi0SlWcaPGT9ryS6JMNs1f+UMyO8nfuMt7fXEy2ukA7spkN43nrcPSmfUcDI
 HN0KFiH9nl3u32G79+C4Kfl7quDs3V/fH5vVQsO7WddR88Jtd9VeS/Ca5ck0FcGSupxt
 gZBg==
X-Gm-Message-State: AOAM532XkEy//H5JlV+b26iwhU2Y4CnoFIMj2C+aeURnteJ0l7UiUTFv
 w+dfZaX0YoP6O/alKQuI8g==
X-Google-Smtp-Source: ABdhPJzK6K/JR3NZDscKKog+CNYNKX1X64mdTRsqyujifV+OLcuq/d6SRPjqAf/GnjERQEHVBGtHqg==
X-Received: by 2002:aca:5711:: with SMTP id l17mr8030800oib.53.1607658511294; 
 Thu, 10 Dec 2020 19:48:31 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m81sm1514470oib.37.2020.12.10.19.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:48:30 -0800 (PST)
Received: (nullmailer pid 3605578 invoked by uid 1000);
 Fri, 11 Dec 2020 03:48:29 -0000
Date: Thu, 10 Dec 2020 21:48:29 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v8 08/22] dt-binding: clock: Document canaan,k210-clk
 bindings
Message-ID: <20201211034829.GA3605540@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-9-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_224831_811440_96B052A7 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 23:02:59 +0900, Damien Le Moal wrote:
> Document the device tree bindings of the Canaan Kendryte K210 SoC clock
> driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
> The header file include/dt-bindings/clock/k210-clk.h is modified to
> include the complete list of IDs for all clocks of the SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
>  include/dt-bindings/clock/k210-clk.h          | 55 +++++++++++++++----
>  2 files changed, 98 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
