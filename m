Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D90CFB421
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 00:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bap6HVvq783QdnP/WLDrP2OtSvP9X65vNRJhX0n3FK4=; b=xtGpCqRFxlIiEM
	ys9KHdZ6xgu/Ez4oMyZSEnbLW4EhgmO3PqcNHSC3QRsjyCo0w5m8fxLEN4Fga6e18Zsrh99StUztn
	Iw/fn9JEqo00MH4Dl3oeoVKTP5CdTz9A7SSHtI/p3BFmnB+/8uwa0HsOB3gpPPt0Oa1B4jPdvGIUF
	znj/JHkLT7jd8RlkZvmfURZijMgcNkFmiSCoPdsGHwD0M6z9my+6+aFrQtTKdfLPpcZXx6Se83ThO
	yg3RJ9Eybb/CO5aIQf43kFoMM2HZTAUHJemkbpo0bD08t7354ta7iFIt+NPhzOruCd3z9qCtuUhM7
	XsiV5RnnchjGimx1ENAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxEws-0000000GBbj-0VX4;
	Sun, 06 Oct 2024 00:16:34 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxEwp-0000000GBaw-08L8
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 00:16:32 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-656d8b346d2so2101680a12.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 17:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728173790; x=1728778590; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbvkF+qVNDPAW1MhTtQI9sEGEuwlkmBnRCVtfcvykzo=;
        b=YHlSPykspb1icljyVUEBLAm8dT5pFXg0J8IBwXp60piYw+7x1oGe4SJ0Z6193ZvHSP
         F/vi4VkbT5OPmW/hCiFv4x9LQthxReFrkDOiBpCilL8SfErtprdvtGDYEVnLRDmlwsQf
         3FtZ1sMcxTOdvFOOADaLYC/CanokJt37kmFEl7Ce9aL+8hABNY/OzQTfBq+ukGXmZQ8W
         ErMIJd/O34KMCqUtAJU4k8xbF5NEqeMivWGaqVZg61tyO1JPWjiHf5Gob01LCxZET4dt
         qKFyXP5Knf81RhE6sOuyPeFWEcQ1StGJBM1xBuZeLxN6DZRhO5l5w9i1bKe3s6nfvrTY
         QEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728173790; x=1728778590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbvkF+qVNDPAW1MhTtQI9sEGEuwlkmBnRCVtfcvykzo=;
        b=QtWUB/FNLI7KFrUEaRQx+Kd7i8vU/GCEmZd3HR2H45AxE1esCi3eFYYFtLBp5KSxLi
         YTsnXgrfjwoi7UJcTzQbJSBbpuaF3QIWwCIDJXuSZNuRdAdD1kvbOJ37T1XFVyIl3lRj
         2uHcxOPUNaQnNkr7I5TJwsWCL4a4f+KY027DrZA+wiEo/BwFhgHvD912EqgDbZJegfOo
         ZvlwctJ7MJgocA9bRR76Nj8xUadm/5VvSGqwSw5HMu6j0WGhrvRF/2IIVoGm9oFg8tK+
         Jq29F6G26aArivMFaFWiYNQLCdcqN7JwBwQl8pfgrsQZX8eUeTUIcmpzy6rplTs6sE5m
         vnBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjBQMXE/+kbY04PvFM7m2lAUcFc4nvEp4c4emTBplZ8MvdavYOd9w/7+iXznDtelMCSOZY1imH6SS9tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFpeX7Sp9MZKlxBcHHcUwpIkhdI3XK9kkhK3BuHbz5PRcoWDEN
	agEmyWIqbEqop7HqPN1bgH0Fdfa2VN9eNvcu6JJHhHQ4ZQAADLjdgYJbtBLEcT4=
X-Google-Smtp-Source: AGHT+IFAQJF8DuIfGajcjfoBIMX8leJdlJUQ6cf4GvstJkpqWV3ZuWMQcdhJ5PYEsYlv3v7IZ8uRZw==
X-Received: by 2002:a17:902:e747:b0:20b:7e1e:7337 with SMTP id d9443c01a7336-20bfdf77cb1mr120746215ad.13.1728173789775;
        Sat, 05 Oct 2024 17:16:29 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138b0f48sm18190685ad.25.2024.10.05.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 17:16:29 -0700 (PDT)
Date: Sat, 5 Oct 2024 17:16:27 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <ZwHW27ZuZrtBm56q@x1>
References: <20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com>
 <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>
 <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a42a738a-b52d-4ff9-ac21-cffd808bc055@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_171631_095902_598E3C3F 
X-CRM114-Status: GOOD (  21.04  )
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

On Sat, Oct 05, 2024 at 09:43:06PM +0200, Christophe JAILLET wrote:
> Le 05/10/2024 =E0 21:35, Drew Fustini a =E9crit=A0:
> > Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
> > thp->mutex.
> > =

> > Suggested-by: Linus Walleij <linus.walleij@linaro.org>
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >   drivers/pinctrl/pinctrl-th1520.c | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> > =

> =

> Hi,
> =

> > diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl=
-th1520.c
> > index 9331f4462480..d03a0a34220a 100644
> > --- a/drivers/pinctrl/pinctrl-th1520.c
> > +++ b/drivers/pinctrl/pinctrl-th1520.c
> > @@ -425,7 +425,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pin=
ctrl_dev *pctldev,
> >   	int ret;
> >   	nmaps =3D 0;
> > -	for_each_available_child_of_node(np, child) {
> > +	for_each_available_child_of_node_scoped(np, child) {
> =

> Using _scoped iterator is not described in the commit message.
> Is it expected to be part of this patch?

Yes, it was intentional, but you are right that I should have
highlighted that. I'll make it a separate patch.

> =

> If yes, the "of_node_put(child);" just a few lines below should be remove=
d.

Thanks, will do.

> =

> >   		int npins =3D of_property_count_strings(child, "pins");
> >   		if (npins <=3D 0) {
> > @@ -444,8 +444,8 @@ static int th1520_pinctrl_dt_node_to_map(struct pin=
ctrl_dev *pctldev,
> >   		return -ENOMEM;
> >   	nmaps =3D 0;
> > -	mutex_lock(&thp->mutex);
> > -	for_each_available_child_of_node(np, child) {
> > +	guard(mutex)(&thp->mutex);
> > +	for_each_available_child_of_node_scoped(np, child) {
> =

> Same here...
> =

> >   		unsigned int rollback =3D nmaps;
> >   		enum th1520_muxtype muxtype;
> >   		struct property *prop;
> > @@ -530,7 +530,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pin=
ctrl_dev *pctldev,
> >   	*maps =3D map;
> >   	*num_maps =3D nmaps;
> > -	mutex_unlock(&thp->mutex);
> >   	return 0;
> >   free_configs:
> > @@ -538,7 +537,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pin=
ctrl_dev *pctldev,
> >   put_child:
> >   	of_node_put(child);
> =

> ... this should be removed, and maybe the label renamed.

Thanks, will do.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
