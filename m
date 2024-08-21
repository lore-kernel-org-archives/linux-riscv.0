Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C785C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 18:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SQlChoNe4NWsypWXkJU50RfmJdMv33L7Q3RudwHnQYc=; b=Wunp4R3Dt+eyNrOkbj8KfuiRku
	H8mlTXFsVoB8NDM5bV+yU/0iiiiINW1Uc+2hS+eJ7MKQJyiq1xXKRkl49iV0WnVeuFqy4SDsKDnwo
	H80FEDqVLcCs0aCfg9e4S8oq7or5OSUMywELutLZaExj+7ghv5wopvgbJ5sSyNaPTSBUY1avB/kKJ
	0EzTq2VyYv8ih6h+JjhwAd6K+sjbOlUFk1VCxanGbo7myxmD/2DJKDlbwnHTnvxsb17SqM+CjcCru
	xjOJSla94eaazkQRdRvOjAxPmniV6YFBPB3sU5lc3PKNvrQ4XNzxKHTnJiSYEqlpTcGDu8TBphTUz
	heiVpc6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpgr-0000000A0Pf-0lyZ;
	Wed, 21 Aug 2024 18:04:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgpg7-0000000A0Gz-141f;
	Wed, 21 Aug 2024 18:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C021BCE0EA0;
	Wed, 21 Aug 2024 18:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75F2C32781;
	Wed, 21 Aug 2024 18:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724263403;
	bh=/aRfrKXnSS1N7hftXMF8UQpgchZc2Ul1bFVicgzIero=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVf6XBs6LZ1VwE8MCvsuECUI8wDLGVGOsDoP+OXniIlNf3c8k325LY7GWi5qo07XQ
	 L5WmJeQ22aV02dE0bx8Uv+TTVGqk392h6XEVMUcuE3/Bquc1IP3YU+Tv4lXSErAX1A
	 tIPxc5SMCm4nwEyJW3TPX0DkImgCK/ZstcvqRamVSUaFlJI7wlo8DK+zzT1787oA5Q
	 JymUOdFqBvriwf4scDwIi3uE8VJVvMh86PiQJ2tfnUuD/uI1YznuR8F+kaHBKgHIDU
	 UKW/QdL/rg3e0M2U1kBKyw20f1xQDKzBhdwPOjgZjNs5tM589OUaEaken7gv5k/X4w
	 /DkM7l6sKJTGg==
Date: Wed, 21 Aug 2024 19:03:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Shuah Khan <shuah@kernel.org>,
	"Rick P. Edgecombe" <rick.p.edgecombe@intel.com>,
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Florian Weimer <fweimer@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Ross Burton <ross.burton@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 23/40] arm64/signal: Set up and restore the GCS
 context for signal handlers
Message-ID: <d5473c27-167f-46c3-9368-487ed4b657cf@sirena.org.uk>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
 <20240801-arm64-gcs-v10-23-699e2bd2190b@kernel.org>
 <ZsYj0YYMuX1YRBZT@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsYj0YYMuX1YRBZT@arm.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_110327_650476_560DCE9A 
X-CRM114-Status: GOOD (  20.14  )
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
Content-Type: multipart/mixed; boundary="===============1353630773431234805=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1353630773431234805==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vOVm5CyTt8nbbuUu"
Content-Disposition: inline


--vOVm5CyTt8nbbuUu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 06:28:49PM +0100, Catalin Marinas wrote:
> On Thu, Aug 01, 2024 at 01:06:50PM +0100, Mark Brown wrote:

> > +	ret = copy_from_user(&cap, (__user void*)gcspr_el0, sizeof(cap));
> > +	if (ret)
> > +		return -EFAULT;

> Can the user change GCSPR_EL0 to a non-shadow-stack region, fake the
> cap before sigreturn? copy_from_user() cannot check it's a GCS page.
> Does it actually matter?

We don't take any steps to prevent that since I'm not clear that it
matters, as soon as userspace tries to use the non-GCS page as a GCS it
will fault.  Given the abundance of ways in which a signal handler can
cause a crash it didn't seem worth specific code, the cap token check is
about protecting an actual GCS.

> > +	/*
> > +	 * Push a cap and the GCS entry for the trampoline onto the GCS.
> > +	 */
> > +	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
> > +	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
> > +	if (ret != 0)
> > +		return ret;

> Doesn't the second put_user_gcs() override the previous ret?

No, we only set ret on error - if the first one faults it'll set ret
then the second one will either leave it unchanged or write the same
error code depending on if it fails.  This idiom is used quite a lot in
the signal code.

--vOVm5CyTt8nbbuUu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbGK+AACgkQJNaLcl1U
h9DN2ggAhLNXxP2D63m8tGi5TB8JVrMOEHceQoOhWbYArtPnk8DUJUwAVQKy4370
gWRlpUv3C9Prym8J79cdGllLtJAxGtFL846FtZ4GEzCwI0h42OKyIHIK0ayYDGwT
7mhlLJAE9x/zLEwqeSMWfUiGAUZs+B5Bcc/qe3gEkuBX9zJ1D4kkt0rUSUB8PR9+
mb7bq8tnqBOZ2/Ys/rHd7YOVTKnL9fNb3BG6ORxTFjKI/wwea16GhNrhUMcSaGCx
OjyC6/p6czJQmOMjRXUIRp2W8KD6YyRu8dOKy8imoKaZl7tcxZRwOC2XNWdH+9vC
sBN7fffBdrQUaKButl4to5BBOZzO0w==
=oJjq
-----END PGP SIGNATURE-----

--vOVm5CyTt8nbbuUu--


--===============1353630773431234805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1353630773431234805==--

