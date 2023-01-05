Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797CAC3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xq0BoZ+xHuWVseFDf6uC+BETRKYl3/EHOB7Ycw3G+DA=; b=I3MzaaaUZqXCha
	vGdXX9cH3P9nDKH1TNKHs4BgELYtwOTEOTf88yo6Nvm+doHrtvoOH5t4520tMxbV3sSHSJ8wGo2Q6
	WBWVYjSwAqaCvCSdNVb/m+GjG7cglIx4oMr2toKqld3JOwde13JNcKO/8jT4Z9YRXILb3qdQSuTEB
	03ZrW1vH6t96rVGDJilwsLjZBxohxnBeeTs0NelDdz3wqqg3vJhQ2QU1kOPDhf9lw05R6hxFs56mj
	RnjRUw/AKgVjYPTJlD9t2MaHoNrv0RuHNI1bu89VSErjEf1OTNA27BwkJVtCw24FiOWqQrZqjAPPn
	6cCXYhgZ+hiJ/GLz0EgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDX7t-00EirW-7J; Thu, 05 Jan 2023 20:46:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDU8X-00D091-0i; Thu, 05 Jan 2023 17:34:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id r2so2022603wrv.7;
        Thu, 05 Jan 2023 09:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yFsobRjIEmQm/DKnD82AMLE2egCJRjpMOIJdP27XLs=;
        b=Ok61nY5Kao4ppgyPXSS8swkii7i2kd66zOt2jX9qQ+Tfv5GgacxnCkiGMezhCzNj9X
         n+Yp+EgcV4yBHYcDQx7PMoYmmKI2phxaAubd5No7nP248rq4vsV6kw0nvlkHwVAMvtDk
         6IIdWux63nEEUuW4QIsp203EoX2UDzCjXzuPXTTOT2zQtSzD1m3COLJgM2JC1PzOIPUT
         B22Ny80hRW+8y/M27B7QEY07eZZWQAo4KZaKClg/HO2xbFWiDhheFZ0doa4eTMagK0jG
         AK4zRba8lh7A+Nj0p4GNzIVy20smjUdFKLrFvIdY+YTLtrXQcR5dKlO05uml5C5sdmLn
         0/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yFsobRjIEmQm/DKnD82AMLE2egCJRjpMOIJdP27XLs=;
        b=tNvrT4Jh6wYhpV9yt5ZdUcn2d0TUvaimpIrlDckUy4osEhtivJPTVTeM7ixp8CiuIL
         RdGkRuvUnwfSwyaIyfA932VKbbFoA6v7qKtc9y4EhRAI6udK8zOz+g322zu47rIUKSmE
         RKiITXo8ucxPVp9G6YkGs/hSYNjYbr1vuzioe+M9BABp3KRVVhaWF/Hhp8WVms8F3ZdN
         HOcZuV64mve0wG/DYuW4K+/R07x44GHLM2xjCozGkcDN5UdQovE4UmWg+1j/UEFwbiHw
         LSk2B/cT+jm0ZHX2rnPnuxIE8aq24r4VWTrfKsNWwfWkeZxnE5wZ4oKWyyxNuYOvjjlh
         Quog==
X-Gm-Message-State: AFqh2kqZKirU65L2fY60/7I8llk6j83YC+M0xVMk0xFV9mvwiIa4d77f
	TS+SMoK1TReD3ERDLyQpGQk=
X-Google-Smtp-Source: AMrXdXuRNLB0HJ7TJiRxUb5UM81lg4k8r0EpzD0Wo6njhgCYm6MxIzN0BDQ7pYFS6fb59zvHXKaEYQ==
X-Received: by 2002:a5d:6dc1:0:b0:242:3353:26ed with SMTP id d1-20020a5d6dc1000000b00242335326edmr28981391wrz.62.1672940077645;
        Thu, 05 Jan 2023 09:34:37 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id a18-20020adfed12000000b0027cfd9463d7sm30165469wro.110.2023.01.05.09.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:34:36 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Fabien Poussin <fabien.poussin@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 6/6] clk: sunxi-ng: d1: Add CAN bus gates and resets
Date: Thu, 05 Jan 2023 18:34:35 +0100
Message-ID: <22918155.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <20221231231429.18357-7-samuel@sholland.org>
References:  <20221231231429.18357-1-samuel@sholland.org>
 <20221231231429.18357-7-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_093441_138039_FB7C4B9F 
X-CRM114-Status: UNSURE (   7.94  )
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

Dne nedelja, 01. januar 2023 ob 00:14:29 CET je Samuel Holland napisal(a):
> From: Fabien Poussin <fabien.poussin@gmail.com>
> 
> The D1 CCU contains gates and resets for two CAN buses. While the CAN
> bus controllers are only documented for the T113 SoC, the CCU is the
> same across all SoC variants.
> 
> Signed-off-by: Fabien Poussin <fabien.poussin@gmail.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
