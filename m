Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47661C41513
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 19:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7WhEb1IO00eYdyi3zpM5LeFMZozYgI9yTDpWS4lY880=; b=xnEeGyh29OoCDqpoZyQi6MTH17
	QxqxsDpIgtOR2B+D7whITw9bOuIZFblE9UH9FhIDdp+PQg/EibsWDVAwlqO+l7uFU7o6ppOvx+X5+
	KGaepTZXxjMEvzxPw7IF+G/RoD4l9DpVJOjgP+fHtnSpCYKnzjUmYc9u947bPl+eNlzJmbr182ho7
	8gWreA4c848OeAbz/j0Cp+lRepIB6W5M6avY6FY9ENGqyZXtqkw6KEnhAG5Bvh5W8ZLeWNwRMUskk
	W9CRDD9urbLstFfiTiqk3Ha90G3P5+MXkvaY1ZMmg8XWZSAU4eVdPApAHmm7f4140THmCcUEL4srk
	RKgnPEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQugT-0036IP-2S;
	Tue, 01 Aug 2023 19:05:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQugQ-0036Hn-30;
	Tue, 01 Aug 2023 19:05:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3A5136168C;
	Tue,  1 Aug 2023 19:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61AAC433C8;
	Tue,  1 Aug 2023 19:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690916725;
	bh=XaEyLOjcTNwc9YeWlOJYScuIZzeMlhSmUXhkTyWOcdo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grHpsCade+4hhBefcy1y7pfmLc1TAcGI5yfjr3ji+PPlfsj7KES8fDhea9q6wXLgD
	 xrGOW3viFBiZ2vyLfNwKC2X7e0UTc1/jdT+BIQoV/8PnGuJGh7RiYNNQpAaJGGf11f
	 CdB8b0Gn5nYSkS4o8WfpNo99u2ppuAN14a1C5I5IwjPlP7/PUzBYiYFueK9jOe6o1g
	 wKWlPPFaossUwjpE/h96bWJrEMfGbGHML66oQ9wJRkAletVZCNSjo4mwx9aKbjnxmW
	 /wU5qh51gu/TWRN8ejWFeGscGFLY08HjeLHMeUYNUquMcFllxGCj3PCG7S0rJoDSlE
	 IMkXmWaTTxdrg==
Date: Tue, 1 Aug 2023 20:05:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
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
	Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>,
	Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
	"H.J. Lu" <hjl.tools@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 11/36] arm64/mm: Map pages for guarded control stack
Message-ID: <1cbd6d5a-0e58-4a3f-b7e5-bbab09f03c5d@sirena.org.uk>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230731-arm64-gcs-v3-11-cddf9f980d98@kernel.org>
 <20230801170231.GC2607694@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230801170231.GC2607694@kernel.org>
X-Cookie: I thought YOU silenced the guard!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_120527_070622_5283D11C 
X-CRM114-Status: GOOD (  16.74  )
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
Content-Type: multipart/mixed; boundary="===============6746010038739771896=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6746010038739771896==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zPbhvjZzJERchlQs"
Content-Disposition: inline


--zPbhvjZzJERchlQs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 01, 2023 at 08:02:31PM +0300, Mike Rapoport wrote:
> On Mon, Jul 31, 2023 at 02:43:20PM +0100, Mark Brown wrote:

> >  {
> > -	pteval_t prot = pgprot_val(protection_map[vm_flags &
> > +	pteval_t prot;
> > +
> > +	/*
> > +	 * If this is a GCS then only interpret VM_WRITE.
> > +	 *
> > +	 * TODO: Just make protection_map[] bigger?  Nothing seems
> > +	 * ideal here.
> > +	 */

> I think extending protection_map and updating adjust_protection_map() is
> cleaner and probably faster.

That was my initial thought but then I immediately started second
guessing myself about review comments.  Hopefully Will or Catalin will
weigh in.

--zPbhvjZzJERchlQs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJV2sACgkQJNaLcl1U
h9AlrwgAheuf8ghyBKWYbkyMEXdB+oQMSgcGlnFgC7nJJfw06f2XaVrBNE+6Swjh
pgt+0RrRPIXZHhZXP3vHWP0yM/pgwS3o0K+/jolpahP+ieFfiJa5X4GTuGzPYZiq
6XYZEXkdOtuuyx3McLXU4Eet7PsnmqDolbBcr2pV1oyvRj6zWbdfv+SYoL8DX6bA
kUGWitWitEXi8bMTvWWg23s1MoFXLYxUWDZVwCl89aIipWnICzUze6O9FVMsfYJ1
h8ITi9V3QFo5uKkn1MySOUPaK7TI+VKZhAJMaNEQmCHMFXTkQhpp1jJvY4FFRVi2
rUxmpnOLBLA3hsMLGXV+tSV8S9P65g==
=kTpO
-----END PGP SIGNATURE-----

--zPbhvjZzJERchlQs--


--===============6746010038739771896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6746010038739771896==--

