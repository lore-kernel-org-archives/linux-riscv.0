Return-Path: <SRS0=vGgu=OS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF53C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 12:00:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AA3C61157
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Sep 2021 12:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AA3C61157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYSRSqrUz8qfVItn+IiFzouGGa4sF8DJP/OxrYyjDBM=; b=pjZTuhW/Yn0r57rycNP8MQwEPp
	HalSWhkMSQVbjm6svo/VI6Y5JG321vQBPM9w0u4C+iYgqW+ORS0iEFPftuXBq2HUoQYDkTdWEgt5k
	lYC09wQrMO/a/lKnNkV8DRCosRbdG3VgfiMDKeE/UX2xDjehd0Sas4MYMCveWe9oWDEYRoco3zWg+
	1LioSolTGVQHHAv0bnLTK1RDX7XHBkQN2duKsjHVyu7m39Hs8dXLUlpyyiT3E0dY2JKk0sTAhilht
	T6E+27S23o+Z2plEAiwySS1R0IAiPHk5EIwfFuAGZy+6/WXcYSj5FYp0ShNpHAY2GXn5IsCx9sLHg
	ISMba7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVBmA-006zzK-Dy; Tue, 28 Sep 2021 11:59:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVBlx-006zxi-UL; Tue, 28 Sep 2021 11:59:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7A0561159;
 Tue, 28 Sep 2021 11:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632830385;
 bh=zMYBfWvCNkFzxdrnbweDkDMHXlvN68VeGQ+0I0PA/d8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EN/nPH2gh0WaxZze2kAw8Ok6z3UgQlhFMRx/0O3fExpPs36mEyK0xTTZ30IpXIlBB
 IkNlNXSD3sxzE5YSY/Soa7VGIQjCLZhRGWTxcE6j7jGV/jcAZ1ZGzSePySFQaNSF5N
 dAOkXU9MaDd6iFR0MKXNm/VNH3+vZc7ji20tThZhDSWtat3EL+yCeONizzhyPjU4y6
 OZNfF2MmephniDoiA0monFa1t+B7T+0P+v5sZLHqIQM58lTvFB3JS87J4nhqnAsm0F
 jirrD/U6QDySZiLSxBE9RG9Y3W5qc2GJLWhIDnjRW4vUBuha2O8TDvDfHfU/hqB7z3
 pswWVPVnQT0dA==
Date: Tue, 28 Sep 2021 12:58:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] firmware: include drivers/firmware/Kconfig
 unconditionally
Message-ID: <20210928115856.GK4199@sirena.org.uk>
References: <20210928075216.4193128-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210928075216.4193128-1-arnd@kernel.org>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_045946_038281_80796536 
X-CRM114-Status: GOOD (  24.71  )
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
Content-Type: multipart/mixed; boundary="===============5191504926830433686=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5191504926830433686==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mPOSj6iWmtyhwOMz"
Content-Disposition: inline


--mPOSj6iWmtyhwOMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 28, 2021 at 09:50:26AM +0200, Arnd Bergmann wrote:

> Compile-testing drivers that require access to a firmware layer
> fails when that firmware symbol is unavailable. This happened
> twice this week:

...

> We should probably do the same thing for other subsystems as well,
> but fix this one first as this is a dependency for other patches
> getting merged.

Reviwed-by: Mark Brown <broonie@kernel.org>

Regardless of what we do with the Cirrus DSP this just seems like a good
idea - surprises due to this not being generally available keep coming
up, IIRC with the i.MX firmware in the past for example.

> Not sure how we'd want to merge this patch, if two other things
> need it. I'd prefer to merge it along with the QCOM_SCM change
> through the soc tree, but that leaves the cirrus firmware broken
> unless we also merge it the same way (rather than through ASoC
> as it is now).

We could also merge a tag into both places.

> Alternatively, we can try to find a different home for the Cirrus
> firmware to decouple the two problems. I'd argue that it's actually
> misplaced here, as drivers/firmware is meant for kernel code that
> interfaces with system firmware, not for device drivers to load
> their own firmware blobs from user space.

Trying to enforce distinctions here feels like it's liable to lead to
trouble at some point...

--mPOSj6iWmtyhwOMz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFTA38ACgkQJNaLcl1U
h9DErAf7BZ8NtQuQy3+q/sK46z5J4UG49n7Ro2RwX1QsUE9ptW/j3QNct+oR2NtG
686Ywi+SLiwvjt9AOMEEwLrMr8VpbfKHtzNF3IFoqlZcIltP8SikGt7hl1drc7Ht
5s1rVT2od8Z49zvKru0SLEmIczlvfThmmEe7hH0klv/7eiYsIse//b/7UbCk03lc
BSU0mVLjlyBSIN6k6yU5V/JUnUwwNaWlTMficv4UITM2Ba6zjFS2WE2NlUhLcCv/
yHwgZhRm3quHTTRoJDelHsIqz65f4GxgXsMm4Olo/IZswnUh9Uk/LNMKRcHvlPg2
lP63ixob10ht4mAPh8V0shZi3aeH4g==
=nQ30
-----END PGP SIGNATURE-----

--mPOSj6iWmtyhwOMz--


--===============5191504926830433686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5191504926830433686==--

