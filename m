Return-Path: <SRS0=QxaH=SI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBFAC10F06
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2019 06:31:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EDEF2186A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2019 06:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sb5SBSL/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZQ9bJIkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EDEF2186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Subject:From:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=a1inn8tOgoKmUm9so1drWrhv0aLP9CsUMBaKUM1qgOs=; b=sb5SBSL/Nbw2u8Tgm9KYDXIEsE
	HOOas++bHl5sbGZyiMWoo/EhldWo2QZG6dcb0qYFBXHFln57SYktoqPuIEYRCJsXOQrFF5KOySems
	jgE1+PRbgQklgaXkY4z4cwagBOFfEQ5bcDr7pIuDtqsntuQBZGpYnF8XSJu/5v649Vd7eHP08QBkr
	tW7XE6Dn9s/bwF+uBlBM837eFyu3rx0RJTMEKZTE2RfDI1ARgD4KC6HAp1QB6yZ1WWkFWLhQ74y0E
	BMEzWd6LOQyDJehuvJHk8JzcC3YmQMLjKAz2nUIER3D0WSbe/LFdwav0OXW+sCgxx+2EPXKmgSDJ3
	GgKCvkfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCer1-0002hM-St; Sat, 06 Apr 2019 06:31:03 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCer0-0002gv-Bt
 for linux-riscv@bombadil.infradead.org; Sat, 06 Apr 2019 06:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=To:Cc:In-Reply-To:References:Subject:
 From:Date:Message-ID:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lMrGUMpIFkbuBZrg6UX30UvKLSPJJuml/SeHu52b0CE=; b=ZQ9bJIkSMgZvaK+NuQ4wJdL7R
 nVfhqU+bLWRLTIyLI4bh7fFHPdz++ZOxSHAFVG1pKifb6iWXaXXrvlYFuWgmGPh9A2DC9hBtZHat3
 U+N5H4F+El3OBuKsKgD6CoPBlUiGDUhklnO7aUIbTrB2iri9Jcn6N2kO2ymTehNoDP8QwzJESbCub
 W51VN3XH/gS1mmYu7bk45m/eONqRso8g7wT4WJiDNUkIA0HMXtlajb3jEvdkFHh41xhsjP/gMpvjZ
 NFT7/LsARvEDbieqkIbyiG0jUj93PbO/l3L9TyiBg1ZYyScHZmA0kLwpq/u/qs1tu1BiUUsEjOUW+
 WXTodsh1Q==;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCeU9-000276-51
 for linux-riscv@lists.infradead.org; Sat, 06 Apr 2019 06:07:27 +0000
Received: by mail-pf1-f193.google.com with SMTP id i17so1326139pfo.6
 for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2019 23:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:from:subject:references
 :in-reply-to:cc:cc:to;
 bh=lMrGUMpIFkbuBZrg6UX30UvKLSPJJuml/SeHu52b0CE=;
 b=UNCyyODez1BRXcHzQ75zlYGH5fqc5ZWE8ONtBgT5mUITMXqurBmnRiE0akj5dQGD8j
 rCjyX3pyKWgTwDEa7DQpVH87mRSY/WFDRhZwHFUQ5COcPSs+iDIHTag1Rb7+1YmZ8FW0
 5BrnjxzA3HL0KFmC/EF+43UX7JfQru23RWHcO60aKM3Mm0RSZ7K6ZFNwYCXBoSyyKSLb
 Whq45wfEW/GYhkax2KsMwweSorxyoh3sDpW7JeAv2f7Os1DT9rGvQXvR4VqQyd1lAF/J
 +lK/PClKyCXiChDr6tcQ9tvmL1k8H13+fp1gVYmPyKafepwi/jijb0ifoCK7CiZD7Bxe
 M9ew==
X-Gm-Message-State: APjAAAUjBWiWjvf7X5/IN0KFu+Cn7tglH/jsVceBA3FTdDMJ5R5732pl
 QehDBhBPt8ZAzghcfZo/aA==
X-Google-Smtp-Source: APXvYqx7kHRPgRNWQt+YENR3PhZcrTQKq9FAPILeRhkzvBL5PHlfHyigQcVGOk5mmccPpUTqsCk6yg==
X-Received: by 2002:a65:420b:: with SMTP id c11mr16357089pgq.24.1554530843237; 
 Fri, 05 Apr 2019 23:07:23 -0700 (PDT)
Received: from localhost ([210.160.217.71])
 by smtp.gmail.com with ESMTPSA id 10sm32524973pfh.14.2019.04.05.23.07.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Apr 2019 23:07:22 -0700 (PDT)
Message-ID: <5ca8421a.1c69fb81.a620b.5a7f@mx.google.com>
Date: Sat, 06 Apr 2019 01:07:19 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: sifive: add FU540-C000 PRCI clock
 constants
References: <20190404003820.10679-1-paul.walmsley@sifive.com>
In-Reply-To: <20190404003820.10679-1-paul.walmsley@sifive.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190406_020725_302658_6978AD22 
X-CRM114-Status: GOOD (  12.72  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wesley@sifive.com,
 palmer@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed,  3 Apr 2019 17:38:20 -0700, Paul Walmsley wrote:
> Add preprocessor macros for the important PRCI output clocks
> that are needed by both the FU540 PRCI driver and DT data.
> Details are available in the FU540 manual in Chapter 7 of
> 
>     https://static.dev.sifive.com/FU540-C000-v1.0.pdf
> 
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Wesley Terpstra <wesley@sifive.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> ---
> Rob, Mark: this patch is a prerequisite for both the FU540 DT data
> and for the FU540 PRCI clock driver patch series.  To prevent one
> of those patch series from depending on the other, I'd like to ask
> Palmer to merge this patch in one of his -rc pull requests.  Could
> I get an ack from one or both of you for this purpose?  Thanks.
> 
> include/dt-bindings/clock/sifive-fu540-prci.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sifive-fu540-prci.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
