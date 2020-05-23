Return-Path: <SRS0=qB87=7F=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1501C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 May 2020 17:44:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B34AF2067B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 May 2020 17:44:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7NqAh/a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B34AF2067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hmVNOLK3bKFXHmjFp9am5qP1EggAj55HA0bMfEG3OVc=; b=T7NqAh/a/cgZEFf9NvST2Bn2k
	vhB+rgSvyhT3AO1EnVUmhsj4U73pEwVBDiDujEEOIXumCMCbJtB/vVvxFxJlOBK0E5dUwJHMRfsoH
	JymSTsrCk5JyZ7/8ZfZrHFwqTWwQ8PPLuukDcWDypXDVGyFfnrJN8+o57BVPh4J6crEQUkPCUVtH8
	jQv4uiQRpWMiyo4zBjtbotrwlVdhBEPDodBfu8DXd2O/lw1te8ygiZryq8jO0FrcuwQpaP5IA3aMf
	J8Fdh29OnPDLOYGqa3b5NLuQL0ViFpEVu/GDOO41+bHfsxd9gI4ZzL2d7Q13FfnshcBt+nvLWdy8F
	st9zQCGVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcYCR-0006Ld-Df; Sat, 23 May 2020 17:44:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcYCB-00066y-Si
 for linux-riscv@lists.infradead.org; Sat, 23 May 2020 17:44:29 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jcYBo-0004nX-LL; Sat, 23 May 2020 19:44:04 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jcYBl-0005dS-0l; Sat, 23 May 2020 19:44:01 +0200
Date: Sat, 23 May 2020 19:44:00 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Yangtao Li <tiny.windzz@gmail.com>, thierry.reding@gmail.com
Subject: Re: [PATCH 30/32] pwm: hibvt: do some cleanup
Message-ID: <20200523174400.tzptmraqyn3uqrvf@pengutronix.de>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
 <20191229080610.7597-30-tiny.windzz@gmail.com>
 <20200220204152.p6rublsssifvvnvk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200220204152.p6rublsssifvvnvk@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200523_104428_003473_7B9E4CAC 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.belloni@bootlin.com, heiko@sntech.de,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, festevam@gmail.com, f.fainelli@gmail.com,
 shc_work@mail.ru, khilman@baylibre.com, wens@csie.org, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 slemieux.tyco@gmail.com, linux-pwm@vger.kernel.org, rjui@broadcom.com,
 s.hauer@pengutronix.de, mripard@kernel.org, vz@mleia.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 paul.walmsley@sifive.com, matthias.bgg@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, nicolas.ferre@microchip.com, linux@prisktech.co.nz,
 palmer@dabbelt.com, kernel@pengutronix.de, shawnguo@kernel.org,
 claudiu.beznea@microchip.com, nsaenzjulienne@suse.de
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2020 at 09:41:52PM +0100, Uwe Kleine-König wrote:
> On Sun, Dec 29, 2019 at 08:06:08AM +0000, Yangtao Li wrote:
> > Use devm_platform_ioremap_resource() to simplify code.
> > 'i' and 'ret' are variables of the same type and there is no
> > need to use two lines.
> 
> I think I wouldn't have merged these two lines, but I don't feel strong
> here. The other 31 patches are clean replacements.
> 
> But I also don't think respining just for this minor thing is worth the
> effort, so:
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> for the whole series. (Not sure it is sensible to ack each patch
> individually, @Thierry, tell me if this simplifies things for you.)

I took a deeper look now and added Reviewed-by for all other patches to
ease application. So doing the same here:

Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

FTR: I'd do the following now:

	for patch in 1216003 1216065 1216063 1216005 1216062 1216061 1216059 1216057 1216054 1216056 1216051 1216050 1216048 1216010 1216044 1216046 1216042 1216041 1216036 1216037 1216034 1216032 1216030 1216013 1216029 1216025 1216026 1216024 1216015 1216021 1216017 1216019; do

		pwclient git-am -m -s $patch && pwclient update -s "Accepted" -c "$(git rev-parse HEAD)" $patch || break
	done

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

