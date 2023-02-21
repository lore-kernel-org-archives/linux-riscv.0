Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD0C636D7
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 22:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjfBSZEAKQG+UwbwjhHMA+fyGzEWhIGA1ELkSmOcYO4=; b=D6ZpqPcesV1a/VegatzuMtV9PD
	OXNqBQbqOtWNJfTIKHQ9zpNVQIMejBQ8LsTt0PyKIdDRD4lfFC1K3JgggkGaShVFWKvirOQ5xUGGv
	ooeLNLDi9fPyghBGEhiI5YjFCDTqy4+hJydxPQz4hw17Id4jc3PMibj//Jy5V63RMFIOu53IUHe/J
	PDBxkmy/+Qy4e+okggN9+KjGj5VR4yfYLVtq1Dr6msOgrdkXShcpcHWoBuiW56Ghko3XCQ2syiFVI
	LvfJqos/U7Nh2qTe9I+k9at6MbL9qnTP4jBn5f7zYTXTfADu8Ztbdvca2wSHK6C1bc2H3R8q2HS4G
	x1ehTcgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUbNo-00A1iD-5b; Tue, 21 Feb 2023 22:45:12 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUbNl-00A1hQ-Op
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 22:45:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2CA62B81106;
	Tue, 21 Feb 2023 22:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4174CC433EF;
	Tue, 21 Feb 2023 22:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677019506;
	bh=8SFKrp35fK6Dd8k0lr1dPRUo9rE3AzIz/CciN7T0U1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utv7piB4pUX7N+bKFbfNKT3h3UFVgz0o9G0aQEt/8KQSoOwMOlTcFHA7SsBLvSzUQ
	 6nOTHlhVxnHY90bmwshQtB0qBjfgYlnagq0EmF/EGo2HU1xdMWuPD9NXFU9V4hTRIp
	 eRUzQge81LKi7K1/NjbHFSLxu7FKhsgiUwQNcLbcL9+27MYgeX19X7e8bKKC8e7Jen
	 zfKXF82FPxfC+lbeNMdZCPLQBAXgANCgKa7TeG0jKsU6pd3BJ2kjJODNoKYCfAu0uF
	 SAZ3wV+OwNPdUmEfHJ8rWOm9fEt79o4pTJQfLnEjwsnsr3x9pYas10veF89Z7gUO1E
	 aRlFI5uRJVVYg==
Date: Tue, 21 Feb 2023 22:45:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, heiko@sntech.de,
	Conor Dooley <conor@kernel.org>, slewis@rivosinc.com,
	vineetg@rivosinc.com, Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 6/7] selftests: Test the new RISC-V hwprobe interface
Message-ID: <Y/VJb/Mz4OI09MEr@sirena.org.uk>
References: <20230221190858.3159617-1-evan@rivosinc.com>
 <20230221190858.3159617-7-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230221190858.3159617-7-evan@rivosinc.com>
X-Cookie: Serving suggestion.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_144509_977871_364BA722 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: multipart/mixed; boundary="===============1696011991530112217=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1696011991530112217==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3eeBJmjkOCU+EDTd"
Content-Disposition: inline


--3eeBJmjkOCU+EDTd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 21, 2023 at 11:08:57AM -0800, Evan Green wrote:

> RISC-V, so I've added some infrastructure for those as well.  The build
> stuff looks pretty straight-forward, but there's also  a tiny C library
> to avoid coupling this to any userspace implementation.

It looks like this has been updated to just use the normal system
libc so the changelog isn't accurate any more?

--3eeBJmjkOCU+EDTd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP1SW4ACgkQJNaLcl1U
h9AARQf+J6bTCIZaQ6XTb3NG4YC4SxstK3Mul0hg7r4uTMkxN5HWg3KMkEKSRKvv
iw3J+4GuEAOoqUv9EIZ5tllsIvJMLMxrScHphIMXD3lDOmWZPQPgEbgec6QvpmZD
EXkNIDDhcpqb7kxOwu5S7eObn9nAKYNpV70u75RADCxirW/IbWB2HXNYMKGfztl5
kEQ80Xrxxx8I/eU6PJuohSsOm31e0yJCns9aWDpqtrBdvrCNwgicrVSGVg8s/EP6
WwsiqINdzfgkYcSXfRDCzlpUZxoqIbXx8X89FvjiCGQrgZSChzHec8yRUSElg4gQ
lL30KzIaj3ILRCoh4mrDu06OxKSxng==
=Dcav
-----END PGP SIGNATURE-----

--3eeBJmjkOCU+EDTd--


--===============1696011991530112217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1696011991530112217==--

