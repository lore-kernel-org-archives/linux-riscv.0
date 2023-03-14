Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71414C05027
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Mar 2023 20:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B59+Lc9rtgZEIO0/m33t63z6i86P8hMKcjuiPEai80=; b=NxViD6FLxVya7s
	0Kj4mZLmAbhp/dD8cbEpXfo18f9p74p6YgdHkNjuL8+La+4qX29TatLWfG9poB+emMaebl/3dCZ2s
	SJrckA9TPYxRdJlPfm0YifyhCS+ka7X8Vna3xSLeYesPFCxRIJr4d48Ey//xd4lMzktAvemRi5np6
	XiIpcy44JglaWDyo2TjGPOxDxjaBdEn+yj4sgtqX7ToCXH1D4oDWEQ+DjLNMw6igj6qX4OCiR8+ne
	X0vEU1hWPTt5FRwLLBq4d3sOoQrVKzlbAP8l2IEydq+NBGrVU7dQ5J0WDfjCHcPQFHc87Z5TDh6T/
	p7yIFj5RW/Aat7LnMSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBMw-00BUv3-2x;
	Tue, 14 Mar 2023 20:35:38 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcBMt-00BUuA-05;
	Tue, 14 Mar 2023 20:35:36 +0000
Received: by mail-ed1-x535.google.com with SMTP id o12so67168389edb.9;
        Tue, 14 Mar 2023 13:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678826133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxwSO/LBuR46CmjoeXSfo+IWSWZ/3pwKZV8PIGQHNrk=;
        b=C4ylx+Vos6HtqYmeSZulI1EuEc8EaPUOfBPDLOFgvFEAqZLFPDAkR6+t48XM7KjrYy
         zb86bFi+M5cyq1+JMrW2h0gT/X5utpQaCzusAngPMCnM1ifzrAotuCOzP/XF2+yaaQkh
         7dycbEN4zQhpe/z3hawHy56L8Mu2SmKPZNduTRDRE9PItjeYDi083Kobx7bAVbOwKDA0
         A2qZSTNk0Tppr/6w8gVt3C/4wcT3zMJ/BrSSRvvphwOlWddyRC7NugFJAPfGKSicHAdv
         7DbnUk5173ijub6f/juCxDAMNr6Lk7toO8ii1/g1bvDzySxLQxbd9D2NpqNGcChRsxEH
         KvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678826133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxwSO/LBuR46CmjoeXSfo+IWSWZ/3pwKZV8PIGQHNrk=;
        b=T4b1p7Ec/RcUPRlJqytygcu/btfLTIUC9m1d/1RzSv6geAfRkh9BL5Fa+7QAWT/xF0
         S8CxBMOBfjRydfNTK8vzXTZQsuR0WeHlq5P26CrWmqQQ6O5G147DxeqqpWvw052fwbzD
         SjYL65cvicaeWW13vXuffFCJ65jLttFD2DnkHAheyUsxdRW1aOQdtY0HNEgcUvXyUK5G
         6qns/EXDHj54sQ3q6gJUq9bwf7j8lO0zQliRsjCE3qQiQ0OsGDEr/TTkwLu83teoKhL9
         bx3ZigOM2VAU5bU25U/y06FkdWUr5XIwQtrRJLi82iKT3uqVyT98kgm2QUV/+KqKuLjq
         Juow==
X-Gm-Message-State: AO0yUKV8GTtqwTipM1Jzvg4gWPJjRigyWjGjOzBN8h0YU3Tv/SbhZyYO
	0E9C+v3SMB9ivHchCBN6jQA=
X-Google-Smtp-Source: AK7set8qAKElSfLk862Fb1U9iBFSLCsZ8OOml5T1pwcqPd2vA6HdnOUeXnTHL6GcYsNrzwpY2GGN4w==
X-Received: by 2002:a17:906:2512:b0:87d:f29:3a16 with SMTP id i18-20020a170906251200b0087d0f293a16mr4278916ejb.34.1678826133362;
        Tue, 14 Mar 2023 13:35:33 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id go37-20020a1709070da500b00927b85e48b0sm1539379ejc.111.2023.03.14.13.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 13:35:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Chen-Yu Tsai <wens@csie.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add crypto engine node
Date: Tue, 14 Mar 2023 21:35:31 +0100
Message-ID: <3544095.R56niFO833@jernej-laptop>
In-Reply-To: <20221231220146.646-4-samuel@sholland.org>
References:  <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_133535_066058_8DC153FA 
X-CRM114-Status: UNSURE (   6.99  )
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

Dne sobota, 31. december 2022 ob 23:01:45 CET je Samuel Holland napisal(a):
> D1 contains a crypto engine which is supported by the sun8i-ce driver.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied patch 3, thanks!

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
