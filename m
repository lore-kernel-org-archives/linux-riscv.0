Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C252CC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91306205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 15:05:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qmc6luZS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91306205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSWOgz4gphDY8ORD+P85l3X1h38g+zL2bjz/zQl0jzY=; b=Qmc6luZSsv3xf5
	CNQYac2RtKyXHujRxTeEbKcH47Fgti0TK1GBWnZuTRU9Tn/PROYXtWyIzggk2SkkqDPUQAL7bj0oG
	OyJW7n5dkvvNtrPfdZ/8phSgSYiVRoZG8rn/0y3TI0p42GLap0LrN0Ap+wPaoKZok7sGvrP5vNvph
	chx/20tKnclf95D7ACbGDn4uJ5yVu8MxVB12MurkXyjSBKHQqi+sEb6xT+Myd1sx63yREmcq6vPC0
	g2cADk8mLtIvth3v2Lc7TUbbj4Gof8teT7DwNo8sb7Azm3y+kP0hMxKdEsIu2iIGh8WWchW32T+pz
	EHjsikO1MGfWcLPdBR/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH8bD-0005ND-TB; Thu, 18 Apr 2019 15:05:15 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH8b4-00047G-H4; Thu, 18 Apr 2019 15:05:07 +0000
Received: by mail-ot1-f66.google.com with SMTP id d24so1947316otl.11;
 Thu, 18 Apr 2019 08:05:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V7yyMZqesOuFe8KRex8C/Gjge0wo8uE6UhNgDAxEDPE=;
 b=GQmRj9yijdkGczOg+GUFE74YQMDo6KRc+0wCGRcLjmTZKzxIgpT4nI6U0Kt8Iw3OqU
 njYA/b1kuBVvlTxJ1BIN+gX53EKVrdv4o+g4/PeqANbbZi/POGoH6Z9lixCrbYRH6k1t
 GCrtM/8v39uFIAkmt1SHjZIswnFckISWGp2UxIJ8WriK2hgUJac/wpK7SVTE1fqBIhXM
 a0mJBNuN9KJYceUR3KZYuIElW0ZqypeO6xnI+txPqHCxwNWINdt9DYXlGH85byFtMlwc
 qQubTD6/AdOQHVcdgnnXhOWmYMqkome8Ga+fr0g45h+dwXFJ0vn+HmKNmzq7Wrns2Jkq
 mN/Q==
X-Gm-Message-State: APjAAAU2cYyldTF0pyPm0VsIyBBO23KXaj4YweC3R9+gPTneP5Shh8RW
 P4haKNaTXNwOb1P3ShhMmg==
X-Google-Smtp-Source: APXvYqxnX+SqxhzuN9Z90GAVvPB8qzwCECqAfFNDBupi9NMvpguaaL7AqBs0B+hBaW3bOhvztohAcA==
X-Received: by 2002:a05:6830:153:: with SMTP id
 j19mr53931748otp.248.1555599905277; 
 Thu, 18 Apr 2019 08:05:05 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u11sm841311otb.66.2019.04.18.08.05.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 18 Apr 2019 08:05:04 -0700 (PDT)
Date: Thu, 18 Apr 2019 10:05:03 -0500
From: Rob Herring <robh@kernel.org>
To: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: Re: [PATCH v5 2/3] dt-bindings: Add an entry for Purism SPC
Message-ID: <20190418150503.GB32345@bogus>
References: <20190417165514.18689-1-angus@akkea.ca>
 <20190417165514.18689-3-angus@akkea.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417165514.18689-3-angus@akkea.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_080506_573226_22CDA659 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 angus.ainslie@puri.sm, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 09:55:13AM -0700, Angus Ainslie (Purism) wrote:
> Add an entry for Purism, SPC
> 
> Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
