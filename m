Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B55CD0E6C8
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 08:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ud+YldEdAmtjtIlkLVaz8/mfRtuKL1+zgqXQRPDk5JA=; b=CC5COEvfc7jrF0
	VS3a3t5ry77nqW0wzvLLSGGuOkM64RU85kQ5xaTOItpuXuYhnsTpsUjA5SNIOZnL9IDoSEX8aPm5E
	uxZtI8oo7g+86cLcRza3jsuPbxNXmOhH1zByBQZgM2LxwDPaZbFNjZaGfbT8h5ldp0rIbdqEwhrXj
	KNk3bE8imN2Y9SFRlX9ib0WRWl1K3LewpzfP7WUQQOfz+DKTxSdiNMIItA7RBgSD9SKn8eNTrxFA2
	CuQtjYtR9twSHgfQW6+koHRVNA4B5QhE1sjtclW+TZ7UNCydF0QxWY0uVPgYCSMprMnitq0mEzY/g
	rYwZHMewPco7DicpmU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nny-00000006Y3h-0Fvp;
	Mon, 21 Oct 2024 08:30:22 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nmu-00000006Xu3-2YRC
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 08:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729499356; x=1761035356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/zePlugoobNxm+sBHhUrdXCSLuE+lS4wRijxDZIkJbQ=;
  b=OZ01roiNB53qJ7WEBlqWCiKuuZhZnVNYm3+4PrM1oxxTEW183tBPMvTz
   zZmJHdBZn5kszGxcCtIItflzy0MH923lWu0G8+WrPTacYsMYFi5qTs37U
   YaA0/eGSBQ2u2nL0a+gX1EzbaV/BWb8g6WKJXIXYtwnSDj5y5m9eoXy1P
   +loNY7feaMic/sMipB9+N7moOzaYbkSiF5TrdODToBaZBGsGrB0T9Ajuw
   0rh1Z5hunTQl4y+lpzQ1ba/NTGdp/L2HrSdPe6PrHMZ6XMdfIbcVooGyW
   xv04wy6gkuDbBKbxrHuJygSHbEZousA8PAIIkIfgF8yiwIKgPW3gnIsEo
   Q==;
X-CSE-ConnectionGUID: VXHkId25SQ+u0kYKj+a8HQ==
X-CSE-MsgGUID: 7Ixub/p2TgK/dfHdueytRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="29181713"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="29181713"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:29:15 -0700
X-CSE-ConnectionGUID: YErJoinJQ4aG2lyxkEghjg==
X-CSE-MsgGUID: 5NSCvMZRTjCnP+C+W3NSiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79052574"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 01:29:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t2nmn-00000005QWt-0eGk;
	Mon, 21 Oct 2024 11:29:09 +0300
Date: Mon, 21 Oct 2024 11:29:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
Message-ID: <ZxYQ1FKtloHPnjb_@smile.fi.intel.com>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241021072606.585878-3-inochiama@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_012916_680033_45EC0057 
X-CRM114-Status: UNSURE (   8.38  )
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

On Mon, Oct 21, 2024 at 03:26:06PM +0800, Inochi Amaoto wrote:
> SG2044 relys on an internal divisor when calculating bitrate, which
> means a wrong clock for the most common bitrates. So add a quirk for
> this uart device to skip the set rate call and only relys on the
> internal UART divisor.

Assuming DT bindings are okay,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
