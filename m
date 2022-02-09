Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3648C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hplxgrYnDLYdw82uhBq1HwOw3v+2C4PIOLUUQ94q3RY=; b=JZuhrTPLpxUKKY
	i+qF+C6gf0s2QFmtHTLwKgKipV/R80cBWbqaYJl2TLPcCwaFSaxacPUP2YFxEcfQY+NKyJh0oKCKA
	P5TTFddTrBNFJjg91uQ0k/H6a3WM2MHqbEpTEe04JPF6MaHNb3GxdNCDSIfqbhM7u6oehkWkA1KH2
	ogpZ5uIl54IshvsCqqAQXM4VDurUj5F8Z4OJUN8AH9urKyQgc7q7Bdx652Y68NzfD1yhK9Cp51ViB
	WNNwzcRig6aHf6NQ27EdxgX16Kt43iE+HZMH7BJRiN7TfOCSPAlU/QpISGc+zAKi5uKEcRofWgshn
	KnuuVAr3r/JxqnR6pDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeFM-00GBZ2-G6; Wed, 09 Feb 2022 04:06:24 +0000
Received: from mail-oo1-f46.google.com ([209.85.161.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeFK-00GBXA-4V
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:06:23 +0000
Received: by mail-oo1-f46.google.com with SMTP id
 o192-20020a4a2cc9000000b00300af40d795so1072014ooo.13
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sY39HXAYg9f/PCxHinro5aXMT9t5eK9gckc4VAS6ntE=;
 b=TjCF7sgQCRLaJQ/T3uYZ3ip3emOGw6yb3vF+/pxHeqqBBzL6104ymyarUz6XmE9UB8
 D7iIeeheF5hGGIUTGPHhrGYzFRrBnprVYaE/R8p6R2s/MuO4tH/NJcxWmkk3DB+b/tmb
 k6vCL3h2MIklaVZvmxTlRJo8YJHB/qRo7fqo8CUPHFkTHf68CNYDxjBOKN6Ys7kSV6pR
 LAw9CWQ8Uy2ubr1juW1kkNxO//c5teLfuKbNpkST5ONJMkjPu9/QkIlHdSxDkvypTqsC
 E5E9QRmCLClMegQUJ0GmWAlrqJoeZjXdQW8spZ/t3tzFNXCtSGVbfVJbqe9VNeKyPjGB
 AdoA==
X-Gm-Message-State: AOAM5324S5MGLcjW02hRMp4o8clDqNCdTQP2aa7cR+rj/n37ZczhKImn
 sNgIsZZaH0eTZfoWgpnkPw==
X-Google-Smtp-Source: ABdhPJw5NrC1vbHuuM6soDlYqbH+QM2jgOrkXqkYI+WzWshA0zBR7IPbRdxrJQxjPHgIoM5EvPhw4w==
X-Received: by 2002:a05:6870:1351:: with SMTP id
 17mr156257oac.246.1644379578544; 
 Tue, 08 Feb 2022 20:06:18 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u3sm7286173oao.25.2022.02.08.20.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:06:17 -0800 (PST)
Received: (nullmailer pid 3635161 invoked by uid 1000);
 Wed, 09 Feb 2022 04:06:17 -0000
Date: Tue, 8 Feb 2022 22:06:17 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-serial@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 07/12] dt-bindings: spi: add compatible string for Nuclei
 DemoSoC SPI
Message-ID: <YgM9uSVB2txOtsHZ@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-8-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-8-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200622_195866_01560C3B 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 27 Jan 2022 23:16:42 +0800, Icenowy Zheng wrote:
> Nuclei DemoSoC design integrates SPI controllers from SiFive.
> 
> Add a compatible string for these SPI controllers.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-sifive.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
