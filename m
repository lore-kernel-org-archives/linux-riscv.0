Return-Path: <SRS0=4kCy=UQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DA5C31E58
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 12:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF2C420861
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2019 12:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5bQBrVj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="V+hvVPC9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF2C420861
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpK78TmvDtImMpk3zP3LBPfJTqJzNzlPw2ui2MWg7e8=; b=o5bQBrVj63yEG+
	M+iVXkB7YDBHYOpW7cwWv1DA5tVgk/VXkhsem1ii8lF6RDVKOkc9Lacn3XfSLCFumGMQUC4/kxEWu
	f86ZLdhAQ9qlipLzRUpNKHjLX3cMt2XO4TDembz7hP+J4crzq/enzIUeOhExPk+DY7gfV8u/U9Lel
	WK9TKwmTMd1inzfvy/nDYPgSjEg3wExHLsDWJdyddqhThUmXbbbt6rBpza7YR6YRRQxGcCpXGRWhF
	FVVfIx4iHMT46h+fU2dkpWrXHhV7gYuxS8WUUHIgC04eQyuHV2jaPrPuqk2MIu4d+P/l/mctciHJB
	Ke0QyyAD6XIOjmt4fYUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcr2o-0003GX-GY; Mon, 17 Jun 2019 12:47:30 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcr2l-0003G6-Oh
 for linux-riscv@lists.infradead.org; Mon, 17 Jun 2019 12:47:29 +0000
Received: by mail-ed1-x541.google.com with SMTP id m10so16007875edv.6
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 05:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sBOmnqBzGhTY5MQZc8FEW9AvweO+IMnekuJP7hJWMhQ=;
 b=V+hvVPC9H+Kt9fiyx6QVFEgTxp7faEr/IoD6YSxAkNCd2XrCBkYPrqBznuQQSJYrVi
 499kIcbaxfbt61dZxluuORxmItShQ/okXrixsRjK0QWTxL0eJU1TEcSJ79XaanNV6XQL
 dpjH9LSHv04blDSS/3w94h2YZSnUrWBR7+DlO1zg4yenU/7NP6+W9mMNXGF0V2ni7jEM
 VgLuybHi49j30D4tF/keecIMUJemrw2ja04RTQpqQSGW/PC3SlIdRagxMfuplRuRejKs
 EAMAAYyF/JH0p/MQw+mWc+GfTetwqnw2UT5g/onC8gt+tarHDDwQG44Oo8hoPfUs/Tmb
 qSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sBOmnqBzGhTY5MQZc8FEW9AvweO+IMnekuJP7hJWMhQ=;
 b=phF6Uqz/xYh0JtgtL5lm5rhEFV6fcsxYQfPKOU0vBqoS8gJQk5BV4QPHFtEuOilA7z
 b9y4fkHnHYx0SgJMYGN9ds6AcvkCUntyozrGLgHPrPor5QuAHxuQNt//1QABGdRaR6pg
 4N57vJBvwU1leOaGouS9JKyeqpwF2A8R6MHLpZUG5O6StGQMAzQpzuXMYX3kBaezJOWL
 53tHaKvoIXLBUpcl/9doEEv3RyrX+FxWoY7rJZkMZMnLNLFuIaOHZtDSWPOWOpxEPN46
 mD17zcBOFiwGLS1jrALV2SzO41jpNiOntFVRDuaMNrDsH72Nnf7YcQQSjZNubm3IA0wh
 GZbQ==
X-Gm-Message-State: APjAAAV8Swo/M2oIUewHfziE5Q+wdfOlIkXWDCe9g6TMdP6FPmBxwfb5
 7xGqRvsP6NU0JZuuJVPVdI2TdqKBx1Y=
X-Google-Smtp-Source: APXvYqxrBKiHzmD3Xcu3YWZ30rdq9vvRnkOZQgnaL+HS0cRTyzck+A4ENtNDaSuww3JhkORl6xlVuw==
X-Received: by 2002:a17:906:7801:: with SMTP id
 u1mr55859326ejm.250.1560775646214; 
 Mon, 17 Jun 2019 05:47:26 -0700 (PDT)
Received: from localhost ([81.92.102.43])
 by smtp.gmail.com with ESMTPSA id i2sm3620059edg.81.2019.06.17.05.47.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 05:47:25 -0700 (PDT)
Date: Mon, 17 Jun 2019 05:47:24 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Andreas Schwab <schwab@suse.de>
Subject: Re: Working device tree for the HifiveU
In-Reply-To: <mvm8su05rqc.fsf@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1906170546100.4549@viisi.sifive.com>
References: <mvmlfy05xjm.fsf@suse.de>
 <alpine.DEB.2.21.9999.1906170347460.19994@viisi.sifive.com>
 <mvm8su05rqc.fsf@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_054727_864247_9422F82B 
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jun 2019, Andreas Schwab wrote:

> On Jun 17 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:
> 
> > On Mon, 17 Jun 2019, Andreas Schwab wrote:
> >
> >> What is the correct device tree for the HifiveU that works both with
> >> 5.2+ and U-Boot?
> >
> > U-Boot should follow the kernel's DT data:
> >
> > http://git.denx.de/?p=u-boot.git;a=blob;f=doc/device-tree-bindings/README;h=2ea3439a170236bd912930991ad70ee7289dcd29;hb=HEAD
> >
> > Thus the upstream-bound data is currently here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=fixes
> 
> That is completely useless.

If you have specific questions or comments, I or someone else would be 
happy to try to help you out.  Otherwise, there's not much that we can do.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
