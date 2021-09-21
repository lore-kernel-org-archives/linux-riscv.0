Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB6C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:48:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5EB61166
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE5EB61166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/vpnhahqwIuUS7XGYhK5HDSW7qaN/5f46ypOQ/kC6Y=; b=aStA/vKZMm2XIh
	F/WQPOctMboSMoy/V0xPWugDmAH9m2PkYmajC/mT093+mkYj7Y1fKbYGz1hMNe4c6p8vLMD4nOmOZ
	J4EfSs5M3wSoMU7/5zcQkEJSmkOLLFvslKttRYvgcu+pg+QO1aY0mt7KDR5wFEK+o3FzpELStr0q6
	bmT5wK82BkkOSJakmTqxoriTZ5kRF+L+YXCBAyCajhC+APzMVcGwoaZhVZH+IZZu1tGvYUb2Wqsjp
	LeMIpBOg+BDO2EH3Hc589q2xUtfI79VuPPGWrywSoVdo6QT3Ly31JBY0cfYELY4z9CeK12EcbZbz5
	ltYSU/N0vJYQ7kitKO5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeGG-004OeZ-Vz; Tue, 21 Sep 2021 11:48:33 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeGD-004OdX-V2
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:48:31 +0000
Received: by mail-vk1-f177.google.com with SMTP id b67so4519729vkb.13
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZY77SgczzK0bsUC6Ya84YJ71YaPx+0lAvUQVie1eBTY=;
 b=pu9KaBlOWIU/T/dnsgWr8tTahzE/ktxPTz99u8EZCkXK80o6oxW+tqvJDm1ctxOrKQ
 rs23QNm0mUmFWbfoD/M1YZ6D+wnQ0W1VFVBLMqyOCHPja5MZZGZKs9ecUBdTEcDVp7en
 XjjSkABizPIf3vD/xbcK9yxPR6V8amh2Loex/G5cEyhxbuJIiqN+i89SfY3U6+TWtapv
 GmH5amqSbFACNoDfN7WU5PNkfrMSTvxSmsAu69J84ltnXkqydz19J1eNz6uOdCHkbYTO
 ivu/1VomL53ft00Tq5cJMM90CflHHHn6qr67T7eeMId83MQT+EX0o8KS/MiQzstVf9EB
 pSFw==
X-Gm-Message-State: AOAM530yi+G/ylonuSm4bm77eKfcWevgGV6MiydJeD3R6JXVmODBBVJy
 mzZsXIVOJVBQXO4PtZidhm4M/Tlduj/aNddvTWo=
X-Google-Smtp-Source: ABdhPJwvWhOkK/Dn4XyVAIBiyM+kU2nDBozoeqRacNE353jwcOY5tsH/iuzWg/mPj1E4dTsiY68VzY2hkFxqhmm9GQg=
X-Received: by 2002:a1f:9187:: with SMTP id t129mr4959165vkd.15.1632224907211; 
 Tue, 21 Sep 2021 04:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920150807.164673-6-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Sep 2021 13:48:16 +0200
Message-ID: <CAMuHMdWxWUwBsZoCa1obb5qY4AH0BdC9zwao94aMV8tMw7VxyQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] riscv: dts: microchip: use vendor compatible for
 Cadence SD4HC
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_044830_040072_08A44F53 
X-CRM114-Status: GOOD (  15.71  )
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

On Mon, Sep 20, 2021 at 5:10 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> Licensed IP blocks should have their own vendor compatible.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
