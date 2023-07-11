Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35C6EB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDhUUc94i3sXcub34oi3N7+EDs/B6llpmIm+lLNg4f8=; b=STeJimrsdM3fkH
	XdLK10xdPDiNxbFxP0n1s03d6wcNZPizJ4HvFAWu4O1+8v8dCFi1PqQPSYDiGVwlds/Vz3ZHmIdif
	ne7LFhWQAvelHfu3Pl6jXSp31KhPeTpJrQrzk8VsjH6IXSuPij8oyVfmqlTPQ76LKYb6nGbmKs43l
	6/obdX+R6y81wdDFo8YR0JpGZis8sr59/jYYkiOHoXiJT134ORHGjiP9eFtB6gP4RRgIdkTeSoyst
	tavEPExFxwUqB7infL9mHplJ8+JJ10X32RpwoTQyaUIsKozammN+wJb7LARHmBOSpGfopnEy6/lf7
	Kvl5Cv31i+PYabOMHFGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBGn-00EjXn-1B;
	Tue, 11 Jul 2023 11:11:01 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJBGi-00EjWQ-1X;
	Tue, 11 Jul 2023 11:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073856; x=1720609856;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C71aeTJAOI/hMDyIcMR24A6iht2n+gbfSGfP4xzAt6Q=;
  b=lTEdBKaqGoh2TYYIvC8GXSt7kVqoAk464mqijRUYi4NK3ltsw2JxYj+A
   sjFKVqEd53ajVpaaUPR+1jRIfDpj8dVGVPFx02djabj/8Fm78N5YG3uj6
   b4ebub6QZPykQ82DCaKRNzA0cxh+3S/MfJMwJrVdi5dJB6SCAyA7W+kd8
   4+jVzbF9c91+uAwM/1HEmWDjuZ8Q3g6PejtklHFVPS8gEj61uagu8/gT/
   ycRs2VQiYb4bdEHTrkkGwSMiZeM12sP2O1/nMRH68xpKvFhkMCGWlNkhi
   R4F4za1L7KDZdlLba8pR69+Ys/93L7sSGwy/4LK5MTU4Wd54DvtuNlx7C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="363454797"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="363454797"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 04:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="756326203"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="756326203"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 11 Jul 2023 04:10:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJBGQ-001pHZ-2T;
	Tue, 11 Jul 2023 14:10:38 +0300
Date: Tue, 11 Jul 2023 14:10:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 08/15] spi: Clean up headers
Message-ID: <ZK04rjMk+LfDHcGT@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
 <54bb9fe7-fb62-4c2e-ae36-d2c10648ee27@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54bb9fe7-fb62-4c2e-ae36-d2c10648ee27@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_041056_526652_29878BC4 
X-CRM114-Status: GOOD (  16.70  )
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

On Mon, Jul 10, 2023 at 06:21:44PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> > There is a few things done:
> > - include only the headers we are direct user of
> > - when pointer is in use, provide a forward declaration
> > - add missing headers
> > - group generic headers and subsystem headers
> > - sort each group alphabetically
> 
> The previous commit was supposed to be sorting things and AFAICT did
> so...

This is about forward declaration groups.

> > +struct spi_device_id;
> 
> Why are we adding this given that there's also an inclusion of
> mod_devicetable that you didn't remove?

Answered in the other email.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
