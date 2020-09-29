Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D78FC4727F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 12:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6ED62075F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 12:38:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="goF1/jBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6ED62075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qI6z7ZlC1j5YjAIYdFLDGYDlSs7QCn6f0ZkXkZ36KsI=; b=goF1/jBJPSdrkZbgw/dIZz5Ja
	VilPVse/2oi7nH0CFOp9/czTvhumFJV00apWYJnnUJQNM6itksX00UP1YPFEyZb2Wa/r1tK4eEynu
	4MqOyAqy4TmruyLe/am5oF8bWVDwHcPiKZe2EWjXsbPdlH3nYpBBIOALd8VpL8o9O5RdlSJrPdYnF
	W7nygrzDNiZnfAntEnh43XtBfuH78kMfmJNnG6qVvQIiNTddI/wog1iGbSCwPUljmmtywNau4h/di
	eivsB/ck+KF2P1Ty+wYmFtCNI/kmmV+GZGlriZ20UBJxOOzgLwAyHkcjHIDHx5RkUAZ/veK6Wqkha
	WlZnqdTVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNEtf-0005tW-5H; Tue, 29 Sep 2020 12:38:19 +0000
Received: from mail-ej1-f67.google.com ([209.85.218.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNEta-0005sA-Jl; Tue, 29 Sep 2020 12:38:15 +0000
Received: by mail-ej1-f67.google.com with SMTP id j11so14825594ejk.0;
 Tue, 29 Sep 2020 05:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8cBo88Rf0XB3Amo8WHaoA3mvFSPQ6LbFDMO+GstCOgU=;
 b=BXezsaxzppWu8aoDTiYOs/7YCWPqrHn/WeqAIPXHFzrkTZt87yc2l+g3c21DZD+F9g
 QW6cBl8MluMUJmvPWFWCxXkkzRsqwSTRXV1qmwu1TV2CBak3xfSez2nfJtHCcKVJfKhp
 +EPTTCaifOnm0xfDqdZA9PTs0xpmsdYCFBchqG22l2N7Dohq4UddXzc+WjyFBWxG/aEY
 AGfhKBHJgTq0tErfKWSNVmul4/SbWRDJ0HzfOiCJ1nwHn5QEZQDwm3g2eYyqp/PsI10c
 //0R6mnFdLlytNDPN6vKKOvNt+mGKRMyoB+qh37mmWDXHrOWk71jhSPXq0w0iJHPSvfd
 1Q2A==
X-Gm-Message-State: AOAM530hEmVgODH6/Qfc/f2xb/lS+fqhhppklGezUvUBtcNH4fbtqavm
 VuVi7vZzgQumtOGIfcoxW+w=
X-Google-Smtp-Source: ABdhPJywdVpCr+WJQxL/CB+8FU0Ise/EiUvtP1NqlRdfdlKrgf438XWp3aGFvYREkH3IV2E+mX7okA==
X-Received: by 2002:a17:906:b28d:: with SMTP id
 q13mr3590683ejz.378.1601383092996; 
 Tue, 29 Sep 2020 05:38:12 -0700 (PDT)
Received: from kozik-lap ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id c5sm5704977edt.24.2020.09.29.05.38.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 29 Sep 2020 05:38:11 -0700 (PDT)
Date: Tue, 29 Sep 2020 14:38:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/8] gpio: add common dtschema
Message-ID: <20200929123808.GA21809@kozik-lap>
References: <20200916162250.16098-1-krzk@kernel.org>
 <CACRpkdacWQKgCY1E=ONegPRE001UA-DmvRKB+Yz1maapYQ5rVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdacWQKgCY1E=ONegPRE001UA-DmvRKB+Yz1maapYQ5rVQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_083814_657157_F2D7E9A8 
X-CRM114-Status: GOOD (  17.69  )
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

On Tue, Sep 29, 2020 at 01:56:42PM +0200, Linus Walleij wrote:
> On Wed, Sep 16, 2020 at 6:23 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> > This is independent work of pca953x bindings:
> > https://lore.kernel.org/lkml/20200916155715.21009-1-krzk@kernel.org/T/#u
> >
> > The DTS patches can be also applied independently.
> 
> I'm a big fan of this patch series and hope for a v2 soon
> so I can apply them.

I sent the dt-bindings part of it already to dtschema and it was
applied.  It's missing the description of properties due to licensing
but at least it brings the hog nodes validation.

> 
> If you do not foresee any conflicts in the DTS files I can
> apply also these, else you can apply them in the i.MX DTS
> tree (wherever that is) or I can provide an immutable
> branch, whichever you like!

Thanks! I resent already the DTS in separate patchset and most of them
went in.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
