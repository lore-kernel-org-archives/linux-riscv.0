Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E96C61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTpBXZ9t0KzTW7sU9BUG6TIHx4k0Gb2viYcMLvQVnzc=; b=FVo3UFWbLMjCXW
	VKy8aWj/yqRhSuNxA1UFbcbLzu5QnPjrZuzw7WJ7KvhT5hKtGz4qBwXLK+3i42Doe3VKWReJT1LVd
	Ct875VjzXwdHJQlTgft0kYfFs7HAdkWGyPdQAHsDxV8XKXE8pL6vvl26MaTWgsEYgHoYAJwi+fKH6
	BBd4rdzIWnsxKFyKE0ylkC48irTNDanOhvj+Ymwe6cQg+fqBrmAdt6glBUeV601IlS4QJiYZei6aF
	DzzxlNwXKm+VNjl3rw1ps5r4yyjNzaohhO6infaoekhci4/SAoVGjXZTK5atLY+4dggVFEVsaZm9d
	JLKRjbQtKEMP0IGg1L8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ik2-0000000ER0w-26Rc;
	Wed, 02 Sep 2026 11:02:54 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ik0-0000000ER0Y-2R7h
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 11:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788346973; x=1819882973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QDIu2KNP99Ja5J5CxxlX8SGwIhLbH5hz3Yi2K4FYpdA=;
  b=INES5aQFbwT0ddH2UAlkKUtN2qaG0WCTc892ZPymiXWtwJ0gdenaHHEZ
   3sfq/03DWG69AXn69BVbgUUsOL8p2DcYXL+EUKeJqDy4fjXkVzpK+BWel
   N+Q61rfv2RLYMK1QH3e/1RczeqBH94oQHGZWulQGmxHqfxpcPYCsAtRue
   0lyzTGf/FTHcrD7DyNj+ihBCf2NeFskg4oYIuFs1q710xY+8bwMw8nP9Z
   qFPEMHBKePWaNbz2adjNE3vx3p/rYAgB8wm9gaDnpbAyo03Tzlhog04d9
   9fMzPqCbSgSTVCOIJWOLhw64YK8LtXOnu9LBnaXQvsyav8OLrT7t5kcbo
   g==;
X-CSE-ConnectionGUID: E0n7GEpCQ8GrK4wKhhw8JQ==
X-CSE-MsgGUID: XOhmqDnMQ9+JYjfQoRZqUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111571208"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="111571208"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:02:52 -0700
X-CSE-ConnectionGUID: nDsLt4K9RA+MtI2/zg1M2Q==
X-CSE-MsgGUID: OfBGuYvRRB+9nYzVNAP5KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="269395361"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.118])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 04:02:44 -0700
Date: Wed, 2 Sep 2026 14:02:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Janani Sunil <jan.sun97@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Janani Sunil <janani.sunil@analog.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
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
Message-ID: <apgCUiOL3Of9P_e1@ashevche-desk.local>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
 <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
 <178813261957.2788519.4929586195765891569.b4-review@b4>
 <0c5a657d-e134-49a7-b2cd-82f293685cb7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c5a657d-e134-49a7-b2cd-82f293685cb7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_040252_661145_FA4D6C3E 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 02, 2026 at 10:48:58AM +0200, Janani Sunil wrote:
> On 8/31/26 01:30, Jonathan Cameron wrote:

...

> > Why do we need those outer () ?

> The outer parenthesis are required by checkpatch for macros with complex
> values. The same pattern is also used by AD3552R_CH_DAC() in
> drivers/iio/dac/ad3552r.c

checkpatch is wrong.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
