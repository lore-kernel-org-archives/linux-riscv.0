Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C600C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 21:44:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC3C206DD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 21:44:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJlfPNAt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BC3C206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=72cOaIuwVU1lTVb6BFP2DpQnEgD7o4ilvkT5fRzmOFM=; b=mJlfPNAttpzXwt
	Zl6EFQJshRlNwNz1NJux1nbDNzqottg5iGwIN3hY1pXo0nvO4wikOygEsT1UKl4hhTlgGNXrsvN/u
	WY82yCVxRQNh6cWeuw1/YVxTqTK0YbDQudVXUoas+dTyT0Ht5BbvUtFxa22hV6ZT3zWqUjKOHhSkf
	+C5k6UXuNKGnj321dhgF4rQDMp2tGbkjAf80lUjokhi7Nagf6I+Q1vaGLce9MU84kFljl38DraTW9
	Rh/R7rG21sSgjaKr0sxQ1RNTi18WFmkgTaCsl8utPQ4rNhsAoWHlAYeJdzWR5TD90w6WzDBKJjJA3
	hNb7qd3Iyh1nEwi79VkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK8eA-0000QG-Hi; Fri, 26 Apr 2019 21:44:42 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK8e6-0000PK-Sd
 for linux-riscv@lists.infradead.org; Fri, 26 Apr 2019 21:44:40 +0000
Received: by mail-ot1-f67.google.com with SMTP id m10so3934027otp.2
 for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2019 14:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v/cjsNw2NB4sPUKQIAWaww9R5us1EWq66EYd/vmRR+E=;
 b=NedlSc7AUR6kjPSEMVqZvOAYLW7md/7VFK2pYG34KDcZg8ZMzYoXTLS3VwFCTQIkxN
 146kU3Nf2r4Csx6E715h40ye4LvAUxF4SsMm/rbO/n10GDl1Is0PvPHthcH0EOXqaneM
 QKHDkrIQf1gpFL2vL5fRh2qyV47yTXea43l5+4DcdVON4ckqeSkPakVXqicCPSQDhkw5
 x/rsxVfO3ZW0mX11wYurUa67UYIlOWyQ01T8L/fQeVC2GiVp2Jl+eVOMnK3P1zJb3tRC
 WTlu3DwLRIiu2dD6oXc32uIe/xO3y/eEx73ez2EAwfDq+ca87LSan5GG+MQGhb8+wwO9
 xELQ==
X-Gm-Message-State: APjAAAWV7uht179pCKFU69W6nizsZ3+BLXC3imvuQXEjHEfubDlgeOsA
 4qMkFWz45yfBnoDwDg7eww==
X-Google-Smtp-Source: APXvYqzPSNoMcHwqGgKXwZYQEUCOgGIwLLUpLR0zTjMv9LXIZE0oOPjbbspsIWWwFcX2LEIJqdRiyw==
X-Received: by 2002:a05:6830:1656:: with SMTP id
 h22mr482995otr.144.1556315077874; 
 Fri, 26 Apr 2019 14:44:37 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n3sm10998762oia.46.2019.04.26.14.44.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 14:44:37 -0700 (PDT)
Date: Fri, 26 Apr 2019 16:44:36 -0500
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: clk: add documentation for the
 SiFive PRCI driver
Message-ID: <20190426214436.GA29815@bogus>
References: <20190411082733.3736-2-paul.walmsley@sifive.com>
 <20190411082733.3736-3-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411082733.3736-3-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_144438_926344_1CC020C1 
X-CRM114-Status: GOOD (  12.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Stephen Boyd <sboyd@kernel.org>,
 Megan Wachs <megan@sifive.com>, Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 11 Apr 2019 01:27:34 -0700, Paul Walmsley wrote:
> Add DT binding documentation for the Linux driver for the SiFive
> PRCI clock & reset control IP block, as found on the SiFive
> FU540 chip.
> 
> This version includes changes requested by Stephen Boyd
> <sboyd@kernel.org> and Rob Herring <robh@kernel.org>, and
> fixes some errors in the initial version.
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Megan Wachs <megan@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../bindings/clock/sifive/fu540-prci.txt      | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
