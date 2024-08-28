Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA77C636ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuMiomY7XD9iOOG/u0H+KRd4Lyp1RsSywW1ZruM1sPM=; b=ohNYYpGdDIEi7kg8psYojPTdF8
	Q7YfSFkoYiIzhQ2LC56OntnZnWEiQkNYqlf170I2Hd8mhla18aExNJN8FAXsjcvsptQW6BgGpDPHd
	NWxaT6V2evELNPpdiIHd4Uq/hNzus5n2zeOI3mJ/H/gcbOdQQlQuyO2wr+FEI0rm+KzhCRTOHu69W
	xParxSMDx6R5k/m8+pf4v/P9fK2AESpaAE4lVqlvE0pKY1Pzwq8xqzeNDt3s1gL/5FTrK0gL0OJAw
	crCK/T7Yak5C2uBZxgx2RUv/ZwLrwRhsfs+8mxeX3pQmR6EtHl+QlbdU7Qs77tfKEt6rTmUqc8K6h
	8p/v8ykw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMaU-0000000GOOW-2qNB;
	Wed, 28 Aug 2024 17:36:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMXT-0000000GNxV-3mhq;
	Wed, 28 Aug 2024 17:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD370A42763;
	Wed, 28 Aug 2024 17:32:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71927C4CEC0;
	Wed, 28 Aug 2024 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724866378;
	bh=4MDDdzSEhRjEbEa2n9fIYxr42mIY+eyZfSj6+j+Bu0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/xcOhorFRSv2vHmRagMWmGxh+ScNnb9p5YrzG9/pAmQfUsEg399/CaTU0Z06a3Kd
	 25gBR9x3tRKON/9TVqn3X9yWKKyvoaXPglSuRX8H/AEzCQfOfamSFXFrUflPvWSiAU
	 m2RTlwhEQm6GYG4Uu3jWFaCtKcYLtQjATOV2MkQy03IMy9y2Bez9OmpxvhprGtMcQG
	 PjRlInV3Bc/JK1THjQVmMuPnn6fu1rOqZ3+sGnnl2KRptQU5L4iIPf6dlZynx0jL9x
	 730E1RPdEdJUvwP5kiHq7t30Mte5uQ7x3NQJjn8eIqgssRzUyqSg0jXamQWsy9Pz/C
	 BWKufAwkMrGMg==
Date: Wed, 28 Aug 2024 18:32:48 +0100
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
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 25/39] arm64/signal: Expose GCS state in signal frames
Message-ID: <4de41478-3bc8-4cb4-a557-3e9402afe858@sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
 <ZshYTyNbveD7WMyJ@arm.com>
 <ZshjmuYcejbhaSBg@finisterre.sirena.org.uk>
 <Zsixz6Y9xWxqaQaV@arm.com>
 <ZskGqU8BSvR01W30@finisterre.sirena.org.uk>
 <ZsxSKVAOHQq12YfB@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZsxSKVAOHQq12YfB@arm.com>
X-Cookie: You are number 6!  Who is number one?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_103300_092228_C6A7EDC6 
X-CRM114-Status: GOOD (  30.05  )
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
Content-Type: multipart/mixed; boundary="===============1479384096184699262=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1479384096184699262==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qwAebp9So100JWhv"
Content-Disposition: inline


--qwAebp9So100JWhv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 26, 2024 at 01:00:09PM +0300, Catalin Marinas wrote:
> On Fri, Aug 23, 2024 at 11:01:13PM +0100, Mark Brown wrote:
> > On Fri, Aug 23, 2024 at 04:59:11PM +0100, Catalin Marinas wrote:

> gcs_preserve_current_state() only a context switch thing. Would it work
> if we don't touch the thread structure at all in the signal code? We
> wouldn't deliver a signal in the middle of the switch_to() code. So any
> value we write in thread struct would be overridden at the next switch.

I think so, yes.

> If GCS is disabled for a guest, we save the GCSPR_EL0 with the cap size

s/guest/task/ I guess?

> subtracted but there's no cap written. In restore_gcs_context() it
> doesn't look like we add the cap size back when writing GCSPR_EL0. If
> GCS is enabled, we do consume the cap and add 8 but otherwise it looks
> that we keep decreasing GCSPR_EL0. I think we should always subtract the
> cap size if GCS is enabled. This could could do with some refactoring as
> I find it hard to follow (not sure exactly how, maybe just comments will
> do).

I've changed this so we instead only add the frame for the token if GCS
is enabled and updated the comment, that way we don't modify GCSPR_EL0
in cases where GCS is not enabled.

> I'd also keep a single write to GCSPR_EL0 on the return path but I'm ok
> with two if we need to cope with GCS being disabled but the GCSPR_EL0
> still being saved/restored.

I think the handling for the various options in the second case mean
that it's clearer and simpler to write once when we restore the frame
and once when we consume the token.

> Another aspect for gcs_restore_signal(), I think it makes more sense for
> the cap to be consumed _after_ restoring the sigcontext since this has
> the actual gcspr_el0 where we stored the cap and represents the original
> stack. If we'll get an alternative shadow stack, current GCSPR_EL0 on
> sigreturn points to that alternative shadow stack rather than the
> original one. That's what confused me when reviewing the patch and I
> thought the cap goes to the top of the signal stack.

I've moved gcs_restore_signal() before the altstack restore which I
think is what you're looking for here?

--qwAebp9So100JWhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbPXz8ACgkQJNaLcl1U
h9AINwgAghxTu8PB4VcQHkYwz1H/qDleYcPMAHplNpZgcLpx59wTJgBZ5QfIwDnV
v12mJKsZJ3gfnHdZipZjp7EKhKGELQUTGRLICZqBr9S/8SfK3cXC3z6gQEXLxu3W
Z122sDonqb/vfykIYhrtWeP12Rgm1n7KRplfJrXGx+xfZD2pQRdydES4L5RWtbZU
coJqFBLlGHRFqsnIUQni4PFl1UCQRVitFHHS4nL+Fs/lGj+rkjM69mkCQjmAHR1d
/Wivj6fyHPPQj8UCXiCXkk+/KcM64IZqgoTzIdYH+khbjTKKaBC0s06fnqJqU2n1
d06XGwawJkM0HfQlIcf0XRaB8a7aew==
=V6Zo
-----END PGP SIGNATURE-----

--qwAebp9So100JWhv--


--===============1479384096184699262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1479384096184699262==--

