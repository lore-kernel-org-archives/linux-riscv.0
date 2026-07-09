Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AC9C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 07:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+a9RDPxraJh2EUgo4CW9oUkPfOmeBmTEDz13ZHE0XjI=; b=3b6t21leO69bpg
	pHMDg8SaDoJfcULw9SPPDxo1v3ItuWtyLXWued8muJWnyGqfrSfIAydHJkraaHYAkr14pQgy+mx+e
	V0yMeSTOqv6bjjK7hSJd5mI37QjXjC+cY1EioCEp+hF3UQLgXr0mk+NXsPXvIVwfpmNkZccONbUNB
	0zNTjUfE+B0AXnf9GVK8ZS9jVejdpWbcjBXvyU0UhhSel6oZdCiObm91or2m9qt+yLhm9g3vsrtwl
	laQ918M5fEZmQdCCkGQdGxhjp1Fr3T+edPcGLsC8vt7muzWZW5rVKahg6aNUmzpePab0IAodorE2/
	BrZS58YbwqVvgQY7VUcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whisp-00000001Ezt-0eu1;
	Thu, 09 Jul 2026 07:09:19 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whism-00000001EzW-3QHu
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 07:09:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783580957; x=1815116957;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndtxCX9CLv6e7CFilLh3Nw7lUewzP1cPg9mhsHLos6s=;
  b=AjF1AO5t9beX3SzjbXcwm3wiPrhBDoTNputmWCKgJWLmNrzzRzSUhHFT
   PQAb21XMkgkliV+zivdv1EZdYZjGzmsuuDCWslhqY4zJoRIcrgfNz+Qf1
   Ih11HuRwHt7XaNwxqOkcwZp4cXRoybcXKcLvvdje/bkAzx3FGqvhh8j/5
   RgYVVruutl8hHHSGeymLbKbq+lPyazzLsMsdypCw7jpEmdEE6jAKTaYPF
   gozZeq7SRsTU1WhjzVmQpCwhIwS1ug1h/ArIIQdYkBDH6U6rJOZ/iXsO+
   L4Y2mynild+CBFF/ikf2L1Z0Ekjpf1YOKCc1osjKrHlNwLebxpcpZJgd4
   w==;
X-CSE-ConnectionGUID: i6Hs/ukFQNm1mqPYPLG17w==
X-CSE-MsgGUID: uljyzc34Sh2zRsuS6eKeng==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84131739"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84131739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:09:15 -0700
X-CSE-ConnectionGUID: thvvHjm9R9isY/ob8WDCYQ==
X-CSE-MsgGUID: mXFVt/hNS8acl/ww1Ey7wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="277726261"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:09:08 -0700
Date: Thu, 9 Jul 2026 10:09:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Frank Li <Frank.Li@nxp.com>, Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/6] PCI: spacemit-k1: Add device data support
Message-ID: <ak9JEs2Ep5FcAgEp@ashevche-desk.local>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260709040027.958400-2-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_000916_893714_5802CDFC 
X-CRM114-Status: UNSURE (   9.44  )
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

On Thu, Jul 09, 2026 at 12:00:21PM +0800, Inochi Amaoto wrote:
> To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
> data to handle the K1 specific logic and make room for the incoming
> logic for K3.

...

>  static const struct of_device_id k1_pcie_of_match_table[] = {
> -	{ .compatible = "spacemit,k1-pcie", },
> +	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},

Missing space before }.

>  	{ }
>  };

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
