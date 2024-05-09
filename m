Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AB8C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbLFwqe+oLj2tIhczrAjws2Wq0HZ2kR57vGqvTlm0zo=; b=HINQ65RLCkqAVJQM+KwPSyQqPf
	JgSg5d1AZZ3nLFthczBErxAoD+/Oa4XkmYdTg4/jVUxQcaMGBl6ahvyMESkOW3vK2aB6y6eF6WYfT
	nysXnph7XhyZgHvCL+9805tAbbc1GViSKdxDk3aOvU2jtox0TJf5RlvK5Qp464YcyWs2xQbdpUvdd
	shWUPa6tsJEujuP3d5QL3k3CSKa5COi40gyudwGJxjpEe5HEUqZcg9rBthoxUIspjUMQt21AqRmZc
	SQxMA14zADphbTaHk+D474KFObninC2qpjgZOwLRyrUbrmsX+iCzZrEf3FZ+KvZ5bXl9fV9QCZHoj
	75Gg8lCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5AS2-00000002n6B-0Ie8;
	Thu, 09 May 2024 20:33:14 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5ARv-00000002n2o-3zQW
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:33:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1546DCE1BD3;
	Thu,  9 May 2024 20:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECA18C116B1;
	Thu,  9 May 2024 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715286785;
	bh=6iQUzY8aEoDEDTDjSEFz/xHQqilN8EGwR9Ao9LR2DhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uy9+y+Wn571zBjkcfWNxqCA9u6G+sV4BOYW+53XaleB+d+ECLFA/QUFNlclIoorDe
	 hKpRg4eDuONRLyrCriNbQ3Z62aTFZBZWxgTzR0NStKeR7yId4VXZnGyluuTkI5/q2z
	 hMlkPWtJCjeu9zGzmej+baT6iIlzr6VGyVdAtDODuM/O32Wv7Cx7Mbmh/lE/C7uGum
	 ULGcH15fuvlg+MBCHLwwmisSxYoKwfZReurwTHwj+0XILwZ1NlK2OGNPPZgXDXU/d0
	 MO0ilOdWPTjG8X5FLoKkVrm8u7yv7nmp/+qppgGBjsG76Ze7gou+bBddiPRAbwPwf7
	 2qMDIEht5/Uyg==
Date: Thu, 9 May 2024 21:32:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Rob Herring <robh@kernel.org>, paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com, broonie@kernel.org,
	Szabolcs.Nagy@arm.com, kito.cheng@sifive.com, keescook@chromium.org,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	cleger@rivosinc.com, atishp@atishpatra.org, alex@ghiti.fr,
	bjorn@rivosinc.com, alexghiti@rivosinc.com,
	samuel.holland@sifive.com, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
	corbet@lwn.net, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	krzysztof.kozlowski+dt@linaro.org, oleg@redhat.com,
	akpm@linux-foundation.org, arnd@arndb.de, ebiederm@xmission.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, lstoakes@gmail.com,
	shuah@kernel.org, brauner@kernel.org, andy.chiu@sifive.com,
	jerry.shih@sifive.com, hankuan.chen@sifive.com,
	greentime.hu@sifive.com, evan@rivosinc.com, xiao.w.wang@intel.com,
	charlie@rivosinc.com, apatel@ventanamicro.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	sameo@rivosinc.com, shikemeng@huaweicloud.com, willy@infradead.org,
	vincent.chen@sifive.com, guoren@kernel.org, samitolvanen@google.com,
	songshuaishuai@tinylab.org, gerg@kernel.org, heiko@sntech.de,
	bhe@redhat.com, jeeheng.sia@starfivetech.com, cyy@cyyself.name,
	maskray@google.com, ancientmodern4@gmail.com,
	mathis.salmen@matsal.de, cuiyunhui@bytedance.com,
	bgray@linux.ibm.com, mpe@ellerman.id.au, baruch@tkos.co.il,
	alx@kernel.org, david@redhat.com, catalin.marinas@arm.com,
	revest@chromium.org, josh@joshtriplett.org, shr@devkernel.io,
	deller@gmx.de, omosnace@redhat.com, ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: Re: [PATCH v3 04/29] riscv: zicfilp / zicfiss in dt-bindings
 (extensions.yaml)
Message-ID: <20240509-clatter-crewmate-9755669b9452@spud>
References: <20240403234054.2020347-1-debug@rivosinc.com>
 <20240403234054.2020347-5-debug@rivosinc.com>
 <20240410115806.GA4044117-robh@kernel.org>
 <CAKC1njSsZ6wfvJtXkp4J4J6wXFtU92W9JGca-atKxBy8UvUwRg@mail.gmail.com>
 <20240415194105.GA94432-robh@kernel.org>
 <Zh6c0FH2OvrfDLje@debug.ba.rivosinc.com>
 <20240509-cornflake-foyer-e6589c2bc364@spud>
 <Zj0aAiZiTrt9ACjj@debug.ba.rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <Zj0aAiZiTrt9ACjj@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_133309_693075_40CCF673 
X-CRM114-Status: GOOD (  34.75  )
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
Content-Type: multipart/mixed; boundary="===============2021946053181188873=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2021946053181188873==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x+pjDPD7FlbQaxoS"
Content-Disposition: inline


--x+pjDPD7FlbQaxoS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2024 at 11:46:26AM -0700, Deepak Gupta wrote:
> On Thu, May 09, 2024 at 07:14:26PM +0100, Conor Dooley wrote:
> > On Tue, Apr 16, 2024 at 08:44:16AM -0700, Deepak Gupta wrote:
> > > On Mon, Apr 15, 2024 at 02:41:05PM -0500, Rob Herring wrote:
> > > > On Wed, Apr 10, 2024 at 02:37:21PM -0700, Deepak Gupta wrote:
> > > > > On Wed, Apr 10, 2024 at 4:58=E2=80=AFAM Rob Herring <robh@kernel.=
org> wrote:
> > > > > >
> > > > > > On Wed, Apr 03, 2024 at 04:34:52PM -0700, Deepak Gupta wrote:
> > > > > > > Make an entry for cfi extensions in extensions.yaml.
> > > > > > >
> > > > > > > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > > > > > > ---
> > > > > > >  .../devicetree/bindings/riscv/extensions.yaml          | 10 =
++++++++++
> > > > > > >  1 file changed, 10 insertions(+)
> > > > > > >
> > > > > > > diff --git a/Documentation/devicetree/bindings/riscv/extensio=
ns.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > index 63d81dc895e5..45b87ad6cc1c 100644
> > > > > > > --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> > > > > > > @@ -317,6 +317,16 @@ properties:
> > > > > > >              The standard Zicboz extension for cache-block ze=
roing as ratified
> > > > > > >              in commit 3dd606f ("Create cmobase-v1.0.pdf") of=
 riscv-CMOs.
> > > > > > >
> > > > > > > +        - const: zicfilp
> > > > > > > +          description:
> > > > > > > +            The standard Zicfilp extension for enforcing for=
ward edge control-flow
> > > > > > > +            integrity in commit 3a20dc9 of riscv-cfi and is =
in public review.
> > > > > >
> > > > > > Does in public review mean the commit sha is going to change?
> > > > > >
> > > > >
> > > > > Less likely. Next step after public review is to gather comments =
=66rom
> > > > > public review.
> > > > > If something is really pressing and needs to be addressed, then y=
es
> > > > > this will change.
> > > > > Else this gets ratified as it is.
> > > >
> > > > If the commit sha can change, then it is useless. What's the guaran=
tee
> > > > someone is going to remember to update it if it changes?
> > >=20
> > > Sorry for late reply.
> > >=20
> > > I was following existing wordings and patterns for messaging in this =
file.
> > > You would rather have me remove sha and only mention that spec is in =
public
> > > review?
> >=20
> > Nope, having a commit sha is desired. None of this is mergeable until at
> > least the spec becomes frozen, so the sha can be updated at that point
> > to the freeze state - or better yet to the ratified state. Being in
> > public review is not sufficient.
>=20
> Spec is frozen.
> As per RVI spec lifecycle, spec freeze is a prior step to public review.
> Public review concluded on 25th April
> https://lists.riscv.org/g/tech-ss-lp-cfi/message/91
>=20
> Next step is ratification whenever board meets.

Ah, I did the "silly" thing of looking on the RVI website at extension
status (because I never know the order of things) and these two
extensions were marked on there as being in the inception phase, so I
incorrectly assumed that "public review" came before freeze.
Freeze is the standard that we have been applying so far, but if
ratification is imminent, and nothing has changed in the review period,
then it seems sane to just pick the freeze point for the definition.

Cheers,
Conor.

--x+pjDPD7FlbQaxoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZj0y8QAKCRB4tDGHoIJi
0rP8AQC02hZlGWSuSewjVON0urY69iTQamRjygDbG9NHmoS2CgD9GqLx3inCUKtB
gHw/mFivxVUjkbE0drkNkmSs+Vn4eAM=
=uiDQ
-----END PGP SIGNATURE-----

--x+pjDPD7FlbQaxoS--


--===============2021946053181188873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2021946053181188873==--

