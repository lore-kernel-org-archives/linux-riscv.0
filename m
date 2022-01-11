Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15737C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 17:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCfUW5V3WKfXl+n988DV31T3Pz4gZpErDkk+Kn4rIBY=; b=s0OcYFkwQyUrUp
	1XLbkydvgZESKED0kYJ3VemnraYTtAm+kzC5HLXxMG0POcoRs8Cq7I81MJhJEu6/RqaQaxPcuPU8u
	xjm7JQWqVggPq95XGsV0F8Cm69X4HXpdoO4eQeUnGRMcgj8K0BRzUiIdGGyQsWw9+DsQVy+Ut4Go3
	wwsEqbIKH2hktfESIHHYE9plBDaIPRjWaeZgjh+PbkhKahfdlE3ojLpZx/wzcGgNU0/+jHSS8saXy
	wBpvq/PrRB++d3G37mbz8KGA09coZUJ8w7oarHcvGmAjtQVAyE6zaN765HiQYBTf7Ldi9Ys08i/nj
	LaICHnbBEvoqEexc9Pzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7LLQ-00H9Yd-Bm; Tue, 11 Jan 2022 17:54:04 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7LJF-00H8Ta-Cl; Tue, 11 Jan 2022 17:51:50 +0000
Received: by mail-oo1-f47.google.com with SMTP id
 w15-20020a4a9d0f000000b002c5cfa80e84so4639572ooj.5; 
 Tue, 11 Jan 2022 09:51:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UifqrbSv4P6oUwIS9VVpUp4MVpz/i09ZMQyiV9QJa6A=;
 b=1PBd2Tne9/wMchoVIkNQjHHBn1cjUcRq6PAcboiBR+O/gq4KiXTsY0A5qfXYtA/YZX
 lUOz97V+v58lwxVAdZtAIfNzSpmeIHClIy/3RDPSaoY7oQcwSIZG5FZNM9z0LoLzQw8F
 Jy9X8mDMUqVdnFUhXSahAZz2PikxhSd6zANJKtuk1TVfTdOE2up+IvOQv+vw8u4Sw5QZ
 godntVLRx4IKt+cbgS9o6dgDXc72KASUtTsuJVwM4tfK0v3b0P8zC8QtKcyybRHrC2PN
 +PFd1KxbM8oXrGKEKCkuQFUwRdGqGr16wTMTHA0tVJZxW6h76lbXhqhDefjklUSkLpCJ
 Qutw==
X-Gm-Message-State: AOAM531zz1umtAec508bdexr7BSzBX3xaINeYfVYiEmVJe61T9AYxt3/
 tDwSVrzcVXj98o6FUMsbQQ==
X-Google-Smtp-Source: ABdhPJznNaT1VvHIngLtpJFtz0iASueDANoXRX2e5SW6ZAucUfj28fstai6hZocWcmtpqr5MeaK/UA==
X-Received: by 2002:a4a:3bd4:: with SMTP id s203mr3882712oos.18.1641923507894; 
 Tue, 11 Jan 2022 09:51:47 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x13sm2018165oof.19.2022.01.11.09.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:51:47 -0800 (PST)
Received: (nullmailer pid 3228864 invoked by uid 1000);
 Tue, 11 Jan 2022 17:51:46 -0000
Date: Tue, 11 Jan 2022 11:51:46 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 - <patches@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 Kumar Gogada <bharat.kumar.gogada@xilinx.com>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org,
 Greentime Hu <greentime.hu@sifive.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-riscv@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-pci@vger.kernel.org,
 Hauke Mehrtens <hauke@hauke-m.de>, Linus Walleij <linus.walleij@linaro.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Suman Anna <s-anna@ti.com>, netdev@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michal Simek <michal.simek@xilinx.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] dt-bindings: Drop required 'interrupt-parent'
Message-ID: <Yd3DsoMYTylcOWDo@robh.at.kernel.org>
References: <20220107031905.2406176-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107031905.2406176-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_095149_480795_525DFA5B 
X-CRM114-Status: GOOD (  11.42  )
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

On Thu, 06 Jan 2022 21:19:04 -0600, Rob Herring wrote:
> 'interrupt-parent' is never required as it can be in a parent node or a
> parent node itself can be an interrupt provider. Where exactly it lives is
> outside the scope of a binding schema.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/gpio/toshiba,gpio-visconti.yaml  | 1 -
>  .../devicetree/bindings/mailbox/ti,omap-mailbox.yaml     | 9 ---------
>  Documentation/devicetree/bindings/mfd/cirrus,madera.yaml | 1 -
>  .../devicetree/bindings/net/lantiq,etop-xway.yaml        | 1 -
>  .../devicetree/bindings/net/lantiq,xrx200-net.yaml       | 1 -
>  .../devicetree/bindings/pci/sifive,fu740-pcie.yaml       | 1 -
>  .../devicetree/bindings/pci/xilinx-versal-cpm.yaml       | 1 -
>  7 files changed, 15 deletions(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
