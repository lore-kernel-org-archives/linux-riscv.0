Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9520C10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 08:10:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C90204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 08:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HINupgps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C90204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBLaImw6G7qsQIOg+1SnFmcK0VMFWknk3pEBMDQVnfs=; b=HINupgpsPnkoJx
	Cbd+9jJ87KJScW7f5kVPKVdbb8VFj0f9u0R0/thiRb1eU8U3rPgl9BcY+wpkEOrICBud2GmtHHa2U
	QJ1OcAGhpBO+wW0pY1BzciVbRQtVBfaDTWy7qtd1V68NnoaqySEb27P3ECLWJYkAcB+lQpuCImwxv
	9gb8dijUNdmGoXXkmzmhVc3PSwFv81E2KJbINe0jTiHS5kIYFoUHVzdoWln4xV9hgMAIdDTNiNs8s
	bKpOTcSlF1/amMhHWTi/avsBi0KORdSF8yIvuJNPQkTLEH80hhfHDlgF2S6jLjBCtjNYs71ey3Tyn
	tVG7LWYc6a+1pKpQwvjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h69or-0005NC-4r; Tue, 19 Mar 2019 08:09:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h69oo-0005Ml-EX
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 08:09:56 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h69ok-00082l-Ul; Tue, 19 Mar 2019 09:09:50 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1h69ok-0006Ko-A2; Tue, 19 Mar 2019 09:09:50 +0100
Date: Tue, 19 Mar 2019 09:09:50 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yash Shah <yash.shah@sifive.com>
Subject: Re: [PATCH v10 2/2] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20190319080950.4nsgzvkz5iwbkb24@pengutronix.de>
References: <1552909634-18757-1-git-send-email-yash.shah@sifive.com>
 <1552909634-18757-3-git-send-email-yash.shah@sifive.com>
 <20190318214640.ob2ldr3tpn2vsfkl@pengutronix.de>
 <CAJ2_jOHqGBB=eej6KkdspTNiCU_uJ8deHN3O=BQmyu=GtrTT7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2_jOHqGBB=eej6KkdspTNiCU_uJ8deHN3O=BQmyu=GtrTT7w@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_010954_645101_2FDAD93B 
X-CRM114-Status: GOOD (  14.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Mar 19, 2019 at 12:52:12PM +0530, Yash Shah wrote:
> On Tue, Mar 19, 2019 at 3:16 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Mon, Mar 18, 2019 at 05:17:14PM +0530, Yash Shah wrote:
> > > +     val =3D PWM_SIFIVE_PWMCFG_EN_ALWAYS |
> > > +           FIELD_PREP(PWM_SIFIVE_PWMCFG_SCALE, scale);
> > > +     writel(val, pwm->regs + PWM_SIFIVE_PWMCFG);
> >
> > Starting with this write the new period length might be active with the
> > previous duty cycle. Is this worth a comment? I think the window where
> > this can actually happen should be made as small as possible, so it
> > would be great to first calculate both register values and then write
> > them in two consecutive writels.
> =

> The comment for this scenario has already been mentioned under the
> limitation on top of this driver.
> Anyway, I will try to implement your suggestion of consecutive writes

Yeah, the comment at the top is for general information about the
shortcomings. The comment here would be to say: The problem occurs *here*.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
