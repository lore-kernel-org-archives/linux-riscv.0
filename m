Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D70C4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:57:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7305323BA7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7305323BA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cIg51XhkNXwCoV0WDe8GZi2ZRBp7SPDKpGOu5K4nKMo=; b=eCPGsqPexHH9EnQp/Jy8vpSAe
	m6IlMLHEbExK2C1TjPSMBhQxPN9os5Al7rQWF5D314GMEGtE15V8HJPMXBIi1v766NfTRkqvaP37n
	2wea2JrUKqkdFe/BdOWcaIxMuW3QP4qv4ABs1E+GBTdQyCs5VCvpSyWnyJamswslE51yr3agtE6//
	8sLANbayKcsWe3AkNR36bsDpAw8Qo7diqRaX1ea/jmXCLCwVc4RI5Gz6Bipp2mEN227tCSiM8gAia
	T6WUv0RzB4vHuQjhDY2usfofc8Bin7N0fbGWNrN9JU0hVKaSAr0i970QN+gfMCayKK8IR1zCerN0m
	6Kl6FC7rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knD4i-0007Xc-36; Thu, 10 Dec 2020 03:57:04 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knD4g-0007X3-Bx
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:57:03 +0000
Received: by mail-ot1-f68.google.com with SMTP id a109so3676239otc.1
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 19:57:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G2QhB7f/IZOs0m3re+ypQrxGcEo7MBRtBPMfHjJs2JY=;
 b=Ys4pBAF/CyCVwWhJG6WiCzo9ad1X+6JLjSKLJCC/Mf3q9cn7EirHI9q4fNmIVQ1bOZ
 r/Pv55IcSihlFL0I1Q/W6PZiENQwH/MLWplSGaZORx98Hf60hOnAXklveVS2OnX8MIVz
 M1aSiFHq54BKUZ+TjyBEJmoqKCzHiJDZ11EVye8rleUJMXIUxxne9zYNml3J3KwVBToG
 hKDQ8it5HDwDAMu23ryV4T7tqqcuMtQhrkO/6b1RRAszf0IWpTAoOqTzjG0FGswVVovD
 bqvKlqZrgXfGVd6pUY+CQ+hyLxPjtCHz7SRvd4FcSFEisJxLZSNqRQt7CKgC6Qh3AnaV
 R3Vw==
X-Gm-Message-State: AOAM532/IXtcmsIEqeEHNo7eaUwdUB3bm7BYzvJQVzB9VokVwxBA6Vge
 uZGC1ux3C+thZu2AEt0Zbw==
X-Google-Smtp-Source: ABdhPJyrEEkoAekm6sFmqloN+vJ1XT661Hp+eHwH6Y/W1V4otFUI+Q2hFPtNvXcKQnPU2jb3KbntNA==
X-Received: by 2002:a05:6830:13c8:: with SMTP id
 e8mr926977otq.139.1607572621748; 
 Wed, 09 Dec 2020 19:57:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j126sm756267oib.13.2020.12.09.19.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 19:57:01 -0800 (PST)
Received: (nullmailer pid 1634611 invoked by uid 1000);
 Thu, 10 Dec 2020 03:56:59 -0000
Date: Wed, 9 Dec 2020 21:56:59 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: serial: Update DT binding docs to
 support SiFive FU740 SoC
Message-ID: <20201210035659.GA1634582@robh.at.kernel.org>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-5-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607403341-57214-5-git-send-email-yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_225702_452943_484B3694 
X-CRM114-Status: UNSURE (   9.17  )
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
Cc: linux-pwm@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu,
 andrew@lunn.ch, gregkh@linuxfoundation.org, linus.walleij@linaro.org,
 paul.walmsley@sifive.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, bgolaszewski@baylibre.com,
 devicetree@vger.kernel.org, broonie@kernel.org, palmer@dabbelt.com,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 u.kleine-koenig@pengutronix.de, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 08 Dec 2020 10:25:36 +0530, Yash Shah wrote:
> Add new compatible strings to the DT binding documents to support SiFive
> FU740-C000.
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
