Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C398C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 22:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noPCkEkwuXtPYLE4wGPmDWEnPfjeXb1ptgI3HvRjxnc=; b=LROEmzasazgdYk
	uVhjikYeTDmtEedHeh2FbMUZJ/R27yIwvtmkB9OjjrW+VqvSAerWLGyqCrGXbvHBxnDiGVOHSy6YE
	1v897KXEpP8bokY7vByq2eEKsjFzIJ4icC+2JcjfFnvrVDRjMWjDfoCzUGfMiY3oNlobAWriCH0oh
	KHgvuFf4b6z4nRwA5+LYxIIVHOfl/oqkEJ4aollLClsfvIrCOLCehQzStxXB+ob5BOfO5vGbTL9fk
	amMfKQKScYBgXm3ufCCP0OiTh4aq7FLh9sexBn+1Bzdgu0Fs82r/5nbngza74q6aVmCfCw//fA/2r
	zFno6Z+rA4onntCa3NDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msYEY-00AIGw-IO; Wed, 01 Dec 2021 22:37:50 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msYEV-00AIFz-AR
 for linux-riscv@lists.infradead.org; Wed, 01 Dec 2021 22:37:48 +0000
Received: by mail-oi1-f176.google.com with SMTP id u74so51698721oie.8
 for <linux-riscv@lists.infradead.org>; Wed, 01 Dec 2021 14:37:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fp57IFJwXNDg+FM0mXX6GajPlTd9hyatpK6xMrXr2z8=;
 b=yBW3CtG0Z8BU+33qZwhljAjoRapVTdfDHG44lR9UcZ0XlrJFEiDeUCxs+bBkHai8LZ
 QLKDOiqb5Hhb3GTqcnPSZZSgNep4mctdg1i0TLxfP+8AAcZt1LIIRMcLJeNU8SJwpzBq
 wCgSRqncGnoW8I6JwEWHU6EgV6F2ko0Ow+J32kj4cz+xBZ8lRt64J+7KQgdVUQuEuqp0
 ljW1WisJtuaKCRsHHVr2I30l/tmeE+z8wTaCzf+qVle9k0p3oK7SG6cQt2wFdW9Ro8mX
 pnQ42KxL7NEI0zQZqr/rvTTPmRkJkeL/liUrefCFikm76SnnJHeRAe0juefWtcDJUpdd
 rvCA==
X-Gm-Message-State: AOAM530yUFW7jghMGmFoy7y3aBw+yKbLxKBNLlS+nE5evVMZwNPw1YWQ
 zlHGgTx+0OuAaGqAUGjpmQ==
X-Google-Smtp-Source: ABdhPJyPx7vZ0anj/VrjmXACLAoeK/6LkIEw2WUY+k5nu3ugAvifdlnw0FuoaP1mH3/Byg4W/eKy9Q==
X-Received: by 2002:a05:6808:23d6:: with SMTP id
 bq22mr1142503oib.71.1638398266340; 
 Wed, 01 Dec 2021 14:37:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j187sm526919oih.5.2021.12.01.14.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:37:45 -0800 (PST)
Received: (nullmailer pid 2930663 invoked by uid 1000);
 Wed, 01 Dec 2021 22:37:44 -0000
Date: Wed, 1 Dec 2021 16:37:44 -0600
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Green Wan <green.wan@sifive.com>, Palmer Debbelt <palmer@sifive.com>,
 devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Vinod Koul <vkoul@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: sifive,fu540-c000-pdma: Group
 interrupt tuples
Message-ID: <Yaf5OJl9970GxyMF@robh.at.kernel.org>
References: <20211125150233.161576-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211125150233.161576-1-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_143747_389943_1CE49F7D 
X-CRM114-Status: UNSURE (   9.78  )
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

On Thu, 25 Nov 2021 16:02:33 +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "interrupts" properties should be grouped using angle brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
