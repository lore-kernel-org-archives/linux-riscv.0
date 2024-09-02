Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48388CA0ED3
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Sep 2024 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYjyr+JEEveDUt2g8I0araRMgqe8CNO3wgO/RqluaJo=; b=C4sEsG/x0UA5RNgp+en87p8Fpd
	nTQhX6P0l+8V2TCoBAUy8eZv9PgqGuL25FSpO3AY+D+bKutxWpGwOeQd2lxaXxKsX0xuHiOZEGQ2C
	PfYTwQ0bouz1L7Qg1JT/Kpc1JFTxv/hdnqWuoLDgG9cbft6rR+Jgq2PB9asTVGEKTCm7ywFFfvNfr
	l2Dv2nYEKVyICGbhZd18fLz0pJcbhPpMgRTNE9m929R0oL130wOrE6MAjPe7vObtyRZHTRJLzPJRn
	0I+s1Jhn8NguVI1j65wbxD91Ml6newMs5cSrvdMlyYfaohWGrabTIo6iYB9q5pwRepru7xR5BSHUk
	dVE6CL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCH2-0000000FLIH-2oxP;
	Mon, 02 Sep 2024 18:59:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCG7-0000000FL7R-21rt;
	Mon, 02 Sep 2024 18:58:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A181AA431BA;
	Mon,  2 Sep 2024 18:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A43C4CEC2;
	Mon,  2 Sep 2024 18:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725303518;
	bh=ULrqyQWdlaDEvu7Vyso62JavGFrUpmdzyVL+0CBH7so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLS5G3t85OMO13hHHnYkkx2VI1EzZofzNuR7RtwpFRSrkExvUuhqyjWfxTjBZdI19
	 wnPGiW23Vo5VNg1x6aaYhJcQpHDclMU+RpkGNZz3xmDPCBjpb/oPt1OwVS7P6p4fvB
	 oR1fwnov4vHwiSmclQ+X+GtNUmcl4MCutCC7QA8JkcRk5GSr3KHa3qC00P7pWS1twL
	 BDw8t90jYBbt3SDfjAoOSuYgtfwLJ5ITvwfAw9bSSbUmHRjIuu+NbmCa2KIhh6r6hf
	 Me1TGHipaVgQleQ+v9HWr/Q9yU8EScqC1IqrtxmsBkM7AHjXkuhu6tEd0cCYddddtP
	 HCpWDxyQcpX7A==
Date: Mon, 2 Sep 2024 19:58:28 +0100
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
Subject: Re: [PATCH v12 26/39] arm64/ptrace: Expose GCS via ptrace and core
 files
Message-ID: <3f190f54-477e-48dd-8a57-8d61ea20413b@sirena.org.uk>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
 <20240829-arm64-gcs-v12-26-42fec947436a@kernel.org>
 <ZtYKYMWjApRxFO_-@arm.com>
MIME-Version: 1.0
In-Reply-To: <ZtYKYMWjApRxFO_-@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_115839_604200_C271DFD1 
X-CRM114-Status: GOOD (  13.20  )
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
Content-Type: multipart/mixed; boundary="===============3628662917989240298=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3628662917989240298==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TKHSXDJ9uQiaLUmP"
Content-Disposition: inline


--TKHSXDJ9uQiaLUmP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 02, 2024 at 07:56:32PM +0100, Catalin Marinas wrote:
> On Thu, Aug 29, 2024 at 12:27:42AM +0100, Mark Brown wrote:

> > +static int gcs_get(struct task_struct *target,
> > +		   const struct user_regset *regset,
> > +		   struct membuf to)

> > +	if (target == current)
> > +		gcs_preserve_current_state();

> What's the use-case where target == current and do we need something
> similar for gcs_set()?

IIRC core file generation so no.

--TKHSXDJ9uQiaLUmP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbWCtQACgkQJNaLcl1U
h9A+eAf/U5iAiXuQK5f4MKYdawDbRNGb3EC6UsdEskrkjdlquMqu3jXyVPTU2Pj/
8tK8mveoLmqU29r6fnrYxLffDNp7k9VTr+r1fi3ezQosSJyMep+Dar2mmeRh/dz2
VcJsvymrKNdz3BE2FMGnAUNkJWGw/b4Lqio3XfjDexX0p/ZvD00cjvaZ/1wEJ1VV
uOKEhpylc8LgQrfLJO4dMFJncqo6GBePUhoqaEPG/0fgS0jJlrDhtUluuITVhwWt
rqzDcT1ryxvNqG1urOShrMnBTvsUsAOW0G1JDjI6nL8Y35Sx+nSHiYOZkVwpBhpR
oFa8/2ferdCftHGVLV3CQ0AXR9jn1Q==
=loiY
-----END PGP SIGNATURE-----

--TKHSXDJ9uQiaLUmP--


--===============3628662917989240298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3628662917989240298==--

