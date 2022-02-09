Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EE1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 02:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=441Rgt4CBZs8lnlO3juOS21bIxEcv+Z0p0+xwAtuq2w=; b=q5dE0HlJnE2XFV
	zDgQz/3H6kQGQnT9nT82bQQGd2W3VEoH1w+X77ruhCxZL0Y5lTyfvcG31TAouhU4j5CRReuPMdnyr
	UpjogV5+71UmqrnBXgE2dGuRxiElVqBKixEpH6neCqB3W065YHB/Ppyq+I9JKQMSr7R+SwFG9MTcR
	ZFPL5ZuCpVhE+ehI8vZrnNCuT0BHCbJQVX5alSGkWDf2Q+7jEdIUmoWeW82NAK/iNlKRo/WeZ8M9l
	kNvTgFKHswgzALz1tCWC9F2bc2/UU0mui+ri+rpO3i1FBv0lxwAzmOLiA50ryex+gcs3a5yhWT5aa
	ktDKKEd82dzJzBVBxO2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHdA2-00G1O2-3D; Wed, 09 Feb 2022 02:56:50 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHd9y-00G1NI-Uo
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 02:56:48 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso996100ooi.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 18:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YzpZJPyikOSmfz29HT3JMH8XzgvRS7QzufEjx8g74Lg=;
 b=xnEKOXDKa6JN52vAtMfHtS0bHxt1//zS/F5eNhANSDc1tLSeLuazXfI3LmCt6q94vV
 NEstRqRlU2/n82WIhuFYQg7d4KyoTYnlZNm7C+phfINKZ2ELKlIUbK0hw73Je1DWLjTK
 bSaHDNCdm6mocJgVZteH6EXlaPAk/TMQ8DbSUN97p6FkmsilnBjWcWtSjXAypJh8PKTL
 2SRqKE/oYshxtbr6itb5rB9s6jtyJB8Zealb+IvFZGW0an0L7EwSkhrUZ4IvSojQmIgR
 +UuyO2ZgAfCfQ4cv5tjd+ioJDDRFZwGLiY6/gPFn1i74Oz+enxjIPZIJVkYpmdaso/lP
 2j0A==
X-Gm-Message-State: AOAM5314AAwgTQ6WUAq//pYKhcnbpCE3s7Dd09KCS1UvnVbN/EpBkr8u
 ZKgAyrFwg+q60gCYnvAshQ==
X-Google-Smtp-Source: ABdhPJx8V3Vh8nhOYS4sySuQMAt/hoYl9LLCFpXg/dcy/NCynV7bBxJjvdGsbHXMbzDyhHAgT6q25A==
X-Received: by 2002:a05:6870:1116:: with SMTP id
 22mr95514oaf.302.1644375405988; 
 Tue, 08 Feb 2022 18:56:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b7sm6125944ooq.30.2022.02.08.18.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 18:56:45 -0800 (PST)
Received: (nullmailer pid 3530627 invoked by uid 1000);
 Wed, 09 Feb 2022 02:56:44 -0000
Date: Tue, 8 Feb 2022 20:56:44 -0600
From: Rob Herring <robh@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: mturquette@baylibre.com, lee.jones@linaro.org, robh+dt@kernel.org,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: change the macro name of prci in header
 files and example
Message-ID: <YgMtbBdt1RkHcqoa@robh.at.kernel.org>
References: <cover.1642582832.git.zong.li@sifive.com>
 <81d9a152e65374117b633f953aa31f378412acb5.1642582832.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81d9a152e65374117b633f953aa31f378412acb5.1642582832.git.zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_185647_012055_3A1FB8C2 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 19 Jan 2022 17:28:38 +0800, Zong Li wrote:
> We currently change the macro name for fu540 and fu740 by adding the
> prefix respectively, the dt-bindings should be modified as well.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  .../devicetree/bindings/gpio/sifive,gpio.yaml  |  2 +-
>  .../bindings/pci/sifive,fu740-pcie.yaml        |  2 +-
>  .../bindings/serial/sifive-serial.yaml         |  2 +-
>  include/dt-bindings/clock/sifive-fu540-prci.h  |  8 ++++----
>  include/dt-bindings/clock/sifive-fu740-prci.h  | 18 +++++++++---------
>  5 files changed, 16 insertions(+), 16 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
