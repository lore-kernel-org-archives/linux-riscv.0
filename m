Return-Path: <SRS0=kC5X=GJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747E2C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 01:55:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109922246B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 01:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109922246B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ALgQKwoCRVeLZWZqfS8mG4ySx0gRlpW62KP+rUQrXfc=; b=jumKEF4+G8ykgTtozjo9x2y9J
	j3PEzBQIvpUs2+k0cP506Lm/Q8gg3suQvV1k+MvZCtaMhed+LvOKU0RBa8TiaikeSJw98DvWymIDd
	6GXsbNm1HRPHygjih4U2/tu2UkXrAlMBdn9kNPA8qnbTlKzfCt9XTLjCvq2djsOTtTMrp6pKpdiwz
	FjU2ANrDvJBTxzsBrOahd40IOudN5uIKv3DlZzdCJzF4KjbcOaNsgcgNc1nBOsc0LH1fktzKgxFs9
	9mygKnBRqZbI30VBk72Wes258/HONrmW6Ivo5+qRJGbubFNwpKum+cyc7MA1ZP4j2CXB83NvV3Jsn
	pLjtGZW4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwy35-000425-81; Wed, 06 Jan 2021 01:55:43 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwy31-00040p-Hl; Wed, 06 Jan 2021 01:55:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id y8so752133plp.8;
 Tue, 05 Jan 2021 17:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M2SnuavxPcXUJasCexKnjXWwhRBi46twzYFZCFVtxIA=;
 b=jaDmkjxUvv933vnXaE4le+w+4C0Bd4foHxhGcP6dcW/tNQyBdvdC1uMwWxXqUJtanL
 h/JnWWeoprKpQ5HR8NxHvwUySBVL7w0jELn2jUrKjC7FlK89tbyez+y1IiScIIvPhxc8
 AiXvSOYqXH3Np15o8MSmUnThKxABfQxLT4vZq83I3lWVJISw1kh2vfPKoNvJc1xvaOJB
 fEPXTm6XgOztjw7QJS08uxTdw6zqn8T3nnquHMHqFjI5ukqv+HRTwSJmCpQOx1bV3Xkd
 NG2cHtrZOP+7buEgNt6n5rNGFG8hzxitWbJV1V3FRmCJPCs/DS99SJmJmqTU06qHid4e
 DJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M2SnuavxPcXUJasCexKnjXWwhRBi46twzYFZCFVtxIA=;
 b=aXbv6A7YEsibRyLF3siIf6hj34htFb1kj5dhXsvzvePTNgSxQhUVr2oXFabWvMurJe
 4dd6t9Yi5DqN0nUua5Hd9i+0TJUEQwWOJkUmDw2Gw11sb0A1AXls8G/j5JBVoM+Fmdzk
 vVtZtSa0WszOPk3YOzMgcGgIwYwbdpby0SGzXJ21G5YmRCpKVQ/dImp6oScPmlt6DP0o
 J/B4FgFgBMQ80A/37dUAhouKfyAUmsb5ACw8YI2aYeFRHPrTXYTBhrpKuOq7n7GRudqP
 wm70YGA3VmQXTDhtxsQRl4L6zvjCIZCEEMaZMI8UJSBDTRsOJJa0qHZ+p/cVimOeCG6p
 HFsA==
X-Gm-Message-State: AOAM532b4/ltH0G3JucbtYjL5axAdohCFoZ3cvDL1pPvgpwvdsS3MlWA
 2bc09qyZkAK7P5hW7hmPT2c=
X-Google-Smtp-Source: ABdhPJyBKCiWl8KqpA3d/9qhuLzYJM2/8URZ+PH/AyWme2ojcsE4nRsA6SZa1w/6+Y6vqjUiBP87Hg==
X-Received: by 2002:a17:902:6e02:b029:dc:8e14:a928 with SMTP id
 u2-20020a1709026e02b02900dc8e14a928mr1938073plk.24.1609898136435; 
 Tue, 05 Jan 2021 17:55:36 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id gm18sm425052pjb.55.2021.01.05.17.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 17:55:35 -0800 (PST)
Date: Tue, 5 Jan 2021 17:55:31 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing array size constraints
Message-ID: <X/UYk4RESSfjCIPI@google.com>
References: <20210104230253.2805217-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210104230253.2805217-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_205539_646305_D8A9D29B 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-ide@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org,
 linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Marc Zyngier <maz@kernel.org>, linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 linux-media@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 04, 2021 at 04:02:53PM -0700, Rob Herring wrote:
>  .../input/touchscreen/elan,elants_i2c.yaml    |  1 +

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
