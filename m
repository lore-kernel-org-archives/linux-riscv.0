Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECB5C61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vIv9MYis10S/CQSWQjD7YUKhFf8LqFPIS6EuV4MgcXM=; b=oHxzlzTd5gEBXm
	RyyHprQqHi/L2VR5Ui3FA19rvGxAykHj/rdTO0nMcg7x8TNJ+JRImaIcU0KzIvH43iVDotDjA9V8C
	3BNKXb3vBYQgdJcrNA6ZjScyUK8yKAJrU/q2kE0W1Ag8nJqDflYqtIarZ9Gc09/du2JBQmiXcqlal
	VTYe6GJZcKK1lngaxMIU8tw3uRZfSrQkOoM6c808fGUtsUNX7fVRCj3u0bhc/i38Tq9AonKcpiK5N
	89cr/Dxy3XFNu14H/ZwRKbnynmJzgGNoEP4jhFGS2rR1CueOgopdj5y+UK0QbYsjJeoaxzi3SBTwr
	/IwfQwP8clwkqYrs3vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZWd-00000003zVC-2H3S;
	Thu, 27 Aug 2026 12:48:11 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzZWa-00000003zUn-0gg4
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 12:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787834888; x=1819370888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LSe4ClYHyzoUMjPQ2O2AIJo3kbtl9bxf0qFjcfWnhxI=;
  b=W0KgFlSvW+TLqEVz++zAfqPE+vGVI9b5xqAtCkcYftQ7wZ1rRYCB6x0+
   7xM23Bw03QTRF3LdwHx5Rldd3FPqfsrUWG35ePqgXxDac0JaxzbBN8FLd
   xBK3OIrsuHCTWSiCyg+nSJhY1I8pS3McQ8norQ48Fratn53iC+8GyNwHW
   HqVH+XG/KkMrZfeGstE7IPUDxz8iNPJAlDNlccWsDEJm+ilXwxadTOlPz
   S9NXWxL0lqCRcl7pU0iSTZpZtw9sit/Ar+skJsmXST4srlBiFTbqmYYRk
   Tv8jV1FMVHNWe/ZZFQpbKw8hZs2bN5SP+3X7hgrbbGq6Z8FTrgWk0dvYG
   Q==;
X-CSE-ConnectionGUID: GbSzu1oLQNuDTdEE+VOKUw==
X-CSE-MsgGUID: groCxEeEStSgUNZGYzo5Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88189820"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88189820"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:48:07 -0700
X-CSE-ConnectionGUID: 5r8ZA7vORXinB4cAgEhcqQ==
X-CSE-MsgGUID: wbyizxAKSNCFhTkpZJP1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="271386983"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.244.125])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 05:48:01 -0700
Date: Thu, 27 Aug 2026 15:47:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <jan.sun97@gmail.com>
Cc: Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
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
	linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <apAx_ZUDQ6G6XVuc@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <ao_z9QTJC_q8gH0v@ashevche-desk.local>
 <aed972ef-3776-4055-81aa-63255d072b8d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aed972ef-3776-4055-81aa-63255d072b8d@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_054808_292198_55FC3B14 
X-CRM114-Status: GOOD (  12.06  )
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

On Thu, Aug 27, 2026 at 01:17:13PM +0200, Janani Sunil wrote:
> On 8/27/26 10:23, Andy Shevchenko wrote:
> > On Thu, Aug 27, 2026 at 09:34:48AM +0200, Janani Sunil wrote:

...

> > > +	for (unsigned int i =3D 0; i < ARRAY_SIZE(ad5529r_vss_supply_names)=
; i++) {
> > > +		ret =3D devm_regulator_get_enable_optional(dev,
> > > +							 ad5529r_vss_supply_names[i]);
> > > +		if (ret && ret !=3D -ENODEV)
> > > +			return dev_err_probe(dev, ret,
> > > +					     "Failed to get and enable %s regulator\n",
> > > +					     ad5529r_vss_supply_names[i]);
> > > +	}
> > Hmm... Can we use bulk regulator approach here?
> =

> I don=B4t think the bulk helper fits here. Each VSS supply is independent=
ly
> optional, and there is currently no optional bulk get-enable regulator
> helper.

Ah, I see. Yeah, then we have to live with a for-loop...

-- =

With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
