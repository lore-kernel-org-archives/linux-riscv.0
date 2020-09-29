Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59489C4741F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 11:57:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2CF206F7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 11:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kGmkbyQv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHaYZoOW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2CF206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PYZjNH+xUEPSAgpYgwujtMJLJXq35rJIIGgXe2f5vSY=; b=kGmkbyQvgHgmLyjHM5Ffs/Mgp
	TUr6107BmCyuIKsJxldHbsfuQcYkjX4wpzjrEFJAOYm/n8bBpGMWd6N2+tEo45FaDqngIuTQ7eWV9
	gWv1YRthFVrs6x8hlMN0MTO+92LbJ/rrBuLx0zYMZ2dk75UEB0Or5F9uwp26yNyz7S7i/bQG1X4WH
	QIJip12WWxUqrOSwxGauDz0isYY8mzljsMjrjR7UTqHBiaXtTkUZrztiROPqcK3DodUW+JyRuPl9z
	yB4SFOWSHi5QLiVTLFP1fUFO+c4BQ840z4DMvnN3PpYD10bdkftzZz3cJcC7xjiHmKwd25qZprOAK
	eA+DlkY3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEFm-0008C3-WE; Tue, 29 Sep 2020 11:57:07 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEFa-00086X-Q9
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 11:56:56 +0000
Received: by mail-lf1-x142.google.com with SMTP id b22so5124811lfs.13
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wEyAKkg0BRNQb0XI+Fllxgmsp9nACuRk2KZy+Qn9luc=;
 b=yHaYZoOWCf/DHJ8zu/uGiwS87eaTWm5X0wFr6/CgM+gCpKVtO1OPRnU7MlwLFUI9p+
 mBBWvwggrUlrZvBFXfkwqtk502CUhlHOaT2t559bQqiY1oR4qARzAybhVKHCCgQHiZLT
 z69TeGvPcFpc3YXXgHwmSAOjmXQYzvcmKvNXmKoMPL/nwFhT6VHaXnL/m5pe2QWup9fT
 HkFJ5uGvhPyMuJZfZ0r1AsSxtKq16wvunbGCMvHBsESfALV2QBUJNT9JLStrZS4uJfHu
 GEs3vqIorBxvGYEIXEWYX/cEK5FE32k08PERFeKojMhszEQoYxqUrzdUjNTac2pDAHfi
 kuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wEyAKkg0BRNQb0XI+Fllxgmsp9nACuRk2KZy+Qn9luc=;
 b=P11IZ8a4Fn6NLg5TeXGS5atZ3QI+hIXDNbi9C7Ji6NPo218mJ5/jeXTAFPVkrnl8L8
 oSQK1G7wiCjjj9Y13m54TOmEEiqG1W7QYQMtQ5HvCyc8FAyt7oV1YD05tqJ3NIL2QWQr
 GBWUmvN0VWrroOQLMhuZtqN7N8QnaoOMMzxWDOAF5Tpzrie5NEXewVRfm9Wi4bNvMd7f
 2x+uSGlMoVmHIWWSuU5sEDnsYaxOoXv4J1ghCDT2k2j60WsAqjDZXzAdUPdCZVVIf+NB
 TQ2gPkgLnFtyE1MbLNbH7f9OcVudwLN734uUFg/SjX2itpCEMfWzdscuk5ZHwPSlbVey
 9dCg==
X-Gm-Message-State: AOAM5318vB6vxUYG8aMisuguq9+mauIIb/O7+DsNxf+5AKsTwgX4vSNP
 Zh6b6k4NcoYhjuXgHlw58j1C7D5CDVHT9iAt096WhT9GemAJnQ==
X-Google-Smtp-Source: ABdhPJxD9RnJu9niLvXl7peBAqIn8XNlpZwat8yHk+I/9rvKMxpEJuaIW7mJjGdLPOSa+o71BKqK6zUX6arDevsifYk=
X-Received: by 2002:a19:1c8:: with SMTP id 191mr1004517lfb.585.1601380613115; 
 Tue, 29 Sep 2020 04:56:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200916162250.16098-1-krzk@kernel.org>
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Sep 2020 13:56:42 +0200
Message-ID: <CACRpkdacWQKgCY1E=ONegPRE001UA-DmvRKB+Yz1maapYQ5rVQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] gpio: add common dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_075654_918110_55D2ED3C 
X-CRM114-Status: GOOD (  11.19  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Stefan Agner <stefan@agner.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, MSM <linux-arm-msm@vger.kernel.org>,
 Sungbo Eo <mans0n@gorani.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Yash Shah <yash.shah@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> This is independent work of pca953x bindings:
> https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u
>
> The DTS patches can be also applied independently.

I'm a big fan of this patch series and hope for a v2 soon
so I can apply them.

If you do not foresee any conflicts in the DTS files I can
apply also these, else you can apply them in the i.MX DTS
tree (wherever that is) or I can provide an immutable
branch, whichever you like!

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
