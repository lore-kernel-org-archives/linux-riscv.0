Return-Path: <SRS0=Yvo4=UG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF91C2BCA1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 23:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FF020868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2019 23:30:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HLjYRQj0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1k1SzTsm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2FF020868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSy9UqFq+ZiFNYc1UU8RZtDx3e3OTjTGqJcIvcwSh0I=; b=HLjYRQj0+e8CSO
	/tstepd+3WlsnOm0MkoeG4/0Heoku99kOHkbDCdxr8AnkcMEHqH2FcYZKvqkf1RIFD1HOc7C9asSf
	FaM/EwDQWoB9DFAue832q3PUT2ySHHvbua1UqChE85xf5vh7ES4J8AVUlfATabgLbrvepn+xVVHH1
	6uk0o5DOvsLG5fOeV9nbELnHvScPeSBYe20y/fLMQP1B1IgaU//oBp5ey68Gn4kNy6cdB8WTIklcy
	+3/i4Xq0TRpJZwPIV1hzGsTkAGQb0LKv93G3T4A/mWgRhrU9JSd8PRBuagUbwnJSILhQttgw8BQlH
	062tvnrzV36ydl88shkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZOJ8-0001dd-BP; Fri, 07 Jun 2019 23:30:02 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZOJ5-0001al-67
 for linux-riscv@lists.infradead.org; Fri, 07 Jun 2019 23:30:00 +0000
Received: by mail-pf1-x443.google.com with SMTP id a186so2000253pfa.5
 for <linux-riscv@lists.infradead.org>; Fri, 07 Jun 2019 16:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=I1PywGpIKSbkW0TWj4vZQWbg6HMbsTN3+fpFYP0xgw0=;
 b=1k1SzTsm1Ud8uu8kDrkNN7lSN+ROfcV2DHlbyFdUfCX7EoP2ofCPMwnre+fh5d5viP
 SRIxgm3GiUBdi1KBfPHFwfeKuZkkrEVugtRwpqZbAYDhadtTcL2K4d6ZVa6RxIFTigOp
 B30CZlHv+4uh3iefmsqR+fLOIuUvBPNNvyfUN6GM79sbHWQ9611jxaOzUWvFUOL0TYRm
 5ivwaEQ8sTcsb405Ufw6GDs8EDXZoTKViSaQ7aqIays29uyTShHqAiKhIvnsdM4NSEiM
 0sws9Kqlv2qD34Wn25NypjrqnR5g0BTDyCrTuLzKO6xHolWp0Tro2PoH+2nb53IZ5tms
 g9QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=I1PywGpIKSbkW0TWj4vZQWbg6HMbsTN3+fpFYP0xgw0=;
 b=R8qlAZnKv/eC/p5USpj0RunLVsVYAIj2op9cpsTz3g+ZYCkkIgazGGMtgtWRgxU5q5
 YJmYMy0txBj3xAHKANs7wSV8FajU5aNUsENiP74IKZhjoGLaGp+/BNwao5srn6pOXB+V
 QU7bqKleHo5SmSC3OZYAO4/fFdi/6rfrAwZiR+1EOUWmrhSWsT/mZq97KogRl6drGBmS
 KTsz1m7GSuqmSRMsJ0fW7HJsNLbs2M2o7oOUezXW7iQy6S1vYnzDjjBxHkIFfBKMoZgk
 6gd1e56G/NCZk1PdB+NvgH037zZZ9Zoc8Yb6gXRhVocFH4vjUuOqOqjtfrIj5w8zZoA8
 TsUg==
X-Gm-Message-State: APjAAAVsZ9O2JLLvnUbE2Og2VjSQpv+n7RsbTu1p5SjWPKpYAnLguPj1
 urbSvowxAHMf4KvNKKthCDtMXT+Cw50=
X-Google-Smtp-Source: APXvYqwNQQJVPEemCv+XbvWWBEWm2pO4zGQmJGYgK94LzsBPnbkxSliCDyzqks25l326dpkQXcJgzg==
X-Received: by 2002:a63:191b:: with SMTP id z27mr5107334pgl.327.1559950198221; 
 Fri, 07 Jun 2019 16:29:58 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 e184sm7910921pfa.169.2019.06.07.16.29.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 16:29:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: defconfig: enable clocks, serial console
In-Reply-To: <20190605175042.13719-1-khilman@baylibre.com>
References: <20190605175042.13719-1-khilman@baylibre.com>
Date: Fri, 07 Jun 2019 16:29:56 -0700
Message-ID: <7h5zphas97.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_162959_232487_84D4B855 
X-CRM114-Status: UNSURE (   5.64  )
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
Cc: Atish Patra <atish.patra@wdc.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Palmer,

Kevin Hilman <khilman@baylibre.com> writes:

> Enable PRCI clock driver and serial console by default, so the default
> upstream defconfig is bootable to a serial console.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>

If possible, this would be great to have for v5.2-rc so we have a
bootable upstream defconfig ready for kernelCI as soon as the DT series
lands.

Kevin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
