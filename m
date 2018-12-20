Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E57AC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:05:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E305E218FE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:05:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O9WDQ0In"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E305E218FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VoEl92wZ6SL+hVdlxLUdSJ6KcovEbNq6ZjQxTn3QP3Q=; b=O9WDQ0InqwVgS0
	17ST/J0L7wBgP0Mq2NPF72w0NGSgfJbGa+qo7ctOQnQskjlnz6rkFqwX0P1FifuG6rb2q1IT9vTLq
	1b6EagkHVlwXMKyn5hNaGzIOzjkkxhRnjLC78Im2p8MnhBX2WgYsjx2XI6z44Z9ttEgWYr4swQZia
	3k9hW402PNcADt5Ra6lKunJIzb3B2Lao8KUiES7MkcizjNQuwgvln2O2eHt5tRjEVTwlM4kXGm1th
	eLm/A4ZmOZMmApz7YT30r3UccCbAp4VUcMpYtvBkMBCXtBNQlz4JnJ/KVbFK+cFCVE7+PX4O3cKew
	m42gpFjX4NRBOvZBJ2Lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5VE-0004QB-1X; Thu, 20 Dec 2018 21:05:08 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga5VB-0003XD-C8
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 21:05:06 +0000
Received: by mail-ot1-f65.google.com with SMTP id s5so3225615oth.7
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 13:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CA7djEAA600KqNCvJ4e0eFqNNGuJG9dE5uF6Jyr/JaE=;
 b=etOaM7qBPGQTFgcJxK+P3+ocpzA4vIvdfa6smjGj6I8opDkGRL4pQyPKkOP0IYzum0
 Dq1UF//92YSkuZzx3TovAPLImiDX0aQlgBrewAAcoHnfIIv0XOuY58MSA4/AnHBRLGYm
 rtf/lmSr75KNFZK3dqEVjIvUKMDb8ihpFWX6HQ14CbHFgcc+KSnAJSCrs9LhBnV8ca3s
 DN3AYI/12pW6Vet85wHAjqzAHDbx9WY32CpFDv8D+obTX9zz/ln2Rw8mhFiylrL4cApd
 D8heOnEiz+DNhhNXSefP+/8OVObPNqH9/iPMKREf1RVLIwq5uSGpcBegG2UR0QIeFxxn
 M2fg==
X-Gm-Message-State: AA+aEWa5EIaD9ItcAaGCuQr8eiLeDsl1M8VFNiN+HtzZWsMLdUm7yLjb
 4aV6EO5cCfFDrBgMCDywgA==
X-Google-Smtp-Source: AFSGD/U5x6Rzu5D0Jm/jXHfeqb3R0zJTX2Nn8ytiZyT1S7X/WMS5qCS6IDW2D7e+yDmalDR9P+sDZQ==
X-Received: by 2002:a9d:43a6:: with SMTP id t38mr19840747ote.213.1545339894600; 
 Thu, 20 Dec 2018 13:04:54 -0800 (PST)
Received: from localhost ([2607:fb90:20d2:a5e2:49af:e73e:5a36:3b50])
 by smtp.gmail.com with ESMTPSA id g25sm6352160otr.30.2018.12.20.13.04.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 13:04:53 -0800 (PST)
Date: Thu, 20 Dec 2018 15:04:52 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 6/7] dt-binding: riscv: sifive: add documentation for
 FU540-based boards
Message-ID: <20181220210452.GA26977@bogus>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-7-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-7-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_130505_416533_DE0B6585 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 14 Dec 2018 21:21:53 -0800, Paul Walmsley wrote:
> Add DT binding documentation for boards based on the SiFive FU540 SoC.
> The first board, the HiFive Unleashed A00 (FU540), is described here:
> 
> https://static.dev.sifive.com/HiFive-Unleashed-Getting-Started-Guide-v1p1.pdf
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> ---
>  .../devicetree/bindings/riscv/sifive/fu540.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
