Return-Path: <SRS0=M4pA=O5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1AEC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F39B218FE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 20 Dec 2018 21:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kocaAuOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F39B218FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chSsE+V8fV3Pnw/PbvmEG8qz75TndFHglDnB7cxNUD0=; b=kocaAuOc2YR5jZ
	DU+XK9PYtgoJm8w5WSaKgPohl7/bXPc6p+BYb60v5OhycKUFJHMJs6Tka2f3Wi7+JxALt0xrqE5d1
	NyjjC04nTR7Fjil+GJKoOy4zo2s/9kw+xOgdAOB2ZwYV5bCSqUd12bOb60hqzRbG4awdh0BRHc6yt
	raun1omyCX62yHuiuxpcBm8GCVlPllIyTwMtPmoHZAEiR6onZAn72/xi1lRgyOGiAU3Xn3LDM5YCB
	EBKfOQThF4ly8JMt0/RczSKQwp+ZjbFrpu3QToQg15pYOPGapc2Uoa21zU+7LpO29Iez5SEV3TxYq
	Bm8X6CM+OfO4jthwIK6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga5SC-0003La-SW; Thu, 20 Dec 2018 21:02:00 +0000
Received: from mail-it1-f195.google.com ([209.85.166.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga5S9-0003Kg-BV
 for linux-riscv@lists.infradead.org; Thu, 20 Dec 2018 21:01:59 +0000
Received: by mail-it1-f195.google.com with SMTP id m62so4029300ith.5
 for <linux-riscv@lists.infradead.org>; Thu, 20 Dec 2018 13:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FObYT91NzUS2WehQuBefl/zjyrdR0UffG31UysubvZ4=;
 b=ezN0c7mH++F8svpHbWfrcEV7Bz8pOZHJzXIicom2/aHNO8iGz465sO0EjJVNIb1ZQ1
 FqJj2h+0HG/LpmukmLgI0ZRWP0m+P0TBeBt/ZkLT38WeWRZEpwgmxq97Wq+Vv0OkfRJp
 Kz3S9BEnTHEn2uqXy2mRgP7ixCmWjAS3wwjJAnPanu466Yp57I9R7dNzjbtpX5+8yYOb
 TgkOb83BqysRBzzIKKTBNiMP1HZwcrGPqDXqkxGLKA8BL22ddsoLDNUlCwj2sT02iUfw
 4bhtH5ZJtajkM4KTqreBSrGhT5dnsWyAD/E61DJPyZKgxjsH5kyGkfVfLQZW77enX25U
 mPAw==
X-Gm-Message-State: AA+aEWbmXPuib0YiXfQEsYhPpiQ3hytzWSMQWf2yNT03RMRQyBKdDugo
 aj2W0A2tlX8ONHEDLBIufw==
X-Google-Smtp-Source: AFSGD/WXMsUFf9QoMoaypflxeeZ2eBoBzqQ4ysOkpjE/HDZD5e1hZ6hIapE5h/6us8EE3Tx8lkjKqw==
X-Received: by 2002:a24:94c9:: with SMTP id j192mr196707ite.125.1545339705915; 
 Thu, 20 Dec 2018 13:01:45 -0800 (PST)
Received: from localhost ([2607:fb90:20d2:a5e2:49af:e73e:5a36:3b50])
 by smtp.gmail.com with ESMTPSA id y1sm37493ioj.45.2018.12.20.13.01.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 13:01:45 -0800 (PST)
Date: Thu, 20 Dec 2018 15:01:41 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 3/7] dt-bindings: riscv: cpus: add E51 cores to the list
 of documented CPUs
Message-ID: <20181220210141.GA17198@bogus>
References: <20181215052154.24347-1-paul.walmsley@sifive.com>
 <20181215052154.24347-4-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181215052154.24347-4-paul.walmsley@sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_130157_396690_E955C569 
X-CRM114-Status: GOOD (  16.35  )
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
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 14, 2018 at 09:21:50PM -0800, Paul Walmsley wrote:
> Add compatible strings for the SiFive E51 family of CPU cores to the
> RISC-V CPU compatible string documentation.  The E51 CPU core is
> described in:
> 
> https://static.dev.sifive.com/FU540-C000-v1.0.pdf
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
>  Documentation/devicetree/bindings/riscv/cpus.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/cpus.txt b/Documentation/devicetree/bindings/riscv/cpus.txt
> index adf7b7af5dc3..fb9d4f86f41f 100644
> --- a/Documentation/devicetree/bindings/riscv/cpus.txt
> +++ b/Documentation/devicetree/bindings/riscv/cpus.txt
> @@ -68,8 +68,9 @@ described below.
>          - compatible:
>                  Usage: required
>                  Value type: <stringlist>
> -                Definition: must contain "riscv", may contain one of
> -                            "sifive,rocket0"
> +                Definition: must contain "riscv", may contain one or
> +			    more of "sifive,rocket0", "sifive,e51",
> +			    "sifive,e5"

I can't really tell what are valid combinations from this. It reads that 
I could list every string here and that would be valid. It is basically 
'riscv' plus any other combinations of strings.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
