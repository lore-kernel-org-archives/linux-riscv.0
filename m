Return-Path: <SRS0=Dqti=TV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E9EC04AAF
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 19:01:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2E1421019
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 21 May 2019 19:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VxyZuPmh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="X2Xgx4vZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2E1421019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzHIg93o2f2y+oMp58QM4THX6dTmh/4W6hl3s7b0ZWM=; b=VxyZuPmho1+01i
	tCMv4tU5+Pmc9J1l7z8I19lvAl63u0rD3Ge+E5F+sjCrPz/7GSRFtOpYIpfUeyoqIkzxIj5hMVDRT
	bLYzGaP4YohQUJ4VLn9q4fTVLvKT4nhzm2oBT+vzNFyt+9YMEr/2EzFjayWQwCFaoRdLc4QJunFCS
	UeRU43hGWnwRwdkDdZ3SDDis5W/yOq0CoCQ5w0hz67MRiGoa8kL9u3rYby+GYTLHxHtQZ7m8+lpLj
	GBE8BP3hrGEcOVQj8vLkTU+Xj140sIIDhEMySEWh1MaGMpjrAHQQW56neJ/qF584f5NLky7HUAMtA
	a/WXYhzIWG2VN3nAUECA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTA1A-00050M-EW; Tue, 21 May 2019 19:01:44 +0000
Received: from mail-it1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTA17-0004ze-8g
 for linux-riscv@lists.infradead.org; Tue, 21 May 2019 19:01:42 +0000
Received: by mail-it1-x131.google.com with SMTP id h11so6380821itf.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 May 2019 12:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=+12NmtAAbFJaroPAA2lM4Iqx0/EqHN6iwK3Od+LxSqY=;
 b=X2Xgx4vZAiee18RcsPFWU6PrNbYl+0gDe7etynJiXePQV+JuiHLHV3NwBOznyDy3IO
 nDIDDwzlAMl9n/4G6mz0ZMaCHrdo78bxeZA4bMTGV5WcAzAT60z5396dHWDgusZQtnO0
 jfMwt52+vpBEKgcXMpkMf1zV8UpGmUX9OsrcwiIll+QWlzNPj73ryFqS8czXvE+9SsBq
 6Sq+BVvDywZph0icJ9QHClQH4D9kLu7u6J/Zb6AFCZy9DoK0lOu6+XqWBCW9Mww+1sUx
 1wrahw1u2fRs+ac7ja9kSZpshBvrE/kD+RuzMB1aSW18aCyKxOUb6zVuDNfuKJzR4u2d
 /MhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=+12NmtAAbFJaroPAA2lM4Iqx0/EqHN6iwK3Od+LxSqY=;
 b=Sh4WGjTfwqhi4IGTn7RdghSvO4ciWwjVMC36Wf3ryqHk/M+fgvKJtwRvsBmTh2LIvx
 B8a5g4hsIGejooSFGM9TmTpH/A5gdBqygNiBkKH2XfXBJt3uWwwLqmIrbVYtQDoMghtJ
 v+9rYlLCKRs7VE01LteRArl3Hd3S/2zg/U0BNHEWmF4NQqoNyxKaxmV2H7t2y3h0b9GG
 C44wjjuE0+pLQF20eXEYG5WukOt6OvnEjn6apbBPWrtz/0RqP419tMdh+UnjZYoA0+Gr
 n2pYPOVQ9p9aj2TpQ37FnCvLhxNTxK1a9NCsdmJP3rS6qovm96wKkVD/XNvi25rKqXrq
 2P7w==
X-Gm-Message-State: APjAAAUl/lGy8n6wYurJJopds/cz23XeyO8Fp6N3bc7B8wIM57Sk1FPO
 1uZNn+Xrv92LsnAUVN+DSMEzEw==
X-Google-Smtp-Source: APXvYqxL7Gz556HpzxmOWn6WIJ1XtT46LhMiKgs9kG6zAcRPMf+HSFGPzAUbbB7pzw8kD+bRYrDs4g==
X-Received: by 2002:a24:910b:: with SMTP id i11mr5636355ite.76.1558465299744; 
 Tue, 21 May 2019 12:01:39 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
 by smtp.gmail.com with ESMTPSA id
 z14sm6980089ioh.48.2019.05.21.12.01.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 12:01:39 -0700 (PDT)
Date: Tue, 21 May 2019 12:01:37 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Wesley Terpstra <wesley@sifive.com>
Subject: Re: [PATCH] riscv: include generic support for MSI irqdomains
In-Reply-To: <CAMgXwTic9WWjVviEdvh2+0+LB1va--+7zJOt7C2YxsB=hu72WA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1905211200560.24268@viisi.sifive.com>
References: <20190520182528.10627-1-paul.walmsley@sifive.com>
 <20190521063551.GA5959@infradead.org>
 <alpine.DEB.2.21.9999.1905210110220.24268@viisi.sifive.com>
 <CAMgXwTic9WWjVviEdvh2+0+LB1va--+7zJOt7C2YxsB=hu72WA@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_120141_364273_3638D05A 
X-CRM114-Status: UNSURE (   6.42  )
X-CRM114-Notice: Please train this message.
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 May 2019, Wesley Terpstra wrote:

> Signed.

Thanks, will repost with that and add the PCI folks also

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
