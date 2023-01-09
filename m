Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A178C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 18:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ntMpi/YcepVxbc8kQEo7XaIdRYXnNrB7UQIsMGEqT8=; b=fCpoWtN6zG6fBfXE7BoNUAR7Y0
	x1FUPVNipNUC58AwsG6UF5hmuBWKw73ho0QqwlT3vezCYXir/6fISN5FpwfsaZITPLFK+WafbfcZy
	EutioAYSbGO8SRYDR6UYlBD6+EPM484pmFmhk/DOhyPFLsbDjwAXg976FKf4O9gK3ppyB2d8ViSPL
	NvQt+As+5WKtwOcZ2f6Xuuza1P27EViXYATApJIE/KGbz/aStxgzS6CEzr613z4Bhxc6Opirni0kv
	e0VHGB3UjDxi4ZPPXL0cn9vDgNh9JNJUrcxWVZWpY1kwW6X4Qyubz27GSyFR5SWfU4kzjEAkncd8Z
	nL5UTVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExBf-003Q9d-1g; Mon, 09 Jan 2023 18:47:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExB6-003PsI-7h
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 18:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9C9A0B80ED9;
	Mon,  9 Jan 2023 18:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADCAC433EF;
	Mon,  9 Jan 2023 18:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673290041;
	bh=fP3rFASz2vA5R2Ej0f1j1SUqauKXUClyVmaFuzPcWvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/mZrOoPW+KN1IGcmO4c0HseyDY/MFy/9lpepeyTKv3ofInPXt6j4B4GeF6o2lr1w
	 RYtQfHkEajszatUhjB3S2zHpMjqyJmbyCi63NLrlhZpsdyo1eMByBhpgy5sdSAoJeo
	 DeUd4i1D6B1Gzar+JcqH2T+fivbQ/7BJNzj5u0xea3PO0RMkOz0GqjsIVFfHun4qAg
	 KJdfurMP+CuqNnvs9T7Qcalq5lrd9u+TRSkxx77Y3pakn/59whDlOh6GwZ+9SBgXWR
	 dlONaw0FometM7Kvdhrd6MSiWgB0Z81ca05e2Rab7lWQXit4RbO25Z+Wk2ZJSohU7M
	 h+0iVKbb2pFQQ==
Date: Mon, 9 Jan 2023 18:47:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>, palmer@dabbelt.com,
	heiko@sntech.de
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 0/5] RISC-V Hardware Probing User Interface
Message-ID: <Y7xhNSmlh6miWuZw@spud>
References: <20221013163551.6775-1-palmer@rivosinc.com>
 <20221201160614.xpomlqq2fzpzfmcm@kamzik>
MIME-Version: 1.0
In-Reply-To: <20221201160614.xpomlqq2fzpzfmcm@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_104724_609604_82227117 
X-CRM114-Status: GOOD (  53.47  )
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
Content-Type: multipart/mixed; boundary="===============9158744654484529811=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9158744654484529811==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XEybHnosMf+YVb6M"
Content-Disposition: inline


--XEybHnosMf+YVb6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey!

Just bringing this up somewhere a bit more visible than the weekly pw
sync-up yoke!
I just got my VisionFive2 today & I see Heiko has just posted another
version of Zbb support series, right as I had started typing this in
fact, so I'm curious where we stand. There's gonna be quite a few
people with Zba/Zbb capable hardware soon by the looks of things, so
it'd be nice to have something we can point people at that actually
applies to recent kernels.

I know Palmer you said you'd do some work on it over Christmas, but
since that didn't materialise - are you still planning on spinning up a
v2?
Some thoughts on Drew's sysfs suggestion below would probably be useful
if you aren't.

Thanks,
Conor.





On Thu, Dec 01, 2022 at 05:06:14PM +0100, Andrew Jones wrote:
> On Thu, Oct 13, 2022 at 09:35:46AM -0700, Palmer Dabbelt wrote:
> > These are very much up for discussion, as it's a pretty big new user
> > interface and it's quite a bit different from how we've historically
> > done things: this isn't just providing an ISA string to userspace, this
> > has its own format for providing information to userspace.
> >=20
> > There's been a bunch of off-list discussions about this, including at
> > Plumbers.  The original plan was to do something involving providing an
> > ISA string to userspace, but ISA strings just aren't sufficient for a
> > stable ABI any more: in order to parse an ISA string users need the
> > version of the specifications that the string is written to, the version
> > of each extension (sometimes at a finer granularity than the RISC-V
> > releases/versions encode), and the expected use case for the ISA string
> > (ie, is it a U-mode or M-mode string).  That's a lot of complexity to
> > try and keep ABI compatible and it's probably going to continue to grow,
> > as even if there's no more complexity in the specifications we'll have
> > to deal with the various ISA string parsing oddities that end up all
> > over userspace.
> >=20
> > Instead this patch set takes a very different approach and provides a se
> > of key/value pairs that encode various bits about the system.  The big
> > advantage here is that we can clearly define what these mean so we can
> > ensure ABI stability, but it also allows us to encode information that's
> > unlikely to ever appear in an ISA string (see the misaligned access
> > performance, for example).  The resulting interface looks a lot like
> > what arm64 and x86 do, and will hopefully fit well into something like
> > ACPI in the future.
> >=20
> > The actual user interface is a syscall.  I'm not really sure that's the
> > right way to go about this, but it makes for flexible prototying.
> > Various other approaches have been talked about like making HWCAP2 a
> > pointer, having a VDSO routine, or exposing this via sysfs.=20
>=20
> Hi Palmer,
>=20
> To throw my two cents into the penny jar, I'd vote for sysfs. It handles
> the heterogeneous CPU case since cpu feature nodes can be hung off each
> cpu node. It also avoids yet another encoding. If we enumerate extensions
> and their properties then we need to maintain that enumeration in both
> the kernel space and userspace. If, OTOH, we use sysfs node names for
> the encoding, then, when we match the spec naming exactly, e.g.
>=20
>  .../features/zicbom
>  .../features/zihintpause
>  .../features/sscofpmf
>=20
> userspace can look for features by name. Userspace libraries can even
> lead the kernel in development, since the encoding (the spec name) is
> already agreed.
>=20
> Properties of extensions are just sub-nodes, some with standard names,
> like
>=20
>  .../features/zicbom/major
>  .../features/zicbom/minor
>=20
> and others, which are cpu feature specific, like
>=20
>  .../features/zicbom/block_size
>=20
> I used 'features' in the above examples for the node name, rather than
> 'isa', since not all features map to isa extensions, but it should be
> possible to fit non-isa features into the same framework.
>=20
> Thanks,
> drew
>=20
>=20
> > Those seem
> > like generally reasonable approaches, but I've yet to figure out a way
> > to get the general case working without a syscall as that's the only way
> > I've come up with to deal with the heterogenous CPU case.  Happy to hear
> > if someone has a better idea, though, as I don't really want to add a
> > syscall if we can avoid it.
> >=20
> > I threw this together during the conferences so I would be surprised if
> > it's not broken, but I figured it'd be best to just get something on the
> > lists sooner rather that later.  Happy to have someone go fix my code,
> > but the new uABI is really going to be the tricky bit here.  There's
> > some test code included, but I haven't even booted a kernel with these
> > patches so YMMV.
> >=20
> > These are also up at kernel.org/palmer/linux/riscv-hwprobe-v1 in case
> > that's easier for folks.
> >=20
> >=20
> >=20
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--XEybHnosMf+YVb6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7xhNQAKCRB4tDGHoIJi
0i+3AP99CGIIxzm7kabqvlgGq6Xf4wIK63ZCaAKhBJ2rb3QdJQEA1wP74iiXvIOq
j/DJbaiuh9JAIVJ/AxXUj5yBbc80MQg=
=VOMS
-----END PGP SIGNATURE-----

--XEybHnosMf+YVb6M--


--===============9158744654484529811==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9158744654484529811==--

