Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5E4C36002
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 22:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ueauTxKSoBF1Uh2xEXvWwERDDlnIkZqxtxWfJlymqg=; b=Xpzy2clQLGE3F+95Aazn4YmS1J
	ZWuVd88Kb8h9L3orqTmQ5fJ/83KFaJNnOnbK++TkzYYPwhPHRzUOPsq3+ixVTyOJqjEbQeQ6PxYxG
	Ae5Wg8kss+AZQUkc+UyHaqboxVi/kRQ4pzCTK1ylkJNlece8IZhJGe0WEuW4E71qQMzHa54pF3q2a
	3TQMIjEGKdTFmpyKNK1SmMWhXMNrsuUvf4nGi8oMpCb5ODJ/ahXkXhe7W71rzY88p8DKGUqwV5O2t
	pAnMNOXwqdjrmJSsVOTzxHgJTpMlsQjSQMAtL/drblu9M4ddOeYG4r/INRj0Y1ez1U0L+m26iVIYR
	29dsbm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvl1N-0000000GVDp-4Bdj;
	Fri, 21 Mar 2025 22:39:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvl0A-0000000GV7S-1VmA
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 22:38:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B09BD40BF8;
	Fri, 21 Mar 2025 22:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0678C4CEE3;
	Fri, 21 Mar 2025 22:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742596686;
	bh=nrhlOP9d7PiSuMh7n2hu2MfcESZMoqXB6qfA5Gop3ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvPDQUmQaW0p9015fBnH8HZXdTLUkmdLADBqQKLbS7FlDRPFGH+4JfV0HVGw6KQAC
	 wmwcwbEGwtCnCydbMEzrSt2Gz+tX8sOLIZwUEKHXNcV+D0Uj31YCyrPOutld6t5/jZ
	 BSA8ezCJJTY0rIszLxTweXNzX2i4EqhVhsBAN4l2bQscz4zELe3XZY0yRvMzlMndYJ
	 noWdHFhX/Dxt1YnYfGLd7iVzo6Px9LZ8Vw/CNrpAdASoSz9RSZia0ewtKKGq/vxbz2
	 FnD9b/0Ugx4zOF9FNU6amX5e6449rfRPQyuhDkerWMASxsNOAaYde4I08qOFAhYbIa
	 mO2VWaz+83vHA==
Date: Fri, 21 Mar 2025 22:38:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Eric Lin <eric.lin@sifive.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
	will@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
	peterz@infradead.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com, Nick Hu <nick.hu@sifive.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Message-ID: <20250321-spinal-endocrine-aabd38734c32@spud>
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <20230720-slept-guru-216e2803061e@spud>
MIME-Version: 1.0
In-Reply-To: <20230720-slept-guru-216e2803061e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_153806_417100_0C935C88 
X-CRM114-Status: GOOD (  10.12  )
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
Content-Type: multipart/mixed; boundary="===============6555774569749606807=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6555774569749606807==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7UoAQXoEu0XzRgDv"
Content-Disposition: inline


--7UoAQXoEu0XzRgDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 06:10:51PM +0100, Conor Dooley wrote:
> On Thu, Jul 20, 2023 at 09:51:19PM +0800, Eric Lin wrote:

> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: sifive,pl2cache1
> > +      - const: cache
>=20
> You omitted the pl2cache0 from here, that needs to come back! You'll end
> up with 2 items entries.
> Either way, I can't take this binding without a soc-specific compatible,
> per sifive-blocks-ip-versioning.txt..

On this last point, what Nick Hu has done for the clint2 would be
acceptable, adding a {} entry to disallow the compatible in isolation
without requiring a soc-specific compatible for hardware that does not
yet exist:
https://lore.kernel.org/all/20250321083507.25298-1-nick.hu@sifive.com/

Maybe that'll allow you to submit a v3 of this work?

Cheers,
Conor

--7UoAQXoEu0XzRgDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ93qSAAKCRB4tDGHoIJi
0oUaAP9uzIey7liZb+Bjy1/CuZWjq+8Noa6ZaN/cM35WlmDg/AEA2z0nS1vm0ayX
GW2I1IyVpUNSK01K1FIhOgrUeQuXTA4=
=VwYy
-----END PGP SIGNATURE-----

--7UoAQXoEu0XzRgDv--


--===============6555774569749606807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6555774569749606807==--

