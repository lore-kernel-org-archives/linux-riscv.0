Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66204C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:59:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29B3C239D1
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29B3C239D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lsjIJ6j+F1zpHRQXjAqujxBMI1TkN+36Gy3UvicmLys=; b=YoBjddHgddUwGUQpvxlAmrpVW
	3Z1v2s/F3OuAgJHO5xFHQ4qQDO2PJgCDzHXpGhngrgPNr5Gfc6X+XtAvOVKXnKDcvli95YL1BeGEX
	80Oyz/C5mfGaTltA/ggb1XhdWaPVF1Oke+A8u5x5T9oR5OuMaqkEMmKZnHoeEU3MiEUT5tLqtQnME
	hMuVhrMIjx6iqQlI+oaPdh4WcC8BalHS/gL4XxPtCdmMOrIT6c6JD4/JRFzALGnYq0IsYTFR9DWeq
	8Lvzf72Engrlyl8Z+pUCRUmq6xBVLUmaqtWRHfQ/Ok6K14xFzGivHPjj6/yXCc6EQvm1COU8s1Uxs
	pFDA4APiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD6g-0007zm-Ph; Thu, 10 Dec 2020 03:59:06 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD6e-0007yy-Bg
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:59:05 +0000
Received: by mail-ot1-f68.google.com with SMTP id w3so3652503otp.13
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:59:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xeFPhddnP1lHVDJb4oU9zmV61htXm7Y+iyJ+r1ouWvQ=;
 b=Y6PLCM/+J1mslDXnSiYN61D6ebgZqGxJFGIzphRbMjF9H6dGiTHUsvpYisa1zHLdXL
 k9LK/8wkSXuy1uetHLuEvffLivEPT44OYDq1vht2KrOWKaMEfWCTeeWlRDwh4bFLSThK
 D40Xgqdnjz7QKY05JhkIiMuQScpM0WVZY9qKuWeE5VJpCuQfTznvGnbkxyIif8g9uceS
 PSfZXxg0YZHkvKku6J/PgsP+/6Wc++DoE/mUXJcMsk6ndmaiizYCbrroRmj8tBuQO66A
 3hepIS70UYQ8LvVpsHjOgtX2p4mvj7NxIT+UTrB/K83nziOvLlBxWLZYFHtVivXZyr/A
 bupQ==
X-Gm-Message-State: AOAM53075JssesPXroBYF8ob4OlYsZzuK0t9IPGTwKTb9HTRhPbdIb7Z
 lNx6ss7AVLIeptVt73ZLLw==
X-Google-Smtp-Source: ABdhPJzRhQS/9Ld+qudfJUjE3uPxTeIvJMVnLcQC301yqBZ/QEQr2oAa3pMetwTnxXwrlAquBnVtSQ==
X-Received: by 2002:a9d:2923:: with SMTP id d32mr4329675otb.117.1607572743776; 
 Wed, 09 Dec 2020 19:59:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p3sm842770otf.3.2020.12.09.19.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:59:03 -0800 (PST)
Received: (nullmailer pid 1637499 invoked by uid 1000);
 Thu, 10 Dec 2020 03:59:01 -0000
Date: Wed, 9 Dec 2020 21:59:01 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 6/9] dt-bindings: i2c: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035901.GA1637443@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-7-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-7-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225904_469461_96D1FB14 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: thierry.reding@gmail.com, linux-pwm@vger.kernel.org, peter@korsgaard.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 bgolaszewski@baylibre.com, broonie@kernel.org, andrew@lunn.ch,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 10:25:38 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-ocores.txt | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
