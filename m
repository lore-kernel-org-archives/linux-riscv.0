Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC2C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R09fRClQ1xZhRNQDmWSJPC0mL+pjkfLTl7kgfj8CG1M=; b=KEkheBUNmsViiq++mDwDP+eued
	sLFJwabP6ZHjuI2++M2tVLvu1qSAkWfnLlArq/ZnwKl5D7LS0SyFAwxKYTj6l1FI8zWqzwbgt3AOE
	3tUcTB6Ss1U2tEWERKR/7wqgDt/ZiP9PkyRUy/49RHztLBNyo/5aVca6BCnkb5xGWXT/2vWcCkVN2
	0PypRQA9gL4KXwYsBQm8z8wGPdDm7jzDdgr076c+yzW9ov8gE3Kc3KJegea81Qq6YD7xfXM07Rzb0
	gQpvlmSTt0+OBmZbQlOikCvGqBuxSct6YkVmu1DHfbAgHyGg98XqQ0W8fv+2fNZaBO8Qb6yi6zYsL
	X+zlizyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFX4W-00AThe-SM; Wed, 11 Jan 2023 09:07:00 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFX4T-00ATgH-Jw
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 09:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673428017; x=1704964017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9w7S6pSRBzYyhEwdDt4ZEbaFUwAjU6b0bp41qP+0Jg=;
  b=OcNP0OoWRXuYz1Gu3sD8f8AJgc6oYVBb2bDV7ENXB2ozZPeOFZM89siB
   Afb39jddyIe9Wp7aq9T01qYYF6Jdi3vRpHNgFAX6Zvy2cGN+2VCKiLZPc
   x9Y/I3bWSLrahfetErxxyNa0uckWF3XkkJzBt5+3XW/MSaZIijlGqQix1
   v3+CKhY3WNjusycAMcM9SE4WnbU1OI8me5h6vM+Y49+KY3vZh7+YRt9Gr
   /GAYST4MFJLw6XBO+ibFhhZWZghM2Ms8ljy7r6lDfDEkzSr/fw8Kb3XKd
   xNjdyjDGD7sZimKUn9Uj3brGbBBdyQmHgJzADbtgfVPjHq4nUllYzRcLX
   w==;
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="asc'?scan'208";a="191717654"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 02:06:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 02:06:54 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 02:06:52 -0700
Date: Wed, 11 Jan 2023 09:06:30 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>, 'Anup
 Patel ' <apatel@ventanamicro.com>, 'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>, 'Sia Jee Heng '
	<jeeheng.sia@starfivetech.com>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, 'Ley
 Foon Tan ' <leyfoon.tan@starfivetech.com>
Subject: Re: [RFC PATCH 1/1] riscv: sbi: Introduce system suspend support
Message-ID: <Y758Fq/2jIX6eKmJ@wendy>
References: <20230106113216.443057-1-ajones@ventanamicro.com>
 <20230106113216.443057-2-ajones@ventanamicro.com>
 <Y73lRNHDstKHL3vn@spud>
 <20230111085211.wdsn4tnpsaxblxhm@orel>
MIME-Version: 1.0
In-Reply-To: <20230111085211.wdsn4tnpsaxblxhm@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_010657_786492_47ED69FF 
X-CRM114-Status: GOOD (  21.73  )
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
Content-Type: multipart/mixed; boundary="===============7883327002972737875=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7883327002972737875==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nr5t0nSYjO9xHHjm"
Content-Disposition: inline

--nr5t0nSYjO9xHHjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 09:52:11AM +0100, Andrew Jones wrote:
> On Tue, Jan 10, 2023 at 10:23:00PM +0000, Conor Dooley wrote:
> > On Fri, Jan 06, 2023 at 12:32:16PM +0100, Andrew Jones wrote:
> > > When the SUSP SBI extension is present it implies that the standard
> > > "suspend to RAM" type is available. Wire it up to the generic
> > > platform suspend support, also applying the already present support
> > > for non-retentive CPU suspend. When the kernel is built with
> > > CONFIG_SUSPEND, one can do 'echo mem > /sys/power/state' to suspend.
> > > Resumption will occur when a platform-specific wake-up event arrives.
> > >=20
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> >=20
> > First things first, anything SBI depends on !m-mode, so you've gotta add
> > some sort of gating unfortunately around those ECALLs. But I figure you
> > may have already seen the build failures on patchwork for nommu?
>=20
> Actually, no, and I think I missed other emails like that in the past. I
> assume I'm on the To: of these messages, so it's odd they're not showing
> up. Can you forward me this message? I'll inspect the headers and try to
> figure what's going on.

Oh my bad, I assumed that you'd look on patchwork. I haven't made it send
emails as I don't trust it not to spam people with build issues that are
not their fault.

Sorry!
Conor.


--nr5t0nSYjO9xHHjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY758AwAKCRB4tDGHoIJi
0qvpAQChhfpeUdl5R7CwTKfY6DUHNwTZFNuAPBIjW2rf8qkOuwD/fWBECT7kInXA
X7q9VMTUGYwzTO4SBPTWa+m3f2YKdw8=
=v8n7
-----END PGP SIGNATURE-----

--nr5t0nSYjO9xHHjm--


--===============7883327002972737875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7883327002972737875==--

