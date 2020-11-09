Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870F3C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:09:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1061D20897
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eXBktWOR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv8bGc1N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1061D20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MZkhEVzgt11uWJBkeSY205uwTdd/KbEdXDz7YQxNrZI=; b=eXBktWORM7foyAOCnclRypvjK
	syzsKLK2pQPbLO2veMETHPltfw4SSKPWEyjC9sTX6zuaTy4AV9slGywToohmGOnysCGznfksBcvKg
	yFnAHRu1T+4fkwDOvgfboKBUSR3+kGAMEg3sUvjhO+6g0WDXtwRa/70rfsStkCCVgGzYWsRginE9U
	3dUFQXRzX6vzMsE1Hg0pgqG3t3zyghPbi5bX9JMsGfjK4Uq1Kbfa8W8ZrtLXfd6fj9ebZPKv7r7pz
	OiJsk2I7vqwDPxj9KA9CQSvDHRT6qNZVJqkMQRgmvTmPn7cgTozMsuPj8ckZ+j+jpffo76SVifmvF
	JQ3wAfayQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8nR-0001g0-Cd; Mon, 09 Nov 2020 15:09:29 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8nP-0001fE-IF
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:09:28 +0000
Received: by mail-pf1-x444.google.com with SMTP id c66so2715007pfa.4
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OXgL7bSpCk7huS0ble+eQtkF8YqujPFaIjmAgT6P/OY=;
 b=Zv8bGc1NiJu8a6ryJT8jY18QHrQKXvat8QSsQZB68X0umR8p3tPO/KelI+PraSirmh
 mTqj+ufpkwBOX42ckRrDwLYFXVz4iS8tPLkrMchAP0mP44el5uTcfVawcwvXcHA6u8zt
 I6oTwdD7rr8U5DYoIHA3zVN7/Cf+33Fbgp8jA8DR3dzWWwm4Z2PrrewN6O6iSX7qoj/U
 5ZRlhCyvCE6tCacFAfs3iNTACEZqYyeAVWFQePsdr6pWIv37Hi48x51mdciktsaEn73e
 Jcg2VY3s5+z2jKfm/ZhsUYsr9za/PXzxevrxfY4p2wbfIeMJMlOHe3Wa0t+DMP6DpSQm
 N3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OXgL7bSpCk7huS0ble+eQtkF8YqujPFaIjmAgT6P/OY=;
 b=Hdk+L8GAj7wNlwjbdg6xSpavxtZHXhfU1NZVXXfUt6Aq1Obd6azvFmfV1xnalmzUR0
 TMo3Cj5x6R2oYR0G2Z7y7R4w2KlU80fRt97eeoWVc5Bn+s9fSK6YBiK+C5kHO25TR3zr
 Dh7mtfP46HTqw3UUr9geUH7KEFTBxHn6/WNvcRo9YSJdGafHMA30eMzJv0prJk+l6RAu
 QAmOHvRngXVI84Mq1utWSmuTxgK0IaXe85v5emuD9QWisV56JCiOft12ztasBvRWpfta
 RVjP4U0/MM3ORTP5tC67HRMPTLKnIlpdI+15nzDHdmgLWKJtJwa6qzk3oUtzax/5lCVR
 GZRA==
X-Gm-Message-State: AOAM530JKFtPaSfaMC6a/6/O1bCOaaSCIFPZu6y1lY3LMUog9YXfJ5Oa
 KgQb+/iNXu/Fy2eqM6TRE3PEQ46+wpGO8qKcXniOnpwxbos=
X-Google-Smtp-Source: ABdhPJyMSquh48GLk2NIL2CXXYgRILy6QvYqhJ4/SJTpzUiyihT8kl81IiarqQ+V+G7O1I1FnWuQFCQ91u1hJRmsjWA=
X-Received: by 2002:a17:90a:430b:: with SMTP id
 q11mr13852276pjg.129.1604934562239; 
 Mon, 09 Nov 2020 07:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
 <6dc6d52e-a39d-c351-5280-71b9e8eafe37@gmail.com>
 <CAHp75VejtoTRAM1JmGib3OaJwzuw9Bb-qb08+XhdZUOuzTGUKw@mail.gmail.com>
 <CAHp75Vc+h5PCqBUnyFshw8RE4zWusE+zdvKKSxBxfFw1_5k0vQ@mail.gmail.com>
 <7e8bba71-763e-2e09-88d2-d736a56a6920@gmail.com>
In-Reply-To: <7e8bba71-763e-2e09-88d2-d736a56a6920@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2020 17:10:11 +0200
Message-ID: <CAHp75VdFd11XRQ5xj02=5NDZkPNc1xvdjayXBJk28VzgZH7bFQ@mail.gmail.com>
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_100927_626223_330E9F1B 
X-CRM114-Status: GOOD (  10.27  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 4:49 PM Sean Anderson <seanga2@gmail.com> wrote:
> On 11/9/20 9:41 AM, Andy Shevchenko wrote:
> > On Mon, Nov 9, 2020 at 4:40 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
...

> > For DW_ssi v1.x DFS is always for transfers up to 32-bit.
>
> Do you mean DWC_ssi?

One is called DWC_ssi (yes, the newer IP)
The other is DW_apb_ssi (the older one)



--
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
