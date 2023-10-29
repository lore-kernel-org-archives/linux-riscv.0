Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB29C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VFmyOSU3vlq6j5P3orR2sbyDCdTa8hxGmmEdHaTX6Y=; b=i2eY2AadTDKsUq
	/aUjaFWg76uM0UpG63lSmS1votn9v51jNCv5PwoCCs6BW+gZjBWw5rkRUI0IT+nGib1pQJLWoNIx7
	03EG+G+ZNddqBF3j4WfsZTjKHLwUBAtkgL2bqIAYZz7Vnr1Xps1ZosOAkhOb2cuL4ifyISQpe7271
	AmYhXWnDd2vwJJ6M+dciYl8cubIYNzZRGjnK9yzL9U6rXS1NmiT3yoSsku5YtH+jLkub8UGFLzsVP
	VJHZiOd5P9QvybEEn2aC2s9gv6nmTTwXKSUsuaYj2aQkBPvJLqE1xjhyhgq2aqT7TliIkjXya9oCg
	/qjX+xVU1NTglXd3qD5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx91m-001vzz-17;
	Sun, 29 Oct 2023 16:52:42 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx91i-001vyv-1U
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 16:52:40 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5ac376d311aso32428827b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 09:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698598352; x=1699203152; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aoy1l/OIWuZyO9Z9oXh2HgTPM0zwmwHlZqeVfBp4F14=;
        b=MXce4N21u8Ctli1BdeFB7QEStgUU0IeFutQcLLEgT+049Eao5vq8xy/p+yTUzYgU5w
         q375iVH0XNJshuZmKb7tZtL9QHIWkVUyy59L/GIjoIyUYSDyw95dTA7UnGRxCEnsRGzI
         Gzrte0mbYZYtfr/bpdrg/4007TqTohPbwLWSTe24NWebKTRfxoi5mJ60U5th5T/7Wh+5
         6qmm+prNLPmKReGj6tHp2woqlzwDYtDnsXwfna/c48XsiVSy5zTR5XpRoLrwAeLEDZ22
         GWxsc6Hsf5oSGLrfmKb5AtPS8vWsLOiteEzLGDDVuqbzBVTw3vF0XQGMHdY8zubPSRi1
         W9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698598352; x=1699203152;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aoy1l/OIWuZyO9Z9oXh2HgTPM0zwmwHlZqeVfBp4F14=;
        b=C7N+B8PMA5CuCzOJ0ZzqZ9SYurQJG7jp8SWo49A2w7H/y/4OIn6Sigc40Agz7xmGEY
         7UmgAhoVDVd88doZYIXj9A3QMpAjEkApHOw2bwi7AN3ZMXqpQ5I/WlvmNi5n4w79REkP
         IcDg6xyvvj+oKSoJzgc9lB4Bq8WN5prNwdksz6X9ea77uC3+tzv8z25mhCdbEHQ0Da0O
         8Vt/ahxSyWVzl1qfnf55v5SneROe+AzhMJj3NnajOUNcPZAHACHs2gkFR4VSUBTmWwPJ
         hoVNhZS6xMMtVA98hpGNloFiDetyycfLJ9TKXPgRypwbkkfpi88Xr2doZfyePj5UkR6g
         4Erw==
X-Gm-Message-State: AOJu0Yy54o5vZSiIvvyKvoxaDWjx1Btrd7BBf3DzjKDGUhfPoqRJMrXY
	d07pOdUWzwwTO9oOZt9htHgpfmZ7vCMgIznI/AiUSQ==
X-Google-Smtp-Source: AGHT+IFXSrP5aeoWhs3Y4D0eNG10IP70i3n/QShH9gKSv775NDiMg4SU6zfUoxyYEuuq+a+adTKElsBDmpSGQ+aBEhI=
X-Received: by 2002:a81:e50c:0:b0:5ad:a3f9:1b10 with SMTP id
 s12-20020a81e50c000000b005ada3f91b10mr6688733ywl.10.1698598352517; Sun, 29
 Oct 2023 09:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20231025103957.3776-1-keith.zhao@starfivetech.com>
 <20231025103957.3776-7-keith.zhao@starfivetech.com> <70805ff2-56a8-45e1-a31c-ffb0e84749e5@linaro.org>
 <3twc4zoohon7uujypgjtlnryfmebx4osvpykagnwr5nemmqz2w@w4vw55uswebh>
 <CAA8EJppxQ7J8DEDFsWzPL8bDpNW-KY0nhUA++zDBRpMCpP-bkA@mail.gmail.com> <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
In-Reply-To: <344veqjvvwlo7vls2kdlgjggf77of2ijxwc2hmk7tarm75ugcs@bmozk23uqxqr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 29 Oct 2023 18:52:24 +0200
Message-ID: <CAA8EJpomaDoJVkq+_NhcxqOs6X-dFd=Vo9Wtqnp8egNaWzDH2Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] drm/vs: Add hdmi driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Keith Zhao <keith.zhao@starfivetech.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Shengyang Chen <shengyang.chen@starfivetech.com>, 
	Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Bjorn Andersson <andersson@kernel.org>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_095239_271104_4D540248 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, 26 Oct 2023 at 14:53, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Thu, Oct 26, 2023 at 11:57:22AM +0300, Dmitry Baryshkov wrote:
> > On Thu, 26 Oct 2023 at 11:07, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Thu, Oct 26, 2023 at 01:23:53AM +0300, Dmitry Baryshkov wrote:
> > > > > +static int starfive_hdmi_register(struct drm_device *drm, struct starfive_hdmi *hdmi)
> > > > > +{
> > > > > +   struct drm_encoder *encoder = &hdmi->encoder;
> > > > > +   struct device *dev = hdmi->dev;
> > > > > +
> > > > > +   encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
> > > > > +
> > > > > +   /*
> > > > > +    * If we failed to find the CRTC(s) which this encoder is
> > > > > +    * supposed to be connected to, it's because the CRTC has
> > > > > +    * not been registered yet.  Defer probing, and hope that
> > > > > +    * the required CRTC is added later.
> > > > > +    */
> > > > > +   if (encoder->possible_crtcs == 0)
> > > > > +           return -EPROBE_DEFER;
> > > > > +
> > > > > +   drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> > > > > +
> > > > > +   hdmi->connector.polled = DRM_CONNECTOR_POLL_HPD;
> > > > > +
> > > > > +   drm_connector_helper_add(&hdmi->connector,
> > > > > +                            &starfive_hdmi_connector_helper_funcs);
> > > > > +   drmm_connector_init(drm, &hdmi->connector,
> > > > > +                       &starfive_hdmi_connector_funcs,
> > > > > +                       DRM_MODE_CONNECTOR_HDMIA,
> > > >
> > > > On an embedded device one can not be so sure. There can be MHL or HDMI
> > > > Alternative Mode. Usually we use drm_bridge here and drm_bridge_connector.
> > >
> > > On an HDMI driver, it's far from being a requirement, especially given
> > > the limitations bridges have.
> >
> > It's a blessing that things like MHL / HDMI-in-USB-C / HDMI-to-MyDP
> > are not widely used in the wild and are mostly non-existing except
> > several phones that preate wide DP usage.
>
> And those can be supported without relying on bridges.

Yes, they likely can, in the way that nouveau handles I2C TV encoders.
But I don't think this can scale. We can have different devices
attached to the DSI, LVDS, HDMI and even DP image sources. I don't see
a scalable solution for either of them. E.g. by switching drm/msm to
use panel bridges for DSI panels we were able to significantly unify
and simplify code paths.

> > Using drm_connector directly prevents one from handling possible
> > modifications on the board level. For example, with the DRM connector
> > in place, handling a separate HPD GPIO will result in code duplication
> > from the hdmi-connector driver. Handling any other variations in the
> > board design (which are pretty common in the embedded world) will also
> > require changing the driver itself. drm_bridge / drm_bridge_connector
> > save us from those issues.
>
> And we have other solutions there too. Like, EDIDs are pretty much in
> the same spot with a lot of device variations, but it also works without
> a common driver. I'd really wish we were having less bridges and more
> helpers, but here we are.
>
> > BTW: what are the limitations of the drm_bridge wrt. HDMI output? I'm
> > asking because we heavily depend on the bridge infrastructure for HDMI
> > output. Maybe we are missing something there, which went unnoticed to
> > me and my colleagues.
>
> A bridge cannot extend the connector state or use properties, for
> example. It works for basic stuff but falls apart as soon as you're
> trying to do something slightly advanced.

Ack. I agree, we didn't have a necessity to implement properties up to
now. But that sounds like an interesting topic for DSI-to-HDMI bridges
and HDCP support. I'll need to check if any of the RB3/RB5/Dragonboard
bridges are programmed with the HDCP keys.
--
With best wishes
Dmitry

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
