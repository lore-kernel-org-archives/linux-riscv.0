Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE7C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 20:51:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002B2176D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 20:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YCfI8nPV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C002B2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nSEj6kyDhq5P6mAclRcvCmoF52iAZQnMbrNJi3sF4JA=; b=YCfI8nPV3u2XX1e9elBl88AEY
	nO9ZbAMq7JvOb4LOGIfamd8OVpx+TXjUb0l8dvM3H6KvqtWxLTP3r2x9g5OpB9Jxi/mNAUH+ZC3XG
	wuBckfqjj0kaj/XEhtJKRjGhsUUj/8gpevN96uHJELlSAfHXTJ678pCAowWV9ZeN71vyc6+Qvlefs
	iL93ok1TDI2+KdWIynC1Ez6Iy8+AwYYC/wjT5pjn3u0VQtf0Bigzd30I9LFS+OwrNzVfqPbcfWvNf
	oVHcwxp3ktl3V1VgcPMfnTINrrGinBlatz8a84v4xaVgd0NgeJNpts3MihjMfcPKG2nXyFALWyQcS
	Lv0CHfOtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihgHy-0007QJ-T6; Wed, 18 Dec 2019 20:51:22 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihgHw-0007Pc-Ev
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 20:51:21 +0000
Received: by mail-ot1-f65.google.com with SMTP id c22so4056482otj.13
 for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2019 12:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nSEj6kyDhq5P6mAclRcvCmoF52iAZQnMbrNJi3sF4JA=;
 b=PJ2sSRxBAhhGY92dcPTE5gk+WBpSGqVuVt7O9uYLj8hlSXCwf2g/w+Q6y76S/nvXgs
 2Du2pDaYVowY8cz0Y8gTCwVlRU7V1hcJ0EuwKVOiSpweqtAklLzEqcTwN8x6hBa1oaew
 9u+3+1dP9RDA1KepQxXCi2iuqXH6i99qSVXjh1V8b4VPYa2myNhN09gGWmZ8EhzKehhI
 SCTq8fbzoT9Ji/WcCZlyTz2LipGofU0teXgxwGsSwvZjw1o8acrGDOmRNo0OI05MkTsU
 YdQ3FPXDg6+FzoGdcgX2DY1sm0ct4SMJXiNnYms6cWA7QU2JUjp/Wzxlzq/yhwJTS/4R
 vh9A==
X-Gm-Message-State: APjAAAVMP7BTB0AXhaG5/7+EhXhBYt71ZAJ9oDzrjGQubIMVz0BLOEh8
 P9lLLPF94efibS2zilti/Q==
X-Google-Smtp-Source: APXvYqygAa2pY0RW+kCp3G3EmR9J+pePpjjBE3bTxuC6HQw9JYgh4wl5v+3NVqjlcimD0GHFuRxY6A==
X-Received: by 2002:a05:6830:605:: with SMTP id w5mr556250oti.79.1576702277913; 
 Wed, 18 Dec 2019 12:51:17 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e6sm1215390otl.12.2019.12.18.12.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 12:51:17 -0800 (PST)
Date: Wed, 18 Dec 2019 14:51:16 -0600
From: Rob Herring <robh@kernel.org>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v4 4/6] gpio: sifive: Add DT documentation for SiFive GPIO
Message-ID: <20191218205116.GA31691@bogus>
References: <1575976274-13487-1-git-send-email-yash.shah@sifive.com>
 <1575976274-13487-5-git-send-email-yash.shah@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1575976274-13487-5-git-send-email-yash.shah@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_125120_499675_E05AE94B 
X-CRM114-Status: UNSURE (   7.88  )
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
 jason@lakedaemon.net, atish.patra@wdc.com, maz@kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 bgolaszewski@baylibre.com, Yash Shah <yash.shah@sifive.com>,
 robh+dt@kernel.org, palmer@dabbelt.com, sagar.kadam@sifive.com,
 linux-gpio@vger.kernel.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 bmeng.cn@gmail.com, linux-riscv@lists.infradead.org, sachin.ghadi@sifive.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 10 Dec 2019 16:41:12 +0530, Yash Shah wrote:
> DT json-schema for GPIO controller added.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Compatible string update]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  .../devicetree/bindings/gpio/sifive,gpio.yaml      | 68 ++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

