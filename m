Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDDCAC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7842084C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4IoQpMT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nEp2Hm9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD7842084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=N8F8SlWtycl4yFumtUwq8a5XwMcEyBjsEpJK5bGhwRU=; b=O4IoQpMTA1t7duyyOap35AnLd
	WEGapJ55bpGH1SKqEyp5G+skVbWlYWbE1xlf9/VVHFCPl7f6AwhN4EeSjO81g/hitzZeahZ+ICvdd
	A+vS2SPhJKDTS3GftUk+hiXUxUvaZd9YR6rDkmaSz2FaMliQ6mNwZ8H/nF0ufA/TWpQotrIKOiLm/
	VqLhaTg3AUTxqkPfqel6WvzmLegBvgrdxaq6Ccwsdeoj1VLk+WTZMwTJzmQQAsb6BB/2/tDE4yA0y
	7zZIEPBz3bZDg92pfTU7vleX7CKz5BNsZxRnN8szq6y7WhALV6U0uDMQyp6JnWmaG8bGuikjCuiFZ
	VoJhG7+4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBV5t-0005zB-Lb; Wed, 03 Apr 2019 01:53:37 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBV5q-0005xf-R5
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 01:53:36 +0000
Received: by mail-pg1-x544.google.com with SMTP id e6so3102400pgc.4
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 18:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=trp0vJARAQ2aoSsmBEowdwLAiqNSl6nTGbDKprAgFw0=;
 b=nEp2Hm9uLJv4UnbJYeQVM1vP73YQ0pvM0fwA4fUjCKuG9pacBOBxIpLIvCeWy9kRDh
 42cC/y16zI/ZebtfpTrVCqFiDa7ZwIQRBr7BiqJ8Zwqd5oTQ2NvC7jaWdf/RfAMcv+0m
 dpj4HTcXQ2m/DwvXmIqFQkkC3w5ghvMk0uIV4g9D3G2Hn+QWdjFC4jqWUSlpZAbXqztw
 Bvf38K6Gpmh+dlHTndZT0sRuGOrnjKJ0vRUpiboPbOKL/gcENphMCYjUulffvyajK7nd
 TOd+b27NMOR2Ef2yXRUsSSSykRCVwwHs+bksP33DKMjjDDbMveyuu4Lg//qfMpw/yc9P
 Ye1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=trp0vJARAQ2aoSsmBEowdwLAiqNSl6nTGbDKprAgFw0=;
 b=Gly4zeEICmmGNOk6I0hJIAMr9lIN2OVMNja/lMEk2fdr6mO/udE6lydVHX1FB6Jj8L
 0mMkX+GwjnrtlLmkvOQ310GlFIWeyT2SBj9RIf/2HS++IFh7qyPas9Y2XEUwmFkCYCtc
 NFyVqRpluLd7KaDWLBza3KB7fy/DDM02g7NTb0BBoBdOlRE0PjITK8PAoj3qUXJxJNm1
 JOyH6FGALRcOz0k3gzN9E404ftDxYN/ZZm3HPJEcRr4kV2vHwUtt98aO+ZFwrYxojLCx
 Zu6NpKpyprbJNtTdbellshp9Dd3Nbz2GEL1M2rHtjxWgKbVXRRIYzhvy91n/7OjP1U0k
 X1YQ==
X-Gm-Message-State: APjAAAU9jMJRyhgC54lfJOwtCskbKJiDGwpSmwMzXb9BhEsRnlFnrDgV
 KdSl8qoWa7U1DBn2sAIg5qZpKA==
X-Google-Smtp-Source: APXvYqyAvnkNlP12L7x47crHIBpQZlAklZ6kqjUtLmOzuYQZ8pBOWmaA/SxAa3g2rHpQA1jI39sfDg==
X-Received: by 2002:a65:6105:: with SMTP id z5mr40248087pgu.378.1554256414068; 
 Tue, 02 Apr 2019 18:53:34 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i126sm21350488pfc.101.2019.04.02.18.53.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 18:53:33 -0700 (PDT)
Date: Tue, 02 Apr 2019 18:53:33 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 17:04:31 PDT (-0700)
Subject: Re: [isa-dev] UNIX-Class Platform Specification Working Group
In-Reply-To: <CAPweEDz=JB2knNXthiKVL7QC5dxNrUf_GGmmEquT0UEo9WLs_Q@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: lkcl@lkcl.net
Message-ID: <mhng-08d84bd4-efcf-4459-954b-5a14c0946d86@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_185334_997607_462EC765 
X-CRM114-Status: GOOD (  16.89  )
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
Cc: isa-dev@groups.riscv.org, Atish Patra <Atish.Patra@wdc.com>,
 delisvhdl@gmail.com, sw-dev@groups.riscv.org, hw-dev@groups.riscv.org,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Apr 2019 11:59:04 PDT (-0700), lkcl@lkcl.net wrote:
> On Wednesday, April 3, 2019, Bert <delisvhdl@gmail.com> wrote:
>
> It would be horrible if it is about "standardizing existing
>> implementations",
>>
>>
>>
> The PLIC was one of the first key strategic parts of hardware that needed
> heavy interdependence on software, particularly the linux kernel.
>
> Without an interrupt controller, you don't have a modern processor.  So the
> PLIC was designed out of necessity, and SiFive should be respected for
> taking the initiative.
>
> Since its creation the PLIC has wide de-facto adoption, with several
> independent implementations, many of them in actual silicon.
>
> For example, Richard Herveille, an independent Open Hardware designer, has
> made available a libre licenced PLIC.
>
> For example, the Shakti Design by IIT Madras University, which had working
> silicon last year, and they have several more designs in development which
> would be extremely costly to start changing.
>
> Whilst the PLIC (a global interrupt controller) is pretty much de-facto
> already a standard, the CLIC (a per-core-local interrupt controller) is
> nowhere near the same level of adoption, so its inclusion in a first
> iteration would not be wise.
>
> That having been said, you are right in that backwards retrofitting of
> standards to preexisting (incompatible) implementations is a rubber stamp
> recipe for interoperability disaster. Look at the quotes specialisation
> quotes in IEEE754 NaN arithmetic as a good example.
>
> Biting the bullet and saying "sorry guys, you jumped the gun, you should
> have discussed the required changes publicly, that you didn't do so, you're
> on your own" is better than having permanent incompatibility that requires
> indefinite support in upstream source code for multiple implementations.
>
> That having been said I do not believe that any such incompatibilities
> actually exist, so the issue is moot.

That's a big part of the reason we want the PLIC as a RISC-V standard and not a 
SiFive standard -- if there's an incompatibility it's probably due to an 
ambiguity in the spec, and having a RISC-V standard means we can pick the 
answer that makes the most sense rather than just picking whatever SiFive has 
done.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
