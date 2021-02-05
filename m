Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF3E7C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:47:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3206764FBC
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 19:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3206764FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jQc7CXQmNDgHKkrOEmFD/e5+f/diTlVzdvBNBoZh4M8=; b=yqUknCMcmKwIy+09UgDiec7hM
	ZQ0+wFOYlVhQyZmdRQBKX2SG8X8r2RXkAIw9wUZR3Xu7dYTgyS9VyS/jEMzGoNB823iixNpEF+0wx
	OJ/iECsf1HwigW9YHzWhybMjRLzmsGLUMTNkmE7zMx9XynIpmnnNCnYFQ07x7VbK5iq7ZtxbzigCI
	TxTDPv4wI9zN7v2i0MTI4viQvTQsn92bEfC/Crvhsq781Uz8hsyR8XF8OoKMVBZUFOlVKKCnJc4mE
	q2uiON8kzJWnefoUeIsIlV9XLmK3jVVJzOTD+T+mgq6r2YrDs39jvRQQ1XnQi+r0d3JdayDDSKpts
	Llv4DLMMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l874r-0003v7-1Z; Fri, 05 Feb 2021 19:47:37 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l874p-0003uZ-Mh
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 19:47:36 +0000
Received: by mail-ot1-f49.google.com with SMTP id 63so8072174oty.0
 for <linux-riscv@lists.infradead.org>; Fri, 05 Feb 2021 11:47:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4z/7XA5iPMGNQ8PQneXW9neZp9ngnApofX98s+/VZV4=;
 b=V8ZtDGjT+WgKEhYz/0KD563u7MqHTIBwH/xwvTOTCJwnbrxiYkQnEmowbcVQP/TXR4
 b8BslQJRMcmZfHu1FiTzjiMPtj5pnWvdcCxYMb1l6IJyqA6KxhxTp6XcWxEy5dSmKq/O
 0C2/Sgs7L1daFHO8jbC6MbW26A/Twae46ps1dLQgPv+6yv7Xo+apW32gZpNFLfnIe6yu
 MYyXVmpkjn2MA5M25nj9GzPbQ7nItHHJQuw1LRclzIhBtLUwa4yirJFMxU2V1LV19BJt
 sz2ATzwhABBy795PSGfGZ9C2cNY1/ZGfpEbsPJlEhliqzmM8mppP+4fikr9aCLlgRWg+
 LAvQ==
X-Gm-Message-State: AOAM531dJyWz/sm/oSJmcfaXjwvTd5fOgNNHWHLA7Xa2e+HhRqQNy5UI
 jpXrHjhpI/thQ4tCyb77iw==
X-Google-Smtp-Source: ABdhPJwImh6w0sBLMWw3V5TtWhQ+AZWMRJJkAzV3k+Xiy7feAu2ebjIrVoLlWnDP6J//bp+4OR/TLg==
X-Received: by 2002:a9d:7b5a:: with SMTP id f26mr4296962oto.95.1612554454562; 
 Fri, 05 Feb 2021 11:47:34 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l64sm1952247oib.13.2021.02.05.11.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 11:47:33 -0800 (PST)
Received: (nullmailer pid 3597936 invoked by uid 1000);
 Fri, 05 Feb 2021 19:47:32 -0000
Date: Fri, 5 Feb 2021 13:47:32 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v16 04/16] dt-bindings: update sifive plic compatible
 string
Message-ID: <20210205194732.GA3597861@robh.at.kernel.org>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
 <20210205065827.577285-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210205065827.577285-5-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_144735_766868_9830BF89 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 05 Feb 2021 15:58:15 +0900, Damien Le Moal wrote:
> Add the compatible string "canaan,k210-plic" to the Sifive plic bindings
> to indicate the use of the "sifive,plic-1.0.0" IP block in the Canaan
> Kendryte K210 SoC. The description is also updated to reflect this
> change, that is, that SoCs from other vendors may also use this plic
> implementation.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../interrupt-controller/sifive,plic-1.0.0.yaml     | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
