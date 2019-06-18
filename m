Return-Path: <SRS0=m7Kf=UR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 689D9C31E51
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 04:04:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E6AD20B1F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2019 04:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ol0Q6GtN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fNNVvfjL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E6AD20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78oQhNrksJs/C+L6scVt+YDzFijM+1fXkcKJpwVt46c=; b=ol0Q6GtNUqDpai
	+1llLmkvC5iZcwevAjdBVCXFPc8MtNfUy1Uj4gMgVfr2Jim7zubhwe6GEdpLLW+PqycVnmF+3RUOQ
	5uINuJwsoyLpJpybdJ70/MhAHJ3Pa+Y56RgwO8Kb955O6/XPt1eRtT9u11sQCkcFA24j28a9U/byS
	DnENxGeswDa0oSRIDYPsRGiGhEcNrUyZyFxPv9jjLZSsyeCh7aqwtrQfdH9Esb1y6l6YaayGTAeP0
	A2R4/Frfus6tSz4URnjGqhvoCF0pvfwq6TK3YVVSDGFfNBfUM+NulppPRk2VLLyr51rmBzRcz9aKP
	VPVODRhNFfhGLmEIJUPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hd5MS-0000FJ-9l; Tue, 18 Jun 2019 04:04:44 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hd5MP-0000Eq-51
 for linux-riscv@lists.infradead.org; Tue, 18 Jun 2019 04:04:42 +0000
Received: by mail-lj1-x244.google.com with SMTP id 131so11577468ljf.4
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jun 2019 21:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sJLmkVwnPans9/iuFpcwnbTM7EUsIIBXDTl8TGQaxjk=;
 b=fNNVvfjLstujPCDm6U22v9kUb8V+ystPZzxjPsEpjTbMtRt6UZtFM3QfkWDyzAQMIW
 E6KfxvJkYCAiMigfxeNfkJbvlgJdvzEEfyDNXcSQ4hGpsd9Yv0PN3VCeG9Syybma3zAA
 YweVCf2jDX7KE7OToEgZ3Hm86et1Zzc1wT1rS2GKgDnXDs7wUV3rbSDjUKshW4DDBFiv
 WiW8rczljYaGap+qcx/bFr34QWpznmS62Lv9HHybuJDuuqKHqJD4Khp833m98/pUJhJR
 z/Wi3GOSjsiZFAWusKz/vCsNsKbGzD11ktzwf/VoHCT35CeFpX/vlTnPTD2hFmBTUNJt
 WypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sJLmkVwnPans9/iuFpcwnbTM7EUsIIBXDTl8TGQaxjk=;
 b=Nh1OnXCtWrIOF0y/vaL7iX6Voyozu0Rj8GZSW7WYbVN5m/MA0fe0xDMjLxclXKQJWw
 rxsrI0qnmtBGnAnhp2Q2PPhvwol0ZBI046GYyHul60dudG4BZlZGN2PAKMaIAaXuxyHP
 JU58rwKGGBFk67QcMEMxwpXqihDxGGOWawWYS2w9dYMy72KtCYlSbfEOy6Hg+8wd/wCx
 vtq/uUhMj2dx0FSKs5kf356pjUraqfYvCS6tX1uabIbdSvh+CDZf03BKRwqmPlMPvIPZ
 m2tBs4k1PYlqNFILA3kLnj+a0gv8KWrVqLZZi0073VmsGcvMGoTggyCfs87B5pXQXpZO
 ccZQ==
X-Gm-Message-State: APjAAAVL+rozd463CJErfmPPxQreWDs/jbu5KZzDLgiE07rPThGCiukk
 zDexI+FkP4oItpa3GbFlzpjiGGJTC+HQDStECdV6Aw==
X-Google-Smtp-Source: APXvYqzHxAVSyFWFoE5KWadzgd5NrlnSBkdcYDfnoz898BtjOkb8yWEu0/Ss3PN8knMcABE84pxCcZt3rdAD2rwB66w=
X-Received: by 2002:a2e:b047:: with SMTP id d7mr13909677ljl.8.1560830679001;
 Mon, 17 Jun 2019 21:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <1560745167-9866-1-git-send-email-yash.shah@sifive.com>
 <1560745167-9866-3-git-send-email-yash.shah@sifive.com>
 <20190617155834.GK25211@lunn.ch>
In-Reply-To: <20190617155834.GK25211@lunn.ch>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 18 Jun 2019 09:34:02 +0530
Message-ID: <CAJ2_jOEm1+HFewpvq6fdoHaTtghpnxkkz9LWTz3-xWJAtYp8-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] macb: Add support for SiFive FU540-C000
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190617_210441_214962_9402A047 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, netdev <netdev@vger.kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 =?UTF-8?Q?Petr_=C5=A0tetiar?= <ynezz@true.cz>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 17, 2019 at 9:28 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Mon, Jun 17, 2019 at 09:49:27AM +0530, Yash Shah wrote:
...
> >  static const struct macb_config at91sam9260_config = {
> >       .caps = MACB_CAPS_USRIO_HAS_CLKEN | MACB_CAPS_USRIO_DEFAULT_IS_MII_GMII,
> >       .clk_init = macb_clk_init,
> > @@ -3992,6 +4112,9 @@ static int at91ether_init(struct platform_device *pdev)
> >       { .compatible = "cdns,emac", .data = &emac_config },
> >       { .compatible = "cdns,zynqmp-gem", .data = &zynqmp_config},
> >       { .compatible = "cdns,zynq-gem", .data = &zynq_config },
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +     { .compatible = "sifive,fu540-macb", .data = &fu540_c000_config },
> > +#endif
>
> This #ifdef should not be needed.
>
> >       { /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, macb_dt_ids);
> > @@ -4199,6 +4322,9 @@ static int macb_probe(struct platform_device *pdev)
> >
> >  err_disable_clocks:
> >       clk_disable_unprepare(tx_clk);
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +     clk_unregister(tx_clk);
> > +#endif
>
> So long as tx_clk is NULL, you can call clk_unregister(). So please
> remove the #ifdef.
>
>
> >       clk_disable_unprepare(hclk);
> >       clk_disable_unprepare(pclk);
> >       clk_disable_unprepare(rx_clk);
> > @@ -4233,6 +4359,9 @@ static int macb_remove(struct platform_device *pdev)
> >               pm_runtime_dont_use_autosuspend(&pdev->dev);
> >               if (!pm_runtime_suspended(&pdev->dev)) {
> >                       clk_disable_unprepare(bp->tx_clk);
> > +#ifdef CONFIG_MACB_SIFIVE_FU540
> > +                     clk_unregister(bp->tx_clk);
> > +#endif
>
> Same here.
>
> In general try to avoid #ifdef in C code.

Will remove all the #ifdef in v3.
Thanks for your comments.

- Yash

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
