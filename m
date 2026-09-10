Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE31EC79FB7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwqATXCxKkIbv25okecMV4BbZgEQwk7DyOZNbS7ats4=; b=zpy61KWtqZGKmUuuPXscXfhmSv
	5cSRAh9xtHGxX/MRPozlpw4RyxkrA2gCojD8TXR7Su5fYLuJbohZcu7vWUiHi7G1whOpGG61cYGsw
	8AZ8YJfJ03h7AH+5wyfjPGNz5QlJmgX+x71kOcYBuumnWXCFM4zo2fBiWEOPQzxrbCbwzauO5mnUz
	V7EoNyN4KYBVFBe5Z1hNeePuboI3OzDiT64zOdUf7dq0SgMymSo7iUaeh6gCdKHqxZGOG403Yplvn
	2uegIohiOPzSRCoOGymsb7dgUryx32QXF/f3rSQamTv+MJ3FoKarnpa53GmD3vLS/KQeXPKSqLN6E
	do6IAkmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZDl-0000000DdHQ-2ne9;
	Thu, 10 Sep 2026 07:29:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZDk-0000000DdHG-0ufW
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 07:29:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C5D5416EE;
	Thu, 10 Sep 2026 07:29:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E611F0089E;
	Thu, 10 Sep 2026 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025359;
	bh=u3R7KOyofrS0wRSjak8aNV75X2Czsw9QjnW4+38O/ZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MY03GOetu5SKBp9nkWTrxqdG7Jl6/NG2Hl+PUb+xVMhfRY77IW+ocH4B48v9OlZH+
	 2jNjsuE5l7TpMAH4tErFkuASZJQp1s4gqxabcfqFAipFRFLnJoAF9of4isP7Umzi7X
	 Br84MtRcqTzhRIQx94sSrFT2GUsb/WfFTvrliT9WRrtFns/42kuCEHMX+eQj6SGnZj
	 6SKyKJyXMZFLIO/MXaq1HQg5I1fUaIXvYvH2imSIKOP1ZdPpYtxN5Nzhby8vBAnpSq
	 IKWJdVIggpp6it5npUAN6DPsZWIKMJdRJSMqtDQcP+//G3+4DT/6tHCVZ5uOWCi/vM
	 lQfu9E+dLqOeg==
Date: Thu, 10 Sep 2026 09:29:14 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Mauricio Faria de Oliveira <mfo@igalia.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, kernel-dev@igalia.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, fsverity@lists.linux.dev, 
	keyrings@vger.kernel.org, bpf@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
	lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	linux-sctp@vger.kernel.org, linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org, 
	bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com, 
	virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 00/13] sysctl: add module aliases
Message-ID: <uufwu7rqyxf7h55lgavcwrnylnq5gdbd7o5d7mfugrxpblds2d@adra5c2z22gg>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <bpnqwggtidgiec5akns3fa5edbsvl7xf55dxabtwng2xspy4pn@ue554aii2ngk>
 <53155340c897560bfc67e61ba9568fd6@igalia.com>
 <mokz5pdtwswkyab4byfq7q7m6ac2g6ceoi6jflyxmaszaibzqa@su6m4kamtdpy>
 <b1a6cec17e7c828fcebe310ca2a0d25b@igalia.com>
 <rywhz6soawf5dzyui5g7dnbufsgpxr7ma7honuhejwgncemzrm@f32at7hl6ugm>
 <6e93af907298022f077126f1be7bd386@igalia.com>
MIME-Version: 1.0
In-Reply-To: <6e93af907298022f077126f1be7bd386@igalia.com>
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
Content-Type: multipart/mixed; boundary="===============8780243247902649495=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8780243247902649495==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fccfp65dlmdatj3e"
Content-Disposition: inline


--fccfp65dlmdatj3e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 02:29:30PM -0300, Mauricio Faria de Oliveira wrote:
> On 2026-09-09 11:07, Joel Granados wrote:
> > On Fri, Sep 04, 2026 at 02:45:23PM -0300, Mauricio Faria de Oliveira wr=
ote:
> >> On 2026-09-04 10:41, Joel Granados wrote:
> >> > On Thu, Aug 20, 2026 at 06:22:13PM -0300, Mauricio Faria de Oliveira=
 wrote:
> >> >> On 2026-08-20 09:51, Joel Granados wrote:
> >> >> > On Wed, Aug 19, 2026 at 03:16:13PM -0300, Mauricio Faria de Olive=
ira wrote:
> >> >> >> This series adds 'sysctl:' aliases to modules that register sysc=
tl tables; e.g.:
> > <... snip ...>
> >> > use the correct call moving forward?
> >>=20
> >> This scheme currently covers all modules, AFAIK, as it is wrapped in t=
he
> >> functions that register sysctl tables.
> >>=20
> >> On moving forward: usage of such functions in a way that breaks a
> >> requirement of this series (e.g., failing to specify the template
> >> table/path parameter(s), or not having constant initializers) hits a
> >> build error, as the requirements are actually from the compiler.
> >>=20
> >> >> I guess that a different design could use MODULE_SYSCTL_TABLE() as
> >> >> MODULE_DEVICE_TABLE(), declared per table instead of wrapped into
> >> >> register sysctl functions.
> >> >> However, it seems to require moving the value of the path argument =
(or
> >> >> its template) into the macro and still referencing it in the functi=
on
> >> >> (or its instantiation of the template), which adds obfuscation, to =
all
> >> >> callers.=20
> >> >>=20
> >> >> What do you think?
> >> > It might be that having it inside the module subsys is more work, bu=
t I
> >> > believe that there is the right place to have it. I still don't see =
that
> >> > adding a module specific arg to the sysctl register is a good thing.
> >>=20
> >> Ok, cool. I can work on a different design.
> >>=20
> >> Please just let me know whether you are OK with the remaining (above),
> >> and I'll be happy to tackle this.
> >=20
> > What is "the remaining"?
>=20
> I meant the rest of the email, addressing the points/questions you
> raised.

* The dependency on a sysctl path to load a module still is
  backwards to me. It should be: I need feature A, I load modules
  M{1,2,3} for A and I set sysctl S{1,2,3...}. Not sure why sysctl tools
  do it the other way around.

* The fact that the invariance is in the sysctl path and not the module
  identifier maybe points to a deeper issue.=20

* I still believe that this is better placed outside the sysctl
  subsys as it does not cater solely to module loading.

Best




--fccfp65dlmdatj3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmqiXEIACgkQupfNUreW
QU+Jpgv/QNMzfwgyYS5bGcjcIdeGmbwPVB4niFRMrcLkDpeUPt2bAuU2q0Si+c2j
8ZRwIaAx22BLUNWWDpobcza7W5C1A17rIR76XCMUnFSb0n/IWP5htK0UHazibk/r
s8lxhIQXP5lQAHUSyOaKXEqmO60aWL/VkIxb+qJe3ThcHSESPRVQxL56e054d/fG
0Hh+/ckA3Yy8AAKkaF1Q52F6thgEqtHKMSNZkdp+XN3Q+IQHRUGULXvXeTgvp4QY
u5WK/w8RJz5+KQwW6//kpXBCY9uVado45tRrFS/H0fClXF6ovdXuTK169krtJi92
qouie+C4qFsAjPRGPOQjOYXmCIa8/sKwsArW4CmTg0J9WN3BwQxJksy0jWqaxULM
xRPx9OxYsSrYZGglZitaJMnNQnc+X20/vQ4lBotfmrMPdUgSrMAzOHO0AcFXBUs9
s1DSQoFZe+/Kg4RCkGzgk55VbnT0V81UPFbcYx6yuyjb+yZWoTMUpHy8Q47//r54
Y5lWmFsv
=Y70+
-----END PGP SIGNATURE-----

--fccfp65dlmdatj3e--


--===============8780243247902649495==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8780243247902649495==--

