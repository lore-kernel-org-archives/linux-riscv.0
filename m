Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62173FED3CC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o18S8nNo58wqAMO0gbprFWfF5JTsJoJFIfV2rrj9MM0=; b=n2U1sIjjDGkrBAT0NmerAlZf80
	GWJXFbHYG2KWWeBY0ao2OmoHKyQIGQWVSg/hXFSUsDsJcNA4hsxGVzR78AkPBhLS5lpoEsnl/zkMc
	OxWazL7+bDgc0sbvPlH/LzRBx9dLyBt2j0r/OURguO/oFDGsXvxObmhVKWnOzrvhtPUm+KHP+nEgc
	3s1yT0l3P1zAQf7y9ApSxWd4qVws6+e0gmFMdNVhvtwGSNOuY4MvcGri59hEYHqX8viIZbr82ws0p
	+XzkwWjdC9UmXQLYpG2J8bAF7kJJ3k7za0N+vG4M7Uwd0HuL/upTz/E6blGPQqIj8vQu97andSfVG
	fyNfm73Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHEF-0000000DI9c-01YU;
	Fri, 24 Apr 2026 14:09:59 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGHEC-0000000DI9F-0eAX
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 14:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777039796; x=1808575796;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CXW/N769EENkYazHiZUEH9F4WWwQnrYKB/iViMQHhk4=;
  b=n5MH/1v5bN3SZLFhMu1Joj8kN00LGjLlzLz01WJlR297/tAdazbjGsRs
   7Rtn5w/EhWVNux22H5UhjLmeLaY3bTGRzrB0eDkedPGnxMgBJPV+88eie
   5eXpBy9sqgiDJ85RMOqqvulmlc1cvS8VeAqyc+brwKHBL659DoZ2+wkqN
   HZVAqfWujoB5K2NMh1pwtxr99wUBHjP8b0KFQbFepz9/m5ExFoeiM5M2F
   9ZdjLHdFBkolLgeQbia5vPjMDxD2Hn49NwAXkoNWsbuAaAKNEVgO8aHbi
   sRnu/1KROaFfDSBx8g9MYqK+eWakJaviJVdGsufrqa9G4Z+L4x76eEMy0
   Q==;
X-CSE-ConnectionGUID: Oyu64qtTRje8E0l+PoPG9g==
X-CSE-MsgGUID: rPQ1uFj2QFupp3Ep1lkUvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="103482511"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="103482511"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 07:09:55 -0700
X-CSE-ConnectionGUID: EcNEermSRsqeTayQSmKK5w==
X-CSE-MsgGUID: EDkeemBFRn2yA3w5F4NG/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="263368955"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.120])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 07:09:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Apr 2026 17:09:46 +0300 (EEST)
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
Subject: Re: [PATCH v4 2/4] serial: 8250_dw: build Renesas RZN1 CPR value
 from DW_UART_CPR_* definitions
In-Reply-To: <aetv2ljDOpH_Hs4s@ashevche-desk.local>
Message-ID: <363a636d-f014-cc29-6be4-ec3041f43855@linux.intel.com>
References: <20260424-ultrarisc-serial-v4-0-1765a0b4c4a0@ultrarisc.com> <20260424-ultrarisc-serial-v4-2-1765a0b4c4a0@ultrarisc.com> <4548483c-cbba-899e-6b1a-1290d36b59cd@linux.intel.com> <aetv2ljDOpH_Hs4s@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2024444435-1777039786=:958"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_070956_206397_7CF00C5E 
X-CRM114-Status: GOOD (  14.60  )
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

--8323328-2024444435-1777039786=:958
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 24 Apr 2026, Andy Shevchenko wrote:

> On Fri, Apr 24, 2026 at 02:38:56PM +0300, Ilpo J=E4rvinen wrote:
> > On Fri, 24 Apr 2026, Jia Wang wrote:
>=20
> ...
>=20
> > Hmm, maybe there should also be macro also for this one which takes the=
=20
> > fifosize as input and converts it to CPR field vlaue (effectively, the=
=20
> > macro is an inverse of DW_UART_CPR_FIFO_SIZE()). It would be more reada=
ble=20
> > than the literal.
>=20
> But this can be done separately, right?

It's logically part of the cpr_value literal to defines conversion (of=20
course one could introduce it in own patch without users but I don't see=20
much benefit from that).

> > Also include BUILD_BUG_ON(!IS_ALIGNED(fifosize, 16) + bounds checks)=20
> > inside that macro to catch invalid fifo sizes (+ don't forget the=20
> > necessary headers for those two new things).
>=20
> Hmm... Some devices may have FIFO =3D 8 or 4 bytes (Intel Quark IIRC has =
less
> than 16 and it's DW IP).

Perhaps but according the DW databook I've at hand, there are no values in=
=20
FIFO_MODE field for such FIFO sizes. So what would CPR contain in those
cases for FIFO_MODE field?

--=20
 i.

--8323328-2024444435-1777039786=:958
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-2024444435-1777039786=:958--

