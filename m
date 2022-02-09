Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4B8C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28F6M92IEUVcVuHc14FqTJWqtjAnxsGIwkRGto31cgk=; b=s4TBQhEvAjiveE
	VWRgJxgDv7yr02tRokkEz3JMia5mgNmhUJVKfEljm5fC3KHo+7dL7j6Tjmc+hq2TsS7awTdIXD+3y
	6P1w+je1HzU8e/iHlolDreJ03JPO1Nu8hOU6t9AY3jYmAiVtzj44u5bF8sgcw4gCWxJEfP0XE6Nbw
	DbP9oNZGziMjvBDXvIqXOsffV0sbyEftSEHgoMK46/ddp3szobH9eG5Z3E5yADVR5oLVUvmXaciE9
	K7D80X6f2ZU5yiDiSsuBvxF83UzGIDEnzCqVhifqCtEGvRcuw3xETZA67hDVAXgwAlyNKrZVTCKVe
	OZebdB8shoOtmdutFMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeCM-00GB8Q-IS; Wed, 09 Feb 2022 04:03:18 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeCJ-00GB7q-EA
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:03:16 +0000
Received: by mail-oi1-f174.google.com with SMTP id x193so1352871oix.0
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CmY7PgTIB+xl2LL7tzgCE9G7RhMcwApZzrQupeWWqm8=;
 b=4cZzmEUvrshA8Jv/tQlbSp3qfYi7Y+teRgW4ZRpcyafTn+/uoy7qL+pVSPR7c8ZeIl
 D0VUMg4ks9NduKU8i9AFibU+sN5zy0R9aiM5nGRnfErb7hfU65/1vR4vapVy1WmljzRy
 4NWzivqXnwLy8VlFYYSYTcOSXvzwGVzC794xJykIe/IuJn5HJff5in8eO9GBQPzWWtsY
 XGpDFniVL/xBk+r6e2+oD+ZX9ezgd7+tCGGLkvwhWuYVtWpGSmdbHfH8Xx4hvvJLZJZE
 3y6chgVeobwIenPHwTo5qKqiOjBJSRtfWN9k3eVW1tsMnN+3F5rH0YcI97Mwlfx5wWxF
 4mbg==
X-Gm-Message-State: AOAM532Ka/GMwTUMBhy/c7zv6JmTLT4e6m+jYJkeeaGtXGR7D83l2gwn
 bMp3/yHI5hZlgUud3du7LQ==
X-Google-Smtp-Source: ABdhPJx9qakOYsm8R9weCyJ5x50P3WxmBB4MhXyP6Tg54v2pjw/BqbvG0kz8V3sAEgcHwwz5Clokqg==
X-Received: by 2002:a54:4812:: with SMTP id j18mr514855oij.277.1644379394062; 
 Tue, 08 Feb 2022 20:03:14 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id 12sm2580297oam.5.2022.02.08.20.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 20:03:13 -0800 (PST)
Received: (nullmailer pid 3630578 invoked by uid 1000);
 Wed, 09 Feb 2022 04:03:12 -0000
Date: Tue, 8 Feb 2022 22:03:12 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@nucleisys.com>
Cc: Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 01/12] dt-bindings: vendor-prefixes: add Nuclei
Message-ID: <YgM9AMFhzsvhd85O@robh.at.kernel.org>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
 <20220127151647.2375449-2-icenowy@nucleisys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127151647.2375449-2-icenowy@nucleisys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200315_494044_4E36C4B1 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, 27 Jan 2022 23:16:36 +0800, Icenowy Zheng wrote:
> Nuclei System Technology is a RISC-V CPU IP core vendor.
> 
> Add vendor prefix for it.
> 
> Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
