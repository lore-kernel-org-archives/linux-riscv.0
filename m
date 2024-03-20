Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379F0C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2oAmT3PKMtHmOq3UV6EeWWX1cYCSlqt0Vtlut2zXC4=; b=gQAF6+3iLG32r1VbGW0QiafnCE
	kikVbA/gmcQdXlLUW0P8CAhRxoGgCDFWm11a4KAnX/hTr1i/1VduGjxKk8kag+XLGXNmjvqy3K7HQ
	FbSittwzTbC3n+UAPpBzqoHx6N9Jr5Z1k90DvY1bFPLBgruF4WVC/3+ovhT+W+rKjZRR8nrvHLJrV
	kHqu48Y82ldV+uJTX7uSIjPpN6RXxfTcIjrB0T8xBL/+xvORwJWl0ybCZ6s4LbHgec/XMBNsOcUdy
	0AJ+ELiSls43J+mj4s22qU9PStGb71nc6twUfoExH5xZCXay06n7VjQt0NqTbBYYnDtnzI525Oq0L
	0zB+8LMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzco-00000000T7K-452I;
	Wed, 20 Mar 2024 17:21:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmzcl-00000000T5J-3hHs
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 17:21:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D110C61041;
	Wed, 20 Mar 2024 17:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF59C433F1;
	Wed, 20 Mar 2024 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710955270;
	bh=vMt26N+gZlbDIjpZ5zan3Cn3V7tOpJjhfbvtLaaSEq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sSGqzDQR5pMJHQpJD2A5Tsa85TNyzs/VaHkeFqTGVRii2quMlXc1YRh9shPu6T7Cp
	 peubW3wxB92VVgh+sNL0e3aZv71RPHtLcLq5pJBIt0TmCezQAlgxtBEXwE4/NNB8yr
	 Fb8Tgm95F+9adlFvSGejqQxARy+vm1InxtlCBbQv7TQBL4Hm+8PizwvLlES2nrAk7z
	 8+ImGXduaZYQ1LpSDmNr4BOT/K6bbIGCnPA4f2V4FOhSoklogSnX0F+uOhHM2Ngv0c
	 Fpy5Mx3zpOBr8J0cY/Vpq84jbQ9q1vAIRlZDvAKXNqS0hnGmq7D6rAahuvHOBXinx6
	 uBeEoHiGZdmUA==
Date: Wed, 20 Mar 2024 17:21:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, tech-j-ext@lists.risc-v.org,
	kasan-dev@googlegroups.com, Evgenii Stepanov <eugenis@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [RFC PATCH 9/9] selftests: riscv: Add a pointer masking test
Message-ID: <20240320-handpick-freight-ec8027baa4d1@spud>
References: <20240319215915.832127-1-samuel.holland@sifive.com>
 <20240319215915.832127-10-samuel.holland@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240319215915.832127-10-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_102111_982724_F05067CD 
X-CRM114-Status: GOOD (  10.68  )
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
Content-Type: multipart/mixed; boundary="===============2263519249398130838=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2263519249398130838==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2lLUjXGQgSitrjkh"
Content-Disposition: inline


--2lLUjXGQgSitrjkh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 02:58:35PM -0700, Samuel Holland wrote:
> This test covers the behavior of the PR_SET_TAGGED_ADDR_CTRL and
> PR_GET_TAGGED_ADDR_CTRL prctl() operations, their effects on the
> userspace ABI, and their effects on the system call ABI.
>=20
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>=20
>  tools/testing/selftests/riscv/Makefile        |   2 +-
>  tools/testing/selftests/riscv/tags/Makefile   |  10 +
>  .../selftests/riscv/tags/pointer_masking.c    | 307 ++++++++++++++++++

I dunno much about selftests, but this patch seems to produce some
warnings about gitignores with allmodconfig:
tools/testing/selftests/riscv/tags/Makefile: warning: ignored by one of the=
 .gitignore files
tools/testing/selftests/riscv/tags/pointer_masking.c: warning: ignored by o=
ne of the .gitignore files

--2lLUjXGQgSitrjkh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsbAQAKCRB4tDGHoIJi
0pbyAP4rgHPD5OEauv47v5LeZ6gpBL/+0Gj9XCgAwfpJ1XiI/AEA6/mJhAh0XHlI
JCwPgAQGsM0OU/X+IRCzl56WkN8M1QA=
=mhnd
-----END PGP SIGNATURE-----

--2lLUjXGQgSitrjkh--


--===============2263519249398130838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2263519249398130838==--

