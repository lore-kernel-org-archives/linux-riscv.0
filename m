Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62308C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 17:01:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3097E206E0
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 17:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CNn+ovE/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AP439BzA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3097E206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLK43aw8Xhy4YLDoIf6uV4MUukNloW4HmO5HtvhVckE=; b=CNn+ovE/MJf5vE
	9WP1Ez3WaKJ5KYxYSzJx6hrAWES3o/mD/kd53d268BffBlwODBXRJ5WSSunds60RBbSiOxet5ecs+
	Q1Mjd6wK+WL6zuuTTC+UBTbrLiXpMd2fKtN3nG24G2pBUaXhJOb/ackeV/j4lnTY5bSq4sv6M3Vyw
	IhDLqVpizX7HpfCN8dUxEvhuctECimpuuhHVXQZ4Bup/0j2/kD2FRICMW1IxOAjJD3S2X2iF24o3C
	ikiSdSHd5IHYWqZEVjKmM9WBkVG2vtw6NruCYv3xsR4cISkCtZfDCsu9Jrl90MQ+cB1DWv/30WnW+
	oGB53feTD0rXO2c/e0Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK4E5-0002vm-C5; Fri, 26 Apr 2019 17:01:29 +0000
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK4E2-0002vJ-Hw
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 17:01:28 +0000
Received: by mail-it1-x144.google.com with SMTP id z4so6976545itc.3
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=zDIZQ9ehjNOQSUbZQgzdpHMfF6sVsj/oslNkVq4cSrY=;
 b=AP439BzAHjJKyAid09DT103cdZDtF9UrIhHFn2Pt44VgL+IbSW15o1KwPQqYNy0LpU
 qLX7aOtbMaw2JewrDg2e/3Cdx6kVRMmzV8PkU0p2GGinJ3rpWbP5/UyllZzF+UsH5OMk
 D0wnOFHTOTklPo4a1dsAGd2yKBJRY73MIYrYcfkxG7LN4KvVdobuEjVJbc4wF4YK50kN
 LSGSeS1o3FNENzRPgB2SXAFCcmrN+rXz1PoFZ161N6+EL775INq8o06VvLJrJw7LhktX
 3Ho0hpz3NcIfZrnncbBYxLN0BhGsJ8Kwq08/YbeudM+isW27iJaOBO4bXzk4a+hiJqGt
 3zHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=zDIZQ9ehjNOQSUbZQgzdpHMfF6sVsj/oslNkVq4cSrY=;
 b=LBBnb7rWVquthFVMZs7vXO4xqc8FFZliRRNXjnS2XTE/oxlDsN2RKn797QYck+XKsv
 MTJpJqV4uVN93Z8v9Fd5MBH95ZNj7okTat+VMbRRe9uHjPdFShJ+SENg+7OHxQtt/Hug
 T/2jfokYTMWdC7hsGxzsHVdCslKwcU19qfbg9h57dDHaEOa5WGrzIF3Z9yYQ58fCFN5o
 DmhCooX/+Mbf0GIi4Cn4+nEoL51dv6SV5PPlMYiCJl5eJG8guI0ZlUZvgwhQDJMzuPSx
 i/rI4Ec3yCsAICDawQ1QwpYIwQ/ZyS3zJ/KkCwnY9tcCCTNnIpWbFR/mETaXhEGXbV2N
 yj9w==
X-Gm-Message-State: APjAAAVnUUezqL1aDJOv35vWk1DY7R0FE0mRqTrmB9MeEft7LfiOIPx8
 BSAkyrQDrcA4d+6PudOe8HaGcA==
X-Google-Smtp-Source: APXvYqwbG6fHNL5fErzNNkXgu9Hs1MIDmYaGtcDj67ArLLjXDisa5LhrqDJcfgJBSkXwyuFQoNwpdg==
X-Received: by 2002:a02:5143:: with SMTP id s64mr32790119jaa.54.1556298085393; 
 Fri, 26 Apr 2019 10:01:25 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 n15sm8746976ioa.26.2019.04.26.10.01.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 10:01:24 -0700 (PDT)
Date: Fri, 26 Apr 2019 10:01:23 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and
 PLLs it controls
In-Reply-To: <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
Message-ID: <alpine.DEB.2.21.9999.1904261000090.28496@viisi.sifive.com>
References: <20190411082618.3502-1-paul.walmsley@sifive.com>
 <155624271876.15276.8637203698438742304@swboyd.mtv.corp.google.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_100126_600736_4A604749 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: devicetree@vger.kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Stephen,

On Thu, 25 Apr 2019, Stephen Boyd wrote:

> Quoting Paul Walmsley (2019-04-11 01:26:16)
> > clk: add driver for the SiFive FU540 PRCI and PLLs it controls
> > 
> > Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
> > some device reset control for the SiFive FU540 chip.  Also add a driver-
> > independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
> > the PRCI driver to monitor and control the WRPLL instances on the FU540
> > chip.
> > 
> > Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
> > open-source FSBL with a mainline-focused DTB.
> > 
> > This third version incorporates changes requested by Stephen Boyd
> > <sboyd@kernel.org> and Rob Herring <robh@kernel.org>.
> > 
> > This patch series is also available, along with the DT macro prerequisite
> > patch, at:
> 
> Can you please send the dt macro patch along with the rest of the
> patches? I can't apply these patches and build them without it.

It's upstream now as commit 6ec4bae178d8 ("dt-bindings: clock: sifive: add 
FU540-C000 PRCI clock constants")

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6ec4bae178d8a1e9814eb3bfdd321b0475de0468


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
