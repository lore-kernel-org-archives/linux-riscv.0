Return-Path: <SRS0=6ibT=W7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2873DC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 22:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19C521883
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2019 22:21:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FsgNOeMB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iOcKuZTq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19C521883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok9FhCJQ23qkcJQR4CmxM78QDhKCQgzv6QK/ur0mDLM=; b=FsgNOeMBZSJbC9
	NYsV6b78ns3NF7QkN8VVKpcec5RrLiKt1E2f8dk9mm6nhFgBASnEF6uC7sR3hIPNoOO0leT9mNt2F
	UXTTIhHQ7hzpiqsdFeB7qW8DNYw6JrSB5ms/1dfIuzxioibj+fan27bMkyvSwr7qhK7kjdxGp+MaZ
	9H3O+nXUFSEmw2mB4bmzXv1vuDGk6e2jt/S1Yt7BeShKYokDzG/JiTeIEXWmJGIxw0BF/nEMn+PY8
	vENDYN+m2r+x1pUMF7sPjGHy/1Ochbt8wlf0bzqKoBf30Z3tkAaDg8gkrz8l8OvnpHODcjxjGOs+q
	IeUZppr7cGqG1150P4Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5de7-0005on-Bh; Wed, 04 Sep 2019 22:20:59 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5de4-0005n1-0s
 for linux-riscv@lists.infradead.org; Wed, 04 Sep 2019 22:20:57 +0000
Received: by mail-io1-xd43.google.com with SMTP id b10so154933ioj.2
 for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2019 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Zowdg/ishiFEueHxdJMXvAIwGsQhibYjxDCAVWpyEho=;
 b=iOcKuZTq9FDfs5ITnO4xksSDEIMyzoGb5YPgw8Ox6aLOAXSjQNZISIBe+DGXG0wk+N
 pN7WO1WaobfW1ilOv5uELMQvO+nSuoR7tNluOhbT9/2xknUwlNotF9HSzpKF+zhfOKyD
 RdHIk4iXBpphh/wRSSgCGcGU10Yt0WCa9ez/H4N+wOrHNN3BQSrKkD2BFG7Y0guEXbeT
 rA0PnCKb2Twqdi+UgnSRkvTBlRJwqyUq/c/Ev821qe+5dWW+wT6OpAdH9nSxC28lKSSh
 SiX9qbh4yEGo5m1dKL5rDe4UMXPJVslnIvcyppmVppnReIEa/5QKGvqe03sftx7YNooF
 0LXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Zowdg/ishiFEueHxdJMXvAIwGsQhibYjxDCAVWpyEho=;
 b=ic2Ed4AsEG2A/NBYsJDXheFerIs7b5L6MU8I7wNnjqJfZ0OdR1qCgV6JAV1TGd/bfQ
 35x6J7ZkKda0MzAjRtnB0/Jrtcme46z/nOYKFImYJ72bRaVv2zRuAKu24YGcov03qTg8
 SOkDUgw+FlTQevBeowSkOHHS609TMi25cxD5dq0BRT/Mtg2WP0VwdMOd4NR9+xqusExW
 A1mQRL4dfWpNuDu1DEGbAyc+Nw+bTVEEb0rAnEtjPLOpa9LQjm5rR59ygcimo+kgHmFS
 GdaSVru7S1AVtbHEVlIsFGSU0eEN4xfc8ffJTVXtSsabVwkxTu7PtDUNqxadTyDfnzEl
 prTw==
X-Gm-Message-State: APjAAAX2WnzoS8lFkOTImXLlkR4kd770WLUpbRFN4kOEfUi4Vkes9ydw
 n1f0eiQxfFg/g2VRqkrEo3mwnQ==
X-Google-Smtp-Source: APXvYqw9/y1/6WIH+gVV0I2I+QTpotyWZ/nsXPQb3XqbV/RMNA9f7RjbusMAA0XrA/3pIxTjnIZqvA==
X-Received: by 2002:a05:6638:73d:: with SMTP id
 j29mr603576jad.21.1567635654784; 
 Wed, 04 Sep 2019 15:20:54 -0700 (PDT)
Received: from localhost (75-161-11-128.albq.qwest.net. [75.161.11.128])
 by smtp.gmail.com with ESMTPSA id u3sm281389iog.36.2019.09.04.15.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 15:20:54 -0700 (PDT)
Date: Wed, 4 Sep 2019 15:20:53 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 26/36] spi: sifive: use
 devm_platform_ioremap_resource() to simplify code
In-Reply-To: <20190904135918.25352-27-yuehaibing@huawei.com>
Message-ID: <alpine.DEB.2.21.9999.1909041520130.13502@viisi.sifive.com>
References: <20190904135918.25352-1-yuehaibing@huawei.com>
 <20190904135918.25352-27-yuehaibing@huawei.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_152056_128536_53E8E8D3 
X-CRM114-Status: UNSURE (   6.15  )
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
Cc: tmaimon77@gmail.com, palmer@sifive.com, tali.perry1@gmail.com,
 eric@anholt.net, ldewangan@nvidia.com, linux-riscv@lists.infradead.org,
 festevam@gmail.com, linux-samsung-soc@vger.kernel.org, f.fainelli@gmail.com,
 benjaminfair@google.com, shc_work@mail.ru, khilman@baylibre.com,
 openbmc@lists.ozlabs.org, michal.simek@xilinx.com, krzk@kernel.org,
 jonathanh@nvidia.com, yuenn@google.com, wens@csie.org, agross@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, andi@etezian.org,
 rjui@broadcom.com, s.hauer@pengutronix.de, mripard@kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 baohua@kernel.org, sbranden@broadcom.com, yamada.masahiro@socionext.com,
 avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, thierry.reding@gmail.com, wahrenst@gmx.net,
 kernel@pengutronix.de, kgene@kernel.org, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 4 Sep 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
