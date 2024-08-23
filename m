Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0A5C5321E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 22:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9f/En66CrCFHi+Qs5TstaTMIw1Wh6vxzZHep8inSDrc=; b=eq70CaeHnwwmjGu7FsC+/eUq+8
	KcTt/L5Max53aFGN8EIOmhD8cq3BpwjmdSz5HDT0BJRNEHPJJrX3oSYkDaU43EVHS4VMc2ry5+aON
	HSUSrCukLBu+WsTeg/jI8S2SIClLcHXN9l8YXDnZX/E6gzrvy1d1r/srVb4SiiNuUmY/cKv9E7lXY
	SzaMm2oiFbzJv3X2pzCCsD1En1/V+ay3YJZSHwQEBXt1rjiL0s5fFEhbJYEfj/y35w3YBp3HqG1AX
	/WW92YjEbQwuhdcSwoMlI/9PDHhXFM0sR2wt3Gutlj4XjUmkT0+1MuSFx3GxKzl+H1MuGyrmDps9S
	QOoBOL6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shcME-00000000n2j-1dk4;
	Fri, 23 Aug 2024 22:02:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shcLQ-00000000mtC-2GO0;
	Fri, 23 Aug 2024 22:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC9FACE1189;
	Fri, 23 Aug 2024 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71569C32786;
	Fri, 23 Aug 2024 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724450477;
	bh=4E2/SMw5ipU2qtwXN1Uwic3Rzbvi3xioIyGpbAx2lVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJhUw/1qZ9BDQyGdrwh4ZFy64bp7OwurHPaIZF/8dlHGGMyUg6oD3nsAesh264NNS
	 FoGyn2Rq2QL39OrogIEFtmo21ioxgFBgEj7Es9kG5Qpgra3wSXqqpYQ1pNK2A8IoYg
	 Z8fN8zNIL9aOQlXGKDnm0SrmFwR/DdFSAkSXCqRoUqve0c9CIlohY5Kez50qcxZXm+
	 BBy4p4qNCrGMIXT5+V5RxKrFG95GKkg8ilN9BZLYBhNJwhkvW2QkCMhzkT8j4erCII
	 zjx/mdrol0O8/FIK5z9vPsPhmzvc3K733r3dtwz1kN8Njo8cs83m645QMmL+XqdHr7
	 WVHT/FDFTov3Q==
Date: Fri, 23 Aug 2024 23:01:13 +0100
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
Message-ID: <ZskGqU8BSvR01W30@finisterre.sirena.org.uk>
References: <20240822-arm64-gcs-v11-0-41b81947ecb5@kernel.org>
 <20240822-arm64-gcs-v11-25-41b81947ecb5@kernel.org>
 <ZshYTyNbveD7WMyJ@arm.com>
 <ZshjmuYcejbhaSBg@finisterre.sirena.org.uk>
 <Zsixz6Y9xWxqaQaV@arm.com>
MIME-Version: 1.0
In-Reply-To: <Zsixz6Y9xWxqaQaV@arm.com>
X-Cookie: Your love life will be... interesting.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_150120_977912_D1539771 
X-CRM114-Status: GOOD (  39.70  )
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
Content-Type: multipart/mixed; boundary="===============0298802001904024316=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0298802001904024316==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BjuuYVXdnzsl9n3l"
Content-Disposition: inline


--BjuuYVXdnzsl9n3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 23, 2024 at 04:59:11PM +0100, Catalin Marinas wrote:
> On Fri, Aug 23, 2024 at 11:25:30AM +0100, Mark Brown wrote:

> > We could store either the cap token or the interrupted GCSPR_EL0 (the
> > address below the cap token).  It felt more joined up to go with the cap
> > token since notionally signal return is consuming the cap token but
> > either way would work, we could just add an offset when looking at the
> > pointer.

> In a hypothetical sigaltshadowstack() scenario, would the cap go on the
> new signal shadow stack or on the old one? I assume on the new one but
> in sigcontext we'd save the original GCSPR_EL0. In such hypothetical
> case, the original GCSPR_EL0 would not need 8 subtracted.

I would have put the token on the old stack since that's what we'd be
returning to.  This raises interesting questions about what happens if
the reason for the signal is that we just overflowed the normal stack
(which are among the issues that have got in the way of working out if
or how we do something with sigaltshadowstack).  I'm not clear what the
purpose of the token would be on the new stack, the token basically says
"this is somewhere we can sigreturn to", that's not the case for the
alternative stack.

> I need to think some more about this. The gcs_restore_signal() function
> makes sense, it starts with the current GCSPR_EL0 on the signal stack
> and consumes the token, adds 8 to the shadow stack pointer. The
> restore_gcs_context() one is confusing as it happens before consuming
> the cap token and assumes that the GCSPR_EL0 value actually points to
> the signal stack. If we ever implement an alternative shadow stack, the
> original GCSPR_EL0 of the interrupted context would be lost. I know it's
> not planned for now but the principles should be the same. The
> sigframe.uc should store the interrupted state.

I think the issues you're pointing out here go to the thing with the cap
token marking a place we can sigreturn to and therefore being on the
original stack.

> To me the order for sigreturn should be first to consume the cap token,
> validate it etc. and then restore GCSPR_EL0 to whatever was saved in the
> sigframe.uc prior to the signal being delivered.

To me what we're doing here is that the signal frame says where
userspace wants to point GCSPR_EL0 in the returned context, we then go
and confirm that this is a valid address by looking at it and checking
for a token.  The token serves to validate what was saved in sigframe.uc
so that it can't just be pointed at some random address.

> > restore_gcs_context() is loading values from the signal frame in memory
> > (which will only happen if a GCS context is present) then
> > gcs_restore_signal() consumes the token at the top of the stack.  The
> > split is because userspace can skip the restore_X_context() functions
> > for the optional signal frame elements by removing them from the context
> > but we want to ensure that we always consume a token.

> I agree we should always consume a token but this should be done from
> the actual hardware GCSPR_EL0 value on the sigreturn call rather than
> the one restored from sigframe.uc. The restoring should be the last
> step.

If we look for a token at the GCSPR_EL0 on sigreturn then it wouldn't be
valid to call sigreturn() (well, without doing something first to unwind
the stack which seems hostile and would require code to become GCS aware
that wouldn't otherwise), if you do a sigreturn from somewhere other
than the vDSO then you'd have at least the vDSO signal frame left in the
GCS.  You'd also be able to point GCSPR_EL0 to anywhere since we'd just
load a value from the signal frame but not do the cap verification.

--BjuuYVXdnzsl9n3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbJBqgACgkQJNaLcl1U
h9BLswf/SWEpbfZkH/LtOITztzCmYc/9r1ewDv1+OENkYT92eXaB9xbvJoP9TSK7
9L5zc2aRpMs8ND7Z79oBC2ukkLkNGlZgk50jrxAj/ABNYEwGhWr6WCEURjpJCREV
waO+TZDL2bO84z/f9ES1W4aKPZfTVfDArJ7orEQM8OgkSdql3wE/D9qqw2FgivU+
pO4BYgkO67qg2p1/UIlgWEJAQAgYLI60IZkP2g6CawlFdze3kHo5cnIBh0Ou3sxa
+HfHlY5BIjhQvlSdEx5GfhZuGdRSUlZdYwbbJGKAXt9sB80z6QbAet3BfFUGt83I
CqP6WBYkc5NW8mLg/8gZCbn3Quh5Xg==
=fp7z
-----END PGP SIGNATURE-----

--BjuuYVXdnzsl9n3l--


--===============0298802001904024316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0298802001904024316==--

