Return-Path: <SRS0=ZLBf=VT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB74CC7618F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2019 21:46:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B09B92199C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2019 21:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YNqDrbeA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QRxolnZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B09B92199C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kr5Wh8Ys7rrSmDz7k9gowro/7rYlVWZYmRtz70lRDUE=; b=YNqDrbeAHRiqPK
	mevTJPPST4/ytFEhFWqXAS9Q7zn9gvYBAZmQV98GZZF6Vjw3hUoijkl/qDHfSGH/nyBnNd9nYHWC5
	SCwj70SkjJyRPTjKN7fNubG0aNC8k7N78zdcaLOvxH+pzSWRd5R2NaeQep4+2DoO4JxIUseVddklx
	P/R4TVdP/W6Lyj9QdHPWZNa9Fq9O5NVidGbkYwSsv7D3BdJm6G/t00TVqafWiIW+xI0NYPluT84AH
	XJERiG7GYkQ6XM7EXo9NQO5E4qUPoBmmMgWJYJ0i3QQfNsS4b+hCbpXuxkMweX2WsA8c1AmCJ7Wsv
	vORX76XSfAw5d6+ayg6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hpg8g-0003JA-RP; Mon, 22 Jul 2019 21:46:35 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hpg8d-0003Ie-JH
 for linux-riscv@lists.infradead.org; Mon, 22 Jul 2019 21:46:33 +0000
Received: by mail-io1-xd44.google.com with SMTP id g20so77340938ioc.12
 for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2019 14:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=VWIZBvI5lCbidvXKY6O84lqCZ2AjaGY2QVwWc2bhom0=;
 b=QRxolnZMSRjr7BTm00Z8wwbzzUyOLZZvVERqLil5ipazTc2XhnIF6C70R84dF+etKK
 WpObHA4zIcJv8+m05XstTbyF6sBH1EGDTFBnPfsk6yOxc+A+b+xply+hM1A5RzrT6HuM
 ROpw+KdsvciRm3w1quQySFv3XIOP7tbwz4KFM/jO2etmZxVfPAwmNwqV/sHgdZ4lVw8X
 0ucGKbgZRWgL5ixPf9JnKL7ngRO65i1fCFJI/CSQUr12AdIakOCqkGfZg29b/es/N/N0
 aIHkJHZxbOYMPazFYdIeLMsmd2ecRQ5bVatC05ATHZI3daEtEXkF5QO2W7Nsv7frreB1
 0NsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=VWIZBvI5lCbidvXKY6O84lqCZ2AjaGY2QVwWc2bhom0=;
 b=ga3tZKmSuuRcgdExuPD3Mf2FD0bqZQ4hF7PFdQunDjSmymxYR8Vp1qb0IgDxyg6yEp
 Fo+gJW58rHKIu5tii0nnQ5VDKj5HAK/5oc+CL98R1UhuvSvn6GnNvObIinsJzGvpdSe1
 6m1niSElDCLB/SpYn9qwbSqWlPYrSN9/lJ3DPnjdMaEiP8HFCmNvtBn+floHKVlC0/Ja
 u9PYxLJ03qE9sXvfGO9X0pMM+X9kpAMZckpo90XdpmxAO04faFVLE+PkhDf3SRZmFWWo
 SAT64sHTvtRrGWltoFt4OesngFjJSJ65ZrKDwMxsgnSG5Szez/NipB8riWbVtPxhuVYY
 CUTg==
X-Gm-Message-State: APjAAAWCpY4DPHzS4Pc0ygadVq9dzefUgdU3111GYSK+HeS/2Z8ww4+3
 HG/isT8vGqOgE+mGR6FMhu7yTA==
X-Google-Smtp-Source: APXvYqyd2dW888lhV8CkKjbqoz2NLahTQzYkKlmc3wSjVe+iOryGMbi075TFpJ6Xc0oCjN8Cgg19Lg==
X-Received: by 2002:a02:1607:: with SMTP id a7mr73356673jaa.123.1563831990677; 
 Mon, 22 Jul 2019 14:46:30 -0700 (PDT)
Received: from localhost (67-0-62-24.albq.qwest.net. [67.0.62.24])
 by smtp.gmail.com with ESMTPSA id x13sm30725719ioj.18.2019.07.22.14.46.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 14:46:29 -0700 (PDT)
Date: Mon, 22 Jul 2019 14:46:28 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH 2/3] macb: Update compatibility string for SiFive
 FU540-C000
In-Reply-To: <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1907221446090.5793@viisi.sifive.com>
References: <1563534631-15897-1-git-send-email-yash.shah@sifive.com>
 <1563534631-15897-2-git-send-email-yash.shah@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190722_144631_695262_10D2BDF7 
X-CRM114-Status: UNSURE (   5.75  )
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
 netdev@vger.kernel.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, sachin.ghadi@sifive.com, robh+dt@kernel.org,
 ynezz@true.cz, linux-riscv@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 19 Jul 2019, Yash Shah wrote:

> Update the compatibility string for SiFive FU540-C000 as per the new
> string updated in the binding doc.
> Reference: https://lkml.org/lkml/2019/7/17/200
> 
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Tested-by: Paul Walmsley <paul.walmsley@sifive.com>


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
