Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17947ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8MMjxJ/ZGfAJjYiFTyLRYUK39IrATP3R91HvUl7YPY=; b=J7GpJIWFnlBAMD32v6jRZ4bP0k
	sYIJx7zoZ0hkcrnMYa8pDF+09np1OAKPPO9HeAM2MXJNaIMrMYU9o/9XtkPZjEE48PeGzxsK1PufF
	UTo6+REQsBs/Srn5wOt17fmpouv9vv+hvT/nLJizzCOv1x3dz07asQ+bQGhFDW+SyzATvCraCdUsA
	DVoPa+ECqY/qEYsbLBx1PDV53gNQYurDjUpnhr7FmU7QQlf7nvGu5jGKz3J+AT+mEbtdfXIya0ofl
	DVB7rYxfncdWmBT+XVHpVhf9XF4eaRFeqlzMItUF39uCZJr9Xje0Uh1q6RfQiGc/mpdIp6vEVZw2W
	CCeGiNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne7P-00000001zl3-04ly;
	Mon, 09 Sep 2024 13:07:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sne7A-00000001zgT-13vt;
	Mon, 09 Sep 2024 13:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725887252; x=1757423252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E4RRuE/i/qRg5/oov9kgzW8yHUJaA1SH34naXvnk51U=;
  b=Y1dafvuvBV5oGZ+mxyrVRjj3mBIwaiVLKdLvxfCkVmWL9ia89vgyZHUC
   nJ1XJQVD7iRfRDuZxzQN9+mQsrEOzYnwxiOehaAGXUgXCoa6ammTX0pvz
   Vva4qujIlCWDXMMh5xYamXbL7mARYL2PmtzIFeuenPVVPm69lk5ku4QrG
   bEiPBMG2va9GhyjObW5FrusD6UDnCxMDmIzTVNBXsogKD8KbxIyyDTREW
   g49flZmrofK1g8E+3ma53bcD9q1g6KukQTpoj4L+GwAZC0crMza3SjK3e
   r8XFmgdatr7nATUiy8SCwGXSCX/mgw1cvnRWWdMaqDNVt7Qlzr9vhkB7m
   A==;
X-CSE-ConnectionGUID: 3dr8ppBdTSqlMqiZcvwtew==
X-CSE-MsgGUID: 7eQd4TXpT4qDo4RNMd5DoA==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="198949684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 06:07:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 06:07:25 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 06:07:21 -0700
Date: Mon, 9 Sep 2024 14:06:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Celeste Liu <coelacanthushex@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
	<guoren@kernel.org>, Anup Patel <anup@brainfault.org>, Heinrich Schuchardt
	<heinrich.schuchardt@canonical.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz
	<glaubitz@physik.fu-berlin.de>, Russell King <linux@armlinux.org.uk>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>, Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-sh@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] riscv: defconfig: drop RT_GROUP_SCHED=y
Message-ID: <20240909-arguable-detection-02445bd1cc89@wendy>
References: <20240823-fix-riscv-rt_group_sched-v2-0-e4dbae24f7e1@gmail.com>
 <20240823-fix-riscv-rt_group_sched-v2-1-e4dbae24f7e1@gmail.com>
 <20240909-gave-celtic-af2ea8bc38d5@wendy>
 <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <9e364ae4-dc2c-4efa-8611-462218402a5d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_060732_382177_E93CD571 
X-CRM114-Status: GOOD (  26.96  )
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
Content-Type: multipart/mixed; boundary="===============5627762899379909931=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5627762899379909931==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0hp6eR1gUAB5lPpR"
Content-Disposition: inline

--0hp6eR1gUAB5lPpR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 08:14:16PM +0800, Celeste Liu wrote:
> On 2024-09-09 19:53, Conor Dooley wrote:
>=20
> > On Fri, Aug 23, 2024 at 01:43:26AM +0800, Celeste Liu wrote:
> >> Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> >> introduced it because of Docker, but Docker has removed this requireme=
nt
> >> since [1] (2023-04-19).
> >>
> >> For cgroup v1, if turned on, and there's any cgroup in the "cpu" hiera=
rchy it
> >> needs an RT budget assigned, otherwise the processes in it will not be=
 able to
> >> get RT at all. The problem with RT group scheduling is that it require=
s the
> >> budget assigned but there's no way we could assign a default budget, s=
ince the
> >> values to assign are both upper and lower time limits, are absolute, a=
nd need to
> >> be sum up to < 1 for each individal cgroup. That means we cannot reall=
y come up
> >> with values that would work by default in the general case.[2]
> >>
> >> For cgroup v2, it's almost unusable as well. If it turned on, the cpu =
controller
> >> can only be enabled when all RT processes are in the root cgroup. But =
it will
> >> lose the benefits of cgroup v2 if all RT process were placed in the sa=
me cgroup.
> >>
> >> Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also do=
esn't
> >> support it.[3]
> >>
> >> [1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208=
608c1204536
> >> [2]: https://bugzilla.redhat.com/show_bug.cgi?id=3D1229700
> >> [3]: https://github.com/systemd/systemd/issues/13781#issuecomment-5491=
64383
> >>
> >> Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
> >=20
> > I don't think this fixes tag is suitable, the commit you cite in
> > moby/docker is a year younger than the one in the fixes tag, so it was
> > correct at the time it was written. I think the fixes tag should just be
> > removed, since that commit was not wrong. Or am I missing something?
>=20
> The Docker commit I cited introduce the fix, not the bug. So it should be=
 later
> than commit in fixes tag, otherwise Heinrich Schuchardt won't pick the wr=
ong
> config from upstream.
>=20
> Timeline is:
> 1) 2015-06-19 Qiang Huang introduce RT_GROUP_SCHED check in Docker.[1]
> 2) 2022-06-08 Heinrich Schuchardt pick this to defconfig in commit
>               in fixes tag.
> 3) 2023-04-19 Florian Schmaus remove this requirement from Docker in
>               commit I cited.

Yes, this is the way I understood things to be. IOW, when Heinrich wrote
ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), it was
a requirement for docker. The requirement later being removed doesn't
make his patch incorrect, which is why I don't think this is a fix.

--0hp6eR1gUAB5lPpR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7y6AAKCRB4tDGHoIJi
0iy2AQDO+J8hujJIKzDG3Tt61SU7uY4jZrPVSF7Wt04GvnnrUAD/R5bugsa3nUum
Fkt27iTRmJcCAdjr+VwrO5JvzhczMQo=
=mCFv
-----END PGP SIGNATURE-----

--0hp6eR1gUAB5lPpR--


--===============5627762899379909931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5627762899379909931==--

