Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500D2EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 12:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lYgOu4Tu+xhSUApb+UzcWOmTbKJzYsBr5PuSP+HIms=; b=4ajIySvNcaCZ0+
	r1TF09Xf8Zb2sZcSnHgEtU8ioUn2aliOmCdWMDmLYRyz4vOxC/mHarw7Ek7L0Z6ecL+1lOqiaVM6H
	fWMZTIoi97vN4gomC9IlFMZPVOkSlsMM1ENqxkzk82syVkpX9rhlwkiKsT71coekFdYB43YdRLyP0
	sCO6VM9AKeH9TDqEX36wANPHPhWwbbodjn+DpCLisuKQdaIjuXs+vWx6BiUqbR8Mx5/b3Vo4ZscQA
	d1C00oGXmQclLAVMwS8LEtSJUyxjCRzfLtCn4NNfRVqIsX/0nj25e8KrEBYyvfiF6XioFP9s0T/C0
	hzTBxjJAkb51xrKFwCZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMpJu-00E3LJ-1Y;
	Fri, 21 Jul 2023 12:33:18 +0000
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:403::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMpJq-00E3Jy-0K
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 12:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=EmK+s79iHYSMxKUHHFzMSHP5Gr4Y9HLSftbd9Ecs9V0=;
	b=GoV3E7VTyj3jSak4WVapZnXdBDXUXPW7O/DjDQR67JvQSlDg0E6Z+7U2EJW2wSazWNIl+zv+6Wa/J
	 Oko9BnChqt1i54NKNZoPyniQnmVclXhem4i6z8bBp6NtJIPaQD7+wnhOz/akOwwRa2ZC0ssNMMwmF5
	 lNENAy8IzMfy97Ci9nY0MdxDviT9U14WA79crnQh6+4/WN84/8V8IqtRI1v5NfAxNuRyjSyPsveGoD
	 tEtb6CyFzXVKij6+gOWLHJl7ZDtkINx+IZzIi9oHL7+60126NBJkga/kfzfjljAZB/5ubdRQDZFbeQ
	 /Y4JIVvzIWYXtPd+u2V+2lGM6a3C9eQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
	 message-id:subject:cc:to:from:date:from;
	bh=EmK+s79iHYSMxKUHHFzMSHP5Gr4Y9HLSftbd9Ecs9V0=;
	b=9xOKpGptgdPeXrLkjWh5r4V21or4l5WCdvZcs1Z3pKTNr83EHudOHcfJcC9y10AUYCZx4y9WENCOj
	 5kj+Y/MAQ==
X-HalOne-ID: b8a6ca80-27c2-11ee-9464-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay4 (Halon) with ESMTPSA
	id b8a6ca80-27c2-11ee-9464-592bb1efe9dc;
	Fri, 21 Jul 2023 12:33:00 +0000 (UTC)
Date: Fri, 21 Jul 2023 14:32:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Shengyang Chen <shengyang.chen@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Maxime Ripard <mripard@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
	Rob Herring <robh+dt@kernel.org>,
	Chris Morgan <macromorgan@hotmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Subject: Re: [PATCH 6/9] drm/verisilicon: Add drm crtc funcs
Message-ID: <20230721123258.GA337946@ravnborg.org>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-7-keith.zhao@starfivetech.com>
 <07cc89a5-5200-72e6-f078-694c5820a99a@suse.de>
 <a8c51143-01cb-a95f-bfbd-16827325934e@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8c51143-01cb-a95f-bfbd-16827325934e@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_053315_511921_AD84DADD 
X-CRM114-Status: GOOD (  22.31  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Keith,
On Fri, Jul 21, 2023 at 07:57:24PM +0800, Keith Zhao wrote:
> >> +
> >> +struct vs_crtc_funcs {
> >> +=A0=A0=A0 void (*enable)(struct device *dev, struct drm_crtc *crtc);
> >> +=A0=A0=A0 void (*disable)(struct device *dev, struct drm_crtc *crtc);
> >> +=A0=A0=A0 bool (*mode_fixup)(struct device *dev,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct drm_display_m=
ode *mode,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_display_mode *a=
djusted_mode);
> >> +=A0=A0=A0 void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct drm_color_lut *lut, un=
signed int size);
> >> +=A0=A0=A0 void (*enable_gamma)(struct device *dev, struct drm_crtc *c=
rtc,
> >> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 bool enable);
> >> +=A0=A0=A0 void (*enable_vblank)(struct device *dev, bool enable);
> >> +=A0=A0=A0 void (*commit)(struct device *dev);
> >> +};
> > =

> > Why is this here? You are reproducing our interface with an internal in=
terface. I know where this leads to: you have multiple chipset revisions an=
d each has its own implemenation of these internal interfaces.
> > =

> > That will absolutely come back to haunt you in the long rung: the more =
chip revisions you support, the more obscure these internal interfaces and =
implentations become. And you won't be able to change these callbacks, as t=
hat affects all revisions. We've seen this with a few drivers. It will beco=
me unmaintainable.
> > =

> > A better approach is to treat DRM's atomic callback funcs and atomic he=
lper funcs as your interface for each chip revision. So for each model, you=
 implement a separate modesetting pipeline. When you add a new chip revisio=
n, you copy the previous chip's code into a new file and adopt it. If you f=
ind comon code among individual revisions, you can put it into a shared hel=
per.=A0 With this design, each chip revision stands on its own.
> > =

> > I suggest to study the mgag200 driver. It detects the chip revision ver=
y early and builds a chip-specific modesetting pipline. Although each chip =
is handled separately, a lot of shared code is in helpers. So the size of t=
he driver remains small.
> > =

> hi Thomas:
> I'm trying to understand what you're thinking

I am not Thomas, but let me try to put a few words on this.

> 1. Different chip ids should have their own independent drm_dev, and shou=
ld not be supported based on a same drm_dev.
Yes, this part is correct understood.

> 2. diff chip id , for example dc8200 , dc9000,
> =

> struct vs_crtc_funcs {
> 	void (*enable)(struct device *dev, struct drm_crtc *crtc);
> 	void (*disable)(struct device *dev, struct drm_crtc *crtc);
> 	bool (*mode_fixup)(struct device *dev,
> 			   const struct drm_display_mode *mode,
> 			   struct drm_display_mode *adjusted_mode);
> 	void (*set_gamma)(struct device *dev, struct drm_crtc *crtc,
> 			  struct drm_color_lut *lut, unsigned int size);
> 	void (*enable_gamma)(struct device *dev, struct drm_crtc *crtc,
> 			     bool enable);
> 	void (*enable_vblank)(struct device *dev, bool enable);
> 	void (*commit)(struct device *dev);
> };
No - the idea is that you populate crtc_funcs direct.
Drop struct vs_crtc_funcs - just fill out your own crtc_funcs structure.

If it turns out that most of the crtc operations are the same then share
them. Avoid the extra layer of indirection that you have with struct vs_crt=
c_funcs
as this is not needed when you use the pattern described by Thomas.


> static const struct vs_crtc_funcs vs_dc8200_crtc_funcs =3D {...}
> static const struct vs_crtc_funcs vs_dc9200_crtc_funcs =3D {...}
> =

> struct vs_drm_private {
> 	struct drm_device base;
> 	struct device *dma_dev;
> 	struct iommu_domain *domain;
> 	unsigned int pitch_alignment;

This parts looks fine.

> =

> 	const struct vs_crtc_funcs *funcs;
No, here you need a pointer to struct crtc_funcs or a struct that embeds
crtc_funcs.
> };

If you, after reading this, thinks you need struct vs_crtc_funcs, then
try to take an extra look at mgag200. It is not needed.

I hope this helps.

	Sam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
