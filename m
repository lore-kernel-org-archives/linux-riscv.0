Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD0DC2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rK1QbQO6i90Qw80NPl3cbUerx3b/uFC62pp42dpP0nI=; b=0WovlbEMfBsAEYVVi0iXxDTKq7
	SZoQjKv/WWLtEG+NLrWUyZJW8Z+vBEsdVPj3/7eocm376nXU20OxZY77sQV5DG/HfpZzgoYwk6o8o
	USQoI15h3YTFSfG+y3tp3zVh8exTzJ0blGAYO9YkVjpdvKqKHA2syY6us1YYvDwRunaCCe0G26IVi
	JY+x94oCvSsaoakeJuHhbHXC6YAxdZi0LX7DmANDIr2EIX2UMnuzN/2eql8t5h98UWOB69Tv6b1r5
	ykc108JMKfhudjZPg8sIcU8pa8+/5xkBG6yj+Y334J4NDStAbAYPrgGbWX4aQMYvik7XJ5ugZB6aa
	VZ70J62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMroa-0000000B0Lr-3Xlt;
	Thu, 27 Jun 2024 16:17:40 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMroX-0000000B0LL-3FC6
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 16:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03ED0CE2FA7;
	Thu, 27 Jun 2024 16:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F54C2BBFC;
	Thu, 27 Jun 2024 16:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719505055;
	bh=JCHawlPhQVtEB/62gpaSxlS8FpdBXAdzyhtV6Q2BFkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiD2w6AE7gFDNRrMxB6X9GL0NJ/yeRh8e1hQQBQA0Oj09Iome67YbcP/FpbwnNBzd
	 Yry9mxpHo65f448GHeqv1DZOwoe+MklKyXTKmL4rayIADVJ+JeV+bXDQMM6zhk9LO+
	 DKTIl3Sx/w/RiuKFpwb8yZ9xmGQ/DdOFbGYxdWKUJDam6w8daHarEKd8VLdOAhOcCe
	 7uZqa5HElNgOUZHMElt3fTlznB3ZnY/kXPiU/M31+oKsTVPcgctXQ5q/qI+esZoawQ
	 k7svT9Kt7qnK0Jj7jMdXTk3J1ItoV5zLe+LdMMCJt044u6DiRxNy0tZAK5fwx2xzPQ
	 ZWl0oKtIsFmew==
Date: Thu, 27 Jun 2024 17:17:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>,
	kasan-dev@googlegroups.com, Atish Patra <atishp@atishpatra.org>,
	Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v2 01/10] dt-bindings: riscv: Add pointer masking ISA
 extensions
Message-ID: <20240627-deprive-unclog-2fba7562a8e6@spud>
References: <20240625210933.1620802-1-samuel.holland@sifive.com>
 <20240625210933.1620802-2-samuel.holland@sifive.com>
 <20240626-refined-cadmium-d850b9e15230@spud>
 <acd4c562-1f4f-4cd0-8ff8-e24e3e70d25e@sifive.com>
MIME-Version: 1.0
In-Reply-To: <acd4c562-1f4f-4cd0-8ff8-e24e3e70d25e@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_091738_012498_5949432E 
X-CRM114-Status: GOOD (  16.49  )
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
Content-Type: multipart/mixed; boundary="===============0913021496738653471=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0913021496738653471==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="68QJ4uKjJCUY75Cn"
Content-Disposition: inline


--68QJ4uKjJCUY75Cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:14:27AM -0500, Samuel Holland wrote:
> Hi Conor,
>=20
> On 2024-06-26 11:01 AM, Conor Dooley wrote:
> > On Tue, Jun 25, 2024 at 02:09:12PM -0700, Samuel Holland wrote:
> >> The RISC-V Pointer Masking specification defines three extensions:
> >> Smmpm, Smnpm, and Ssnpm. Document the behavior of these extensions as
> >> following the current draft of the specification, which is 1.0.0-rc2.
> >=20
> > You say draft, but the actual extension has already completed public
> > review, right?
>=20
> Correct. The spec is frozen, and public review is complete. Here's the tr=
acking
> ticket for details: https://jira.riscv.org/browse/RVS-1111
>=20
> I use the word draft because it is still an -rc version, but I can reword=
 this
> if you prefer.

No, it's fine. I just was double checking the state of the extension
before acking the patch. It'd be good, in the future to note what the
status is, given the policy is to not accept things that are at least
frozen.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--68QJ4uKjJCUY75Cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZn2QmgAKCRB4tDGHoIJi
0ugrAPwMAkqBdLVsNJYPUHmC+kiwO+gD/VqRmHsUype6Dvv2iQD/aPrrIh/9f5bL
PgBTuvqfvaF2Rp8IVP+TtTDUn9MREw8=
=3K8O
-----END PGP SIGNATURE-----

--68QJ4uKjJCUY75Cn--


--===============0913021496738653471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0913021496738653471==--

