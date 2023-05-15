Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC21C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFE782eAlals/kRtsS6lzmRnsDZPWMmSwLohHnYdU5E=; b=B5LIwZWC+uhItOOxc9BhICsVRk
	hmLwmUV36+GI0rv2XIXBExRWYVqkTcDvghiJF/WyAWXANDs4QqDpQJEpiphfn3y1MuLIQ4UxakC3N
	TOaJUAFaO53kZqcONwo+a650K4Bt7uJvRB94vjrvW+c6OILOd2xLVw/2/h9inLHjbPte0juBAzF5l
	1exoFsrsHk7q7bWcIhgngrDyAcZiuZMs5fpylK+5eEg+nIwXBPzKA6qssHk4u3npyLfqHBgoZzHG/
	f/kAejoPZD9PUL2iFMCebQIjEmMfGlob6UBYX06493W/FxcDGGYdYK6VCfrGUNP08lofRyckmfnli
	Hyg1zzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pycEu-002zLZ-0n;
	Mon, 15 May 2023 17:44:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pycEq-002zKX-3A
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 17:44:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8E12462E95;
	Mon, 15 May 2023 17:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E2FC433EF;
	Mon, 15 May 2023 17:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684172640;
	bh=InLf1Tw5b2pCZIBk6BFn6OWKVf3tBsDAE0r1X+/jVuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KU27NtmcyFyg666SNMSpu3ZNzj9Ud6cj2E3hEkDRUkAagU0oF6YGS/JSW2ryK3kph
	 1t+KR+O1oDzm7qXJSsoNaidnk+qQky0Rl8MYlIpYJmLAQeU5S+h23xYnxX6N26nByz
	 Z5c2EBTqSPLF/43UcRxAvj7fBUYkjkskDi4X0j9VK7ymWdQU8EHxEUPbyOTKIFWZM1
	 r4LyEN0XWK9L9OVf0fCUXeQukS8mWp446PAZBP86ntArriSp2cA7knFeMsM96uue0p
	 VLzztvU4eWsNwISvij2mh2BdYTxq4HJDgjtSSYxTPY6GdCqMyVqRyHO0ASHpg0P2Al
	 pao8fxw8NaNfw==
Date: Mon, 15 May 2023 18:43:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ze Gao <zegao@tencent.com>,
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH 0/4] Make fpobe + rethook immune to recursion
Message-ID: <20230515-dominion-botch-e0b9291bcea3@spud>
References: <20230515031314.7836-1-zegao@tencent.com>
MIME-Version: 1.0
In-Reply-To: <20230515031314.7836-1-zegao@tencent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_104401_058212_D2E148AC 
X-CRM114-Status: GOOD (  13.74  )
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
Content-Type: multipart/mixed; boundary="===============4856468197293613112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4856468197293613112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dqLazd8WcdDsY/XF"
Content-Disposition: inline


--dqLazd8WcdDsY/XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 11:13:09AM +0800, Ze Gao wrote:
> Current fprobe and rethook has some pitfalls and may introduce kernel sta=
ck recusion, especially in
> massive tracing scenario.
>=20
> For example, if (DEBUG_PREEMPT | TRACE_PREEMPT_TOGGLE) , preempt_count_{a=
dd, sub} can be traced via
> ftrace, if we happens to use fprobe + rethook based on ftrace to hook on =
those functions,=20
> recursion is introduced in functions like rethook_trampoline_handler and =
leads to kernel crash
> because of stack overflow.

This patch series is a bit confusing. The RISC-V list got 2 cover letters
and 2 patch 4s, but not any of the rest of the series. Please at least
send the whole series to the list so our patchwork automation can be run
against it. And mark it as v2 while you are at it.

Thanks,
Conor.

--dqLazd8WcdDsY/XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGJvWwAKCRB4tDGHoIJi
0j9VAQCg19aD+YHZwreeVgv/iHphWBuLDk8i96FhqjjGX2NOiwEA6/jsuqh1ILFe
CqUFzOZWPPeZCLFUHSr939+zcR5isgs=
=bf8c
-----END PGP SIGNATURE-----

--dqLazd8WcdDsY/XF--


--===============4856468197293613112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4856468197293613112==--

