Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A90C624D0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5t+7d1MAs2CzkGkTH8DGzSrFcJmDFqr18PB5p1vrJnk=; b=dwhy2joK1kxMun
	IbuGOlAtxDqz7nP+HL5nAUUhnXlFbgqS5I5HkUN4t7dAOrFYgv8qKWXSEgYJ00E1+qEv4IlNXe52O
	g353APTg+vBi0MBMkvJqliey3Xg4kjF7KtfjTU/7LazHNGcFfIltPnjEHKrNPiUsMwuTwGB9qHxht
	j6+xMyOOCxWZdMaGvslb6F8YwVgHGzjuaOHZ4dUBgD+GrziZs/JGqSEJimmRjJuCgdDRJPc73YlZs
	KWqHFMeuaDNU5vTMHRpU41XViiXVcxWhEdaFqeyHq8xOA6a1gNH/FyIH/XMfWTtrLXGrp5WIHGqRj
	N/4BNCLjp1GvNCMhmnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ilp-0000000ERI7-30cs;
	Wed, 02 Sep 2026 11:04:46 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ilm-0000000ERHU-0IP9
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 11:04:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788347082; x=1819883082;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qwetBkwPV/BecwdCTylobCVUO79rqCxrXRGVs48GO2k=;
  b=JVB2Uv866HkddZg3JX68/yZPfA0yeECFMtM4O9gTKMINE+xkK6fvh30y
   0TfatIrkOM9yuNt5hC9hl8barxzHurVVZSYPUaoHsOxzZCdP+ijDoALje
   3QjXd1I9r1g616o2FD7YnXRFyBEcC1tDd4F7mOaFa7Fb8bOM8XfF3ecl+
   Z5tRT84VqNJUpIsMwFxwBkjGIAW5h2xFFQp/8UEH/+703v65P7fziN9OX
   y95eea1Avd+X7oYR+lEdOfzHV6OQ6rAyyY4Y1l5UoRvfOT/vSqEJeUPTZ
   S2Htl1co7Vu4jqViqVKEjgyPlHL9rJCwINFCD9qPXL0RUAQmmHNiLZaTD
   w==;
X-CSE-ConnectionGUID: vz1sjqiUQcO+QyNIDmxHdw==
X-CSE-MsgGUID: 9b9mUVVXRqK2bviGRpLcTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="92622161"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="92622161"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:04:42 -0700
X-CSE-ConnectionGUID: RVAaSA4TTtiVRlj5QwQTEA==
X-CSE-MsgGUID: umDBro+NTf6a89hob7PZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268837578"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:04:35 -0700
Date: Wed, 2 Sep 2026 14:04:32 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Marius Cristea <marius.cristea@microchip.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Kent Gustavsson <kent@minoris.se>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org,
	Kent Gustavsson <nedo80@gmail.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <apgCwKB3QA2uKD1e@ashevche-desk.local>
References: <20260902-ad5529r-driver-v11-0-301c491a0719@analog.com>
 <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902-ad5529r-driver-v11-3-301c491a0719@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_040442_124733_EA6CC046 
X-CRM114-Status: GOOD (  10.68  )
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

On Wed, Sep 02, 2026 at 11:26:17AM +0200, Janani Sunil wrote:
> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> from Analog Devices.
> 
> The device communicates over SPI and supports per-channel output range
> configuration. An optional external 4.096V reference can be used in
> place of the internal reference.
> 
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ad5529r.pdf
> 

No blank line in tag block.

> Signed-off-by: Janani Sunil <janani.sunil@analog.com>


Wait a bit more to settle things down before sending a new version!
This one still contains issues that were noticed in v10.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
