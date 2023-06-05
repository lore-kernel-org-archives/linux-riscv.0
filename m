Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5953C7EE2C
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1lHpIU70P2aCGMY5gDQdYbIqp0RqezC2U4F66p1hd0=; b=WlAOLR2Jj9mJPUCbthUo5xHihW
	JnmQsOeBvMstMBqdjqcIJNZwc6cULJHEO6bt0Erzf4ysR08OIHjmLD89l2oSfBH0IdDgU1FFhzFRg
	69FGRpXpkf4tiXqXPBzNmfe+Bm+p+NAkg7umc/vCYYujTC4h0Tt6fuoViyA8xh51IYz8Ry6iVoFRV
	JbTb/rd9b7cGaDC0qEwm2jYtXcF3KGsVdZHVqN+Y6NFeJl/qSrTO0zcz0/91bamjwMXpN8FqhpfGy
	i7dg5T1aHdB52oO405hZM2mAR4U1zNYQMO9ebzGHGxlpscNF4U/IsJgHi7d4FAidljV1glj5xQzqN
	oYfOMwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6D1k-00G7Vd-2s;
	Mon, 05 Jun 2023 16:25:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6D1i-00G7V3-1h;
	Mon, 05 Jun 2023 16:25:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 147326142F;
	Mon,  5 Jun 2023 16:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DDEEC433D2;
	Mon,  5 Jun 2023 16:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685982349;
	bh=16FiVOWMTXNNpQp0H7L/tdt9yi6fRhkrrSyFhfGxu8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVdcyakeTxduLWkU3GRmvU3VQsPXzt9BcEoreWHTYpQmzw45TQKNhdNKFe5Py/UT7
	 Xz7JEwTTyY8K6K8xtA0H62giQecLHdZhxkZqh/MCFE+o6wNSSRiVdoyKYln64o6NrB
	 koAYRK0pdqIzkLi3BidxTrCxvYeAMXeUIT8QvqLQ8JosySORyw0SGmQ7119njw3U5G
	 K6h09nBBKexTaXtcmxcrwkOXhYGR4OvJV5SmOeZCrCFAmy8ESUtOR3KlUvO/RgDYmS
	 xpPhp/WO77Aewvd6N/LWCbT8XTYLxA14UbOWGtrE1YfCtlId0RvTRYKwDeZA97XJj0
	 9wtbijcvo1qcQ==
Date: Mon, 5 Jun 2023 17:25:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
Message-ID: <20230605-lustily-applaud-59a06b1faa0f@spud>
References: <20230605110724.21391-1-andy.chiu@sifive.com>
 <20230605110724.21391-24-andy.chiu@sifive.com>
 <20230605154832.GA3049210@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20230605154832.GA3049210@dev-arch.thelio-3990X>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092550_608122_B0622A12 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============9008940028074275439=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9008940028074275439==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ewc9C06HFFJn/n/2"
Content-Disposition: inline


--ewc9C06HFFJn/n/2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 05, 2023 at 08:48:32AM -0700, Nathan Chancellor wrote:

> Just an FYI, this change has landed in LLVM main, so it should be in
> LLVM 17 in a few months:

Great! :)

--ewc9C06HFFJn/n/2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZH4MiAAKCRB4tDGHoIJi
0nZpAQCU4elzyp5+2Mb9o2H1xwDwXFZady15wNVtR+PBUCz/BwEA2uuxzOKonmHu
CPbNZHdop20Ib6yH5Zz1Y8oml0ADYgk=
=GRBI
-----END PGP SIGNATURE-----

--ewc9C06HFFJn/n/2--


--===============9008940028074275439==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9008940028074275439==--

