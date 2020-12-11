Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA1AC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F6223ECF
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 03:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F6223ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9ti1roTejyEQIm6TRLoViPPEoNIH6xycc235YT0XnyE=; b=Ff2yWix820DMsu3568+yM07cg
	+w+83A5wPDTyqMGEFe04iFsuQbLdyR7A/gVsYSuXMcNM3ApjVk7Q8lV9vEzN88sJmXfeiFJYRFwVc
	eRDria0ZxdBO2jrRQ3UlwYX/95ncpyWv2cnWkdxXI6Xk79ASASHomS8mq92mvvTfK7mWsZk5AIUOq
	++C/5r1O5ovxsfwJNPA4bbreCf8wLLxk8cevii6p9vZAgW2f/QCB/7vd5yKlHGOsnc3Dq+RmJtry8
	bUTByNcq2JYx6Qt/w379VfWI7lBy3bZZBLdOBqER9VMEYZ06iQ4/f7dFmi5tToVofJD1z0+R5XXoP
	vxdufpPPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZQU-0000cC-3a; Fri, 11 Dec 2020 03:49:02 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZQS-0000bd-8o
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 03:49:01 +0000
Received: by mail-oi1-f194.google.com with SMTP id d27so8411179oic.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 19:49:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3McgcBv8ESEG33InZOQDaTlem2TeE/GLKiQ4C9uzn/A=;
 b=Wc/9EgZTe37vsEBfHP8A6bhAMbZuumHRuk03/NFqGwa504HEHY51z3+EOMS9P0C3Ln
 b/M8qsw4GjGjMcOuB6g/dOCwvuLMjxLkfr4v2aQW8lAuhxAT7zc7T+bDvyXzCHM3tvmm
 Dm4FdtdEvYDkCeUEjJ9ez3oZmN0WiwCUXpyvwXQysbaWl8rYDOa0eTeMbRNozpo9ri9X
 s8HuwM3HQAL+maeGYtxIhNhUG4cT9Z3y3PLv6WIitGVBwTydEaOkZ0oOcH3mZwLDwtNw
 JjI1KvqSTRxGNteujO2RzBoCDJv8tAtCkyW3xI91rOrMYIgEsk8cUBRnOYo9RAH8QTtM
 Wlww==
X-Gm-Message-State: AOAM533cJgcGyjILsyb/fhqb1mOsoTf6Zf8b5VfxPYywIue10gI39CFM
 uf5ds0xHB9hSWH0e5nNlKg==
X-Google-Smtp-Source: ABdhPJyiwnqbveudWzcxrdkxeagwNPArCWVOrt+3GJAQhkSW4Su8Ry7eunPOu7EysVJMusIKuW5odw==
X-Received: by 2002:aca:c057:: with SMTP id q84mr8006359oif.86.1607658539729; 
 Thu, 10 Dec 2020 19:48:59 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t19sm1675394otp.36.2020.12.10.19.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:48:59 -0800 (PST)
Received: (nullmailer pid 3606354 invoked by uid 1000);
 Fri, 11 Dec 2020 03:48:58 -0000
Date: Thu, 10 Dec 2020 21:48:58 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v8 09/22] dt-bindings: reset: Document canaan,k210-rst
 bindings
Message-ID: <20201211034858.GA3606290@robh.at.kernel.org>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
 <20201210140313.258739-10-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201210140313.258739-10-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_224900_337021_B7910BF5 
X-CRM114-Status: GOOD (  11.69  )
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

On Thu, 10 Dec 2020 23:03:00 +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Canaan Kendryte K210 SoC
> reset controller driver in
> Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml. The header
> file include/dt-bindings/reset/k210-rst.h is added to define all
> possible reset lines of the SoC.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/reset/canaan,k210-rst.yaml       | 40 ++++++++++++++++++
>  include/dt-bindings/reset/k210-rst.h          | 42 +++++++++++++++++++
>  2 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/canaan,k210-rst.yaml
>  create mode 100644 include/dt-bindings/reset/k210-rst.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
