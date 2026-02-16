Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C9E81A29
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0b9D2r0Z8QBsSi4yElldCd9cE+DlYvRjDNTF9+OKsQk=; b=noSdAfWQlNoCjusr45lYDXJjzZ
	Yr9YBDTjCwg4+KotjRhREPKpdpL03Oqro9nfiL9aSE2CPvW5LA7lv/BK3HNrOjWHFiI27QKSBwS3g
	7Te83SQsuqLidMhuBZ7ThpjaY2n7UQT5lIsxiMb5nUuNvYKhXodSzv+ROFkFGBH8jUal4zZdwquNi
	SexER0Z1NNwukKeNf65aPKCUaWjAL1Moyf8qQrNcgivKOdLwRMyCzm9buHhazw5AiQmh1hq62CFbn
	pQoWTY+nGKPKpYL6Abn5+86BylvRgY7ta5yDVOBqLGDCkZs1jADuvXau/2EWFjWfdYo92EbKmdfvF
	QrkP5zng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzSL-00000006luy-2UK8;
	Mon, 16 Feb 2026 14:20:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzSK-00000006lun-0UeH
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 14:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D14A600B0;
	Mon, 16 Feb 2026 14:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A19C116C6;
	Mon, 16 Feb 2026 14:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771251607;
	bh=0T6dH182os6nJo1TGmEkQYQN+7rtkgj5cytxSkPL0CI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cpdOfencQ1snqTP1hL2Xe0BM9no8wLRE3ul52y428hLMqxNvhW+WV1ZmYkboWnMzP
	 hvMxDTktdRlCBQdBDmVRurBwRh5Wk2uZbtYFbuEqgBGXaGlLVQ0uhvHfLJ1r+mLGQE
	 RRl9JN85DuQAu1NIze41m0NXOeUngvrn3TsOs1ms/oahYuPrp/t9WrJvlQ7tIeg0b7
	 sRLBy6gWi8PpV2dkxNfRVN3OAdzXVKAxI1Tm/ob9VkhEoThsXozNZ3oFEBdIHXhMhU
	 aoWIfRKIen0h5hQROTulXW6+OaKbzwJ8h6J6cY9IWTcuLEsO+2Ed1xIb7BxFgQz2uO
	 glJKloQCBHAbA==
Date: Mon, 16 Feb 2026 14:20:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	debug@rivosinc.com, zong.li@sifive.com
Subject: Re: [GIT PULL] RISC-V updates for v7.0
Message-ID: <b2aae256-7d3c-447d-aa8b-5904848cff6a@sirena.org.uk>
References: <c554c02e-a791-5c4a-d329-7632de7a194d@kernel.org>
 <CAHk-=whUXMRa3py11kpZiDMau8uauiwZCok2UMQAecTshfTrVA@mail.gmail.com>
 <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
MIME-Version: 1.0
In-Reply-To: <2248971d-d69c-65fb-93b4-10f0d7d8bbad@kernel.org>
X-Cookie: Beware the one behind you.
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
Content-Type: multipart/mixed; boundary="===============9214359024262857657=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9214359024262857657==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UT4Ona/1nwGr0ncb"
Content-Disposition: inline


--UT4Ona/1nwGr0ncb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2026 at 05:23:41PM -0700, Paul Walmsley wrote:
> On Thu, 12 Feb 2026, Linus Torvalds wrote:
> > On Thu, 12 Feb 2026 at 15:39, Paul Walmsley <pjw@kernel.org> wrote:

> > And only very tangentially related: I think the indirect branch
> > locking could have been just a separate bit from the enable bit. I
> > don't see why it needed separate prctls for "set status" and "set
> > lock".

> Will think this through and respond back.

If that's the part I think it is it's following the same pattern as
shadow stacks, originally inherited from x86 then generalised.  We have
a prctl() that configures the feature and any optional flags for it
(it looks like the indirect branches don't have any) and another that
lets userspace lock each flag to it's current state individually.
They're separate prctl()s so you can use the same defines to specify the
features.

--UT4Ona/1nwGr0ncb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTJ5IACgkQJNaLcl1U
h9Dc0Qf/YVDNGl5xG0PfdLZ0NXwB4u8yeC0qwqUiw2xkqb97o+ixR62VotU7DJV4
NNsAl5b/ntTxh+tFn4u53Uz1sDXUxs+BfRQBHXiQp4V4+pPmSDByrQNRJY0M2FEG
60jhhv44YCoevm+LLsTXeSChfI5+m9XQoSB0d7LX+lqBJWaH6prRjqrC8cn5JCcH
cFlOVuz0CvuE1wBduTaCoqydHFK03CKQtgPGVfQSme6mbOSO17EE47Np2wLb6XuY
3eVO66P0h6VG4EKBHBVAZ5aL4fMP8rscX0Su3N8ona0JwdcNjvVSE4zXf8r20XYn
d8i4BL1D9S35OycOGQXqPBsS0nhjjg==
=cGA0
-----END PGP SIGNATURE-----

--UT4Ona/1nwGr0ncb--


--===============9214359024262857657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9214359024262857657==--

