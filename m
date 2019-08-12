Return-Path: <SRS0=eWHs=WI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29767C31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 23:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1382070C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2019 23:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0Q4o9be"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1382070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NH6perXVVOmErxNzIv0j1wLVN8U8FR+F67Pd9KDkMB0=; b=f0Q4o9beyGCgKh
	eB3WFixxSEW7/bOW+/lfMTnguC66DIYANTFinDaEYRaSDMRN33wf7AS8filWuSR8j/yzVph+l/rkB
	cbUBFeyTqJ1ffj7iSvbUTHtMyuayg23C6DHDYu3krCwzergpxzlR9qhxLFYsPXsji/NaCBH8PdZcG
	I6UCZS1Rm3KkW3UgztmzJA6OMNeaTdWt/kAI5r93HeutVPwOnGLhRK/2C28scgSrEWGox0XeOdGhs
	uLqPIxHRm4g1jIZL/4lAJNcVYXD088kTeBBGGIGqeqEyUeRsL9aTvak33C0/sE78lW+5CkOkoO9Tl
	8iIFPSVjW27bc1QTcSuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxJox-0005ey-KW; Mon, 12 Aug 2019 23:33:47 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxJov-0005dg-Ha
 for linux-riscv@lists.infradead.org; Mon, 12 Aug 2019 23:33:46 +0000
Received: by mail-ot1-f65.google.com with SMTP id e12so21358177otp.10
 for <linux-riscv@lists.infradead.org>; Mon, 12 Aug 2019 16:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6bHPaRFqcGhFSYUdTz5B3aFVwCZHpxAG97JWTvxVzw4=;
 b=UAXmf1At+qPUkOJFmEpqz5l0BJHDBE7TU5hqamQjPXDJ4HcRX8XkpMzMrgotC6AUeZ
 6DVWc5wuW/v6RWG8H1PFC90o6wXhHpMTwwGrm7zfsk8yY8hkIICEOAJB657A93DkrzC6
 UKL3n8nlKBC+wyg9yjKMLuWdCHfenpD1O0RMc4GG7PkTbILFz0pDdlPeBs+Sjk/EvwPN
 /n+s9oI55awHgKSR4XHEHC7oCg9RrMCoNYRzjdGHDrkXmaWlRvbVQnjzxSHsNcbz/pEm
 /oybqjtuoJPufw7vU+aOdmwoNsMrP3Uug6pCsecTtVQ+CqTaS2hvMV84JeK+3U6FbBSH
 Bb6Q==
X-Gm-Message-State: APjAAAUYu0dOo7OcTTVoCqpamHkypJgHDEKura9AejOMP83JHzFvT2Te
 jrSXs0SmPQk/bOHg87RGlg==
X-Google-Smtp-Source: APXvYqy3ZSrnRg/dFnQxSBrlzzSsTNYNgx3mdXJ+vCQqb4BGoMvGyIn1a5u5is1I31VBhSAA4zuGag==
X-Received: by 2002:a02:1607:: with SMTP id a7mr1317294jaa.123.1565652822829; 
 Mon, 12 Aug 2019 16:33:42 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id e26sm84364347iod.10.2019.08.12.16.33.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 16:33:42 -0700 (PDT)
Date: Mon, 12 Aug 2019 17:33:41 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/3] riscv: dts: Add DT node for SiFive FU540 Ethernet
 controller driver
Message-ID: <20190812233341.GA22016@bogus>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1907221446340.5793@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1907221446340.5793@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_163345_579270_C0B4AA6B 
X-CRM114-Status: UNSURE (   8.75  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 andrew@lunn.ch, netdev@vger.kernel.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, nicolas.ferre@microchip.com,
 sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>,
 sagar.kadam@sifive.com, ynezz@true.cz, linux-riscv@lists.infradead.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 22, 2019 at 02:48:40PM -0700, Paul Walmsley wrote:
> On Fri, 19 Jul 2019, Yash Shah wrote:
> 
> > DT node for SiFive FU540-C000 GEMGXL Ethernet controller driver added
> > 
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> 
> Thanks, queuing this one for v5.3-rc with Andrew's suggested change to 
> change phy1 to phy0.
> 
> Am assuming patches 1 and 2 will go in via -net.

I don't think that has happened.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
