Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92904C433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1046264FBA
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:48:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1046264FBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OwxLyqaVBUITQqnLjah/Qj86jcHRLIGSe5TM3wi8BXg=; b=IE3BHuUtm1FZk5aaGi17GcB/X
	i03POiDmlrYTGzhoo41YF9PXhwJBSPBWN4rfOUB+SKwlGSBhxz4ixu+R9MSuzL/HjZewC9qi0hJ+D
	44ZD92J9vGygiYXssEd3cWKet7E4JnxaNNgmaSI4XtjFsy3SsWtW8NnLuP3+d6Ahrf2x7c3m7KqJd
	QgSkH/qacM1c7pyCRHKjZOAq0fejpFLmbJD+c4ZydOH4XxFvTysQC9xna9YQj8u/tj4jEzU9uxTmF
	ukooue+kI6pVSHIRvbCHvTPLhWk2HKZbuQigHvb9ou/R3lvNFjF2hvXtlqTR4YfgsyxIRUFoMNp5v
	l2GFa310Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l875T-00045L-Ku; Fri, 05 Feb 2021 19:48:15 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l875R-00044i-9I
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 19:48:14 +0000
Received: by mail-oi1-f174.google.com with SMTP id m7so8694776oiw.12
 for <linux-riscv@lists.infradead.org>; Fri, 05 Feb 2021 11:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yG4/2XX48TNp08W6kCqLIKcRYozTH8MNqDdsxx8JohE=;
 b=XN7LmpyFFg1Lax4XDEMBcgyJntl0fF0LUJKhBV8xAV70sDSy6K1TDCs2Euclxc25Ma
 +RxoVy2udKbWlU2eXpb/HXYGsim89ScDvMU1e6XgaQIH0Ao8Z0qyROrH0kLYB1RhEd28
 9aX5skZGGCZIbMzOye7oRnCQvP5FKp8Mp61HLmbhgti5kUjgolCmeu8aaKNAs3TvTxuL
 mBqrxAuPAnIKRBWRhlrRkeV0zXTViujql/0rmwf07ZDfnGwv/QrRq0uBTWz40909k0Fg
 HUvOofSMQNX6IOcjoG1kNxrit2BZvwJh5+X7TtYLAwehwVVNH9oz6MGr8/84gasYDZ3J
 eezw==
X-Gm-Message-State: AOAM530ay7WtuuhEV0ounn+B0FO3HgU5V7KFw7UFoD6p90eyB2gg+aGR
 tD+HekWkXH+UM2Yasbhd2Q==
X-Google-Smtp-Source: ABdhPJyq2llrZxGJWZeWVtFt2++exLjxoaXNtYT1m+2J3VDc2a1XlypE7QvdVzN1nj8Yz2U0KAAYGg==
X-Received: by 2002:aca:3bd6:: with SMTP id i205mr4143845oia.82.1612554492378; 
 Fri, 05 Feb 2021 11:48:12 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p12sm86690oon.12.2021.02.05.11.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 11:48:11 -0800 (PST)
Received: (nullmailer pid 3599153 invoked by uid 1000);
 Fri, 05 Feb 2021 19:48:10 -0000
Date: Fri, 5 Feb 2021 13:48:10 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v16 05/16] dt-bindings: update sifive clint compatible
 string
Message-ID: <20210205194810.GA3599114@robh.at.kernel.org>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-6-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205065827.577285-6-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_144813_356259_C1969B37 
X-CRM114-Status: GOOD (  10.05  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 05 Feb 2021 15:58:16 +0900, Damien Le Moal wrote:
> Add the "canaan,k210-clint" compatible string to the Sifive clint
> bindings to indicate the use of the "sifive,clint0" IP block in the
> Canaan Kendryte K210 SoC. The description of the compatible string
> property is also updated to reflect this addition.
> 
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/timer/sifive,clint.yaml      | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
