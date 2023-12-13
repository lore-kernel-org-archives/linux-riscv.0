Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA2C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 19:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDiEdQJ4avEunAJJP0dRouX90FunnzcVnVQNM3eUMSI=; b=1PoHAsDmx92tTtK+aHvKjajaBm
	pvYl7ggRnRcHIE6sKc/tbRH7v/KPVuzbzpR7GtzjCOHWQqGvIyrmIJYCswzdq2BmZknXuvDOszoQy
	ry4RffEugwkX73aS6TYIHj2HVgpPSNrkFraKuArd58s6UXqcJN8KpXP5W0znbryu+PiXfrBf+gyEd
	Act3x45n1o4dihpwSZsYX0odOV4JYRMuPvYRUiJPHtP+c+UOnoVRE+GOCd5BLas0vgkoxaTW/BYFe
	voAzGrXoNhZ/3Et9MVeeSCoqnVL8DjqEI7XeTC+ULDvssWAYBWuErrNsnwXFaTt1HP9Y+0hqpEZ4T
	KP+ja5+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVDq-00Fs3m-0A;
	Wed, 13 Dec 2023 19:48:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVDl-00Fs2j-2m;
	Wed, 13 Dec 2023 19:48:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 20B4DCE1EB3;
	Wed, 13 Dec 2023 19:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7215AC433C7;
	Wed, 13 Dec 2023 19:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702496919;
	bh=MZtzdUx4eKT5heieT9T5VOR43tMJJzsqr7+1whfzXas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7uGFuNHvpesCeFV2U++2OplcF8v4oBAlDcXfknxMkfBwIOdoPbiDOhepHt8u3hhn
	 dJiojJM/VfCGpAMnMesfB4H5uCicK1y5jxuLv5FHILPBXat0VWi1iOAoOxU9gZgZUb
	 l8M7QsbawfZos/ahINA3IdeLESlKIPE1+bhtG7e0PXeiC1L6nRYSvOEzGoUYGsfozI
	 ekB6+Al5sf4osUXPOvKnkbVafY9lGZk41toCjgNPFfTlwkNnZHVtW7V8nOHGoDgxSp
	 wCdSCFc4lrTp0SYb/2qv/dL0X/a4SRA2op13Gh+K9k9gMcYs8U87M2mqMuH+YfwILd
	 GnU5OqCI0duSA==
Date: Wed, 13 Dec 2023 19:48:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Deepak Gupta <debug@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 02/39] prctl: arch-agnostic prctl for shadow stack
Message-ID: <feb6d1fc-c144-4f2b-833f-b3e00646cf30@sirena.org.uk>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
 <20231122-arm64-gcs-v7-2-201c483bd775@kernel.org>
 <CAKC1njSC5cC_fXnyNAPt=WU6cD-OjLKFxo90oVPmsLJbuWf4nw@mail.gmail.com>
 <d708b493-267a-4418-be91-9bde6b2cf50c@sirena.org.uk>
 <CAKC1njSQPO8ja7AkTzQ724hhSsGjchH9dLbbH9LXP0ZiKj-zPQ@mail.gmail.com>
 <0d0d8802-09e3-4ea5-a0b4-b3a08c8a282e@sirena.org.uk>
 <CAKC1njRHs0R=VKfn4jBap9__oR0rBHmNy7_tqHR8=xEHdUE4+A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKC1njRHs0R=VKfn4jBap9__oR0rBHmNy7_tqHR8=xEHdUE4+A@mail.gmail.com>
X-Cookie: One size fits all.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_114842_280482_A46E1A9F 
X-CRM114-Status: GOOD (  19.31  )
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
Content-Type: multipart/mixed; boundary="===============8384779805577325158=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8384779805577325158==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PqL9xaSuINxjZ0qj"
Content-Disposition: inline


--PqL9xaSuINxjZ0qj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 11:43:49AM -0800, Deepak Gupta wrote:
> On Wed, Dec 13, 2023 at 5:37=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:
> > On Tue, Dec 12, 2023 at 04:50:38PM -0800, Deepak Gupta wrote:

> > > How will it do that (currently _ENABLE is married to _WRITE and _PUSH=
) ?

> > That's feeling moderately firmly into "don't do that" territory to be
> > honest, the problems of trying to modify the stack of another running
> > thread while it's active just don't seem worth it - if you're
> > coordinating enough to do the modifications it's probably possible to
> > just ask the thread who's stack is being modified to do the modification
> > itself and having an unprotected thread writing into shadow stack memory
> > doesn't feel great.

> Yeah no leanings on my side. Just wanted to articulate this scenario.
> Since this is new ground,
> we can define what's appropriate. Let's keep it this way where a
> thread can write to shadow
> stack mappings only when it itself has shadow stack enabled.

Sounds good to me - it's much easier to relax permissions later than to
tighten them up.

--PqL9xaSuINxjZ0qj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV6CosACgkQJNaLcl1U
h9ALhgf/X0uXQk/jQmE5Jq0LTM5Dq11ls+1yrW1dnXA7KxS0COIsEEUbdISRGMla
V+YwOPaYph3UvrmaWSwwvJoYLBnF5otV9j195V9CyQ0+ffNtfzadl8v/tCaf9Kj8
w3gJY/USQR8ILQtuKGWengTYUOgoygMfNi5bjUokSG8R06ZNY9d51H/aOjGUgnUQ
8EaJ6bxBsbsqd4FlcP8EcxYfwdpfhEf9EKrHF+ZIlHTZdP4abSGD5mb7B1w4Tqpj
iVf/C2FzA5H8OSh7cMg/9WfDUCs74i+AUc2sIVVpFNYvfcxyCqQIfdwk5Okiyc8t
LBjtoBgkATaNC4M22Ino8jfc5Dasew==
=qiqv
-----END PGP SIGNATURE-----

--PqL9xaSuINxjZ0qj--


--===============8384779805577325158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8384779805577325158==--

