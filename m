Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028D4C0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 14:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKaTz8QyXrn54UWIoJAVBYN3QJ9sLFMptSTp+BlDxKU=; b=dr3AIkFq1y9+bxYk9rdVVXpaax
	L4aspampOJr6LZVXiftDDVa2AGw1irZLN5PPJwSI3alIBJw90BHuK+fboncUDXwEmZtTQkXt6MHYx
	YPrJkG8FjoFGPZm+hjim7A2y/OQ4cb8MasGSp81FgCVsvDanC9sxtXL5DpbBGopJJP+ClKiiKZl86
	pWt6BRrjV5OmqVoVaBVAY90RvO2txaDJGqxx/W26jE8kkYtcESKYz855WsEN7fgKSFRqKXFj6l1Ee
	LYwRssOcMVaS9FksVMHLAq3t3mLUBPmTNaqQGgxRga4Rpq6C7rt/aYJ0pe9gK6QaUDM2DMVdVIBqh
	0kItr0MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpx0-002W4k-2f;
	Tue, 01 Aug 2023 14:02:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQpwx-002W32-0w;
	Tue, 01 Aug 2023 14:02:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 368BF615B9;
	Tue,  1 Aug 2023 14:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64B6C433C7;
	Tue,  1 Aug 2023 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690898528;
	bh=VNvAGs+RJC/wWP8NPciLgTw7gNKF8Q+/ePEXF/moAHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lR/o/rPJ09W+mjAX+ibUzyjhGjZT2i3QTLa7TI+URr1LjPnvTY2iC6GPqYl/n4r/3
	 WI/UNzJxW35Q0DDQTuxLw1RSoUoPpdFiCbT65gTE9ERpwX6uJ/Jw1QBGc/dTSkYPJx
	 FNA/RjX6qX7wwn/QnanU4oUFJADcz/1x2My8leQsMuZiS57cY8v120f7Yc2vmUiJfX
	 vtvf4FafJWxsU0fipTM5jzne4OEw4wkHM0zMUZ0QMFQkRlqHkhB82tojzXjPQ815fU
	 iQJjqbsqrrEYQWPmSD+mSbB2ySB0Q0+NzwHtr7edz91j3ub2TQM8/Oy+P0v2YI51MP
	 gpWzFmzYQSEUw==
Date: Tue, 1 Aug 2023 15:01:59 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "ardb@kernel.org" <ardb@kernel.org>,
	"keescook@chromium.org" <keescook@chromium.org>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"Szabolcs.Nagy@arm.com" <Szabolcs.Nagy@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"debug@rivosinc.com" <debug@rivosinc.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"hjl.tools@gmail.com" <hjl.tools@gmail.com>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"oleg@redhat.com" <oleg@redhat.com>,
	"arnd@arndb.de" <arnd@arndb.de>,
	"ebiederm@xmission.com" <ebiederm@xmission.com>,
	"will@kernel.org" <will@kernel.org>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: Re: [PATCH v3 21/36] arm64/mm: Implement map_shadow_stack()
Message-ID: <21d7e814-8608-40ce-b5d3-401f2110ad91@sirena.org.uk>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
 <20230731-arm64-gcs-v3-21-cddf9f980d98@kernel.org>
 <5461c56cf4896f18bddaa66c3beec7b909fc8fb9.camel@intel.com>
 <0a6c90d6-f790-4036-a364-d4761fdd0e95@sirena.org.uk>
 <e827138f9d8800e3db158831bca88d1ea8b559af.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e827138f9d8800e3db158831bca88d1ea8b559af.camel@intel.com>
X-Cookie: I thought YOU silenced the guard!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_070211_434275_B7F33719 
X-CRM114-Status: GOOD (  21.95  )
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
Content-Type: multipart/mixed; boundary="===============1592919805140412615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1592919805140412615==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Nwti0jdLm79TUUP+"
Content-Disposition: inline


--Nwti0jdLm79TUUP+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 11:19:34PM +0000, Edgecombe, Rick P wrote:

> The thing I was trying to get at was, we have this shared syscall that
> means create shadow stack memory and prepopulate it like this flag
> says. On x86 we optionally support SHADOW_STACK_SET_TOKEN which means
> put a token right at the end of size. So maybe arm should have a
> different flag value that includes putting the marker and then the
> token, and x86 could match it someday if we get markers too.

Oh, I see.  My mental model was that this was controlling the whole
thing we put at the top rather than treating the terminator and the cap
separately.

> It could be a different flag, like SHADOW_STACK_SET_TOKEN_MARKER, or it
> could be SHADOW_STACK_SET_MARKER, and callers could pass
> (SHADOW_STACK_SET_TOKEN | SHADOW_STACK_SET_MARKER) to get what you have
> implemented here. What do you think?

For arm64 code this would mean that it would be possible (and fairly
easy) to create stacks which don't have a termination record which would
make life harder for unwinders to rely on.  I don't think this is
insurmountable, creating manually shouldn't be the standard and it'll
already be an issue on x86 anyway.

The other minor issue is that the current arm64 marker is all bits 0
so by itself for arm64 _MARKER would have no perceptible impact, it
would only serve to push the token down a slot in the stack (I'm
guessing that's the intended meaning?).  I'm not sure that's a
particularly big deal though.

--Nwti0jdLm79TUUP+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTJEFYACgkQJNaLcl1U
h9DMNgf+P37hKhxkgQQ2bx5n4uZZFxfRehguU/iRyfY2v786eRp6cHggr3v5zNbn
YpYL5VP9uY+etSRtnZI8rksKaS4bR/OnIchJ1WVCyFEZOV+IiJrKgRpXYTFH4wd6
TJBjdEQtaeU7zIyikLOVb7gstveQddLzsUBDcAOoEwjUnd6alGbDGn262PKDeapK
hu+THENIjRxbrDkn9An5Uuca6c4XeWL/KbLQLP8uGKbz1FiCPUGDAF1i8FkoVxnL
IZW9d2IOzqXh0G/ZXwQhw9+9QNtN7zIDXIs2WS29VU2QoGJAZdNP9rJFhdK4C+/y
ih1/WTOQ+rJxgjVUggW+96FlbhxWZg==
=fLYM
-----END PGP SIGNATURE-----

--Nwti0jdLm79TUUP+--


--===============1592919805140412615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1592919805140412615==--

