Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC9FFF8875
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9sDdr0kCyJqmeS8Aeb2WLaiY7CQkXMjNhr1N5aVC0kI=; b=JZjzdAvo+Xg+vICgQxADPKq3X/
	ZWRR0G7bmuf6M/fCk7hV1TXZYXjgSixVXfXoIOS1DyswNGwo/6bfv601lopP5X76+BTj1qiCLYARK
	2PSIpUD05fbmn7jSdksSC0X085tZ99ic7osNpApIgwZS9M1bGdxjcROBGUcXpLSvxmc1pcRi/Ss+5
	hTpO8V/aOp548tV+osuSLJQcA/NBDOEcLm9/usH5uLgHCP5ArDQdAWqPlnuXWGAt4du/vztyqZKhf
	xa0afV+mF5RtaJU4K8qrDWLq3caRpqDRiCZ1f3jQo6wgo0sK8JJWiDl+M75HgH/RjupVt74HuiZ0i
	k7ZGztyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2RB-00000003TbB-0BWi;
	Wed, 29 Apr 2026 10:46:37 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI2R7-00000003Tag-41s9
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 10:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777459594; x=1808995594;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=wd/2/KFO33JJStZgsK3RDk9O9BrgsdbZeW3OR0gOtow=;
  b=DxHOJlSrDwXqlLFw8RrJnjSnztGlr6At3Y4YRtrgNmT30GmTane1DMTm
   IiIIPEwKr3ut8VfQ16B/gUKjop2KdxmzNKZoFb9d+/EzrYIG81Whb2/LZ
   aX3era2IzCPrm0tjPMSmV1sd+Sc3mB+kjv0Lbs/Uq6WCZYtE/1X9/b29Z
   uRHxO6hAS8Xw7bD8Ph9mGuBs0/5sNqFy14Bs10eC9374CWOVItImZI9I6
   /nO/WgJmDGtaidtgp8XEMLDPyT4HNeSFo5TrFg5si0MKVEQxtIz1YOYfq
   3vFb21guA+5f+bkUhXD1FcY177+YM239rSTV4MH0qCEiv2dzvlyGpb8Yf
   g==;
X-CSE-ConnectionGUID: 6svneHEDT2CxX2jOVscVKA==
X-CSE-MsgGUID: l7ar/RbdRn6U3m7d4VsvKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="65915597"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="65915597"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:46:33 -0700
X-CSE-ConnectionGUID: UKCSV2x/Tz6ZNijoqecDCQ==
X-CSE-MsgGUID: Ei7E94x+SlKd918mYzTYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="257551066"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.212])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 03:46:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 29 Apr 2026 13:46:21 +0300 (EEST)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Jia Wang <wangjia@ultrarisc.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] serial: 8250_dwlib: move DesignWare register
 definitions to header
In-Reply-To: <afHgcBOV-CveGNTG@ashevche-desk.local>
Message-ID: <6febdf7e-e74b-12f9-699b-4276f68053a2@linux.intel.com>
References: <20260429-ultrarisc-serial-v6-0-b2c852e0c4c3@ultrarisc.com> <20260429-ultrarisc-serial-v6-1-b2c852e0c4c3@ultrarisc.com> <36efd2f5-d050-c613-77bf-dc651a94a586@linux.intel.com> <afHgcBOV-CveGNTG@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2113021380-1777459581=:966"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_034634_011435_31FBCE07 
X-CRM114-Status: UNSURE (   8.04  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2113021380-1777459581=:966
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 29 Apr 2026, Andy Shevchenko wrote:

> On Wed, Apr 29, 2026 at 01:38:44PM +0300, Ilpo J=E4rvinen wrote:
> > On Wed, 29 Apr 2026, Jia Wang wrote:
>=20
> > Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>=20
> There is v7 already...

I noticed it after sending the message out. For sport, I also reviewed v7=
=20
1/4 now as the diff-of-diffs command was still fresh in the shell history. =
:-)

--=20
 i.

--8323328-2113021380-1777459581=:966
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-2113021380-1777459581=:966--

