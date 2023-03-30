Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B77DC74A5B
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 06:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDD3EAI9jH0qEm2wcR2/7ABQDbNPbcm40zgyicSZi1w=; b=w5GD2O4Lw6rlCcJweb9jQ/CqLR
	mqdu4DGhHHPTa0aLkS9JQt99Z/ifpMiiLY6crrSuYet4Kr4oPzHxbPOvsFx+mRlMfUVOq/9+VZZ6Z
	ewt7fVl1vFVmSMUKOFbjpjgWPeNZzSyfOCAUeNorrOCRflDDYlH2dAaZzPwspa6p9zVJetl4UMXKI
	5Ta3+2/iQn0HQFogM2rOCGkJ+lHu/iIYlPlMAmS7bwvpXSzQ0+cX4fjAMp+PA19c0AfeElsTxMdOc
	fLvL2jlXioUEM5vB+y+ujRq08TJkGztAnTEOGQw7ZFPRcIfyRBXzIw+5SrgN1UMxElnAZLJp1IZL1
	xmRByIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phm8D-002ogq-1J;
	Thu, 30 Mar 2023 06:51:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phm8A-002og5-2t
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 06:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680159089; x=1711695089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isuW7lBgyM6zBizBIEv7+ZepVzPCYOK2CVN9uusKVP0=;
  b=CMhwlYuiU+HyCbE7Bn9YH2I7dx6E+r/MvjkeYBQ5E29LeSJ/JZlu9S4T
   jeNt/I6q+gKa26rrM6Y3jMR5OxANSV97TaVN3u0gFC5kOInwFZ9Aiw+aG
   V+Cy7NE+E35n1Os4CMERCQMdFuafZjWPEIKMafrct3OyOj4Bk9lhmnNi3
   G6TWFzPvhbusDValq+ENzVkzVG9JfF5WhAewTWb6xCQE985yUgVgFuVfp
   H9Saq4R4Nt4CDagh7PoJ2m51qwphk639nB/81cmAY2Ot8iUBZy3jGavlz
   8Z/vrF/dI/F9bUHFffrsHNbYtDn4QFMOnL1Wxkdce+foR+QjhOx5RquhU
   A==;
X-IronPort-AV: E=Sophos;i="5.98,303,1673938800"; 
   d="asc'?scan'208";a="218640819"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Mar 2023 23:51:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 23:51:29 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 29 Mar 2023 23:51:28 -0700
Date: Thu, 30 Mar 2023 07:51:14 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>
Subject: Re: [PATCH v8 0/4] RISC-V Hibernation Support
Message-ID: <a73a194e-f7dd-4cf4-9fb7-62144672b71c@spud>
References: <20230330064321.1008373-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230330064321.1008373-1-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_235130_940761_E99F4EA8 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: multipart/mixed; boundary="===============7100493188339365944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7100493188339365944==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mfeXrlZQg1KajaHO"
Content-Disposition: inline

--mfeXrlZQg1KajaHO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2023 at 02:43:17PM +0800, Sia Jee Heng wrote:

> Changes since v7:
> - Rebased to kernel v6.3-rc4

BTW, there is absolutely no need to do this every time you resubmit.
Usually patches will either be applied to for-next or to -rc1, so
rebasing on the newest -rc is not needed :)

--mfeXrlZQg1KajaHO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCUxYgAKCRB4tDGHoIJi
0lIfAQDEWhvfFivg6kQkF18sXzUoe+Angr/aSl+M5qV1NxNIPwEAjz/t1WtBnJ4R
XP2W7zeGUogfxiIhmDT4rbxYEKas5QI=
=QcRt
-----END PGP SIGNATURE-----

--mfeXrlZQg1KajaHO--


--===============7100493188339365944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7100493188339365944==--

