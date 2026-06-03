Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DAFCD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 13:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVUn6OEo/JQVGyPZp+q2i3f/vumNTlfhzyjm5juivnQ=; b=IJLRUa1sdGv63KF4aHvc/XxR+a
	Ya3+jwH3VlnEb2NniRTvEBOd8FeE3cVcIYoe270lb5wjZQ2X8Y5pK/AFnl5500S8kET4GZ2a2nJyv
	wE27C0TG1zZ0DzZqxxBkTAPYw7/Hua9UlPJviN+1g9JkFvljnSnJVFSx2B8VurJDJbaCYcEiA45vp
	Zm/tUFUPi73jLOtdGcoZOlrNFoj1AnXTVK3otzoBTVKwlFLeqJEOjET5hi62cyjApni1fokN6i1O7
	Bkq3Y+RjnPTbY8FKWq92CKKk/RjF3mqHVrfK3ReCq/3+CIdlYSk9U/09hxMw5A6O5AfDz7+aXRF7F
	f2QfTmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlTw-0000000F9uN-0xS1;
	Wed, 03 Jun 2026 13:18:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUlTv-0000000F9uG-0Jn1
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 13:18:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 249BB6022B;
	Wed,  3 Jun 2026 13:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158C31F0089D;
	Wed,  3 Jun 2026 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780492681;
	bh=GRDuRbDrtLCr2WrVymV/ZF9TJbGJHMnXoOmGEu85lXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fWiy5YEMpb0lndWGWO0ApBHOCMOzSwAdvFPMd9IdbKMcXH0ELtPdEmnU3PExesIQz
	 Or8//A5jWaBihFyzHy2LIUDj8cF/QmAPbo5aYQWWX7RSF+zWVag5VOx4VV6Wz7e3RN
	 c8hR7v7S4JFBH0NwW4KB/5zVKITr+Bs6LtrgqfpWDUuFy8RBCa8hqRV5YDkSeQ7Fv+
	 zP4O8XFJZ+sz5HHv8yy48kCLFKVV9Ts5BjcAXShD/Ny9WxdoHlX1sHpHVYm0F5tOHw
	 9MzFzOW68UFeC1MXw3tLCSlctiV3FTtum2/I6fZ3wKli7u2ay5CpcL+sHZri3MM3Ev
	 DPS3wgLJVYLUQ==
Date: Wed, 3 Jun 2026 14:17:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Hui Wang <hui.wang@canonical.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
Message-ID: <20260603-scanner-justly-51cd1160460c@spud>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
 <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
 <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
 <20260530-spoils-studied-d0858257c982@spud>
 <68DF4B69-6693-447A-ADAC-E943F96CFB77@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <68DF4B69-6693-447A-ADAC-E943F96CFB77@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============2748361222682788928=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2748361222682788928==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UaAKlaNtj6N9O0G6"
Content-Disposition: inline


--UaAKlaNtj6N9O0G6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 08:32:14PM +0800, Qingwei Hu wrote:
>=20
>=20
> > On May 31, 2026, at 07:09, Conor Dooley <conor@kernel.org> wrote:
> >=20
> > On Sat, May 30, 2026 at 11:36:11AM +0800, Qingwei Hu wrote:
> >> Hi Vivian,
> >>=20
> >> Thanks for the feedback.
> >>=20
> >>> On May 29, 2026, at 11:14, Vivian Wang <wangruikang@iscas.ac.cn> wrot=
e:
> >>>=20
> >>> On 5/28/26 22:16, Qingwei Hu wrote:
> >>>> Zic64b describes a platform with 64-byte cache block sizes. It is a
> >>>> mandatory part of RVA23U64, but a system may provide 64-byte CMO blo=
ck
> >>>> sizes without satisfying all profile requirements.
> >>>>=20
> >>>> The ISA string parser currently ignores Zic64b because the extension=
 is
> >>>> not present in the cpufeature table. Add an ISA extension ID and tab=
le
> >>>> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
> >>>> advertises it.
> >>>=20
> >>> I'd like to understand: What is the motivation to doing this, given t=
hat
> >>> the very same information is already available as riscv,cbo*-block-si=
ze
> >>> and hwprobe?
> >>=20
> >> The motivation here is not to replace riscv,cbo*-block-size or hwprobe.
> >> Those are still the right interfaces for software that needs the actual
> >> CBO block size.
> >>=20
> >> This is more about preserving the ISA extension name reported by
> >> firmware. Some platforms report zic64b in the ISA string, but Linux
> >> currently drops it because there is no cpufeature entry, so cpuinfo no
> >> longer matches what firmware advertised. That makes profile/ISA-string
> >> comparison tools a bit awkward.
> >>=20
> >> So the patch only makes zic64b visible as a named ISA extension when
> >> firmware reports it, while still validating it against any CBO block
> >> sizes that firmware provides.
> >>=20
> >>> If an extension is what we want to go with, then
> >>> Documentation/devicetree/bindings/riscv/extensions.yaml also needs
> >>> updating to match.
> >>=20
> >> And yes, if we keep this direction, I agree extensions.yaml should be
> >> updated in v2.
> >=20
> > And make sure that having zic64b makes the cbo*-block-size properties
> > mandatory so that people don't confuse themselves and omit them and
> > wonder why stuff doesn't work.
> >=20
> > Does zic64b mean that all of the zicbo* extensions are supported, or
> > does it just mean that the supported ones use 64-byte block sizes?
> > The answer to that will impact how you make the cbo*-block-size
> > properties mandatory.
> >=20
> > Cheers,
> > Conor.
>=20
> Thanks, I will check this with the RISC-V unprivileged/ISA folks first,
> and then handle the binding accordingly in v2.

I noticed that there's another series that's adding zic64b support:
https://lore.kernel.org/all/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@=
gmail.com/

Probably you should coordinate with Guodong, as your zic64b effort seems
to predate theirs.

--UaAKlaNtj6N9O0G6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiApgQAKCRB4tDGHoIJi
0uMwAP4zjcEJQpZ9LD1FnsoVGechkZwKoq1Siq9FIJYJAU8H/gEA4MAHmgERrx/D
ea3OryDGTN56AfqUo63gAyFosUY17wY=
=VaZR
-----END PGP SIGNATURE-----

--UaAKlaNtj6N9O0G6--


--===============2748361222682788928==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2748361222682788928==--

