Return-Path: <SRS0=rCLW=6I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49839C2BA1A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 06:43:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208B22084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2020 06:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnGeZX3R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gLmkav9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208B22084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hjgmIpG5MXRCE32YvJViE53MuBYQgsvIJYIDtBG1wUg=; b=ZnGeZX3RDmHbKuI6WRdf3Pz5a
	wJpZvcNsI+HKea/6P0QOyHUvmULKOWodGtueYuv4oKgq0cwsoGrY24z/455jgu08Gikvn8Ri0b8rG
	WsLkBMY67FYZSvSI5EPXMwe6uGP2JoBeh0F8q+8r4REdWpwQwQoRxVUh5MpF13/lUpIbqF5s55vKD
	5jUgS2faWTBlRRGFEqz+8CQGnj/sK9gARtFd+f87az5pjxIylpwxsnvep26LsI2QfwyZJaGo4rOie
	Q7lmffc/iiwab5k9DGX9mk5w+eXckWTd8CjvRiwKc3xbtVBz4CgxGkmYbe41h6FXyv+S2vofD494o
	2RVZAHpAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRs3M-0000wW-Eu; Fri, 24 Apr 2020 06:43:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRs3J-0000vs-Lh
 for linux-riscv@lists.infradead.org; Fri, 24 Apr 2020 06:43:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id t14so9355190wrw.12
 for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2020 23:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hjgmIpG5MXRCE32YvJViE53MuBYQgsvIJYIDtBG1wUg=;
 b=gLmkav9RefuhGDy7FRSB2b1Yb7ftPkLidmMm2HjjcuriXjUM2Q39OTFT7dZ2A4V4P+
 uPXtFR3lQTS5dHpBnEEt9s0wt06bG4CKz75P185mO2FJBqH08RAoyYkPXW2QsejTPM7S
 0DfgXuitbLdLRmvVDkmWIHC8H9UMHQUj0r2GQeMCPQk7QIo+kAuEL0UFjla8kCzRe4+S
 rThlwaH9KWI+yUKHhOtCxxG9ULnxvwMPrS6AhJz4uu259X9Q1PVmdpJKZYyMWoE6LilL
 fCT5AC4sWEWxNEhr5GoZwvYGdJyjI7kjOojvnFThVfLgu+70HpDsoHMw/xgSHFkxJwU4
 ro1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hjgmIpG5MXRCE32YvJViE53MuBYQgsvIJYIDtBG1wUg=;
 b=V1sRkUQ8pjDW864KnnlTFeVZ++FKbsBjmlrrPDhLVhr8Q9m67qxqF5YrTRG1yX5UxB
 hrLAVNgk+B0U423VXj5Y08UFH1e2YH9BTfNZ/hHdnfhMgasGcCKp/epaw2X778ljPdFs
 CxWURGkedZgPZojRbzYJKaCSldtObf7y9yRB8bGdeYSe2l7nJv683ohOUiqi+26XK+Se
 bzTaG6n8Fil1cbPx5+75KHgcCYktaCKkHeiuKsclEx3oNMv+dPGj88qzeA30XhNA/dLb
 JiaBpT53MlNplqlLagL6geC5lJPjl7mo31WlxMZXoiWUixememEgG9oDcaZRobhAy//3
 Wf7w==
X-Gm-Message-State: AGi0PuYmNQYodWTMkLpDmdncjIzXGqihrVkgAq27C9PB7e+HZbEc0DZy
 CEmygJu8pygPMeWJAVaNXy6cMw==
X-Google-Smtp-Source: APiQypIY4gxvEl5tps3s2Elwdzto0Ez6RpLP3/4Gfy9ggA/7GFzjOVp+QweqPybFmauP84QxQwgDtg==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr9004101wrp.355.1587710587668; 
 Thu, 23 Apr 2020 23:43:07 -0700 (PDT)
Received: from dell ([2.31.163.63])
 by smtp.gmail.com with ESMTPSA id n9sm6875262wrx.61.2020.04.23.23.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 23:43:06 -0700 (PDT)
Date: Fri, 24 Apr 2020 07:43:03 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Guru Das Srinagesh <gurus@codeaurora.org>
Subject: Re: [PATCH v13 00/11] Convert PWM period and duty cycle to u64
Message-ID: <20200424064303.GJ3612@dell>
References: <cover.1587523702.git.gurus@codeaurora.org>
 <20200423114857.GG3612@dell> <20200423215306.GA8670@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200423215306.GA8670@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_234309_721201_28F9280F 
X-CRM114-Status: GOOD (  17.37  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 David Collins <collinsd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kamil Debski <kamil@wypas.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Atish Patra <atish.patra@wdc.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Mark Brown <broonie@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
 Thomas Gleixner <tglx@linutronix.de>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-hwmon@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>,
 Joe Perches <joe@perches.com>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 23 Apr 2020, Guru Das Srinagesh wrote:

> On Thu, Apr 23, 2020 at 12:48:57PM +0100, Lee Jones wrote:
> > What's the merge plan for this set?
> 
> I'm not sure what you mean. My assumption is that first all the patches
> need to get an Acked-by and only then will the series get applied by
> Thierry... Could Thierry or Uwe weigh in on this point please?
> 
> > FYI, it's better to send all patches to all parties.  That way
> > maintainers and interested persons can follow the discussion and
> > progress, or lack there of.
> 
> Something I noticed with adding all the various mailing lists to the CC
> list for this cover letter is that it is causing this cover letter email
> and all its replies to not be archived properly on spinics or lore -
> it's probably getting rejected by email filters somehow. Compare with
> v12 [1] where I'd pruned the list considerably as an experiment - that
> got archived correctly.
> 
> Any ideas on what might be going wrong? Once I fix this I can add all
> parties to all patches knowing that there would be no issues in mail
> archival.

A great deal of mailing lists contain numerous protections against
things like flooding and spamming.  One of those protections is a
check for "Too many recipients to the message".  Most of the time this
simply requires moderator intervention by way of review and approval,
but this ultimately depends on the ML's configuration.

The first thing to ascertain is why your recipients list is so large.
Have you added every reviewer, subsystem-maintainer, maintainer and
contributor suggested by get-maintainer.pl?  If so, consider pruning
that a little.  Contributors do not tend to care about subsequent
changes to a file.  As someone who receives a lot of patches, I tend
to get fed-up when receiving patches simply because I made a change X
years ago.  Stick to listed maintainers/reviewers in the first
instance and see how far that takes you.

If your recipients list is as succinct as reasonably possible, maybe
just accept that every version isn't going to be archived by every
ML.  It's still much more useful for the correct people to have
visibility into the set than for it to be archived multiple times.

> [1] https://www.spinics.net/lists/linux-pwm/msg12131.html
> 
> Thank you.
> 
> Guru Das.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog

