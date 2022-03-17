Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A42C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 23:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jasBsq0djZrp7OhPYtBkhM+PyiJ+AT9c5EqkJJvobaw=; b=Zxfy0cWtAO76YG
	KbGcBqA8QpVuD8f4JBF+CZyz3m8jI6faPA4Rum+XLi3BGYW/qAb08zcyDGgOpQBEyw3H6JXdLgrll
	dwGfZwQJJFImJ6RhYN4NqsjKtIaTjZwg/cWiSBLQDS98ZumFsphlchvOwovL8VuWnqglJkHI41/9A
	6AMiA3M+Y1/y3qTo+vFqiUALZXO7jf8mpT+8M0g02sjoJwfP2dfsXjbkvfuB1I01tGkn2/OHJ4etP
	FwAuD6E7KivkL44N5ofNSEizLCcc8OBEYaeOQC0Y0TJz4qcJvEEYSdbEP8wSReTtvvaNJxnZZ34yx
	aDyc415FNc+jF7TGpnQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUz83-00HZBq-MT; Thu, 17 Mar 2022 23:01:59 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUz7s-00HZ9K-GN
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 23:01:50 +0000
Received: by mail-yb1-xb29.google.com with SMTP id u3so12972052ybh.5
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 16:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjpeHshr55oXVbRkRUel/sp4CJH7Ek81QT6z+rRB6S8=;
 b=HtQ8698j/GkuPOZp01hGhOmnDThwuykSIVbzZT8HLyvOMehvriKXIHX3PT+MEnXiuu
 9lwzZcsl1IkVVuTIBPZbV5ekm6upDD5S6p6Kl0b7eXclg6iINdHjGxQrKPXdldyuBUsg
 h23/4Q6kkdZ+Etckx4W8ponNMzQ3iRuFDpKSS6Zd/JLP+p0lEYCynNvRPmlClU03Onro
 grI/EMU8xcuHkARp5fDq1FopIwxeXkki1ZHaOsyS0ftNmZinm327BN43hb9lMeYXrq7z
 uzc4oLY/xeBkyTT9bD5cv3Q4uvoEt6o3ccWfoYik6eiY20eZ0Uvsd/AniL+StFDalV+t
 eXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjpeHshr55oXVbRkRUel/sp4CJH7Ek81QT6z+rRB6S8=;
 b=oGlNUqWQPInsp2kt/ik2DPFnJOWpdQlUYPC9+oNvaZtxKxU+8MqvVlBBseHnChmRJ6
 ArXvb96juSk/xiyrhgLodKf/snde840u084nhEWVuKf+Im2SfgSiZ1/vejwnREFEIgHk
 GgUzG7PQ0w9EmpJoe2Z79kz/YYB02A0Y/p4xaVnXuVJwNWnV+Ye0wPArid+yasDm5J30
 a7b7DAAF/YL+EayNT9xxBpKChBuf5bmn3R+g8SLAYXdVec1FWCR8p/xKN/go46Nmeyjf
 OBDXfZ61UOZjwc/2Ghj6GcAD6AIhvaewlqT0cZ3UXeglHW8vQjvuHg1pz8MNAc4xhfBm
 hYEg==
X-Gm-Message-State: AOAM5333qM4mNc5KYcKH3F1ghNaeboscXjGptfHON1vwu8V+Ri7ZrfTd
 8uHXSSCkpkeedgaxK1A+b9I0xaD/E2r0HX+Yan1IZA==
X-Google-Smtp-Source: ABdhPJxUH7FDJL8h8BnBMwdlrY2wLUcnT5H3QzKOyq8DCn5DLiSJpxwc/UeAB4reijZISa/1f6WVJpXdp16QsqcRX/Y=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr7372536ybi.492.1647558107436; Thu, 17
 Mar 2022 16:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
 <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220317115705.450427-6-krzysztof.kozlowski@canonical.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Mar 2022 00:01:35 +0100
Message-ID: <CACRpkdafKz7hqinCgWrKuSQjefaN7cZgLbhiYUtVXg3=mrELow@mail.gmail.com>
Subject: Re: [PATCH 07/18] dt-bindings: irqchip: intel,
 ixp4xx: include generic schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, 
 Krzysztof Halasa <khalasa@piap.pl>, Michael Walle <michael@walle.cc>, 
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, 
 Bert Vermeulen <bert@biot.com>, John Crispin <john@phrozen.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, 
 Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
 linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_160148_556003_7A37C124 
X-CRM114-Status: UNSURE (   7.05  )
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

On Thu, Mar 17, 2022 at 12:57 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:

> Include generic interrupt-controller.yaml schema, which enforces node
> naming and other generic properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
